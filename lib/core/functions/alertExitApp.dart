import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/colors.dart';
import 'package:untitled/view/widget/auth/customButtonAuth.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "alert".tr,
      titleStyle: const TextStyle(
          color: AppColor.grey, fontSize: 22, fontWeight: FontWeight.bold),
      middleText: "exitFromApp".tr,
      actions: [

        CustomButtonAlert(
            color: AppColor.red,
            onPressed: () {
              exit(0);
            },
            text: "confirm".tr),
        CustomButtonAlert(
            color: AppColor.success,
            onPressed: () {
              Get.back();
            },
            text: "cancel".tr),
      ]);
  return Future.value(true);
}
