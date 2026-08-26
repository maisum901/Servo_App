import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/cards/serve_cards.dart';
import '../../../core/widgets/inputs/serve_inputs.dart';

class AllServicesScreen extends StatefulWidget {
  const AllServicesScreen({super.key});

  @override
  State<AllServicesScreen> createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredCategories = MockData.categories
        .where((c) => c.name.toLowerCase().contains(_searchQuery.toLowerCase()) || c.description.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('All Service Categories'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              ServeSearchField(
                hint: 'Search services...',
                onChanged: (val) => setState(() => _searchQuery = val),
              ),
              const SizedBox(height: AppSpacing.lg),
              Expanded(
                child: GridView.builder(
                  itemCount: filteredCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: AppSpacing.md,
                    mainAxisSpacing: AppSpacing.md,
                  ),
                  itemBuilder: (context, index) {
                    final cat = filteredCategories[index];
                    return ServiceCategoryCard(
                      category: cat,
                      onTap: () => Get.toNamed(AppRoutes.serviceDetail.replaceFirst(':serviceId', cat.id)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
