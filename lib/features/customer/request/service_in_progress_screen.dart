import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class ServiceInProgressScreen extends StatelessWidget {
  final String requestId;

  const ServiceInProgressScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Service In Progress'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.build, size: 56, color: AppColors.primary),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Tariq is Working on Your Repair 🛠️',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Elapsed time: 14 mins • Job: Pipe replacement & sealing',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ServeCTAButton(
                text: 'Simulate Job Completion',
                onPressed: () => Get.toNamed(AppRoutes.serviceCompleted.replaceFirst(':requestId', requestId)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
