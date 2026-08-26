class ServiceProviderModel {
  final String id;
  final String userId;
  final String name;
  final String avatarUrl;
  final List<String> serviceIds;
  final double rating;
  final int jobsCompleted;
  final String experience;
  final bool isVerified;
  final bool isOnline;
  final String serviceArea;
  final String phone;
  final double latitude;
  final double longitude;
  final List<String> documents;

  const ServiceProviderModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.avatarUrl,
    required this.serviceIds,
    required this.rating,
    required this.jobsCompleted,
    required this.experience,
    required this.isVerified,
    required this.isOnline,
    required this.serviceArea,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.documents,
  });
}
