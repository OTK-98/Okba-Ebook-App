import 'package:e_book_okba_store/Controller/BookController.dart';

import 'package:e_book_okba_store/Pages/UpdateBook/UpdateBook.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/BookModel.dart';
import 'BookActionBtn.dart';
import 'HeaderWidget.dart';

// ignore: must_be_immutable
class BookDetails extends StatelessWidget {
  BookController bookController = Get.put(BookController());

  final BookModel book;
  BookDetails({super.key, required this.book});

  Future<void> _refresh() async {
    // Add your logic to refresh the page here
    // For example, you can reload data from the server or perform any other necessary actions.
    await Future.delayed(Duration(seconds: 2));
    await bookController.fetchFeaturedBooks();

// Simulating a delay for demonstration purposes
  }

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());

    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Color(0xFF15202B),
                    child: Row(
                      children: [
                        Expanded(
                          child: BookDetailsHeader(
                            id: book.id,
                            coverUrl: book.coverUrl!,
                            title: book.title!,
                            author: book.author!,
                            publisher: book.publisher!,
                            edition: book.edition!,
                            pages: book.pages.toString(),
                            pavillon: book.pavilion.toString(),
                            category: book.category.toString(),
                            wardrobe: book.wardrobe.toString(),
                            shelf: book.shelf.toString(),
                            code: book.code.toString(),
                            isFavorite: book.isFavorite.toString(),
                            onPresseEdit: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateBookPage(
                                    book: book, // Pass the book details
                                  ),
                                ),
                              );
                            },
                            onPressdDelete: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Color(0xFF15202B),
                                    title: Text(
                                      "!تأكيد الحذف",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .red, // Custom color for the title
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Text(
                                      "هل أنت متأكد أنك تريد حذف الكتاب؟",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors
                                            .white, // Custom color for the content
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor: Colors
                                                  .red, // Custom text color for Confirm button
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              // Close the dialog
                                              bookController
                                                  .deleteBook(book.id);
                                              //       Get.to((BottomNavigationBar()));
                                            },
                                            child: Text("تأكيد"),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.black,
                                              backgroundColor: Colors.grey[
                                                  300], // Custom text color for Cancel button
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                            child: Text("إلغاء"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 20),
                  Container(
                    color: Color(0xFF15202B),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          BookActionBtn(
                            bookUrl: book.bookurl!,
                            bookName: book.title!,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
