import 'package:flutter/material.dart';
import '../../../core/theme/app_palette.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  const AuthTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      // obscuringCharacter: "", for character shown in password
      style: const TextStyle(color: AppPallete.whiteColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppPallete.greyColor),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hintText is required";
        }
        return null;
      },
    );
  }
}