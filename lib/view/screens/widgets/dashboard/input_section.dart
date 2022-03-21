import 'package:boutique/view/screens/widgets/dashboard/description_filed.dart';
import 'package:boutique/view/screens/widgets/dashboard/items_fields.dart';
import 'package:boutique/view/screens/widgets/dashboard/quantity+input.dart';
import 'package:flutter/cupertino.dart';

class InputSection extends StatelessWidget {
  const InputSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 800,
          child: Row(
            children: const [
              ItemFields(label: 'Name', text: 'Enter name'),
              SizedBox(width: 16.0),
              ItemFields(label: 'ID', text: 'Enter Id'),
            ],
          ),
        ),
        Container(
          width: 800,
          child: Row(
            children: const [
              ItemFields(label: 'Price', text: 'Enter Price'),
              SizedBox(width: 10),
              QuantityInput(),
            ],
          ),
        ),
        const DescriptionField(),
      ],
    );
  }
}
