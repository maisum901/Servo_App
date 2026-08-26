enum PaymentMethod { cash, card, wallet }
enum PaymentStatus { pending, processing, completed, failed }

class PaymentModel {
  final String id;
  final String requestId;
  final double amount;
  final PaymentMethod method;
  final PaymentStatus status;
  final String transactionId;
  final DateTime createdAt;

  const PaymentModel({
    required this.id,
    required this.requestId,
    required this.amount,
    required this.method,
    required this.status,
    required this.transactionId,
    required this.createdAt,
  });
}
