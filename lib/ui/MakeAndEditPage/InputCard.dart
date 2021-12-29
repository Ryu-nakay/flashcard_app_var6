import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/flashcardModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Widget InputCard(Size size,BuildContext context,CardList inputItem,int cardIndex){
  return Consumer<CardListModel>(builder: (context, card_list_model, child) {
    return Column(
      children: [
        Container(
          width: size.width,
          //height: size.width/1.6,
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [

              Column(
                children: [
                  Text(
                    'おもて：',
                    style: TextStyle(
                      fontSize: size.width*0.03
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                        hintText: 'おもてに表示するを単語を入力',
                        contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                      ),
                      controller: TextEditingController(text:inputItem.cards[cardIndex].front),
                      onChanged: (value){
                        inputItem.cards[cardIndex].front=value;
                      },
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text(
                    'おもてメモ：',
                    style: TextStyle(
                      fontSize: size.width*0.03
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                        hintText: 'おもてメモに表示するメモを入力',
                        contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                      ),
                      controller:  TextEditingController(text:inputItem.cards[cardIndex].frontMemo),
                      onChanged: (value){
                        inputItem.cards[cardIndex].frontMemo=value;
                      },
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),

        Container(
          width: size.width,
          //height: size.width/1.6,
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [

              Column(
                children: [
                  Text(
                    'うら：',
                    style: TextStyle(
                      fontSize: size.width*0.03
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                        hintText: 'うらに表示する単語を入力',
                        contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                      ),
                      controller:  TextEditingController(text:inputItem.cards[cardIndex].back),
                      onChanged: (value){
                        inputItem.cards[cardIndex].back=value;
                      },
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text(
                    'うらメモ：',
                    style: TextStyle(
                      fontSize: size.width*0.03
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                        hintText: 'うらメモに表示するメモを入力',
                        contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                      ),
                      controller:  TextEditingController(text:inputItem.cards[cardIndex].backMemo),
                      onChanged: (value){
                        inputItem.cards[cardIndex].backMemo=value;
                      },
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }); 
}