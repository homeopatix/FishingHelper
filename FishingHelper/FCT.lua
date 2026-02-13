------------------------------------------------------------------------------------------
-- FCT file
-- Written by Homeopatix
-- 17 avril 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Initialize datas
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Position changed window
------------------------------------------------------------------------------------------
function PositionChangedWindow()
	------------------------------------------------------------------------------------------
	-- if the position changes, save the new window location
	------------------------------------------------------------------------------------------
	FishingHelper.PositionChanged = function( sender, args )
    	local x,y = FishingHelper:GetPosition();
    	settings["windowPosition"]["xPos"] = x;
    	settings["windowPosition"]["yPos"] = y;
	end
end
------------------------------------------------------------------------------------------
-- split strings function
------------------------------------------------------------------------------------------
function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end
------------------------------------------------------------------------------------------
-- event handling
------------------------------------------------------------------------------------------
function EscapeKeyHandler()
	FishingHelper.KeyDown=function(sender, args)
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			if(settings["escEnable"]["escEnable"] == true) then
				FishingHelper:SetVisible(false);
				settings["isWindowVisible"]["isWindowVisible"] = false;
			end
		end
	
		-- https://www.lotro.com/forums/showthread.php?493466-How-to-hide-a-window-on-F12&p=6581962#post6581962
		if ( args.Action == 268435635 ) then
			hudVisible=not hudVisible;
			if hudVisible then
				FishingHelper:SetVisible(false);
				MainMinimizedIcon:SetVisible(false);
				settings["isWindowVisible"]["isWindowVisible"] = false;
				OptionsWindow:SetVisible(false);
				settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;
			else
				FishingHelper:SetVisible(settings["isWindowVisible"]["isWindowVisible"]);
				MainMinimizedIcon:SetVisible(true);
			end
		end
	end
end
------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
function ClosingTheWindow()
	function FishingHelper:Closing(sender, args)
		settings["isWindowVisible"]["isWindowVisible"] = false;
	end
end
function ClosingTheWindowOptions()
	function OptionsWindow:Closing(sender, args)
		settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;
	end
end
function CloseFarmWindow()
    FarmWindow:SetVisible(false);
    settings["isFarmWindowVisible"]["value"] = false;
end
------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
function commandsHelp()
	notification(
		rgb["start"] .. 
		Strings.PluginHelp1 ..
		rgb["clear"] ..
		Strings.PluginHelp2 ..
		Strings.PluginHelp3 ..
		Strings.PluginHelp4 ..
		Strings.PluginHelp5 ..
		Strings.PluginHelp6 ..
		Strings.PluginHelp7 ..
		Strings.PluginHelp8 ..
		Strings.PluginHelp9 ..
		Strings.PluginHelp10 ..
		Strings.PluginHelp11 ..
		Strings.PluginHelp12
	);
end
------------------------------------------------------------------------------------------
-- display the separatoer and the title of the materials
------------------------------------------------------------------------------------------
function TitleDisplayer(windowToDisplay, posx, posy, textToDisplay, textColor, LineColor)
	windowToDisplay.Message=Turbine.UI.Label(); 
	windowToDisplay.Message:SetParent(windowToDisplay); 
	windowToDisplay.Message:SetSize(windowToDisplay:GetWidth() - 100, 30); 
	windowToDisplay.Message:SetPosition(windowToDisplay:GetWidth()/2 - (windowToDisplay:GetWidth()/2 - 50), posy - 12); 
	windowToDisplay.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	windowToDisplay.Message:SetFont(Turbine.UI.Lotro.Font.BookAntiqua22);
	windowToDisplay.Message:SetText( textToDisplay ); 
	windowToDisplay.Message:SetForeColor(textColor);

	windowToDisplay.Message=Turbine.UI.Label(); 
	windowToDisplay.Message:SetParent(windowToDisplay); 
	windowToDisplay.Message:SetSize(windowToDisplay:GetWidth() - 100, 30); 
	windowToDisplay.Message:SetPosition(windowToDisplay:GetWidth()/2 - (windowToDisplay:GetWidth()/2 - 50), posy - 5); 
	windowToDisplay.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	windowToDisplay.Message:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	windowToDisplay.Message:SetText("___________________________________________________________________________________"); 
	windowToDisplay.Message:SetForeColor(LineColor);
