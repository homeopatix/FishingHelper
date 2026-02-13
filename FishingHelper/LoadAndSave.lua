------------------------------------------------------------------------------------------
-- LoadAndSave file
-- Written by Homeopatix
-- 17 avril 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- create or load the settings
------------------------------------------------------------------------------------------
function LoadSettings()
	local _settings = PatchDataLoad(Turbine.DataScope.Character, "FishingHelper_Settings", settings);
    if (_settings ~= nil) then 
		settings = _settings; 
	end
------------------------------------------------------------------------------------------
--- adding new vars in the settings file ---
------------------------------------------------------------------------------------------
   if ( not settings.fishingProficiency or
        not settings.displayGoodLvl or
        not settings.todayDate or
        not settings.iconToDisplay) then
	    settings = {
            windowPosition = { 
                xPos = settings["windowPosition"]["xPos"], 
                yPos = settings["windowPosition"]["yPos"] 
            },
            IconPosition = { 
                xPosIcon = settings["IconPosition"]["xPosIcon"], 
                yPosIcon = settings["IconPosition"]["yPosIcon"] 
            },
            isMinimizeEnabled = { 
                isMinimizeEnabled = settings["isMinimizeEnabled"]["isMinimizeEnabled"] 
            },
            isWindowVisible = { 
                value = false 
            },
            isOptionsWindowVisible = { 
                value = false 
            },
            isMapWindowVisible = { 
                value = false 
            },
            isFarmWindowVisible = { 
                value = false 
            },
            verbose = { 
                value = false 
            },
            todayDate = { 
                value = "" 
            },
            valToday = { 
                value = 10 
            },
            iconToDisplay = { 
                value = false 
            },
            bonusOfTheDay = { 
                value = false 
            },
            escEnable = { 
                escEnable = settings["escEnable"]["escEnable"] 
            },
            displayGoodLvl = { 
                value = false 
            },
            fishingProficiency = { 
                value = 0 
            },
            altEnable = { 
                altEnable = settings["altEnable"]["altEnable"] 
            }
        };
   end
end
------------------------------------------------------------------------------------------
-- create the save settings
------------------------------------------------------------------------------------------
function SaveSettings()
	settings["windowPosition"]["xPos"] = tostring(FishingHelper:GetLeft());
    settings["windowPosition"]["yPos"] = tostring(FishingHelper:GetTop());
    settings["IconPosition"]["xPosIcon"] = tostring(MainMinimizedIcon:GetLeft());
   	settings["IconPosition"]["yPosIcon"] = tostring(MainMinimizedIcon:GetTop());
	settings["isMinimizeEnabled"]["isMinimizeEnabled"] = settings["isMinimizeEnabled"]["isMinimizeEnabled"];
	settings["isWindowVisible"]["isWindowVisible"] = settings["isWindowVisible"]["isWindowVisible"];
    settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = settings["isOptionsWindowVisible"]["isOptionsWindowVisible"];
	settings["isMapWindowVisible"]["value"] = settings["isMapWindowVisible"]["value"];
	settings["isFarmWindowVisible"]["value"] = settings["isFarmWindowVisible"]["value"];
    settings["verbose"]["value"] = settings["verbose"]["value"];
    settings["escEnable"]["escEnable"] = settings["escEnable"]["escEnable"];
    settings["altEnable"]["altEnable"] = settings["altEnable"]["altEnable"];
    settings["fishingProficiency"]["value"] = settings["fishingProficiency"]["value"];
    settings["displayGoodLvl"]["value"] = settings["displayGoodLvl"]["value"];

    settings["todayDate"]["value"] = settings["todayDate"]["value"];
    settings["valToday"]["value"] = settings["valToday"]["value"];
    settings["bonusOfTheDay"]["value"] = settings["bonusOfTheDay"]["value"];
    settings["iconToDisplay"]["value"] = settings["iconToDisplay"]["value"];

	PatchDataSave( Turbine.DataScope.Character, "FishingHelper_Settings", settings);
end