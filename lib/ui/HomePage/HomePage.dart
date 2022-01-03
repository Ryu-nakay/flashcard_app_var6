import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flashcard_app_ver6/model/homeNavbarModel.dart';
import 'package:flashcard_app_ver6/ui/AboutAppPage/AboutAppPage.dart';
import 'package:flashcard_app_ver6/ui/HomePage/HomePageWidgets/CardItemList.dart';
import 'package:flashcard_app_ver6/ui/HomePage/HomePageWidgets/MakeCardListModalPopup.dart';
import 'package:flashcard_app_ver6/ui/MyPage/MyPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ColorModel>(context).appbarColor1,
        centerTitle: true,
        title: Text(
          'My Anki cards',
          style: TextStyle(
            color: Provider.of<ColorModel>(context).appbarTextColor,
            fontSize: AppBar().preferredSize.height*0.3
          ),
        ),
        actions: const [
          /*
          IconButton(
            onPressed: (){
              showDialog(
                context: context, 
                builder: (_){
                  return TutorialDialog(size, context);
                }
              );
            },
            icon:Icon(
              Icons.info,
              color: Provider.of<ColorModel>(context).appbarTextColor,
            )
          )
          */
        ],
      ),
      body: Consumer<CardListModel>(builder: (context, card_list_model, child) {
        
        return Container(//単語帳見出し一覧
          color: Provider.of<ColorModel>(context).bodyColor1,
          child: ListView(
            children: [
              //単語帳リストを表示
              for (var item in card_list_model.list) 
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(15,15)
                      )
                    ]
                  ),
                  child: CardItemList(size, item,context)
                )
            ],
          ),
        );
      }),



      //画面下部のボタン郡
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.0),
            color: Colors.white.withOpacity(0),
            shape: BoxShape.circle,
            boxShadow: const[
              BoxShadow(
                color:Colors.black26,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(20,20)
              )
            ]
          ),
          child: FloatingActionButton(
            backgroundColor: Provider.of<ColorModel>(context).textColor,
            foregroundColor: Provider.of<ColorModel>(context).bodyColor1,
            onPressed: () {
              MakeCardListModalPopup(context, size);
            },
            child:const Icon(Icons.add),
          ),
        ),//ホーム画面中央下部のボタン->

        bottomNavigationBar: BottomAppBar(
          color: Provider.of<ColorModel>(context).textColor,
          notchMargin: 6.0,
          shape: AutomaticNotchedShape(
            const RoundedRectangleBorder(),
            StadiumBorder(
              side: BorderSide(
                color: Provider.of<ColorModel>(context).textColor,
                width: 1
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.account_circle_outlined,
                    color: Provider.of<ColorModel>(context).bodyColor1,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPage()));
                  },
                  
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Provider.of<ColorModel>(context).bodyColor1,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutAppPage()));
                  },
                ),
              ],
            ),
          )
      )////ホーム画面下部左右のボタン->
       
    );
  }
}