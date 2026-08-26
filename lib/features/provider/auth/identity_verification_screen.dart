import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class IdentityVerificationScreen extends StatelessWidget {
  const IdentityVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Identity Verification'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Upload CNIC Photos', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),
              _buildUploadBox('Front Side of CNIC'),
              const SizedBox(height: AppSpacing.md),
              _buildUploadBox('Back Side of CNIC'),
              const Spacer(),
              ServeCTAButton(
                text: 'Next: Documents & License',
                onPressed: () => Get.toNamed(AppRoutes.providerDocuments),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadBox(String title) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.cloud_upload_outlined, color: AppColors.primary, size: 32),
          const SizedBox(height: 4),
          Text(title, style: AppTypography.titleMedium),
        ],
      ),
    );
  }
}
