import 'package:e_book_okba_store/Controller/AuthController.dart';
import 'package:e_book_okba_store/Controller/BookController.dart';
import 'package:e_book_okba_store/Pages/BookDetails/BookDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../Components/BookTile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    BookController bookController = Get.put(BookController());

    bool isAuthorizedUser =
        authController.auth.currentUser!.email == "moh2617khaled@gmail.com";

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Color(0xFF15202B),
          //   title: Text(
          //     "حسابي",
          //     style: Theme.of(context).textTheme.headlineMedium,
          //     textAlign: TextAlign.center,
          //   ),
          //   actions: [
          //     IconButton(
          //       onPressed: () {
          //         authController.signout();
          //       },
          //       icon: Icon(
          //         Iconsax.logout,
          //         color: Theme.of(context).colorScheme.onBackground,
          //       ),
          //     ),
          //   ],
          // ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF15202B),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100.r),
                      bottomRight: Radius.circular(100.r),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "الملف الشخصي",
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            icon: Icon(
                              Iconsax.logout,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              authController.signout();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              "${authController.auth.currentUser!.photoURL}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "${authController.auth.currentUser!.displayName}",
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${authController.auth.currentUser!.email}",
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: isAuthorizedUser
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "كتبك",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () {
                                if (bookController.currentUserBooks.isEmpty) {
                                  // Display a message when there are no books
                                  return Center(
                                    child: Text(
                                      "أضف أول كتاب واستمتع بتجربة التطبيق",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                } else {
                                  // Display the books
                                  return Column(
                                    children: bookController.currentUserBooks
                                        .map(
                                          (e) => BookTile(
                                            title: e.title!,
                                            coverUrl: e.coverUrl!,
                                            author: e.author!,
                                            publisher: e.publisher!,
                                            edition: e.edition!,
                                            pavillon: e.pavilion!,
                                            ontap: () {
                                              Get.to(BookDetails(book: e));
                                            },
                                          ),
                                        )
                                        .toList(),
                                  );
                                }
                              },
                            ),
                          ],
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
