import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hackhthon_project/views/checkOut/checkout_view.dart';
import 'package:hackhthon_project/views/menu_screen/cart_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

void addItem(CartItem item, {int initialQuantity = 1}) {
   var existingItem = cartItems.firstWhereOrNull(
     (i) => i.name == item.name && i.price == item.price,
   );

   if (existingItem != null) {
      // Increase quantity of the existing item instead of resetting it
      existingItem.quantity.value += initialQuantity;
   } else {
      // Set quantity of the new item
      item.quantity.value = initialQuantity;
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

  addItemsToDatabase() {
    CollectionReference itemsCollection =
        FirebaseFirestore.instance.collection('items');

    List allItems = [];

    for (var item in cartItems) {
      allItems.add({
        'itemName': item.name,
        'quantity': item.quantity.value,
        'total': item.price.value * item.quantity.value,
      });
    }

    itemsCollection
        .add({
          'items': allItems,
          'total': totalPrice,
        })
         .then((value) {
          cartItems.clear();
          update();
          Get.to(CheckOutScreen());
        })
        .catchError((error) {
          print(error);
          debugPrint(error);
        });
  }
}
