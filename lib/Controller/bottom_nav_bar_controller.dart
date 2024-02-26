import 'package:e_book_okba_store/Pages/Favorite/favorite.dart';
import 'package:e_book_okba_store/Pages/Homepage/HomePage.dart';
import 'package:e_book_okba_store/Pages/ProfilePage/ProfileScreen.dart';
import 'package:e_book_okba_store/Pages/Search/search.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomePage(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
}
