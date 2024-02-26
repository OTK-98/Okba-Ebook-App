import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_okba_store/Models/BookModel.dart';
import 'package:e_book_okba_store/Pages/AddNewBook/MyDropdownFormField%20copy.dart';
import 'package:e_book_okba_store/Pages/AddNewBook/MyDropdownFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/BackButton.dart';
import '../../Components/MyTextFormField.dart';
import '../../Config/Colors.dart';
import '../../Controller/BookController.dart';

class UpdateBookPage extends StatefulWidget {
  final BookModel? book;

  const UpdateBookPage({Key? key, this.book}) : super(key: key);

  @override
  State<UpdateBookPage> createState() => _AddNewBookPageState();
}

class _AddNewBookPageState extends State<UpdateBookPage> {
  String? selectedPavillon = '0';
  String? selectedCategory = '0';

  BookController bookController = Get.find();

  @override
  void initState() {
    super.initState();

    if (widget.book != null) {
      // Initialize form fields with existing values
      bookController.title.text = widget.book!.title ?? "";
      bookController.auth.text = widget.book!.author ?? "";
      bookController.publisher.text = widget.book!.publisher ?? "";
      bookController.edition.text = widget.book!.edition ?? "";
      bookController.pages.text = widget.book!.pages.toString() ?? "";
      bookController.selectedPavillonId.value =
          widget.book!.subCategoryId ?? "";
      bookController.selectedPavillonTitle.value = widget.book!.pavilion ?? "";
      bookController.selectedCategoryId.value = widget.book!.categoryId ?? "";
      bookController.selectedCategoryTitle.value = widget.book!.category ?? "";
      bookController.wardrobe.text = widget.book!.wardrobe.toString() ?? "";
      bookController.shelf.text = widget.book!.shelf.toString() ?? "";
      bookController.code.text = widget.book!.code.toString() ?? "";
      bookController.imageUrl.value = widget.book!.coverUrl ?? "";
      bookController.pdfUrl.value = widget.book!.bookurl ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  color: Theme.of(context).colorScheme.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyBackButton(),
                                Text(
                                  "تحديث الكتاب ",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(width: 70),
                              ],
                            ),
                            SizedBox(height: 60),
                            InkWell(
                              onTap: () {
                                bookController.pickImage();
                              },
                              child: Obx(
                                () => Container(
                                  height: 190,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                  child: Center(
                                    child: bookController.isImageUploading.value
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : bookController.imageUrl.value.isEmpty
                                            ? Icon(
                                                Icons.add_photo_alternate,
                                                color: Colors.white,
                                                size: 40,
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  bookController.imageUrl.value,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: bookController.isPdfUploading.value
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: backgroudColor,
                                        ),
                                      )
                                    : bookController.pdfUrl.value == ""
                                        ? InkWell(
                                            onTap: () {
                                              bookController.pickPDF();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "رفع كتاب (صيغة PDF)",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                                SizedBox(width: 10),
                                                Icon(Icons.upload_file),
                                              ],
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              bookController.pdfUrl.value = "";
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  (bookController.BookName
                                                              .isNotEmpty
                                                          ? "${bookController.BookName}"
                                                          : "") +
                                                      " (PDF)",
                                                ),
                                                Spacer(),
                                                Icon(
                                                  Icons.delete,
                                                  size: 25,
                                                ),
                                              ],
                                            ),
                                          ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      MyTextFormField(
                        hintText: "عنوان الكتاب",
                        icon: Icons.book,
                        controller: bookController.title,
                      ),
                      SizedBox(height: 10),
                      MyTextFormField(
                        hintText: "المؤلف",
                        icon: Icons.person,
                        controller: bookController.auth,
                      ),
                      SizedBox(height: 10),
                      MyTextFormField(
                        hintText: "الناشر",
                        icon: Icons.home,
                        controller: bookController.publisher,
                      ),
                      SizedBox(height: 10),
                      MyTextFormField(
                        hintText: "الطبعة",
                        isNumber: true,
                        icon: Icons.edit,
                        controller: bookController.edition,
                      ),
                      SizedBox(height: 10),
                      MyTextFormField(
                        hintText: "عدد الصفحات",
                        isNumber: true,
                        icon: Icons.numbers,
                        controller: bookController.pages,
                      ),
                      SizedBox(height: 20),
                      MyDropdownFormFieldUpdate(
                        text: 'اختر الجناح',
                        stream: FirebaseFirestore.instance
                            .collection('Categories')
                            .where('categoryId', isEqualTo: null)
                            .snapshots(),
                        selectedValue: selectedPavillon,
                        onChanged: (selectedPavillonId) async {
                          // Fetch the document corresponding to the selected categoryId
                          var snapshot = await FirebaseFirestore.instance
                              .collection('Categories')
                              .doc(selectedPavillonId)
                              .get();

                          // Access the 'title' field from the document
                          var selectedPavillonTitle = snapshot.data()!['title'];

                          setState(() {
                            selectedPavillon = selectedPavillonId;
                          });
                          // Pass the selected category to the BookController
                          BookController.instance.updatePavillon(
                              selectedPavillonId!, selectedPavillonTitle);

                          print('Selected Category ID: $selectedPavillonId');
                          print('Corresponding Title: $selectedPavillonTitle');
                        },
                      ),
                      SizedBox(height: 20),
                      MyDropdownFormFieldUpdate(
                        text: 'اختر القسم',
                        stream: FirebaseFirestore.instance
                            .collection('Categories')
                            .where('categoryId', isNotEqualTo: null)
                            .snapshots(),
                        selectedValue: selectedCategory,
                        onChanged: (selectedCategoryId) async {
                          // Fetch the document corresponding to the selected categoryId
                          var snapshot = await FirebaseFirestore.instance
                              .collection('Categories')
                              .doc(selectedCategoryId)
                              .get();

                          // Check if the snapshot has data and if the 'title' field is present
                          if (snapshot.exists &&
                              snapshot.data() != null &&
                              snapshot.data()!.containsKey('title')) {
                            // Access the 'title' field from the document
                            var selectedCategoryTitle =
                                snapshot.data()!['title'];

                            setState(() {
                              selectedCategory = selectedCategoryId;
                            });

                            // Pass the selected category to the BookController
                            BookController.instance.updateCategory(
                                selectedCategoryId!, selectedCategoryTitle);

                            print('Selected Category ID: $selectedCategoryId');
                            print(
                                'Corresponding Title: $selectedCategoryTitle');
                          } else {
                            print(
                                'Document not found or does not contain the expected data.');
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      MyTextFormField(
                        hintText: "رقم الخزانة",
                        isNumber: true,
                        icon: Icons.numbers,
                        controller: bookController.wardrobe,
                      ),
                      SizedBox(height: 20),
                      MyTextFormField(
                        hintText: "رقم الرف",
                        isNumber: true,
                        icon: Icons.shelves,
                        controller: bookController.shelf,
                      ),
                      SizedBox(height: 20),
                      MyTextFormField(
                        hintText: "رمز الكتاب",
                        isNumber: true,
                        icon: Icons.code,
                        controller: bookController.code,
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                bookController.clearFields();
                              },
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.red,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "تفريغ الحقول",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.clear_all,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: bookController.isPdfUploading.value
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          bookController
                                              .updateBook(widget.book!);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "حفظ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            SizedBox(width: 8),
                                            Icon(
                                              Icons.post_add,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
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
