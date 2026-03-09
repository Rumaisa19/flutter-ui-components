import 'package:flutter/material.dart';
import '../../constants/app_theme.dart';
import 'icon_button_circle.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButtonCircle(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.maybePop(context),
          ),
          const Text('Destination Profile', style: AppTextStyles.screenTitle),
          IconButtonCircle(
            icon: Icons.share_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
