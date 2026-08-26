import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class ProviderWelcomeScreen extends StatelessWidget {
  const ProviderWelcomeScreen({super.key});

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
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.home_repair_service_rounded,
                  size: 72,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Text(
                'Earn Money as a Verified Service Partner',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Connect with thousands of customers in your city. Work when you want, earn what you deserve.',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ServeCTAButton(
                text: 'Register as Service Partner',
                onPressed: () => Get.toNamed(AppRoutes.providerSignup),
              ),
              const SizedBox(height: AppSpacing.md),
              ServeOutlineButton(
                text: 'Partner Login',
                onPressed: () => Get.toNamed(AppRoutes.providerLogin),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
