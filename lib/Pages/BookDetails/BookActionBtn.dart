import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../BookPage/BookPage.dart';

class BookActionBtn extends StatelessWidget {
  final String bookUrl;
  final String bookName;
  const BookActionBtn(
      {super.key, required this.bookUrl, required this.bookName});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.to(BookPage(
                    bookUrl: bookUrl,
                    bookName: bookName,
                  ));
                },
                child: Row(
                  children: [
                    Text("قراءة الكتاب",
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(width: 10),
                    Icon(Icons.book)
                  ],
                ),
              ),
              Container(
                height: 30, // Adjust the height as needed
                child: VerticalDivider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.snackbar(
                    "تحميل الكتاب",
                    "هذه الخاصية غير متاحة الآن",
                    backgroundColor: Color.fromARGB(
                        255, 54, 71, 88), // Adjust the alpha value (0-255)
                    colorText: Colors.red,
                    snackPosition: SnackPosition.BOTTOM,
                    titleText: Text("إشعار؛",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.right),
                    messageText: Text("هذه الخاصية غير متاحة الآن",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.right),
                    duration: Duration(seconds: 2),
                  );
                },
                child: Row(
                  children: [
                    Text("تحميل الكتاب",
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(width: 10),
                    Icon(Icons.file_download)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
