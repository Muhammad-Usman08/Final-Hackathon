import 'package:flutter/material.dart';
import 'package:hackhthon_project/components/custom_text.dart';
import 'package:hackhthon_project/views/resturantsview/resturantcopmponent/my_switch.dart';

class ResturantView extends StatelessWidget {
  const ResturantView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
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
                          'assets/images/resturant_dish.png',
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
                                            height: 60,
                                            width: 60,
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
                                                text: 'Kinka Izakaya',
                                                weight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                              Row(
                                                children: [
                                                  CustomText(
                                                    text:
                                                        '2972 Westheimer Rd. Santa Ana',
                                                    color: Colors.white,
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
                                      height: 80,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color.fromARGB(
                                                    255, 29, 5, 71)
                                                .withOpacity(
                                                    0.5), // Color with opacity
                                            offset: Offset(0,
                                                -2), // Negative offset to move shadow upwards
                                            blurRadius:
                                                8, // Blur for a softer edge
                                            spreadRadius:
                                                25, // Spread radius for shadow above
                                          ),
                                        ],
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12)),
                                        color: const Color.fromARGB(
                                            255, 29, 5, 71),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    text: 'Delivery fee',
                                                    color: Colors.white30),
                                                CustomText(
                                                    text: '\$3.99',
                                                    color: Colors.white),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    text: 'Service fee',
                                                    color: Colors.white30),
                                                CustomText(
                                                    text: '\$2.50',
                                                    color: Colors.white),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    text: 'Total fee',
                                                    color: Colors.white30),
                                                CustomText(
                                                    text: '\$6.49',
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
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MySwitch(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.person_add,
                              color: Colors.white,
                            ),
                            CustomText(
                              text: 'Group Order',
                              color: Colors.white,
                              fontSize: 18,
                            )
                          ],
                        ),
                        width: 160,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color(0xff151232),
                            borderRadius: BorderRadius.circular(12)),
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
                      Expanded(
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
                  SizedBox(height: 10), // Add some spacing
                  SizedBox(
                    height: 500, // You can adjust the height as needed
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
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
                                height: 10,
                              ),
                              SizedBox(
                                height: 400,
                                child: ListView.builder(
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Container(
                                          height: 160,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.deepPurple,
                                            ),
                                            color: Color(0xff151232),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(25.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: 'Udon Miso',
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      weight: FontWeight.bold,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          'Thick handmade udon\nnoodles in a rich miso broth,',
                                                      color: Colors.white54,
                                                      fontSize: 14,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    CustomText(
                                                      text: '\$ 16.00',
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                                Image.asset(
                                                  'assets/images/featured.png',
                                                  height: 120,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
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
          Container(
            height: 50,
            width: 60,
            child: Center(
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white10),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // Icons for Favorite and More
          Row(
            children: [
              Container(
                height: 50,
                width: 60,
                child: Center(
                  child: Icon(Icons.favorite, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white10),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 10), // Space between icons
              Container(
                height: 50,
                width: 60,
                child: Center(
                  child: Icon(Icons.more_horiz, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white10),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
