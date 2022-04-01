import 'package:intl/intl.dart';

class Utils {
  static int count = 0;
  static final NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
  static int getTimestamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static String generateDbId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}

void dnd(data) {
  print('[ISAAC] ' + Utils.count.toString() + ': ' + data.toString());
  print('______________________________________________________________________________________________________________');
  Utils.count++;
}
