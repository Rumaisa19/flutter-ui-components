import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../models/destination_model.dart';

class OverviewSection extends StatelessWidget {
  final DestinationModel destination;

  const OverviewSection({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Overview', style: AppTextStyles.overviewHeading),
          const SizedBox(height: 12),
          Text(destination.description, style: AppTextStyles.bodyText),
          const SizedBox(height: 16),
          _LocationTag(location: destination.location),
        ],
      ),
    );
  }
}

class _LocationTag extends StatelessWidget {
  final String location;

  const _LocationTag({required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined,
            color: AppColors.textMuted, size: 15),
        const SizedBox(width: 4),
        Text(location, style: AppTextStyles.locationText),
      ],
    );
  }
}
