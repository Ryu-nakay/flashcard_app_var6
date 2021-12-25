import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/flashcardModel.dart';
import 'package:flashcard_app_ver6/model/makeAndEditModel.dart';
import 'package:flashcard_app_ver6/model/playModel.dart';
import 'package:flashcard_app_ver6/ui/PlayPage/PlayCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayPage extends StatelessWidget{
  CardList inputCardList;

  PlayPage(this.inputCardList);

  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ColorModel>(context).appbarTextColor,
        centerTitle: true,
        title: Text(
          '${inputCardList.name}',
          style: TextStyle(
            color: Provider.of<ColorModel>(context).appbarColor1,
            fontSize: AppBar().preferredSize.height*0.3
          ),
        ),
      ),
      body: Consumer<PlayModel>(builder: (context, play_model, child) {
        return Container(
          child: Column(
            children: [
              ExpandablePageView(
                controller:play_model.cardPageController,
                children: [
                  for (var i = 0; i < inputCardList.cards.length; i++)
                    Container(
                      margin: EdgeInsets.all(10),
                      child: PlayCard(size, inputCardList.cards[i])
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
                    Text('学習レベル'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: (){

                          }, 
                          child: Text(
                            'わからない',
                            style: 
                            TextStyle(
                              color: Provider.of<ColorModel>(context).textColor
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Provider.of<ColorModel>(context).bodyColor1,
                            side: BorderSide(
                              color: Provider.of<ColorModel>(context).textColor,
                            )
                          ),
                        ),

                        ElevatedButton(
                          onPressed: (){

                          }, 
                          child: Text(
                            'ふつう',
                            style: TextStyle(
                              color: Provider.of<ColorModel>(context).textColor
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Provider.of<ColorModel>(context).bodyColor1,
                            side: BorderSide(
                              color: Provider.of<ColorModel>(context).textColor,
                            )
                          ),
                        ),

                        ElevatedButton(
                          onPressed: (){

                          }, 
                          child: Text(
                            'おぼえた',
                            style: TextStyle(
                              color: Provider.of<ColorModel>(context).textColor
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Provider.of<ColorModel>(context).bodyColor1,
                            side: BorderSide(
                              color: Provider.of<ColorModel>(context).textColor,
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )

            ],
          )
        );
      })
    );
  }
}