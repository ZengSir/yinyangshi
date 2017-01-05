
function main ()
	require("util");
  require("globalConfig");
	require("setupUI");
end


-- lua异常捕捉
function error(msg)
  local errorMsg = "[Lua error]"..msg
  printFunction(errorMsg)    
end

--退出时隐藏HUD
function beforeUserExit()
  hideHUD(runing)
  hideHUD(troopsDonated)
end

main();
--xpcall(main, error)