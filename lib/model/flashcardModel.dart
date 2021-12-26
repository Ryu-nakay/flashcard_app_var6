import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


//flashcard_list_model
class CardListModel extends ChangeNotifier{
  List<CardList> list=[CardList(name:'テスト単語帳',tableName:'テスト単語帳１',cards: [CardData(id:1, front: 'test１',frontMemo: 'メモおもて',back: 'テスト１',backMemo: 'メモうら',evaluation: 'average'),CardData(id:2, front: 'test2',frontMemo: 'メモおもて2',back: 'テスト2',backMemo: 'メモうら2',evaluation: 'average')])]; 

  FlashcardListModel(){
    //getDBdata();
  }

  void addNewCard(int inputItemIndex){
    int maxID=0;
    for (var item in this.list[inputItemIndex].cards) {
      if(item.id>maxID){
        maxID=item.id;
      }
    }
    this.list[inputItemIndex].cards.add(CardData(id:maxID+1, front: '', frontMemo: '', back:'', backMemo: '', evaluation: ''));
    notifyListeners();
  }

  void changeCardEvaluation(String newStatus,int inputItemIndex,int inputCardIndex){
    this.list[inputItemIndex].cards[inputCardIndex].evaluation=newStatus;
    notifyListeners();
  }

  //DB関連

  //DBのインスタンス化
  Future<Database> get database async {
    final Future<Database> _database = openDatabase(
      join(await getDatabasesPath(), 'FC_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE FlashCardTable(name TEXT,id INTEGER PRIMARY KEY AUTOINCREMENT,tableName TEXT)",
        );
      },
      version: 1,
    );
    return _database;
  }

  //テーブル作成
  Future<void> makeFC(CardList tempCardList)async{
    final db=await database;
    db.rawQuery('CREATE TABLE '+tempCardList.tableName+' (id INTEGER PRIMARY KEY AUTOINCREMENT,front TEXT,frontMemo TEXT,back TEXT,backMemo TEXT,evaluation TEXT)');
    for (var item in tempCardList.cards) {
      db.rawQuery('INSERT INTO '+tempCardList.tableName+'(front,frontMemo,back,backMemo,evaluation) VALUES('+'\''+item.front.toString()+'\',\''  +item.frontMemo.toString()+'\',\'' +item.back.toString()+'\',\'' +item.backMemo.toString()+'\',\'' +item.evaluation.toString()+'\''+')');
    }
    String name=tempCardList.name;
    String tableName=tempCardList.tableName;
    db.rawQuery('INSERT INTO FlashCardTable(name,tableName) VALUES(\'$name\',\'$tableName\')');
    print('makeFC() was done\n\n\n\n\n\n\n\n');
  }

}

//1件の単語帳データクラス
class CardList{
  String name;
    //単語帳の名前
  String tableName;
    //単語データのテーブル名
  List<CardData> cards;
    //単語のリスト

  CardList({required this.name,required this.tableName,required this.cards});
}

//１セットの単語データクラス
class CardData{
  int id;//カード識別ID
  String front;//表面の単語
  String frontMemo;//表面のメモ
  String back;//裏面の単語
  String backMemo;//裏面のメモ
  String evaluation;//評価 good,average,poor

  CardData({required this.id,required this.front,required this.frontMemo,required this.back,required this.backMemo,required this.evaluation});
}