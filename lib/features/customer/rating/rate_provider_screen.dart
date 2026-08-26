import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/inputs/serve_inputs.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class RateProviderScreen extends StatefulWidget {
  final String requestId;

  const RateProviderScreen({super.key, required this.requestId});

  @override
  State<RateProviderScreen> createState() => _RateProviderScreenState();
}

class _RateProviderScreenState extends State<RateProviderScreen> {
  double _overallRating = 5.0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = MockData.providers.first;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Rate Your Experience'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ServeAvatar(name: provider.name, imageUrl: provider.avatarUrl, size: AvatarSize.xl),
                const SizedBox(height: AppSpacing.md),
                Text(provider.name, style: AppTypography.headlineMedium),
                Text('Plumbing Technician', style: AppTypography.bodySmall),
                const SizedBox(height: AppSpacing.xl),

                Text('How was your overall service?', style: AppTypography.titleLarge),
                const SizedBox(height: AppSpacing.md),
                StarRatingWidget(
                  rating: _overallRating,
                  size: 36,
                  isInteractive: true,
                  onRatingChanged: (r) => setState(() => _overallRating = r),
                ),
                const SizedBox(height: AppSpacing.xl),

                ServeMultilineField(
                  controller: _reviewController,
                  label: 'Write a Review (Optional)',
                  hint: 'Share details of your experience...',
                  maxLines: 4,
                ),
                const SizedBox(height: AppSpacing.xxl),

                ServeCTAButton(
                  text: 'Submit Review',
                  onPressed: () => Get.toNamed(AppRoutes.reviewSubmitted.replaceFirst(':requestId', widget.requestId)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
