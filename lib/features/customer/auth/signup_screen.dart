import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/inputs/serve_inputs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Join ServePro Today 🚀', style: AppTypography.headlineLarge),
                  const SizedBox(height: AppSpacing.xs),
                  Text('Book trusted experts near you in a few taps', style: AppTypography.bodyMedium),
                  const SizedBox(height: AppSpacing.xxl),

                  ServeTextField(
                    controller: _nameController,
                    label: 'Full Name',
                    hint: 'e.g. Ahmed Raza',
                    validator: (v) => v == null || v.isEmpty ? 'Please enter name' : null,
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  ServePhoneField(controller: _phoneController),
                  const SizedBox(height: AppSpacing.lg),

                  ServeTextField(
                    controller: _emailController,
                    label: 'Email Address (Optional)',
                    hint: 'name@example.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  ServePasswordField(
                    controller: _passwordController,
                    label: 'Password',
                    hint: 'Minimum 6 characters',
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  Row(
                    children: [
                      Checkbox(
                        value: _agreedToTerms,
                        activeColor: AppColors.primary,
                        onChanged: (val) => setState(() => _agreedToTerms = val ?? false),
                      ),
                      Expanded(
                        child: Text(
                          'I agree to the Terms of Service & Privacy Policy',
                          style: AppTypography.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xl),

                  ServeCTAButton(
                    text: 'Continue',
                    onPressed: () {
                      if (_formKey.currentState!.validate() && _agreedToTerms) {
                        Get.toNamed(AppRoutes.verifyOtp);
                      }
                    },
                  ),
                  const SizedBox(height: AppSpacing.xxl),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ', style: AppTypography.bodyMedium),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.login),
                        child: Text('Sign In', style: AppTypography.titleMedium.copyWith(color: AppColors.primary)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
