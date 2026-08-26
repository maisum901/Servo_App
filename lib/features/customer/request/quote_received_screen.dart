import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class QuoteReceivedScreen extends StatelessWidget {
  final String requestId;

  const QuoteReceivedScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final quote = MockData.activeRequest.quote!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Service Quote Breakdown'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [AppColors.subtleShadow],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ITEMIZED QUOTE', style: AppTypography.labelSmall.copyWith(color: AppColors.primary)),
                    const SizedBox(height: 4),
                    Text('Plumbing Repair & Pipe Replacement', style: AppTypography.titleLarge),
                    const Divider(height: AppSpacing.lg),
                    ...quote.items.map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text('${item.quantity}x ${item.description}', style: AppTypography.bodyMedium),
                              ),
                              Text('Rs. ${item.total.toInt()}', style: AppTypography.labelLarge),
                            ],
                          ),
                        )),
                    const Divider(height: AppSpacing.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal', style: AppTypography.bodySmall),
                        Text('Rs. ${quote.subtotal.toInt()}', style: AppTypography.bodySmall),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Visit & Diagnostic Fee Included', style: AppTypography.bodySmall),
                        Text('Rs. 500', style: AppTypography.bodySmall),
                      ],
                    ),
                    const Divider(height: AppSpacing.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount Payable', style: AppTypography.titleLarge),
                        Text('Rs. ${quote.customerTotal.toInt()}', style: AppTypography.headlineLarge.copyWith(color: AppColors.primary)),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),

              Row(
                children: [
                  Expanded(
                    child: ServeDestructiveButton(
                      text: 'Decline',
                      onPressed: () {
                        Get.snackbar('Quote Declined', 'You can request another quote or cancel.');
                        Get.offAllNamed(AppRoutes.home);
                      },
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    flex: 2,
                    child: ServeCTAButton(
                      text: 'Accept Quote & Start Job',
                      onPressed: () {
                        Get.toNamed(AppRoutes.serviceInProgress.replaceFirst(':requestId', requestId));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
