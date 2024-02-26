import 'package:e_book_okba_store/view/screen/home/bottom_navigation_bar.dart';
import 'package:e_book_okba_store/view/screen/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    splashController();
  }

  void splashController() {
    Future.delayed(Duration(seconds: 4), () {
      if (auth.currentUser != null) {
        Get.offAll(BottomNavigationBar());
      } else {
        Get.offAll(OnBoardingScreen());
      }
    });
  }
}
