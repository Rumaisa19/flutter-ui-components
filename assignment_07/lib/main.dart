import 'package:flutter/material.dart';
import 'constants/app_theme.dart';
import 'models/destination_model.dart';
import 'screens/destination_profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'sans-serif',
      ),
      home: DestinationProfileScreen(destination: _sampleDestination),
    );
  }
}

// Sample data — in a real app this would come from a repository/provider
const _sampleDestination = DestinationModel(
  name: 'Lago di Braies',
  location: 'South Tyrol, Italy',
  description:
      'Experience the heart of the Dolomites. Lago di Braies is one of the most '
      'beautiful lakes in South Tyrol, Italy. Famous for its crystal clear emerald '
      'waters and the impressive mountain backdrop of the Seekofel.',
  imageUrl:
      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
  distanceKm: 120,
  durationHrs: 2.5,
  price: 45.00,
);