end
------------------------------------------------------------------------------------------
-- display the separatoer and the title of the materials
------------------------------------------------------------------------------------------
function TitleDisplayerSmall(windowToDisplay, posx, posy, textToDisplay, textColor, LineColor)
	windowToDisplay.Message=Turbine.UI.Label(); 
	windowToDisplay.Message:SetParent(windowToDisplay); 
	windowToDisplay.Message:SetSize(windowToDisplay:GetWidth() - 100, 30); 
	windowToDisplay.Message:SetPosition(windowToDisplay:GetWidth()/2 - (windowToDisplay:GetWidth()/2 - 50), posy - 12); 
	windowToDisplay.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	windowToDisplay.Message:SetFont(Turbine.UI.Lotro.Font.BookAntiqua18);
	windowToDisplay.Message:SetText( textToDisplay ); 
	windowToDisplay.Message:SetForeColor(textColor);

	windowToDisplay.Message=Turbine.UI.Label(); 
	windowToDisplay.Message:SetParent(windowToDisplay); 
	windowToDisplay.Message:SetSize(windowToDisplay:GetWidth() - 100, 30); 
	windowToDisplay.Message:SetPosition(windowToDisplay:GetWidth()/2 - (windowToDisplay:GetWidth()/2 - 50), posy - 5); 
	windowToDisplay.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	windowToDisplay.Message:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold18);
	windowToDisplay.Message:SetText("___________________________________________________________________________________"); 
	windowToDisplay.Message:SetForeColor(LineColor);
end
------------------------------------------------------------------------------------------
-- return table lenght
------------------------------------------------------------------------------------------
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function UpdateMainWindow()
	FishingHelper:SetVisible(false);
	CreateMainWindow();
	FishingHelper:SetVisible(true);
end

------------------------------------------------------------------------------------------
-- function reputations checker --
------------------------------------------------------------------------------------------
function UpdaterFromChat()
	Turbine.Chat.Received = function(sender, args)
			------------------------------------------------------------------------------------------
			-- checker to update peche points --
			------------------------------------------------------------------------------------------
			local CoinsMessage = args.Message;
			local paternPointsSdao;
			local rpPTSSdao;
			if CoinsMessage ~= nil then
				if GLocale == "en" then
					paternPointsSdao = "Your proficiency in Fishing has increased to ([%d%p]*)%.";
					rpPTSSdao = string.match( CoinsMessage, paternPointsSdao );
				elseif GLocale == "fr" then
					paternPointsSdao = "Votre comp\195\169tence en P\195\170che a augment\195\169 et est pass\195\169e \195\160 ([%d%p]*)%.";
					rpPTSSdao = string.match( CoinsMessage, paternPointsSdao );
				elseif GLocale == "de" then
					paternPointsSdao = "Euer K\195\182nnen in Bezug auf Angeln hat sich auf ([%d%p]*) verbessert.";
					rpPTSSdao = string.match( CoinsMessage, paternPointsSdao );
				end

				if(rpPTSSdao ~= nil)then
					local rpPTSSdao = string.gsub( rpPTSSdao, ",", "" );
					settings["fishingProficiency"]["value"] = rpPTSSdao;
					--------------------------------------------------------
					-- decrease the bonus of the day
					--------------------------------------------------------
					if(settings["valToday"]["value"] > 0)then
						settings["valToday"]["value"] = settings["valToday"]["value"] - 1 ;

						if(settings["valToday"]["value"] < 0)then
							settings["valToday"]["value"] = 0 ;
						end
					end

					--Turbine.Shell.WriteLine("la competence en peche a augment\195\169 et est maintenant de " .. settings["fishingProficiency"]["value"]);
					--Turbine.Shell.WriteLine("Valor of the day : " .. settings["valToday"]["value"]);
					UpdateMainWindow();
				end
			end
	end
end