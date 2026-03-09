import 'package:flutter/material.dart';
import '../constants/app_theme.dart';

class BookingFooter extends StatelessWidget {
  final VoidCallback onBookNow;
  final VoidCallback onViewTerms;

  const BookingFooter({
    super.key,
    required this.onBookNow,
    required this.onViewTerms,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _BookButton(onTap: onBookNow),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: onViewTerms,
            child: const Text(
              'View Terms and Conditions',
              style: AppTextStyles.termsLink,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookButton extends StatelessWidget {
  final VoidCallback onTap;

  const _BookButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text('Book Now', style: AppTextStyles.bookButton),
      ),
    );
  }
}
