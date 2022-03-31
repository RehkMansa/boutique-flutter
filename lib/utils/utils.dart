class Utils {
  static int count = 0;

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
