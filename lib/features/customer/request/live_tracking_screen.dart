import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class LiveTrackingScreen extends StatelessWidget {
  final String requestId;

  const LiveTrackingScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final provider = MockData.providers.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Provider Tracking'),
      ),
      body: Stack(
        children: [
          const MapPlaceholderWidget(height: double.infinity),
          SafeArea(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(AppSpacing.lg),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                    boxShadow: [AppColors.subtleShadow],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.directions_car, color: AppColors.primary),
                      const SizedBox(width: AppSpacing.md),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Provider On The Way', style: AppTypography.titleMedium),
                          Text('ETA: 12 minutes (1.8 km away)', style: AppTypography.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusSheet)),
                    boxShadow: [AppColors.subtleShadow],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          ServeAvatar(name: provider.name, imageUrl: provider.avatarUrl, size: AvatarSize.md),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(provider.name, style: AppTypography.titleLarge),
                                Text('Plumbing Specialist • ${provider.phone}', style: AppTypography.bodySmall),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.phone, color: AppColors.primary),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.chat, color: AppColors.primary),
                            onPressed: () => Get.toNamed(AppRoutes.chat.replaceFirst(':chatId', 'p101')),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      ServeCTAButton(
                        text: 'Simulate Provider Arrival',
                        onPressed: () => Get.toNamed(AppRoutes.providerArrived.replaceFirst(':requestId', requestId)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
