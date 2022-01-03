import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'cardListModel.dart';

class MyPageModel extends ChangeNotifier{
  List<Map<String,double>> dataMap=[];

  PageController cardPageController=PageController();

  int cardPageIndex=0;

  int pageDuration=600;

  //ページ関連
  void changePageIndex(int page){
    cardPageIndex=page;
    print(cardPageIndex);
    notifyListeners();
  }

  void nextPage(){
    cardPageController.nextPage(duration: Duration(milliseconds: pageDuration), curve: Curves.ease);
    notifyListeners();
  }

  void previousPage(){
    cardPageController.previousPage(duration: Duration(milliseconds: pageDuration), curve: Curves.ease);
    notifyListeners();
  }

}