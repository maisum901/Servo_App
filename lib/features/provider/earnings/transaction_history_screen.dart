import 'package:flutter/material.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final earnings = MockData.earnings;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(AppSpacing.lg),
          itemCount: earnings.length,
          itemBuilder: (context, index) {
            final e = earnings[index];
            return Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Job Payment #${e.requestId}', style: AppTypography.titleMedium),
                      Text('+Rs. ${e.gross.toInt()}', style: AppTypography.titleMedium.copyWith(color: AppColors.success)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Platform Commission Deduction', style: AppTypography.bodySmall),
                      Text('-Rs. ${e.commission.toInt()}', style: AppTypography.bodySmall.copyWith(color: AppColors.error)),
                    ],
                  ),
                  const Divider(height: AppSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Net Credited', style: AppTypography.labelLarge),
                      Text('Rs. ${e.net.toInt()}', style: AppTypography.labelLarge.copyWith(color: AppColors.primary)),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
