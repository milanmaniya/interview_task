import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/app/core/values/app_color.dart';
import 'package:interview_task/app/modules/splash_view/controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            height: double.infinity,
            width: double.infinity,
            'asset/images/splash_screen_bg.png',
            fit: BoxFit.fill,
          ),
          controller.isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.buttonBgColor,
                    fixedSize: Size(screenWidth - 60, 50),
                  ),
                  onPressed: () async {
                    await controller.googleSignIn();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('asset/images/google_icon.png'),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      const Text(
                        'Sign In With Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
