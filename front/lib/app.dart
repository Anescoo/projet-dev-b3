import 'package:flutter/material.dart';
import 'package:front/constatns.dart';
import 'package:front/features/account/profile_page.dart';
import 'package:front/features/home/home_page.dart';
import 'package:front/features/order/order_page.dart';
import 'package:front/features/products/produst_page.dart';
import 'package:front/route_controller.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

//! the bottom menu is not sync to the page when the user rollback. The page will change but not the state of the buttom menue
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final RouteController router = Get.put(RouteController());

  Widget getWidget() {
    return Obx(() {
      switch (router.index.value) {
        case 0:
          return const Home();
        case 1:
          return Product();
        case 2:
          return const Order();
        case 3:
          return const Profile();
        default:
          throw Exception("index error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (router.index.value != 0) {
          router.index.value = router.index.value - 1;
        }
        return false;
      },
      child: Container(
        color: backGround,
        child: SafeArea(
            child: Stack(children: [
          Container(
            child: getWidget(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: GNav(
                  backgroundColor: Colors.white,
                  gap: 3,
                  onTabChange: (index) {
                    index = router.index.value;
                  },
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                      onPressed: () {
                        router.index.value = 0;
                      },
                    ),
                    GButton(
                      icon: Icons.window,
                      text: 'Produits',
                      onPressed: () {
                        router.index.value = 1;
                      },
                    ),
                    GButton(
                      icon: Icons.shopping_bag_rounded,
                      text: 'Orders',
                      onPressed: () {
                        router.index.value = 2;
                      },
                    ),
                    GButton(
                      icon: Icons.account_circle,
                      text: 'Profile',
                      onPressed: () {
                        router.index.value = 3;
                      },
                    )
                  ],
                  iconSize: 20,
                  padding: const EdgeInsets.all(20),
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
