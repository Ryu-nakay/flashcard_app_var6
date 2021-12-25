import 'package:flashcard_app_ver6/model/flashcardModel.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget PlayCard(Size size,CardData inputCard){
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
                '${inputCard.front}',
                style: TextStyle(
                  fontSize: size.width*0.08
                ),
              )
            ),
            Container(
              child: Text('${inputCard.frontMemo}')
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
                '${inputCard.back}',
                style: TextStyle(
                  fontSize: size.width*0.08
                ),
              )
            ),
            Container(
              child: Text('${inputCard.backMemo}')
            )
          ],
        ),
      ),
    ),
  );
}