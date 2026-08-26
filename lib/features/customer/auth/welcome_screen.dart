import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.handyman_rounded,
                  size: 72,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Text(
                'Get Trusted Local Services When You Need Them',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Connect with verified plumbers, electricians, mechanics & cleaners in minutes.',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xxl),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.water_drop_outlined, color: AppColors.primary),
                  SizedBox(width: 16),
                  Icon(Icons.bolt_outlined, color: AppColors.accent),
                  SizedBox(width: 16),
                  Icon(Icons.ac_unit_outlined, color: AppColors.info),
                  SizedBox(width: 16),
                  Icon(Icons.build_outlined, color: AppColors.error),
                  SizedBox(width: 16),
                  Icon(Icons.cleaning_services_outlined, color: AppColors.success),
                ],
              ),
              const Spacer(),
              ServeCTAButton(
                text: 'Get Started',
                onPressed: () => Get.toNamed(AppRoutes.onboarding),
              ),
              const SizedBox(height: AppSpacing.md),
              ServeOutlineButton(
                text: 'I Already Have an Account',
                onPressed: () => Get.toNamed(AppRoutes.login),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
