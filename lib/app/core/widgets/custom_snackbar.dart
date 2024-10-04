import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/app/core/values/app_color.dart';

SnackbarController successSnackBar(String status, String message) {
  return Get.snackbar(
    status,
    message,
    backgroundColor: AppColors.mainColor,
    colorText: AppColors.whiteColor,
    snackPosition: SnackPosition.BOTTOM,
  );
}

SnackbarController errorSnackBar(String status, String message) {
  return Get.snackbar(
    status,
    message,
    backgroundColor: Colors.red,
    colorText: AppColors.whiteColor,
    snackPosition: SnackPosition.BOTTOM,
  );
}
