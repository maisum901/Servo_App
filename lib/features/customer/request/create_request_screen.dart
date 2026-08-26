import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/serve_buttons.dart';
import '../../../core/widgets/inputs/serve_inputs.dart';
import '../../../core/widgets/ui/serve_ui.dart';

class CreateRequestScreen extends StatefulWidget {
  final String serviceId;

  const CreateRequestScreen({super.key, required this.serviceId});

  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  String? _selectedProblem;
  final TextEditingController _descriptionController = TextEditingController();
  final List<String> _photos = [];
  final String _address = 'House 42-B, Block 6, PECHS, Karachi';
  final String _location = 'Karachi, Pakistan';
  String _selectedSchedule = 'ASAP (Immediate)';

  @override
  Widget build(BuildContext context) {
    final category = MockData.categories.firstWhere(
      (c) => c.id == widget.serviceId,
      orElse: () => MockData.categories.first,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Book ${category.name}'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: StepIndicator(
              currentStep: _currentStep,
              totalSteps: 6,
              labels: const ['Problem', 'Details', 'Photos', 'Location', 'Time', 'Summary'],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (idx) => setState(() => _currentStep = idx),
                children: [
                  _buildStep1Problem(category),
                  _buildStep2Details(),
                  _buildStep3Photos(),
                  _buildStep4Location(),
                  _buildStep5Time(),
                  _buildStep6Summary(category),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(top: BorderSide(color: AppColors.border)),
              ),
              child: Row(
                children: [
                  if (_currentStep > 0) ...[
                    Expanded(
                      child: ServeOutlineButton(
                        text: 'Back',
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                  ],
                  Expanded(
                    flex: 2,
                    child: ServeCTAButton(
                      text: _currentStep == 5 ? 'Confirm & Find Provider' : 'Continue',
                      onPressed: () {
                        if (_currentStep < 5) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Get.toNamed(AppRoutes.requestCreated);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep1Problem(dynamic category) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Your Problem', style: AppTypography.headlineMedium),
          const SizedBox(height: AppSpacing.xs),
          Text('What type of repair or service do you need?', style: AppTypography.bodyMedium),
          const SizedBox(height: AppSpacing.lg),
          Expanded(
            child: ListView.builder(
              itemCount: category.problemTypes.length,
              itemBuilder: (context, index) {
                final problem = category.problemTypes[index];
                final isSelected = _selectedProblem == problem;
                return Container(
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryLight : AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.border,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: ListTile(
                    title: Text(problem, style: AppTypography.titleMedium),
                    trailing: Radio<String>(
                      value: problem,
                      groupValue: _selectedProblem,
                      activeColor: AppColors.primary,
                      onChanged: (val) => setState(() => _selectedProblem = val),
                    ),
                    onTap: () => setState(() => _selectedProblem = problem),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep2Details() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Describe the Issue', style: AppTypography.headlineMedium),
          const SizedBox(height: AppSpacing.xs),
          Text('Add any specific details to help the provider bring right tools', style: AppTypography.bodyMedium),
          const SizedBox(height: AppSpacing.lg),
          ServeMultilineField(
            controller: _descriptionController,
            label: 'Problem Description',
            hint: 'e.g., Pipe leaking heavily under kitchen sink since morning...',
            maxLines: 5,
            maxLength: 300,
          ),
        ],
      ),
    );
  }

  Widget _buildStep3Photos() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Upload Photos (Optional)', style: AppTypography.headlineMedium),
          const SizedBox(height: AppSpacing.xs),
          Text('Photos help technicians quote accurately before arrival', style: AppTypography.bodyMedium),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _photos.add('https://images.unsplash.com/photo-1585704032915-c3400ca199e7?w=300');
                  });
                },
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                    border: Border.all(color: AppColors.primary, style: BorderStyle.solid),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add_a_photo_outlined, color: AppColors.primary),
                      SizedBox(height: 4),
                      Text('Add Photo', style: TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              ..._photos.map((url) => Container(
                    width: 90,
                    height: 90,
                    margin: const EdgeInsets.only(right: AppSpacing.sm),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                      image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep4Location() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Confirm Service Location', style: AppTypography.headlineMedium),
          const SizedBox(height: AppSpacing.xs),
          Text('Where should the professional arrive?', style: AppTypography.bodyMedium),
          const SizedBox(height: AppSpacing.lg),
          const MapPlaceholderWidget(height: 180),
          const SizedBox(height: AppSpacing.lg),
          ServeTextField(
            label: 'Street Address',
            hint: 'House/Flat No, Block, Area',
            controller: TextEditingController(text: _address),
          ),
        ],
      ),
    );
  }

  Widget _buildStep5Time() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Arrival Time', style: AppTypography.headlineMedium),
          const SizedBox(height: AppSpacing.xs),
          Text('Choose immediate emergency response or schedule for later', style: AppTypography.bodyMedium),
          const SizedBox(height: AppSpacing.lg),
          ...['ASAP (Immediate 20-30 mins)', 'Today Evening (5:00 PM - 7:00 PM)', 'Tomorrow Morning (9:00 AM - 12:00 PM)'].map((time) {
            final isSel = _selectedSchedule == time;
            return Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              decoration: BoxDecoration(
                color: isSel ? AppColors.primaryLight : AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                border: Border.all(color: isSel ? AppColors.primary : AppColors.border, width: isSel ? 2 : 1),
              ),
              child: ListTile(
                title: Text(time, style: AppTypography.titleMedium),
                trailing: Radio<String>(
                  value: time,
                  groupValue: _selectedSchedule,
                  activeColor: AppColors.primary,
                  onChanged: (v) => setState(() => _selectedSchedule = v!),
                ),
                onTap: () => setState(() => _selectedSchedule = time),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildStep6Summary(dynamic category) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Request Summary', style: AppTypography.headlineMedium),
            const SizedBox(height: AppSpacing.xs),
            Text('Review booking details before dispatch', style: AppTypography.bodyMedium),
            const SizedBox(height: AppSpacing.lg),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                border: Border.all(color: AppColors.border),
                boxShadow: [AppColors.subtleShadow],
              ),
              child: Column(
                children: [
                  _buildSummaryRow('Category', category.name),
                  _buildSummaryRow('Problem', _selectedProblem ?? 'General Repair'),
                  _buildSummaryRow('Address', _address),
                  _buildSummaryRow('Schedule', _selectedSchedule),
                  const Divider(height: AppSpacing.lg),
                  _buildSummaryRow('Visit Fee', 'Rs. ${category.visitFee}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodySmall),
          Expanded(
            child: Text(
              value,
              style: AppTypography.labelLarge,
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
