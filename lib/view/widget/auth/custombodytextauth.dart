

import 'package:flutter/material.dart';

class CustomBodyTextAuth extends StatelessWidget {
  final String text;
  const CustomBodyTextAuth({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(text,
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
        ));
  }
}

