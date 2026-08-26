import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class ProviderFoundScreen extends StatelessWidget {
  final String requestId;

  const ProviderFoundScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final provider = MockData.providers.first;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_rounded, size: 64, color: Colors.white),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Provider Accepted! 🎉',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Tariq Mahmood has accepted your plumbing request and is preparing to travel.',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xxl),

              // Provider Card
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
                    ServeAvatar(
                      name: provider.name,
                      imageUrl: provider.avatarUrl,
                      size: AvatarSize.lg,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(provider.name, style: AppTypography.titleLarge),
                              const SizedBox(width: 4),
                              const VerifiedBadge(compact: true),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              StarRatingWidget(rating: provider.rating, size: 14),
                              const SizedBox(width: 4),
                              Text('${provider.rating} (${provider.jobsCompleted} jobs)', style: AppTypography.bodySmall),
                            ],
                          ),
                          Text('${provider.experience} • ${provider.phone}', style: AppTypography.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              ServeCTAButton(
                text: 'Track Provider on Map',
                onPressed: () => Get.toNamed(AppRoutes.liveTracking.replaceFirst(':requestId', requestId)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
