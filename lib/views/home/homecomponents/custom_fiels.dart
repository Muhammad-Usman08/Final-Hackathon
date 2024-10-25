import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hackhthon_project/views/home/homeview_model.dart';

class CustomToggleSwitch extends StatelessWidget {
  const CustomToggleSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeviewModel());

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
                homeController.isWalking.value = true;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  gradient: homeController.isWalking.value
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
                    Icon(
                      FontAwesomeIcons.personRunning,
                      color: homeController.isWalking.value
                          ? Colors.white
                          : Colors.white38,
                    ),
                  ],
                ),
              ),
            ),
            // Cycle option
            GestureDetector(
              onTap: () {
                homeController.isWalking.value = false;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  gradient: !homeController.isWalking.value
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
                    Icon(
                      Icons.directions_bike,
                      color: !homeController.isWalking.value
                          ? Colors.white
                          : Colors.white38,
                    ),
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