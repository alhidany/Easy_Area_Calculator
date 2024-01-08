import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/middleware/mymiddleware.dart';
import 'package:untitled/view/screen/auth/language.dart';
import 'package:untitled/view/screen/home.dart';
import 'package:untitled/view/screen/onBoarding.dart';


List<GetPage<dynamic>>? routes=[
  GetPage(name: "/", page: ()=>const Language(),middlewares: [
    MyMiddleware(),
  ]),
  GetPage(name: AppRout.home, page: ()=>const Home()),
   GetPage(name: AppRout.onBoarding, page: ()=>const OnBoarding()),
  // GetPage(name: AppRout.forgetPassword, page: ()=>const ForgetPassword()),
  // GetPage(name: AppRout.resetPassword, page: ()=>const ResetPassword()),
  // GetPage(name: AppRout.verifyCode, page: ()=>const VerfiyCode()),
  // GetPage(name: AppRout.successResetPassword, page: ()=>const SuccessResetPassword()),
  // GetPage(name: AppRout.successSignUp, page: ()=>const SuccessSignUp()),
  // GetPage(name: AppRout.verifyCodeSignUp, page: ()=>const VerfiyCodeSignUp()),
];
//
// Map<String, Widget Function(BuildContext)> routess={
// AppRout.login :(context)=>const Login(),
// AppRout.signUp :(context)=>const SignUp(),
// AppRout.onBoarding :(context)=>const onBoarding(),
// AppRout.forgetPassword :(context)=>const ForgetPassword(),
// AppRout.resetPassword :(context)=>const ResetPassword(),
// AppRout.verifyCode :(context)=>const VerfiyCode(),
// AppRout.successResetPassword :(context)=>const SuccessResetPassword(),
// AppRout.successSignUp :(context)=>const SuccessSignUp(),
// AppRout.verifyCodeSignUp :(context)=>const VerfiyCodeSignUp(),
// };