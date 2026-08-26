import 'package:get/get.dart';
import '../../models/user_model.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final selectedRole = UserRole.customer.obs;
  final currentUser = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    _loadUser();
  }

  void _loadUser() {
    currentUser.value = UserModel(
      id: selectedRole.value == UserRole.customer ? 'cust_01' : 'u_p101',
      name: selectedRole.value == UserRole.customer ? 'Ahmed Raza' : 'Tariq Mahmood',
      email: selectedRole.value == UserRole.customer ? 'ahmed.raza@example.com' : 'tariq.pro@servepro.pk',
      phone: selectedRole.value == UserRole.customer ? '+92 300 9876543' : '+92 300 1234567',
      avatarUrl: selectedRole.value == UserRole.customer
          ? 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150'
          : 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      city: 'Karachi',
      role: selectedRole.value,
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
    );
  }

  void switchRole(UserRole role) {
    selectedRole.value = role;
    _loadUser();
  }

  bool get isAuthenticated => currentUser.value != null;
  bool get isCustomer => selectedRole.value == UserRole.customer;
  bool get isProvider => selectedRole.value == UserRole.provider;
}
