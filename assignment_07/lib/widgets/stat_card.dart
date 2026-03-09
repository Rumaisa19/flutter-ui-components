import 'package:flutter/material.dart';
import '../../constants/app_theme.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const StatCard({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.accentLight, size: 20),
            const SizedBox(height: 6),
            Text(label, style: AppTextStyles.statLabel),
          ],
        ),
      ),
    );
  }
}
