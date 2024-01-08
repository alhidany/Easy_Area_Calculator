

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/colors.dart';

class CusomTextSigninorSignup extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function()? onTap;
  const CusomTextSigninorSignup({
    Key? key, required this.textone, this.onTap, required this.texttwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(texttwo.tr),
        InkWell(
            onTap:onTap,
            child: Text(
              textone.tr,
              style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
