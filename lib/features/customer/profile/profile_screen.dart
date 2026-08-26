import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.to.currentUser.value;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.xl),
                color: AppColors.primary,
                child: Column(
                  children: [
                    ServeAvatar(
                      name: user?.name ?? 'Ahmed Raza',
                      imageUrl: user?.avatarUrl,
                      size: AvatarSize.xl,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      user?.name ?? 'Ahmed Raza',
                      style: AppTypography.headlineLarge.copyWith(color: Colors.white),
                    ),
                    Text(
                      '${user?.phone} • ${user?.city}',
                      style: AppTypography.bodySmall.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  children: [
                    _buildMenuItem(Icons.person_outline, 'Personal Information', () => Get.toNamed(AppRoutes.personalInfo)),
                    _buildMenuItem(Icons.location_on_outlined, 'Saved Addresses', () => Get.toNamed(AppRoutes.savedAddresses)),
                    _buildMenuItem(Icons.notifications_outlined, 'Notifications', () => Get.toNamed(AppRoutes.notifications)),
                    _buildMenuItem(Icons.help_outline, 'Help & Support', () => Get.toNamed(AppRoutes.help)),
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
