import 'package:flutter/material.dart';
import 'package:ubit_hub/app_theme.dart';

class ProfileStrengthCard extends StatelessWidget {
  final double strength; // 0.0 to 1.0

  const ProfileStrengthCard({super.key, required this.strength});

  @override
  Widget build(BuildContext context) {
    final percent = (strength * 100).toInt();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Profile Strength',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              Text(
                '$percent%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: strength,
              minHeight: 8,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Complete your profile to unlock premium marketplace features and campus discounts.',
            style: TextStyle(color: Colors.white60, fontSize: 11, height: 1.5),
          ),
        ],
      ),
    );
  }
}
