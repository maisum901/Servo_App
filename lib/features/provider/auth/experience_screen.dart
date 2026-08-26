import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  double _years = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Work Experience'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Years of Experience', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              Text('${_years.toInt()} Years', style: AppTypography.headlineLarge.copyWith(color: AppColors.primary)),
              Slider(
                value: _years,
                min: 1,
                max: 30,
                divisions: 29,
                activeColor: AppColors.primary,
                onChanged: (v) => setState(() => _years = v),
              ),
              const Spacer(),
              ServeCTAButton(
                text: 'Next: Service Area',
                onPressed: () => Get.toNamed(AppRoutes.providerServiceArea),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
