import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Model/user_model.dart';
import 'package:news_app/controllers/sign_up_controller.dart';
import 'package:news_app/pages/login_screen/login_screen.dart';
import 'package:news_app/pages/login_screen/otp_screen.dart';
import 'package:news_app/repository/authentication_respository.dart';
import 'package:news_app/repository/user_repository.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    UserRepository userController = Get.put(UserRepository());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 160,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get on Board!',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text('Create your profile to start your journey',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 18))
                      ])
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Column(
                    children: [
                      TextField(
                        controller: controller.name,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: controller.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: controller.phoneNumber,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.numbers),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Obx(
                        () => TextField(
                          controller: controller.password,
                          obscureText: !controller.showPassword.value,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.key),
                            suffixIcon: !controller.showPassword.value
                                ? InkWell(
                                    onTap: () {
                                      controller.showHidePassword();
                                    },
                                    child: const Icon(
                                      Icons.visibility,
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      controller.showHidePassword();
                                    },
                                    child: const Icon(
                                      Icons.visibility_off,
                                    ),
                                  ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.phoneAuthentication(
                            '+91${controller.phoneNumber.text.trim()}',
                          );
                          Get.to(const OtpScreen());

                          controller.registerUser(controller.email.text.trim(),
                              controller.password.text.trim());
                          userController.createUser(
                            UserModel(
                              id: null,
                              fullName: controller.name.text.trim(),
                              email: controller.email.text.trim(),
                              phoneNumber:
                                  '+91${controller.phoneNumber.text.trim()}',
                              password: controller.password.text.trim(),
                            ),
                          );
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red.withOpacity(0.9)),
                          child: Center(
                            child: Text(
                              'Register',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Text('or', style: Theme.of(context).textTheme.titleLarge)
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          AuthenticationRepository.instance.signInGoogle();
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png',
                                  height: 24),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Sign-In with Google',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              )
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have a account? ',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      InkWell(
                        onTap: () {
                          Get.off(const LoginScreen());
                        },
                        child: Text('LOGIN',
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
