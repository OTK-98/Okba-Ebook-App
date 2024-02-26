import 'package:e_book_okba_store/Controller/AuthController.dart';
import 'package:e_book_okba_store/Controller/bottom_nav_bar_controller.dart';
import 'package:e_book_okba_store/Pages/AddNewBook/AddNewBook.dart';

import 'package:e_book_okba_store/Pages/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    final _bottomNavigationBarController =
        Get.put(BottomNavigationBarController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: authController.isAuthorizedUser.isTrue
            ? FloatingActionButton(
                onPressed: () {
                  Get.to(const AddNewBookPage());
                },
                child: Icon(Icons.add),
                backgroundColor: Color(0xFF15202B),
                foregroundColor: Colors.white,
                shape: CircleBorder(),
              )
            : null,
        body: Obx(() => _bottomNavigationBarController
            .screens[_bottomNavigationBarController.selectedIndex.value]),
        bottomNavigationBar: Obx(() => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                color: Color(0xFF15202B),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildNavigationBarItem(Iconsax.home, "الصفحة الرئيسة", 0,
                        _bottomNavigationBarController),
                    buildNavigationBarItem(
                      Iconsax.search_favorite,
                      "البحث",
                      1,
                      _bottomNavigationBarController,
                    ),
                    buildNavigationBarItem(Iconsax.heart, "المفضلة", 2,
                        _bottomNavigationBarController),
                    buildNavigationBarItem(Iconsax.user, "حسابي", 3,
                        _bottomNavigationBarController),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget buildNavigationBarItem(IconData icon, String label, int index,
      BottomNavigationBarController controller) {
    bool isSelected = controller.selectedIndex.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          controller.selectedIndex.value = index;
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: isSelected ? 50 : 50,
          width: isSelected ? 40 : 30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,
                  color: isSelected ? Colors.blue : Colors.grey,
                  size: isSelected ? 25 : 20),
              SizedBox(height: 4.0),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.grey,
                  fontSize: isSelected ? 14 : 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
