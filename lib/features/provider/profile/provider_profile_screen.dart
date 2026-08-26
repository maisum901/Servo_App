import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class ProviderProfileScreen extends StatelessWidget {
  const ProviderProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = MockData.providers.first;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.xl),
                color: AppColors.primary,
                child: Column(
                  children: [
                    ServeAvatar(
                      name: provider.name,
                      imageUrl: provider.avatarUrl,
                      size: AvatarSize.xl,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          provider.name,
                          style: AppTypography.headlineLarge.copyWith(color: Colors.white),
                        ),
                        const SizedBox(width: 4),
                        const VerifiedBadge(compact: true),
                      ],
                    ),
                    Text(
                      '${provider.experience} • ${provider.serviceArea}',
                      style: AppTypography.bodySmall.copyWith(color: Colors.white70),
                    ),
                    const SizedBox(height: AppSpacing.lg),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStat('Rating', '${provider.rating} ★'),
                        _buildStat('Jobs Done', '${provider.jobsCompleted}'),
                        _buildStat('Accept Rate', '98%'),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Services Offered', style: AppTypography.titleMedium),
                    const SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.sm,
                      children: const [
                        Chip(label: Text('Plumbing')),
                        Chip(label: Text('Appliance Repair')),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),

                    _buildMenuItem(Icons.star_outline, 'Customer Reviews & Ratings', () => Get.toNamed(AppRoutes.providerReviews)),
                    _buildMenuItem(Icons.map_outlined, 'Service Area Radius', () => Get.toNamed(AppRoutes.providerServiceArea)),
                    _buildMenuItem(Icons.description_outlined, 'Uploaded Documents & Licenses', () => Get.toNamed(AppRoutes.providerDocuments)),
                    _buildMenuItem(Icons.account_balance_outlined, 'Payout Bank Settings', () => Get.toNamed(AppRoutes.providerEarnings)),
                    _buildMenuItem(Icons.swap_horiz, 'Switch App Role', () => Get.offAllNamed(AppRoutes.roleSelect)),

                    const Divider(height: AppSpacing.xl),

                    ServeDestructiveButton(
                      text: 'Log Out',
                      icon: Icons.logout,
                      onPressed: () => Get.offAllNamed(AppRoutes.roleSelect),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String title, String value) {
    return Column(
      children: [
        Text(value, style: AppTypography.headlineMedium.copyWith(color: AppColors.accent)),
        Text(title, style: AppTypography.bodySmall.copyWith(color: Colors.white70)),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(color: AppColors.border),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: AppTypography.titleMedium),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textMuted),
        onTap: onTap,
      ),
    );
  }
}
