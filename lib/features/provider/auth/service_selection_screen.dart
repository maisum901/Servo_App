import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class ServiceSelectionScreen extends StatefulWidget {
  const ServiceSelectionScreen({super.key});

  @override
  State<ServiceSelectionScreen> createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
  final List<String> _selectedCategories = ['plumbing'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Select Your Services'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('What services do you provide?', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: ListView.builder(
                  itemCount: MockData.categories.length,
                  itemBuilder: (context, index) {
                    final cat = MockData.categories[index];
                    final isSel = _selectedCategories.contains(cat.id);
                    return CheckboxListTile(
                      title: Text(cat.name, style: AppTypography.titleMedium),
                      subtitle: Text('Visit Fee: Rs. ${cat.visitFee}', style: AppTypography.bodySmall),
                      value: isSel,
                      activeColor: AppColors.primary,
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            _selectedCategories.add(cat.id);
                          } else {
                            _selectedCategories.remove(cat.id);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              ServeCTAButton(
                text: 'Continue to Experience',
                onPressed: () => Get.toNamed(AppRoutes.providerExperience),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
