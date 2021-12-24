import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/flashcardModel.dart';
import 'package:flashcard_app_ver6/model/makeAndEditModel.dart';
import 'package:flashcard_app_ver6/ui/MakeAndEditPage/InputCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MakeAndEditPage extends StatelessWidget{
  int inputItemIndex;

  MakeAndEditPage(this.inputItemIndex);

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
      body: Consumer<CardListModel>(builder: (context, card_list_model, child) {
        return Container(
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width:size.width*0.9 ,
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
                            contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                          ),
                          controller: TextEditingController(text: card_list_model.list[inputItemIndex].name),
                          onChanged: (value){
                            
                          },
                        ),
                      ),
                    ],
                  ),
                ),
          
                Consumer<MakeAndEditModel>(builder: (context, make_and_edit_model, child) {
                  return Column(
                    children: [
                      Container(
                        width: size.width*0.9,
                        child: ExpandablePageView(
                          controller:make_and_edit_model.cardPageController,
                          children: [
                            for (var i = 0; i < card_list_model.list[inputItemIndex].cards.length; i++)
                              InputCard(size, context,inputItemIndex,i),
                          ],
                          onPageChanged: (int page){
                            make_and_edit_model.changePageIndex(page);
                          },
                        ),
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed:
                              make_and_edit_model.cardPageIndex==0?
                              null:
                              (){
                                make_and_edit_model.previousPage();
                              },
                              child: Icon(Icons.arrow_back_ios)
                            ),
                            Text('${make_and_edit_model.cardPageIndex+1}/${card_list_model.list[inputItemIndex].cards.length}'),
                            ElevatedButton(
                              onPressed:
                              make_and_edit_model.cardPageIndex==card_list_model.list[inputItemIndex].cards.length-1?
                              (){}:
                              (){
                                make_and_edit_model.nextPage();
                              },
                              child: make_and_edit_model.cardPageIndex==card_list_model.list[inputItemIndex].cards.length-1?
                              Icon(Icons.add)
                              :Icon(Icons.arrow_forward_ios)
                            )
                          ],
                        ),
                      )
                    ],
                  );
                })
                
                
              ],
            ),
          ),
        );
      })
    );
  }
}