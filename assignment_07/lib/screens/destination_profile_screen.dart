import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../models/destination_model.dart';
import '../widgets/top_bar.dart';
import '../widgets/hero_image.dart';
import '../widgets/stats_row.dart';
import '../widgets/overview_section.dart';
import '../widgets/booking_footer.dart';

class DestinationProfileScreen extends StatelessWidget {
  final DestinationModel destination;

  const DestinationProfileScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(),
              HeroImage(imageUrl: destination.imageUrl),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  destination.name,
                  style: AppTextStyles.destinationTitle,
                ),
              ),
              const SizedBox(height: 20),
              StatsRow(destination: destination),
              const SizedBox(height: 28),
              OverviewSection(destination: destination),
              const SizedBox(height: 32),
              BookingFooter(
                onBookNow: () {
                  // Handle booking
                },
                onViewTerms: () {
                  // Handle terms
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
