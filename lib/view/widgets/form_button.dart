import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final Color? primaryColor;
  final Function()? onPressed;

  const FormButton(
      {Key? key, this.text = 'Submit', this.onPressed, this.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: (primaryColor == null) ? Colors.black87 : primaryColor,
          fixedSize: const Size(double.infinity, 48),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
