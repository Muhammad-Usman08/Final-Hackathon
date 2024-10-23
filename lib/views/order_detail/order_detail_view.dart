import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackhthon_project/components/common_button.dart';
import 'package:hackhthon_project/components/custom_text.dart';
import 'package:hackhthon_project/utils/constants.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff151232), Color(0xff392776), Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: screenPadding, top: screenPadding),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Colors.white)),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: screenPadding),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const CustomText(
                      text: 'Order detail',
                      weight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: screenPadding,vertical: 5),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.22,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            15),
                                        child: Image.asset(
                                          'assets/images/product image.png',
                                          fit: BoxFit
                                              .cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const CustomText(
                                            text: "Rs 52.00",
                                            color: Colors.white,
                                          ),
                                          const CustomText(
                                            text: 'Chicken Veggi Salad',
                                            color: Colors.white,
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: const Text(
                                                    '+',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                                Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 15),
                                                    child: const Text(
                                                      '1',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    )),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: const Text(
                                                    '-',
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white),
                                      margin: EdgeInsets.only(top: 40),
                                      width: 34,
                                      height: 28,
                                      padding: EdgeInsets.all(4),
                                      child: SvgPicture.asset(
                                          'assets/svg-icons/delete.svg'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff1D102D),
                      borderRadius: BorderRadius.circular(40)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  child: Column(
                    children: [
                      paymentSummary('-10', "Subtotal"),
                      paymentSummary('Free', "Delivery"),
                      const SizedBox(height: 15),
                      const Row(
                        children: [
                          CustomText(
                            fontSize: 16,
                            text: 'Total',
                            color: Colors.white,
                          ),
                          Spacer(),
                          CustomText(
                            fontSize: 16,
                            text: 'Rs1000',
                            weight: FontWeight.bold,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25),
                        child: Center(
                          child: CommonButton(
                            title: 'Checkout',
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget paymentSummary(String charges, String chargesName) {
    return (Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(chargesName,
              style: TextStyle(fontSize: 13, color: Colors.white54)),
          Text(
            charges,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white54),
          ),
        ],
      ),
    ));
  }
}
