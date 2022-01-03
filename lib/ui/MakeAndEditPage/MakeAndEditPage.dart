import 'dart:math';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flashcard_app_ver6/model/makeAndEditModel.dart';
import 'package:flashcard_app_ver6/ui/MakeAndEditPage/InputCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

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
            '作成・編集',
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
                          '名前：',
                          style: TextStyle(
                            fontSize: size.width*0.03
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
                              contentPadding: const EdgeInsets.only(top: 0,bottom: 0,left: 5)
                            ),
                            controller: TextEditingController(text: inputItem.name),
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
                              Text('${Provider.of<MakeAndEditModel>(context).cardPageIndex+1}/${inputItem.cards.length}'),
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
                                  color: Provider.of<ColorModel>(context).bodyColor1,
                                )
                                :Icon(
                                  Icons.arrow_forward_ios,
                                  color: Provider.of<ColorModel>(context).textColor,
                                ),
                                style: make_and_edit_model.cardPageIndex==inputItem.cards.length-1?
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
                                  child: const Text('キャンセル'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Provider.of<ColorModel>(context).textColor,
                                    side: BorderSide(
                                      color:Provider.of<ColorModel>(context).bodyColor1,
                                      width: 1
                                    )
                                  ),
                                ),
                              ),

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
                                  onPressed: inputItem.name!='' ?
                                  (){
                                    Navigator.pop(context);
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

                                    //DBに登録する処理
                                    if(makeModeFlag==true){
                                      if(inputItem.tableName==''){
                                        inputItem.tableName=inputItem.name+Random().nextInt(99999).toString();
                                      }
                                      card_list_model.makeFC(inputItem);
                                    }else{
                                      card_list_model.updateFC(inputItem);
                                    }

                                    card_list_model.getDBdata();
                                    
                                  }
                                  :
                                  null, 
                                  child: const Text('セーブして戻る'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Provider.of<ColorModel>(context).textColor,
                                    side: BorderSide(
                                      color:Provider.of<ColorModel>(context).bodyColor1,
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