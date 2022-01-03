import 'dart:math';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flashcard_app_ver6/model/makeAndEditModel.dart';
import 'package:flashcard_app_ver6/model/playModel.dart';
import 'package:flashcard_app_ver6/ui/PlayPage/PlayCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayPage extends StatelessWidget{
  CardList inputCardList;
  List<int> indexList=[];

  PlayPage(this.inputCardList,this.indexList);

  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ColorModel>(context).appbarColor1,
        centerTitle: true,
        title: Text(
          '${inputCardList.name}',
          style: TextStyle(
            color: Provider.of<ColorModel>(context).appbarTextColor,
            fontSize: AppBar().preferredSize.height*0.3
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Provider.of<PlayModel>(context,listen: false).changePageIndex(0);
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_ios)
        ),
      ),
      body:Consumer<CardListModel>(builder: (context, card_list_model, child) {
        int inputCardListIndex=card_list_model.list.indexOf(inputCardList);
        return Consumer<PlayModel>(builder: (context, play_model, child) {
          return Container(
            child: Column(
              children: [
                ExpandablePageView(
                  controller:play_model.cardPageController,
                  children: [
                    for (var i = 0; i < inputCardList.cards.length; i++)
                      Container(
                        margin: EdgeInsets.all(20),
                        child: PlayCard(size,inputCardList, inputCardList.cards[indexList[i]])
                      )
                  ],
                  onPageChanged: (int page){
                    play_model.changePageIndex(page);
                  },
                ),
    
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed:
                        play_model.cardPageIndex==0?
                        null:
                        (){
                          play_model.previousPage();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Provider.of<ColorModel>(context).textColor,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Provider.of<ColorModel>(context).bodyColor1,
                          side: BorderSide(
                            color:Provider.of<ColorModel>(context).textColor,
                            width: 1
                          )
                        ),
                      ),
                      Text('${play_model.cardPageIndex+1}/${inputCardList.cards.length}'),
                      ElevatedButton(
                        onPressed:
                        play_model.cardPageIndex==inputCardList.cards.length-1?
                        null
                        :(){
                          //次のページに送る処理
                          play_model.nextPage();
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Provider.of<ColorModel>(context).textColor,
                        ),
                        style: play_model.cardPageIndex==inputCardList.cards.length-1?
                        ElevatedButton.styleFrom(
                          primary: Provider.of<ColorModel>(context).textColor,
                          side: BorderSide(
                            color:Provider.of<ColorModel>(context).textColor,
                            width: 1
                          )
                        )
                        :ElevatedButton.styleFrom(
                          primary: Provider.of<ColorModel>(context).bodyColor1,
                          side: BorderSide(
                            color:Provider.of<ColorModel>(context).textColor,
                            width: 1
                          )
                        ),
                      )
                    ],
                  ),
                ),
    
                Container(
                  child: Column(
                    children: [
                      const Text('学習レベル'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration:const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(10,10)
                                )
                              ]
                            ),
                            child: ElevatedButton(
                              onPressed: (){
                                card_list_model.changeCardEvaluation('poor', inputCardListIndex, indexList[play_model.cardPageIndex]);
                                card_list_model.updateCardDataMemoAndEva(card_list_model.list[inputCardListIndex].tableName, card_list_model.list[inputCardListIndex].cards[indexList[play_model.cardPageIndex]]);
                              }, 
                              child: Text(
                                'わからない',
                                style: 
                                TextStyle(
                                  color: card_list_model.list[inputCardListIndex].cards[indexList[play_model.cardPageIndex]].evaluation!='poor'? 
                                  Provider.of<ColorModel>(context).textColor
                                  :Provider.of<ColorModel>(context).bodyColor1
                                ),
                              ),
                              style:card_list_model.list[inputCardListIndex].cards[indexList[play_model.cardPageIndex]].evaluation!='poor'?
                              ElevatedButton.styleFrom(
                                primary: Provider.of<ColorModel>(context).bodyColor1,
                                side: BorderSide(
                                  color: Provider.of<ColorModel>(context).textColor,
                                )
                              )
                              :ElevatedButton.styleFrom(
                                primary: Provider.of<ColorModel>(context).textColor,
                                side: BorderSide(
                                  color: Provider.of<ColorModel>(context).bodyColor1,
                                )
                              )
                            ),
                          ),
    
                          Container(
                            decoration:const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(10,10)
                                )
                              ]
                            ),
                            child: ElevatedButton(
                              onPressed: (){
                                card_list_model.changeCardEvaluation('average', inputCardListIndex, indexList[play_model.cardPageIndex]);
                                card_list_model.updateCardDataMemoAndEva(card_list_model.list[inputCardListIndex].tableName, card_list_model.list[inputCardListIndex].cards[indexList[play_model.cardPageIndex]]);
                              }, 
                              child: Text(
                                'ふつう',
                                style: TextStyle(
                                  color: card_list_model.list[inputCardListIndex].cards[indexList[play_model.cardPageIndex]].evaluation!='average'? 
                                  Provider.of<ColorModel>(context).textColor
                                  :Provider.of<ColorModel>(context).bodyColor1
                                ),
                              ),
    
                              style:card_list_model.list[inputCardListIndex].cards[indexList[play_model.cardPageIndex]].evaluation!='average'?
                              ElevatedButton.styleFrom(
                                primary: Provider.of<ColorModel>(context).bodyColor1,
                                side: BorderSide(
                                  color: Provider.of<ColorModel>(context).textColor,
                                )
                              )
                              :ElevatedButton.styleFrom(
                                primary: Provider.of<ColorModel>(context).textColor,
                                side: BorderSide(
                                  color: Provider.of<ColorModel>(context).bodyColor1,
                                )
                              )
                            ),
                          ),
    
                          Container(
                            decoration:const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(10,10)
                                )
                              ]
                            ),
                            child: ElevatedButton(
                              onPressed: (){
                                card_list_model.changeCardEvaluation('good', inputCardListIndex, indexList[play_model.cardPageIndex]);
                                card_list_model.updateCardDataMemoAndEva(card_list_model.list[inputCardListIndex].tableName, card_list_model.list[inputCardListIndex].cards[indexList[play_model.cardPageIndex]]);
                              }, 
                              child: Text(
                                'おぼえた',
                                style:TextStyle(
                                  color: card_list_model.list[inputCardListIndex].cards[indexList[play_model.cardPageIndex]].evaluation!='good'? 
                                  Provider.of<ColorModel>(context).textColor
                                  :Provider.of<ColorModel>(context).bodyColor1
                                ),
                              ),
                              style:card_list_model.list[inputCardListIndex].cards[indexList[play_model.cardPageIndex]].evaluation!='good'?
                              ElevatedButton.styleFrom(
                                primary: Provider.of<ColorModel>(context).bodyColor1,
                                side: BorderSide(
                                  color: Provider.of<ColorModel>(context).textColor,
                                )
                              )
                              :ElevatedButton.styleFrom(
                                primary: Provider.of<ColorModel>(context).textColor,
                                side: BorderSide(
                                  color: Provider.of<ColorModel>(context).bodyColor1,
                                )
                              )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
    
    
    
              ],
            )
          );
        });
      }) 
    );
  }
}