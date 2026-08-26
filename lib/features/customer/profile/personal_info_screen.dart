import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/inputs/serve_inputs.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    final user = AuthService.to.currentUser.value;
    _nameController = TextEditingController(text: user?.name ?? 'Ahmed Raza');
    _emailController = TextEditingController(text: user?.email ?? 'ahmed.raza@example.com');
    _phoneController = TextEditingController(text: user?.phone ?? '+92 300 9876543');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Personal Information'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              ServeTextField(controller: _nameController, label: 'Full Name'),
              const SizedBox(height: AppSpacing.lg),
              ServeTextField(controller: _emailController, label: 'Email Address'),
              const SizedBox(height: AppSpacing.lg),
              ServePhoneField(controller: _phoneController),
              const Spacer(),
              ServeCTAButton(
                text: 'Save Changes',
                onPressed: () {
                  Get.back();
                  Get.snackbar('Profile Updated', 'Your changes have been saved.');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
