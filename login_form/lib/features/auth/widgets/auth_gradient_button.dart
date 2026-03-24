import 'package:flutter/material.dart';
import '../../../core/theme/app_palette.dart';

class AuthGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const AuthGradientButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppPallete.gradient1,
              AppPallete.gradient2,
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppPallete.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
    );
  }
}