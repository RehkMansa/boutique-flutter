import 'package:flutter/material.dart';

class QuantityInput extends StatelessWidget {
  const QuantityInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(17),
            decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            child:
                const Text('Quantity', style: TextStyle(color: Colors.white)),
          ),
          Container(
            width: 290,
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: '1',
                  prefixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black12,
                      //radius: 30,
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 15,
                        ),
                        onPressed: null,
                      ),
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black12,
                      //radius: 30,
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          size: 15,
                        ),
                        onPressed: null,
                      ),
                    ),
                  ),
                  border: InputBorder.none),
            ),
          )
        ]),
      ),
    );
  }
}
