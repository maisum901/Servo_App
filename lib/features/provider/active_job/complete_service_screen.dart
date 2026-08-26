import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class CompleteServiceScreen extends StatelessWidget {
  final String requestId;

  const CompleteServiceScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final quote = MockData.activeRequest.quote!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Final Job Summary'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [AppColors.subtleShadow],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Customer Total Bill', style: AppTypography.titleMedium),
                        Text('Rs. ${quote.customerTotal.toInt()}', style: AppTypography.headlineMedium),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Platform Commission (12%)', style: AppTypography.bodySmall),
                        Text('-Rs. ${quote.platformCommission.toInt()}', style: AppTypography.bodySmall.copyWith(color: AppColors.error)),
                      ],
                    ),
                    const Divider(height: AppSpacing.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Your Net Earnings', style: AppTypography.titleLarge.copyWith(color: AppColors.success)),
                        Text(
                          '+Rs. ${quote.providerEarnings.toInt()}',
                          style: AppTypography.headlineLarge.copyWith(color: AppColors.success),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),

              ServeCTAButton(
                text: 'Finish Job & Return to Dashboard',
                onPressed: () {
                  Get.snackbar('Job Completed', 'Job marked completed! Earnings added to wallet.');
                  Get.offAllNamed(AppRoutes.providerDashboard);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
