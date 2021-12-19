import 'package:flutter/material.dart';

Widget TutorialDialog(Size size,BuildContext context){
  return Dialog(
    backgroundColor: Colors.transparent,
    child: Container(
      width: size.width-30,
      height: size.height-30,
      color: Colors.red,
      child: Column(
        children: [
          Container(
            width: size.width-40,
            height: size.height-200,
            color: Colors.white,
            child:PageView(
            children: [
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.black,
              )
            ],
          ),
          ),
          /*
          PageView(
            children: [
              
            ],
          ),*/
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            child: Text('pop')
          )
        ],
      ),
    ),
  );
}