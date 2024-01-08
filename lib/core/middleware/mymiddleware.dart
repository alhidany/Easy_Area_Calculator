
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/services/services.dart';

class MyMiddleware extends GetMiddleware{

  MyServices myServices =Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("onBoarding")=="1"){
      return const RouteSettings(name: AppRout.home);
    }
  }


}