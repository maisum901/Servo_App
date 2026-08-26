enum NotificationType {
  newRequest,
  providerAccepted,
  providerArriving,
  providerArrived,
  quoteReceived,
  quoteAccepted,
  serviceCompleted,
  paymentReceived,
  reviewReceived,
  promo,
}

class NotificationModel {
  final String id;
  final String userId;
  final NotificationType type;
  final String title;
  final String body;
  final Map<String, String>? data;
  final DateTime? readAt;
  final DateTime createdAt;

  const NotificationModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.body,
    this.data,
    this.readAt,
    required this.createdAt,
  });
}
