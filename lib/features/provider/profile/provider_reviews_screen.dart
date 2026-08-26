import 'package:flutter/material.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class ProviderReviewsScreen extends StatelessWidget {
  const ProviderReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Customer Reviews & Ratings'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [AppColors.subtleShadow],
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('4.9', style: AppTypography.displayLarge.copyWith(color: AppColors.primary)),
                        const StarRatingWidget(rating: 4.9, size: 16),
                        const SizedBox(height: 4),
                        Text('142 Reviews', style: AppTypography.bodySmall),
                      ],
                    ),
                    const SizedBox(width: AppSpacing.xl),
                    Expanded(
                      child: Column(
                        children: [
                          _buildBarRow('5 ★', 0.85),
                          _buildBarRow('4 ★', 0.12),
                          _buildBarRow('3 ★', 0.02),
                          _buildBarRow('2 ★', 0.01),
                          _buildBarRow('1 ★', 0.00),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              Text('Recent Customer Feedback', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),

              ...MockData.sampleRequests.where((r) => r.review != null).map((r) {
                final rev = r.review!;
                return Container(
                  margin: const EdgeInsets.only(bottom: AppSpacing.md),
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ServeAvatar(name: rev.customerName, size: AvatarSize.sm),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(rev.customerName, style: AppTypography.titleMedium),
                                Text(r.categoryName, style: AppTypography.bodySmall),
                              ],
                            ),
                          ),
                          StarRatingWidget(rating: rev.rating, size: 14),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(rev.text, style: AppTypography.bodyMedium),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarRow(String label, double pct) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(width: 28, child: Text(label, style: AppTypography.bodySmall)),
          const SizedBox(width: 4),
          Expanded(
            child: ServeProgressBar(
              progress: pct,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
    );
  }
}
