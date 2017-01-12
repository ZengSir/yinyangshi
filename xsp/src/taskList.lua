--根据用户的设置创建任务列表
require("doTask");

--任务栈 先进先出
local taskArray = {};
--全局设置
--对协作任务的处理方式  0:表示全部接受， 1:表示只接受 勾玉 或 体力， 2:表示拒绝
dealCooperateTaskType = 0;

--根据用户设置，创建任务列表
function createTaskListWithSetting(setting)

	dealCooperateTaskType = setting["协作任务"];

  if setting["只接受邀请_name"] == "0" then
    local name = "只接受邀请";
    local inviteType = setting["只接受邀请_type"];
    
    local task = {};
    task.name = name;
    table.insert(taskArray, task);
    return true;
  end
  
  if setting["妖怪发现_name"] == "0" then
    
    local name = "妖怪发现";
    local times = tonumber(setting["妖怪发现_times"]);
		
    local chapter = "第一章";
		if setting["妖怪发现_chapter"] == 0 then
			chapter = "第一章";
		elseif setting["妖怪发现_chapter"] == "1" then
			chapter = "第二章";
		elseif setting["妖怪发现_chapter"] == "2" then
			chapter = "第三章";
		elseif setting["妖怪发现_chapter"] == "3" then
			chapter = "第四章";		
		elseif setting["妖怪发现_chapter"] == "4" then
			chapter = "第五章";
		elseif setting["妖怪发现_chapter"] == "5" then
			chapter = "第六章";		
		elseif setting["妖怪发现_chapter"] == "6" then
			chapter = "第七章";		
		elseif setting["妖怪发现_chapter"] == "7" then
			chapter = "第八章";
		elseif setting["妖怪发现_chapter"] == "8" then
			chapter = "第九章";
		elseif setting["妖怪发现_chapter"] == "9" then
			chapter = "第十章";		
		elseif setting["妖怪发现_chapter"] == "10" then
			chapter = "第十一章";
		elseif setting["妖怪发现_chapter"] == "11" then
			chapter = "第十二章";		
		elseif setting["妖怪发现_chapter"] == "12" then
			chapter = "第十三章";		
		elseif setting["妖怪发现_chapter"] == "13" then
			chapter = "第十四章";		
		elseif setting["妖怪发现_chapter"] == "14" then
			chapter = "第十五章";
		elseif setting["妖怪发现_chapter"] == "15" then
			chapter = "第十六章";		
		elseif setting["妖怪发现_chapter"] == "16" then
			chapter = "第十七章";		
		elseif setting["妖怪发现_chapter"] == "17" then
			chapter = "第十八章";			
		end
		
		local makeTeam = false;
		if setting["妖怪发现_makeTeam"] == "0" then
			makeTeam = true;
		end
		
		local attackBoss = true;
		if setting["妖怪发现_attackBoss"] == "0" then
			attackBoss = false;
		end
		
		local fightType = "打全部";
		if setting["妖怪发现_fightType"] == "0" then
			fightType = "打全部";
		elseif setting["妖怪发现_fightType"] == "1" then
			fightType = "打经验怪";
		elseif setting["妖怪发现_fightType"] == "2" then
			fightType = "打金钱怪";
		elseif setting["妖怪发现_fightType"] == "3" then
			fightType = "打经验和金钱怪";
		end
		
    sysLog("name:"..name);
    sysLog("times:"..times);
    sysLog("chapter:"..chapter);
    sysLog("attackBoss:"..convertBooleanToString(attackBoss));
    sysLog("fightType:"..fightType);
		
		if times ~= 0 then
			local task = {};
			task.name = name;
			task.times = times;
			task.chapter = chapter;
			task.attackBoss = attackBoss;
			table.insert(taskArray, task);
		end
    
  end
  
	--判断任务是否创建成功
	if next(taskArray) then
		printTable(taskArray);
		return true;
	else
		return false;
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
  for i,v in ipairs(taskArray) do
		if v.name == task.name then
			table.remove(taskArray, i);
		end
  end
end


function startTask () 
  
  sysLog("开始执行以下任务:");
  printTable(taskArray);
  
  while next(taskArray) ~= nil do 
    
    if isFrontApp(APP_BundleId) == 0 then
      mSleep(3000);
      
    else
      
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
	
	dialogRet("已经完成所有任务。", "确定","","",5);
  
end

