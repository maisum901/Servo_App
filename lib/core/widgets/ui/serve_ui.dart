import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';
import '../../../models/service_request_model.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

enum AvatarSize { xs, sm, md, lg, xl }

class ServeAvatar extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final AvatarSize size;

  const ServeAvatar({
    super.key,
    this.imageUrl,
    required this.name,
    this.size = AvatarSize.md,
  });

  double _getDiameter() {
    switch (size) {
      case AvatarSize.xs:
        return 24.0;
      case AvatarSize.sm:
        return 36.0;
      case AvatarSize.md:
        return 48.0;
      case AvatarSize.lg:
        return 64.0;
      case AvatarSize.xl:
        return 88.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final diameter = _getDiameter();
    final initials = name.isNotEmpty ? name.substring(0, 1).toUpperCase() : 'P';

    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.border, width: 1.5),
        image: imageUrl != null && imageUrl!.startsWith('http')
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl == null || !imageUrl!.startsWith('http')
          ? Center(
              child: Text(
                initials,
                style: AppTypography.titleLarge.copyWith(
                  color: AppColors.primary,
                  fontSize: diameter * 0.4,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          : null,
    );
  }
}

enum BadgeVariant { success, warning, error, info, navy, outline }

class ServeBadge extends StatelessWidget {
  final String label;
  final BadgeVariant variant;

  const ServeBadge({
    super.key,
    required this.label,
    this.variant = BadgeVariant.navy,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    Border? border;

    switch (variant) {
      case BadgeVariant.success:
        bg = AppColors.success.withOpacity(0.12);
        fg = AppColors.success;
        break;
      case BadgeVariant.warning:
        bg = AppColors.warning.withOpacity(0.12);
        fg = AppColors.warning;
        break;
      case BadgeVariant.error:
        bg = AppColors.error.withOpacity(0.12);
        fg = AppColors.error;
        break;
      case BadgeVariant.info:
        bg = AppColors.info.withOpacity(0.12);
        fg = AppColors.info;
        break;
      case BadgeVariant.navy:
        bg = AppColors.primaryLight;
        fg = AppColors.primary;
        break;
      case BadgeVariant.outline:
        bg = Colors.transparent;
        fg = AppColors.textSecondary;
        border = Border.all(color: AppColors.border);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusChip),
        border: border,
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: fg,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ServeStatusBadge extends StatelessWidget {
  final RequestStatus status;

  const ServeStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    String text = 'Pending';
    BadgeVariant variant = BadgeVariant.navy;

    switch (status) {
      case RequestStatus.pending:
      case RequestStatus.searching:
        text = 'Searching Pro';
        variant = BadgeVariant.warning;
        break;
      case RequestStatus.accepted:
        text = 'Accepted';
        variant = BadgeVariant.info;
        break;
      case RequestStatus.providerOnWay:
        text = 'On the Way';
        variant = BadgeVariant.navy;
        break;
      case RequestStatus.arrived:
        text = 'Arrived';
        variant = BadgeVariant.success;
        break;
      case RequestStatus.inspecting:
        text = 'Inspecting';
        variant = BadgeVariant.info;
        break;
      case RequestStatus.quoteShared:
        text = 'Quote Shared';
        variant = BadgeVariant.warning;
        break;
      case RequestStatus.quoteAccepted:
      case RequestStatus.inProgress:
        text = 'In Progress';
        variant = BadgeVariant.navy;
        break;
      case RequestStatus.completed:
        text = 'Completed';
        variant = BadgeVariant.success;
        break;
      case RequestStatus.cancelled:
        text = 'Cancelled';
        variant = BadgeVariant.error;
        break;
      case RequestStatus.expired:
        text = 'Expired';
        variant = BadgeVariant.outline;
        break;
    }

    return ServeBadge(label: text, variant: variant);
  }
}

class StarRatingWidget extends StatelessWidget {
  final double rating;
  final double size;
  final bool interactive;
  final bool isInteractive;
  final ValueChanged<double>? onRatingChanged;

  const StarRatingWidget({
    super.key,
    required this.rating,
    this.size = 18,
    this.interactive = false,
    this.isInteractive = false,
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1;
        IconData iconData;
        if (rating >= starValue) {
          iconData = Icons.star;
        } else if (rating >= starValue - 0.5) {
          iconData = Icons.star_half;
        } else {
          iconData = Icons.star_border;
        }

        return GestureDetector(
          onTap: interactive && onRatingChanged != null
              ? () => onRatingChanged!(starValue.toDouble())
              : null,
          child: Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: Icon(
              iconData,
              size: size,
              color: AppColors.accent,
            ),
          ),
        );
      }),
    );
  }
}

