import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/cards/serve_cards.dart';
import '../../../core/widgets/ui/serve_ui.dart';
import 'new_request_overlay.dart';

class ProviderDashboardScreen extends StatefulWidget {
  const ProviderDashboardScreen({super.key});

  @override
  State<ProviderDashboardScreen> createState() => _ProviderDashboardScreenState();
}

class _ProviderDashboardScreenState extends State<ProviderDashboardScreen> {
  bool _isOnline = true;

  @override
  Widget build(BuildContext context) {
    final provider = MockData.providers.first;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: [
            ServeAvatar(name: provider.name, imageUrl: provider.avatarUrl, size: AvatarSize.sm),
            const SizedBox(width: AppSpacing.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(provider.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text(provider.serviceArea, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => Get.toNamed(AppRoutes.providerNotifications),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Prominent Online / Offline Toggle Header Card
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: _isOnline ? AppColors.success.withValues(alpha: 0.12) : AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: _isOnline ? AppColors.success : AppColors.border, width: 1.5),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: _isOnline ? AppColors.success : AppColors.textMuted,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _isOnline ? 'You Are ONLINE' : 'You Are OFFLINE',
                            style: AppTypography.titleLarge.copyWith(
                              color: _isOnline ? AppColors.success : AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            _isOnline ? 'Receiving job requests nearby' : 'Turn online to receive new requests',
                            style: AppTypography.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    ServeToggle(
                      value: _isOnline,
                      onChanged: (val) => setState(() => _isOnline = val),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Today Earnings Summary Widget
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.providerEarnings),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                    boxShadow: [AppColors.subtleShadow],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("TODAY'S NET EARNINGS", style: AppTypography.labelSmall.copyWith(color: Colors.white70)),
                          const SizedBox(height: 4),
                          Text('Rs. 5,456', style: AppTypography.displayLarge.copyWith(color: Colors.white)),
                        ],
                      ),
                      const Icon(Icons.chevron_right, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Test Trigger for 20s High Priority Overlay
              if (_isOnline) ...[
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (ctx) => const NewRequestOverlay(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: AppColors.textPrimary,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.notifications_active),
                  label: const Text('Simulate Incoming Job Alert (20s Overlay)'),
                ),
                const SizedBox(height: AppSpacing.xl),
              ],

              Text('Active & Assigned Requests', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),

              RequestCard(
                request: MockData.activeRequest,
                onTap: () => Get.toNamed(AppRoutes.providerRequestDetails.replaceFirst(':requestId', MockData.activeRequest.id)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
        onTap: (idx) {
          if (idx == 1) Get.toNamed(AppRoutes.providerEarnings);
          if (idx == 2) Get.toNamed(AppRoutes.providerProfile);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), activeIcon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), activeIcon: Icon(Icons.account_balance_wallet), label: 'Earnings'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
