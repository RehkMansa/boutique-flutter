import 'package:boutique/models/product.dart';
import 'package:boutique/view/screens/brands.dart';
import 'package:boutique/view/screens/categories.dart';
import 'package:boutique/view/screens/create_product.dart';
import 'package:boutique/view/screens/dashboard.dart';
import 'package:boutique/view/screens/inventory.dart';
import 'package:boutique/view/screens/price_history.dart';
import 'package:boutique/view/screens/product_history.dart';
import 'package:boutique/view/screens/products.dart';
import 'package:boutique/view/screens/records.dart';
import 'package:boutique/view/screens/subcategories.dart';
import 'package:boutique/view/screens/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/strings.dart';
import '../../widgets/sidebar.dart';

class SideBar extends StatelessWidget {
  final Color colorActive = Colors.white;
  final Color colorDefault = Colors.white54;
  var subMenuToggle = false.obs;
  static var subMenuPage = '';
  SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 296,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 48, bottom: 48, left: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(27.0),
                    child: Image.asset(Str.brandImage, width: 54, height: 54),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    Str.brandName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 52,
              padding: EdgeInsets.only(left: 24),
              margin: const EdgeInsets.only(left: 32),
              decoration: BoxDecoration(
                color: (DashboardSideBar.activePage.value == 'dashboard')
                    ? colorActive
                    : null,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  bottomLeft: Radius.circular(26),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Get.offAll(() => Dashboard());
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.home,
                      size: 28,
                      color: Colors.white54,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white54,
                      ),
                    )
                  ],
                ),
              ),
            ),
            sideBarElement(
              pageName: 'products',
              redirectURL: Products(),
              icon: Icons.devices_sharp,
            ),
            sideBarElement(
              pageName: 'create product',
              redirectURL: CreateProduct(),
              icon: Icons.create,
            ),
            sideBarElement(
              pageName: 'brands',
              redirectURL: Brands(),
              icon: Icons.account_tree_outlined,
            ),
            sideBarElement(
              pageName: 'categories',
              redirectURL: Categories(),
              icon: Icons.add_chart,
            ),
            sideBarElement(
              pageName: 'subcategories',
              redirectURL: Subcategories(),
              icon: Icons.category,
            ),
            sideBarElement(
              pageName: 'transaction history',
              redirectURL: TransactionHistory(),
              icon: Icons.transfer_within_a_station_sharp,
            ),
            sideBarElement(
              pageName: 'records',
              redirectURL: Records(),
              icon: Icons.stacked_bar_chart,
            ),
          ],
        ),
      ),
    );
  }

  Widget sideBarElement({
    required String pageName,
    required Widget redirectURL,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        height: 52,
        padding: const EdgeInsets.only(left: 24),
        margin: const EdgeInsets.only(left: 32),
        decoration: BoxDecoration(
          color: (DashboardSideBar.activePage.value ==
                  (pageName.toLowerCase()).toString())
              ? colorActive
              : null,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(26),
            bottomLeft: Radius.circular(26),
          ),
        ),
        child: InkWell(
          onTap: () {
            Get.offAll(() => redirectURL);
            DashboardSideBar.activePage.value = pageName;
          },
          child: Row(
            children: [
              Icon(
                icon,
                size: 28,
                color: (DashboardSideBar.activePage.value !=
                        pageName.toLowerCase())
                    ? colorDefault
                    : null,
              ),
              const SizedBox(width: 16),
              Text(
                (pageName.capitalizeFirst).toString(),
                style: TextStyle(
                  fontSize: 18,
                  color: (DashboardSideBar.activePage.value !=
                          pageName.toLowerCase())
                      ? colorDefault
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sideBarMain({
    required String pageName,
    required Widget redirectURL,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        Get.offAll(() => (Records()));
        SideBar.subMenuPage = '';
        DashboardSideBar.activePage.value = 'inventory';
        subMenuToggle.value = true;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.stacked_bar_chart,
              size: 28,
              color: (DashboardSideBar.activePage.value != 'inventory')
                  ? colorDefault
                  : null,
            ),
            const SizedBox(width: 16),
            Text(
              'Reports',
              style: TextStyle(
                fontSize: 16,
                color: (DashboardSideBar.activePage.value != 'inventory')
                    ? colorDefault
                    : null,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget sideBarSubMenu({
    required Widget redirectURL,
    required String subPageName,
    required IconData icon,
    onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,
                size: 28,
                color: (subMenuPage == subPageName) ? Colors.blueAccent : null),
            const SizedBox(width: 16),
            Text(
              (subPageName.capitalizeFirst).toString(),
              style: TextStyle(
                  fontSize: 16,
                  color:
                      (subMenuPage == subPageName) ? Colors.blueAccent : null),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
