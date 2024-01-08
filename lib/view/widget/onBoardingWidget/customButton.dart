import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/onBoardingController.dart';
import 'package:untitled/core/constant/colors.dart';
class cusomButtonOnboarding extends GetView<OnBoardingControllerImp> {
  const cusomButtonOnboarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: MaterialButton(

          color: AppColor.primaryColor,
          onPressed: () {
            controller.next();
          },
          child:  Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 90, vertical: 2),
            child: Text(
              "continue".tr,
              style: const TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}