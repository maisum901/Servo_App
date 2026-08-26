import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/mock/mock_data.dart';
import '../../../models/chat_message_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;

  const ChatScreen({super.key, required this.chatId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _msgController = TextEditingController();
  final List<ChatMessageModel> _messages = List.from(MockData.chatMessages);

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
            Text(provider.name, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final isCustomer = msg.senderId == 'cust_01';
                  return Align(
                    alignment: isCustomer ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: AppSpacing.md),
                      padding: const EdgeInsets.all(AppSpacing.md),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: isCustomer ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                        border: isCustomer ? null : Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        msg.text,
                        style: AppTypography.bodyMedium.copyWith(
                          color: isCustomer ? Colors.white : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(top: BorderSide(color: AppColors.border)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _msgController,
                      style: AppTypography.bodyMedium,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: AppColors.primary),
                    onPressed: () {
                      if (_msgController.text.trim().isNotEmpty) {
                        setState(() {
                          _messages.add(
                            ChatMessageModel(
                              id: 'm_${DateTime.now().millisecondsSinceEpoch}',
                              senderId: 'cust_01',
                              receiverId: widget.chatId,
                              text: _msgController.text.trim(),
                              createdAt: DateTime.now(),
                            ),
                          );
                        });
                        _msgController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
