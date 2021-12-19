import 'dart:math' as math;
import 'dart:math';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

dynamic mixFCList(List items) {
    var random = new Random();
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    return items;
  }


