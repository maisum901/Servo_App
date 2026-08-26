import 'package:get/get.dart';
import '../../modules/customer/home/bindings/home_binding.dart';
import '../../modules/customer/home/views/home_view.dart';
import '../../modules/shared/bindings/role_selection_binding.dart';
import '../../modules/shared/views/role_selection_view.dart';
import 'app_routes.dart';

// Customer Views & Bindings
import '../../features/customer/auth/splash_screen.dart';
import '../../features/customer/auth/welcome_screen.dart';
import '../../features/customer/auth/onboarding_screen.dart';
import '../../features/customer/auth/login_screen.dart';
import '../../features/customer/auth/signup_screen.dart';
import '../../features/customer/auth/otp_verification_screen.dart';
import '../../features/customer/auth/complete_profile_screen.dart';
import '../../features/customer/auth/location_permission_screen.dart';
import '../../features/customer/auth/notification_permission_screen.dart';
import '../../features/customer/discovery/all_services_screen.dart';
import '../../features/customer/discovery/service_detail_screen.dart';
import '../../features/customer/request/create_request_screen.dart';
import '../../features/customer/request/request_created_screen.dart';
import '../../features/customer/request/finding_provider_screen.dart';
import '../../features/customer/request/provider_found_screen.dart';
import '../../features/customer/request/live_tracking_screen.dart';
import '../../features/customer/request/provider_arrived_screen.dart';
import '../../features/customer/request/quote_received_screen.dart';
import '../../features/customer/request/service_in_progress_screen.dart';
import '../../features/customer/request/service_completed_screen.dart';
import '../../features/customer/payment/payment_screen.dart';
import '../../features/customer/payment/payment_processing_screen.dart';
import '../../features/customer/payment/payment_success_screen.dart';
import '../../features/customer/payment/payment_failed_screen.dart';
import '../../features/customer/rating/rate_provider_screen.dart';
import '../../features/customer/rating/review_submitted_screen.dart';
import '../../features/customer/history/request_history_screen.dart';
import '../../features/customer/history/request_detail_screen.dart';
import '../../features/customer/profile/profile_screen.dart';
import '../../features/customer/profile/personal_info_screen.dart';
import '../../features/customer/profile/saved_addresses_screen.dart';
import '../../features/customer/profile/notifications_screen.dart';
import '../../features/customer/chat/chat_list_screen.dart';
import '../../features/customer/chat/chat_screen.dart';
import '../../features/customer/help/help_support_screen.dart';
import '../../features/customer/help/cancellation_screen.dart';
import '../../features/customer/emergency/emergency_screen.dart';

