

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/onBoardingController.dart';
import 'package:untitled/core/constant/colors.dart';
import 'package:untitled/view/widget/onBoardingWidget/customButton.dart';
import 'package:untitled/view/widget/onBoardingWidget/customSlider.dart';
import 'package:untitled/view/widget/onBoardingWidget/customDotOnBoarding.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    CustomDotOnBoardingWidget(),
                    Spacer(
                      flex: 2,
                    ),
                    cusomButtonOnboarding(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
