import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_okba_store/Models/CategoryModel.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Variables
  RxString selectedCategory = ''.obs; // Add this line

  final _db = FirebaseFirestore.instance;

  // Get All Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } catch (e) {
      throw 'حدث خطأ ما، حاول مرة أخرى';
    }
  }

  // Get SubCategories

  Future<List<CategoryModel>> getSubCategory(String categoryId) async {
    try {
      final snasnapshot = await _db
          .collection("Categories")
          .where('categoryId', isEqualTo: categoryId)
          .get();

      final result =
          snasnapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();

      return result;
    } catch (e) {
      throw 'حدث خطأ ما، حاول مرة أخرى';
    }
  }
}
