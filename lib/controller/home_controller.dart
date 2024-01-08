import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:untitled/data_base/db_helper.dart';
import 'package:untitled/view/widget/auth/customButtonAuth.dart';

abstract class HomeController extends GetxController {
  login();
  calculateArea();
  deleteData();
  fetchAreasTotal();
}

class HomeControllerImp extends HomeController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GlobalKey<FormState> formStateupdate = GlobalKey<FormState>();
  GlobalKey<FormState> areaNewUnit = GlobalKey<FormState>();

  late TextEditingController a;
  late TextEditingController b;
  late TextEditingController c;

  late TextEditingController aUpdate;
  late TextEditingController bUpdate;
  late TextEditingController cUpdate;
  late TextEditingController IDUpdate;
  late TextEditingController stateUpdate;
  late Color FavColor;


  late TextEditingController areaUnitOneText;
  late TextEditingController areaUnitOneValue;

  RxList areas = [].obs;
  RxString alert = "".obs;
  RxDouble areasTotal = 0.0.obs;
  bool isShowPass = false;

  @override
  calculateArea() async {
    var formDate = formState.currentState;

    if (formDate!.validate()) {
      if (isTriangle(double.parse(a.text), double.parse(b.text), double.parse(c.text))) {
        double totaFromCalc = triangleArea(double.parse(a.text), double.parse(b.text), double.parse(c.text));
        print("valid valid");
        DBHelper.dbHelper.insertData(
            tableName: "area",
            model: {"a": double.parse(a.text), "b": double.parse(b.text), "c": double.parse(c.text), "total": totaFromCalc,"state":1});
        a.clear();
        b.clear();
        c.clear();
        fetchAreasTotal();
        fetchAreas();
      } else {
        Get.defaultDialog(
            title: "alert".tr,
            titleStyle: const TextStyle(color: AppColor.black, fontSize: 22, fontWeight: FontWeight.bold),
            middleText: "notTriangle".tr,
            actions: [
              CustomButtonAlert(
                  color: AppColor.primaryColor,
                  onPressed: () {
                    Get.back();
                  },
                  text:"ok".tr
              ),
            ]);
      }
    } else {
      print("Not valid");
    }
  }

  @override
  updateArea() async {
    var formDate = formStateupdate.currentState;
    if (formDate!.validate()) {
      if (isTriangle(double.parse(aUpdate.text), double.parse(bUpdate.text), double.parse(cUpdate.text))) {
        double totaFromCalc = triangleArea(double.parse(aUpdate.text), double.parse(bUpdate.text), double.parse(cUpdate.text));
        print("valid valid");
        alert.value="";
        DBHelper.dbHelper.updateData(
            tableName: "area",
            model: {
              "a": double.parse(aUpdate.text),
              "b": double.parse(bUpdate.text),
              "c": double.parse(cUpdate.text),
              "state": int.parse(stateUpdate.text),
              "total": totaFromCalc
            },
            id: IDUpdate.text);
        aUpdate.clear();
        bUpdate.clear();
        cUpdate.clear();
        IDUpdate.clear();
        stateUpdate.clear();
        fetchAreasTotal();
        fetchAreas();
      } else {
        alert.value= "notTriangle".tr;
      }
    } else {
      print("Not valid");
    }
  }

  @override
  addUnitToShare() async {
    var formDate = areaNewUnit.currentState;
    if (formDate!.validate()) {
      print("valid");
       } else {
      print("Not valid");
    }
  }

  @override
  login() {
    var formDate = formState.currentState;
    if (formDate!.validate()) {
      print("valid valid");
    } else {
      print("Not valid");
    }
  }

  @override
  void onInit() {
    a = TextEditingController();
    b = TextEditingController();
    c = TextEditingController();
    aUpdate = TextEditingController();
    bUpdate = TextEditingController();
    cUpdate = TextEditingController();
    IDUpdate = TextEditingController();
    stateUpdate = TextEditingController();
    Color FavColor=AppColor.primaryColor;

    areaUnitOneText=TextEditingController();
    areaUnitOneValue=TextEditingController();


    areas.value = [];
    areasTotal.value = 0;
    fetchAreasTotal();
    fetchAreas();

    super.onInit();
  }

  fetchAreas() async {
    DBHelper.dbHelper.selectData(tableName: "area").then((areasList) => {
          areas.value = areasList,
        });
  }

  Future fetchAreasTotal() async {
    await DBHelper.dbHelper.selectTotal(tableName: "area").then((areasTotalList) => {
          if (areasTotalList[0]['total'] == null)
            {areasTotal.value = 0}
          else
            {
              areasTotal.value = areasTotalList[0]['total'],
            },
        });

    // print(areasTotal.value);
  }

  @override
  void dispose() {
    a.dispose();
    b.dispose();
    c.dispose();
    aUpdate.dispose();
    bUpdate.dispose();
    cUpdate.dispose();
    IDUpdate.dispose();
    stateUpdate.dispose();

    areaUnitOneText.dispose();
    areaUnitOneValue.dispose();
    // total.dispose();
    super.dispose();
  }

  double triangleArea(double a, double b, double c) {
    double s = (a + b + c) / 2;
    double area = sqrt(s * (s - a) * (s - b) * (s - c));
    return area;
  }

  double roundDoubleValue(double myDouble) {
    double roundedDouble = (double.parse((myDouble * 100).toStringAsFixed(2)) / 100.0).roundToDouble();
    return roundedDouble;
  }

  bool isTriangle(double a, double b, double c) {
    return a + b > c && b + c > a && a + c > b;
  }

  @override
  deleteData() {
    DBHelper.dbHelper.deletallRowFromAnyTable(tableName: "area");
    areasTotal.value = 0.0;
    areas.value = [];
  }

  @override
  deleteOneRowData(String tableName, String id) {
    DBHelper.dbHelper.deletOneRowFromAnyTable(tableName: tableName, id: id);
    fetchAreasTotal();
    fetchAreas();
  }
}
