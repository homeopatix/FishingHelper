------------------------------------------------------------------------------------------
-- FarmWindow file
-- Written by Homeopatix
-- 17 avril 2021
------------------------------------------------------------------------------------------
local ButtonPlusStats = {};
local centerLabelStats = {};
------------------------------------------------------------------------------------------
-- create the window
------------------------------------------------------------------------------------------
function CreateFarmWindow(i) 

	if(i == 0)then
		windowWidth = 500;
		windowHeight = 770;
	end
	if(i == 1)then
		windowWidth = 600;
		windowHeight = 750;
	end
	if(i == 2)then
		windowWidth = 700;
		windowHeight = 750;
	end
	if(i == 3 or i == 6)then
		windowWidth = 400;
		windowHeight = 770;
	end
	if(i == 4 or i == 5)then
		windowWidth = 600;
		windowHeight = 770;
	end

   displayWidth, displayHeight = Turbine.UI.Display:GetSize();

    FarmWindow=Turbine.UI.Lotro.GoldWindow(); 
    FarmWindow:SetSize(windowWidth, windowHeight); 
    FarmWindow:SetPosition(displayWidth / 2 - windowWidth / 2, (displayHeight / 2 - windowHeight / 2) - 20);
    FarmWindow:SetSize(windowWidth, windowHeight);
    FarmWindow:SetBlendMode(Turbine.UI.BlendMode.Undefined);
    --FarmWindow:SetBackColor(Turbine.UI.Color(1, 0, 0, 0));
    --FarmWindow:SetText(ZonesNamesAndLevel["zones" .. i].texte .. "    lvl : " .. ZonesNamesAndLevel["zones" .. i].lvl);
	FarmWindow:SetText(Strings.PluginName);
    FarmWindow:SetVisible(false);
    FarmWindow:SetWantsKeyEvents(true);

    local posx = 20;
    local posy = 60;

	colorUsedFortexte = Turbine.UI.Color.White;
	colorUsedForLines1 = Turbine.UI.Color.Gold;

	if(i == 0)then
		TitleDisplayer(FarmWindow, posx - 30, posy, Strings.MasterNPC, colorUsedFortexte, colorUsedForLines1);
	end
	if(i == 1)then
		TitleDisplayer(FarmWindow, posx - 30, posy, Strings.CanneApeche, colorUsedFortexte, colorUsedForLines1);
	end
	if(i == 2)then
		TitleDisplayer(FarmWindow, posx - 30, posy, Strings.Quests, colorUsedFortexte, colorUsedForLines1);
	end
	if(i == 3)then
		TitleDisplayer(FarmWindow, posx - 30, posy, Strings.NormalFishes, colorUsedFortexte, colorUsedForLines1);
	end
	if(i == 4)then
		TitleDisplayer(FarmWindow, posx - 30, posy, Strings.RareFishes, colorUsedFortexte, colorUsedForLines1);
	end
	if(i == 5)then
		TitleDisplayer(FarmWindow, posx - 30, posy, Strings.WallFishes, colorUsedFortexte, colorUsedForLines1);
	end
	if(i == 6)then
		TitleDisplayer(FarmWindow, posx - 30, posy, Strings.GarbageFishes, colorUsedFortexte, colorUsedForLines1);
	end



	IconsDisplayer(i);


	------------------------------------------------------------------------------------------
	-- Button to close the window
	------------------------------------------------------------------------------------------
    buttonValider = Turbine.UI.Lotro.GoldButton();
	buttonValider:SetParent( FarmWindow );
	buttonValider:SetPosition(FarmWindow:GetWidth()/2 - 125, FarmWindow:GetHeight() - 35);
	buttonValider:SetSize( 300, 34 );
	buttonValider:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	buttonValider:SetText( Strings.PluginCloseButton );
	buttonValider:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	buttonValider:SetVisible(true);
	buttonValider:SetMouseVisible(true);
    buttonValider:SetZOrder(10);

    buttonValider.MouseClick = function(sender, args)
		settings["isFarmWindowVisible"]["value"] = false;
		FarmWindow:SetVisible(false);
		settings["isWindowVisible"]["value"] = false;
		CreateMainWindow();
		FishingHelper:SetVisible(true);
	end

end

function IconsDisplayer(value)
	local posy = 100;
	local FarmWindowLocation = {};
	local FarmWindowLocationExact = {};

--------------------------------------------------------------
	-- display Master NPC
