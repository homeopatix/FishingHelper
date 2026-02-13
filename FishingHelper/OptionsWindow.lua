------------------------------------------------------------------------------------------
-- OptionWindow file
-- Written by Homeopatix
-- 14 avril 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- define size of the window
------------------------------------------------------------------------------------------
local windowWidth = 0;
local windowHeight = 0;

windowWidth = 400;
windowHeight = 350;
------------------------------------------------------------------------------------------
-- create the options window
------------------------------------------------------------------------------------------
function GenerateOptionsWindow()
		OptionsWindow=Turbine.UI.Lotro.GoldWindow(); 
		OptionsWindow:SetSize(windowWidth, windowHeight); 
		OptionsWindow:SetText(Strings.PluginOptionsText); 
		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(150,10); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 75, windowHeight - 17 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetText(Strings.PluginText); 
		OptionsWindow:SetZOrder(0);
		OptionsWindow:SetWantsKeyEvents(true);
		OptionsWindow:SetPosition((Turbine.UI.Display:GetWidth()-OptionsWindow:GetWidth())/2,(Turbine.UI.Display:GetHeight()-OptionsWindow:GetHeight())/2);
		OptionsWindow:SetVisible(false);
		
		--------------------------------------------------------
		-- inside the display of the window
		--------------------------------------------------------
		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(300, 40); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 150, windowHeight/2 - 110 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		OptionsWindow.Message:SetText(Strings.PluginOption1); 

		checkBoxKeep = Turbine.UI.Lotro.CheckBox();
		checkBoxKeep:SetParent( OptionsWindow );
		checkBoxKeep:SetSize(250, 40); 
		checkBoxKeep:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		checkBoxKeep:SetText(Strings.PluginOption2);
		checkBoxKeep:SetPosition(windowWidth/2 - 75, windowHeight/2 - 75);
		checkBoxKeep:SetVisible(true);
		if(settings["displayGoodLvl"]["value"] == true)then
			checkBoxKeep:SetChecked(true);
		else
			checkBoxKeep:SetChecked(false);
		end
		checkBoxKeep:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));

		--------------------------------------------------------
		-- inside the display for the bonus of the day
		--------------------------------------------------------
		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(300, 40); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 150, windowHeight/2 - 40 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		OptionsWindow.Message:SetText(Strings.PluginOption3); 

		checkBoxKeepColor = Turbine.UI.Lotro.CheckBox();
		checkBoxKeepColor:SetParent( OptionsWindow );
		checkBoxKeepColor:SetSize(250, 40); 
		checkBoxKeepColor:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		checkBoxKeepColor:SetText(Strings.PluginOption4);
		checkBoxKeepColor:SetPosition(windowWidth/2 - 75, windowHeight/2 - 15);
		checkBoxKeepColor:SetVisible(true);
		if(settings["bonusOfTheDay"]["value"] == true)then
			checkBoxKeepColor:SetChecked(true);
		else
			checkBoxKeepColor:SetChecked(false);
		end
		checkBoxKeepColor:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));
		--------------------------------------------------------
		-- inside the display for the icon of fisherman
		--------------------------------------------------------
		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(300, 40); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 150, windowHeight/2 + 30 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		OptionsWindow.Message:SetText(Strings.PluginOption5); 

		checkBoxDisplayIcon = Turbine.UI.Lotro.CheckBox();
		checkBoxDisplayIcon:SetParent( OptionsWindow );
		checkBoxDisplayIcon:SetSize(250, 40); 
		checkBoxDisplayIcon:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		checkBoxDisplayIcon:SetText(Strings.PluginOption6);
		checkBoxDisplayIcon:SetPosition(windowWidth/2 - 75, windowHeight/2 + 55);
		checkBoxDisplayIcon:SetVisible(true);
		if(settings["iconToDisplay"]["value"] == true)then
			checkBoxDisplayIcon:SetChecked(true);
		else
			checkBoxDisplayIcon:SetChecked(false);
		end
		checkBoxDisplayIcon:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));
		--------------------------------------------------------
		-- Boutton valider
		--------------------------------------------------------
		buttonValider = Turbine.UI.Lotro.GoldButton();
		buttonValider:SetParent( OptionsWindow );
		buttonValider:SetPosition(windowWidth/2 - 125,  windowHeight - 50);
		buttonValider:SetSize( 300, 20 );
		buttonValider:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		buttonValider:SetText( Strings.PluginOptionValidate );
		buttonValider:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
		buttonValider:SetVisible(true);
		buttonValider:SetMouseVisible(true);

		ValidateChangesOptions();
		ClosingTheWindowOptions();

		OptionsWindow.KeyDown=function(sender, args)
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			OptionsWindow:SetVisible(false);
			settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;
		end
	end
end
------------------------------------------------------------------------------------------
-- boutton valider
------------------------------------------------------------------------------------------
function ValidateChangesOptions()
	buttonValider.MouseClick = function(sender, args)
		if (checkBoxKeep:IsChecked()) then
			settings["displayGoodLvl"]["value"] = true;
		else
			settings["displayGoodLvl"]["value"] = false;
		end

		if (checkBoxKeepColor:IsChecked()) then
			settings["bonusOfTheDay"]["value"] = true;
		else
			settings["bonusOfTheDay"]["value"] = false;
		end

		if (checkBoxDisplayIcon:IsChecked()) then
			settings["iconToDisplay"]["value"] = true;
		else
			settings["iconToDisplay"]["value"] = false;
		end
		
		SaveSettings();

		OptionsWindow:SetVisible(false);
		settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;
		CreateMainWindow();
		settings["isWindowVisible"]["isWindowVisible"] = true;
		FishingHelper:SetVisible(true);
	end
end