import 'dart:math';
import 'dart:ui';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flashcard_app_ver6/model/makeAndEditModel.dart';
import 'package:flashcard_app_ver6/ui/MakeAndEditPage/InputCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MakeAndEditPage extends StatelessWidget{
  CardList inputItem;
  late bool makeModeFlag;

  MakeAndEditPage(this.inputItem){
    if(inputItem.name==''){
      this.makeModeFlag=true;
    }else{
      this.makeModeFlag=false;
    }
  }

  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async=>false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Provider.of<ColorModel>(context).appbarColor1,
          centerTitle: true,
          title: Text(
            L10n.of(context)!.create_and_edit,
            style: TextStyle(
              color: Provider.of<ColorModel>(context).appbarTextColor,
              fontSize: AppBar().preferredSize.height*0.3
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Consumer<CardListModel>(builder: (context, card_list_model, child) {
          return Container(
            height: size.height,
            color: Provider.of<ColorModel>(context).backgroundColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width:size.width*0.9 ,
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 20
                    ),
                    child: Row(
                      children: [
                        Text(
                          L10n.of(context)!.name,
                          style: TextStyle(
                            fontSize: size.width*0.03,
                            color: Provider.of<ColorModel>(context).textColor,
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
                              hintText: L10n.of(context)!.enter_the_memorization_card_name,
                              hintStyle: TextStyle(
                                color: Provider.of<ColorModel>(context).textColor.withOpacity(0.4),
                              ),
                              contentPadding: const EdgeInsets.only(top: 0,bottom: 0,left: 5)
                            ),
                            controller: TextEditingController(text: inputItem.name),
                            style: TextStyle(
                              color: Provider.of<ColorModel>(context).textColor
                            ),
                            onChanged: (value){
                              inputItem.name=value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  Consumer<MakeAndEditModel>(builder: (context, make_and_edit_model, child) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: size.width*0.9,
                              child: InputCard(size, context,inputItem.cards[make_and_edit_model.cardPageIndex]),
                            ),
                            Container(
                              width: size.width*0.9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed:
                                    inputItem.cards.length!=1?
                                    (){
                                      inputItem.cards.removeAt(make_and_edit_model.cardPageIndex);
                                      if(make_and_edit_model.cardPageIndex>=inputItem.cards.length){
                                        make_and_edit_model.cardPageIndex-=1;
                                      }
                                      make_and_edit_model.notifyListeners();
                                    }
                                    :null, 
                                    icon:const Icon(
                                      Icons.remove_circle,
                                      color: Colors.redAccent,
                                    )
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),


                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed:
                                make_and_edit_model.cardPageIndex==0?
                                null:
                                (){
                                  make_and_edit_model.changePage(make_and_edit_model.cardPageIndex-1!=0?make_and_edit_model.cardPageIndex-1:0);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Provider.of<ColorModel>(context).textInMainColor,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Provider.of<ColorModel>(context).mainColor,
                                  side: BorderSide(
                                    color:Provider.of<ColorModel>(context).mainColor,
                                    width: 1
                                  )
                                ),
                              ),

                              Text(
                                '${Provider.of<MakeAndEditModel>(context).cardPageIndex+1}/${inputItem.cards.length}',
                                style: TextStyle(
                                  color: Provider.of<ColorModel>(context).textColor,
                                ),
                              ),

                              ElevatedButton(
                                onPressed:
                                make_and_edit_model.cardPageIndex==inputItem.cards.length-1?
                                (){
                                  //プラスボタンの処理
                                  inputItem.cards.add(CardData(id: inputItem.cards.length, front: '', frontMemo: '', back: '', backMemo: '', evaluation: 'average'));
                                  make_and_edit_model.changePage(make_and_edit_model.cardPageIndex+1<inputItem.cards.length?make_and_edit_model.cardPageIndex+1:inputItem.cards.length-1);
                                }:
                                (){
                                  //次のページに送る処理
                                  make_and_edit_model.changePage(make_and_edit_model.cardPageIndex+1<inputItem.cards.length?make_and_edit_model.cardPageIndex+1:inputItem.cards.length-1);
                                },
                                child: make_and_edit_model.cardPageIndex==inputItem.cards.length-1?
                                Icon(
                                  Icons.add,
                                  color: Provider.of<ColorModel>(context).textInMainColor,
                                )
                                :Icon(
                                  Icons.arrow_forward_ios,
                                  color: Provider.of<ColorModel>(context).textInMainColor,
                                ),
                                style: make_and_edit_model.cardPageIndex==inputItem.cards.length-1?
                                ElevatedButton.styleFrom(
                                  primary: Provider.of<ColorModel>(context).mainColor,
                                  side: BorderSide(
                                    color:Provider.of<ColorModel>(context).mainColor,
                                    width: 1
                                  )
                                )
                                :ElevatedButton.styleFrom(
                                  primary: Provider.of<ColorModel>(context).mainColor,
                                  side: BorderSide(
                                    color:Provider.of<ColorModel>(context).mainColor,
                                    width: 1
                                  )
                                ),
                              )
                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(
                            top: 30
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:Colors.black26,
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(10,10)
                                    )
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                    make_and_edit_model.cardPageIndex=0;
                                    
                                  }, 
                                  child:Text(
                                    L10n.of(context)!.cancel,
                                    style: TextStyle(
                                      color: Provider.of<ColorModel>(context).textInMainColor
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Provider.of<ColorModel>(context).mainColor,
                                    side: BorderSide(
                                      color:Provider.of<ColorModel>(context).mainColor,
                                      width: 1
                                    )
                                  ),
                                ),
                              ),

                              Container(
                                decoration:
                                inputItem.name!='' ?
                                const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:Colors.black26,
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(10,10)
                                    )
                                  ],
                                )
                                :const BoxDecoration(),
                                child: ElevatedButton(
                                  onPressed: inputItem.name!='' ?
                                  () async {
                                    Navigator.pop(context);
                                    //ローディングのアイコンを表示(画面タップでも消えない・操作を受け付けない)
                                    showDialog(
                                      barrierDismissible: false,  
                                      context: context,
                                      builder: (context) {
                                        return const Center(
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: CircularProgressIndicator(
                                              
                                            )
                                          ),
                                        );
                                      },
                                    );
                                    make_and_edit_model.cardPageIndex=0;
                                    
                                    List<CardData> deleteList=[];

                                    for (var item in inputItem.cards) {
                                      if(item.front=='' && item.back==''){
                                        deleteList.add(item);
                                      }
                                    }
                                    for (var item in deleteList) {
                                      inputItem.cards.remove(item);
                                    }

                                    if(inputItem.cards.length!=0){
                                      //DBに登録する処理
                                      if(makeModeFlag==true){
                                        if(inputItem.tableName==''){
                                          inputItem.tableName=inputItem.name+Random().nextInt(99999).toString();
                                        }
                                        card_list_model.makeFC(inputItem);
                                      }else{
                                        card_list_model.updateFC(inputItem);
                                      }

                                      await card_list_model.getDBdata();

                                      Navigator.pop(context);

                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Theme(
                                            data: ThemeData.light(),
                                            child: CupertinoAlertDialog(
                                              title:Text(L10n.of(context)!.saved_the_memorization_card(inputItem.name)),
                                              content:const Text(""),
                                              actions: <Widget>[
                                                CupertinoDialogAction(
                                                  child:Text(L10n.of(context)!.ok),
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }else{
                                      Navigator.pop(context);
                                      //ポップアップ
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return CupertinoAlertDialog(
                                            title:Text(L10n.of(context)!.could_not_save),
                                            content:Text(L10n.of(context)!.you_need_at_least_one_non_blank_card),
                                            actions: <Widget>[
                                              CupertinoDialogAction(
                                                child:Text(L10n.of(context)!.ok),
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  }
                                  :
                                  null, 
                                  child: Text(
                                    L10n.of(context)!.save_and_return,
                                    style: TextStyle(
                                      color: Provider.of<ColorModel>(context).textInMainColor
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Provider.of<ColorModel>(context).mainColor,
                                    side: BorderSide(
                                      color:Provider.of<ColorModel>(context).mainColor,
                                      width: 1
                                    )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          );
        })
      ),
    );
  }
}