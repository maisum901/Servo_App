import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class NavigationScreen extends StatelessWidget {
  final String requestId;

  const NavigationScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final req = MockData.activeRequest;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation to Customer'),
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
                      const Icon(Icons.navigation, color: AppColors.primary),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(req.address, style: AppTypography.titleMedium),
                            Text('Distance: 1.8 km • ETA: 12 mins', style: AppTypography.bodySmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: ServeCTAButton(
                    text: 'Mark as Arrived at Doorstep',
                    onPressed: () => Get.toNamed(AppRoutes.providerArrivedAction.replaceFirst(':requestId', requestId)),
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
