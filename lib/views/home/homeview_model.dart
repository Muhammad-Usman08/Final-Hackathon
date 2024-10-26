import 'package:get/get.dart';
import 'package:hackhthon_project/services/api_service.dart';
import 'package:hackhthon_project/views/home/product_model.dart';

class HomeviewModel extends GetxController {
  RxBool isWalking = false.obs;
  var currentPage = 0.obs;
  var products = <productModel>[].obs;

  void toggleWalk() {
    isWalking.value = !isWalking.value;
  }

  Future<void> fetchProducts() async {
    ApiService apiService = ApiService();
    var fetchedProducts = await apiService.getData();
    products.assignAll(fetchedProducts); // Update observable list
  }
}
