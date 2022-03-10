import 'package:get/get.dart';

const String authToken =
    'kOoT3jVQAK73GAsRrftjnnXzXS6o7lfLi9iMENmJOx1nYbDPgaiqk7vs5lEpfXg4LMF+wFZWWommwTf1CrqTU1ZZz/my4WZxuReq/uDdBIs=bq';
const baseUrl =
    debug ? 'http://192.168.137.1/boutique/' : 'http://192.168.137.1/boutique/';
const requestHeader = {'Authorization': authToken};

const bool debug = true;

var context = Get.context;
var screenWidth = context?.width;
var screenHeight = context?.height;
