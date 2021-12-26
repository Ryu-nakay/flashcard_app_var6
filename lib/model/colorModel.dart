import 'package:flutter/widgets.dart';

class ColorModel extends ChangeNotifier{
  Color appbarColor1;
  Color appbarTextColor;
  Color bodyColor1;
  Color bodyColor2;
  Color textColor;

  ColorModel({required this.appbarColor1,required this.appbarTextColor,required this.bodyColor1,required this.bodyColor2,required this.textColor});
}