import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class RequestDetailScreen extends StatelessWidget {
  final String requestId;

  const RequestDetailScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final req = MockData.sampleRequests.firstWhere(
      (r) => r.id == requestId,
      orElse: () => MockData.activeRequest,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Request #${req.id}'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(req.categoryName, style: AppTypography.headlineMedium),
                        ServeStatusBadge(status: req.status),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(req.problemType, style: AppTypography.titleMedium),
                    const SizedBox(height: AppSpacing.sm),
                    Text(req.description, style: AppTypography.bodySmall),
                    const Divider(height: AppSpacing.lg),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 16, color: AppColors.textMuted),
                        const SizedBox(width: 4),
                        Expanded(child: Text(req.address, style: AppTypography.bodySmall)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Provider Card if assigned
              if (req.provider != null) ...[
                Text('Assigned Technician', style: AppTypography.titleLarge),
                const SizedBox(height: AppSpacing.md),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      ServeAvatar(
                        name: req.provider!.name,
                        imageUrl: req.provider!.avatarUrl,
                        size: AvatarSize.lg,
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(req.provider!.name, style: AppTypography.titleLarge),
                            Row(
                              children: [
                                StarRatingWidget(rating: req.provider!.rating, size: 14),
                                const SizedBox(width: 4),
                                Text('${req.provider!.rating}', style: AppTypography.bodySmall),
                              ],
                            ),
                            Text(req.provider!.phone, style: AppTypography.bodySmall),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chat, color: AppColors.primary),
                        onPressed: () => Get.toNamed(AppRoutes.chat.replaceFirst(':chatId', req.provider!.id)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
              ],

              // Itemized Receipt Table if quote exists
              if (req.quote != null) ...[
                Text('Billing & Payment Breakdown', style: AppTypography.titleLarge),
                const SizedBox(height: AppSpacing.md),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    children: [
                      ...req.quote!.items.map((item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text('${item.quantity}x ${item.description}', style: AppTypography.bodyMedium)),
                                Text('Rs. ${item.total.toInt()}', style: AppTypography.labelLarge),
                              ],
                            ),
                          )),
                      const Divider(height: AppSpacing.lg),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Paid', style: AppTypography.titleMedium),
                          Text('Rs. ${req.quote!.customerTotal.toInt()}', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
              ],

              ServeOutlineButton(
                text: 'Download PDF Receipt',
                icon: Icons.download_rounded,
                onPressed: () {
                  Get.snackbar('Receipt Downloaded', 'Receipt saved to your downloads folder.');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
