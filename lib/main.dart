import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flashcard_app_ver6/model/homeNavbarModel.dart';
import 'package:flashcard_app_ver6/model/makeAndEditModel.dart';
import 'package:flashcard_app_ver6/model/myPageModel.dart';
import 'package:flashcard_app_ver6/model/playModel.dart';
import 'package:flashcard_app_ver6/ui/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          create: (_) =>ColorModel() // ColorModel( Colors.white, Colors.black, Colors.white, Colors.white, Colors.black),
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
          create: (_) => MyPageModel(),
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
      localizationsDelegates: L10n.localizationsDelegates, // これ！
      supportedLocales: L10n.supportedLocales,// これ！
      home:HomePage(),
    );
  }
}