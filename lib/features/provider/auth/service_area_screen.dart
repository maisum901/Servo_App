import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class ServiceAreaScreen extends StatelessWidget {
  const ServiceAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Service Area Radius'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Coverage Area', style: AppTypography.titleLarge),
              Text('Tariq Road & PECHS, Karachi (10 km radius)', style: AppTypography.bodySmall),
              const SizedBox(height: AppSpacing.md),
              const MapPlaceholderWidget(height: 220),
              const Spacer(),
              ServeCTAButton(
                text: 'Next: CNIC & Identity',
                onPressed: () => Get.toNamed(AppRoutes.providerIdentity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
