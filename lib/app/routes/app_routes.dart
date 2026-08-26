abstract class AppRoutes {
  AppRoutes._();

  static const roleSelect = '/role-select';
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signup = '/signup';
  static const verifyOtp = '/verify-otp';
  static const completeProfile = '/complete-profile';
  static const locationPermission = '/permissions/location';
  static const notificationPermission = '/permissions/notification';

  // Customer Routes
  static const home = '/home';
  static const services = '/services';
  static const serviceDetail = '/services/:serviceId';
  static const requestCreate = '/request/create';
  static const requestCreated = '/request/created';
  static const findingProvider = '/request/:requestId/finding';
  static const providerFound = '/request/:requestId/found';
  static const liveTracking = '/request/:requestId/tracking';
  static const providerArrived = '/request/:requestId/arrived';
  static const quoteReceived = '/request/:requestId/quote';
  static const serviceInProgress = '/request/:requestId/progress';
  static const serviceCompleted = '/request/:requestId/completed';
  static const payment = '/request/:requestId/payment';
  static const paymentProcessing = '/request/:requestId/payment-processing';
  static const paymentSuccess = '/request/:requestId/payment-success';
  static const paymentFailed = '/request/:requestId/payment-failed';
  static const rateProvider = '/request/:requestId/review';
  static const reviewSubmitted = '/request/:requestId/review-submitted';
  static const requests = '/requests';
  static const requestDetail = '/requests/:requestId';
  static const messages = '/messages';
  static const chat = '/messages/:chatId';
  static const notifications = '/notifications';
  static const profile = '/profile';
  static const personalInfo = '/profile/edit';
  static const savedAddresses = '/profile/addresses';
  static const help = '/help';
  static const cancel = '/cancel';
  static const emergency = '/emergency';

  // Provider Routes
  static const providerWelcome = '/provider/welcome';
  static const providerLogin = '/provider/login';
  static const providerSignup = '/provider/signup';
  static const providerVerifyOtp = '/provider/verify-otp';
  static const providerPersonalInfo = '/provider/personal-info';
  static const providerServices = '/provider/services';
  static const providerExperience = '/provider/experience';
  static const providerServiceArea = '/provider/service-area';
  static const providerIdentity = '/provider/identity-verification';
  static const providerDocuments = '/provider/document-upload';
  static const providerVerificationPending = '/provider/verification-pending';
  static const providerApplicationApproved = '/provider/application-approved';
  static const providerApplicationRejected = '/provider/application-rejected';
  static const providerDashboard = '/provider/dashboard';
  static const providerRequestDetails = '/provider/request/:requestId';
  static const providerNavigate = '/provider/navigate/:requestId';
  static const providerArrivedAction = '/provider/arrived/:requestId';
  static const providerQuoteCreate = '/provider/quote/create/:requestId';
  static const providerQuoteSent = '/provider/quote/sent/:requestId';
  static const providerProgress = '/provider/progress/:requestId';
  static const providerComplete = '/provider/complete/:requestId';
  static const providerEarnings = '/provider/earnings';
  static const providerTransactions = '/provider/transactions';
  static const providerProfile = '/provider/profile';
  static const providerReviews = '/provider/reviews';
  static const providerNotifications = '/provider/notifications';
  static const providerChat = '/provider/chat';
}
