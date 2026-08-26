import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';

class PaymentScreen extends StatefulWidget {
  final String requestId;

  const PaymentScreen({super.key, required this.requestId});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = 'card';

  @override
  Widget build(BuildContext context) {
    final quote = MockData.activeRequest.quote!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Checkout & Payment'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Payable', style: AppTypography.titleLarge),
                    Text('Rs. ${quote.customerTotal.toInt()}', style: AppTypography.displayLarge.copyWith(color: AppColors.primary)),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              Text('Select Payment Method', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),

              _buildOption('card', 'Credit / Debit Card', Icons.credit_card),
              _buildOption('wallet', 'JazzCash / EasyPaisa Wallet', Icons.account_balance_wallet),
              _buildOption('cash', 'Cash to Provider', Icons.payments),

              const Spacer(),

              ServeCTAButton(
                text: 'Pay Rs. ${quote.customerTotal.toInt()}',
                onPressed: () => Get.toNamed(AppRoutes.paymentProcessing.replaceFirst(':requestId', widget.requestId)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String value, String label, IconData icon) {
    final isSelected = _selectedMethod == value;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryLight : AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(color: isSelected ? AppColors.primary : AppColors.border, width: isSelected ? 2 : 1),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? AppColors.primary : AppColors.textSecondary),
        title: Text(label, style: AppTypography.titleMedium),
        trailing: Radio<String>(
          value: value,
          groupValue: _selectedMethod,
          activeColor: AppColors.primary,
          onChanged: (val) => setState(() => _selectedMethod = val!),
        ),
        onTap: () => setState(() => _selectedMethod = value),
      ),
    );
  }
}
