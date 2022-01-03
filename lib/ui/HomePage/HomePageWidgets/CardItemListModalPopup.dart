import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flashcard_app_ver6/ui/MakeAndEditPage/MakeAndEditPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<dynamic> CardItemListModalPopup(BuildContext context,Size size,CardList item){
  return showCupertinoModalPopup(
          context: context, 
          builder: (BuildContext context)=>CupertinoActionSheet(
            title: Text('操作を選択',style: TextStyle(fontSize: size.width*0.04)),
            actions: [
              Consumer<CardListModel>(builder: (context, card_list_model, child) {
                return CupertinoActionSheetAction(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MakeAndEditPage(item.copyWith())));
                  }, 
                  child: Text(
                    '暗記カードを編集',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  )
                );
              }),
              
              CupertinoActionSheetAction(
                onPressed:(){
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text("削除してもよろしいですか？"),
                        content: Text("復元することはできません。"),
                        actions: <Widget>[
                          Consumer<CardListModel>(builder: (context, card_list_model, child) {
                            return CupertinoDialogAction(
                              child: Text("削除"),
                              isDestructiveAction: true,
                              onPressed: () {
                                card_list_model.deleteCardList(item.tableName,card_list_model.list.indexOf(item));
                                Navigator.pop(context);
                              } ,
                            );
                          }),
                          
                          CupertinoDialogAction(
                            child: Text("キャンセル"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('削除',style: TextStyle(color: Colors.red))
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