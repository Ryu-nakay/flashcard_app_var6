import 'package:flutter/foundation.dart';

class MakeAndEditModel extends ChangeNotifier{
  String listNam='';

  List<CardInfo> wordsInfo=[];

}


class CardInfo{
  String front;//表面の単語
  String frontMemo;//表面のメモ
  String back;//裏面の単語
  String backMemo;//裏面のメモ

  CardInfo({required this.front,required this.frontMemo,required this.back,required this.backMemo});

}