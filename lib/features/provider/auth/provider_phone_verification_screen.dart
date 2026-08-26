import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class ProviderPhoneVerificationScreen extends StatelessWidget {
  const ProviderPhoneVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Phone Verification'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            children: [
              Text('Enter 6-Digit Code', style: AppTypography.headlineLarge),
              const SizedBox(height: AppSpacing.sm),
              Text('Sent to +92 300 1234567', style: AppTypography.bodyMedium),
              const SizedBox(height: AppSpacing.xxl),

              Pinput(
                length: 6,
                onCompleted: (pin) => Get.toNamed(AppRoutes.providerPersonalInfo),
              ),
              const Spacer(),

              ServeCTAButton(
                text: 'Verify Code',
                onPressed: () => Get.toNamed(AppRoutes.providerPersonalInfo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
