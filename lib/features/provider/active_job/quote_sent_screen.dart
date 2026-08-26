import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class QuoteSentScreen extends StatelessWidget {
  final String requestId;

  const QuoteSentScreen({super.key, required this.requestId});

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
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send_rounded, size: 56, color: Colors.white),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Quote Sent to Customer! 📤',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Waiting for Ahmed Raza to review and accept your quote of Rs. 2,700.',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ServeCTAButton(
                text: 'Simulate Customer Acceptance',
                onPressed: () => Get.toNamed(AppRoutes.providerProgress.replaceFirst(':requestId', requestId)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
