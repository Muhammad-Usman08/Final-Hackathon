import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackhthon_project/components/custom_text.dart';
import 'package:hackhthon_project/views/home/product_model.dart';
import 'package:hackhthon_project/views/resturantsview/resturantcopmponent/my_switch.dart';

class ResturantView extends StatelessWidget {
  final Map restaurantData;
  final productModel categoryData;
  const ResturantView(
      {super.key, required this.restaurantData, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Color(0xff151232), Color(0xff392776)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 0.1, 0.3],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        child: Image.asset(
                          restaurantData['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          top: 40, left: 0, right: 0, child: ResAppBar()),
                      Positioned(
                        bottom: -75, // Adjusted for better visibility
                        left: 20,
                        right: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white24),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white30),
                                              color: Color(0xff20263C),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Icon(Icons.star,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: restaurantData[
                                                        'restaurantName'] ??
                                                    '',
                                                weight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                              Row(
                                                children: [
                                                  CustomText(
                                                    text: restaurantData[
                                                            'restaurantAddress'] ??
                                                        '',
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                  ),
                                                  Icon(Icons.arrow_forward_ios,
                                                      color: Colors.white),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color.fromARGB(
                                                    255, 29, 5, 71)
                                                .withOpacity(0.5),
                                            offset: const Offset(0, -2),
                                            blurRadius: 8,
                                            spreadRadius: 25,
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12)),
                                        color: const Color.fromARGB(
                                            255, 29, 5, 71),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const CustomText(
                                                    text: 'Delivery fee',
                                                    color: Colors.white30),
                                                CustomText(
                                                    text:
                                                        '\$ ${restaurantData['deliveryFee']}',
                                                    color: Colors.white),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const CustomText(
                                                    text: 'Service fee',
                                                    color: Colors.white30),
                                                CustomText(
                                                    text:
                                                        '\$ ${restaurantData['serviceFee']}',
                                                    color: Colors.white),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const CustomText(
                                                    text: 'Total fee',
                                                    color: Colors.white30),
                                                CustomText(
                                                    text:
                                                        '\$ ${restaurantData['totalFee']}',
                                                    color: Colors.white),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MySwitch(),
                      Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color(0xff151232),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.person_add,
                              color: Colors.white,
                            ),
                            CustomText(
                              text: 'Group Order',
                              color: Colors.white,
                              fontSize: 16,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.search, color: Colors.white),
                        onPressed: () {
                          // Handle search action
                        },
                      ),
                      const Expanded(
                        child: TabBar(
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white54,
                          indicatorColor: Colors.blue,
                          tabs: [
                            Tab(text: 'Featured Items'),
                            Tab(text: 'Appetizer'),
                            Tab(text: 'Sushi'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 500, // You can adjust the height as needed
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Featured Items',
                                color: Colors.white,
                                weight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.5, // Adjust height responsively
                                child: ListView.builder(
                                  itemCount: categoryData.items != null
                                      ? categoryData.items!.length
                                      : 0,
                                  itemBuilder: (context, index) {
                                    final data = categoryData.items![index];
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Container(
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.2, // Adjust height responsively
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.9, // Make the width responsive
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.deepPurple,
                                          ),
                                          color: Color(0xff151232),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05), // Responsive padding
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxWidth: MediaQuery.of(
                                                              context)
                                                          .size
                                                          .width *
                                                      0.4, // Limit width to half of container
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: data.name ?? '',
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          0.04, // Responsive font size
                                                      color: Colors.white,
                                                      weight: FontWeight.bold,
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.005),
                                                    CustomText(
                                                      text: data.description ??
                                                          '',
                                                      color: Colors.white54,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.03,
                                                      textOverflow:
                                                          TextOverflow.clip,
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.005),
                                                    CustomText(
                                                      text:
                                                          data.price.toString(),
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          0.04, // Responsive font size
                                                      color: Colors.white,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height *
                                                        0.13, // Fixed container height
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.28, // Fixed container width
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),        
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8), // Round corners for image if needed
                                                      child: Image.network(
                                                        data.image ?? '',
                                                        fit: BoxFit
                                                            .cover, // Makes image cover entire container
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    right: 0,
                                                    bottom: 0,
                                                    child: Container(
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          0.08,
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height *
                                                          0.04,
                                                      padding:
                                                          EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff392776),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 15,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Center(child: Text('Appetizer Content')),
                        Center(child: Text('Sushi Content')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResAppBar extends StatelessWidget {
  const ResAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white10),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
          ),
          // Icons for Favorite and More
          Row(
            children: [
              Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white10),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(Icons.favorite, color: Colors.white),
                ),
              ),
              const SizedBox(width: 10), // Space between icons
              Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white10),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(Icons.more_horiz, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
