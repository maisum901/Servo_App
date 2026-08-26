import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/inputs/serve_inputs.dart';

class ProviderLoginScreen extends StatefulWidget {
  const ProviderLoginScreen({super.key});

  @override
  State<ProviderLoginScreen> createState() => _ProviderLoginScreenState();
}

class _ProviderLoginScreenState extends State<ProviderLoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Partner Sign In'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome Back Partner 🔧', style: AppTypography.headlineLarge),
              const SizedBox(height: AppSpacing.xs),
              Text('Sign in to access your jobs & earnings dashboard', style: AppTypography.bodyMedium),
              const SizedBox(height: AppSpacing.xxl),

              ServePhoneField(controller: _phoneController),
              const SizedBox(height: AppSpacing.lg),

              ServePasswordField(controller: _passwordController, label: 'Password'),
              const SizedBox(height: AppSpacing.xxl),

              ServeCTAButton(
                text: 'Partner Sign In',
                onPressed: () => Get.offAllNamed(AppRoutes.providerDashboard),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
