import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/inputs/serve_inputs.dart';

class ProviderPersonalInfoScreen extends StatefulWidget {
  const ProviderPersonalInfoScreen({super.key});

  @override
  State<ProviderPersonalInfoScreen> createState() => _ProviderPersonalInfoScreenState();
}

class _ProviderPersonalInfoScreenState extends State<ProviderPersonalInfoScreen> {
  final _nameController = TextEditingController(text: 'Tariq Mahmood');
  final _cnicController = TextEditingController(text: '42101-1234567-1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Partner Profile Info'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              ServeTextField(controller: _nameController, label: 'Full Legal Name (as per CNIC)'),
              const SizedBox(height: AppSpacing.lg),
              ServeTextField(
                controller: _cnicController,
                label: 'CNIC Number',
                hint: '42101-XXXXXXX-X',
                keyboardType: TextInputType.number,
              ),
              const Spacer(),
              ServeCTAButton(
                text: 'Select Services Offered',
                onPressed: () => Get.toNamed(AppRoutes.providerServices),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
