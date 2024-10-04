import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/app/core/values/text_style.dart';
import 'package:interview_task/app/modules/sign_up_view/controller/sign_up_controller.dart';

class RadioButton extends StatelessWidget {
  // The text to display next to the radio button
  final String text;
  // The controller managing the radio button state
  final SignUpController controller;
  // Callback function to save the input value
  final FormFieldSetter<String>? onSaved;
  // Validator function to validate the input value
  final FormFieldValidator<String>? validator;

  final int value;

  // Constructor for RadioButton widget
  const RadioButton({
    super.key,
    required this.text,
    required this.controller,
    this.onSaved,
    this.validator,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Display the text of the radio button option
        Text(text, style: radioButtonText),
        // Obx widget to update the UI when the selected gender changes
        Obx(
          () => Radio(
            // Set the group value to the selected gender value from the controller
            groupValue: controller.selectedGender.value,
            // Set the value of the radio button to the text
            value: value,
            // Define the onChanged callback to update the selected gender value
            onChanged: (value) => controller.selectedGender.value = value!,
            // Define the active color of the radio button
            activeColor: const Color.fromRGBO(33, 158, 188, 1),
          ),
        ),
      ],
    );
  }
}
