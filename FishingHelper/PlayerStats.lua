------------------------------------------------------------------------------------------
-- PlayerStats file
-- Written by Homeopatix
-- 17 avril 2021
------------------------------------------------------------------------------------------
-- define player stats
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Define vars --
------------------------------------------------------------------------------------------
Player = Turbine.Gameplay.LocalPlayer.GetInstance();
PlayerName = Player:GetName();
PlayerAlign = Player:GetAlignment(); --1: Free People / 2: Monster Play

NbrEntries = 122;
------------------------------------------------------------------------------------------
-- load all the dats needed
------------------------------------------------------------------------------------------
LoadSettings();
--------------------------------------------------------
-- date part to handle the bonus of fishing of the day
--------------------------------------------------------
local Today = Turbine.Engine.GetDate();
local TodayDay = Today.Day;
local TodayMonth = Today.Month;
local TodayYear = Today.Year;

todayDate = tostring(TodayDay) .. "-" .. tostring(TodayMonth) .. "-" .. tostring(TodayYear);

if(settings["todayDate"]["value"] ~= todayDate)then
	if(settings["fishingProficiency"]["value"] < 190) then
		settings["valToday"]["value"] = 10;
	else
		settings["valToday"]["value"] = (200 - settings["fishingProficiency"]["value"]);
	end
	settings["todayDate"]["value"] = todayDate;
end