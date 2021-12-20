import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MakeAndEditModel extends ChangeNotifier{
  String listNam='';

  List<CardInfo> wordsInfo=[];

  PageController cardPageController=PageController();
  int cardPageIndex=0;

  int pageDuration=1000;

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


class CardInfo{
  String front;//表面の単語
  String frontMemo;//表面のメモ
  String back;//裏面の単語
  String backMemo;//裏面のメモ

  CardInfo({required this.front,required this.frontMemo,required this.back,required this.backMemo});

}