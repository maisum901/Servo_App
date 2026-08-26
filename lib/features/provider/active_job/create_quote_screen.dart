import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/inputs/serve_inputs.dart';

class _LineItem {
  final TextEditingController title;
  final TextEditingController price;

  _LineItem(String t, String p)
      : title = TextEditingController(text: t),
        price = TextEditingController(text: p);
}

class CreateQuoteScreen extends StatefulWidget {
  final String requestId;

  const CreateQuoteScreen({super.key, required this.requestId});

  @override
  State<CreateQuoteScreen> createState() => _CreateQuoteScreenState();
}

class _CreateQuoteScreenState extends State<CreateQuoteScreen> {
  final List<_LineItem> _items = [
    _LineItem('PPRC Pipe 3/4 inch (2 meters)', '1200'),
    _LineItem('Labor & Wall Welding', '1500'),
  ];

  double get _subtotal {
    double sum = 0;
    for (var i in _items) {
      sum += double.tryParse(i.price.text) ?? 0;
    }
    return sum;
  }

  double get _commission => _subtotal * 0.12;
  double get _netEarnings => _subtotal - _commission;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Create Itemized Quote'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Quote Line Items', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ServeTextField(controller: item.title, label: 'Item Name'),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: ServeTextField(
                              controller: item.price,
                              label: 'Price (Rs.)',
                              keyboardType: TextInputType.number,
                              onChanged: (_) => setState(() {}),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Customer Bill Total', style: AppTypography.titleMedium),
                        Text('Rs. ${_subtotal.toInt()}', style: AppTypography.titleLarge),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Platform Commission (12%)', style: AppTypography.bodySmall),
                        Text('-Rs. ${_commission.toInt()}', style: AppTypography.bodySmall.copyWith(color: AppColors.error)),
                      ],
                    ),
                    const Divider(height: AppSpacing.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Your Net Earnings', style: AppTypography.labelLarge),
                        Text('Rs. ${_netEarnings.toInt()}', style: AppTypography.titleLarge.copyWith(color: AppColors.success)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              ServeCTAButton(
                text: 'Send Quote to Customer',
                onPressed: () => Get.toNamed(AppRoutes.providerQuoteSent.replaceFirst(':requestId', widget.requestId)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
