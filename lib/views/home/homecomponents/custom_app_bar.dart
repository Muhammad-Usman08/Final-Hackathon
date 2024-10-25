import 'package:flutter/material.dart';
import 'package:hackhthon_project/components/custom_text.dart';
import 'package:hackhthon_project/views/home/homecomponents/custom_fiels.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: const Row(
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Delivery',
                color: Colors.white30,
              ),
              CustomText(
                text: 'Maplewood Suites',
                color: Colors.white,
              ),
            ],
          ),
          Spacer(),
          CustomToggleSwitch(),
        ],
      ),
    );
  }
}