--------------------------------------------------------------
	if(value == 0)then
		NbrIconsToDisplay = tablelength(DatasMasterNPC);
		for i=1, NbrIconsToDisplay do
			FarmWindow.Message11=Turbine.UI.Label(); 
			FarmWindow.Message11:SetParent(FarmWindow); 
			FarmWindow.Message11:SetSize(250,30); 
			FarmWindow.Message11:SetPosition(50, posy); 
			FarmWindow.Message11:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft); 
			FarmWindow.Message11:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
			FarmWindow.Message11:SetForeColor(Turbine.UI.Color.Gold);
			FarmWindow.Message11:SetText(DatasMasterNPC[i]);

			FarmWindowLocation[i]=Turbine.UI.Label(); 
			FarmWindowLocation[i]:SetParent(FarmWindow); 
			FarmWindowLocation[i]:SetSize(250,30); 
			FarmWindowLocation[i]:SetPosition(200, posy); 
			FarmWindowLocation[i]:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleRight); 
			FarmWindowLocation[i]:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
			FarmWindowLocation[i]:SetText(DatasMasterNPCLocation[i]);

			FarmWindowLocation[i].MouseClick = function()
				settings["isMapWindowVisible"]["value"] = true;
				CreateMapWindow(ReturnValueForMap(i), i, DatasMasterNPCCoord);
				MapWindow:SetVisible(true);
			end

			colorUsedFortexte = Turbine.UI.Color.White;
			colorUsedForLines1 = Turbine.UI.Color.Green;

			FarmWindowLocationExact[i]=Turbine.UI.Label(); 
			FarmWindowLocationExact[i]:SetParent(FarmWindow); 
			FarmWindowLocationExact[i]:SetSize(480,30); 
			FarmWindowLocationExact[i]:SetPosition(10, posy + 18); 
			FarmWindowLocationExact[i]:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindowLocationExact[i]:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold18);
			FarmWindowLocationExact[i]:SetText(DatasMasterNPCExactPosition[i]);
			FarmWindowLocationExact[i]:SetZOrder(15);

			TitleDisplayerSmall(FarmWindow, 10, posy+30, "", colorUsedFortexte, colorUsedForLines1);

			FarmWindowLocationExact[i].MouseClick = function()
				settings["isMapWindowVisible"]["value"] = true;
				CreateMapWindow(ReturnValueForMapExact(i), i, DatasMasterNPCCoordExact);
				MapWindow:SetVisible(true);
			end

			posy = posy + 50;
		end
	end
--------------------------------------------------------------
	-- display Fishing rod
--------------------------------------------------------------
	if(value == 1)then
		NbrIconsToDisplay = tablelength(DatasFishingRod);
		for i=1, NbrIconsToDisplay do
			FarmWindowIcons=Turbine.UI.Label(); 
			FarmWindowIcons:SetParent(FarmWindow); 
			FarmWindowIcons:SetSize(32,32); 
			FarmWindowIcons:SetPosition(50, posy); 
			if(i == 1)then
				FarmWindowIcons:SetBackground(ResourcePath .. "FishingRod.tga");
			else
				FarmWindowIcons:SetBackground(ResourcePath .. "FishingRod_2.tga");
			end

			tmp = {};
			tmp = Split(DatasFishingRodName[i], "+");

			FarmWindowIcons=Turbine.UI.Label(); 
			FarmWindowIcons:SetParent(FarmWindow); 
			FarmWindowIcons:SetSize(500,100); 
			FarmWindowIcons:SetPosition(85, posy - 50); 
			FarmWindowIcons:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindowIcons:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
			FarmWindowIcons:SetForeColor(Turbine.UI.Color.White);
			FarmWindowIcons:SetText(tmp[1]);

			if(tmp[2] ~= nil)then
				FarmWindowIcons=Turbine.UI.Label(); 
				FarmWindowIcons:SetParent(FarmWindow); 
				FarmWindowIcons:SetSize(500,100); 
				FarmWindowIcons:SetPosition(290, posy - 50); 
				FarmWindowIcons:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
				FarmWindowIcons:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
				FarmWindowIcons:SetForeColor(Turbine.UI.Color.Green);
				FarmWindowIcons:SetText("+ " .. tostring(tmp[2]));
			end

			FarmWindowIcons=Turbine.UI.Label(); 
			FarmWindowIcons:SetParent(FarmWindow); 
			FarmWindowIcons:SetSize(500, 300); 
			FarmWindowIcons:SetPosition(85, posy + 10); 
			FarmWindowIcons:SetTextAlignment(Turbine.UI.ContentAlignment.TopCenter); 
			FarmWindowIcons:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
			FarmWindowIcons:SetForeColor(Turbine.UI.Color.Yellow);
			FarmWindowIcons:SetText(DatasFishingRodLocation[i]);

			posy = posy + 80;
		end
	end
