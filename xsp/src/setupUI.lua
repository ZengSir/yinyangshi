
require("taskList");

showHUD(infoHUD,"正在初始化设置页面···",18,"0xffff0000","0xffffffff",0,0,0,200,44);

while true do
  
  --根据屏幕尺寸修改启动插件的界面大小
  local content = getUIContent("ui.json");
  --sysLog("修改之前的ui.json"..content);
  
  local lua_value = bb_json.decode(content);
  lua_value.width = _width;
  lua_value.height = _height;
  
  --ui.json里面的其他数据好像无法动态修改， 应该加载的时候会自动去加载配置文件里面的内容
  local start,setting = showUI(bb_json.encode(lua_value));
  
  if start == 0 then
    --用户取消，退出脚本
    lua_exit();
  end
  
  printTable(setting);
  
  showHUD(infoHUD,"正在创建任务···",18,"0xffff0000","0xffffffff",0,0,0,200,44);
  --创建任务

  local result = createTaskListWithSetting(setting);
  
  if result then
    break;
	else
		dialogRet("创建任务失败，请指定任务。", "确定", "", "", 5);
  end
	
end

--开启任务
startTask();








