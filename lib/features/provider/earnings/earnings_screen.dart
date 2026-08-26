import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  String _selectedPeriod = 'This Week';

  @override
  Widget build(BuildContext context) {
    final earnings = MockData.earnings;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Earnings & Payouts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Get.toNamed(AppRoutes.providerTransactions),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ['Today', 'This Week', 'This Month'].map((period) {
                  final isSelected = _selectedPeriod == period;
                  return ChoiceChip(
                    label: Text(period),
                    selected: isSelected,
                    selectedColor: AppColors.primary,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : AppColors.textPrimary,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                    onSelected: (val) {
                      setState(() {
                        _selectedPeriod = period;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSpacing.lg),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  boxShadow: [AppColors.subtleShadow],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NET EARNINGS ($_selectedPeriod)', style: AppTypography.labelSmall.copyWith(color: Colors.white70)),
                    const SizedBox(height: 4),
                    Text('Rs. 24,800', style: AppTypography.displayLarge.copyWith(color: Colors.white)),
                    const Divider(height: AppSpacing.lg, color: Colors.white24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildBreakdownItem('Gross', 'Rs. 28,180'),
                        _buildBreakdownItem('Commission (-12%)', 'Rs. 3,380'),
                        _buildBreakdownItem('Payout Balance', 'Rs. 21,500'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              Text('Daily Earnings Overview', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),
              Container(
                height: 200,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: AppColors.border),
                ),
                child: BarChart(
                  BarChartData(
                    borderData: FlBorderData(show: false),
                    gridData: const FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (val, meta) {
                            const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                            if (val.toInt() >= 0 && val.toInt() < days.length) {
                              return Text(days[val.toInt()], style: AppTypography.bodySmall);
                            }
                            return const Text('');
                          },
                        ),
                      ),
                    ),
                    barGroups: [
                      _makeBar(0, 3200),
                      _makeBar(1, 4500),
                      _makeBar(2, 2800),
                      _makeBar(3, 5100),
                      _makeBar(4, 3900),
                      _makeBar(5, 6200),
                      _makeBar(6, 4100),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              ServeCTAButton(
                text: 'Request Bank Payout — Rs. 21,500',
                onPressed: () {
                  Get.snackbar('Payout Submitted', 'Funds will be transferred to your bank in 2 hours.');
                },
              ),
              const SizedBox(height: AppSpacing.xl),

              SectionHeader(
                title: 'Transaction Breakdown',
                actionText: 'View History',
                onActionTap: () => Get.toNamed(AppRoutes.providerTransactions),
              ),
              const SizedBox(height: AppSpacing.md),
              ...earnings.map((e) => Container(
                    margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.serviceName, style: AppTypography.titleMedium),
                            Text('${e.period} • Commission: Rs. ${e.commission.toInt()}', style: AppTypography.bodySmall),
                          ],
                        ),
                        Text('+Rs. ${e.net.toInt()}', style: AppTypography.titleMedium.copyWith(color: AppColors.success)),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreakdownItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.bodySmall.copyWith(color: Colors.white70)),
        Text(value, style: AppTypography.labelLarge.copyWith(color: Colors.white)),
      ],
    );
  }

  BarChartGroupData _makeBar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: AppColors.primary,
          width: 16,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
