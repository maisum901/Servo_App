class ChatMessageModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String text;
  final String? imageUrl;
  final String? locationData;
  final DateTime? readAt;
  final DateTime createdAt;

  const ChatMessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.text,
    this.imageUrl,
    this.locationData,
    this.readAt,
    required this.createdAt,
  });
}
