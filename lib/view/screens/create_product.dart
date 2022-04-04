import 'package:boutique/view/widgets/drop_down.dart';
import 'package:boutique/view/widgets/form_button.dart';
import 'package:boutique/view/widgets/product_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';
import '../../res/lists.dart';
import '../../utils/utils.dart';
import 'my_widgets/screen_title.dart';
import 'my_widgets/side_bar.dart';

class CreateProduct extends GetView<ProductController> {
  CreateProduct({Key? key}) : super(key: key);
  var productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    var nameCon = TextEditingController(text: '');
    var idCon = TextEditingController(text: '');
    var priceCon = TextEditingController(text: '');
    var categoryString = '--Select category--'.obs;
    var subcategoryString = '--Select subcategory--'.obs;
    var brandString = '--Select brand--'.obs;
    var quantityString = '--Select quantity--'.obs;

    var descriptionCon = TextEditingController(text: '');
    productController.listBrand();
    productController.listCategories();
    productController.listSubcategories();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Row(
          children: [
            SideBar(),
            Expanded(
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScreenTitle(
                        title: 'CreateProduct',
                        buttonAction: () => productController.toggleCard(),
                        showButton: false,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 48, bottom: 8),
                        child: const Text(
                          'Fill the form to add product',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Text('Scan item barcode for product id or leave blank if item does not have barcode'),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: ProductInput(hint: 'Product Id', label: 'Item Id', controller: idCon)),
                          const SizedBox(width: 10),
                          Expanded(child: ProductInput(hint: 'Enter item name', label: 'Name of item', controller: nameCon)),
                        ],
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: ProductInput(hint: 'Price', label: 'Price (NGN)', controller: priceCon)),
                            const SizedBox(width: 10),
                            Expanded(
                              child: DropDown(
                                label: 'Brand',
                                value: brandString,
                                dropdownList: productController.brandDropdown,
                                onChanged: (value) => brandString.value = value,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        // height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DropDown(
                                label: 'Category',
                                value: categoryString,
                                dropdownList: productController.categoryDropdown,
                                onChanged: (value) => categoryString.value = value,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: DropDown(
                                label: 'Subcategory',
                                value: subcategoryString,
                                dropdownList: productController.subcategoryDropdown.value,
                                onChanged: (value) => subcategoryString.value = value,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: DropDown(
                              label: 'Quantity',
                              value: quantityString,
                              dropdownList: Lst.quantity,
                              onChanged: (value) {
                                dnd(value);
                                quantityString.value = value;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: ProductInput(hint: 'Describe item here...', label: 'Description', controller: descriptionCon),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(flex: 2, child: SizedBox(width: 10)),
                          Expanded(
                            flex: 1,
                            child: FormButton(
                              text: 'Add Product',
                              onPressed: () {
                                productController.add(
                                  name: nameCon.text,
                                  productId: idCon.text,
                                  price: priceCon.text,
                                  brand: brandString.value,
                                  category: categoryString.value,
                                  subcategory: subcategoryString.value,
                                  quantity: quantityString.value,
                                  description: descriptionCon.text,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
