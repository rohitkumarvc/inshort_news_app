import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/homePageController.dart';
import 'package:news_app/pages/login_screen/welcome_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'recovery/sign_up_email_password_failures.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  var verificationCode = ''.obs;

  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(const WelcomeScreen())
        : Get.offAll(const HomePageController());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'Enter Phone Number is not valid');
          } else {
            Get.snackbar('Error', 'Unknown error occured');
          }
        },
        codeSent: (verificationId, resendToken) {
          verificationCode.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          verificationCode.value = verificationId;
        });
  }

  Future<bool> verifyOtp(String otp) async {
    var credentials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
          verificationId: verificationCode.value, smsCode: otp),
    );

    return credentials.user != null;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // firebaseUser.value == null
      //     ? Get.offAll(const WelcomeScreen())
      //     : Get.offAll(const HomePageController());
    } on FirebaseAuthException catch (e) {
      final ex = SignInWithEmailPasswordFailure.code(e.code);
      print('Firebase Exception ${ex.message}');
      throw ex.message;
    } catch (e) {
      const  ex = SignInWithEmailPasswordFailure();
      print('Exception ${ex.message}');
      throw ex.message;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value == null
          ? Get.offAll(const WelcomeScreen())
          : Get.offAll(const HomePageController());
    } on FirebaseAuthException catch (e) {
      final ex = SignInWithEmailPasswordFailure.code(e.code);
      print('Firebase Exception ${ex.message}');
      throw ex.message;
    } catch (e) {
      const ex = SignInWithEmailPasswordFailure();
      print('Exception ${ex.message}');
      throw ex.message;
    }
  }

  Future<void> logout() async => await _auth.signOut();

  Future<void> resetPassowrd(String email) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Message', 'Reset password link send on your email');
    } catch (e) {
      Get.snackbar('Message', e.toString());
    }
  }

  Future<UserCredential> signInGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credentials);
  }
}
