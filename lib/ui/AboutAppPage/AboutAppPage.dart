import 'package:flashcard_app_ver6/model/colorModel.dart';
import 'package:flashcard_app_ver6/ui/ads/ads.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutAppPage extends StatelessWidget{
  AboutAppPage(){
    banner.load();
  }

  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    final AdWidget adWidget=AdWidget(ad: banner);

    return Consumer<ColorModel>(builder: (context, color_model, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
              color_model.resetSelectionColor();  
            }, 
            icon: const Icon(Icons.arrow_back_ios)
          ),
          title:Text(L10n.of(context)!.settings),
          centerTitle: true,
          backgroundColor: Provider.of<ColorModel>(context).appbarColor1,
        ),
        body: Container(
          width: size.width,
          height: size.height,
          color: Provider.of<ColorModel>(context).backgroundColor,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: color_model.cardColor,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color:Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(10,10)
                          )
                        ],
                      ),
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            L10n.of(context)!.theme_change,
                            style: TextStyle(
                              color: color_model.cardTextColor,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '${L10n.of(context)!.current_color}${color_model.colorMode}',
                                    style: TextStyle(
                                      color: Provider.of<ColorModel>(context).cardTextColor
                                    ),
                                  ),
                                  Text(
                                    '${L10n.of(context)!.color_to_be_chaged}${color_model.selectListColor}',
                                    style: TextStyle(
                                      color:color_model.cardTextColor 
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                //Picker?????????????????????????????????????????????????????????????????????
                                        height: 250,
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            TextButton(
                                              child: Text(L10n.of(context)!.close),
                                              onPressed: () => Navigator.of(context).pop(),
                                            ),
                                            const Divider(),
                                            Expanded(
                                              child: CupertinoPicker(
                                // ??????????????????????????????
                                                looping: false,
                                // Picker????????????????????????
                                                itemExtent: 30,
                                //??????????????????numbars????????????Text Widget??????????????????????????????
                                                children: color_model.colorList.map((numbar) => new Text(numbar)).toList(),
                                //Picker???????????????????????????????????????
                                //selectNumbar???????????????numbars????????????
                                                onSelectedItemChanged: (index) {
                                                  color_model.changeColorPicker(index);
                                                },
                                                scrollController: FixedExtentScrollController(
                                                  initialItem: color_model.colorList.indexOf(color_model.colorMode)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                }, 
                                child: Text(
                                  L10n.of(context)!.choose_a_color,
                                  style: TextStyle(
                                    color: color_model.textInMainColor
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: color_model.mainColor
                                ),
                              ),
                            ],
                          ),
              
                          Column(
                            children: [
                              
                              ElevatedButton(
                                onPressed:color_model.selectListColor!=color_model.colorMode? 
                                () async {
                                  //??????????????????????????????????????????(???????????????????????????????????????????????????????????????)
                                  showDialog(
                                    barrierDismissible: false,  
                                    context: context,
                                    builder: (context) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            
                                          )
                                        ),
                                      );
                                    },
                                  );
                                  await color_model.changeColorMode();
                                  Navigator.pop(context);
                                }
                                :null, 
                                child: Text(
                                  L10n.of(context)!.apply,
                                  style: TextStyle(
                                    color: color_model.textInMainColor
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: color_model.mainColor
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),


                    Container(
                      width: size.width-20,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color_model.cardColor,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color:Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(10,10)
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            L10n.of(context)!.click_here_for__app_opinions_impressions_and_bug_reports,
                            style: TextStyle(
                              color: color_model.cardTextColor,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                L10n.of(context)!.producer_s_twitter,
                                style: TextStyle(
                                  color: color_model.cardTextColor
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  try {
                                    await launch('twitter://user?id=1414352560446578689'); //twitter id  1414352560446578689
                                  } catch (e) {
                                    try {
                                      await launch('https://twitter.com/ryu_develop');
                                    } catch (e) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Theme(
                                            data: ThemeData.light(),
                                            child: CupertinoAlertDialog(
                                              title:Text(L10n.of(context)!.could_not_open_twitter),
                                              content:Text(L10n.of(context)!.something_went_wrong_and_it_failed_Please_try_again_in_a_good_communication_environment),
                                              actions: <Widget>[
                                                CupertinoDialogAction(
                                                  child: Text(L10n.of(context)!.ok),
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  width: size.width*0.1,
                                  height: size.width*0.1,
                                  child: Image.asset('images/Twitter social icons - rounded square - blue.png'),
                                ),
                              )
                            ],
                          ),

                          Text(
                                '@ryu_develop',
                                style: TextStyle(
                                  color: color_model.cardTextColor
                                ),
                              ),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      child: adWidget,
                      width: banner.size.width.toDouble(),
                      height: banner.size.height.toDouble(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

