import 'package:boutique/models/product.dart';
import 'package:boutique/view/screens/brands.dart';
import 'package:boutique/view/screens/categories.dart';
import 'package:boutique/view/screens/create_product.dart';
import 'package:boutique/view/screens/dashboard.dart';
import 'package:boutique/view/screens/inventory.dart';
import 'package:boutique/view/screens/products.dart';
import 'package:boutique/view/screens/subcategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/strings.dart';
import '../../widgets/sidebar.dart';

class SideBar extends StatelessWidget {
  final Color colorActive = Colors.white;
  final Color colorDefault = Colors.white54;
  SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 296,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Container(
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
                    Get.offAll(Dashboard());
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
              Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.only(left: 32, top: 24),
                padding: EdgeInsets.only(left: 24),
                decoration: BoxDecoration(
                  color: (DashboardSideBar.activePage.value == 'products')
                      ? colorActive
                      : null,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    bottomLeft: Radius.circular(26),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Get.offAll(Products());
                    DashboardSideBar.activePage.value = 'products';
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.devices_sharp,
                        size: 28,
                        color: (DashboardSideBar.activePage.value != 'products')
                            ? colorDefault
                            : null,
                      ),
                      const SizedBox(width: 24),
                      Text(
                        'Products',
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              (DashboardSideBar.activePage.value != 'products')
                                  ? colorDefault
                                  : null,
                        ),
                      ),
                      const SizedBox(width: 84),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.only(left: 32, top: 24),
                padding: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: (DashboardSideBar.activePage.value == 'createProduct')
                      ? colorActive
                      : null,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    bottomLeft: Radius.circular(26),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Get.offAll(CreateProduct());
                    DashboardSideBar.activePage.value = 'createProduct';
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.create,
                        size: 28,
                        color: (DashboardSideBar.activePage.value !=
                                'createProduct')
                            ? colorDefault
                            : null,
                      ),
                      const SizedBox(width: 24),
                      Text(
                        'Create Product',
                        style: TextStyle(
                          fontSize: 16,
                          color: (DashboardSideBar.activePage.value !=
                                  'createProduct')
                              ? colorDefault
                              : null,
                        ),
                      ),
                      const SizedBox(width: 84),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.only(left: 32, top: 24),
                padding: EdgeInsets.only(left: 24),
                decoration: BoxDecoration(
                  color: (DashboardSideBar.activePage.value == 'brands')
                      ? colorActive
                      : null,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    bottomLeft: Radius.circular(26),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Get.offAll(Brands());
                    DashboardSideBar.activePage.value = 'brands';
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_tree_outlined,
                        size: 28,
                        color: (DashboardSideBar.activePage.value != 'brands')
                            ? colorDefault
                            : null,
                      ),
                      const SizedBox(width: 24),
                      Text(
                        'Brands',
                        style: TextStyle(
                          fontSize: 16,
                          color: (DashboardSideBar.activePage.value != 'brands')
                              ? colorDefault
                              : null,
                        ),
                      ),
                      const SizedBox(width: 84),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.only(left: 32, top: 24),
                padding: EdgeInsets.only(left: 24),
                decoration: BoxDecoration(
                  color: (DashboardSideBar.activePage.value == 'categories')
                      ? colorActive
                      : null,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    bottomLeft: Radius.circular(26),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Get.offAll(Categories());
                    DashboardSideBar.activePage.value = 'categories';
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_chart,
                        size: 28,
                        color:
                            (DashboardSideBar.activePage.value != 'categories')
                                ? colorDefault
                                : null,
                      ),
                      const SizedBox(width: 24),
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 16,
                          color: (DashboardSideBar.activePage.value !=
                                  'categories')
                              ? colorDefault
                              : null,
                        ),
                      ),
                      const SizedBox(width: 84),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.only(left: 32, top: 24),
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: (DashboardSideBar.activePage.value == 'subcategories')
                      ? colorActive
                      : null,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    bottomLeft: Radius.circular(26),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Get.offAll(Subcategories());
                    DashboardSideBar.activePage.value = 'subcategories';
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.category,
                        size: 28,
                        color: (DashboardSideBar.activePage.value !=
                                'subcategories')
                            ? colorDefault
                            : null,
                      ),
                      const SizedBox(width: 24),
                      Text(
                        'Subcategories',
                        style: TextStyle(
                          fontSize: 16,
                          color: (DashboardSideBar.activePage.value !=
                                  'subcategories')
                              ? colorDefault
                              : null,
                        ),
                      ),
                      const SizedBox(width: 84),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.only(left: 32, top: 24),
                padding: EdgeInsets.only(left: 24),
                decoration: BoxDecoration(
                  color: (DashboardSideBar.activePage.value == 'inventory')
                      ? colorActive
                      : null,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    bottomLeft: Radius.circular(26),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Get.offAll(InventoryScreen());
                    DashboardSideBar.activePage.value = 'inventory';
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 28,
                        color:
                            (DashboardSideBar.activePage.value != 'inventory')
                                ? colorDefault
                                : null,
                      ),
                      const SizedBox(width: 24),
                      Text(
                        'Reports',
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              (DashboardSideBar.activePage.value != 'inventory')
                                  ? colorDefault
                                  : null,
                        ),
                      ),
                      const SizedBox(width: 84),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
