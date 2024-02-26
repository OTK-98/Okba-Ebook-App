import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isNumber;
  final TextEditingController controller;

  const MyTextFormField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isNumber = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
        ),
        prefixIcon: Icon(
          icon,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.white, // Set the border color to white
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.white, // Set the border color to white
          ),
        ),
      ),
    );
  }
}
