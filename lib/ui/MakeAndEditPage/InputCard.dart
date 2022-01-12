import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Widget InputCard(Size size,BuildContext context,CardData card){
  return Consumer<CardListModel>(builder: (context, card_list_model, child) {
    return Column(
      children: [
        Container(
          width: size.width,
          //height: size.width/1.6,
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Provider.of<ColorModel>(context).cardColor,
            boxShadow: const [
              BoxShadow(
                color:Colors.black26,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(10,10)
              )
            ],
            border: Border.all(),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [

              Column(
                children: [
                  Text(
                    L10n.of(context)!.front,
                    style: TextStyle(
                      fontSize: size.width*0.03
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: Provider.of<ColorModel>(context).cardTextColor,
                      decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Provider.of<ColorModel>(context).cardTextColor.withOpacity(0.2)
                          )
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Provider.of<ColorModel>(context).cardTextColor.withOpacity(0.2),
                            width: 2
                          )
                        ),
                        border: OutlineInputBorder(),
                        hintText: L10n.of(context)!.enter_the_word_to_be_displayed_on_the_front,
                        contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                      ),
                      controller: TextEditingController(text:card.front),
                      onChanged: (value){
                        card.front=value;
                      },
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text(
                    L10n.of(context)!.front_memo,
                    style: TextStyle(
                      fontSize: size.width*0.03,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: Provider.of<ColorModel>(context).cardTextColor,
                      decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Provider.of<ColorModel>(context).cardTextColor.withOpacity(0.1)
                          )
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Provider.of<ColorModel>(context).cardTextColor.withOpacity(0.1),
                            width: 2
                          )
                        ),
                        border: OutlineInputBorder(),
                        hintText: L10n.of(context)!.enter_the_word_to_be_displayed_on_the_front_memo,
                        contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                      ),
                      controller:  TextEditingController(text:card.frontMemo),
                      onChanged: (value){
                        card.frontMemo=value;
                      },
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),

        Container(
          width: size.width,
          //height: size.width/1.6,
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Provider.of<ColorModel>(context).cardColor,
            boxShadow: const [
              BoxShadow(
                color:Colors.black26,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(10,10)
              )
            ],
            border: Border.all(),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [

              Column(
                children: [
                  Text(
                    L10n.of(context)!.back,
                    style: TextStyle(
                      fontSize: size.width*0.03
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: Provider.of<ColorModel>(context).cardTextColor,
                      decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Provider.of<ColorModel>(context).cardTextColor.withOpacity(0.2)
                          )
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Provider.of<ColorModel>(context).cardTextColor.withOpacity(0.2),
                            width: 2
                          )
                        ),
                        border: OutlineInputBorder(),
                        hintText: L10n.of(context)!.enter_the_word_to_be_displayed_on_the_back,
                        contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                      ),
                      controller:  TextEditingController(text:card.back),
                      onChanged: (value){
                        card.back=value;
                      },
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text(
                    L10n.of(context)!.back_memo,
                    style: TextStyle(
                      fontSize: size.width*0.03
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: Provider.of<ColorModel>(context).cardTextColor,
                      decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Provider.of<ColorModel>(context).cardTextColor.withOpacity(0.1)
                          )
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Provider.of<ColorModel>(context).cardTextColor.withOpacity(0.1),
                            width: 2
                          )
                        ),
                        border: OutlineInputBorder(),
                        hintText: L10n.of(context)!.enter_the_word_to_be_displayed_on_the_back_memo,
                        contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                      ),
                      controller:  TextEditingController(text:card.backMemo),
                      onChanged: (value){
                        card.backMemo=value;
                      },
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }); 
}