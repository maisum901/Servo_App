import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/inputs/serve_inputs.dart';

class ProviderSignUpScreen extends StatefulWidget {
  const ProviderSignUpScreen({super.key});

  @override
  State<ProviderSignUpScreen> createState() => _ProviderSignUpScreenState();
}

class _ProviderSignUpScreenState extends State<ProviderSignUpScreen> {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Partner Registration'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Become a Partner 🛠️', style: AppTypography.headlineLarge),
              const SizedBox(height: AppSpacing.xs),
              Text('Enter your mobile number to get started with verification', style: AppTypography.bodyMedium),
              const SizedBox(height: AppSpacing.xxl),

              ServePhoneField(controller: _phoneController),
              const Spacer(),

              ServeCTAButton(
                text: 'Send Verification Code',
                onPressed: () => Get.toNamed(AppRoutes.providerVerifyOtp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
