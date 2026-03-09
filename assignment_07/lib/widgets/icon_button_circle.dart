import 'package:flutter/material.dart';
import '../../constants/app_theme.dart';

class IconButtonCircle extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const IconButtonCircle({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.topBarIcon,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: 18),
      ),
    );
  }
}
