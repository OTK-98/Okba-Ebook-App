import 'dart:async';
import 'package:e_book_okba_store/Controller/bottom_nav_bar_controller.dart';
import 'package:e_book_okba_store/Pages/Homepage/Widgets/greetings%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/BookTile.dart';
import '../../Components/MyDrawer.dart';
import '../../Controller/AuthController.dart';
import '../../Controller/BookController.dart';
import '../BookDetails/BookDetails.dart';
import 'Widgets/AppBar.dart';
import 'Widgets/PavillonWidget.dart';
import 'Widgets/MyInputeTextField.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BookController bookController = Get.put(BookController());

  List filteredResults = [];

  void initState() {
    super.initState();
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2));
    await bookController.fetchFeaturedBooks();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          drawer: myDrawer,
          body: RefreshIndicator(
            onRefresh: _refresh,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        color: Theme.of(context).colorScheme.primary,
                        child: Column(
                          children: [
                            const HomeAppBar(),
                            const SizedBox(height: 50),
                            Row(
                              children: [
                                GreetingWidget(),
                                const SizedBox(width: 20),
                                Text(
                                  "${authController.auth.currentUser!.displayName}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  "حان الوقت لقراءة الكتب وتعزيز معرفتك",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            MyInputTextField(
                              onTap: () {
                                Get.find<BottomNavigationBarController>()
                                    .selectedIndex
                                    .value = 1;
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  "أجنحة المكتبة",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            PavillonWidget(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "جميع الكتب",
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Obx(() {
                                if (bookController.isloading.value)
                                  return const CircularProgressIndicator();

                                if (bookController.featuredBooks().isEmpty) {
                                  return Center(
                                    child: Text(
                                      'لم يتم العثور على أي كتب',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(color: Colors.white),
                                    ),
                                  );
                                }
                                return Column(
                                  children: bookController.featuredBooks
                                      .map(
                                        (e) => BookTile(
                                          ontap: () {
                                            Get.to(BookDetails(book: e));
                                          },
                                          title: e.title!,
                                          coverUrl: e.coverUrl!,
                                          author: e.author!,
                                          publisher: e.publisher!,
                                          edition: e.edition!,
                                          pavillon: e.pavilion!,
                                        ),
                                      )
                                      .toList(),
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Components/BookCard.dart';
// import '../../Components/BookTile.dart';
// import '../../Components/MyDrawer.dart';
// import '../../Controller/AuthController.dart';
// import '../../Controller/BookController.dart';
// import '../BookDetails/BookDetails.dart';
// import 'Widgets/AppBar.dart';
// import 'Widgets/PavillonWidget.dart';
// import 'Widgets/MyInputeTextField.dart';
// import 'Widgets/greetings .dart';

// class HomePage extends StatefulWidget {
//   HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   BookController bookController = Get.put(BookController());
//   bool _isResultsVisible = false;

//   List filteredResults = [];
//   late Timer _debounceTimer;
//   TextEditingController _searchController = TextEditingController();

//   void initState() {
//     super.initState();
//     _debounceTimer = Timer(Duration(milliseconds: 20), () {});
//   }

//   Future<void> _refresh() async {
//     // Add your logic to refresh the page here
//     // For example, you can reload data from the server or perform any other necessary actions.
//     await Future.delayed(Duration(seconds: 2));
//     await bookController.fetchFeaturedBooks();
// // Simulating a delay for demonstration purposes
//   }

//   @override
//   Widget build(BuildContext context) {
//     AuthController authController = Get.put(AuthController());
//     BookController bookController = Get.put(BookController());
//     // bookController.getUserBook();
//     return SafeArea(
//       child: Scaffold(
//         drawer: myDrawer,
//         body: RefreshIndicator(
//           onRefresh: _refresh,
//           child: Directionality(
//             textDirection: TextDirection.rtl,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 15, horizontal: 15),
//                     color: Theme.of(context).colorScheme.primary,
//                     // height: 500,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             children: [
//                               const HomeAppBar(),
//                               const SizedBox(height: 50),
//                               Row(
//                                 children: [
//                                   GreetingWidget(),
//                                   const SizedBox(width: 20),
//                                   Text(
//                                       "${authController.auth.currentUser!.displayName}",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headlineMedium),
//                                 ],
//                               ),
//                               const SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   Text("حان الوقت لقراءة الكتب وتعزيز معرفتك",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .labelMedium),
//                                 ],
//                               ),
//                               const SizedBox(height: 20),

//                               // // ////////////////////////////////////////////////////////////////////////////////

//                               // In your build method:
//                               MyInputTextField(
//                                 onChanged: (query) {
//                                   _searchController.text = query;
//                                   _debounceTimer.cancel();
//                                   _debounceTimer =
//                                       Timer(Duration(milliseconds: 300), () {
//                                     if (query.isEmpty) {
//                                       // If the query is empty, clear the search results with a fade-out animation
//                                       setState(() {
//                                         _isResultsVisible = false;
//                                       });
//                                     } else {
//                                       bookController.searchFromFirebase1(query,
//                                           (List<dynamic> searchResults) {
//                                         setState(() {
//                                           // Update the state to show/hide search results based on query
//                                           filteredResults = searchResults;

//                                           // Show the search results with a fade-in animation
//                                           _isResultsVisible = true;
//                                         });
//                                       });
//                                     }
//                                   });
//                                 },
//                                 controller: _searchController,
//                               ),

//                               // Animated search results display
//                               _isResultsVisible
//                                   ? AnimatedOpacity(
//                                       opacity: _isResultsVisible ? 1.0 : 0.0,
//                                       duration: Duration(milliseconds: 300),
//                                       child: Column(
//                                         children: [
//                                           // Check if the search query is not empty and there are results
//                                           if (filteredResults.isNotEmpty &&
//                                               filteredResults.every(
//                                                   (e) => e.title == null))
//                                             // If there are items in filteredResults but all titles are null, show "No search result"
//                                             Column(
//                                               children: [
//                                                 const SizedBox(height: 20),
//                                                 Text("نتائج البحث",
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .labelMedium),
//                                                 const SizedBox(height: 10),
//                                                 Text(
//                                                     "لا يوجد كتاب مطايق لهذا الاسم",
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .labelMedium),
//                                               ],
//                                             ),

//                                           if (filteredResults.isNotEmpty)
//                                             // Display search results
//                                             Column(
//                                               children: [
//                                                 const SizedBox(height: 20),
//                                                 Text("نتائج البحث",
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .labelMedium),
//                                                 const SizedBox(height: 10),
//                                                 SingleChildScrollView(
//                                                   scrollDirection:
//                                                       Axis.horizontal,
//                                                   child: Row(
//                                                     children: filteredResults
//                                                         .map(
//                                                           (e) => BookCard(
//                                                             title: e
//                                                                 .title, // Use the actual property names here
//                                                             coverUrl:
//                                                                 e.coverUrl,
//                                                             ontap: () {
//                                                               Get.to(
//                                                                   BookDetails(
//                                                                 book: e,
//                                                               ));
//                                                             },
//                                                           ),
//                                                         )
//                                                         .toList(),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                         ],
//                                       ),
//                                     )
//                                   : Container(),

//                               // ////////////////////////////////////////////////////////////////////////////////
//                               const SizedBox(height: 20),
//                               Row(
//                                 children: [
//                                   Text("أجنحة المكتبة",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .labelLarge),
//                                 ],
//                               ),
//                               const SizedBox(height: 8),
//                               PavillonWidget(),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Container(
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "جميع الكتب",
//                                 style: Theme.of(context).textTheme.labelMedium,
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Obx(() {
//                             if (bookController.isloading.value)
//                               return const CircularProgressIndicator();

//                             if (bookController.featuredBooks().isEmpty) {
//                               return Center(
//                                 child: Text(
//                                   'لم يتم العثور على أي بيانات',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyMedium!
//                                       .apply(color: Colors.white),
//                                 ),
//                               );
//                             }
//                             return Column(
//                               children: bookController.featuredBooks
//                                   .map(
//                                     (e) => BookTile(
//                                       ontap: () {
//                                         Get.to(BookDetails(book: e));
//                                       },
//                                       title: e.title!,
//                                       coverUrl: e.coverUrl!,
//                                       author: e.author!,
//                                       publisher: e.publisher!,
//                                       edition: e.edition!,
//                                       pavillon: e.pavilion!,
//                                     ),
//                                   )
//                                   .toList(),
//                             );
//                           })
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
