class EarningsModel {
  final String id;
  final String providerId;
  final String requestId;
  final String serviceName;
  final double gross;
  final double commission;
  final double net;
  final String period; // e.g. "Today", "This Week", "August 2026"
  final DateTime createdAt;

  const EarningsModel({
    required this.id,
    required this.providerId,
    required this.requestId,
    required this.serviceName,
    required this.gross,
    required this.commission,
    required this.net,
    required this.period,
    required this.createdAt,
  });
}
