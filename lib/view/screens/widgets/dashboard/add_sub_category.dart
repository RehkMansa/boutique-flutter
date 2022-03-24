import 'package:boutique/view/widgets/drop_down.dart';
import 'package:boutique/view/widgets/elevated_button_custom.dart';
import 'package:boutique/view/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSubCategory extends StatelessWidget {
  const AddSubCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue,
      child: Center(
        child: Container(
            height: 500,
            width: 520,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            color: Colors.white,
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Text('Add SubCategory'.toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DropDown(
                        defaultValue: 'Category',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextInputField(
                      label: 'Subcategory',
                      border: Border.all(color: Colors.black)),
                ),
                ElevatedButtonCustom(
                  buttonAlignment: Alignment.centerRight,
                  text: 'Submit',
                  onPressed: () {},
                  //color: Colors.blue,
                )
              ],
            )),
      ),
    ));
  }
}
