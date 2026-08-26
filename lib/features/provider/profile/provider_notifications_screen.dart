import 'package:flutter/material.dart';
import '../../../models/notification_model.dart';
import '../../../core/widgets/cards/serve_cards.dart';

class ProviderNotificationsScreen extends StatelessWidget {
  const ProviderNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final list = [
      NotificationModel(
        id: 'pn1',
        userId: 'u_p101',
        type: NotificationType.newRequest,
        title: 'New Service Request Nearby 🚨',
        body: 'Plumbing repair request in PECHS, Karachi (1.4 km). Tap to accept.',
        createdAt: DateTime.now(),
      ),
      NotificationModel(
        id: 'pn2',
        userId: 'u_p101',
        type: NotificationType.quoteAccepted,
        title: 'Quote Accepted by Customer! 🎉',
        body: 'Ahmed Raza accepted your quote of Rs. 2,700 for request #SR-8842.',
        createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
      NotificationModel(
        id: 'pn3',
        userId: 'u_p101',
        type: NotificationType.paymentReceived,
        title: 'Payment Credited to Wallet',
        body: 'Rs. 2,376 net earnings credited for plumbing job #SR-8842.',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Partner Notifications'),
      ),
      body: ListView.separated(
        itemCount: list.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final notif = list[index];
          return NotificationItem(notification: notif);
        },
      ),
    );
  }
}
