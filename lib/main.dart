import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/flashcardModel.dart';
import 'package:flashcard_app_ver6/model/homeNavbarModel.dart';
import 'package:flashcard_app_ver6/model/makeAndEditModel.dart';
import 'package:flashcard_app_ver6/model/pieChartModel.dart';
import 'package:flashcard_app_ver6/model/playModel.dart';
import 'package:flashcard_app_ver6/ui/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,//縦固定
  ]);
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CardListModel(),
        ),
        ChangeNotifierProvider(
          create: (_) =>ColorModel(appbarColor1: Colors.black, appbarTextColor: Colors.white, bodyColor1: Colors.white, bodyColor2: Colors.white, textColor: Colors.black) // ColorModel( Colors.white, Colors.black, Colors.white, Colors.white, Colors.black),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeNavbarModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => MakeAndEditModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlayModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PieChartModel(),
        ),
      ],
      child: MyApp()
    )
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home:HomePage(),
    );
  }
}