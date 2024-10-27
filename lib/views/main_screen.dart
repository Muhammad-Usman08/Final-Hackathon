import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackhthon_project/views/home/home_view.dart';
import 'package:hackhthon_project/views/order_detail/order_detail_view.dart';

class MainScreen extends StatefulWidget {
  final int initialPage;

  MainScreen({this.initialPage = 0});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;
  late TabController tabController;

  final List<Widget> _pages = [
    HomeView(),
    OrderDetailView(),
  ];

  @override
  void initState() {
    super.initState();
    currentPage = widget.initialPage;
    tabController = TabController(length: 2, vsync: this);
    tabController.animation!.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentPage && mounted) {
        changePage(value);
      }
    });
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BottomBar(
            clip: Clip.none,
            fit: StackFit.expand,
            borderRadius: BorderRadius.circular(50),
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            showIcon: true,
            width: MediaQuery.of(context).size.width * 0.45,
            barColor: Colors.black,
            barDecoration: BoxDecoration(
              border: Border.all(color: Colors.white54, width: 1),
              borderRadius: BorderRadius.circular(50),
            ),
            iconHeight: 30,
            iconWidth: 30,
            hideOnScroll: true,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                TabBar(
                  indicatorPadding: const EdgeInsets.fromLTRB(5, 0, 6, 0),
                  controller: tabController,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  ),
                  tabs: [
                    _buildTabIcon('assets/svg-icons/home.svg', 0, 25),
                    _buildTabIcon('assets/svg-icons/cart.svg', 1, 25),
                  ],
                ),
              ],
            ),
            body: (context, controller) => TabBarView(
              controller: tabController,
              physics: const BouncingScrollPhysics(),
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabIcon(String assetName, int index, double? width) {
    return SizedBox(
      height: 55,
      width: 40,
      child: Center(
        child: SvgPicture.asset(
          assetName,
          color: currentPage == index ? Color.fromARGB(255, 106, 81, 187) : Colors.white,
        ),
      ),
    );
  }
}
