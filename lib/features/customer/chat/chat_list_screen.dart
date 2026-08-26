import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = MockData.providers.first;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                border: Border.all(color: AppColors.border),
              ),
              child: ListTile(
                leading: ServeAvatar(name: provider.name, imageUrl: provider.avatarUrl, size: AvatarSize.md),
                title: Text(provider.name, style: AppTypography.titleMedium),
                subtitle: const Text('I am near Shahrah-e-Faisal right now...'),
                trailing: Text('12:44 PM', style: AppTypography.bodySmall),
                onTap: () => Get.toNamed(AppRoutes.chat.replaceFirst(':chatId', provider.id)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
