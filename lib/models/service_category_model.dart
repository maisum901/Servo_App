import 'package:flutter/material.dart';

class ServiceCategoryModel {
  final String id;
  final String name;
  final String icon;
  final int visitFee; // in PKR (Rs.)
  final String description;
  final String responseTime;
  final bool isEmergencyAvailable;
  final List<String> problemTypes;
  final Color color;

  const ServiceCategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.visitFee,
    required this.description,
    required this.responseTime,
    required this.isEmergencyAvailable,
    required this.problemTypes,
    required this.color,
  });
}
