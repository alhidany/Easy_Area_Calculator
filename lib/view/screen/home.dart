import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/home_controller.dart';
import 'package:untitled/core/constant/colors.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/functions/alertExitApp.dart';
import 'package:untitled/core/functions/validInput.dart';
import 'package:untitled/core/localization/changeLocal.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/view/widget/auth/customButtonAuth.dart';
import 'package:untitled/view/widget/auth/customTextFromAuth.dart';
import 'package:untitled/view/widget/auth/customTextTitleAuth.dart';
import 'package:untitled/view/widget/auth/logoAuth.dart';
import 'package:untitled/core/constant/imageAssets.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    Get.lazyPut(() => HomeControllerImp());
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColor.backgroundColor,
        child: GetBuilder<LocaleController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: Get.height / 10,
                    width: Get.width / 10,
                    child: Image.asset(appImageAsset.logo, fit: BoxFit.contain),
                  ),
                  CustomTextTitle(text: "setting".tr),
                  const Divider(
                    color: AppColor.grey,
                    height: 20,
                    thickness: 1,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "chooseLanguage".tr,
                    style: const TextStyle(fontSize: 20, color: AppColor.black, fontWeight: FontWeight.bold),
                  ),
                  // CustomTextTitle(text: "chooseLanguage".tr),
                  Row(
                    children: [
                      Radio(
                          value: "en",
                          groupValue: controller.cruntalng,
                          onChanged: (value) {
                            controller.changeLang("en");
                            controller.cruntalng = "en";
                          }),
                      Text(
                        "english".tr,
                        style: const TextStyle(fontSize: 18, color: AppColor.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "ar",
                          groupValue: controller.cruntalng,
                          onChanged: (value) {
                            controller.changeLang("ar");
                            controller.cruntalng = "ar";
                          }),
                      // Text("arabic".tr, style: Theme.of(context).textTheme.headline1),
                      Text(
                        "arabic".tr,
                        style: const TextStyle(fontSize: 18, color: AppColor.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const Divider(
                    color: AppColor.grey,
                    height: 20,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Center(
                            child: Text(
                              "unit".tr,
                              style: const TextStyle(fontSize: 18, color: AppColor.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Center(
                            heightFactor: 1,
                            child: Text(
                              "=${"squareMeter".tr}",
                              style: const TextStyle(fontSize: 18, color: AppColor.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: controller.areaNewUnit,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextForm(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 1, 100, "");
                            },
                            hinttext: "unite".tr,
                            labletext: "unite".tr,
                            mycontroller: controller.areaUnitOneText,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: CustomTextForm(
                            isNumber: true,
                            valid: (val) {
                              return validInput(val!, 1, 100, "");
                            },
                            hinttext: "value".tr,
                            // iconData: Icons.layers_outlined,
                            labletext: "value".tr,
                            mycontroller: controller.areaUnitOneValue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButtonAlert(
                    color: AppColor.grey,
                    onPressed: () {
                      controller.addUnitToShare();
                    },
                    text: "save".tr,
                  ),
                  const Divider(
                    color: AppColor.grey,
                    height: 20,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: Get.height / 5,
                    width: Get.width / 5,
                    child: Image.asset(appImageAsset.personalLogo, fit: BoxFit.contain),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundColor: AppColor.grey,
                            child: IconButton(
                                onPressed: () {
                                  url_launcher.launch("tel://+967 771969804");
                                },
                                icon: const Icon(Icons.call_rounded))),
                        CircleAvatar(
                            backgroundColor: AppColor.grey,
                            child: IconButton(
                                onPressed: () {
                                  url_launcher.launch("sms://+967 771969804");
                                },
                                icon: const Icon(Icons.message_rounded))),
                        CircleAvatar(
                            backgroundColor: AppColor.grey,
                            child: IconButton(
                                onPressed: () {
                                  url_launcher.launch("mailto:abdullahalhidany@gmail.com");
                                },
                                icon: const Icon(Icons.email_rounded))),
                        CircleAvatar(
                            backgroundColor: AppColor.grey,
                            child: IconButton(
                                onPressed: () {
                                  url_launcher.launch("whatsapp://send?phone=+967 771969804");
                                },
                                icon: const Icon(Icons.whatsapp_rounded))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: AppColor.primaryColor, // Change Custom Drawer Icon Color
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Get.toNamed(AppRout.onBoarding);
                },
                icon: const Icon(
                  Icons.info_outline_rounded,
                  color: AppColor.primaryColor,
                ))
          ],
          centerTitle: true,
          title: Text(
            "homedis".tr,
            style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey),
          ),
          elevation: 0.0,
          backgroundColor: AppColor.backgroundColor),
      body: GetBuilder<HomeControllerImp>(builder: (controller) {
        return WillPopScope(
            onWillPop: alertExitApp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * (0.40),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: "alert".tr,
                                      titleStyle:
                                          const TextStyle(color: AppColor.grey, fontSize: 22, fontWeight: FontWeight.bold),
                                      middleText: "deleteAllData".tr,
                                      actions: [
                                        CustomButtonAlert(
                                            color: AppColor.red,
                                            onPressed: () {
                                              controller.deleteData();
                                              Get.back();
                                            },
                                            text: "confirm".tr),
                                        CustomButtonAlert(
                                            color: AppColor.success,
                                            onPressed: () {
                                              Get.back();
                                            },
                                            text: "cancel".tr),
                                      ]);
                                },
                                icon: const Icon(Icons.delete_outline, size: 40),
                                color: AppColor.red),
                            IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: "totalArea".tr,
                                      titleStyle:
                                          const TextStyle(color: AppColor.grey, fontSize: 22, fontWeight: FontWeight.bold),
                                      content: SizedBox(
                                        width: MediaQuery.of(context).size.width * (0.90),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(
                                                " = ${controller.areasTotal.toStringAsFixed(3).toString()}   ${"squareMeter".tr}",
                                                style: const TextStyle(fontSize: 18, color: AppColor.black)),
                                            Text(
                                                " = ${(controller.areasTotal / 10000).toStringAsFixed(3).toString()}   ${"hectare".tr}",
                                                style: const TextStyle(fontSize: 18, color: AppColor.black)),
                                            Text(
                                                " = ${(controller.areasTotal / 4200).toStringAsFixed(3).toString()}   ${"faddan".tr}",
                                                style: const TextStyle(fontSize: 18, color: AppColor.black)),
                                            Text(
                                                " = ${(controller.areasTotal / 29.16).toStringAsFixed(3).toString()}   ${"Qasabah".tr}",
                                                style: const TextStyle(fontSize: 18, color: AppColor.black)),
                                            Text(
                                                " = ${(controller.areasTotal / 20.25).toStringAsFixed(3).toString()}   ${"QasabaO".tr}",
                                                style: const TextStyle(fontSize: 18, color: AppColor.black)),
                                            if (myServices.sharedPreferences.getString("unitOneValue") != null)
                                              Text(
                                                  " = ${(controller.areasTotal / num.parse(myServices.sharedPreferences.getString("unitOneValue").toString())).toStringAsFixed(3).toString()}   ${myServices.sharedPreferences.getString("unitOneText")}",
                                                  style: const TextStyle(fontSize: 18, color: AppColor.black))
                                            else
                                              const Text("   "),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("changeUnit".tr),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      // custom: Container(
                                      //   width: 50,
                                      //   height: 50,
                                      //   child: Text("data"),
                                      // ),

                                      actions: [
                                        CustomButtonAlert(
                                            color: AppColor.primaryColor,
                                            onPressed: () {
                                              Get.back();
                                            },
                                            text: "ok".tr)
                                      ]);
                                },
                                icon: const Icon(Icons.notes, size: 40),
                                color: AppColor.primaryColor),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: AppColor.primaryColor, borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                    title: "totalArea".tr,
                                    titleStyle: const TextStyle(color: AppColor.grey, fontSize: 22, fontWeight: FontWeight.bold),
                                    content: SizedBox(
                                      width: MediaQuery.of(context).size.width * (0.90),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(" = ${controller.areasTotal.toStringAsFixed(3).toString()}   ${"squareMeter".tr}",
                                              style: const TextStyle(fontSize: 18, color: AppColor.black)),
                                          Text(
                                              " = ${(controller.areasTotal / 10000).toStringAsFixed(3).toString()}   ${"hectare".tr}",
                                              style: const TextStyle(fontSize: 18, color: AppColor.black)),
                                          Text(
                                              " = ${(controller.areasTotal / 4200).toStringAsFixed(3).toString()}   ${"faddan".tr}",
                                              style: const TextStyle(fontSize: 18, color: AppColor.black)),
                                          Text(
                                              " = ${(controller.areasTotal / 29.16).toStringAsFixed(3).toString()}   ${"Qasabah".tr}",
                                              style: const TextStyle(fontSize: 18, color: AppColor.black)),
                                          Text(
                                              " = ${(controller.areasTotal / 20.25).toStringAsFixed(3).toString()}   ${"QasabaO".tr}",
                                              style: const TextStyle(fontSize: 18, color: AppColor.black)),
                                          if (myServices.sharedPreferences.getString("unitOneValue") != null)
                                            Text(
                                                " = ${(controller.areasTotal / num.parse(myServices.sharedPreferences.getString("unitOneValue").toString())).toStringAsFixed(3).toString()}   ${myServices.sharedPreferences.getString("unitOneText")}",
                                                style: const TextStyle(fontSize: 18, color: AppColor.black))
                                          else
                                            const Text("   "),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("changeUnit".tr),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    // custom: Container(
                                    //   width: 50,
                                    //   height: 50,
                                    //   child: Text("data"),
                                    // ),

                                    actions: [
                                      CustomButtonAlert(
                                          color: AppColor.primaryColor,
                                          onPressed: () {
                                            Get.back();
                                          },
                                          text: "ok".tr)
                                    ]);
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "total".tr,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColor.grey),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Obx(() => CustomTextTitle(text: controller.areasTotal.toStringAsFixed(3).toString())),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(() => SingleChildScrollView(
                            child: SizedBox(
                              // height: MediaQuery.of(context).size.height * (0.70),
                              width: MediaQuery.of(context).size.width * (0.40),
                              child: ListView.builder(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                reverse: true,
                                itemCount: controller.areas.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: InkWell(
                                      onTap: () {
                                        controller.aUpdate.text = (controller.areas[index]["a"].toString());
                                        controller.bUpdate.text = (controller.areas[index]["b"].toString());
                                        controller.cUpdate.text = (controller.areas[index]["c"].toString());
                                        controller.IDUpdate.text = (controller.areas[index]["id"]).toString();
                                        controller.stateUpdate.text = (controller.areas[index]["state"]).toString();

                                        Get.defaultDialog(
                                            title: "${"area".tr} : ${(controller.areas[index]["total"]).toStringAsFixed(3)}",
                                            titleStyle:
                                                const TextStyle(color: AppColor.grey, fontSize: 22, fontWeight: FontWeight.bold),
                                            content: Container(
                                              width: MediaQuery.of(context).size.width * (0.90),
                                              height: 230,
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                                              child: Form(
                                                key: controller.formStateupdate,
                                                child: ListView(
                                                  // shrinkWrap: true,
                                                  children: [
                                                    CustomTextFormAuth(
                                                      isNumber: true,
                                                      valid: (val) {
                                                        return validInput(val!, 1, 100, "");
                                                      },
                                                      hinttext: "a".tr,
                                                      iconData: Icons.layers_outlined,
                                                      labletext: "a".tr,
                                                      mycontroller: controller.aUpdate,
                                                    ),
                                                    CustomTextFormAuth(
                                                      isNumber: true,
                                                      valid: (val) {
                                                        return validInput(val!, 1, 100, "");
                                                      },
                                                      hinttext: "b".tr,
                                                      iconData: Icons.layers_outlined,
                                                      labletext: "b".tr,
                                                      mycontroller: controller.bUpdate,
                                                    ),
                                                    CustomTextFormAuth(
                                                      isNumber: true,
                                                      valid: (val) {
                                                        return validInput(val!, 1, 100, "");
                                                      },
                                                      hinttext: "c".tr,
                                                      iconData: Icons.layers_outlined,
                                                      labletext: "c".tr,
                                                      mycontroller: controller.cUpdate,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Obx(
                                                          () => Text(controller.alert.value,
                                                              style: const TextStyle(color: AppColor.red, fontSize: 12)),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              if (controller.stateUpdate.text == 1.toString()) {
                                                                controller.stateUpdate.text = 2.toString();
                                                                controller.updateArea();
                                                                if (controller.alert.value == "") {
                                                                  Get.back();
                                                                }
                                                              } else {
                                                                controller.stateUpdate.text = 1.toString();
                                                                controller.updateArea();
                                                                if (controller.alert.value == "") {
                                                                  Get.back();
                                                                }
                                                              }
                                                            },
                                                            icon: controller.stateUpdate.text == 1.toString()
                                                                ? const Icon(
                                                                    Icons.star_border_rounded,
                                                                    color: AppColor.primaryColor,
                                                                  )
                                                                : const Icon(
                                                                    Icons.star,
                                                                    color: AppColor.red,
                                                                  )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              CustomButtonAlert(
                                                color: AppColor.primaryColor,
                                                onPressed: () {
                                                  controller.updateArea();
                                                  if (controller.alert.value == "") {
                                                    Get.back();
                                                  }
                                                },
                                                text: "update".tr,
                                              ),
                                              CustomButtonAlert(
                                                  color: AppColor.red,
                                                  onPressed: () {
                                                    controller.deleteOneRowData("area", controller.IDUpdate.text);

                                                    Get.back();

                                                    controller.alert.value = "";
                                                  },
                                                  text: "delete".tr),
                                              CustomButtonAlert(
                                                  color: AppColor.success,
                                                  onPressed: () {
                                                    Get.back();
                                                    controller.alert.value = "";
                                                  },
                                                  text: "cancel".tr),
                                            ]);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: (controller.areas[index]["state"]).toString() == 1.toString()
                                                ? AppColor.secondaryColor
                                                : AppColor.red,
                                            borderRadius: BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 7),
                                          child: Column(
                                            children: [
                                              CustomTextTitle(
                                                  text: double.parse((controller.areas[index]["total"]).toStringAsFixed(3))
                                                      .toString()),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  color: AppColor.backgroundColor,
                  width: MediaQuery.of(context).size.width * (0.60),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        CustomTextTitle(text: "meter".tr),
                        const LogoAuth(),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFormAuth(
                          isNumber: true,
                          valid: (val) {
                            return validInput(val!, 1, 100, "");
                          },
                          hinttext: "a".tr,
                          iconData: Icons.layers_outlined,
                          labletext: "a".tr,
                          mycontroller: controller.a,
                        ),
                        CustomTextFormAuth(
                          isNumber: true,
                          valid: (val) {
                            return validInput(val!, 1, 100, "");
                          },
                          hinttext: "b".tr,
                          iconData: Icons.layers_outlined,
                          labletext: "b".tr,
                          mycontroller: controller.b,
                        ),
                        CustomTextFormAuth(
                          isNumber: true,
                          valid: (val) {
                            return validInput(val!, 1, 100, "");
                          },
                          hinttext: "c".tr,
                          iconData: Icons.layers_outlined,
                          labletext: "c".tr,
                          mycontroller: controller.c,
                        ),
                        CustomButtonAuth(
                          text: "calc".tr,
                          onPressed: () {
                            controller.calculateArea();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
