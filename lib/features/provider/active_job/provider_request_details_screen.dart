import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class ProviderRequestDetailsScreen extends StatelessWidget {
  final String requestId;

  const ProviderRequestDetailsScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final req = MockData.activeRequest;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Job Request #${req.id}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(req.categoryName, style: AppTypography.headlineLarge),
              Text(req.problemType, style: AppTypography.titleMedium),
              const SizedBox(height: AppSpacing.sm),
              Text(req.description, style: AppTypography.bodySmall),
              const Divider(height: AppSpacing.xl),

              Row(
                children: [
                  const Icon(Icons.person, color: AppColors.primary),
                  const SizedBox(width: AppSpacing.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(req.customerName, style: AppTypography.titleMedium),
                      Text(req.address, style: AppTypography.bodySmall),
                    ],
                  ),
                ],
              ),
              const Spacer(),

              ServeCTAButton(
                text: 'Navigate to Customer Location',
                onPressed: () => Get.toNamed(AppRoutes.providerNavigate.replaceFirst(':requestId', requestId)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
