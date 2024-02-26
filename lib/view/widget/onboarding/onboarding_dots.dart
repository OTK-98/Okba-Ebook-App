import 'package:e_book_okba_store/data/datasource/static/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingDots extends StatelessWidget {
  final int currentIndex;

  const OnBoardingDots({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onBoardingController = OnBoardingData();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onBoardingController.items.length,
        (index) => Container(
          margin: EdgeInsets.all(4),
          child: AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: currentIndex == index ? Colors.white : Colors.grey,
            ),
            height: 30.h,
            width: currentIndex == index ? 80.w : 30.w,
            duration: Duration(milliseconds: 700),
          ),
        ),
      ),
    );
  }
}
