import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AboutAppPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Consumer<ColorModel>(builder: (context, color_model, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);  
            }, 
            icon: Icon(Icons.arrow_back_ios)
          ),
          title:const Text('Settings'),
          centerTitle: true,
          backgroundColor: Provider.of<ColorModel>(context).appbarColor1,
        ),
        body: Container(
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('現在のカラー:${color_model.colorMode}'),
                  ElevatedButton(
                    onPressed: (){
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Container(
                    //Pickerの高さを指定。指定しない場合はフルスクリーン。
                            height: 250,
                            color: Colors.white,
                            child: Column(
                              children: [
                                TextButton(
                                  child: const Text('閉じる'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                const Divider(),
                                Expanded(
                                  child: CupertinoPicker(
                    // ループさせるかどうか
                                    looping: false,
                    // Pickerのそれぞれの高さ
                                    itemExtent: 30,
                    //先程作成したnumbarsリストをText Widgetに変換して読み込み。
                                    children: color_model.colorList.map((numbar) => new Text(numbar)).toList(),
                    //Pickerの操作を行う度に呼び出し。
                    //selectNumbarに選択したnumbarsを代入。
                                    onSelectedItemChanged: (index) {
                                      color_model.changeColorPicker(index);
                                    },

                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                    }, 
                    child: Text('色を選択'),
                    style: ElevatedButton.styleFrom(
                      primary: color_model.textColor
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text('変更予定の色:${color_model.selectListColor}'),
                  ElevatedButton(
                    onPressed:color_model.selectListColor!=color_model.colorMode? 
                    (){
                      color_model.changeColorMode();
                    }
                    :null, 
                    child: Text('適用'),
                    style: ElevatedButton.styleFrom(
                      primary: color_model.textColor
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

