import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onePageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  MyServices myServices = Get.find();
  int currentPage = 0;
  late PageController pageController;
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("onBoarding", "1");
      Get.offAllNamed(AppRout.home);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  @override
  onePageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