--------------------------------------------------------------
	-- Display Fishing quests
--------------------------------------------------------------
	if(value == 2)then
		posy = 20;

		listbox = Turbine.UI.ListBox();
		listbox:SetParent( FarmWindow );
		--listbox:SetBackColor( Turbine.UI.Color.Red );
		listbox:SetSize(680, 600);
		listbox:SetPosition(10, 80);
		listbox:IsMouseVisible(true);
		listbox:SetZOrder(10);

		colorUsedFortexte = Turbine.UI.Color.Gold;

		NbrIconsToDisplay = tablelength(DatasFishingQuests);
		for i=1, NbrIconsToDisplay do
			listItem = Turbine.UI.Control();
			listItem:SetSize( 660, 70 );
			listItem:SetMouseVisible(true);

			TitleDisplayer(listItem, 50, posy, DatasFishingQuests[i], colorUsedFortexte, Turbine.UI.Color.Green);

			local datasSplited = {};
			datasSplited = Split(DatasFishingQuestsLocation[i], ",");

			FarmWindow.Message11=Turbine.UI.Label(); 
			FarmWindow.Message11:SetParent(listItem); 
			FarmWindow.Message11:SetSize(250,30); 
			FarmWindow.Message11:SetPosition(30, posy + 20); 
			FarmWindow.Message11:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft); 
			FarmWindow.Message11:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
			FarmWindow.Message11:SetForeColor(Turbine.UI.Color.Gold);
			FarmWindow.Message11:SetText(datasSplited[1]);

			FarmWindowLocation[i]=Turbine.UI.Label(); 
			FarmWindowLocation[i]:SetParent(listItem); 
			FarmWindowLocation[i]:SetSize(170,30); 
			FarmWindowLocation[i]:SetPosition(700 - 230, posy + 20); 
			FarmWindowLocation[i]:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleRight); 
			FarmWindowLocation[i]:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
			FarmWindowLocation[i]:SetText(DatasFishingQuestsLocationMap[i]);
			FarmWindowLocation[i]:SetZOrder(16);

			FarmWindowLocation[i].MouseClick = function()
				settings["isMapWindowVisible"]["value"] = true;
				CreateMapWindow(ReturnValueForMapQuests(i), i, DatasFishingQuestsCoord);
				MapWindow:SetVisible(true);
			end

			FarmWindowLocationExact[i]=Turbine.UI.Label(); 
			FarmWindowLocationExact[i]:SetParent(listItem); 
			FarmWindowLocationExact[i]:SetSize(580,30); 
			FarmWindowLocationExact[i]:SetPosition(50, posy + 20); 
			FarmWindowLocationExact[i]:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindowLocationExact[i]:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold18);
			FarmWindowLocationExact[i]:SetText(datasSplited[2]);

			FarmWindowLocationExact[i].MouseClick = function()
				settings["isMapWindowVisible"]["value"] = true;
				CreateMapWindow(ReturnValueForMapQuestsExact(i), i, DatasFishingQuestsCoordExact);
				MapWindow:SetVisible(true);
			end

			listbox:AddItem( listItem );
		end


		vscrollListBox=Turbine.UI.Lotro.ScrollBar();
		vscrollListBox:SetParent(FarmWindow);
		vscrollListBox:SetOrientation(Turbine.UI.Orientation.Vertical);
		vscrollListBox:SetPosition(windowWidth-20, 70);
		vscrollListBox:SetSize(10, windowHeight - 100); -- set width to 12 since it's a "Lotro" style scrollbar and the height is set to match the control that we will be scrolling
		vscrollListBox:SetBackColor(Turbine.UI.Color(.1,.1,.2)); -- just to give it a little style
		vscrollListBox:SetMinimum(0);
		vscrollListBox:SetMaximum( (NbrEntries * 25) - 400); -- we will allow scrolling the height of the map-the viewport height
		vscrollListBox:SetValue(0); -- set the initial value
		------------------------------------------------------------------------------------------
		-- set the ValueChanged event handler to take an action when our value changes, in this case, change the map position relative to the viewport
		------------------------------------------------------------------------------------------
		vscrollListBox.ValueChanged=function()
			listbox:SetTop(0-vscrollListBox:GetValue());
		end

		listbox:SetVerticalScrollBar(vscrollListBox);
	end
