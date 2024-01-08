import 'package:flutter/material.dart';
import 'package:untitled/core/constant/colors.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:const EdgeInsets.only(top: 5),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding:const EdgeInsets.symmetric(vertical: 13),
          onPressed: onPressed,
          color: AppColor.primaryColor,
          textColor: Colors.white,
          child: Text(text),
        ));
  }
}

class CustomButtonAlert extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;
  const CustomButtonAlert({
    Key? key,
    required this.text,
    this.onPressed, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //margin:const EdgeInsets.only(top: 5),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding:const EdgeInsets.symmetric(vertical: 5),
          onPressed: onPressed,
          color: color,
          textColor:Colors.white ,
          child: Text(text),
        ));
  }
}