import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class ServiceCompletedScreen extends StatelessWidget {
  final String requestId;

  const ServiceCompletedScreen({super.key, required this.requestId});

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
                child: const Icon(Icons.task_alt_rounded, size: 72, color: Colors.white),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Text(
                'Job Completed! 🎉',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Tariq Mahmood has finished the plumbing repair work.',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ServeCTAButton(
                text: 'Proceed to Payment (Rs. 2,700)',
                onPressed: () => Get.toNamed(AppRoutes.payment.replaceFirst(':requestId', requestId)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
