import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MakeAndEditModel extends ChangeNotifier{
  String listNam='';

  PageController cardPageController=PageController();
  int cardPageIndex=0;

  int pageDuration=600;



  void nextPage(){
    cardPageController.nextPage(duration: Duration(milliseconds: pageDuration), curve: Curves.ease);
    //notifyListeners();
  }

  Future<void> previousPage()async{
    cardPageController.previousPage(duration: Duration(milliseconds: pageDuration), curve: Curves.ease);
    //notifyListeners();
  }

}