--------------------------------------------------------------
	-- display Normal Fishies
--------------------------------------------------------------
	if(value == 3)then -- ToDo
		posy = 20;

		listbox = Turbine.UI.ListBox();
		listbox:SetParent( FarmWindow );
		--listbox:SetBackColor( Turbine.UI.Color.Red );
		listbox:SetSize(580, 600);
		listbox:SetPosition(10, 80);
		listbox:IsMouseVisible(true);
		listbox:SetZOrder(10);

		colorUsedFortexte = Turbine.UI.Color.Gold;

		NbrIconsToDisplay = tablelength(datasNormalFish);
		for i=1, NbrIconsToDisplay do
			listItem = Turbine.UI.Control();
			listItem:SetSize( 560, 60 );
			listItem:SetMouseVisible(true);

			FarmWindowFishiesBKG=Turbine.UI.Control(); 
			FarmWindowFishiesBKG:SetParent(listItem); 
			FarmWindowFishiesBKG:SetSize(32,32); 
			FarmWindowFishiesBKG:SetPosition(20, posy); 
			if(i == 5 or i == 8 or i == 13 or i == 16 or i == 17 or i == 18 or i == 20)then
				FarmWindowFishiesBKG:SetBackground(0x4101DBB0);
			else
				FarmWindowFishiesBKG:SetBackground(0x41000E44);
			end
			FarmWindowFishiesBKG:SetBlendMode(Turbine.UI.BlendMode.Overlay);

			FarmWindowFishies=Turbine.UI.Control(); 
			FarmWindowFishies:SetParent(FarmWindowFishiesBKG); 
			FarmWindowFishies:SetSize(32,32); 
			FarmWindowFishies:SetPosition(0, 0); 
			FarmWindowFishies:SetBackground(datasNormalFish[i]);
			FarmWindowFishies:SetBlendMode(Turbine.UI.BlendMode.Overlay);

			FarmWindow.Message11=Turbine.UI.Label(); 
			FarmWindow.Message11:SetParent(listItem); 
			FarmWindow.Message11:SetSize(150,40); 
			FarmWindow.Message11:SetPosition(50, posy -6); 
			FarmWindow.Message11:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindow.Message11:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
			FarmWindow.Message11:SetText(datasNormalFishNames[i]);

			FarmWindowLocation[i]=Turbine.UI.Label(); 
			FarmWindowLocation[i]:SetParent(listItem); 
			FarmWindowLocation[i]:SetSize(150,40); 
			FarmWindowLocation[i]:SetPosition(200, posy -6); 
			FarmWindowLocation[i]:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindowLocation[i]:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
			FarmWindowLocation[i]:SetText(datasNormalLocation[i]);

			listbox:AddItem( listItem );
		end

		vscrollListBox=Turbine.UI.Lotro.ScrollBar();
		vscrollListBox:SetParent(FarmWindow);
		vscrollListBox:SetOrientation(Turbine.UI.Orientation.Vertical);
		vscrollListBox:SetPosition(windowWidth-20, 70);
		vscrollListBox:SetSize(10, windowHeight - 100); -- set width to 12 since it's a "Lotro" style scrollbar and the height is set to match the control that we will be scrolling
		vscrollListBox:SetBackColor(Turbine.UI.Color(.1,.1,.2)); -- just to give it a little style
		vscrollListBox:SetMinimum(0);
		vscrollListBox:SetMaximum( (NbrEntries * 25) - 400); -- we will allow scrolling the height of the map-the viewport height
		vscrollListBox:SetValue(0); -- set the initial value
		------------------------------------------------------------------------------------------
		-- set the ValueChanged event handler to take an action when our value changes, in this case, change the map position relative to the viewport
		------------------------------------------------------------------------------------------
		vscrollListBox.ValueChanged=function()
			listbox:SetTop(0-vscrollListBox:GetValue());
		end

		listbox:SetVerticalScrollBar(vscrollListBox);

	end
--------------------------------------------------------------
	-- display Rare Fishies
