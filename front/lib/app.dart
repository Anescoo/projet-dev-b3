import 'package:flutter/material.dart';
import 'package:front/features/account/profile_page.dart';
import 'package:front/features/home/home_page.dart';
import 'package:front/features/order/order_page.dart';
import 'package:front/features/products/produst_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import 'app_model.dart';

//! the bottom menu is not sync to the page when the user rollback. The page will change but not the state of the buttom menue
class App extends StatelessWidget {
  const App({super.key});

  Widget getWidget(context, AppModel appModel) {
    switch (appModel.currentRoutIndex) {
      case 0:
        return const Home();
      case 1:
        return const Product();
      case 2:
        return const Order();
      case 3:
        return const Profile();
      default:
        throw Exception("index error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<AppModel>(
            builder: (context, appModel, child) => Stack(children: [
                  Container(
                    child: getWidget(context,appModel),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: GNav(
                          backgroundColor: Colors.white,
                          gap: 3,
                          tabs: [
                            GButton(
                              icon: Icons.home,
                              text: 'Home',
                              onPressed: () {
                                appModel.setRoutIndex(0);
                              },
                            ),
                            GButton(
                              icon: Icons.window,
                              text: 'Produits',
                              onPressed: () {
                                appModel.setRoutIndex(1);
                              },
                            ),
                            GButton(
                              icon: Icons.shopping_bag_rounded,
                              text: 'Orders',
                              onPressed: () {
                                appModel.setRoutIndex(2);
                              },
                            ),
                            GButton(
                              icon: Icons.account_circle,
                              text: 'Profile',
                              onPressed: () {
                                appModel.setRoutIndex(3);
                              },
                            )
                          ],
                          iconSize: 20,
                          padding: const EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ),
                ])));
  }
}
