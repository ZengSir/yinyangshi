
--获取通关妖气发现时，纸片人的宝箱
function findReward () 

  local point = findMultiColorInRegionFuzzyExt(0xaf421d,"22|-14|0xfff4d4,-22|-13|0xfff4d4,-22|18|0xfff4d4,22|19|0xfff4d4,-7|88|0xdfd6c6",95,590,543,1646,1225);
  if #point ~= 0 then  --如果找到符合条件的点
    for var = 1,#point do
      sysLog(point[var].x..":"..point[var].y);
			tap(point[var].x, point[var].y);
			mSleep(500);
			tap(1888, 888);
    end
  end
end