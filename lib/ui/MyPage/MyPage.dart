import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/model/cardListModel.dart';
import 'package:flashcard_app_ver6/model/myPageModel.dart';
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
              Provider.of<MyPageModel>(context,listen: false).changePageIndex(0);
              Navigator.pop(context);  
            }, 
            icon:const Icon(Icons.arrow_back_ios)
          ),
      ),
      body:Consumer<CardListModel>(builder: (context, card_list_model, child) {
        return Consumer<MyPageModel>(builder: (context, my_page_model, child) {
          my_page_model.dataMap.add({
            'おぼえた':card_list_model.allGoodLength().toDouble(),
            'ふつう':card_list_model.allAverageLength().toDouble(),
            'わからない':card_list_model.allPoorLength().toDouble(),
          });
          for (var item in card_list_model.list) {
            my_page_model.dataMap.add({
              'おぼえた':card_list_model.goodCount(item).toDouble(),
              'ふつう':card_list_model.averageCount(item).toDouble(),
              'わからない':card_list_model.poorCount(item).toDouble(),
            });
          }
          return Container(
            width: size.width,
            height: size.height,
            color: Provider.of<ColorModel>(context).backgroundColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ExpandablePageView(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(20),
                        width: size.width-20,
                        decoration: BoxDecoration(
                          color: Provider.of<ColorModel>(context).cardColor,
                          border:Border.all(),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color:Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(10,10)
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Text(
                              '総データ',
                              style: TextStyle(
                                fontSize: size.width*0.05,
                                fontWeight: FontWeight.bold,
                                color: Provider.of<ColorModel>(context).cardTextColor
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'カード枚数:${allCardsCount}',
                                      style: TextStyle(
                                        color: Provider.of<ColorModel>(context).cardTextColor
                                      ),
                                    )
                                  ],
                                ),
                                
                              ],
                            ),
                            Container(
                              width: size.width*0.6,
                              height: size.width*0.6,
                              child: PieChart(
                                dataMap: my_page_model.dataMap[0],
                                animationDuration: const Duration(milliseconds: 800),
                                chartRadius: size.width*0.3,
                                colorList: const [Color(0xFF99FF99),Color(0xFFFFFF99),Color(0xFFFF82B2)],
                                centerText: '学習状況',
                                centerTextStyle: TextStyle(
                                  fontSize: size.width*0.02,
                                  color: Provider.of<ColorModel>(context).cardTextColor,
                                ),
                                legendOptions: LegendOptions(
                                  legendTextStyle: TextStyle(
                                    fontSize: size.width*0.02,
                                    color: Provider.of<ColorModel>(context).cardTextColor
                                  ),
                                ),
                                chartType: ChartType.ring,
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValueBackground: false,
                                  showChartValuesInPercentage: true,
                                  decimalPlaces: 0,
                                  chartValueStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Provider.of<ColorModel>(context).cardTextColor,
                                    fontSize: size.width*0.02
                                  )
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                      for (var i = 0; i < card_list_model.list.length; i++)
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(20),
                          width: size.width-20,
                          decoration: BoxDecoration(
                            color: Provider.of<ColorModel>(context).cardColor,
                            border:Border.all(),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color:Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(20,20)
                              )
                            ]
                          ),
                          child: Column(
                            children: [
                              Text(
                                '${card_list_model.list[i].name}',
                                style: TextStyle(
                                  fontSize: size.width*0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Provider.of<ColorModel>(context).cardTextColor
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'カード枚数:${card_list_model.list[i].cards.length}',
                                        style: TextStyle(
                                          color: Provider.of<ColorModel>(context).cardTextColor
                                        ),
                                      )
                                    ],
                                  ),
                                  
                                ],
                              ),
                              Container(
                                width: size.width*0.6,
                                height: size.width*0.6,
                                child: PieChart(
                                  dataMap: my_page_model.dataMap[i+1],
                                  animationDuration: const Duration(milliseconds: 800),
                                  chartRadius: size.width*0.3,
                                  colorList: const [Color(0xFF99FF99),Color(0xFFFFFF99),Color(0xFFFF82B2)],
                                  centerText: '学習状況',
                                  centerTextStyle: TextStyle(
                                    fontSize: size.width*0.02,
                                    color: Provider.of<ColorModel>(context).cardTextColor,
                                  ),
                                  legendOptions: LegendOptions(
                                    legendTextStyle: TextStyle(
                                      fontSize: size.width*0.02,
                                      color: Provider.of<ColorModel>(context).cardTextColor
                                    ),
                                  ),
                                  chartType: ChartType.ring,
                                  chartValuesOptions: ChartValuesOptions(
                                    showChartValueBackground: false,
                                    showChartValuesInPercentage: true,
                                    decimalPlaces: 0,
                                    chartValueStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Provider.of<ColorModel>(context).cardTextColor,
                                      fontSize: size.width*0.02
                                    )
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                    ],
                    controller: my_page_model.cardPageController,
                    onPageChanged: (int page){
                      my_page_model.changePageIndex(page);
                    },
                  ),
                  
                  
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed:my_page_model.cardPageIndex!=0?
                          (){
                            my_page_model.previousPage();
                          }
                          :null,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Provider.of<ColorModel>(context).mainColor,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Provider.of<ColorModel>(context).textInMainColor,
                            side: BorderSide(
                              color:Provider.of<ColorModel>(context).mainColor,
                              width: 1
                            )
                          ),
                        ),

                        Text(
                          '${my_page_model.cardPageIndex+1}/${card_list_model.list.length+1}',
                          style: TextStyle(
                            color: Provider.of<ColorModel>(context).textColor
                          ),
                        ),

                        ElevatedButton(
                          onPressed:my_page_model.cardPageIndex+1!=card_list_model.list.length+1?
                          (){
                            my_page_model.nextPage();
                          }
                          :null,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Provider.of<ColorModel>(context).mainColor,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Provider.of<ColorModel>(context).textInMainColor,
                            side: BorderSide(
                              color:Provider.of<ColorModel>(context).mainColor,
                              width: 1
                            )
                          ),
                        ),
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