import 'package:get/get.dart';
import '../../../../data/mock/mock_data.dart';
import '../../../../models/service_category_model.dart';
import '../../../../models/service_provider_model.dart';
import '../../../../models/service_request_model.dart';

class HomeController extends GetxController {
  final activeRequest = Rxn<ServiceRequestModel>();
  final categories = <ServiceCategoryModel>[].obs;
  final topProviders = <ServiceProviderModel>[].obs;
  final requestsHistory = <ServiceRequestModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  void loadHomeData() {
    categories.assignAll(MockData.categories);
    topProviders.assignAll(MockData.providers);
    activeRequest.value = MockData.activeRequest;
    requestsHistory.assignAll(MockData.sampleRequests);
  }
}
