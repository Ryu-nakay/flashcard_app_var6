import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flashcardModel.dart';

class MakeAndEditModel extends ChangeNotifier{
  String listNam='';

  int cardPageIndex=0;


  List<bool> checkboxBoolList=[];

  void changePage(int page){
    this.cardPageIndex=page;
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
  }

  void initCBL(List<CardData> inputCards){
    this.checkboxBoolList=[];
    for (var item in inputCards) {
      checkboxBoolList.add(false);
    }
    notifyListeners();
  }

  void chageCheckbox(int index,bool value){
    this.checkboxBoolList[index]=value;
    notifyListeners();
  }

  void deleteCards(CardList inputItem){
    List<int> deleteList=[];

    for (var i = 0; i <checkboxBoolList.length ; i++) {
      if(checkboxBoolList[i]==true){
        deleteList.add(i);
      }
    }
    deleteList.sort((a, b) => -a.compareTo(b));
    print(deleteList);
    for (int index in deleteList) {
      inputItem.cards.removeAt(index);
      checkboxBoolList[index]=false;
    }
    notifyListeners();
  }
}
