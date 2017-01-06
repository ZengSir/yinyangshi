--判断当前页面
function isPage (pageName) 
  --判断是否是庭院
  
  --判断是否是盯
  
  --判断是否是 探索页面
  
  --判断是否是 点击屏幕继续
  if (pageName == "点击屏幕继续") then
    sysLog("判断是否为--点击屏幕继续");
    local lines = {};
    --点击屏幕继续  fcfdfd-999999
    lines[1] = "3807FCFF9FF3FE7FC308010020040180300601C038030020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FE1FF3FE7FC7F87F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007F0FE1FC3F83F0780E01C0780F01E0388710E21C4708E33C679CFF9FF1FE1FC3C070000000000000000000000000000000000000000000000000000700E03C0780F01E0383F8FF1FE3FE1FC0C0380700E41F83F0FFFFFFFFFB3F63E43C0780F03E07C0F80E0080000000000000000000000000000000000000000000000000001E0FC3F87F07C070000000000040180300600400000000000000000001FC3F87F07E0700000000600C038030020000000000000000000000000000000000000000000201C1F87F0FE0F81E0$点击屏幕继续$18.249.3880$47";
    
    --加载自定义字库
    local dic = createOcrDict(lines);
    
    --因为这个文字会变化， 所以识别三次， 又一次成功即代表成功
    for tmpi=1,3 do
      local results = ocrText(dic,955,1168,1254,1223, {"0xfcfdfd-0x999999"}, 95,0,0);
      sysLog("识别出来的文字是："..results);
      if results == "点击屏幕继续" then
        return true;
      end
      
      mSleep(300);
    end
  end
  
  
  --判断是否是战斗页面 （根据识别自动/手动 图标判断）
  if pageName == "战斗页面" then
    sysLog("判断是否为--战斗页面");
    
    local lines = {};
    --手动  f4eedc-444444
    lines[1] = "020040080180200C0180700F01E03F8FF1CE700E03C0F01E03C0300200000000000000000000000000000000000000000000000000000000000000000000000000000000000000100200C0180300E01C0380600C0380600C0080100000000000000000000000FFBFF3FE7E0800$手动$9.9.828$47";
    --自动	f4eedc-444444
    lines[2] = "00603C1E0F8FE1F81C03804000000080100600C01801002000000000000000000000000000000000000000000000000000000000000000000000000000000080100600C0180700E01C0300601C0300600400800000000000000000000007FFFFDFFBF0400$自动$6.9.859$45";
    
    --加载自定义字库
    local dic = createOcrDict(lines);
    local results = ocrText(dic,50,1091,167,1200, {"0xf4eedc-0x444444"}, 95,0,0);
    sysLog("识别出来的文字是："..results);
    
    if results == "自动"  or results == "手动" then
      return true;
    end    
  end
  
  
  --判断是否是妖怪发现副本中
  if pageName == "妖怪发现副本" then
    sysLog("判断是否为--妖怪发现副本")
    
    local lines = {};
    --锁定出战式神  fcfdfd-999999
    lines[1] = "00200C0F8FF3FE7FCF08C1002004008010000080380700E00C001807FEFFDFF9FF0000040180F03C1F83E0380300000000000000000000000000000000000040180700E00C0180300E01C03B0770EF19F33EE3FC1F80F01C0380700E01C07E0FC1F81F03E0380300000000000000000000000000000000000000000000000000000000000000000000000000000200FC1FFFFFFFF7FE000000000000000000000200C0080100200000000000000000000000000000000000000000000000000001FE3FC3F87F0000000000000000000000000E03FC3FF7FE7FC00000000180380780F00F01F00000000000000000000000000000000000000000000000000000000000000000000000000000200FE1FF3FFBFF01E00400801002004C09C13C07C0F80F0000000000000000000000000000000000000000000000000000000000000000180380780F01F01F0180$锁定出战式神$8.0.2944$43";
    
    --加载自定义字库
    local dic = createOcrDict(lines);
    local results = ocrText(dic,1777,1092,2071,1148, {"0xfcfdfd-0x999999"}, 85,0,0);
    sysLog("识别出来的文字是："..results);
    
    if results == "锁定出战式神" then
      return true;
    end  
  end
  
  return false;
end

--每次任务之前，先判断是否有弹出框，并做处理，以免程序无法正常运行
function isAlert (alertName)
  
  --判断是否收到协作任务弹出框
  
  --判断是否是邀请弹出框
  
  --判断是否是取消/确认 弹出框
  
  return false;
end




function isTeam () 
  
  local points = {
    {x = 28-86, y = 273 - 215, color = 0x3d2a27},
    {x = 87 - 86, y = 328 - 215, color = 0x4a3c1e},
    {x = 142 - 86, y = 270 - 215, color = 0x412d2b}
  };
  
  local x, y = findMultiColorInRegionFuzzy2(0x62441f, points, 100, 9,187,154,538);
  
  if x ~= -1 and y ~= -1 then
    return true;
  else                 
    return false;
  end
end


function isReceivedInvitation ()
  
   local points = {
    {x = 237 - 241, y = 438 - 447, color = 0x6fba78},
    {x = 217 - 241, y = 421 - 447, color = 0x69bc74},
    {x = 202 - 241, y = 435 - 447, color = 0x53a95c},
    {x = 237 - 241, y = 470 - 447, color = 0x448a4b},
    {x = 285 - 241, y = 423 - 447, color = 0x54a35b},
    {x = 269 - 241, y = 409 - 447, color = 0x6ebf78},
    {x = 238 - 241, y = 452 - 447, color = 0x54b15f}
  };
  
  local x, y = findMultiColorInRegionFuzzy2(0x54b15f, points, 95, 175,378,309,503);
  
  if x ~= -1 and y ~= -1 then
    return true;
  else                 
    return false;
  end
end


