import 'package:flutter/material.dart';
import 'package:untitled/core/constant/colors.dart';

class CustomButtonLang extends StatelessWidget {
  final String buttontext;
  final void Function()? onPressed;
  const CustomButtonLang({
    Key? key,
    required this.buttontext,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColor.primaryColor,
      onPressed: onPressed,
      child: SizedBox(
          width: 200,
          child: Center(
              child: Text(
            buttontext,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ))),
    );
  }
}
