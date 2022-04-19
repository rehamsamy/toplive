import 'package:flutter/material.dart';
import 'package:toplive/core/resourses/color_manger.dart';

class EditableTextField extends StatelessWidget {
  EditableTextField(
      {Key? key,
      required this.controller,
      this.suffixIcon = const Icon(Icons.edit),
      this.prfixIcon = const Icon(Icons.person),
      this.hintText = "example :",
      this.helperText = "",
      this.enabled = true})
      : super(key: key);
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prfixIcon;
  final String? hintText;
  final String helperText;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          enabled: enabled,
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorsManger.lightGrey,
            fontSize: 16,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prfixIcon,
          prefixText: helperText,
          counterText: helperText,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
