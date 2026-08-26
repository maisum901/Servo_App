import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class CancellationScreen extends StatefulWidget {
  const CancellationScreen({super.key});

  @override
  State<CancellationScreen> createState() => _CancellationScreenState();
}

class _CancellationScreenState extends State<CancellationScreen> {
  String _reason = 'Changed my mind';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Cancel Request'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Why do you want to cancel?', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),

              ...['Changed my mind', 'Found another service', 'Provider is taking too long', 'Selected wrong problem type'].map((r) {
                final isSel = _reason == r;
                return Container(
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: isSel ? AppColors.primaryLight : AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                    border: Border.all(color: isSel ? AppColors.primary : AppColors.border),
                  ),
                  child: ListTile(
                    title: Text(r, style: AppTypography.titleMedium),
                    trailing: Radio<String>(
                      value: r,
                      groupValue: _reason,
                      activeColor: AppColors.primary,
                      onChanged: (v) => setState(() => _reason = v!),
                    ),
                    onTap: () => setState(() => _reason = r),
                  ),
                );
              }),

              const Spacer(),
              ServeDestructiveButton(
                text: 'Confirm Cancellation',
                onPressed: () {
                  Get.snackbar('Request Cancelled', 'Your service request #SR-8842 has been cancelled.');
                  Get.offAllNamed(AppRoutes.home);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
