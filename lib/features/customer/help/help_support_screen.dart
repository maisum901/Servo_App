import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Frequently Asked Questions', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),

              _buildFaqItem('How is the visit fee calculated?', 'The visit fee (Rs. 400-800 depending on category) covers technician arrival and initial diagnostic inspection.'),
              _buildFaqItem('What if I am unhappy with the quote?', 'You can decline any quote without obligation to proceed with repair.'),
              _buildFaqItem('Are providers background checked?', 'Yes! All ServePro providers undergo CNIC verification and police clearance checks.'),

              const Spacer(),
              ServeCTAButton(
                text: 'Contact 24/7 Helpline (+92 21 111-SERVE)',
                icon: Icons.phone_in_talk,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(color: AppColors.border),
      ),
      child: ExpansionTile(
        title: Text(question, style: AppTypography.titleMedium),
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Text(answer, style: AppTypography.bodySmall),
          ),
        ],
      ),
    );
  }
}
