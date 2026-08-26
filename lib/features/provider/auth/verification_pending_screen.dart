import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class VerificationPendingScreen extends StatelessWidget {
  const VerificationPendingScreen({super.key});

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
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.hourglass_top_rounded, size: 72, color: Colors.white),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Text(
                'Verification Under Review ⏳',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Our team is reviewing your CNIC and certificates. Usually takes 2-4 hours.',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ServeCTAButton(
                text: 'Simulate Approval',
                onPressed: () => Get.toNamed(AppRoutes.providerApplicationApproved),
              ),
              const SizedBox(height: AppSpacing.md),
              ServeOutlineButton(
                text: 'Simulate Rejection',
                onPressed: () => Get.toNamed(AppRoutes.providerApplicationRejected),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
