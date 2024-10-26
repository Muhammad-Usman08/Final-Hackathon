import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackhthon_project/components/custom_text.dart';
import 'package:hackhthon_project/views/resturantsview/resturantcopmponent/resview_model.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resController = Get.put(ResviewModel());

    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white38),
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff151232),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Walk-in option
            GestureDetector(
              onTap: () {
                resController.isDelivery.value = true; // Set to Walk-in
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                decoration: BoxDecoration(
                  gradient: resController.isDelivery.value
                      ? const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 36, 157, 214),
                            Color(0xff392776),
                            Color(0xff151232),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Delivery',
                      fontSize: 13,
                      color: resController.isDelivery.value
                          ? Colors.white
                          : Colors.white54,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            // Cycle option
            GestureDetector(
              onTap: () {
                resController.isDelivery.value = false; // Set to Cycle
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  gradient: !resController.isDelivery.value
                      ? const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 36, 157, 214),
                            Color(0xff392776),
                            Color(0xff151232),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Take Out',
                      fontSize: 13,
                      color: resController.isDelivery.value
                          ? Colors.white
                          : Colors.white54,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
