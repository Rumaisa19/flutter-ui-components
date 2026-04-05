import 'package:flutter/material.dart';
import 'package:ubit_hub/app_theme.dart';
import 'package:ubit_hub/mock_data.dart';
import '../../../widgets/news_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredNews = mockNews.where((n) => n.isFeatured).toList();
    final otherNews = mockNews.where((n) => !n.isFeatured).toList();

    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome header
            const Text(
              'Welcome, Jordan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              'Your academic architect dashboard is ready.',
              style: TextStyle(fontSize: 13, color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 16),

            // GPA / Next Class status cards
            const Row(
              children: [
                Expanded(
                  child: _StatusCard(
                    label: 'CURRENT GPA',
                    value: '3.82',
                    valueStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _StatusCard(
                    label: 'NEXT CLASS',
                    value: 'CS 401',
                    subtitle: '12:30 AM • Hall G',
                    isPrimary: true,
                    valueStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Campus News header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Campus News',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(fontSize: 13, color: AppTheme.accent),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Featured card
            if (featuredNews.isNotEmpty)
              FeaturedNewsCard(item: featuredNews.first),
            const SizedBox(height: 8),

            // Other news items
            ...otherNews.map((item) => NewsListTile(item: item)),
          ],
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String label;
  final String value;
  final String? subtitle;
  final bool isPrimary;
  final TextStyle valueStyle;

  const _StatusCard({
    required this.label,
    required this.value,
    this.subtitle,
    this.isPrimary = false,
    required this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPrimary ? AppTheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isPrimary ? AppTheme.primary : AppTheme.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
              color: isPrimary ? Colors.white60 : AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: 4),
          Text(value, style: valueStyle),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: 11,
                color: isPrimary ? Colors.white70 : AppTheme.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
