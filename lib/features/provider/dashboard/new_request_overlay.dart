import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class NewRequestOverlay extends StatefulWidget {
  const NewRequestOverlay({super.key});

  @override
  State<NewRequestOverlay> createState() => _NewRequestOverlayState();
}

class _NewRequestOverlayState extends State<NewRequestOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  int _secondsLeft = 20;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..forward();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        _timer.cancel();
        Get.back();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final req = MockData.activeRequest;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusSheet)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('NEW SERVICE REQUEST 🚨', style: AppTypography.labelSmall.copyWith(color: AppColors.error, fontWeight: FontWeight.w700)),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: AnimatedBuilder(
                      animation: _animController,
                      builder: (context, child) => CircularProgressIndicator(
                        value: 1.0 - _animController.value,
                        strokeWidth: 3,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.error),
                      ),
                    ),
                  ),
                  Text('$_secondsLeft', style: AppTypography.titleLarge.copyWith(color: AppColors.error)),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          Text(req.categoryName, style: AppTypography.headlineLarge),
          Text(req.problemType, style: AppTypography.titleMedium),
          Text(req.address, style: AppTypography.bodySmall),
          const SizedBox(height: AppSpacing.xl),

          Row(
            children: [
              Expanded(
                child: ServeDestructiveButton(
                  text: 'Decline',
                  onPressed: () => Get.back(),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                flex: 2,
                child: ServeCTAButton(
                  text: 'Accept Job (Rs. ${req.visitFee})',
                  onPressed: () {
                    Get.back();
                    Get.toNamed(AppRoutes.providerNavigate.replaceFirst(':requestId', req.id));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
