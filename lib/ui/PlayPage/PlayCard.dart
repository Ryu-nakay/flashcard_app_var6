import 'package:flashcard_app_ver6/model/flashcardModel.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget PlayCard(Size size,CardList inputCardList,CardData inputCard){
  return Consumer<CardListModel>(builder: (context, card_list_model, child) {
    int cardListIndex=card_list_model.list.indexOf(inputCardList);
    int cardIndex=card_list_model.list[cardListIndex].cards.indexOf(inputCard);

    return Container(
      child: FlipCard(
        speed: 200,
        front: Container(
          width: size.width-10,
          height: (size.width-10)/1.6,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  '${card_list_model.list[cardListIndex].cards[cardIndex].front}',
                  style: TextStyle(
                    fontSize: size.width*0.08
                  ),
                )
              ),
              Container(
                child: Text('${card_list_model.list[cardListIndex].cards[cardIndex].frontMemo}')
              )
            ],
          ),
        ),
        back: Container(
          width: size.width-10,
          height: (size.width-10)/1.6,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  '${card_list_model.list[cardListIndex].cards[cardIndex].back}',
                  style: TextStyle(
                    fontSize: size.width*0.08
                  ),
                )
              ),
              Container(
                child: Text('${card_list_model.list[cardListIndex].cards[cardIndex].backMemo}')
              )
            ],
          ),
        ),
      ),
    );
  });
}