import 'package:flutter/material.dart';
import '../models/destination_model.dart';
import 'stat_card.dart';

class StatsRow extends StatelessWidget {
  final DestinationModel destination;

  const StatsRow({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          StatCard(
            icon: Icons.location_on_outlined,
            label: '${destination.distanceKm.toInt()} km',
          ),
          const SizedBox(width: 12),
          StatCard(
            icon: Icons.access_time_rounded,
            label: '${destination.durationHrs} hrs',
          ),
          const SizedBox(width: 12),
          StatCard(
            icon: Icons.attach_money_rounded,
            label: '\$${destination.price.toStringAsFixed(2)}',
          ),
        ],
      ),
    );
  }
}
