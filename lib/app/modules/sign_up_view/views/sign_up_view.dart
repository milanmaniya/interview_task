import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:interview_task/app/core/model/create_global_user_model.dart';
import 'package:interview_task/app/core/utils/shared_preference.dart';
import 'package:interview_task/app/modules/sign_up_view/controller/sign_up_controller.dart';
import 'package:interview_task/app/modules/sign_up_view/widget/gender_field.dart';
import 'package:interview_task/app/modules/sign_up_view/widget/single_select_drop_down.dart';
import 'package:interview_task/app/modules/sign_up_view/widget/text_form_field.dart';
import 'package:interview_task/app/core/values/app_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.email});

  final String email;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final controller = Get.put(SignUpController());

  @override
  void initState() {
    controller.txtEmail.text = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Form(
        key: controller.globalKey,
        child: ListView(
          padding: const EdgeInsetsDirectional.all(20),
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              'Please enter your credentials to proceed',
              style: TextStyle(
                color: Color(0XFF3A4750),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            CommonTextFormField(
              hintText: 'Please enter your name',
              title: 'Full Name',
              validator: MultiValidator([
                RequiredValidator(errorText: 'Please fill the full name')
              ]).call,
              controller: controller.txtFullName,
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            CommonTextFormField(
              maxLength: 10,
              hintText: 'Please enter your phone number',
              title: 'Phone',
              controller: controller.txtPhone,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }

                final RegExp phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');

                if (!phoneRegExp.hasMatch(value)) {
                  return 'Enter a valid phone number';
                }

                return null;
              },
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            CommonTextFormField(
              hintText: 'Please enter your email address',
              title: 'Email address',
              controller: controller.txtEmail,
              readOnly: true,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Please fill the email address')
              ]).call,
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            CommonTextFormField(
              obscureText: true,
              hintText: 'Please enter your password',
              title: 'Password',
              controller: controller.txtPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }

                final RegExp passwordRegExp = RegExp(
                    r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+={}|:;<>?,.\[\]\\/-]).+$');

                if (!passwordRegExp.hasMatch(value)) {
                  return 'Password must contain at least one uppercase letter, one number, and one special character';
                }
                return null;
              },
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            CommonTextFormField(
              hintText: 'Please enter your address',
              title: 'Address',
              controller: controller.txtAddress,
              validator: MultiValidator(
                [
                  RequiredValidator(errorText: 'Please fill the address'),
                ],
              ).call,
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            SingleSelectWithSearchDropDown(
              list: controller.countryList,
              controller: controller,
              title: 'Country',
              validator: MultiValidator([
                RequiredValidator(errorText: 'Please select your country')
              ]).call,
              onChanged: (value) {
                controller.selectedCountry = value!;
              },
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            SingleSelectWithSearchDropDown(
              list: controller.stateList,
              controller: controller,
              title: 'State',
              validator: MultiValidator([
                RequiredValidator(errorText: 'Please select your state')
              ]).call,
              onChanged: (value) {
                controller.selectedState = value!;
              },
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            SingleSelectWithSearchDropDown(
              list: controller.cityList,
              controller: controller,
              title: 'City',
              validator: MultiValidator(
                      [RequiredValidator(errorText: 'Please select your city')])
                  .call,
              onChanged: (value) {
                controller.selectedCity = value!;
              },
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            CommonTextFormField(
              hintText: 'Please enter your pincode',
              title: 'Postal Code',
              maxLength: 6,
              keyboardType: TextInputType.number,
              controller: controller.txtPincode,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Please fill the postal code ')
              ]).call,
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            CommonTextFormField(
              hintText: 'Please select your dob',
              title: 'My date of birth: ',
              controller: controller.txtDob,
              validator: MultiValidator(
                  [RequiredValidator(errorText: 'Please select dob')]).call,
              suffixIcon: InkWell(
                onTap: () async {
                  final date = await showDatePicker(
                    context: this.context,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2025),
                  );

                  controller.txtDob.text =
                      '${date!.day}/${date.month}/${date.year}';
                },
                child: const Icon(
                  Icons.calendar_month_rounded,
                  color: AppColors.mainColor,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            GenderField(controller: controller),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(screenWidth - 40, screenHeight * 0.055),
                backgroundColor: AppColors.buttonBgColor,
              ),
              onPressed: () async {
                if (controller.globalKey.currentState!.validate()) {
                  controller.createGlobalUser(
                    CreateGlobalUserModel(
                      name: controller.txtFullName.text,
                      email: controller.txtEmail.text,
                      phoneNumber: controller.txtPhone.text,
                      gender: controller.selectedGender.value == 0
                          ? 'Male'
                          : controller.selectedGender.value == 1
                              ? 'Female'
                              : 'Prefer not to say',
                      address: controller.txtAddress.text,
                      city: controller.selectedCity,
                      state: controller.selectedState,
                      dateOfBirth: controller.txtDob.text,
                    ),
                  );

                  await SharedPreferenceService()
                      .setEmail(controller.txtEmail.text);
                }
              },
              child: const Text(
                'CREATE ACCOUNT',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
