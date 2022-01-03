import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flashcard_app_ver6/model/playModel.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget PlayCard(Size size,CardList inputCardList,CardData inputCard){
  return Consumer<PlayModel>(builder: (context, play_model, child) {
    return Consumer<CardListModel>(builder: (context, card_list_model, child) {
      int cardListIndex=card_list_model.list.indexOf(inputCardList);
      int cardIndex=card_list_model.list[cardListIndex].cards.indexOf(inputCard);

      return Container(
        child: FlipCard(
          speed: 200,
          front: Container(
            width: size.width-10,
            height: (size.width-10)/1.6,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: Offset(10,10)
                )
              ],
              color: Provider.of<ColorModel>(context).bodyColor1,
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    play_model.modeflag==true?
                    '${card_list_model.list[cardListIndex].cards[cardIndex].front}'
                    :'${card_list_model.list[cardListIndex].cards[cardIndex].back}',
                    style: TextStyle(
                      fontSize: size.width*0.08
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                        cursorColor: Provider.of<ColorModel>(context).textColor,
                        decoration: InputDecoration(
                          enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Provider.of<ColorModel>(context).textColor.withOpacity(0.2)
                            )
                          ),
                          focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Provider.of<ColorModel>(context).textColor.withOpacity(0.2),
                              width: 2
                            )
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'メモを入力',
                          contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                        ),
                        controller: TextEditingController(
                          text:play_model.modeflag==true?
                            card_list_model.list[cardListIndex].cards[cardIndex].frontMemo
                            :card_list_model.list[cardListIndex].cards[cardIndex].backMemo
                        ),
                        onChanged: play_model.modeflag==true?
                        (value){
                          card_list_model.list[cardListIndex].cards[cardIndex].frontMemo=value;
                          card_list_model.updateCardDataMemoAndEva(card_list_model.list[cardListIndex].tableName, card_list_model.list[cardListIndex].cards[cardIndex]);
                        }
                        :(value){
                          card_list_model.list[cardListIndex].cards[cardIndex].backMemo=value;
                          card_list_model.updateCardDataMemoAndEva(card_list_model.list[cardListIndex].tableName, card_list_model.list[cardListIndex].cards[cardIndex]);
                        },
                      ),
                )
              ],
            ),
          ),
          back: Container(
            width: size.width-10,
            height: (size.width-10)/1.6,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: Offset(10,10)
                )
              ],
              color: Provider.of<ColorModel>(context).bodyColor1,
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    play_model.modeflag==true?
                    '${card_list_model.list[cardListIndex].cards[cardIndex].back}'
                    :'${card_list_model.list[cardListIndex].cards[cardIndex].front}',
                    style: TextStyle(
                      fontSize: size.width*0.08
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                        cursorColor: Provider.of<ColorModel>(context).textColor,
                        decoration: InputDecoration(
                          enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Provider.of<ColorModel>(context).textColor.withOpacity(0.2)
                            )
                          ),
                          focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Provider.of<ColorModel>(context).textColor.withOpacity(0.2),
                              width: 2
                            )
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'メモを入力',
                          contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                        ),
                        controller: TextEditingController(
                          text:play_model.modeflag==true?
                            card_list_model.list[cardListIndex].cards[cardIndex].backMemo
                            :card_list_model.list[cardListIndex].cards[cardIndex].frontMemo
                        ),
                        onChanged:play_model.modeflag==true? 
                        (value){
                          card_list_model.list[cardListIndex].cards[cardIndex].backMemo=value;
                          card_list_model.updateCardDataMemoAndEva(card_list_model.list[cardListIndex].tableName, card_list_model.list[cardListIndex].cards[cardIndex]);
                        }
                        :(value){
                          card_list_model.list[cardListIndex].cards[cardIndex].frontMemo=value;
                          card_list_model.updateCardDataMemoAndEva(card_list_model.list[cardListIndex].tableName, card_list_model.list[cardListIndex].cards[cardIndex]);
                        },
                      ),
                )
              ],
            ),
          ),
        ),
      );
    });
  });
  
}