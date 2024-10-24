import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomToggleSwitch extends StatelessWidget {
  const CustomToggleSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeviewModel());

    return Obx(() {
      return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white38),
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff151232),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Walk-in option
            GestureDetector(
              onTap: () {
                homeController.isWalking.value = true; // Set to Walk-in
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  gradient: homeController.isWalking.value
                      ? LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 36, 157, 214),
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
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            // Cycle option
            GestureDetector(
              onTap: () {
                homeController.isWalking.value = false; // Set to Cycle
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: !homeController.isWalking.value
                      ? LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 36, 157, 214),
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
                    SizedBox(width: 10),
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

class HomeviewModel extends GetxController {
  RxBool isWalking = true.obs; // Default to Walk-in
}
