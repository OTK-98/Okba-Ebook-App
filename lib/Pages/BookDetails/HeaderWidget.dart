import 'package:e_book_okba_store/Controller/AuthController.dart';
import 'package:e_book_okba_store/Controller/BookController.dart';
import 'package:e_book_okba_store/Models/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BookDetailsHeader extends StatelessWidget {
  final void Function()? onPresseEdit;
  final void Function()? onPressdDelete;
  final String id; // Add this line to accept the id parameter.

  final String coverUrl;
  final String title;
  final String author;
  final String publisher;
  final String edition;
  final String pages;
  final String pavillon;
  final String category;
  final String wardrobe;
  final String shelf;
  final String code;
  final String isFavorite;

  const BookDetailsHeader({
    Key? key,
    required this.onPresseEdit,
    required this.onPressdDelete,
    required this.coverUrl,
    required this.title,
    required this.author,
    required this.publisher,
    required this.edition,
    required this.pages,
    required this.pavillon,
    required this.category,
    required this.wardrobe,
    required this.shelf,
    required this.code,
    required this.isFavorite,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    BookController bookController = Get.put(BookController());

    BookModel book = Get.put(BookModel(id: id));

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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  isFavorite == 'true'
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: isFavorite == 'true' ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  bookController.successMessage(
                      "تنويه", "هذه الخاصية قيد التطوير الآن",
                      backgroundColor: Colors.blueGrey);
                  // Assuming 'book' is the current BookModel instance
                  //  bookController.toggleFavorite(book);
                },
              ),
              IconButton(
                icon: Icon(
                  Iconsax.arrow_left,
                ),
                onPressed: () {
                  // Assuming 'book' is the current BookModel instance
                  Get.back();
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    coverUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Visibility(
                  visible: isAuthorizedUser,
                  child: InkWell(
                    onTap: onPresseEdit,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF15202B),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Visibility(
                  visible: isAuthorizedUser,
                  child: InkWell(
                    onTap: onPressdDelete,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF15202B),
                      ),
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 12),
          Text(
            "المؤلف : $author",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(height: 8),
          Text(
            "الجناح : $pavillon",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(height: 8),
          Text(
            "القسم : $category",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(height: 20),
          Table(
            columnWidths: {
              0: FixedColumnWidth(100),
              1: FixedColumnWidth(100),
              2: FixedColumnWidth(100),
            },
            border: TableBorder.all(color: Colors.white),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: _buildTableCell(context, "عدد الصفحات", pages),
                  ),
                  TableCell(
                    child: _buildTableCell(context, "دار النشر", publisher),
                  ),
                  TableCell(
                    child: _buildTableCell(context, "الطبعة", edition),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: _buildTableCell(context, "رمز الكتاب", code),
                  ),
                  TableCell(
                    child: _buildTableCell(context, "رقم الخزانة", wardrobe),
                  ),
                  TableCell(
                    child: _buildTableCell(context, "رقم الرف", shelf),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTableCell(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
