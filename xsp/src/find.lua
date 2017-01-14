
--获取通关妖气发现时，纸片人的宝箱
function findReward () 
  
  local shouldFind = true;
  
  while shouldFind do
    local x, y = findMultiColorInRegionFuzzy(0xaf421d,"22|-14|0xfff4d4,-22|-13|0xfff4d4,-22|18|0xfff4d4,22|19|0xfff4d4,-7|88|0xdfd6c6",90,590,543,1646,1225);
    if x ~= -1 and y ~= 1 then  --如果找到符合条件的点
      tap(x, y);
      mSleep(1000);
      tap(1888, 888);
      mSleep(1000);
      
      --需要找下一个宝箱
      shouldFind = true;
    else
      shouldFind = false;
    end
  end
  
  
end

--在探索页面， 找到对应的章节并进入
function findChapter (chapter)
  sysLog("需要找到的章节是："..chapter);
  --识别区域
  local reactX0 = 1902;
  local reactY0 = 260;
  local reactX1 = 2162;
  local reactY1 = 1118;
  local degree = 95;
  
  local currentChapter = "未知";
  
  local x1, y1 = findMultiColorInRegionFuzzy(0xf8f3e0,"93|1|0xf8f3e0,34|16|0xf6f1df,67|14|0xf8f3e0,50|24|0x3f2311,52|24|0x3f2311", degree, reactX0, reactY0, reactX1, reactY1);
  if x1 > -1 then
    currentChapter = "第一章";
    sysLog("找到："..currentChapter);
    if currentChapter == chapter then
      tap(x1,y1);
      return;
    end
  end
  
  local	x2, y2 = findMultiColorInRegionFuzzy(0xe3decc,"15|-1|0xd3cdbc,-10|25|0xeae4d2,26|24|0xede8d5,53|-10|0xd9d3c2,45|-5|0xc7c1b0,65|-7|0xe6e0ce", degree, reactX0, reactY0, reactX1, reactY1);
  if x2 > -1 then
    currentChapter = "第二章";
    sysLog("找到："..currentChapter);
    if currentChapter == chapter then
      tap(x2,y2);
      return;
    end
  end
  
  
  local x3, y3 = findMultiColorInRegionFuzzy(0xf8f3e0,"11|0|0xf2edda,1|14|0xf5f0dd,11|13|0xf7f2df,-10|30|0xf3eddb,24|30|0xf5f0dd,53|-5|0xf7f2df,-50|-6|0xf8f3e0", degree, reactX0, reactY0, reactX1, reactY1);
  if x3 > -1 then
    currentChapter = "第三章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x3,y3);
      return;
    end
  end
  
  local x4, y4 = findMultiColorInRegionFuzzy(0xd3cdbc,"36|-1|0xddd7c5,5|27|0xece6d4,28|28|0xc3bdad,10|16|0xbab4a3,26|14|0xe3decc,64|-10|0xd8d2c0,57|-5|0xefead8,76|-7|0xe7e1cf", degree, reactX0, reactY0, reactX1, reactY1);
  if x4 > -1 then
    currentChapter = "第四章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x4,y4);
      return;
    end
  end
  
  
  local x5, y5 = findMultiColorInRegionFuzzy(0xf5f0dd,"15|-1|0xf8f3e0,7|7|0xf7f2df,-1|14|0xf6f1de,15|13|0xf3eedc,-2|24|0xf4eedc,14|20|0xf8f3e0,-9|32|0xf8f3e0,25|31|0xf8f3e0,54|-4|0xf5f0dd", degree, reactX0, reactY0, reactX1, reactY1);
  
  if x5 > -1 then
    currentChapter = "第五章";
    sysLog("找到："..currentChapter);
    if currentChapter == chapter then
      tap(x5, y5);
      return;
    end
  end
  
  local x6, y6 = findMultiColorInRegionFuzzy(0xb3ac9d,"-14|13|0xe2ddcb,25|10|0xebe6d4,-1|21|0xece7d5,-10|34|0xd6d1bf,18|35|0xe5dfcd,13|24|0xf4efdc,51|-5|0xd8d2c1,43|0|0xc7c1b0,63|-2|0xe7e1cf", degree, reactX0, reactY0, reactX1, reactY1);
  if x6 > -1 then
    currentChapter = "第六章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x6,y6);
      return;
    end
  end
  
  local x7, y7 = findMultiColorInRegionFuzzy(0xbfb9a8,"-15|21|0xe6e0ce,23|14|0xeae4d2,3|33|0xd9d4c2,17|32|0xddd8c6,49|-4|0xdfd9c7,41|0|0xc7c1b0,61|-2|0xe7e2d0", degree, reactX0, reactY0, reactX1, reactY1);
  if x7 > -1 then
    currentChapter = "第七章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x7,y7);
      return;
    end
  end
  
  local x8, y8 = findMultiColorInRegionFuzzy(0xc6c0b0,"-12|14|0xcec8b7,8|-9|0xafa899,26|16|0xc4beae,32|15|0xe0dbc9,55|-17|0xded8c7,30|-597|0xbeb8a8,47|-13|0xc7c1b0,67|-15|0xe8e2d0", degree, reactX0, reactY0, reactX1, reactY1);
  if x8 > -1 then
    currentChapter = "第八章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x8,y8);
      return;
    end
  end
  
  local x9, y9 = findMultiColorInRegionFuzzy(0xdbd5c3,"-14|14|0xdcd6c5,-18|34|0xb3ad9d,12|7|0xeae4d2,5|34|0xf8f3e0,22|36|0xe5e0ce,23|29|0xbeb8a8", degree, reactX0, reactY0, reactX1, reactY1);
  if x9 > -1 then
    currentChapter = "第九章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x9,y9);
      return;
    end
  end
  
  local x10, y10 = findMultiColorInRegionFuzzy(0xc2bcab,"-19|19|0xd9d4c2,-1|40|0xcfc9b8,19|16|0xccc7b6,45|-2|0xdbd6c4,37|2|0xc7c1b0,57|0|0xe9e4d2", degree, reactX0, reactY0, reactX1, reactY1);
  if x10 > -1 then
    currentChapter = "第十章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x10,y10);
      return;
    end
  end
  
  local x11, y11 = findMultiColorInRegionFuzzy(0xc9c3b2,"-19|19|0xb1aa9a,0|40|0xc0baa9,20|16|0x968f81,26|18|0xc2bcac,69|18|0x878072", degree, reactX0, reactY0, reactX1, reactY1);
  if x11 > -1 then
    currentChapter = "第十一章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x11,y11);
      return;
    end
  end
  
  local x12, y12 = findMultiColorInRegionFuzzy(0xc4beae,"-19|19|0xb4ae9e,0|41|0x989082,20|17|0xc6c0af,38|8|0xa29b8c,55|7|0x948c7e,28|33|0x928a7c,66|32|0xcec8b7", degree, reactX0, reactY0, reactX1, reactY1);
  if x12 > -1 then
    currentChapter = "第十二章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x12,y12);
      return;
    end
  end
  
  local x13, y13 = findMultiColorInRegionFuzzy(0xded9c7,"-18|19|0xe5e0ce,0|38|0xdcd6c5,19|16|0xf7f2df,39|5|0xf6f1de,54|4|0xf5f0dd,40|19|0xd0cab9,53|18|0xb3ac9c,28|35|0x91897b,66|34|0xd5d0be", degree, reactX0, reactY0, reactX1, reactY1);
  if x13 > -1 then
    currentChapter = "第十三章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x13,y13);
      return;
    end
  end
  
  local x14, y14 = findMultiColorInRegionFuzzy(0xdcd6c5,"-18|19|0xe6e1cf,0|38|0xddd8c6,19|16|0xf7f2df,29|7|0xf1ecd9,64|6|0xded8c7,33|34|0xebe5d3,56|35|0xc9c3b3,39|22|0xcdc7b6,55|21|0xd7d2c0", degree, reactX0, reactY0, reactX1, reactY1);
  if x14 > -1 then
    currentChapter = "第十四章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x14,y14);
      return;
    end
  end
  
  local x15, y15 = findMultiColorInRegionFuzzy(0xf2eddb,"-18|18|0xf5f0dd,-1|37|0xe3decc,18|15|0xf6f1de,38|4|0xf8f3e0,36|19|0xeae5d3,28|36|0xf8f3e0,64|35|0xf8f3e0,38|26|0xefe9d7", degree, reactX0, reactY0, reactX1, reactY1);
  if x15 > -1 then
    currentChapter = "第十五章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x15,y15);
      return;
    end
  end
  
  local x16, y16 = findMultiColorInRegionFuzzy(0xede8d6,"-19|18|0xece7d5,-1|37|0xe4decc,17|15|0xf7f2df,42|3|0xf8f3e0,27|14|0xf3eedb,65|12|0xf7f2df,30|35|0xe0dbc9,40|24|0xcdc7b6,58|36|0xe9e3d1", degree, reactX0, reactY0, reactX1, reactY1);
  if x16 > -1 then
    currentChapter = "第十六章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x16,y16);
      return;
      
    end
  end
  
  local x17, y17 = findMultiColorInRegionFuzzy(0xf8f3e0,"101|6|0xf8f3e0,86|23|0xf8f3e0,120|16|0xf8f3e0,113|35|0xf8f3e0,103|34|0xf8f3e0,57|3|0xf8f3e0,56|34|0xf8f3e0,149|0|0xf8f3e0", degree, reactX0, reactY0, reactX1, reactY1);
  if x17 > -1 then
    currentChapter = "第十七章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x17,y17);
      return;
      
    end
  end
  
  local x18, y18 = findMultiColorInRegionFuzzy(0xf8f3e0,"-17|17|0xf7f2df,-1|34|0xf0ebd8,18|12|0xeee9d7,25|25|0xded9c7,35|13|0xf1ecda,47|6|0xf6f1de,66|27|0xe2dcca,55|19|0xf8f3e0", degree, reactX0, reactY0, reactX1, reactY1);
  if x18 > -1 then
    currentChapter = "第十八章";
    sysLog("找到："..currentChapter);
    
    if currentChapter == chapter then
      tap(x18,y18);
      return;
    end
  end
  
  
  
  for tmpi=1,5 do
    
    sysLog("识别出来的章节文字是："..currentChapter);
    local findChapterNumber = covertChapterToNumber(currentChapter);
    local chapterNumber = covertChapterToNumber(chapter);
    if findChapterNumber > chapterNumber then
      --下拉
      swip(2031,282, 2043,1080);
    else
      --上拉
      swip(2043,1080,2031,282);
    end
    mSleep(500);
    
    findChapter(chapter);
    
  end
  
