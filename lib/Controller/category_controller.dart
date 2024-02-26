import 'package:e_book_okba_store/Data/Repositories/Books/book_repository.dart';
import 'package:e_book_okba_store/Data/Repositories/Categories/category_repository.dart';
import 'package:e_book_okba_store/Models/BookModel.dart';
import 'package:e_book_okba_store/Models/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isloading = false.obs;
  String? selectedCategory = '0';
  ValueNotifier<int?> selectedSubCategory = ValueNotifier<int?>(null);

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxList<BookModel> affiliatedBooks = <BookModel>[].obs;

  void onInit() {
    super.onInit();
    fetchCategories();
  }

  /// load category data
  Future<void> fetchCategories() async {
    try {
      // Show Loader While loading catigories
      isloading.value = true;

      // Fetch categories from data source (Firebase)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(
          allCategories.where((category) => category.catgId!.isEmpty).toList());
    } catch (e) {
      'Oh, Snap ${e}';
    } finally {}
    isloading.value = false;
  }

  /// load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategory(categoryId);

      return subCategories;
    } catch (e) {
      'Oh, Snap ${e}';
      return [];
    }
  }

  /// Load selected category data

  /// Get Category or Sub-Category Books
  Future<List<BookModel>> getCategoriesBooks(
      {required String categoryId}) async {
    try {
      final books = await BookRepository.instance
          .getBooksForSubCategory(categoryId: categoryId);
      print('Fetched books for categoryId: $categoryId');
      return books;
    } catch (e) {
      print('Error in getCategoriesBooks: $e');
      throw 'حدث خطأ ما، حاول مرة أخرى';
    }
  }
}
