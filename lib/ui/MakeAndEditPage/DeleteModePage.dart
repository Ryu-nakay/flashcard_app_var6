import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/flashcardModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteModePage extends StatelessWidget{
  CardList inputItem;

  DeleteModePage(this.inputItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ColorModel>(context).appbarColor1,
      ),
      body: Container(
        
      ),
    );
    
  }
}