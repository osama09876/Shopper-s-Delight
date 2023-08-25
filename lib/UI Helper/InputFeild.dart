import 'package:flutter/material.dart';

import 'Customcolor.dart';

// ignore: must_be_immutable
class CustomInputFeild extends StatelessWidget {
  final String label;
  final bool obscure;
  final FormFieldValidator validator;
  IconData? prefixicon;
  IconData? suffixIcon;
  Function? suffixFunc;
  final TextEditingController controller;
  final FocusNode focusnode;
  CustomInputFeild({
    super.key,
    required this.label,
    required this.obscure,
    required this.validator,
    this.prefixicon,
    this.suffixIcon,
    this.suffixFunc,
    required this.controller,
    required this.focusnode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      controller: controller,
      focusNode: focusnode,
      decoration: InputDecoration(
          label: Text('${label}'),
          prefixIcon: Icon(prefixicon),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: appcolor),
          ),
          prefixIconColor: appcolor,
          suffixIconColor: appcolor,
          suffixIcon: GestureDetector(
            onTap: () {
              suffixFunc!();
            },
            child: Icon(suffixIcon),
          )),
      validator: validator,
    );
  }
}
