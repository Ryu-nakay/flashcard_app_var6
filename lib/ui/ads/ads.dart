import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

bool AD_TEST_FLAG=true;//本番時falseにすること

final BannerAd banner = BannerAd(
  adUnitId:AD_TEST_FLAG? 
  Platform.isAndroid
    ? 'ca-app-pub-3940256099942544/6300978111'
    : 'ca-app-pub-3940256099942544/2934735716'
  :Platform.isAndroid
    ?'ca-app-pub-7890813071878910/4158368755'
    :'ca-app-pub-7890813071878910/3093726760',
  size: AdSize.banner,
  request: AdRequest(),
  listener: BannerAdListener(),
);

/* 
テンプレート

  コンストラクタ内に配置
  banner.load();


  widget定義
  final AdWidget adWidget=AdWidget(ad: banner);


  画面下中央に配置
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

*/