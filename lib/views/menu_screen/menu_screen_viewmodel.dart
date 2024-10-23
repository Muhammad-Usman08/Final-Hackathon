import 'package:get/get.dart';

class MenuScreenViewmodel extends GetxController {
  RxBool udonChecked = false.obs;
  RxInt quantity = 1.obs;

  addQuantity() {
    quantity++;
  }

  decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
    } else {}
  }
}
