import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/onBoardingController.dart';
import 'package:untitled/core/constant/colors.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onePageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(onBoardingList[i].title!,
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 70,
                ),
                Image.asset(onBoardingList[i].image!,
                    width: Get.width / 1.8,
                    height: Get.height / 3.5,
                    fit: BoxFit.fill),
                const SizedBox(
                  height: 70,
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2,
                          fontSize: 14,
                          color: AppColor.grey,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ));
  }
}
