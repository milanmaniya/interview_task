import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/app/core/values/app_color.dart';
import 'package:interview_task/app/core/values/text_style.dart';
import 'package:interview_task/app/modules/sign_up_view/controller/sign_up_controller.dart';

class SingleSelectWithSearchDropDown extends StatelessWidget {
  const SingleSelectWithSearchDropDown({
    super.key,
    required this.controller,
    required this.title,
    required this.onChanged,
    required this.list,
    required this.validator,
  });

  final String title;
  final List<String> list;
  final Function(String?)? onChanged;
  final SignUpController controller;
  final String? Function(String?) validator;

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
        CustomDropdown.search(
          validator: validator,
          closeDropDownOnClearFilterSearch: true,
          decoration: const CustomDropdownDecoration(
            listItemStyle: textFieldStyle,
            expandedBorderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            closedBorderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            expandedSuffixIcon: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: AppColors.mainColor,
            ),
            closedSuffixIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.mainColor,
            ),
            closedBorder: Border.symmetric(
              horizontal: BorderSide(
                color: Colors.grey,
              ),
              vertical: BorderSide(
                color: Colors.grey,
              ),
            ),
            hintStyle: hintTextStyle,
          ),
          hintText: 'Select your $title',
          items: list,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
