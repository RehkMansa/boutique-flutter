import 'package:boutique/models/brand.dart';
import 'package:boutique/view/screens/brands.dart';
import 'package:boutique/view/screens/categories.dart';
import 'package:boutique/view/screens/create_product.dart';
import 'package:boutique/view/screens/dashboard.dart';
import 'package:boutique/view/screens/products.dart';
import 'package:boutique/view/screens/subcategories.dart';
import 'package:boutique/view/screens/widgets/dashboard/add_brand.dart';
import 'package:boutique/view/screens/widgets/dashboard/add_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardSideBar extends StatelessWidget {
  static final activePage = ''.obs;
  const DashboardSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 72,
      margin: const EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black87,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sideBarIcon('home.png', onTap: () {
                Get.offAll(() => Dashboard());
                activePage.value = 'dashboard';
              }),
              sideBarIcon('createproduct.png', onTap: () {
                Get.offAll(() => CreateProduct());
                activePage.value = 'create product';
              }),
              sideBarIcon('product.png', onTap: () {
                Get.offAll(() => Products());
                activePage.value = 'products';
              }),
              sideBarIcon('brand.png', onTap: () {
                Get.offAll(() => Brands());
                activePage.value = 'brands';
              }),
              sideBarIcon('categories.png', onTap: () {
                Get.offAll(() => Categories());
                activePage.value = 'categories';
              }),
              sideBarIcon('subcategory.png', onTap: () {
                Get.offAll(() => Subcategories());
                activePage.value = 'subcategories';
              }),
              // sideBarIcon('back.png', onTap: Get.off(Dashboard())),
            ]),
      ),
    );
  }
}

sideBarIcon(String iconImage, {onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Color(0xFFDADEE4)),
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          child: Image.asset(
            'assets/images/$iconImage',
            color: Color(0xFF091222),
            height: 30,
            width: 30,
          ),
        )),
  );
}
