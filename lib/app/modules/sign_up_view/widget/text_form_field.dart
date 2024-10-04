import 'package:flutter/material.dart';
import 'package:interview_task/app/core/values/app_color.dart';
import 'package:interview_task/app/core/values/text_style.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField(
      {super.key,
      required this.hintText,
      required this.title,
      required this.controller,
      required this.validator,
      this.keyboardType,
      this.suffixIcon,
      this.readOnly = false,
      this.maxLength,
      this.obscureText = false});

  final String title;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool readOnly;
  final int? maxLength;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textFieldTitle,
        ),
        SizedBox(
          height: screenHeight * 0.012,
        ),
        TextFormField(
          obscureText: obscureText,
          maxLength: maxLength,
          keyboardType: keyboardType,
          validator: validator,
          readOnly: readOnly,
          controller: controller,
          cursorColor: AppColors.sevenHundredColor,
          style: textFieldStyle,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: hintTextStyle,
            labelStyle: const TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              borderSide: BorderSide(color: AppColors.mainColor, width: 2.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
          ),
        ),
      ],
    );
  }
}
