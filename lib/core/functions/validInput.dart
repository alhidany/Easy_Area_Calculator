
import 'package:get/get.dart';
// import 'package:get/get_utils/src/get_utils/get_utils.dart';

validInput(String val,int min,int max,String type){

  if(type =="username"){
    if(!GetUtils.isUsername(val)){
      return "notValidUserName".tr;
    }
  }

  if(type =="email"){
    if(!GetUtils.isEmail(val)){
      return "notValidEmail".tr;
    }
  }
  if(type =="phone-number"){
    if(!GetUtils.isPhoneNumber(val)){
      return "notValidPhoneNumber".tr;
    }
  }
  if(val.isEmpty){
    return "cannotEmpty".tr;
  }

  if(val.length < min){
    return "cannotlessThan".tr+ '$min';
  }
  if(val.length > max){
    return "cannotMoreThan".tr+ '$max';
  }
}