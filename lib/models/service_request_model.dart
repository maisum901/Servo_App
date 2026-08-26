import 'quote_model.dart';
import 'payment_model.dart';
import 'review_model.dart';
import 'service_provider_model.dart';

enum RequestStatus {
  pending,
  searching,
  accepted,
  providerOnWay,
  arrived,
  inspecting,
  quoteShared,
  quoteAccepted,
  inProgress,
  completed,
  cancelled,
  expired,
}

class ServiceRequestModel {
  final String id;
  final String customerId;
  final String customerName;
  final String? providerId;
  final ServiceProviderModel? provider;
  final String categoryId;
  final String categoryName;
  final String problemType;
  final String description;
  final List<String> photoUrls;
  final String address;
  final double latitude;
  final double longitude;
  final String scheduledTime;
  final RequestStatus status;
  final int visitFee;
  final double platformFee;
  final QuoteModel? quote;
  final PaymentModel? payment;
  final ReviewModel? review;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ServiceRequestModel({
    required this.id,
    required this.customerId,
    required this.customerName,
    this.providerId,
    this.provider,
    required this.categoryId,
    required this.categoryName,
    required this.problemType,
    required this.description,
    required this.photoUrls,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.scheduledTime,
    required this.status,
    required this.visitFee,
    required this.platformFee,
    this.quote,
    this.payment,
    this.review,
    required this.createdAt,
    required this.updatedAt,
  });

  ServiceRequestModel copyWith({
    String? id,
    String? customerId,
    String? customerName,
    String? providerId,
    ServiceProviderModel? provider,
    String? categoryId,
    String? categoryName,
    String? problemType,
    String? description,
    List<String>? photoUrls,
    String? address,
    double? latitude,
    double? longitude,
    String? scheduledTime,
    RequestStatus? status,
    int? visitFee,
    double? platformFee,
    QuoteModel? quote,
    PaymentModel? payment,
    ReviewModel? review,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ServiceRequestModel(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      providerId: providerId ?? this.providerId,
      provider: provider ?? this.provider,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      problemType: problemType ?? this.problemType,
      description: description ?? this.description,
      photoUrls: photoUrls ?? this.photoUrls,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      status: status ?? this.status,
      visitFee: visitFee ?? this.visitFee,
      platformFee: platformFee ?? this.platformFee,
      quote: quote ?? this.quote,
      payment: payment ?? this.payment,
      review: review ?? this.review,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
