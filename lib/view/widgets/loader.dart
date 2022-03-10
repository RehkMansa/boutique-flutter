import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 10,
            height: 10,
           // padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
            ),
          ),
          Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            // margin: EdgeInsets.all(800),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
            ),
          ),
          Container(
            width: 10,
            height: 10,
            //padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
