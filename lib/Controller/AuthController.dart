import 'package:e_book_okba_store/view/screen/home/bottom_navigation_bar.dart';
import 'package:e_book_okba_store/view/screen/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Config/Messages.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAuthorizedUser = false.obs; // Added this line

  final auth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
    // Check authorization status when the AuthController is initialized
    checkAuthorizationStatus();
  }

  void checkAuthorizationStatus() {
    // Check if the current user is authorized
    isAuthorizedUser.value =
        auth.currentUser?.email == "moh2617khaled@gmail.com";
  }

  void loginWithEmail() async {
    isLoading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
      successMessage('تسجيل الدخول');
      Get.offAll(BottomNavigationBar());
    } catch (ex) {
      print(ex);
      errorMessage("حدث خطأ، حاول مجددا!");
    }
    isLoading.value = false;
  }

  void signout() async {
    await auth.signOut();
    successMessage('تسجيل الخروج');
    Get.offAll(const WelcomeScreen());
  }
}
