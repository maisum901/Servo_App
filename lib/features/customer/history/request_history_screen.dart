import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../models/service_request_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/cards/serve_cards.dart';

class RequestHistoryScreen extends StatefulWidget {
  const RequestHistoryScreen({super.key});

  @override
  State<RequestHistoryScreen> createState() => _RequestHistoryScreenState();
}

class _RequestHistoryScreenState extends State<RequestHistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final active = MockData.sampleRequests.where((r) => r.status != RequestStatus.completed && r.status != RequestStatus.cancelled).toList();
    final completed = MockData.sampleRequests.where((r) => r.status == RequestStatus.completed).toList();
    final cancelled = MockData.sampleRequests.where((r) => r.status == RequestStatus.cancelled).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('My Service Requests'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textMuted,
          indicatorColor: AppColors.primary,
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildList(active),
            _buildList(completed),
            _buildList(cancelled),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<ServiceRequestModel> list) {
    if (list.isEmpty) {
      return const Center(child: Text('No requests in this category.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final req = list[index];
        return RequestCard(
          request: req,
          onTap: () => Get.toNamed(AppRoutes.requestDetail.replaceFirst(':requestId', req.id)),
        );
      },
    );
  }
}
