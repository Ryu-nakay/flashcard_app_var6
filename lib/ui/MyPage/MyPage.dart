import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/flashcardModel.dart';
import 'package:flashcard_app_ver6/model/pieChartModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    int allCardsCount=Provider.of<CardListModel>(context).allCardsLength();
    return Scaffold(
      appBar: AppBar(
        title:const Text('My page'),
        centerTitle: true,
        backgroundColor: Provider.of<ColorModel>(context).appbarColor1,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);  
            }, 
            icon:const Icon(Icons.arrow_back_ios)
          ),
      ),
      body:Consumer<CardListModel>(builder: (context, card_list_model, child) {
        return Consumer<PieChartModel>(builder: (context, pie_chart_model, child) {
          pie_chart_model.dataMap={
            'おぼえた':card_list_model.allGoodLength().toDouble(),
            'ふつう':card_list_model.allAverageLength().toDouble(),
            'わからない':card_list_model.allPoorLength().toDouble(),
          };
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    width: size.width-20,
                    decoration: BoxDecoration(
                      border:Border.all(),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Text(
                          '総データ',
                          style: TextStyle(
                            fontSize: size.width*0.05,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('暗記カード数:${card_list_model.list.length}'),
                                Text('カード枚数:${allCardsCount}')
                              ],
                            ),
                            
                          ],
                        ),
                        Container(
                          width: size.width*0.6,
                          height: size.width*0.6,
                          child: PieChart(
                            dataMap: pie_chart_model.dataMap,
                            animationDuration: Duration(milliseconds: 800),
                            chartRadius: size.width*0.3,
                            colorList: [Color(0xFF99FF99),Color(0xFFFFFF99),Color(0xFFFF82B2)],
                            centerText: '学習状況',
                            centerTextStyle: TextStyle(
                              fontSize: size.width*0.02,
                              color: Colors.black,
                            ),
                            legendOptions: LegendOptions(
                              legendTextStyle: TextStyle(
                                fontSize: size.width*0.02
                              ),
                            ),
                            chartType: ChartType.ring,
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: false,
                              showChartValuesInPercentage: true,
                              decimalPlaces: 0,
                              chartValueStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: size.width*0.02
                              )
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
      }) 
    );
  }
}