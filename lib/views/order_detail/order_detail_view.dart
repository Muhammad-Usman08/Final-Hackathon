import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hackhthon_project/components/common_button.dart';
import 'package:hackhthon_project/components/custom_text.dart';
import 'package:hackhthon_project/utils/constants.dart';
import 'package:hackhthon_project/views/order_detail/order_detail_viewmodel.dart'; // Ensure this is imported

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff151232), Color(0xff392776), Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: screenPadding, top: screenPadding),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: screenPadding),
                child: CustomText(
                  text: 'Order detail',
                  weight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (cartController.cartItems.isEmpty) {
                    return const Center(
                      child: CustomText(
                        text: 'Your cart is empty!',
                        color: Colors.white,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartController.cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: screenPadding, vertical: 5),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    item.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => CustomText(
                                          text:
                                              "Rs ${item.price.value * item.quantity.value}", // Make sure this updates reactively
                                          color: Colors.white,
                                        )),
                                    CustomText(
                                      text: item.name,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              cartController.addQuantity(item);
                                            },
                                            child: const Text('+',
                                                style: TextStyle(fontSize: 15)),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Obx(() => Text(
                                                  item.quantity.value.toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              cartController
                                                  .decreaseQuantity(item);
                                            },
                                            child: const Text('-',
                                                style: TextStyle(fontSize: 22)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  cartController.removeItem(item);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  margin: const EdgeInsets.only(top: 40),
                                  width: 34,
                                  height: 28,
                                  padding: const EdgeInsets.all(4),
                                  child: SvgPicture.asset(
                                      'assets/svg-icons/delete.svg'),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff1D102D),
                  borderRadius: BorderRadius.circular(40),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                child: Column(
                  children: [
                    paymentSummary(
                        cartController.totalPrice.toString(), "Subtotal"),
                    paymentSummary('Free', "Delivery"),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const CustomText(
                            fontSize: 16, text: 'Total', color: Colors.white),
                        const Spacer(),
                        Obx(() => CustomText(
                              fontSize: 16,
                              text:
                                  'Rs ${cartController.totalPrice}', // Ensure totalPrice is observable
                              weight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      child: Center(
                        child: CommonButton(
                          title: 'Checkout',
                          onPressed: () {
                            cartController.addItemsToDatabase();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentSummary(String charges, String chargesName) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(chargesName,
              style: TextStyle(fontSize: 13, color: Colors.white54)),
          Text(charges,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white54)),
        ],
      ),
    );
  }
}
