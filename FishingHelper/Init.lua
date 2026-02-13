------------------------------------------------------------------------------------------
-- Init file
-- Written by Homeopatix
-- 17 avril 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Plugin's name --
------------------------------------------------------------------------------------------
pluginName = "FishingHelper";
------------------------------------------------------------------------------------------
-- File names --
------------------------------------------------------------------------------------------
settingsFileName = "FishingHelper_Settings";
------------------------------------------------------------------------------------------
-- Default settings --
------------------------------------------------------------------------------------------
settings = {
    windowPosition = { 
        xPos = 500, 
        yPos = 500 
    },
    IconPosition = { 
        xPosIcon = 500, 
        yPosIcon = 500 
    },
    isMinimizeEnabled = { 
        isMinimizeEnabled = false 
    },
    isWindowVisible = { 
        value = true 
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
    escEnable = { 
        escEnable = true 
    },
    displayGoodLvl = { 
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
    fishingProficiency = { 
        value = 0 
    },
    altEnable = { 
        altEnable = true 
    }
};
------------------------------------------------------------------------------------------
-- Resources settings --
------------------------------------------------------------------------------------------
ResourcePath = "Homeopatix/FishingHelper/Resources/";

Images = {
	MinimizedIcon = ResourcePath .. "FishingHelper.tga",
};
------------------------------------------------------------------------------------------
-- RGB color codes --
------------------------------------------------------------------------------------------
rgb = {
    start = "<rgb=#DAA520>",
    gold = "<rgb=#FFD700>",
    orange = "<rgb=#EE8F12>",
    white = "<rgb=#FFFFFF>",
    green = "<rgb=#1FE126>",
    blue = "<rgb=#1FCDE1>",
    purple = "<rgb=#9B41CE>",
    yellow = "<rgb=#FFFF00>",
    grey = "<rgb=#C7C7BE>",
    red = "<rgb=#FF0000>",
    error = "<rgb=#FF0000>",
    clear = "</rgb>"
};
------------------------------------------------------------------------------------------
-- Load settings --
------------------------------------------------------------------------------------------
LoadSettings();