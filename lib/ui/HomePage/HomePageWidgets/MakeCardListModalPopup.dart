import 'package:flashcard_app_ver6/model/flashcardModel.dart';
import 'package:flashcard_app_ver6/ui/MakeAndEditPage/MakeAndEditPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<dynamic> MakeCardListModalPopup(BuildContext context,Size size){
  return showCupertinoModalPopup(
          context: context, 
          builder: (BuildContext context)=>CupertinoActionSheet(
            title: Text('暗記カードの作成方法を選択',style: TextStyle(fontSize: size.width*0.04)),
            actions: [
              Consumer<CardListModel>(builder: (context, card_list_model, child) {
                return CupertinoActionSheetAction(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MakeAndEditPage(-1)));
                  }, 
                  child: Text(
                    '手動',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  )
                );
              }),
              
              CupertinoActionSheetAction(
                onPressed:(){
                  
                },
                child: Text(
                    'ファイル読み込み',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  )
              ),

              CupertinoActionSheetAction(
                onPressed:(){

                },
                child: Text(
                    'webスクレイピング',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  )
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.blue
                ),
              ),
            ),
          )
        );


}