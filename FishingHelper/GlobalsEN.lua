------------------------------------------------------------------------------------------
-- GlobalEN file
-- Written by Homeopatix
-- 17 avril 2021
------------------------------------------------------------------------------------------
function CreateLocalizationInfo()
	Strings = {};

	------------------------------------------------------------------------------------------
	-- English --
	------------------------------------------------------------------------------------------
	Strings.PluginName = "FishingHelper";
	Strings.PluginText = "By Homeopatix";
	Strings.PluginEscEnable = "Escape key Activated";
	Strings.PluginEscDesable = "Escape key Desactivated";
	Strings.PluginAltEnable = "Alt key Activated";
	Strings.PluginAltDesable = "Alt key Desactivated";
	Strings.PluginToggleOn = "Toggle the window ON";
	Strings.PluginToggleOff = "Toggle the window OFF";
	Strings.PluginEscIconOn = "Display the icon";
	Strings.PluginEscIconOff = "Hide the icon";
	Strings.PluginWindowShow = "Show the window.";
	Strings.PluginWindowHide = "Hide the window.";
	Strings.PluginReleaseAlias = "/Fish toggle";
	------------------------------------------------------------------------------------------
	-- Main Window --
	------------------------------------------------------------------------------------------
	Strings.CanneApeche = "Fishing Rod";
	Strings.MasterNPC = "Master NPC";
	Strings.Quests = "Fishing Quests";
	Strings.Fishes = "Fishes";
	Strings.NormalFishes = "Normal Fishes";
	Strings.RareFishes = "Rare Fishes";
	Strings.WallFishes = "Wall Fishes";
	Strings.GarbageFishes = "Garbage Fishes";
	------------------------------------------------------------------------------------------
	-- Fishing proeficiency window --
	------------------------------------------------------------------------------------------
	Strings.FishingProeficiency1 = "Fishing Proficiency";
	Strings.FishingProeficiency2 = "Save";
	Strings.FishingProeficiency3 = "Click to update";
	------------------------------------------------------------------------------------------
	-- help --
	------------------------------------------------------------------------------------------
	Strings.PluginHelp1 = "\n\nList of all commands:\n";
	Strings.PluginHelp2 = "/WTF help - Show the help window.\n";
	Strings.PluginHelp3 = "/WTF show - Show the window.\n";
	Strings.PluginHelp4 = "/WTF hide - Hide the window.\n";
	Strings.PluginHelp5 = "/WTF esc - Activate or deactivate the Escape key.\n";
	Strings.PluginHelp6 = "/WTF alt - Activate or deactivate the alt key to move the icon.\n";
	Strings.PluginHelp7 = "/WTF toggle - Toggle window.\n";
	Strings.PluginHelp8 = "/WTF options - Display the option window\n";
	Strings.PluginHelp9 = "/WTF icon - Display or hide the icon.\n\n";
	Strings.PluginHelp10 = "You can click on the name of a region to open the map of the region\n";
	Strings.PluginHelp11 = "The number next to a fish indicates the minimum level to have in fishing to catch it\n";
	Strings.PluginHelp12 = "Clicking on the zone name displays the zone map\n";
	Strings.PluginHelp13 = "Clicking on the location name displays an accurate map of the character's location\n";
	Strings.PluginCloseButton = "Close window";
	------------------------------------------------------------------------------------------
	-- options window --
	------------------------------------------------------------------------------------------
	Strings.PluginOptionsText = "FishingHelper Options";
	Strings.PluginOption1 = "Display the background in green for the fish of which you have the fishing level";
	Strings.PluginOption2 = " Display the background";
	Strings.PluginOption3 = " Show daily fishing limit";
	Strings.PluginOption4 = " Show daily limit";
	Strings.PluginOption5 = " Display the Fisherman plugin icon";
	Strings.PluginOption6 = " Show the icon";
	Strings.PluginOptionValidate = "Validate the changes";
	Strings.PluginOptionShowWindow = "Show options window";
	------------------------------------------------------------------------------------------
	-- zones --
	------------------------------------------------------------------------------------------
	ZonesNamesAndLevel = {
        zones1 = {mapHex = 0x41008137, texte = "The Shire", lvl = "1 - 15"},
        zones2 = {mapHex =  0x4100812c, texte = "Ered Luin", lvl = "1 - 15"},
        zones3 = {mapHex =  0x41008136, texte = "Bree-land", lvl = "1 - 25, 30"},
		zones16 = {mapHex = 0x412169ae, texte = "The Trollshaws", lvl = "35 - 40"},
		zones17 = {mapHex = 0x4120c7c8, texte = "WildWood", lvl = "45 - 45"},
		zones18 = {mapHex = 0x4120c7c8, texte = "WildWood", lvl = "45 - 45"},
		zones19 = {mapHex = 0x410e3f46, texte = "Forochel", lvl = "44 - 50"},
		zones22 = {mapHex =  0x410e8708, texte = "Moria", lvl = "51 - 60"},
		zones36 = {mapHex =  0x4111961d, texte = "Dunland", lvl = "65 - 75"},
		zones55 = {mapHex =  0x4112d1df, texte = "Sutcrofts", lvl = "83 - 85"},
		zones56 = {mapHex =  0x411375af, texte = "Wildermore", lvl = "85"},
		zones57 = {mapHex =  0x4113C325, texte = "West Rohan", lvl = "85 - 95"},
		zones59 = {mapHex =  0x4113C321, texte = "Eastfold", lvl = "88 - 90"},
		zones64 = {mapHex =  0x411538df, texte = "Western Gondor", lvl = "95 - 100"},
		zones104 = {mapHex =  0x411da4a0, texte = "Vales of Anduin", lvl = "120"},
		-- new maps
		zones123 = {mapHex =  0x41008134, texte = "Bree", lvl = "1 - 15"},
		zones124 = {mapHex =  0x4100812D, texte = "Rivendell", lvl = "35 - 40"},
		zones125 = {mapHex =  0x4100812B, texte = "Thorin's Hall", lvl = "1 - 15"},
		zones126 = {mapHex =  0x41132e57, texte = "Snowbourn", lvl = "75 - 85"}, --  	Snowbourn
		zones127 = {mapHex =  0x411379ff, texte = "Forlaw", lvl = "85"}, -- forloi -- landes farouche
		zones128 = {mapHex =  0x41116EFE, texte = "Galtrev", lvl = "65 - 75"}, -- galtrev
		zones129 = {mapHex =  0x410e871b, texte = "Twenty-first Hall", lvl = "51 - 60"}, -- 21 eme salle
		zones130 = {mapHex =  0x4113C31E, texte = "Edoras", lvl = "85 - 95"}, -- Edoras
		zones131 = {mapHex =  0x41154e05, texte = "Dol Amroth", lvl = "98 - 100"} --  	Dol Amroth --haven of belfalas
        };
end