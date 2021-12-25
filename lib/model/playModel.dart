import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PlayModel extends ChangeNotifier{
  bool modeflag=true;
  bool randomflag=false;

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

  //モード関連

  void setModeflag(bool v){
    this.modeflag=v;
    notifyListeners();
  }

  void setRandomflag(bool v){
    this.randomflag=v;
    notifyListeners();
  }
}