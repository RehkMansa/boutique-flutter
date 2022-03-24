import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  final Color background;
  final String text;
  final Function onPressed;

  const WideButton(
      {Key? key,
      required this.background,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 55,
      child: OutlinedButton(
        onPressed: () {},
        child: Text(text.toUpperCase()),
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: background,
          fixedSize: const Size(double.infinity, 48),
          textStyle: const TextStyle(
            letterSpacing: 1.5,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
