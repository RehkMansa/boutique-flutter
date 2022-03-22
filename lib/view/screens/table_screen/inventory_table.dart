import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:boutique/controllers/inventory_controller.dart';
import 'package:boutique/view/screens/table_screen/table_cell.dart';
import 'package:boutique/view/screens/table_screen/table_data.dart';
import 'package:boutique/view/screens/table_screen/text_label.dart';
import 'package:boutique/view/widgets/search_input.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryTable extends StatelessWidget {
  InventoryTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: Get.width,
        child: DataTable(
          columns: <DataColumn>[
            tableColumn('Inventory ID'),
            tableColumn('Name'),
            tableColumn('Description'),
            tableColumn('Unit Price'),
            tableColumn('Quantity Purchased'),
            tableColumn('Quantity In stock'),
            tableColumn('Date added'),
          ],
          rows: <DataRow>[
            tableData('Texting the', 'Texting the', 'Texting the', 'Texting',
                '', '', ''),
            tableData('Texting the', 'Texting the', 'Texting the', 'Texting',
                '', '', ''),
            tableData('Texting the', 'Texting the', 'Texting the', 'Texting',
                '', '', ''),
            tableData('Texting the', 'Texting the', 'Texting the', 'Texting',
                '', '', ''),
          ],
        ),
      ),
    );
  }
}
