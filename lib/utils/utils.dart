class Utils {
  static int count = 0;
}

void dnd(data) {
  print('[ISAAC] ' + Utils.count.toString() + ': ' + data.toString());
  print('______________________________________________________________________________________________________________');
  Utils.count++;
}