--------------------------------------------------------------
	if(value == 4)then -- ToDo
		posy = 20;

		listbox = Turbine.UI.ListBox();
		listbox:SetParent( FarmWindow );
		--listbox:SetBackColor( Turbine.UI.Color.Red );
		listbox:SetSize(580, 600);
		listbox:SetPosition(10, 80);
		listbox:IsMouseVisible(true);
		listbox:SetZOrder(10);

		colorUsedForLines1 = Turbine.UI.Color.Brown;

		NbrIconsToDisplay = tablelength(datasRareFish);
		for i=1, NbrIconsToDisplay do
			listItem = Turbine.UI.Control();
			listItem:SetSize( 560, 60 );
			listItem:SetMouseVisible(true);

			if(settings["displayGoodLvl"]["value"])then
				if(tonumber(settings["fishingProficiency"]["value"]) >= tonumber(datasRareFishLVL[i]))then
					FarmWindowFishiesBKGGreen=Turbine.UI.Control(); 
					FarmWindowFishiesBKGGreen:SetParent(listItem); 
					FarmWindowFishiesBKGGreen:SetSize(518, 50); 
					FarmWindowFishiesBKGGreen:SetPosition(52, posy - 5); 
					FarmWindowFishiesBKGGreen:SetBackColor(Turbine.UI.Color.Green);
					FarmWindowFishiesBKGGreen:SetZOrder(-2);
				end
			end

			FarmWindowFishiesBKG=Turbine.UI.Control(); 
			FarmWindowFishiesBKG:SetParent(listItem); 
			FarmWindowFishiesBKG:SetSize(32,32); 
			FarmWindowFishiesBKG:SetPosition(20, posy); 
			FarmWindowFishiesBKG:SetBackground(0x41000E44);
			FarmWindowFishiesBKG:SetBlendMode(Turbine.UI.BlendMode.Overlay);

			FarmWindowFishies=Turbine.UI.Control(); 
			FarmWindowFishies:SetParent(FarmWindowFishiesBKG); 
			FarmWindowFishies:SetSize(32,32); 
			FarmWindowFishies:SetPosition(0, 0); 
			FarmWindowFishies:SetBackground(datasRareFish[i]);
			FarmWindowFishies:SetBlendMode(Turbine.UI.BlendMode.Overlay);

			FarmWindow.Message11=Turbine.UI.Label(); 
			FarmWindow.Message11:SetParent(listItem); 
			FarmWindow.Message11:SetSize(20,40); 
			FarmWindow.Message11:SetPosition(0, posy -6); 
			FarmWindow.Message11:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindow.Message11:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
			FarmWindow.Message11:SetForeColor(Turbine.UI.Color.Gold);
			FarmWindow.Message11:SetText(datasRareFishLVL[i]);

			FarmWindow.Message11=Turbine.UI.Label(); 
			FarmWindow.Message11:SetParent(listItem); 
			FarmWindow.Message11:SetSize(150,40); 
			FarmWindow.Message11:SetPosition(50, posy -6); 
			FarmWindow.Message11:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindow.Message11:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
			FarmWindow.Message11:SetText(datasRareFishNames[i]);

			FarmWindowLocation[i]=Turbine.UI.Label(); 
			FarmWindowLocation[i]:SetParent(listItem); 
			FarmWindowLocation[i]:SetSize(325,40); 
			FarmWindowLocation[i]:SetPosition(225, posy -6); 
			FarmWindowLocation[i]:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindowLocation[i]:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
			FarmWindowLocation[i]:SetText(datasRareLocation[i]);

			TitleDisplayer(listItem, 50, posy + 26, "", colorUsedFortexte, colorUsedForLines1);

			listbox:AddItem( listItem );
		end

		vscrollListBox=Turbine.UI.Lotro.ScrollBar();
		vscrollListBox:SetParent(FarmWindow);
		vscrollListBox:SetOrientation(Turbine.UI.Orientation.Vertical);
		vscrollListBox:SetPosition(windowWidth-20, 70);
		vscrollListBox:SetSize(10, windowHeight - 100); -- set width to 12 since it's a "Lotro" style scrollbar and the height is set to match the control that we will be scrolling
		vscrollListBox:SetBackColor(Turbine.UI.Color(.1,.1,.2)); -- just to give it a little style
		vscrollListBox:SetMinimum(0);
		vscrollListBox:SetMaximum( (NbrEntries * 25) - 400); -- we will allow scrolling the height of the map-the viewport height
		vscrollListBox:SetValue(0); -- set the initial value
		------------------------------------------------------------------------------------------
		-- set the ValueChanged event handler to take an action when our value changes, in this case, change the map position relative to the viewport
		------------------------------------------------------------------------------------------
		vscrollListBox.ValueChanged=function()
			listbox:SetTop(0-vscrollListBox:GetValue());
		end

		listbox:SetVerticalScrollBar(vscrollListBox);

	end
