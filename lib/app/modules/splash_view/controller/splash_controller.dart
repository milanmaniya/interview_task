import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interview_task/app/modules/sign_up_view/views/sign_up_view.dart';

class SplashController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;

  Future<void> googleSignIn() async {
    isLoading = true;

    try {
      await GoogleSignIn().signOut();

      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final data = await _auth.signInWithCredential(credential);

      Get.offAll(
        () => SignUpScreen(
          email: data.user!.email ?? '',
        ),
      );
    } catch (e) {
      isLoading = false;
      print(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
