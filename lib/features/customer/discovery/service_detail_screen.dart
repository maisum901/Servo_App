import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String serviceId;

  const ServiceDetailScreen({super.key, required this.serviceId});

  @override
  Widget build(BuildContext context) {
    final category = MockData.categories.firstWhere(
      (c) => c.id == serviceId,
      orElse: () => MockData.categories.first,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Header Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  boxShadow: [AppColors.subtleShadow],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category.name,
                          style: AppTypography.displayLarge.copyWith(color: Colors.white),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.build_circle_outlined, size: 32, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      category.description,
                      style: AppTypography.bodyMedium.copyWith(color: Colors.white70),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      children: [
                        _buildBadge('Response: ${category.responseTime}', Icons.timer_outlined),
                        const SizedBox(width: AppSpacing.sm),
                        if (category.isEmergencyAvailable) _buildBadge('24/7 Urgent', Icons.flash_on_outlined),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Mandatory Visit Fee Disclaimer Card
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Diagnostic Inspection Fee', style: AppTypography.titleMedium.copyWith(color: AppColors.primary)),
                        Text('Rs. ${category.visitFee}', style: AppTypography.headlineMedium.copyWith(color: AppColors.primary)),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Covers technician doorstep arrival & initial problem diagnosis. Actual repair/parts cost will be quoted after inspection.',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Common Problems Covered
              Text('Common Issues We Repair', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),
              ...category.problemTypes.map((problem) => Container(
                    margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 20),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(child: Text(problem, style: AppTypography.bodyMedium)),
                      ],
                    ),
                  )),
              const SizedBox(height: AppSpacing.xxl),

              ServeCTAButton(
                text: 'Book ${category.name} Service',
                onPressed: () {
                  Get.toNamed(
                    AppRoutes.requestCreate,
                    arguments: category.id,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(text, style: AppTypography.labelSmall.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
