import 'package:e_book_okba_store/Config/Colors.dart';
import 'package:e_book_okba_store/Controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSection extends StatelessWidget {
  final AuthController authController;

  const BottomSection({required this.authController});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        authController.loginWithEmail();
      },
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.1,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 13, 21, 27),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
          child: Container(
            decoration: BoxDecoration(
              color: backgroudColor,
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "تسجيل الدخول باستخدام جوجل",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      letterSpacing: 2.sp,
                      fontSize: 60.sp),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Image.asset("Assets/Icons/google.png"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
