# AroundRadarBuoy
From The Depthsにおける周回レーダーブイ用スクリプト

## できること
レーダーブイミサイルを制御し、敵の周りをぐるぐる周らせる。

## できないこと
他のLUA制御ミサイルとの同居は、このままではできない。

## 必要なもの
- LUA Box
- AI Mainframe
- General Purpose Processing Card 適量
- 弾薬箱
- Missile Radar Buoy Holder
- Local Weapon Contoller
- ミサイルランチャー一式
  - Controller x1
  - Launch Pad x1以上
  - Gantry x3以上
  - LUA Transceiver
- ミサイル設定
  - Fins x1
  - Fuel tank できるだけ
  - Variable Thruster x1
  - Regulator できるだけ
  - LUA Receiver x1
  - Radar Buoy x1
  
## 使い方
必要なものを設置する。

デコイとしてではなく索敵として使う場合、Missile Radar Buoy HolderはMainframeに、有線または無線で接続してください。
![設置](https://github.com/tvagames/AroundRadarBuoy/blob/images/20170705171414_1.jpg?raw=true "設置")

LUA Box をQキーで開いて、[ソースコード（AroundRadarBuoy.lua）](https://github.com/tvagames/AroundRadarBuoy/blob/master/AroundRadarBuoy.lua)で上書きし、F8キーで適用する。
![貼り付け](https://github.com/tvagames/AroundRadarBuoy/blob/images/20170705152209_1.jpg?raw=true "貼り付け")

ミサイルを設定する。

Variable ThrusterのTruster per secondは低い方が長持ちする。
![ミサイル設定](https://github.com/tvagames/AroundRadarBuoy/blob/images/20170705150902_1.jpg?raw=true "ミサイル設定")

軌道はこんな感じ。
![軌道](https://github.com/tvagames/AroundRadarBuoy/blob/images/20170705171432_1.jpg?raw=true "軌道")
