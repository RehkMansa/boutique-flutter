import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;
  final double? textSize;
  final Function()? buttonAction;
  final bool showButton;

  const ScreenTitle({
    Key? key,
    this.title = '',
    this.buttonAction,
    this.showButton = false,
    this.textSize,
    this.text = 'Add', 
    this.icon = Icons.add,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              fontSize: (textSize == null) ? 38 : textSize,
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: SizedBox(
            width: 1,
          ),
        ),
        showButton
            ? Container(
                width: 120,
                child: ElevatedButton.icon(
                  onPressed: buttonAction,
                  label: Text(text),
                  icon:  Icon(icon),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ]),
    );
  }
}
