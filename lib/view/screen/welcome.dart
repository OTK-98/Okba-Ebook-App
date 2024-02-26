import 'package:e_book_okba_store/Controller/AuthController.dart';
import 'package:e_book_okba_store/view/widget/welcome/bottom_section.dart';
import 'package:e_book_okba_store/view/widget/welcome/middle_section.dart';
import 'package:e_book_okba_store/view/widget/welcome/top_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Color(0xFF15202B),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: LayoutBuilder(builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopSection(),
              MiddleSection(),
              BottomSection(authController: authController),
            ],
          );
        }),
      ),
    );
  }
}
