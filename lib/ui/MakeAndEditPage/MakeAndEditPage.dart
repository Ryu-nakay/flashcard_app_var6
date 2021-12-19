import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/flashcardModel.dart';
import 'package:flashcard_app_ver6/ui/MakeAndEditPage/InputCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MakeAndEditPage extends StatelessWidget{
  CardList item;

  MakeAndEditPage(this.item);

  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ColorModel>(context).appbarColor1,
        centerTitle: true,
        title: Text(
          '作成',
          style: TextStyle(
            color: Provider.of<ColorModel>(context).appbarTextColor,
            fontSize: AppBar().preferredSize.height*0.3
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width:size.width ,
            child: Row(
              children: [
                Text(
                  '名前：',
                  style: TextStyle(
                    fontSize: size.width*0.05
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    cursorColor: Provider.of<ColorModel>(context).textColor,
                    decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Provider.of<ColorModel>(context).textColor
                        )
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Provider.of<ColorModel>(context).textColor,
                          width: 2
                        )
                      ),
                      border: OutlineInputBorder(),
                      hintText: '暗記カード名を入力',
                      contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                    ),
                    onChanged: (value){
                      
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.width/1.5,
            child: PageView(
              children: [
                for (var i = 0; i < item.cards.length; i++)
                  InputCard(size, context),
              ],
            ),
          )
          
        ],
      ),
    );
  }
}