class VerifiedBadge extends StatelessWidget {
  final bool compact;

  const VerifiedBadge({super.key, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.verified, color: AppColors.info, size: 16),
        if (!compact) ...[
          const SizedBox(width: 4),
          Text(
            'Verified',
            style: AppTypography.labelSmall.copyWith(color: AppColors.info),
          ),
        ],
      ],
    );
  }
}

class StepIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final List<String>? labels;

  const StepIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        final isActive = index <= currentStep;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 4,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}

class ServeProgressBar extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final Color color;

  const ServeProgressBar({
    super.key,
    required this.progress,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

class SkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const SkeletonLoader({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.borderRadius = AppSpacing.radiusCard,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.border,
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class ServeToast {
  static void show(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: AppTypography.bodyMedium.copyWith(color: Colors.white)),
        backgroundColor: isError ? AppColors.error : AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        ),
        margin: const EdgeInsets.all(AppSpacing.lg),
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const EmptyStateWidget({
    super.key,
    this.icon = Icons.inbox_outlined,
    required this.title,
    required this.message,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.primaryLight,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 48, color: AppColors.primary),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(title, style: AppTypography.titleLarge, textAlign: TextAlign.center),
          const SizedBox(height: AppSpacing.sm),
          Text(
            message,
            style: AppTypography.bodyMedium,
            textAlign: TextAlign.center,
          ),
          if (buttonText != null && onButtonPressed != null) ...[
            const SizedBox(height: AppSpacing.xl),
            ElevatedButton(
              onPressed: onButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                ),
              ),
              child: Text(buttonText!),
            ),
          ],
        ],
      ),
    ),
  );
}
}

class ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorStateWidget({
    super.key,
    this.message = 'Something went wrong. Please check your connection.',
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      icon: Icons.error_outline,
      title: 'Unable to Load',
      message: message,
      buttonText: 'Try Again',
      onButtonPressed: onRetry,
    );
  }
}

class OfflineWidget extends StatelessWidget {
  final VoidCallback? onRetry;

  const OfflineWidget({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
      color: AppColors.error,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.wifi_off, color: Colors.white, size: 18),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'No internet connection',
                style: AppTypography.bodySmall.copyWith(color: Colors.white),
              ),
            ],
          ),
          if (onRetry != null)
            GestureDetector(
              onTap: onRetry,
              child: Text(
                'Retry',
                style: AppTypography.labelSmall.copyWith(color: Colors.white, decoration: TextDecoration.underline),
              ),
            ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText = 'See all →',
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTypography.titleLarge),
        if (actionText != null && onActionTap != null)
          InkWell(
            onTap: onActionTap,
            child: Text(
              actionText!,
              style: AppTypography.labelLarge.copyWith(color: AppColors.primary),
            ),
          ),
      ],
    );
  }
}

class ServeToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const ServeToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: value,
      onChanged: onChanged,
      activeColor: Colors.white,
      activeTrackColor: AppColors.success,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: AppColors.border,
    );
  }
}

class MapPlaceholderWidget extends StatelessWidget {
  final LatLng customerLocation;
  final LatLng? providerLocation;
  final String? etaText;
  final bool isFindingProvider;
  final double height;

  const MapPlaceholderWidget({
    super.key,
    this.customerLocation = const LatLng(24.8607, 67.0011),
    this.providerLocation,
    this.etaText,
    this.isFindingProvider = false,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
      children: [
        // Google Maps view or fallback canvas map simulation
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: customerLocation,
            zoom: 14.5,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('customer'),
              position: customerLocation,
              infoWindow: const InfoWindow(title: 'Your Location'),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
            ),
            if (providerLocation != null)
              Marker(
                markerId: const MarkerId('provider'),
                position: providerLocation!,
                infoWindow: const InfoWindow(title: 'Service Provider'),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
              ),
          },
          polylines: providerLocation != null
              ? {
                  Polyline(
                    polylineId: const PolylineId('route'),
                    points: [customerLocation, providerLocation!],
                    color: AppColors.primary,
                    width: 4,
                  ),
                }
              : {},
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
        ),
        if (etaText != null)
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [AppColors.subtleShadow],
              ),
              child: Row(
                children: [
                  const Icon(Icons.directions_car, color: AppColors.accent, size: 18),
                  const SizedBox(width: 6),
                  Text(
                    'ETA: $etaText',
                    style: AppTypography.labelLarge.copyWith(color: AppColors.textPrimary),
                  ),
                ],
              ),
            ),
          ),
      ],
    ),
  );
}
}
