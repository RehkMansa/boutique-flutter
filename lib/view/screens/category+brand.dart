import 'package:boutique/view/widgets/elevated_button_custom.dart';
import 'package:boutique/view/widgets/sidebar.dart';
import 'package:boutique/view/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/drop_down.dart';

class AddCateGoryAndBrand extends StatelessWidget {
  const AddCateGoryAndBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blue,
          child: Row(children: [
            Container(
              margin: EdgeInsets.fromLTRB(50, 30, 0, 30),
              child: SideBar(),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.fromLTRB(20, 30, 30, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.black87,
                  ),
                  width: Get.width,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Create Category',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      letterSpacing: 1),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: TextInputField(label: 'Category'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: TextInputField(label: 'Description'),
                                ),
                              ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              margin: EdgeInsets.all(15),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Create Sub Category',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          letterSpacing: 1),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Container(
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const DropDown(
                                          defaultValue: 'Category',
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(20),
                                      child:
                                          TextInputField(label: 'Sub Category'),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(20),
                                      child:
                                          TextInputField(label: 'Description'),
                                    ),
                                  ]),
                            ),
                            Container(
                              width: 600,
                              margin: EdgeInsets.all(20),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Create Brand',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          letterSpacing: 1),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: TextInputField(label: 'Brand'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child:
                                          TextInputField(label: 'Description'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: TextInputField(label: 'Brand ID'),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ])),
    );
  }
}
