import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


//flashcard_list_model
class CardListModel extends ChangeNotifier{
  List<CardList> list=[CardList(name:'テスト単語帳',tableName:'テスト単語帳１',cards: [Card(id:1, front: 'test１',frontMemo: 'メモおもて',back: 'テスト１',backMemo: 'メモうら',evaluation: 'average'),Card(id:2, front: 'test2',frontMemo: 'メモおもて2',back: 'テスト2',backMemo: 'メモうら2',evaluation: 'average')])]; 

  FlashcardListModel(){
    //getDBdata();
  }
}

//1件の単語帳データクラス
class CardList{
  String name;
    //単語帳の名前
  String tableName;
    //単語データのテーブル名
  List<Card> cards;
    //単語のリスト

  CardList({required this.name,required this.tableName,required this.cards});
}

//１セットの単語データクラス
class Card{
  int id;//カード識別ID
  String front;//表面の単語
  String frontMemo;//表面のメモ
  String back;//裏面の単語
  String backMemo;//裏面のメモ
  String evaluation;//評価 good,average,poor

  Card({required this.id,required this.front,required this.frontMemo,required this.back,required this.backMemo,required this.evaluation});
}