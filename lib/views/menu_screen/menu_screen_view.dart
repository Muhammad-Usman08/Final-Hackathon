import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hackhthon_project/components/common_button.dart';
import 'package:hackhthon_project/components/custom_text.dart';
import 'package:hackhthon_project/utils/constants.dart';
import 'package:hackhthon_project/views/menu_screen/menu_screen_viewmodel.dart';

class MenuScreenView extends StatelessWidget {
  MenuScreenView({super.key});

  final controller = Get.put(MenuScreenViewmodel());
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
                child: Image.asset(
                  'assets/images/nuddles.png',
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
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[700]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Udon Miso ',
                        color: Colors.white,
                        fontSize: 20,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(height: 5),
                      CustomText(
                        text: 'Rs 16.00 ',
                        color: Colors.white,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      CustomText(
                          text:
                              'Our Udon Miso is a comforting bowl of thick, handmade udon noodles in a rich miso broth, garnished with tofu, spring onions, and vegetables.',
                          color: Colors.grey[500]),
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
                            Obx(()=> CustomText(text: controller.quantity.value.toString(), color: Colors.white)),
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
            const  Divider(),
              Padding(
                padding: EdgeInsets.all(screenPadding),
                child: Column(
                  children: [
                    Row(
                      children: [
                       const CustomText(
                          text: 'Noodle Type',
                          color: Colors.white,
                          weight: FontWeight.bold,
                          fontSize: 18,
                        ),
                       const Spacer(),
                        Container(
                          padding:
                             const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[800]!),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:const CustomText(
                            text: 'Required',
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Udon', color: Colors.grey, fontSize: 15),
                        Spacer(),
                        Obx(() {
                          return Checkbox(
                            value: controller.udonChecked.value,
                            onChanged: (value) =>
                                controller.udonChecked.value = value ?? false,
                            activeColor:const Color(0xff392776),
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Rounded edges
                            ),
                            side: BorderSide(
                              color: Colors.grey[700]!,
                            ),
                          );
                        }),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: CommonButton(title: 'Add to Basket',),
      ),
    );
  }
}
