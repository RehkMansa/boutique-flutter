import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String text;
  final Alignment buttonAlignment;
  final Color? color;
  final EdgeInsets? margin;
  final onPressed;
  const ElevatedButtonCustom(
      {Key? key,
      required this.text,
      this.color,
      this.margin,
      required this.onPressed,
      required this.buttonAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: buttonAlignment,
      child: Container(
        margin: (margin != null)
            ? margin
            : const EdgeInsets.fromLTRB(10, 20, 30, 10),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              fixedSize: const Size(double.infinity, 48),
              primary: (color != null) ? color : Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(text)),
      ),
    );
  }
}
