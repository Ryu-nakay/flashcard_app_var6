import 'package:flutter/widgets.dart';

class HomeNavbarModel extends ChangeNotifier{
  int navIndex=0;

  void navIndexUpdate(int value){
    this.navIndex=value;
    notifyListeners();
  }
}