end


--找攻击标志
function findMonster (attackType, attackTypeBoss)
  sysLog("寻找攻击目标："..attackType);
  for tmpi=1,10 do
    --是否打boss 优先打boss
    if attackTypeBoss then
      
      local bossX, bossY = findMultiColorInRegionFuzzy(0x452b57,"-51|-22|0xcb3b3c,52|-38|0xcd3131,2|29|0xfffffc,52|50|0xd4a344,-6|58|0xeca6ad,10|-55|0xeeb3b9", 95, 0, 0, 1241, 2207)
      if bossX > -1 then
        return bossX, bossY;
      end
      
      
    end
    
    --找到所有的攻击标志
    local point = findMultiColorInRegionFuzzyExt(0xe8eafb,"-2|-77|0x6e4521,-76|-2|0x6c4421,73|-3|0x68411f,5|82|0xf8f3e0,41|58|0x57351a", 98, 1,479,2200,1042);
    sysLog("所有的攻击标志:");
    printTable(point);
    if #point ~= 0 then  --如果找到符合条件的点
      for var = 1,#point do
        local x, y = point[var].x, point[var].y;
        
        --根据找到的攻击， 得到下方一个区域，用来判断是哪一种类型的妖怪
        local x1,y1, x2,y2 =  x - 100, y + 100, x + 100, _height;
        
        if attackType == "打全部" then
          sysLog("打全部");
          return x, y;
        elseif attackType == "打经验怪" then
          local x0, y0 = findMultiColorInRegionFuzzy(0xd07a17,"9|-1|0xddcca2,-3|11|0xf0bb03", 95, x1, y1, x2, y2);
          if x0 ~= -1 and y0 ~= -1 then  --如果找到符合条件的点
            sysLog("打经验怪");
            return x, y;
          end
        elseif attackType == "打金钱怪" then
          local x0, y0 = findMultiColorInRegionFuzzy(0xe7cc0c,"5|-9|0xf0b409,-8|-36|0xd9cd84,-6|-32|0xd5c77e", 95, x1, y1, x2, y2);
          if x0 ~= -1 and y0 ~= -1 then  --如果找到符合条件的点
            sysLog("打金钱怪");
            return x, y;
          end
          
          
        elseif attackType == "打经验和金钱" then
          local x0, y0 = findMultiColorInRegionFuzzy(0xd07a17,"9|-1|0xddcca2,-3|11|0xf0bb03", 95, x1, y1, x2, y2);
          if x0 ~= -1 and y0 ~= -1 then  --如果找到符合条件的点
            sysLog("打经验怪");
            return x, y;
          end
          
          local x0, y0 = findMultiColorInRegionFuzzy(0xe7cc0c,"5|-9|0xf0b409,-8|-36|0xd9cd84,-6|-32|0xd5c77e", 95, x1, y1, x2, y2);
          if x0 ~= -1 and y0 ~= -1 then  --如果找到符合条件的点
            sysLog("打金钱怪");
            return x, y;
          end				
        end
      end
    else
      return -1, -1;
    end
    
    mSleep(100);
  end
  
  return -1, -1;
