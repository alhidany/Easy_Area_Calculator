import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labletext;
  final IconData? iconData;
  final TextEditingController mycontroller;
  final bool isNumber;
  final bool? obScurText;
  final String? Function(String?)? valid;
  final void Function()? onTapIcon;

  const CustomTextFormAuth({
    Key? key,
    this.onTapIcon,
    this.obScurText,
    required this.hinttext,
    required this.labletext,
    this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        obscureText: obScurText == null || obScurText == true ? false : true,
        keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
            hintText: hinttext,
            helperStyle: TextStyle(fontSize: 14),
            label: Container(padding: EdgeInsets.symmetric(horizontal: 9), child: Text(labletext)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30)),
      ),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  final String hinttext;
  final String labletext;
  final IconData? iconData;
  final TextEditingController mycontroller;
  final bool isNumber;
  final bool? obScurText;
  final String? Function(String?)? valid;
  final void Function()? onTapIcon;

  const CustomTextForm({
    Key? key,
    this.onTapIcon,
    this.obScurText,
    required this.hinttext,
    required this.labletext,
    this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        obscureText: obScurText == null || obScurText == true ? false : true,
        keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
            hintText: hinttext,
            helperStyle: TextStyle(fontSize: 14),
            label: Container(padding: EdgeInsets.symmetric(horizontal: 9), child: Text(labletext)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30)),
      ),
    );
  }
}
