import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/apptheme.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  Locale? language;
   String? cruntalng;
  MyServices myServices = Get.find();
  ThemeData appTheme = englishTheme;

  GlobalKey<FormState> areaNewUnit = GlobalKey<FormState>();

  late TextEditingController areaUnitOneText;
  late TextEditingController areaUnitOneValue;

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    // print(myServices.sharedPreferences.get('lang'));
  }

  @override
  addUnitToShare() async {
    var formDate = areaNewUnit.currentState;
    if (formDate!.validate()) {
      myServices.sharedPreferences.setString("unitOneText", areaUnitOneText.text);
      myServices.sharedPreferences.setString("unitOneValue", areaUnitOneValue.text);
      print("valid");
      print(myServices.sharedPreferences.getString("unitOneText"));
      print(myServices.sharedPreferences.getString("unitOneValue"));
    } else {
      print("Not valid");
    }
  }

  @override
  void onInit() {
    areaUnitOneText=TextEditingController();
    areaUnitOneValue=TextEditingController();
    if(myServices.sharedPreferences.getString("unitOneValue")==null){
      areaUnitOneText.text="";
      areaUnitOneValue.text="";
    }else{
      areaUnitOneText.text=myServices.sharedPreferences.getString("unitOneText").toString();
      areaUnitOneValue.text=myServices.sharedPreferences.getString("unitOneValue").toString();
    }


    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      cruntalng="ar";
      appTheme = arabicTheme;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = englishTheme;
      cruntalng="en";
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
