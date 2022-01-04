import 'dart:math';

import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flashcard_app_ver6/model/playModel.dart';
import 'package:flashcard_app_ver6/ui/PlayPage/PlayPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<int> shuffle(List<int> items) {
    var random =  Random();
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    print(items);
    return items;
  }


Future<dynamic> PlaypModal(BuildContext context,Size size,CardList item){
  return showModalBottomSheet(
          //モーダルの背景の色、透過
          backgroundColor: Colors.transparent,
          //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Consumer<PlayModel>(builder: (context,play_model, child) {
              return Container(
                margin: const EdgeInsets.only(top: 64),
                decoration: BoxDecoration(
                  //モーダル自体の色
                  color: Provider.of<ColorModel>(context).backgroundColor,
                  //角丸にする
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  width: size.width,
                  height: size.height*0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(
                                fontSize: size.width*0.07,
                                color: Provider.of<ColorModel>(context).textColor
                              ),
                            ),
                            Text(
                              'カード数：'+item.cards.length.toString()+'枚',
                              style: TextStyle(
                                fontSize: size.width*0.05,
                                color: Provider.of<ColorModel>(context).textColor
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(
                          top: 10
                        ),
                        child: Column(
                          children: [
                            Text(
                              play_model.modeflag==true?'おもて→うら':'うら→おもて',
                              style: TextStyle(
                                color: Provider.of<ColorModel>(context).textColor
                              ),
                            ),
                            Container(
                              decoration:const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color:Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 20,
                                    offset: Offset(10,10)
                                  )
                                ]
                              ),
                              child: CupertinoSwitch(
                                value: play_model.modeflag,
                                activeColor: Provider.of<ColorModel>(context).mainColor,
                                //trackColor: Colors.white,
                                onChanged: (bool v) {
                                  play_model.setModeflag(v);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(
                          top: 10
                        ),
                        child: Column(
                          children: [
                            Text(play_model.randomflag==true?'ランダム':'順番通り'),
                            Container(
                              decoration:const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color:Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 20,
                                    offset: Offset(10,10)
                                  )
                                ]
                              ),
                              child: CupertinoSwitch(
                                value: play_model.randomflag ,
                                activeColor: Provider.of<ColorModel>(context).mainColor,
                                //trackColor: Colors.white,
                                onChanged: (bool v) {
                                  play_model.setRandomflag(v);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height*0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration:const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                  offset: Offset(10,10)
                                )
                              ]
                            ),
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.pop(context);
                                List<int> indexList=[];
                                for (var i = 0; i < item.cards.length ; i++) {
                                  indexList.add(i);    
                                }
                                if(play_model.randomflag==true){
                                  indexList=shuffle(indexList);
                                }
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayPage(item,indexList)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'スタート',
                                  style: TextStyle(
                                    color: Provider.of<ColorModel>(context).textColor,
                                    fontSize: size.width*0.05
                                  )
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Provider.of<ColorModel>(context).backgroundColor,
                                shape: const StadiumBorder(),
                                side: BorderSide(
                                  color: Provider.of<ColorModel>(context).mainColor,
                                  width: 1,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              );
            }); 
          }
        );
}