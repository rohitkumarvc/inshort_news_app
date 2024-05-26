import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/login_screen/login_screen.dart';
import 'package:news_app/repository/authentication_respository.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ring.png',
                height: 200,
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 42,
                        ),
                  ),
                  Text(
                    'Please enter your email below to reset the password',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                controller: _controller,
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

              const SizedBox(height: 32,),
              Column(
                    children: [
                      InkWell(
                        onTap: (){
                          AuthenticationRepository.instance.resetPassowrd(_controller.text.trim());
                          Get.offAll(const LoginScreen());
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red.withOpacity(0.9)),
                          child: Center(
                            child: Text(
                              'Reset Password',
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
            ],
          ),
        ),
      ),
    );
  }
}
