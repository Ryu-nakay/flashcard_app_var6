import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flashcard_app_ver6/ui/MakeAndEditPage/MakeAndEditPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<dynamic> CardItemListModalPopup(BuildContext context,Size size,CardList item){
  return showCupertinoModalPopup(
          context: context, 
          builder: (BuildContext context)=>CupertinoActionSheet(
            title: Text(L10n.of(context)!.select_an_operation,style: TextStyle(fontSize: size.width*0.04)),
            actions: [
              Consumer<CardListModel>(builder: (context, card_list_model, child) {
                return CupertinoActionSheetAction(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MakeAndEditPage(item.copyWith())));
                  }, 
                  child:Text(
                    L10n.of(context)!.edit_memorization_card,
                    style: const TextStyle(
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
                        title:Text(L10n.of(context)!.delete_are_you_sure_you_want_to),
                        content:Text(L10n.of(context)!.cannot_be_restored),
                        actions: <Widget>[
                          Consumer<CardListModel>(builder: (context, card_list_model, child) {
                            return CupertinoDialogAction(
                              child:Text(L10n.of(context)!.delete),
                              isDestructiveAction: true,
                              onPressed: () {
                                card_list_model.deleteCardList(item.tableName,card_list_model.list.indexOf(item));
                                Navigator.pop(context);
                              } ,
                            );
                          }),
                          
                          CupertinoDialogAction(
                            child:Text(L10n.of(context)!.cancel),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child:Text(L10n.of(context)!.delete,style: TextStyle(color: Colors.red))
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: (){
                Navigator.pop(context);
              },
              child:Text(
                L10n.of(context)!.cancel_en,
                style: const TextStyle(
                  color: Colors.blue
                ),
              ),
            ),
          )
        );


}