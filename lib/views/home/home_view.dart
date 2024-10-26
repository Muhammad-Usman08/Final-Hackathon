import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackhthon_project/components/custom_text.dart';
import 'package:hackhthon_project/views/home/homecomponents/custom_app_bar.dart';
import 'package:hackhthon_project/views/home/homeview_model.dart';
import 'package:hackhthon_project/views/home/product_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeviewModel homeController = Get.put(HomeviewModel());

    homeController.fetchProducts();

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
              // Wrap entire content in a SingleChildScrollView
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
                                height: 90,
                                width: 80,
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
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Obx(() {
                    if (homeController.products.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return GridView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), // Disable scrolling for the GridView
                        shrinkWrap:
                            true, // Allow the GridView to take only the needed space
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          childAspectRatio: 0.75, // Aspect ratio of each item
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: homeController.products.fold<int>(
                          0,
                          (sum, product) => sum + (product.items?.length ?? 0),
                        ),
                        itemBuilder: (context, index) {
                          int currentIndex = 0;
                          Items? currentItem;

                          for (var product in homeController.products) {
                            if (currentIndex + (product.items?.length ?? 0) >
                                index) {
                              currentItem =
                                  product.items![index - currentIndex];
                              break;
                            }
                            currentIndex += product.items?.length ?? 0;
                          }

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.deepPurpleAccent),
                                color: const Color.fromARGB(255, 31, 7, 71),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (currentItem != null)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        currentItem.image ?? '',
                                        height: 130,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(
                                              child: Icon(Icons.error,
                                                  color: Colors.red));
                                        },
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: currentItem?.name ?? 'Unknown',
                                          color: Colors.white,
                                          weight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        CustomText(
                                          text:
                                              'Rs: ${currentItem?.price ?? '0'}',
                                          color: Colors.white54,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
                  SizedBox(height: 10),
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
