import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/login_controller.dart';
import 'package:news_app/pages/login_screen/forget_password_screen.dart';
import 'package:news_app/pages/login_screen/sign_up_screen.dart';
import 'package:news_app/repository/authentication_respository.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
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
                          'Welcome Back,',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text('Make it work, make it right, make it fast',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 18))
                      ])
                ],
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                  Column(
                    children: [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(
                            ForgetPasswordScreen(),
                          );
                        },
                        child: Text('Forgot Password?',
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          AuthenticationRepository.instance
                              .loginWithEmailAndPassword(
                            controller.email.text.trim(),
                            controller.password.text.trim(),
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
                              'Login',
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
                    height: 16,
                  ),
                  Column(
                    children: [
                      Text('or', style: Theme.of(context).textTheme.titleLarge)
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      AuthenticationRepository.instance.signInGoogle();
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png',
                                  height: 24),
                              SizedBox(
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
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have account? ',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      InkWell(
                        onTap: () {
                          Get.off(SignUpScreen());
                        },
                        child: Text('Sign-Up',
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
