import 'package:get/get.dart';
import 'package:hackhthon_project/views/menu_screen/cart_model.dart';

class MenuScreenViewmodel extends GetxController {
  RxBool udonChecked = false.obs;
  RxInt quantity = 1.obs;
  var cartItems = <CartItem>[].obs;

  addQuantity() {
    quantity++;
  }

  decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
    } else {}
  }
}
