import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:interview_task/app/core/values/text_style.dart';
import 'package:interview_task/app/modules/sign_up_view/controller/sign_up_controller.dart';
import 'package:interview_task/app/modules/sign_up_view/widget/radio_button.dart';

class GenderField extends StatelessWidget {
  // Controller for handling gender selection
  final SignUpController controller;

  // Constructor for GenderField widget
  const GenderField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display the label for the gender field
        const Text('Gender ', style: textFieldTitle),
        // Row containing radio buttons for gender options
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Radio button for Male option
            RadioButton(text: 'Male', value: 0, controller: controller),
            // Radio button for Female option
            RadioButton(text: 'Female', value: 1, controller: controller),
            // Radio button for Others option
            RadioButton(text: 'Prefer', value: 2, controller: controller),
          ],
        ),
      ],
    );
  }
}
