import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class MyInputTextField extends StatelessWidget {
  void Function()? onTap;
  void Function(String)? onChanged;
  TextEditingController? controller;

  MyInputTextField({
    this.onTap,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          SvgPicture.asset("Assets/Icons/search.svg"),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              focusNode: focusNode,
              style: TextStyle(color: Colors.white),
              controller: controller,
              onChanged: onChanged,
              onTap: () {
                // Trigger onTap callback when the text field gains focus
                focusNode.requestFocus();
                onTap?.call();
              },
              decoration: const InputDecoration(
                hintText: "ابحث عن كتابك المفضل ..",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
