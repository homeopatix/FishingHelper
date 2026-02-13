------------------------------------------------------------------------------------------
-- Main file
-- Written by Homeopatix
-- 17 avril 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Import librarys --
------------------------------------------------------------------------------------------
import "Homeopatix.FishingHelper.Librarys";
------------------------------------------------------------------------------------------
-- Load the datas --
------------------------------------------------------------------------------------------
CreateLocalizationInfo();
------------------------------------------------------------------------------------------
-- create the main window
------------------------------------------------------------------------------------------
CreateMainWindow();
GenerateOptionsWindow();
------------------------------------------------------------------------------------------
-- handle minimizeIcon
------------------------------------------------------------------------------------------
if(settings["isWindowVisible"]["isWindowVisible"] == true)then
	MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, FishingHelper:SetVisible(true));
else
	MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, FishingHelper:SetVisible(false));
end

MainMinimizedIcon:SetPosition(settings["IconPosition"]["xPosIcon"], settings["IconPosition"]["yPosIcon"]);
MainMinimizedIcon:SetZOrder(0);
MainMinimizedIcon.PositionChanged = function()
	settings["IconPosition"]["xPosIcon"] = MainMinimizedIcon:GetLeft();
	settings["IconPosition"]["yPosIcon"] = MainMinimizedIcon:GetTop();
end