import 'package:flutter/widgets.dart';

class ColorModel extends ChangeNotifier{
  Color appbarColor1;
  Color appbarTextColor;
  Color bodyColor1;
  Color bodyColor2;
  Color textColor;

  ColorModel(this.appbarColor1,this.appbarTextColor,this.bodyColor1,this.bodyColor2,this.textColor);
}