--------------------------------------------------------------
	-- display Wall Fishies
--------------------------------------------------------------
	if(value == 5)then -- ToDo
		posy = 20;

		listbox = Turbine.UI.ListBox();
		listbox:SetParent( FarmWindow );
		--listbox:SetBackColor( Turbine.UI.Color.Red );
		listbox:SetSize(580, 600);
		listbox:SetPosition(10, 80);
		listbox:IsMouseVisible(true);
		listbox:SetZOrder(10);

		colorUsedForLines1 = Turbine.UI.Color.Brown;

		NbrIconsToDisplay = tablelength(datasMountableWallFish);
		for i=1, NbrIconsToDisplay do
			listItem = Turbine.UI.Control();
			if(i == 9)then
				listItem:SetSize( 560, 60 );
			else
				listItem:SetSize( 560, 60 );
			end
			listItem:SetMouseVisible(true);

			if(settings["displayGoodLvl"]["value"])then
				if(tonumber(settings["fishingProficiency"]["value"]) >= tonumber(datasMountableWallFishLVL[i]))then
					FarmWindowFishiesBKGGreen=Turbine.UI.Control(); 
					FarmWindowFishiesBKGGreen:SetParent(listItem); 
					FarmWindowFishiesBKGGreen:SetSize(518, 50); 
					FarmWindowFishiesBKGGreen:SetPosition(52, posy - 5); 
					FarmWindowFishiesBKGGreen:SetBackColor(Turbine.UI.Color.Green);
					FarmWindowFishiesBKGGreen:SetZOrder(-2);
				end
			end

			FarmWindowFishiesBKG=Turbine.UI.Control(); 
			FarmWindowFishiesBKG:SetParent(listItem); 
			FarmWindowFishiesBKG:SetSize(32,32); 
			FarmWindowFishiesBKG:SetPosition(20, posy); 
			FarmWindowFishiesBKG:SetBackground(0x410D461E);
			FarmWindowFishiesBKG:SetBlendMode(Turbine.UI.BlendMode.Overlay);

			FarmWindowFishies=Turbine.UI.Control(); 
			FarmWindowFishies:SetParent(FarmWindowFishiesBKG); 
			FarmWindowFishies:SetSize(32,32); 
			FarmWindowFishies:SetPosition(0, 0); 
			FarmWindowFishies:SetBackground(datasMountableWallFish[i]);
			FarmWindowFishies:SetBlendMode(Turbine.UI.BlendMode.Overlay);

			FarmWindow.Message11=Turbine.UI.Label(); 
			FarmWindow.Message11:SetParent(listItem); 
			FarmWindow.Message11:SetSize(20,40); 
			FarmWindow.Message11:SetPosition(0, posy - 6); 
			FarmWindow.Message11:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindow.Message11:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
			FarmWindow.Message11:SetForeColor(Turbine.UI.Color.Gold);
			FarmWindow.Message11:SetText(datasMountableWallFishLVL[i]);

			FarmWindow.Message11=Turbine.UI.Label(); 
			FarmWindow.Message11:SetParent(listItem); 
			FarmWindow.Message11:SetSize(150,40); 
			FarmWindow.Message11:SetPosition(50, posy - 6);
			FarmWindow.Message11:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindow.Message11:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
			FarmWindow.Message11:SetText(datasMountableWallFishNames[i]);

			FarmWindowLocation[i]=Turbine.UI.Label(); 
			FarmWindowLocation[i]:SetParent(listItem); 
			if(i == 9)then
				FarmWindowLocation[i]:SetSize(325,100);
				FarmWindowLocation[i]:SetPosition(225, posy - 40);
			else
				FarmWindowLocation[i]:SetSize(325,40);
				FarmWindowLocation[i]:SetPosition(225, posy - 6);
			end
			
			FarmWindowLocation[i]:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindowLocation[i]:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
			FarmWindowLocation[i]:SetText(datasMountableWallFishLocation[i]);

			TitleDisplayer(listItem, 50, posy + 26, "", colorUsedFortexte, colorUsedForLines1);

			listbox:AddItem( listItem );
		end

		vscrollListBox=Turbine.UI.Lotro.ScrollBar();
		vscrollListBox:SetParent(FarmWindow);
		vscrollListBox:SetOrientation(Turbine.UI.Orientation.Vertical);
		vscrollListBox:SetPosition(windowWidth-20, 70);
		vscrollListBox:SetSize(10, windowHeight - 100); -- set width to 12 since it's a "Lotro" style scrollbar and the height is set to match the control that we will be scrolling
		vscrollListBox:SetBackColor(Turbine.UI.Color(.1,.1,.2)); -- just to give it a little style
		vscrollListBox:SetMinimum(0);
		vscrollListBox:SetMaximum( (NbrEntries * 25) - 400); -- we will allow scrolling the height of the map-the viewport height
		vscrollListBox:SetValue(0); -- set the initial value
		------------------------------------------------------------------------------------------
		-- set the ValueChanged event handler to take an action when our value changes, in this case, change the map position relative to the viewport
		------------------------------------------------------------------------------------------
		vscrollListBox.ValueChanged=function()
			listbox:SetTop(0-vscrollListBox:GetValue());
		end

		listbox:SetVerticalScrollBar(vscrollListBox);

	end
