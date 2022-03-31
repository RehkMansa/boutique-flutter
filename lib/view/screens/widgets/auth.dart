import 'package:boutique/res/strings.dart';
import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  final String image;
  const AuthTitle({
    Key? key,
    this.title = '',
    this.image = Str.brandImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (image == '') ? const SizedBox.shrink() : Image.asset(image, width: 64, height: 54),
          (title == '')
              ? const SizedBox.shrink()
              : const Text(
                  signIn,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
        ],
      ),
    );
  }
}
