import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/localization/translation.dart';
import 'package:untitled/routes.dart';
import 'core/localization/changeLocal.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      getPages: routes,
    );
  }
}
