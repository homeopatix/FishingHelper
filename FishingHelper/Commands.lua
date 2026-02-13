------------------------------------------------------------------------------------------
-- Command file
-- Written by Homeopatix
-- 17 avril 2021
------------------------------------------------------------------------------------------
FishingHelperCommand = Turbine.ShellCommand();
------------------------------------------------------------------------------------------
-- commands
------------------------------------------------------------------------------------------
function FishingHelperCommand:Execute( command, arguments )
-- Turn arguments to lower case characters --

	arguments = string.lower(arguments);
------------------------------------------------------------------------------------------
-- Help command--
------------------------------------------------------------------------------------------
	if ( arguments == "help" ) then
		commandsHelp();
------------------------------------------------------------------------------------------
-- show command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "show" ) then
		FishingHelper:SetVisible(true);
		settings["isWindowVisible"]["isWindowVisible"] = true;
------------------------------------------------------------------------------------------
-- hide command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "hide" ) then
		FishingHelper:SetVisible(false);
		settings["isWindowVisible"]["isWindowVisible"] = false;
------------------------------------------------------------------------------------------
-- toggle window command --
------------------------------------------------------------------------------------------
	elseif ( arguments == "toggle" ) then
		if(settings["isWindowVisible"]["isWindowVisible"] == true)then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginWindowHide);
			FishingHelper:SetVisible(false);
			settings["isWindowVisible"]["isWindowVisible"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginWindowShow);
			FishingHelper:SetVisible(true);
			settings["isWindowVisible"]["isWindowVisible"] = true;
		end
		SaveSettings();
------------------------------------------------------------------------------------------
-- options window command --
------------------------------------------------------------------------------------------
	elseif ( arguments == "options" ) then
		Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginOptionShowWindow);
		OptionsWindow:SetVisible(false);
		GenerateOptionsWindow();
		OptionsWindow:SetVisible(true);
		FishingHelper:SetVisible(false);
		settings["isWindowVisible"]["isWindowVisible"] = false;
		settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = true;
------------------------------------------------------------------------------------------
-- esc command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "esc" ) then
		if(settings["escEnable"]["escEnable"] == true) then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginEscDesable);
			settings["escEnable"]["escEnable"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginEscEnable);
			settings["escEnable"]["escEnable"] = true;
		end
------------------------------------------------------------------------------------------
-- alt command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "alt" ) then
		if(settings["altEnable"]["altEnable"] == true) then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltDesable);
			settings["altEnable"]["altEnable"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltEnable);
			settings["altEnable"]["altEnable"] = true;
		end
------------------------------------------------------------------------------------------
-- toggle command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "toggle" ) then
		if (settings["isWindowVisible"]["isWindowVisible"] == true) then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginToggleOff);
			FishingHelper:SetVisible(false);
			settings["isWindowVisible"]["isWindowVisible"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginToggleOn);
			FishingHelper:SetVisible(true);
			settings["isWindowVisible"]["isWindowVisible"] = true;
		end
------------------------------------------------------------------------------------------
-- icon command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "icon" ) then
		if (settings["isMinimizeEnabled"]["isMinimizeEnabled"] == true) then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginEscIconOff);
			MainMinimizedIcon:SetVisible(false);
			settings["isMinimizeEnabled"]["isMinimizeEnabled"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginEscIconOn);
			MainMinimizedIcon:SetVisible(true);
			settings["isMinimizeEnabled"]["isMinimizeEnabled"] = true;
		end
	end
end
------------------------------------------------------------------------------------------
-- Add command line --
------------------------------------------------------------------------------------------
Turbine.Shell.AddCommand( "WTF;FishingHelper", FishingHelperCommand );