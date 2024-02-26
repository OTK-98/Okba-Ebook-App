import 'package:e_book_okba_store/Pages/ProfilePage/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/AuthController.dart';
import '../../ProfilePage/ProfilePage.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: Icon(Icons.menu, size: 35),
          ),
          Text("المكتبة الرقمية عقبة بن نافع",
              style: Theme.of(context).textTheme.headlineMedium),
          InkWell(
            onTap: () {
              Get.to(ProfileScreen());
            },
            child: CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).colorScheme.background,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                        authController.auth.currentUser!.photoURL!))),
          )
        ],
      ),
    );
  }
}
