
require("judge");
require("find");

function 妖怪发现(task)
sysLog("妖怪发现任务");

if task.name == "妖怪发现" then
  local showStr = "妖怪发现，第"..task.times.."次";
  showHUD(infoHUD,showStr,18,"0xffff0000","0xffffffff",0,0,0,200,44);
  
  
  --准备工作
  local isFinishPrepareDeal = false;
  while  not isFinishPrepareDeal do
    isFinishPrepareDeal = finishPrepareDeal();
  end
  
  --处理是否继续邀请好友
  
  --判断当前所在页面
  if isPage("探索页面") then
    --进入对应的章节
    findChapter(task.chapter);
    
    sysLog("测试到这里")
    
    mSleep(2000);
    --判断是否是探索或挑战弹出框
    if isExplorationAlert() then
      --选择 困难  或者  普通
      --tap(583,389);	--普通
      tap(841,377);	--困难
      mSleep(800);
      
      --组队或探索
      if task.makeTeam then
        --选择组队
        tap(1079,913);
        mSleep(1000);
        --只选择左上角第一个邀请
        tap(853,370);
        mSleep(1000);
        
        --选择邀请
        tap(1343,984);
        mSleep(1000);
        
      else
        --选择探索
        tap(1635,922);
      end
    end
  end
  
  --如果是在妖怪发现副本里面， 需要根据情况退出
  if isPage("妖怪发现副本") then
    
    --探索副本妖怪
    for tmpi=1,6 do
      
      local x, y = findMonster(task.fightType, task.attackBoss);
      if x ~= -1 and y ~= -1 then
        tap(x,y);
        mSleep(1000);
        return;
      else
        if tmpi <= 3 then
          --左滑
          swip(2100,793, 1000,811);
          mSleep(1000);
        else
          --右滑
          swip(1000,811, 2100,793);
          mSleep(1000);
        end
      end
    end
    
    
    --等待3秒，发现宝箱
    mSleep(3000);
    --自动领取宝箱
    findReward();
    
    --领取完宝箱之后，判断是否还在妖怪发现副本
    if isPage("妖怪发现副本") then
      tap(84, 110);
      mSleep(1000);
      
      tap(1341, 701);
      mSleep(1000);
    end
    
    
		--任务结算 点击进入到了对应的章节，并退出一次，表示完成一次任务
    if task.times == 1 then
      showHUD(infoHUD,"妖怪发现已停止",18,"0xffff0000","0xffffffff",0,0,0,200,44);
      removeTask(task);
    elseif task.times > 1 then
      task.times = task.times - 1;
    end
    
    
  end
  
  
  
  
  
end
end


function 结界突破(task)
if task.name == "结界突破" then
  local showStr = task.name.."，第"..task.times.."次";
  showHUD(infoHUD,showStr,18,"0xffff0000","0xffffffff",0,0,0,200,44);
  
  if task.times == 1 then
    table.remove(taskArray);
    showHUD(infoHUD,task.name.."，已停止",18,"0xffff0000","0xffffffff",0,0,0,200,44);
    
  elseif task.times > 1 then
    task.times = task.times - 1;
  end
end
end

function 只接受邀请(task)

sysLog("只接受邀请任务");

if task.name == "只接受邀请" then
  local showStr = task.name;
  showHUD(infoHUD,showStr,18,"0xffff0000","0xffffffff",0,0,0,200,44);
  
  
  --准备工作
  local isFinishPrepareDeal = false;
  while  not isFinishPrepareDeal do
    isFinishPrepareDeal = finishPrepareDeal();
  end
  
  --如果是在妖怪发现副本里面， 需要根据情况退出
  if isPage("妖怪发现副本") then
    if not isTeam() then
      --没有在队伍中
      --等待3秒，发现宝箱
      mSleep(3000);
      --自动领取宝箱
      findReward();
      
      --领取完宝箱之后 等待1秒，判断是否还在妖怪发现副本
			mSleep(1000);
      if isPage("妖怪发现副本") then
        tap(84, 110);
        mSleep(1000);
        
        tap(1341, 701);
        mSleep(1000);
      end
    end
  end
  
  --接受邀请
  if isReceivedInvitation() then
    tap(242, 451);
    mSleep(1500);
  end
  
end
end


--执行任务之前的准备工作
function finishPrepareDeal ()
  --判断弹出框
  --判断是否有协作任务   如果是勾玉或体力奖励，接受
  local isCooperation, isValueType = isCooperation();
  if isCooperation then
    
    if dealCooperateTaskType == 2 then
      --拒绝协作任务
      tap(1474,896);
    elseif dealCooperateTaskType == 0 then
      --接受协作任务
      tap(1475,725);
    elseif isValueType then
      --接受协作任务
      tap(1475,725);
      
    else
      --拒绝协作任务
      tap(1474,896);
      
    end
    mSleep(500);
    
    return false;
  end
  
  --判断是否有弹出框   确认或取消
  
  
  --判断当前所在页面
  --如果是战斗页面， 检测准备  检测自动/手动
  if isPage("战斗页面") then
    
    local lines = {};
    --准备  c46a22-c46a22
    lines[1] = "0020040180701E07C0F03C0F01C0701C0200000000000000000040080100300700700F01FFBF83E07C0700E01C0380300700E00C01E03E03E07C0780F00E01C0180100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200C0380F01806018060180300800000000000000000000000000600E01F03E07C0F01E03C038060080100$准备$21.33.2688$93";
    --手动  f4eedc-444444
    lines[2] = "020040080180200C0180700F01E03F8FF1CE700E03C0F01E03C0300200000000000000000000000000000000000000000000000000000000000000000000000000000000000000100200C0180300E01C0380600C0380600C0080100000000000000000000000FFBFF3FE7E0800$手动$9.9.828$47";
    --自动	f4eedc-444444
    lines[3] = "00603C1E0F8FE1F81C03804000000080100600C01801002000000000000000000000000000000000000000000000000000000000000000000000000000000080100600C0180700E01C0300601C0300600400800000000000000000000007FFFFDFFBF0400$自动$6.9.859$45";
    
    --加载自定义字库
    local dic = createOcrDict(lines);
    local results = ocrText(dic,1887,856,2137,1043, {"0xc46a22-0xc46a22"}, 95,0,0);
    sysLog("识别出来的文字是："..results);
    if results == "准备" then
      tap(2010, 940);
    end
    
    results = ocrText(dic,50,1091,167,1200, {"0xf4eedc-0x444444"}, 95,0,0);
    sysLog("识别出来的文字是："..results);
    
    if results == "手动" then
      tap(104,1140);
    end 
    
    mSleep(1000);
    return false;
  end
  
  --如果是结算页面， 点击屏幕 （结算页面很可能连续出现三次）
  if isTapToContinue() then
    math.randomseed(os.time());
    tap(500 +  1000 * math.random()   , 500 + 500 * math.random());
    mSleep(500);
    return false;
  end
  
  --如果是探索或挑战弹出框， 点击关闭按钮
  if isExplorationAlert() then
    tap(1815,254);
    return false;
  end
  
  
  --如果是组队邀请弹出框， 点击取消
  if isMakeTeamAlert() then
    tap(879,995);
    return false;
  end
  
  
  return true;
end