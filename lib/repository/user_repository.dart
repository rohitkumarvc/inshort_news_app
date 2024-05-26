import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/Model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection('Users')
        .add(
          user.toJson(),
        )
        .whenComplete(
      () {
        Get.snackbar('Success', 'Account has been created successfully',
            snackPosition: SnackPosition.BOTTOM,
            
            );
      },
    ).onError(
      (error, stackTrace) {
        Get.snackbar('Error', error.toString(),
            snackPosition: SnackPosition.BOTTOM);
        print('Error: $error');
        throw Exception(error);
      },
    );
  }
}
