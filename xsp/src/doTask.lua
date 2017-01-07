
require("judge");

function 妖怪发现(task)

if task.name == "妖怪发现" then
  local showStr = "妖怪发现，第"..task.times.."次";
  showHUD(infoHUD,showStr,18,"0xffff0000","0xffffffff",0,0,0,200,44);
  
  if task.times == 1 then
    table.remove(taskArray);
    showHUD(infoHUD,"妖怪发现已停止",18,"0xffff0000","0xffffffff",0,0,0,200,44);
    
  elseif task.times > 1 then
    task.times = task.times - 1;
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
      --没有在队伍中， 退出副本
      tap(84, 110);
      mSleep(1000);
      
      tap(1341, 701);
      mSleep(1500);
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
		elseif dealCooperateTaskType == 0 then
			--接受协作任务
			
		elseif isValueType then
		--接受协作任务
			
		else
		--拒绝协作任务
		
		end
		mSleep(1000);
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
    
		mSleep(1500);

    return false;
  end
	
	
  --如果是结算页面， 点击屏幕 （结算页面很可能连续出现三次）
  if isPage("点击屏幕继续") then
    math.randomseed(os.time());
    tap(500 +  1000 * math.random()   , 500 + 500 * math.random());
		mSleep(1000);
    return false;
  end
	
  return true;
end