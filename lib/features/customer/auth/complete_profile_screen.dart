import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/inputs/serve_inputs.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _nameController = TextEditingController(text: 'Ahmed Raza');
  final _emailController = TextEditingController(text: 'ahmed.raza@example.com');
  String _selectedCity = 'Karachi';
  String _selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Complete Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryLight,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person, size: 56, color: AppColors.primary),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xxl),

                ServeTextField(
                  controller: _nameController,
                  label: 'Full Name',
                ),
                const SizedBox(height: AppSpacing.lg),

                ServeTextField(
                  controller: _emailController,
                  label: 'Email Address',
                ),
                const SizedBox(height: AppSpacing.lg),

                ServeDropdownField<String>(
                  label: 'City',
                  value: _selectedCity,
                  items: ['Karachi', 'Lahore', 'Islamabad', 'Rawalpindi', 'Faisalabad', 'Peshawar']
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (val) => setState(() => _selectedCity = val ?? 'Karachi'),
                ),
                const SizedBox(height: AppSpacing.lg),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Gender', style: AppTypography.titleMedium),
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: ['Male', 'Female', 'Other'].map((g) {
                    final isSel = _selectedGender == g;
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.md),
                      child: ChoiceChip(
                        label: Text(g),
                        selected: isSel,
                        selectedColor: AppColors.primary,
                        labelStyle: TextStyle(color: isSel ? Colors.white : AppColors.textPrimary),
                        onSelected: (val) => setState(() => _selectedGender = g),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppSpacing.xxxl),

                ServeCTAButton(
                  text: 'Save & Continue',
                  onPressed: () => Get.toNamed(AppRoutes.locationPermission),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