--------------------------------------------------------------
	-- display Garbage Fishies
--------------------------------------------------------------
	if(value == 6)then -- ToDo
		posy = 20;

		listbox = Turbine.UI.ListBox();
		listbox:SetParent( FarmWindow );
		--listbox:SetBackColor( Turbine.UI.Color.Red );
		listbox:SetSize(580, 600);
		listbox:SetPosition(10, 80);
		listbox:IsMouseVisible(true);
		listbox:SetZOrder(10);

		colorUsedFortexte = Turbine.UI.Color.Gold;

		NbrIconsToDisplay = tablelength(datasGarbageFish);
		for i=1, NbrIconsToDisplay do
			listItem = Turbine.UI.Control();
			listItem:SetSize( 560, 60 );
			listItem:SetMouseVisible(true);

			FarmWindowFishiesBKG=Turbine.UI.Control(); 
			FarmWindowFishiesBKG:SetParent(listItem); 
			FarmWindowFishiesBKG:SetSize(32,32); 
			FarmWindowFishiesBKG:SetPosition(20, posy); 
			FarmWindowFishiesBKG:SetBackground(0x41000E44);
			FarmWindowFishiesBKG:SetBlendMode(Turbine.UI.BlendMode.Overlay);

			FarmWindowFishies=Turbine.UI.Control(); 
			FarmWindowFishies:SetParent(FarmWindowFishiesBKG); 
			FarmWindowFishies:SetSize(32,32); 
			FarmWindowFishies:SetPosition(0, 0); 
			FarmWindowFishies:SetBackground(datasGarbageFish[i]);
			FarmWindowFishies:SetBlendMode(Turbine.UI.BlendMode.Overlay);

			FarmWindow.Message11=Turbine.UI.Label(); 
			FarmWindow.Message11:SetParent(listItem); 
			FarmWindow.Message11:SetSize(150,40); 
			FarmWindow.Message11:SetPosition(50, posy -6); 
			FarmWindow.Message11:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindow.Message11:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
			FarmWindow.Message11:SetText(datasGarbageFishNames[i]);

			FarmWindowLocation[i]=Turbine.UI.Label(); 
			FarmWindowLocation[i]:SetParent(listItem); 
			FarmWindowLocation[i]:SetSize(150,40); 
			FarmWindowLocation[i]:SetPosition(200, posy -6); 
			FarmWindowLocation[i]:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FarmWindowLocation[i]:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
			FarmWindowLocation[i]:SetText(datasGarbageFishLocation[i]);

			listbox:AddItem( listItem );
		end

		vscrollListBox=Turbine.UI.Lotro.ScrollBar();
		vscrollListBox:SetParent(FarmWindow);
		vscrollListBox:SetOrientation(Turbine.UI.Orientation.Vertical);
		vscrollListBox:SetPosition(windowWidth-20, 70);
		vscrollListBox:SetSize(10, windowHeight - 100); -- set width to 12 since it's a "Lotro" style scrollbar and the height is set to match the control that we will be scrolling
		vscrollListBox:SetBackColor(Turbine.UI.Color(.1,.1,.2)); -- just to give it a little style
		vscrollListBox:SetMinimum(0);
		vscrollListBox:SetMaximum( (NbrEntries * 25) - 400); -- we will allow scrolling the height of the map-the viewport height
		vscrollListBox:SetValue(0); -- set the initial value
		------------------------------------------------------------------------------------------
		-- set the ValueChanged event handler to take an action when our value changes, in this case, change the map position relative to the viewport
		------------------------------------------------------------------------------------------
		vscrollListBox.ValueChanged=function()
			listbox:SetTop(0-vscrollListBox:GetValue());
		end

		listbox:SetVerticalScrollBar(vscrollListBox);

	end
