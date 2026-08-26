import 'package:flutter/material.dart';
import '../../../models/earnings_model.dart';
import '../../../models/notification_model.dart';
import '../../../models/quote_model.dart';
import '../../../models/service_category_model.dart';
import '../../../models/service_provider_model.dart';
import '../../../models/service_request_model.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import '../ui/serve_ui.dart';

class ServiceCategoryCard extends StatelessWidget {
  final ServiceCategoryModel category;
  final VoidCallback? onTap;
  final bool compact;

  const ServiceCategoryCard({
    super.key,
    required this.category,
    this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(compact ? AppSpacing.xs : AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          border: Border.all(color: AppColors.border, width: 1),
          boxShadow: [AppColors.subtleShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: category.color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIconData(category.icon),
                size: compact ? 22 : 28,
                color: category.color,
              ),
            ),
            SizedBox(height: compact ? AppSpacing.xs : AppSpacing.sm),
            Text(
              category.name,
              style: compact ? AppTypography.bodySmall.copyWith(fontWeight: FontWeight.w600) : AppTypography.titleMedium,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (!compact) ...[
              const SizedBox(height: 2),
              Text(
                'Rs. ${category.visitFee} Visit',
                style: AppTypography.labelSmall.copyWith(color: AppColors.textMuted),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String name) {
    switch (name) {
      case 'plumbing':
        return Icons.water_drop;
      case 'electrical_services':
        return Icons.bolt;
      case 'ac_unit':
        return Icons.ac_unit;
      case 'build':
        return Icons.build;
      case 'format_paint':
        return Icons.format_paint;
      case 'cleaning_services':
        return Icons.cleaning_services;
      case 'local_shipping':
        return Icons.local_shipping;
      case 'fire_truck':
        return Icons.fire_truck;
      case 'carpenter':
        return Icons.carpenter;
      case 'lock':
        return Icons.lock;
      case 'home_repair_service':
        return Icons.home_repair_service;
      case 'airport_shuttle':
        return Icons.airport_shuttle;
      default:
        return Icons.handyman;
    }
  }
}

class ProviderCard extends StatelessWidget {
  final ServiceProviderModel provider;
  final VoidCallback? onTap;

  const ProviderCard({
    super.key,
    required this.provider,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(color: AppColors.border),
        boxShadow: [AppColors.subtleShadow],
      ),
      child: Row(
        children: [
          ServeAvatar(
            name: provider.name,
            imageUrl: provider.avatarUrl,
            size: AvatarSize.md,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        provider.name,
                        style: AppTypography.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (provider.isVerified) const VerifiedBadge(compact: true),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    StarRatingWidget(rating: provider.rating, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      '${provider.rating}',
                      style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${provider.jobsCompleted} Jobs • ${provider.experience}',
                  style: AppTypography.labelSmall.copyWith(color: AppColors.textMuted),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final ServiceRequestModel request;
  final VoidCallback? onTap;

  const RequestCard({
    super.key,
    required this.request,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          border: Border.all(color: AppColors.border),
          boxShadow: [AppColors.subtleShadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#${request.id} • ${request.categoryName}',
                  style: AppTypography.titleMedium,
                ),
                ServeStatusBadge(status: request.status),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              request.problemType,
              style: AppTypography.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textMuted),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    request.address,
                    style: AppTypography.labelSmall.copyWith(color: AppColors.textMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'Rs. ${request.visitFee}',
                  style: AppTypography.labelLarge.copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuoteItemCard extends StatelessWidget {
  final QuoteItemModel item;

  const QuoteItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${item.quantity}x ${item.description}',
              style: AppTypography.bodyMedium,
            ),
          ),
          Text(
            'Rs. ${item.total.toInt()}',
            style: AppTypography.labelLarge,
          ),
        ],
      ),
    );
  }
}

class EarningsCard extends StatelessWidget {
  final EarningsModel earnings;

  const EarningsCard({super.key, required this.earnings});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(earnings.serviceName, style: AppTypography.titleMedium),
              Text(earnings.period, style: AppTypography.bodySmall),
            ],
          ),
          Text(
            '+Rs. ${earnings.net.toInt()}',
            style: AppTypography.titleLarge.copyWith(color: AppColors.success),
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onTap;

  const NotificationItem({
    super.key,
    required this.notification,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColors.primaryLight,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.notifications_active_outlined, color: AppColors.primary, size: 20),
      ),
      title: Text(notification.title, style: AppTypography.titleMedium),
      subtitle: Text(notification.body, style: AppTypography.bodySmall),
    );
  }
}
