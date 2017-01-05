
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
  
  
end
end


--执行任务之前的准备工作
function prepareDeal ()
  --判断当前所在页面
  
  --如果是战斗页面， 检测准备  检测自动/手动 检测最右边的那个是否为普攻
  
  --如果是结算页面， 点击屏幕
  
  --如果是在副本里面， 需要判断有没有人一起组队， 没有的话需要退出副本
  
  
end