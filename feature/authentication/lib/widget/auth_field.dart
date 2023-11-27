import 'package:flutter/material.dart';
import 'package:commons/commons.dart';

class AuthField extends StatelessWidget {
  AuthField(
      {super.key,
      required this.onChanged,
      this.labelText = "",
      this.hintText = ""});

  String labelText;
  String hintText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Pallete.blueColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Pallete.whiteColor),
        ),
        labelText: labelText,
        hintText: hintText
      ),
    );
  }
}
