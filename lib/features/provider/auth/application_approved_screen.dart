import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class ApplicationApprovedScreen extends StatelessWidget {
  const ApplicationApprovedScreen({super.key});

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
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.verified_rounded, size: 72, color: Colors.white),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Text(
                'Welcome Partner! 🎉',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Your account has been verified. You can now toggle Online and receive job requests.',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ServeCTAButton(
                text: 'Go to Partner Dashboard',
                onPressed: () => Get.offAllNamed(AppRoutes.providerDashboard),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
