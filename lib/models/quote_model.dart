enum QuoteStatus { pending, accepted, declined, expired }

class QuoteItemModel {
  final String description;
  final int quantity;
  final double unitPrice;
  final double total;

  const QuoteItemModel({
    required this.description,
    required this.quantity,
    required this.unitPrice,
    required this.total,
  });
}

class QuoteModel {
  final String id;
  final String requestId;
  final List<QuoteItemModel> items;
  final double subtotal;
  final double platformCommission; // 12%
  final double providerEarnings;
  final double customerTotal;
  final QuoteStatus status;
  final DateTime createdAt;

  const QuoteModel({
    required this.id,
    required this.requestId,
    required this.items,
    required this.subtotal,
    required this.platformCommission,
    required this.providerEarnings,
    required this.customerTotal,
    required this.status,
    required this.createdAt,
  });
}
