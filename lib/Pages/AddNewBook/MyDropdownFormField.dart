import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDropdownFormField extends StatelessWidget {
  final Stream<QuerySnapshot> stream;
  final String? selectedValue;
  final String? text;
  final ValueChanged<String?> onChanged;

  const MyDropdownFormField({
    Key? key,
    required this.stream,
    required this.selectedValue,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          List<DropdownMenuItem<String>> items = [];

          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            final categories = snapshot.data?.docs.reversed.toList();

            items.add(DropdownMenuItem(value: "0", child: Text(text!)));

            for (var category in categories!) {
              items.add(DropdownMenuItem(
                value: category.id,
                child: Text(category['title']),
              ));
            }
          }

          return DropdownButtonFormField<String>(
            items: items,
            onChanged: onChanged,
            value: selectedValue,
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              filled: true,
              fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              hintStyle: TextStyle(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.8),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}




// import 'package:e_book_okba_store/Controller/category_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class MyDropdownFormField extends StatelessWidget {
//   final String text;
//   final ValueChanged<String?> onChanged;

//   const MyDropdownFormField({
//     Key? key,
//     required this.text,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     CategoryController categoryController = Get.put(CategoryController());

//     return GetBuilder<CategoryController>(
//       builder: (categoryController) {
//         if (categoryController.isloading.value) {
//           return CircularProgressIndicator();
//         } else {
//           List<DropdownMenuItem<String>> items = [];

//           items.add(DropdownMenuItem(value: "0", child: Text(text)));

//           for (var category in categoryController.allCategories) {
//             items.add(DropdownMenuItem(
//               value: category.catgId,
//               child: Text(category.title!),
//             ));
//           }

//           return DropdownButton<String>(
//             items: items,
//             onChanged: onChanged,
//             value: categoryController.selectedCategory ?? '0',
//             isExpanded: true,
//           );
//         }
//       },
//     );
//   }
// }















