end

--找Boss
function findBossMonster()
  
end

--找经验怪
function findExpMonster ()
  
  --找到所有的攻击标志
  local point = findMultiColorInRegionFuzzyExt(0xd4d4ed,"-8|-46|0xf1aeb8,-17|38|0xeba0a9,36|2|0xdc959c,-32|68|0xff9e34,53|80|0x950846,7|78|0xf8f3e0,-43|89|0x0e110c,23|-37|0xfce26d", 95, 1357, 555, 1360, 557)
  if #point ~= 0 then  --如果找到符合条件的点
    for var = 1,#point do
      local x, y = point[var].x, point[var].y;
      local x1,y1, x2,y2 =  x - 70, y + 100, x + 70, _height;
      
      --根据找到的攻击， 得到下方一个区域，用来判断是哪一种类型的妖怪
      local x0, y0 = findMultiColorInRegionFuzzy(0x2b647a,"10|16|0x7c1414,18|3|0xbca480", 95, 0, 410, 2206, 1217)
      if x0 ~= -1 and y0 ~= -1 then  --如果找到符合条件的点
        return x, y;
      end
      
    end
  end
  
  return -1, -1;
  
end

--找金币怪
function findMoneyMonster ()
  
end

--找御魂怪
function findArmMonster ()
  
end
