import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class DocumentUploadScreen extends StatelessWidget {
  const DocumentUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Certificates & Licenses'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Police Verification & Diploma', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.picture_as_pdf, color: AppColors.error),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(child: Text('Police_Clearance_Certificate.pdf', style: AppTypography.bodyMedium)),
                    const Icon(Icons.check_circle, color: AppColors.success),
                  ],
                ),
              ),
              const Spacer(),
              ServeCTAButton(
                text: 'Submit Partner Application',
                onPressed: () => Get.toNamed(AppRoutes.providerVerificationPending),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
