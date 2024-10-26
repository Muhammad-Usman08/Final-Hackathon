import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hackhthon_project/views/menu_screen/cart_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addItem(CartItem item) {
    var existingItem = cartItems
        .firstWhereOrNull((i) => i.name == item.name && i.price == item.price);
    debugPrint("Add item");
    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      cartItems.add(item);
    }
    update();
  }

  void addQuantity(CartItem item) {
    var index = cartItems
        .indexWhere((i) => i.name == item.name && i.price == item.price);
    if (index != -1) {
      cartItems[index].quantity++;
      debugPrint(
          "Added quantity: ${cartItems[index].quantity} for ${item.name}");
    }
  }

  void decreaseQuantity(CartItem item) {
    var index = cartItems
        .indexWhere((i) => i.name == item.name && i.price == item.price);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
        debugPrint(
            "Decreased quantity: ${cartItems[index].quantity} for ${item.name}");
      } else {
        removeItem(item);
      }
    }
  }

  void removeItem(CartItem item) {
    cartItems.removeWhere((i) => i.name == item.name && i.price == item.price);
    debugPrint("Removed item: ${item.name}");
  }

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity.value));
  }
}
