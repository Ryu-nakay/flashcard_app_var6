import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ColorModel extends ChangeNotifier{
  List<String> colorList=['Light','Blue'];
  String selectListColor='Light';

  void changeColorPicker(index){
    selectListColor=colorList[index];
    notifyListeners();
  }

  void changeColorMode(){
    colorMode=selectListColor;
    applyColor();
  }

  void applyColor(){
    if(colorMode=='Light'){
      appbarColor1=Colors.black;
      appbarTextColor=Colors.white;
      bodyColor1=Colors.white;
      bodyColor2=Colors.white;
      textColor=Colors.black;
    }else if(colorMode=='Blue'){
      appbarColor1=Colors.blueAccent;
      appbarTextColor=Colors.white;
      bodyColor1=Colors.white;
      bodyColor2=Colors.white;
      textColor=Colors.blueAccent;
    }else{
      appbarColor1=Colors.black;
      appbarTextColor=Colors.white;
      bodyColor1=Colors.white;
      bodyColor2=Colors.white;
      textColor=Colors.black;
    }

    notifyListeners();
  }

  String colorMode='Dark';

  Color appbarColor1=Colors.black;
  Color appbarTextColor=Colors.white;
  Color bodyColor1=Colors.white;
  Color bodyColor2=Colors.white;
  Color textColor=Colors.black;

  ColorModel(){
    Future(()async{
      await selectColor();
      print(colorMode+'///////');
    });

    print(colorMode+';;;;');
  }

  //DBのインスタンス化
  Future<Database> get database async {
    final Future<Database> _database = openDatabase(
      join(await getDatabasesPath(), 'color_database.db'),
      onCreate: (db, version) {
        db.rawQuery("CREATE TABLE ColorTable(color TEXT)");
        db.rawQuery('INSERT INTO ColorTable(color) VALUES(\'Light\')');
      },
      version: 1,
    );

    print('getDB');
    return _database;
  }

  Future<void> selectColor()async{
    final Database db=await database;
    final List<Map<String,dynamic>> maps=await db.rawQuery('SELECT * FROM ColorTable');
    String colorData=maps[0]['color'];

    colorMode=colorData;

    applyColor();

    notifyListeners();
  }


}