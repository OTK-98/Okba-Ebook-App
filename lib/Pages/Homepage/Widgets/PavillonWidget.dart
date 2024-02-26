import 'package:e_book_okba_store/Controller/category_controller.dart';
import 'package:e_book_okba_store/Pages/SubCategoriesScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/BookController.dart';

class PavillonWidget extends GetView<BookController> {
  const PavillonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isloading.value)
        return const CircularProgressIndicator();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'لم يتم العثور على أي بيانات',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }

      return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SizedBox(
          height: 50,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = categoryController.featuredCategories[index];
              return InkWell(
                onTap: () {
                  Get.to(() => SubCategoriesScreen(
                        category: category,
                      ));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .background, // Use your preferred background color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "${category.title}",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