--------------------------------------------------------------

	FarmWindow.KeyDown=function(sender, args)
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			if(settings["escEnable"]["escEnable"] == true) then
				FarmWindow:SetVisible(false);
				settings["isFarmWindowVisible"]["isFarmWindowVisible"] = false;
			end
		end
	
		-- https://www.lotro.com/forums/showthread.php?493466-How-to-hide-a-window-on-F12&p=6581962#post6581962
		if ( args.Action == 268435635 ) then
			hudVisible=not hudVisible;
			if hudVisible then
				FarmWindow:SetVisible(false);
				MainMinimizedIcon:SetVisible(false);
			else
				FarmWindow:SetVisible(settings["isFarmWindowVisible"]["isFarmWindowVisible"]);
				MainMinimizedIcon:SetVisible(true);
			end
		end
	end
end

function ReturnValueForMapExact(i)
	local val = 0;
	if(i == 1)then
		val = 123;
	end
	if(i == 2)then
		val = 125;
	end
	if(i == 3 or i == 4)then
		val = 1;
	end
	if(i == 5)then
		val = 124;
	end
	if(i == 6)then
		val = 129;
	end
	if(i == 7)then
		val = 128;
	end
	if(i == 8)then
		val = 126;
	end
	if(i == 9)then
		val = 127;
	end
	if(i == 10 )then
		val = 59;
	end
	if(i == 11)then
		val = 130;
	end
	if(i == 12)then
		val = 131;
	end
	return val;
end
function ReturnValueForMap(i)
	local val = 0;
	if(i == 1)then
		val = 3;
	end
	if(i == 2)then
		val = 2;
	end
	if(i == 3 or i == 4)then
		val = 1;
	end
	if(i == 5)then
		val = 16;
	end
	if(i == 6)then
		val = 22;
	end
	if(i == 7)then
		val = 36;
	end
	if(i == 8)then
		val = 55;
	end
	if(i == 9)then
		val = 56;
	end
	if(i == 10 )then
		val = 59;
	end
	if(i == 11)then
		val = 57;
	end
	if(i == 12)then
		val = 64;
	end
	return val;
end
function ReturnValueForMapQuests(i)
	local val = 0;
	if(i == 1)then
		val = 1;
	end
	if(i == 2)then
		val = 3;
	end
	if(i == 3)then
		val = 2;
	end
	if(i == 4)then
		val = 16;
	end
	if(i == 5)then
		val = 17;
	end
	if(i == 6)then
		val = 18;
	end
	if(i == 7)then
		val = 19;
	end
	if(i == 8)then
		val = 36;
	end
	if(i == 9 or i == 10 or i == 11 or i == 12)then 
		val = 55;
	end
	if(i == 13 or i == 14)then
		val = 57;
	end
	if(i == 15)then
		val = 64;
	end
	if(i == 16 or i == 17)then
		val = 104;
	end
	return val;
end
function ReturnValueForMapQuestsExact(i)
	local val = 0;
	if(i == 1)then
		val = 1;
	end
	if(i == 2)then
		val = 123;
	end
	if(i == 3)then
		val = 125;
	end
	if(i == 4)then
		val = 124;
	end
	if(i == 5)then
		val = 17;
	end
	if(i == 6)then
		val = 18;
	end
	if(i == 7)then
		val = 19;
	end
	if(i == 8)then
		val = 128;
	end
	if(i == 9 or i == 10 or i == 11 or i == 12)then 
		val = 126;
	end
	if(i == 13 or i == 14)then
		val = 130;
	end
	if(i == 15)then
		val = 131;
	end
	if(i == 16 or i == 17)then
		val = 104;
	end
	return val;
end
