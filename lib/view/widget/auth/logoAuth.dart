

import 'package:flutter/material.dart';
import 'package:untitled/core/constant/imageAssets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(appImageAsset.triangle,height: 150,);
  }
}