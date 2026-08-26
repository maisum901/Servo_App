import 'package:flutter/material.dart';
import '../../../data/mock/mock_data.dart';
import '../../../models/chat_message_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class ProviderChatScreen extends StatefulWidget {
  const ProviderChatScreen({super.key});

  @override
  State<ProviderChatScreen> createState() => _ProviderChatScreenState();
}

class _ProviderChatScreenState extends State<ProviderChatScreen> {
  final TextEditingController _msgController = TextEditingController();
  final List<ChatMessageModel> _messages = List.from(MockData.chatMessages);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: const [
            ServeAvatar(name: 'Ahmed Raza', size: AvatarSize.sm),
            SizedBox(width: AppSpacing.sm),
            Text('Ahmed Raza (Customer)', style: TextStyle(fontSize: 16)),
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
                  final isProvider = msg.senderId == 'p101';
                  return Align(
                    alignment: isProvider ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: AppSpacing.md),
                      padding: const EdgeInsets.all(AppSpacing.md),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: isProvider ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                        border: isProvider ? null : Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        msg.text,
                        style: AppTypography.bodyMedium.copyWith(
                          color: isProvider ? Colors.white : AppColors.textPrimary,
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
                              id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
                              senderId: 'p101',
                              receiverId: 'cust_01',
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
