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
  - LUA Transceiver x1以上 Launch Padと同数
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

## FAQ
### 水上艦や飛行機で使いたい
```AroundRadarBuoy.lua
DETONATE_IN_WATER = false -- 水没したら自爆するかどうか
```
の箇所を
```AroundRadarBuoy.lua
DETONATE_IN_WATER = true -- 水没したら自爆するかどうか
```
にすると、ミサイルが燃料切れ＆水没したのに次弾が発射されない問題を気にしなくてよくなる。

### 潜水艦で使いたい
Fuel tank と Regulator の数や、Variable Thruster の Truster per second の値のバランスが悪いと、燃料切れ＆水没したのに次弾が発射されない場合があります。

その場合、以下のオプションを変更することで、時間が来たらミサイルが自爆するようにできます。

```AroundRadarBuoy.lua
DETONATE_BY_TIME = false -- 時間経過で自爆するかどうか
REGULATOR_COUNT = 3 -- ミサイルのRegulatorの数
FUEL_TANK = 5 -- ミサイルのFuel tankの数
TPS = 50 -- Variable ThrusterのThrust per second
```

最小構成の Fuel tank x1 と Regulator x1、 Truster per second 50 の場合
```AroundRadarBuoy.lua
DETONATE_BY_TIME = true -- 時間経過で自爆するかどうか
REGULATOR_COUNT = 1 -- ミサイルのRegulatorの数
FUEL_TANK = 1 -- ミサイルのFuel tankの数
TPS = 50 -- Variable ThrusterのThrust per second
```

以上
