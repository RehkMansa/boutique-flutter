import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final Function()? buttonAction;
  final bool showButton;

  const ScreenTitle({Key? key, this.title = '', this.buttonAction, this.showButton = false}) : super(key: key);

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
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              fontSize: 38,
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
                  label: const Text('Add'),
                  icon: const Icon(Icons.add),
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
