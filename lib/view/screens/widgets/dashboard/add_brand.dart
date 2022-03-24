import 'package:boutique/view/widgets/elevated_button_custom.dart';
import 'package:boutique/view/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class AddBrand extends StatelessWidget {
  const AddBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue,
      child: Center(
        child: Container(
            height: 500,
            width: 500,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            color: Colors.white,
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Text('Create Brand'.toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextInputField(
                      label: 'Brand', border: Border.all(color: Colors.black)),
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
