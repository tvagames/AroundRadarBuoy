--------------------
-- 軌道オプション
--------------------
HEIGHT_OFFSET = 100 -- 目標の頭上何mを回るか
AROUND_DISTANCE = 200 -- 周回半径

--------------------
-- 自爆用オプション
--------------------
DETONATE_BY_TIME = false -- 時間経過で自爆するかどうか
REGULATOR_COUNT = 3 -- ミサイルのRegulatorの数
FUEL_TANK = 5 -- ミサイルのFuel tankの数
TPS = 50 -- Variable ThrusterのThrust per second
TANK_CAPA = 5000
DETONATE_IN_WATER = false -- 水没したら自爆するかどうか

--------------------
-- レーダーブイ周回
--------------------
function AroundRardarBuoy(I, targetPosition)
  targetPosition.y = targetPosition.y + HEIGHT_OFFSET
  fuelTime = FUEL_TANK * TANK_CAPA / TPS
  lifeTime = Mathf.Min(fuelTime, 60 + REGULATOR_COUNT * 180)
  time = I:GetTime()
  transCount = I:GetLuaTransceiverCount()
  for transIndex = 0, transCount - 1, 1 do
    mc = I:GetLuaControlledMissileCount(transIndex)
    for mi = 0, mc - 1, 1 do
      m = I:GetLuaControlledMissileInfo(transIndex,mi)
      if DETONATE_BY_TIME and m.TimeSinceLaunch > lifeTime then
        I:LogToHud("レーダーブイ寿命につき自爆。生存時間は" .. m.TimeSinceLaunch .. "秒でした")
        I:DetonateLuaControlledMissile(transIndex,mi)
      elseif DETONATE_IN_WATER and m.Position.y < 0 then
        -- 水没したら自爆
        I:LogToHud("レーダーブイ水没につき自爆。生存時間は" .. m.TimeSinceLaunch .. "秒でした")
        I:DetonateLuaControlledMissile(transIndex,mi)
      else
        mpos = m.Position
        mpos.y = targetPosition.y
        -- 目標から見たミサイルへのベクトル
        v = mpos - tp 
        vn = v.normalized
        p = Quaternion.Euler(0, 45, 0) * vn
        aimpos = tp + (p * AROUND_DISTANCE)
        I:SetLuaControlledMissileAimPoint(transIndex,mi,aimpos.x,targetPosition.y,aimpos.z)
      end
    end
  end
end

--------------------
-- FromTheDepths
--------------------
function Update(I)
  I:ClearLogs()
  tc = I:GetNumberOfTargets(0)

  if tc > 0 then
    -- 敵がいるとき
    ti = I:GetTargetInfo(0, 0)
    tp = ti.Position
    AroundRardarBuoy(I, tp)
  end
end
