import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/services/auth_service.dart';
import '../../../models/user_model.dart';

class RoleSelectionController extends GetxController {
  void selectCustomerRole() {
    AuthService.to.switchRole(UserRole.customer);
    Get.toNamed(AppRoutes.welcome);
  }

  void selectProviderRole() {
    AuthService.to.switchRole(UserRole.provider);
    Get.toNamed(AppRoutes.providerWelcome);
  }
}
