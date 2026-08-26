import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/buttons/serve_buttons.dart';
import '../../../../core/widgets/cards/serve_cards.dart';
import '../../../../core/widgets/inputs/serve_inputs.dart';
import '../../../../core/widgets/ui/serve_ui.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.to.currentUser.value;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ServeAvatar(
                        name: user?.name ?? 'Ahmed Raza',
                        imageUrl: user?.avatarUrl,
                        size: AvatarSize.md,
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hello, ${user?.name.split(' ')[0] ?? 'Ahmed'} 👋', style: AppTypography.titleLarge),
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: AppColors.error, size: 14),
                              const SizedBox(width: 2),
                              Text('Block 6, PECHS, Karachi', style: AppTypography.bodySmall),
                              const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.textMuted),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_outlined, size: 26),
                        onPressed: () => Get.toNamed(AppRoutes.notifications),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: AppColors.error,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              // Search Bar
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.services),
                child: const AbsorbPointer(
                  child: ServeSearchField(
                    hint: 'Search plumbing, AC, mechanic...',
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Active Request Banner Card
              Obx(() {
                final activeReq = controller.activeRequest.value;
                if (activeReq == null) return const SizedBox.shrink();
                return Container(
                  margin: const EdgeInsets.only(bottom: AppSpacing.lg),
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                    border: Border.all(color: AppColors.border),
                    boxShadow: [AppColors.subtleShadow],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ACTIVE REQUEST', style: AppTypography.labelSmall.copyWith(color: AppColors.accent, fontWeight: FontWeight.w700)),
                                ServeStatusBadge(status: activeReq.status),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text('${activeReq.categoryName} • #${activeReq.id}', style: AppTypography.titleMedium),
                            Text(activeReq.problemType, style: AppTypography.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      ServeCTAButton(
                        text: 'Track',
                        size: ButtonSize.small,
                        fullWidth: false,
                        onPressed: () => Get.toNamed(AppRoutes.liveTracking.replaceFirst(':requestId', activeReq.id)),
                      ),
                    ],
                  ),
                );
              }),

              // Emergency Services Banner
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.emergency),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.error,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                    boxShadow: [AppColors.subtleShadow],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Emergency Services 🚨',
                              style: AppTypography.titleLarge.copyWith(color: Colors.white),
                            ),
                            Text(
                              'Immediate dispatch in 15-20 mins',
                              style: AppTypography.bodySmall.copyWith(color: Colors.white.withValues(alpha: 0.9)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Get Help',
                          style: AppTypography.labelSmall.copyWith(color: AppColors.error, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Categories Grid
              SectionHeader(
                title: 'What do you need?',
                actionText: 'All Services →',
                onActionTap: () => Get.toNamed(AppRoutes.services),
              ),
              const SizedBox(height: AppSpacing.md),
              Obx(() => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.categories.take(8).length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: AppSpacing.sm,
                      mainAxisSpacing: AppSpacing.sm,
                    ),
                    itemBuilder: (context, index) {
                      final cat = controller.categories[index];
                      return ServiceCategoryCard(
                        category: cat,
                        compact: true,
                        onTap: () => Get.toNamed(AppRoutes.serviceDetail.replaceFirst(':serviceId', cat.id)),
                      );
                    },
                  )),
              const SizedBox(height: AppSpacing.xl),

              // Top Rated Providers Horizontal Scroll
              SectionHeader(
                title: 'Top Rated Professionals',
                actionText: null,
              ),
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                height: 140,
                child: Obx(() => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.topProviders.length,
                      separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
                      itemBuilder: (context, index) {
                        final provider = controller.topProviders[index];
                        return ProviderCard(provider: provider);
                      },
                    )),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Recent Requests Section
              SectionHeader(
                title: 'Recent Requests',
                actionText: 'View All',
                onActionTap: () => Get.toNamed(AppRoutes.requests),
              ),
              const SizedBox(height: AppSpacing.md),
              Obx(() => Column(
                    children: controller.requestsHistory
                        .take(2)
                        .map((req) => RequestCard(
                              request: req,
                              onTap: () => Get.toNamed(AppRoutes.requestDetail.replaceFirst(':requestId', req.id)),
                            ))
                        .toList(),
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) Get.toNamed(AppRoutes.requests);
          if (index == 2) Get.toNamed(AppRoutes.messages);
          if (index == 3) Get.toNamed(AppRoutes.profile);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), activeIcon: Icon(Icons.assignment), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), activeIcon: Icon(Icons.chat), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
