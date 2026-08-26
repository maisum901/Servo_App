import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class ProviderArrivedScreen extends StatelessWidget {
  final String requestId;

  const ProviderArrivedScreen({super.key, required this.requestId});

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
                child: const Icon(
                  Icons.verified_user_rounded,
                  size: 64,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Your Provider Has Arrived! 🚪',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Tariq Mahmood is outside your door for inspection',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xxl),

              // Provider Details Card
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
                          Text(provider.name, style: AppTypography.titleLarge),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              StarRatingWidget(rating: provider.rating, size: 14),
                              const SizedBox(width: 4),
                              Text('${provider.rating}', style: AppTypography.bodySmall),
                            ],
                          ),
                          Text(provider.phone, style: AppTypography.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // "What Happens Next" Amber Callout Box
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: AppColors.accent),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info, color: AppColors.accent),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What Happens Next?',
                            style: AppTypography.titleMedium.copyWith(color: AppColors.textPrimary),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '1. The pro will conduct a thorough diagnostic inspection.\n2. They will submit an itemized quote for your approval before starting work.',
                            style: AppTypography.bodySmall.copyWith(color: AppColors.textPrimary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              Row(
                children: [
                  Expanded(
                    child: ServeOutlineButton(
                      text: 'Call Pro',
                      icon: Icons.phone,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: ServeOutlineButton(
                      text: 'Chat',
                      icon: Icons.chat,
                      onPressed: () => Get.toNamed(AppRoutes.chat.replaceFirst(':chatId', 'p101')),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              ServeCTAButton(
                text: 'View Shared Quote',
                onPressed: () => Get.toNamed(AppRoutes.quoteReceived.replaceFirst(':requestId', requestId)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
