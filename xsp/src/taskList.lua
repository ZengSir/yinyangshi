--根据用户的设置创建任务列表
require("doTask");

--任务栈 先进先出
local taskArray = {};

--根据用户设置，创建任务列表
function createTaskListWithSetting(setting)
  
  if setting["只接受邀请_name"] == "0" then
    local name = "只接受邀请";
    local friendName = setting["只接受邀请_friendName"];
    local inviteType = setting["只接受邀请_type"];
    
		local task = {};
		task.name = name;
		task.friendName = friendName;
		task.inviteType = inviteType;
		printTable(task);
		
		--指定邀请人
		if inviteType == 1 then
		--指定用户的名字
			if friendName == "1" then
				dialogRet(name.."任务需要设置邀请人名字。", "好的","","", 0);
				mSleep(500);
				return false;
			end
		end
		
		table.insert(taskArray, task);
    
		return true;
		
  end
  
  if setting["妖怪发现_name"] == "0" then
    
    local name = "妖怪发现";
    local times = setting["妖怪发现_tiems"];
    local chapter = setting["妖怪发现_chapter"];
    local attackBoss = setting["妖怪发现_attackBoss"];
    local fightType = setting["妖怪发现_fightType"];
    
    --判断输入框是否有数据，防止为nil
    if times == nil then
      dialog(name.."任务需要输入次数", 5);
      mSleep(1000);
    end
    sysLog("name:"..name);
    sysLog("times:"..times);
    sysLog("chapter:"..chapter);
    sysLog("attackBoss:"..attackBoss);
    sysLog("fightType:"..fightType);
    
    
  end
  
end


--添加一个任务
function addTask(task) 
  
  
end


--对任务进行排序
function sortTaskArray () 
  
  
end

--移除一个任务
function removeTask(task)
  
end


function startTask () 
  
	sysLog("开始执行以下任务:");
	printTable(taskArray);
	
  while next(taskArray) ~= nil do 
    local task = taskArray[1];
    
    if task["name"] == "妖怪发现" then
      妖怪发现(task);
      
		elseif task.name == "只接受邀请" then
			只接受邀请(task);
		
    elseif task.name == "结界突破" then
      结界突破(task);
      
    end
    
    mSleep(3000);
    
  end
  
end

