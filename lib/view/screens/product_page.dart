// import 'package:boutique/view/widgets/drop_down.dart';
// import 'package:boutique/view/widgets/elevated_button_custom.dart';
// import 'package:boutique/view/widgets/sidebar.dart';
// import 'package:boutique/view/widgets/text_input_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProductPage extends StatelessWidget {
//   const ProductPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.blue,
//         child: Row(
//           children: [
//             Container(
//               margin: EdgeInsets.fromLTRB(50, 30, 0, 30),
//               child: SideBar(),
//             ),
//             Expanded(
//               child: Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.all(30),
//                 margin: EdgeInsets.fromLTRB(10, 30, 30, 30),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   // color: Colors.black87,
//                 ),
//                 width: Get.width,
//                 height: double.infinity,
//                 child: SingleChildScrollView(
//                     child: Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 30),
//                       child: Text(
//                         'Enter Product Details'.toUpperCase(),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 30,
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 3,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(30.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           TextInputField(label: 'Product ID'),
//                           SizedBox(width: 35.0),
//                           TextInputField(label: 'Name'),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(30.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           TextInputField(label: 'Description'),
//                           SizedBox(width: 35.0),
//                           TextInputField(label: 'Price'),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(30.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                               width: 600,
//                               alignment: Alignment.centerLeft,
//                               decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)),
//                               child: const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: DropDown(
//                                   width: 600,
//                                   dropdownList: ['Category'],
//                                   label: '',
//                                 ),
//                               )),
//                           const SizedBox(width: 35.0),
//                           Container(
//                             width: 600,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)),
//                             child: const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 8),
//                               child: DropDown(
//                                 width: 600,
//                                 dropdownList: ['Category'],
//                                 label: '',
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(30.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                               width: 600,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)),
//                               child: const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: DropDown(
//                                   width: 600,
//                                   dropdownList: ['Category'],
//                                   label: '',
//                                 ),
//                               )),
//                           const SizedBox(width: 35.0),
//                           const TextInputField(label: 'Quantity'),
//                         ],
//                       ),
//                     ),
//                     ElevatedButtonCustom(text: 'Submit', onPressed: () {}, buttonAlignment: Alignment.centerRight)
//                   ],
//                 )),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
