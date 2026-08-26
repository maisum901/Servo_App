import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('24/7 Emergency Dispatch 🚨'),
        backgroundColor: AppColors.error,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.flash_on_rounded, size: 64, color: Colors.white),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'Urgent Service Dispatch',
                      style: AppTypography.headlineLarge.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Guaranteed technician arrival within 15-20 minutes.',
                      style: AppTypography.bodyMedium.copyWith(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              Text('Select Emergency Category', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),

              _buildEmergencyItem('Plumbing Pipe Burst', 'Plumbing', 'Rs. 750 (1.5x fee)'),
              _buildEmergencyItem('Main Breaker Short Circuit', 'Electrical', 'Rs. 750 (1.5x fee)'),
              _buildEmergencyItem('Dead Battery / Car Breakdown', 'Mechanic', 'Rs. 900 (1.5x fee)'),
              _buildEmergencyItem('Accident Vehicle Towing', 'Tow Truck', 'Rs. 2,250 (1.5x fee)'),

              const Spacer(),
              ServeCTAButton(
                text: 'Dispatch Immediate Professional Now',
                onPressed: () => Get.toNamed(AppRoutes.findingProvider.replaceFirst(':requestId', 'SR-EMERGENCY')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmergencyItem(String title, String category, String fee) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.titleMedium),
              Text('$category • Priority Dispatch', style: AppTypography.bodySmall),
            ],
          ),
          Text(fee, style: AppTypography.labelLarge.copyWith(color: AppColors.error)),
        ],
      ),
    );
  }
}
