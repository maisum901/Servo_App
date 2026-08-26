import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

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
                child: const Icon(Icons.location_on_rounded, size: 64, color: AppColors.primary),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Text(
                'Enable Location Access 📍',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'ServePro uses your location to find verified professionals nearby and display live tracking.',
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
                    _buildFeatureRow(Icons.near_me, 'Find technicians within 5km radius'),
                    const SizedBox(height: AppSpacing.md),
                    _buildFeatureRow(Icons.map, 'Real-time live map tracking'),
                    const SizedBox(height: AppSpacing.md),
                    _buildFeatureRow(Icons.schedule, 'Accurate ETA calculations'),
                  ],
                ),
              ),
              const Spacer(),

              ServeCTAButton(
                text: 'Allow Location Access',
                onPressed: () => Get.toNamed(AppRoutes.notificationPermission),
              ),
              const SizedBox(height: AppSpacing.md),
              ServeGhostButton(
                text: 'Not Now',
                onPressed: () => Get.toNamed(AppRoutes.notificationPermission),
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
