import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackhthon_project/components/common_button.dart';
import 'package:hackhthon_project/components/custom_text.dart';
import 'package:hackhthon_project/views/home/home_view.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: CustomText(
          text: 'Check Out',
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        height: MediaQuery.of(context)
            .size
            .height, // Ensure the full height is used
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Thanks!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white,
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Color(0xff151232),
                        Color(0xff392776)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 50,
                        child: Icon(
                          Icons.check,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 20),
                        child: const Text(
                          'Thank you for purchasing.',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const CustomText(
                        text: 'Your order is confirmed!',
                        color: Colors.white,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: CommonButton(
                          title: 'Back to Home Screen',
                          vertcalPaddingM: 15,
                          onPressed: () {
                            Get.offAll(HomeView());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
