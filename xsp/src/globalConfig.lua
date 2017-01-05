--设置常量
APP_BundleId = "com.netease.onmyoji.xin";

--全局变量，保存屏幕方向。0:"Home键在下",1:"Home键在右",2:"Home键在左"
orientation = 1;
--让用户选择home键的位置
--orientation = dialogRet("请选择您的屏幕方向：","Home键在下","Home键在右","Home键在左",0);
--mSleep(1000);
--设置屏幕方向
sysLog("orientation = "..orientation);
init(APP_BundleId, orientation);
--setUIOrientation(0);--这个设置之后，好像会导致界面的方向不对。


--获取屏幕尺寸
_width, _height = getScreenSize();

--修改屏幕的宽高尺寸
sysLog ("修改前：width, height：".._width..",".._height)

if (orientation == 0) then
  sysLog("竖屏,无需修改尺寸");
elseif orientation == 1 or orientation == 2 then
  sysLog("横屏，home在左，宽高交换");
  _width, _height = _height, _width;
end	

sysLog ("修改后：width, height：".._width..",".._height)



--提示控件
infoHUD = createHUD();
showHUD(infoHUD,"正在初始化插件···",18,"0xffff0000","0xffffffff",0,0,0,200,44);


--打开app
local isRunningFlag = appIsRunning(APP_BundleId);
if flag == 0 then
  runApp(APP_BundleId);
end

showHUD(infoHUD,"插件初始化完成···",18,"0xffff0000","0xffffffff",0,0,0,200,44);

