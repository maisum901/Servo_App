import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.notifications_active_rounded, size: 64, color: AppColors.primary),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Text(
                'Stay Updated 🔔',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Turn on notifications to receive instant updates when a provider accepts your request or arrives.',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xxl),

              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    _buildFeatureRow(Icons.check_circle_outline, 'Request status alerts'),
                    const SizedBox(height: AppSpacing.md),
                    _buildFeatureRow(Icons.receipt_outlined, 'Instant quote notifications'),
                    const SizedBox(height: AppSpacing.md),
                    _buildFeatureRow(Icons.chat_outlined, 'Direct chat messages from provider'),
                  ],
                ),
              ),
              const Spacer(),

              ServeCTAButton(
                text: 'Enable Notifications',
                onPressed: () => Get.offAllNamed(AppRoutes.home),
              ),
              const SizedBox(height: AppSpacing.md),
              ServeGhostButton(
                text: 'Skip for Now',
                onPressed: () => Get.offAllNamed(AppRoutes.home),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(width: AppSpacing.md),
        Expanded(child: Text(text, style: AppTypography.bodyMedium)),
      ],
    );
  }
}
