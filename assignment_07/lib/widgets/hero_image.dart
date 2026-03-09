import 'package:flutter/material.dart';
import '../../constants/app_theme.dart';

class HeroImage extends StatelessWidget {
  final String imageUrl;

  const HeroImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildImage(),
        _buildGradientOverlay(),
        _buildFavouriteButton(),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 80,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, AppColors.background],
          ),
        ),
      ),
    );
  }

  Widget _buildFavouriteButton() {
    return Positioned(
      top: 14,
      right: 14,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24, width: 1),
        ),
        child: const Icon(
          Icons.favorite_border_rounded,
          color: AppColors.textPrimary,
          size: 20,
        ),
      ),
    );
  }
}
