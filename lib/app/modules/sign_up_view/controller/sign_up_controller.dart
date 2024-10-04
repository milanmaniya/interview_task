import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/app/core/model/create_global_user_model.dart';
import 'package:interview_task/app/core/widgets/custom_snackbar.dart';
import 'package:interview_task/app/modules/group_chat_view/views/group_chat_view.dart';
import 'package:interview_task/app/modules/sign_up_view/repository/signup_repository.dart';

class SignUpController extends GetxController {
  RxInt selectedGender = 0.obs;

  final SignUpRepository _repository = SignUpRepository();

  List<String> countryList = [
    'Argentina',
    'Australia',
    'Austria',
    'Belgium',
    'Brazil',
    'Canada',
    'China',
    'Denmark',
    'Finland',
    'France',
    'Germany',
    'India',
    'Ireland',
    'Israel',
    'Italy',
    'Japan',
    'Mexico',
    'Netherlands',
    'New Zealand',
    'Norway',
    'Portugal',
    'Russia',
    'Saudi Arabia',
    'Singapore',
    'South Africa',
    'South Korea',
    'Spain',
    'Sweden',
    'Switzerland',
    'United Kingdom',
    'United States'
  ];

  List<String> cityList = [
    'Agra',
    'Ahmedabad',
    'Bengaluru',
    'Bhopal',
    'Chennai',
    'Coimbatore',
    'Delhi',
    'Gandhinagar',
    'Hyderabad',
    'Indore',
    'Jaipur',
    'Kolkata',
    'Lucknow',
    'Mumbai',
    'Nagpur',
    'Patna',
    'Pune',
    'Surat',
    'Thane',
    'Vadodara',
    'Visakhapatnam'
  ];

  List<String> stateList = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];

  String selectedCountry = '';
  String selectedState = '';
  String selectedCity = '';

  TextEditingController txtFullName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtPincode = TextEditingController();
  TextEditingController txtDob = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    txtFullName.dispose();
    txtPhone.dispose();
    txtEmail.dispose();
    txtPassword.dispose();
    txtAddress.dispose();
    txtPincode.dispose();
    txtDob.dispose();
    super.dispose();
  }

  Future<void> createGlobalUser(
      CreateGlobalUserModel createGlobalUserModel) async {
    try {
      final response =
          await _repository.createGlobalUser(createGlobalUserModel);

      if (response['status'] == 'true') {
        successSnackBar('Success', response['message']);
        Get.offAll(() => const GroupChatView());
      } else {
        errorSnackBar('Error', response['message']);
      }
    } catch (e) {
      throw Exception('Failed to create global user');
    }
  }
}
