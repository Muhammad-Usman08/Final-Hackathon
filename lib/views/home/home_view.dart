import 'package:flutter/material.dart';

import 'package:hackhthon_project/components/custom_text.dart';
import 'package:hackhthon_project/views/home/homecomponents/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Color(0xff151232), Color(0xff392776)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.1, 0.3],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(),
                  GradientTextField(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Categories',
                          fontSize: 20,
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        CustomText(
                          text: 'See all',
                          color: Colors.white54,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 75,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.deepPurpleAccent),
                                  color: const Color.fromARGB(255, 31, 7, 71),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.food_bank,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              CustomText(
                                text: 'Burger',
                                color: Colors.white,
                                weight: FontWeight.bold,
                                fontSize: 20,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 210,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Container(
                            height: 80,
                            width: 300,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.deepPurpleAccent),
                              color: const Color.fromARGB(255, 31, 7, 71),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 2,
                                  child: Image.asset('assets/images/Pasta.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: '30% OFF',
                                        fontSize: 25,
                                        weight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      SizedBox(height: 10),
                                      CustomText(
                                        fontSize: 17,
                                        text:
                                            'Discover discounts in your\nfavorite local restaurants',
                                        color: Colors.white54,
                                      ),
                                      SizedBox(height: 12),
                                      Container(
                                        height: 50,
                                        width: 130,
                                        child: Center(
                                          child: CustomText(
                                            text: 'Order Now',
                                            fontSize: 14,
                                            weight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 36, 157, 214),
                                              Color(0xff392776),
                                              Color(0xff151232),
                                            ],
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Color(0xff151232),
              Color(0xff392776),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.white),
            hintText: 'Your Order?',
            hintStyle: TextStyle(color: Colors.white38),
            suffixIcon: Icon(Icons.qr_code, color: Colors.white),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.teal),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
