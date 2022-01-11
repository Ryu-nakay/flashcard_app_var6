import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ColorModel extends ChangeNotifier{
  List<String> colorList=['Light','Dark','Blue','Matrix'];
  String selectListColor='Light';

  ColorModel(){
    Future(()async{
      await selectColor();
      print(colorMode+'///////');
    });

    print(colorMode+';;;;');
  }

  void resetSelectionColor(){
    selectListColor=colorMode;
  }

  void changeColorPicker(index){
    selectListColor=colorList[index];
    notifyListeners();
  }

  Future<void> changeColorMode() async {
    colorMode=selectListColor;
    applyColor();
    await updateColorDB();
  }

  void applyColor(){
    if(colorMode=='Light'){
      appbarColor1=Colors.black;
      appbarTextColor=Colors.white;
      backgroundColor=Colors.white;
      mainColor=Colors.black;
      textColor=Colors.black;
      textInMainColor=Colors.white;
      cardColor=Colors.white;
      cardTextColor=Colors.black;
    }else if(colorMode=='Blue'){
      appbarColor1=Colors.blueAccent;
      appbarTextColor=Colors.white;
      backgroundColor=Colors.white;
      mainColor=Colors.blueAccent;
      textColor=Colors.black;
      textInMainColor=Colors.white;
      cardColor=Colors.white;
      cardTextColor=Colors.black;
    }else if(colorMode=='Dark'){
      appbarColor1=Colors.black;
      appbarTextColor=Colors.white;
      backgroundColor=Color(0xFF15202B);
      mainColor=Colors.black;
      textColor=Colors.white;
      textInMainColor=Colors.white;
      cardColor=Colors.white;
      cardTextColor=Colors.black;
    }else if(colorMode=='Matrix'){
      appbarColor1=Colors.black;
      appbarTextColor=Colors.green;
      backgroundColor=Color(0xFF15202B);
      mainColor=Colors.black;
      textColor=Colors.green;
      textInMainColor=Colors.green;
      cardColor=Colors.white;
      cardTextColor=Colors.black;
    }else{
      appbarColor1=Colors.black;
      appbarTextColor=Colors.white;
      backgroundColor=Colors.white;
      mainColor=Colors.black;
      textColor=Colors.black;
      textInMainColor=Colors.white;
      cardColor=Colors.white;
      cardTextColor=Colors.black;

      colorMode='Light';
    }

    notifyListeners();
  }

  String colorMode='Dark';

  Color appbarColor1=Colors.black;
  Color appbarTextColor=Colors.white;
  Color backgroundColor=Colors.white;
  Color mainColor=Colors.black;
  Color textColor=Colors.black;
  Color textInMainColor=Colors.white;
  Color cardColor=Colors.white;
  Color cardTextColor=Colors.black;


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

  Future<void> updateColorDB()async{
    final Database db=await database;
    db.rawQuery('UPDATE ColorTable SET color=\'${colorMode}\'');
    print('color is updated');
  }

}