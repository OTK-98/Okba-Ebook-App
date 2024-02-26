import 'package:e_book_okba_store/Pages/BookDetails/BookDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/BackButton.dart';
import '../../Components/BookTile.dart';
import '../../Controller/AuthController.dart';
import '../../Controller/BookController.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    BookController bookController = Get.put(BookController());
    // bool isAuthorizedUser =
    //     authController.auth.currentUser!.email == "kherfham123@gmail.com";
    bool isAuthorizedUser =
        authController.auth.currentUser!.email == "moh2617khaled@gmail.com";
    // bool isAuthorizedUser =
    //     authController.auth.currentUser!.email == "khaled.farid1998@gmail.com";
    // bool isAuthorizedUser =
    //     authController.auth.currentUser!.email == "yacinebakhti1mi@gmail.com";

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          // floatingActionButton: isAuthorizedUser
          //     ? FloatingActionButton(
          //         backgroundColor: Colors.white,
          //         onPressed: () {
          //           Get.to(const AddNewBookPage());
          //         },
          //         child: Icon(
          //           Icons.add,
          //           color: Theme.of(context).colorScheme.background,
          //         ),
          //       )
          //     : null,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // height: 500,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  color: Theme.of(context).colorScheme.primary,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const MyBackButton(),
                                  Text("حسابي",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  IconButton(
                                      onPressed: () {
                                        authController.signout();
                                      },
                                      icon: Icon(
                                        Icons.logout,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      ))
                                ],
                              ),
                              const SizedBox(height: 60),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 2,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    )),
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
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text("${authController.auth.currentUser!.email}",
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                            ],
                          ),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: isAuthorizedUser
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Text("كتبك",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () => Column(
                                children: bookController.currentUserBooks
                                    .map((e) => BookTile(
                                          title: e.title!,
                                          coverUrl: e.coverUrl!,
                                          author: e.author!,
                                          publisher: e.publisher!,
                                          edition: e.edition!,
                                          pavillon: e.pavilion!,
                                          ontap: () {
                                            Get.to(BookDetails(book: e));
                                          },
                                        ))
                                    .toList(),
                              ),
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
