import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const background     = Color(0xFF0D1117);
  static const surface        = Color(0xFF151C2C);
  static const border         = Color(0xFF1E2A42);
  static const topBarIcon     = Color(0xFF1C2333);
  static const accent         = Color(0xFF2563EB);
  static const accentLight    = Color(0xFF3B82F6);
  static const textPrimary    = Colors.white;
  static const textSecondary  = Color(0xFFADB5C7);
  static const textMuted      = Color(0xFF6B7A99);
}

class AppTextStyles {
  AppTextStyles._();

  static const screenTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
  );

  static const destinationTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 26,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
  );

  static const overviewHeading = TextStyle(
    color: AppColors.accentLight,
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );

  static const bodyText = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
    height: 1.65,
  );

  static const statLabel = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const locationText = TextStyle(
    color: AppColors.textMuted,
    fontSize: 13,
  );

  static const bookButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
    color: AppColors.textPrimary,
  );

  static const termsLink = TextStyle(
    color: AppColors.textMuted,
    fontSize: 13,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.textMuted,
  );
}
