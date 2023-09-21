import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      this.onChange, required this.controller,});
  final String hintText;
  final Icon prefixIcon;
  final Function(String)? onChange;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'filed is required';
        } else {
          return null;
        }
      },
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
