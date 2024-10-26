import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hackhthon_project/components/common_button.dart';
import 'package:hackhthon_project/components/custom_text.dart';
import 'package:hackhthon_project/utils/constants.dart';
import 'package:hackhthon_project/views/menu_screen/cart_model.dart';
import 'package:hackhthon_project/views/menu_screen/menu_screen_viewmodel.dart';
import 'package:hackhthon_project/views/order_detail/order_detail_view.dart';
import 'package:hackhthon_project/views/order_detail/order_detail_viewmodel.dart';

class MenuScreenView extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final double price;
  MenuScreenView(
      {super.key,
      required this.image,
      required this.name,
      required this.desc,
      required this.price});

  final controller = Get.put(MenuScreenViewmodel());
  final controller1 = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[800]!),
                borderRadius: BorderRadius.circular(5),
              ),
              child: SvgPicture.asset('assets/svg-icons/heart.svg'),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[800]!),
                borderRadius: BorderRadius.circular(5),
              ),
              child: SvgPicture.asset('assets/svg-icons/dots.svg'),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Color(0xff151232), Color(0xff392776)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.black,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(screenPadding),
                child: Container(
                  width: double.infinity,
                  // height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 70),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[700]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: name,
                        color: Colors.white,
                        fontSize: 20,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(height: 5),
                      CustomText(
                        text: 'Rs ${price}',
                        color: Colors.white,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      CustomText(text: desc, color: Colors.grey[500]),
                      const SizedBox(height: 20),
                      Container(
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 12, 12, 12),
                            border: Border.all(color: Colors.grey[800]!),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller.addQuantity();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                )),
                            Obx(() => CustomText(
                                text: controller.quantity.value.toString(),
                                color: Colors.white)),
                            const SizedBox(width: 3),
                            IconButton(
                                onPressed: () {
                                  controller.decreaseQuantity();
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 15,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: CommonButton(
          onPressed: () {
            controller1.addItem(CartItem(
              price: price,
              image: image,
              name: name,
            ));
            Get.snackbar("Success", "$name added to cart");
            Get.to(OrderDetailView());
          },
          title: 'Add to Basket',
        ),
      ),
    );
  }
}