// Provider Views & Bindings
import '../../features/provider/auth/provider_welcome_screen.dart';
import '../../features/provider/auth/provider_login_screen.dart';
import '../../features/provider/auth/provider_signup_screen.dart';
import '../../features/provider/auth/provider_phone_verification_screen.dart';
import '../../features/provider/auth/provider_personal_info_screen.dart';
import '../../features/provider/auth/service_selection_screen.dart';
import '../../features/provider/auth/experience_screen.dart';
import '../../features/provider/auth/service_area_screen.dart';
import '../../features/provider/auth/identity_verification_screen.dart';
import '../../features/provider/auth/document_upload_screen.dart';
import '../../features/provider/auth/verification_pending_screen.dart';
import '../../features/provider/auth/application_approved_screen.dart';
import '../../features/provider/auth/application_rejected_screen.dart';
import '../../features/provider/dashboard/provider_dashboard_screen.dart';
import '../../features/provider/active_job/provider_request_details_screen.dart';
import '../../features/provider/active_job/navigation_screen.dart';
import '../../features/provider/active_job/arrived_screen.dart';
import '../../features/provider/active_job/create_quote_screen.dart';
import '../../features/provider/active_job/quote_sent_screen.dart';
import '../../features/provider/active_job/provider_service_in_progress_screen.dart';
import '../../features/provider/active_job/complete_service_screen.dart';
import '../../features/provider/earnings/earnings_screen.dart';
import '../../features/provider/earnings/transaction_history_screen.dart';
import '../../features/provider/profile/provider_profile_screen.dart';
import '../../features/provider/profile/provider_reviews_screen.dart';
import '../../features/provider/profile/provider_notifications_screen.dart';
import '../../features/provider/profile/provider_chat_screen.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.roleSelect,
      page: () => const RoleSelectionView(),
      binding: RoleSelectionBinding(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: AppRoutes.verifyOtp,
      page: () => const OTPVerificationScreen(),
    ),
    GetPage(
      name: AppRoutes.completeProfile,
      page: () => const CompleteProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.locationPermission,
      page: () => const LocationPermissionScreen(),
    ),
    GetPage(
      name: AppRoutes.notificationPermission,
      page: () => const NotificationPermissionScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.services,
      page: () => const AllServicesScreen(),
    ),
    GetPage(
      name: AppRoutes.serviceDetail,
      page: () => ServiceDetailScreen(
        serviceId: Get.parameters['serviceId'] ?? 'plumbing',
      ),
    ),
    GetPage(
      name: AppRoutes.requestCreate,
      page: () => CreateRequestScreen(
        serviceId: Get.arguments as String? ?? 'plumbing',
      ),
    ),
    GetPage(
      name: AppRoutes.requestCreated,
      page: () => const RequestCreatedScreen(),
    ),
    GetPage(
      name: AppRoutes.findingProvider,
      page: () => FindingProviderScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.providerFound,
      page: () => ProviderFoundScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.liveTracking,
      page: () => LiveTrackingScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.providerArrived,
      page: () => ProviderArrivedScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.quoteReceived,
      page: () => QuoteReceivedScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.serviceInProgress,
      page: () => ServiceInProgressScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.serviceCompleted,
      page: () => ServiceCompletedScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.payment,
      page: () => PaymentScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.paymentProcessing,
      page: () => const PaymentProcessingScreen(),
    ),
    GetPage(
      name: AppRoutes.paymentSuccess,
      page: () => const PaymentSuccessScreen(),
    ),
    GetPage(
      name: AppRoutes.paymentFailed,
      page: () => const PaymentFailedScreen(),
    ),
    GetPage(
      name: AppRoutes.rateProvider,
      page: () => RateProviderScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.reviewSubmitted,
      page: () => const ReviewSubmittedScreen(),
    ),
    GetPage(
      name: AppRoutes.requests,
      page: () => const RequestHistoryScreen(),
    ),
    GetPage(
      name: AppRoutes.requestDetail,
      page: () => RequestDetailScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.messages,
      page: () => const ChatListScreen(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => ChatScreen(
        chatId: Get.parameters['chatId'] ?? 'p101',
      ),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsScreen(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.personalInfo,
      page: () => const PersonalInfoScreen(),
    ),
    GetPage(
      name: AppRoutes.savedAddresses,
      page: () => const SavedAddressesScreen(),
    ),
    GetPage(
      name: AppRoutes.help,
      page: () => const HelpSupportScreen(),
    ),
    GetPage(
      name: AppRoutes.cancel,
      page: () => const CancellationScreen(),
    ),
    GetPage(
      name: AppRoutes.emergency,
      page: () => const EmergencyScreen(),
    ),

    // Provider Pages
    GetPage(
      name: AppRoutes.providerWelcome,
      page: () => const ProviderWelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.providerLogin,
      page: () => const ProviderLoginScreen(),
    ),
    GetPage(
      name: AppRoutes.providerSignup,
      page: () => const ProviderSignUpScreen(),
    ),
    GetPage(
      name: AppRoutes.providerVerifyOtp,
      page: () => const ProviderPhoneVerificationScreen(),
    ),
    GetPage(
      name: AppRoutes.providerPersonalInfo,
      page: () => const ProviderPersonalInfoScreen(),
    ),
    GetPage(
      name: AppRoutes.providerServices,
      page: () => const ServiceSelectionScreen(),
    ),
    GetPage(
      name: AppRoutes.providerExperience,
      page: () => const ExperienceScreen(),
    ),
    GetPage(
      name: AppRoutes.providerServiceArea,
      page: () => const ServiceAreaScreen(),
    ),
    GetPage(
      name: AppRoutes.providerIdentity,
      page: () => const IdentityVerificationScreen(),
    ),
    GetPage(
      name: AppRoutes.providerDocuments,
      page: () => const DocumentUploadScreen(),
    ),
    GetPage(
      name: AppRoutes.providerVerificationPending,
      page: () => const VerificationPendingScreen(),
    ),
    GetPage(
      name: AppRoutes.providerApplicationApproved,
      page: () => const ApplicationApprovedScreen(),
    ),
    GetPage(
      name: AppRoutes.providerApplicationRejected,
      page: () => const ApplicationRejectedScreen(),
    ),
    GetPage(
      name: AppRoutes.providerDashboard,
      page: () => const ProviderDashboardScreen(),
    ),
    GetPage(
      name: AppRoutes.providerRequestDetails,
      page: () => ProviderRequestDetailsScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.providerNavigate,
      page: () => NavigationScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.providerArrivedAction,
      page: () => ArrivedScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.providerQuoteCreate,
      page: () => CreateQuoteScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.providerQuoteSent,
      page: () => QuoteSentScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.providerProgress,
      page: () => ProviderServiceInProgressScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.providerComplete,
      page: () => CompleteServiceScreen(
        requestId: Get.parameters['requestId'] ?? 'SR-8842',
      ),
    ),
    GetPage(
      name: AppRoutes.providerEarnings,
      page: () => const EarningsScreen(),
    ),
    GetPage(
      name: AppRoutes.providerTransactions,
      page: () => const TransactionHistoryScreen(),
    ),
    GetPage(
      name: AppRoutes.providerProfile,
      page: () => const ProviderProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.providerReviews,
      page: () => const ProviderReviewsScreen(),
    ),
    GetPage(
      name: AppRoutes.providerNotifications,
      page: () => const ProviderNotificationsScreen(),
    ),
    GetPage(
      name: AppRoutes.providerChat,
      page: () => const ProviderChatScreen(),
    ),
  ];
}
