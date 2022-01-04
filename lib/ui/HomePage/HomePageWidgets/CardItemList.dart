import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flashcard_app_ver6/ui/HomePage/HomePageWidgets/CardItemListModalPopup.dart';
import 'package:flashcard_app_ver6/ui/HomePage/HomePageWidgets/PlayModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget CardItemList(Size size,CardList item,BuildContext context){
  return Container(
    margin:const EdgeInsets.only(
      top: 10,
      left: 10,
      right: 10,
    ),
    width: size.width-20,
    decoration: BoxDecoration(
      color: Provider.of<ColorModel>(context).mainColor,
      border: Border.all(),
      borderRadius: BorderRadius.circular(10),
    ),
    child:ListTile(
      onTap: (){
        PlaypModal(context, size, item);
      },
      leading: Icon(
        Icons.circle,
        color:Provider.of<ColorModel>(context).textInMainColor ,
      ),
      title: Text(
        item.name,
        style: TextStyle(
          fontSize: size.width*0.05,
          color: Provider.of<ColorModel>(context).textInMainColor
        ),
      ),
      trailing: IconButton(
        onPressed: (){
          CardItemListModalPopup(context, size, item);
        }, 
        icon:Icon(
          Icons.more_vert,
          color: Provider.of<ColorModel>(context).textInMainColor,
        )
      ),
    )
    
  );
}