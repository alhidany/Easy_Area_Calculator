import 'package:flutter/material.dart';
import 'package:untitled/core/constant/colors.dart';

ThemeData englishTheme = ThemeData(
    fontFamily: "PlayfairDisplay",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: AppColor.black, fontSize: 23, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: AppColor.black, fontSize: 26, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
          height: 2,
          fontSize: 14,
          color: AppColor.grey,
          fontWeight: FontWeight.bold),
      bodyText2: TextStyle(height: 2, fontSize: 14, color: AppColor.grey),
    ));

ThemeData arabicTheme = ThemeData(
    fontFamily: "Cairo",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: AppColor.black, fontSize: 23, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: AppColor.black, fontSize: 26, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
          height: 2,
          fontSize: 14,
          color: AppColor.grey,
          fontWeight: FontWeight.bold),
      bodyText2: TextStyle(height: 2, fontSize: 14, color: AppColor.grey),
    ));
