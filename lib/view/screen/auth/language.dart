import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/localization/changeLocal.dart';
import '../../widget/language/customButton.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("chooseLanguage".tr,
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(
              height: 30,
            ),
            CustomButtonLang(
                buttontext: "english".tr,
                onPressed: () {
                  controller.changeLang("en");
                  Get.toNamed(AppRout.onBoarding);
                }),
            CustomButtonLang(
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRout.onBoarding);
              },
              buttontext: "arabic".tr,
            ),
          ],
        ),
      ),
    );
  }
}
