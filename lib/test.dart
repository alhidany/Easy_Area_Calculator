import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text")),
      body: ListView(
        children: [
          OtpTextField(
            fieldWidth: 50.0,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderColor:const Color(0xFF512DA8),
            showFieldAsBox: true,
            onCodeChanged: (String code) {
            },
            onSubmit: (String verificationCode) {}, // end onSubmit
          ),
        ],
      ),
    );
  }
}
