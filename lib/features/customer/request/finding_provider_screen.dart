import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class FindingProviderScreen extends StatefulWidget {
  final String requestId;

  const FindingProviderScreen({super.key, required this.requestId});

  @override
  State<FindingProviderScreen> createState() => _FindingProviderScreenState();
}

class _FindingProviderScreenState extends State<FindingProviderScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.providerFound.replaceFirst(':requestId', widget.requestId));
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MapPlaceholderWidget(height: double.infinity),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                      boxShadow: [AppColors.subtleShadow],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2.5),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Connecting to Nearby Pros...', style: AppTypography.titleMedium),
                              Text('Searching within 3.5 km radius', style: AppTypography.bodySmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ServeDestructiveButton(
                    text: 'Cancel Request',
                    onPressed: () => Get.offAllNamed(AppRoutes.home),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
