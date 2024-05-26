import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/bottomNavigationController.dart';
import 'package:news_app/controllers/homePageController.dart';
import 'package:news_app/pages/homepage/homePage.dart';
import 'package:news_app/repository/authentication_respository.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp = "";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(children: [
                Text(
                  'CO',
                  style: TextStyle(
                      fontSize: 92,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 5,
                      height: 1),
                ),
                Text(
                  'DE',
                  style: TextStyle(
                      fontSize: 92,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 5,
                      height: 1),
                ),
              ]),
              const Column(
                children: [
                  Text('Verification',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900))
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const Column(
                children: [
                  Text('Enter the verification code sent on your phone number',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.grey.shade300,
                filled: true,
                onSubmit: (code) async {
                  otp = code;
                  var result =
                      await AuthenticationRepository.instance.verifyOtp(code);
                  result ? Get.offAll(const HomePageController()) : Get.back();
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      var result = await AuthenticationRepository.instance
                          .verifyOtp(otp);
                      result ? Get.offAll(const HomePageController()) : Get.back();
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red.withOpacity(0.9)),
                      child: Center(
                        child: Text(
                          'Verify Otp',
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
