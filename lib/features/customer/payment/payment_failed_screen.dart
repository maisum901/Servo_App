import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class PaymentFailedScreen extends StatelessWidget {
  const PaymentFailedScreen({super.key});

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
                  color: AppColors.error,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.error_outline_rounded, size: 72, color: Colors.white),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Text(
                'Payment Failed ❌',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Transaction declined by bank. Please check card limits or select cash payment.',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ServeCTAButton(
                text: 'Try Again',
                onPressed: () => Get.toNamed(AppRoutes.payment.replaceFirst(':requestId', 'SR-8842')),
              ),
              const SizedBox(height: AppSpacing.md),
              ServeOutlineButton(
                text: 'Pay with Cash',
                onPressed: () => Get.toNamed(AppRoutes.paymentSuccess),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
