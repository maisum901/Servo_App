import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

enum ButtonSize { small, medium, large }

class _ButtonHeight {
  static double get(ButtonSize size) {
    switch (size) {
      case ButtonSize.small:
        return 36.0;
      case ButtonSize.medium:
        return 48.0;
      case ButtonSize.large:
        return 56.0;
    }
  }

  static TextStyle getTextStyle(ButtonSize size) {
    switch (size) {
      case ButtonSize.small:
        return AppTypography.labelSmall.copyWith(fontWeight: FontWeight.w600);
      case ButtonSize.medium:
        return AppTypography.labelLarge;
      case ButtonSize.large:
        return AppTypography.titleMedium;
    }
  }
}

class ServePrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final IconData? icon;
  final bool fullWidth;

  const ServePrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final height = _ButtonHeight.get(size);
    final textStyle = _ButtonHeight.getTextStyle(size);

    final button = SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
          disabledForegroundColor: Colors.white.withOpacity(0.7),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: size == ButtonSize.small ? 16 : 20),
              const SizedBox(width: AppSpacing.sm),
            ],
            Text(text, style: textStyle.copyWith(color: Colors.white)),
          ],
        ),
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}

class ServeSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final IconData? icon;
  final bool fullWidth;

  const ServeSecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final height = _ButtonHeight.get(size);
    final textStyle = _ButtonHeight.getTextStyle(size);

    final button = SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primaryLight.withOpacity(0.5),
          disabledForegroundColor: AppColors.primary.withOpacity(0.5),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: size == ButtonSize.small ? 16 : 20),
              const SizedBox(width: AppSpacing.sm),
            ],
            Text(text, style: textStyle.copyWith(color: AppColors.primary)),
          ],
        ),
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}

class ServeOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final IconData? icon;
  final bool fullWidth;

  const ServeOutlineButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final height = _ButtonHeight.get(size);
    final textStyle = _ButtonHeight.getTextStyle(size);

    final button = SizedBox(
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.border, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: size == ButtonSize.small ? 16 : 20),
              const SizedBox(width: AppSpacing.sm),
            ],
            Text(text, style: textStyle.copyWith(color: AppColors.textPrimary)),
          ],
        ),
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}

class ServeGhostButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final IconData? icon;
  final Color? textColor;

  const ServeGhostButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = _ButtonHeight.getTextStyle(size);
    final color = textColor ?? AppColors.primary;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: size == ButtonSize.small ? 16 : 18, color: color),
            const SizedBox(width: AppSpacing.xs),
          ],
          Text(text, style: textStyle.copyWith(color: color)),
        ],
      ),
    );
  }
}

class ServeDestructiveButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final IconData? icon;
  final bool fullWidth;

  const ServeDestructiveButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final height = _ButtonHeight.get(size);
    final textStyle = _ButtonHeight.getTextStyle(size);

    final button = SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.error,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: size == ButtonSize.small ? 16 : 20),
              const SizedBox(width: AppSpacing.sm),
            ],
            Text(text, style: textStyle.copyWith(color: Colors.white)),
          ],
        ),
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}

class ServeCTAButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final IconData? icon;
  final bool fullWidth;

  const ServeCTAButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.large,
    this.icon,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final height = _ButtonHeight.get(size);
    final textStyle = _ButtonHeight.getTextStyle(size);

    final button = SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.textPrimary,
          disabledBackgroundColor: AppColors.accent.withOpacity(0.5),
          elevation: 2,
          shadowColor: AppColors.accent.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 22, color: AppColors.textPrimary),
              const SizedBox(width: AppSpacing.sm),
            ],
            Text(
              text,
              style: textStyle.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}

class ServeLoadingButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final Color backgroundColor;

  const ServeLoadingButton({
    super.key,
    required this.text,
    required this.isLoading,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.backgroundColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    final height = _ButtonHeight.get(size);
    final textStyle = _ButtonHeight.getTextStyle(size);

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          disabledBackgroundColor: backgroundColor.withOpacity(0.6),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(text, style: textStyle.copyWith(color: Colors.white)),
      ),
    );
  }
}
