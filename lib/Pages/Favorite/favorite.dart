import 'package:e_book_okba_store/Components/BookCard.dart';
import 'package:e_book_okba_store/Pages/BookDetails/BookDetails.dart';
import 'package:flutter/material.dart';
import 'package:e_book_okba_store/Controller/BookController.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the instance of BookController using Get.find
    BookController bookController = Get.find<BookController>();

    // Call the fetchFavoriteBooks method to fetch only favorite books
    bookController.fetchFavoriteBooks();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF15202B),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("قائمة كتبي المفضلة",
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ),
            Expanded(
              child: bookController.currentUserBooksFavorie.isEmpty
                  ? Center(
                      child: Text(
                        "أضف كتبك المفضلة هنا واستمتع بالقراءة",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    )
                  : GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 0.55, // Adjust this value
                      crossAxisSpacing: 1, // Adjust the spacing between columns
                      mainAxisSpacing: 1, // Adjust the spacing between rows
                      padding: EdgeInsets.all(16.0),
                      children: List.generate(
                        bookController.currentUserBooksFavorie.length,
                        (index) {
                          final book =
                              bookController.currentUserBooksFavorie[index];
                          return BookCard(
                            title: book.title ?? "",
                            coverUrl: book.coverUrl ?? "",
                            ontap: () {
                              Get.to(BookDetails(
                                book: book,
                              ));
                            },
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:e_book_okba_store/Controller/BookController.dart';
// import 'package:get/get.dart';

// class FavoriteScreen extends StatelessWidget {
//   const FavoriteScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Get the instance of BookController using Get.find
//     BookController bookController = Get.find<BookController>();

//     // Call the fetchFavoriteBooks method to fetch only favorite books
//     bookController.fetchFavoriteBooks();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('الكتب المفضلة'),
//       ),
//       body: Obx(
//         // Observe the currentUserBooksFavorie list for changes
//         () => ListView.builder(
//           itemCount: bookController.currentUserBooksFavorie.length,
//           itemBuilder: (context, index) {
//             // Retrieve the book at the current index
//             var book = bookController.currentUserBooksFavorie[index];
//             return ListTile(
//               title: Text(
//                 book.title!,
//                 style: TextStyle(color: Colors.orange),
//               ),
//               subtitle: Text(
//                 book.author!,
//                 style: TextStyle(color: Colors.orange),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
