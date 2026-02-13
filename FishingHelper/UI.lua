------------------------------------------------------------------------------------------
-- UI file
-- Written by Homeopatix
-- 17 avril 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Initialize datas
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- create the main window
------------------------------------------------------------------------------------------
function CreateMainWindow()
	local windowWidth = 300;
	local heightWind = 480;

	colorUsedFortexte = Turbine.UI.Color.White;
	colorUsedForLines1 = Turbine.UI.Color.Gold;

	FishingHelper=Turbine.UI.Lotro.GoldWindow(); 
	FishingHelper:SetSize(windowWidth, heightWind); 
	FishingHelper:SetText(Strings.PluginName); 
	FishingHelper.Message11=Turbine.UI.Label(); 
	FishingHelper.Message11:SetParent(FishingHelper); 
	FishingHelper.Message11:SetSize(150,10); 
	FishingHelper.Message11:SetPosition(FishingHelper:GetWidth()/2 - 75, FishingHelper:GetHeight() - 18); 
	FishingHelper.Message11:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelper.Message11:SetText(Strings.PluginText); 
	FishingHelper:SetZOrder(1);
	FishingHelper:SetMouseVisible(true);
	FishingHelper:SetWantsKeyEvents(true);
	FishingHelper:SetWantsUpdates(true);

	FishingHelper:SetPosition(settings["windowPosition"]["xPos"], settings["windowPosition"]["yPos"]);
	
	FishingHelpererDatas=Turbine.UI.Label(); 
	FishingHelpererDatas:SetParent(FishingHelper); 
	FishingHelpererDatas:SetSize(300,20); 
	FishingHelpererDatas:SetPosition(0, 40); 
	FishingHelpererDatas:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelpererDatas:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	FishingHelpererDatas:SetForeColor(Turbine.UI.Color.Lime);
	FishingHelpererDatas:SetText(PlayerName); 

	------------------------------------------------------------------------------------------
	-- box bleu fond
	------------------------------------------------------------------------------------------
	FishingHelpererDatas=Turbine.UI.Label(); 
	FishingHelpererDatas:SetParent(FishingHelper); 
	FishingHelpererDatas:SetSize(windowWidth - 50,36); 
	FishingHelpererDatas:SetPosition(25, 32); 
	FishingHelpererDatas:SetText(""); 
	FishingHelpererDatas:SetBackColor(Turbine.UI.Color(1, .2, .5, .75));
	FishingHelpererDatas:SetZOrder(-2);
	------------------------------------------------------------------------------------------
	-- box bleu cover black
	------------------------------------------------------------------------------------------
	FishingHelpererDatas=Turbine.UI.Label(); 
	FishingHelpererDatas:SetParent(FishingHelper); 
	FishingHelpererDatas:SetSize(windowWidth - 52,34); 
	FishingHelpererDatas:SetPosition(26, 33); 
	FishingHelpererDatas:SetText(""); 
	FishingHelpererDatas:SetBackColor(Turbine.UI.Color.Black);
	FishingHelpererDatas:SetZOrder(-1);

	FishingHelpererDatas=Turbine.UI.Label(); 
	FishingHelpererDatas:SetParent(FishingHelper); 
	FishingHelpererDatas:SetSize(280, 20); 
	FishingHelpererDatas:SetPosition(windowWidth /2 - 140, 75); 
	FishingHelpererDatas:SetText(Strings.FishingProeficiency1); 
	FishingHelpererDatas:SetForeColor(Turbine.UI.Color.Gold);
	FishingHelpererDatas:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	FishingHelpererDatas:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold18);
	FishingHelpererDatas:SetZOrder(-1);

	-- texte afficher a l'ecran au changement de level
	-- Votre comp�tence en P�che a augment� et est pass�e � 26.
	-- a tester
	UpdaterFromChat();

	local sizeOfBar = 200;
	local valSize = (settings["fishingProficiency"]["value"] * 100) / (sizeOfBar);
	valSize = valSize * 2;
	------------------------------------------------------------------------------------------
	-- box bleu fond
	------------------------------------------------------------------------------------------
	FishingHelpererDatasTexte=Turbine.UI.Label(); 
	FishingHelpererDatasTexte:SetParent(FishingHelper); 
	FishingHelpererDatasTexte:SetSize(200,20); 
	FishingHelpererDatasTexte:SetPosition(windowWidth /2 - 100, 92); 
	FishingHelpererDatasTexte:SetText(tostring(settings["fishingProficiency"]["value"])); 
	FishingHelpererDatasTexte:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelpererDatasTexte:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	FishingHelpererDatasTexte:SetForeColor(Turbine.UI.Color.Black); 
	FishingHelpererDatasTexte:SetZOrder(2);
	--------------------------------------------------------
	-- display the bonus of the day
	--------------------------------------------------------
	if(settings["bonusOfTheDay"]["value"] == true)then
		FishingHelpererDatasTexte2=Turbine.UI.Label(); 
		FishingHelpererDatasTexte2:SetParent(FishingHelper); 
		FishingHelpererDatasTexte2:SetSize(50,20); 
		FishingHelpererDatasTexte2:SetPosition(windowWidth /2 + 97, 92); 
		FishingHelpererDatasTexte2:SetText("+ " .. tostring(settings["valToday"]["value"])); 
		FishingHelpererDatasTexte2:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		FishingHelpererDatasTexte2:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
		FishingHelpererDatasTexte2:SetForeColor(Turbine.UI.Color.Yellow); 
		FishingHelpererDatasTexte2:SetZOrder(2);
	end

	FishingHelpererDatasToUpdate=Turbine.UI.Label(); 
	FishingHelpererDatasToUpdate:SetParent(FishingHelper); 
	FishingHelpererDatasToUpdate:SetSize(valSize,18); 
	FishingHelpererDatasToUpdate:SetPosition(windowWidth /2 - 100, 93); 
	FishingHelpererDatasToUpdate:SetText(""); 
	FishingHelpererDatasToUpdate:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelpererDatasToUpdate:SetBackColor(Turbine.UI.Color.Black);
	FishingHelpererDatasToUpdate:SetZOrder(-1);

	FishingHelpererDatasToUpdate=Turbine.UI.Label(); 
	FishingHelpererDatasToUpdate:SetParent(FishingHelper); 
	FishingHelpererDatasToUpdate:SetSize(valSize,18); 
	FishingHelpererDatasToUpdate:SetPosition(windowWidth /2 - 100, 92); 
	FishingHelpererDatasToUpdate:SetText(""); 
	FishingHelpererDatasToUpdate:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelpererDatasToUpdate:SetBackground(ResourcePath .. "BlueBars.tga");
	FishingHelpererDatasToUpdate:SetZOrder(1);
	--------------------------------------------------------
	-- change the color of the bars if the bonus of the day is still valide
	--------------------------------------------------------
	if(settings["bonusOfTheDay"]["value"] == true)then
		if(settings["valToday"]["value"] > 0 and settings["fishingProficiency"]["value"] < 200)then
			FishingHelpererDatasToUpdate=Turbine.UI.Label(); 
			FishingHelpererDatasToUpdate:SetParent(FishingHelper); 
			FishingHelpererDatasToUpdate:SetSize(valSize + settings["valToday"]["value"],18); 
			FishingHelpererDatasToUpdate:SetPosition(windowWidth /2 - 100, 92); 
			FishingHelpererDatasToUpdate:SetText(""); 
			FishingHelpererDatasToUpdate:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			FishingHelpererDatasToUpdate:SetBackground(ResourcePath .. "YellowBars.tga");
			FishingHelpererDatasToUpdate:SetZOrder(0);
		end
	end
	------------------------------------------------------------------------------------------
	-- box bleu cover black
	------------------------------------------------------------------------------------------
	FishingHelpererDatas=Turbine.UI.Label(); 
	FishingHelpererDatas:SetParent(FishingHelper); 
	FishingHelpererDatas:SetSize(204 , 22); 
	FishingHelpererDatas:SetPosition(windowWidth /2 - 102, 91); 
	FishingHelpererDatas:SetText(""); 
	FishingHelpererDatas:SetBackColor(Turbine.UI.Color.White);
	FishingHelpererDatas:SetZOrder(-2);

	-- show the label to update coins
	ButtonPlusCash = Turbine.UI.Extensions.SimpleWindow();
	ButtonPlusCash:SetParent( FishingHelper );
	ButtonPlusCash:SetPosition(FishingHelper:GetWidth()/2 + 70, FishingHelper:GetHeight() - 410);
	ButtonPlusCash:SetSize( 180, 30 );
	ButtonPlusCash:SetVisible(false);
	ButtonPlusCash:SetZOrder(20);
	ButtonPlusCash:SetBackground(ResourcePath .. "/Cadre_180_30.tga");

	centerLabelCash = Turbine.UI.Label();
	centerLabelCash:SetParent(ButtonPlusCash);
	centerLabelCash:SetPosition( 2, 2 );
	centerLabelCash:SetSize( 176, 26  );
	centerLabelCash:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	centerLabelCash:SetText( Strings.FishingProeficiency3 );

	centerLabelCash:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	centerLabelCash:SetZOrder(21);
	centerLabelCash:SetBackColor( Turbine.UI.Color( .9, .1, .4, .9) );

	FishingHelpererDatasTexte.MouseEnter = function()
		ButtonPlusCash:SetVisible(true);
	end

	FishingHelpererDatasTexte.MouseLeave = function()
		ButtonPlusCash:SetVisible(false);
	end

	FishingHelpererDatasTexte.MouseClick = function()
		FishingHelper:SetVisible(false);
		CreateUIShowLotro();
		UIShowLotro:SetVisible(true);
	end

	TitleDisplayer(FishingHelper, 50, 110, "", colorUsedFortexte, colorUsedForLines1);

	FishingHelpererFishingRod=Turbine.UI.Label(); 
	FishingHelpererFishingRod:SetParent(FishingHelper); 
	FishingHelpererFishingRod:SetSize(200,20); 
	FishingHelpererFishingRod:SetPosition(50, 140); 
	FishingHelpererFishingRod:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelpererFishingRod:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	FishingHelpererFishingRod:SetForeColor(Turbine.UI.Color.White);
	FishingHelpererFishingRod:SetText(Strings.CanneApeche);
	
	FishingHelpererFishingRod1=Turbine.UI.Label(); 
	FishingHelpererFishingRod1:SetParent(FishingHelper); 
	FishingHelpererFishingRod1:SetSize(200,20); 
	FishingHelpererFishingRod1:SetPosition(50, 180); 
	FishingHelpererFishingRod1:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelpererFishingRod1:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	FishingHelpererFishingRod1:SetForeColor(Turbine.UI.Color.White);
	FishingHelpererFishingRod1:SetText(Strings.MasterNPC);

	FishingHelpererFishingRod2=Turbine.UI.Label(); 
	FishingHelpererFishingRod2:SetParent(FishingHelper); 
	FishingHelpererFishingRod2:SetSize(200,20); 
	FishingHelpererFishingRod2:SetPosition(50, 220); 
	FishingHelpererFishingRod2:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelpererFishingRod2:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	FishingHelpererFishingRod2:SetForeColor(Turbine.UI.Color.White);
	FishingHelpererFishingRod2:SetText(Strings.Quests);

	TitleDisplayer(FishingHelper, 50, 260, Strings.Fishes, colorUsedFortexte, colorUsedForLines1);

	FishingHelpererFishingRod3=Turbine.UI.Label(); 
	FishingHelpererFishingRod3:SetParent(FishingHelper); 
	FishingHelpererFishingRod3:SetSize(200,20); 
	FishingHelpererFishingRod3:SetPosition(50, 300); 
	FishingHelpererFishingRod3:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelpererFishingRod3:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	FishingHelpererFishingRod3:SetForeColor(Turbine.UI.Color.White);
	FishingHelpererFishingRod3:SetText(Strings.NormalFishes);

	FishingHelpererFishingRod4=Turbine.UI.Label(); 
	FishingHelpererFishingRod4:SetParent(FishingHelper); 
	FishingHelpererFishingRod4:SetSize(200,20); 
	FishingHelpererFishingRod4:SetPosition(50, 340); 
	FishingHelpererFishingRod4:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelpererFishingRod4:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	FishingHelpererFishingRod4:SetForeColor(Turbine.UI.Color.White);
	FishingHelpererFishingRod4:SetText(Strings.RareFishes);

	FishingHelpererFishingRod5=Turbine.UI.Label(); 
	FishingHelpererFishingRod5:SetParent(FishingHelper); 
	FishingHelpererFishingRod5:SetSize(200,20); 
	FishingHelpererFishingRod5:SetPosition(50, 380); 
	FishingHelpererFishingRod5:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelpererFishingRod5:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	FishingHelpererFishingRod5:SetForeColor(Turbine.UI.Color.White);
	FishingHelpererFishingRod5:SetText(Strings.WallFishes);

	FishingHelpererFishingRod6=Turbine.UI.Label(); 
	FishingHelpererFishingRod6:SetParent(FishingHelper); 
	FishingHelpererFishingRod6:SetSize(200,20); 
	FishingHelpererFishingRod6:SetPosition(50, 420); 
	FishingHelpererFishingRod6:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	FishingHelpererFishingRod6:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	FishingHelpererFishingRod6:SetForeColor(Turbine.UI.Color.White);
	FishingHelpererFishingRod6:SetText(Strings.GarbageFishes);

	EscapeKeyHandler();
	PositionChangedWindow();
	ClosingTheWindow();

	FishingHelpererFishingRod.MouseClick = function()
		FishingHelper:SetVisible(false);
		CreateFarmWindow(1);
		settings["isFarmWindowVisible"]["value"] = true;
		FarmWindow:SetVisible(true);
		settings["isWindowVisible"]["value"] = false;
	end
	FishingHelpererFishingRod1.MouseClick = function()
		FishingHelper:SetVisible(false);
		CreateFarmWindow(0);
		settings["isFarmWindowVisible"]["value"] = true;
		FarmWindow:SetVisible(true);
		settings["isWindowVisible"]["value"] = false;
	end
	FishingHelpererFishingRod2.MouseClick = function()
		FishingHelper:SetVisible(false);
		CreateFarmWindow(2);
		settings["isFarmWindowVisible"]["value"] = true;
		FarmWindow:SetVisible(true);
		settings["isWindowVisible"]["value"] = false;
	end
	FishingHelpererFishingRod3.MouseClick = function()
		FishingHelper:SetVisible(false);
		CreateFarmWindow(3);
		settings["isFarmWindowVisible"]["value"] = true;
		FarmWindow:SetVisible(true);
		settings["isWindowVisible"]["value"] = false;
	end
	FishingHelpererFishingRod4.MouseClick = function()
		FishingHelper:SetVisible(false);
		CreateFarmWindow(4);
		settings["isFarmWindowVisible"]["value"] = true;
		FarmWindow:SetVisible(true);
		settings["isWindowVisible"]["value"] = false;
	end
	FishingHelpererFishingRod5.MouseClick = function()
		FishingHelper:SetVisible(false);
		CreateFarmWindow(5);
		settings["isFarmWindowVisible"]["value"] = true;
		FarmWindow:SetVisible(true);
		settings["isWindowVisible"]["value"] = false;
	end
	FishingHelpererFishingRod6.MouseClick = function()
		FishingHelper:SetVisible(false);
		CreateFarmWindow(6);
		settings["isFarmWindowVisible"]["value"] = true;
		FarmWindow:SetVisible(true);
		settings["isWindowVisible"]["value"] = false;
	end

	------------------------------------------------------------------------
	-- open the fisherman PluginName --
	------------------------------------------------------------------------
	if(settings["iconToDisplay"]["value"] == true)then
		local IsLoaded = false;
		local IsInstalled = false;

		local tmpPlugins=Turbine.PluginManager.GetAvailablePlugins();
		local pluginIndex;
		for pluginIndex=1,#tmpPlugins do
			if (tmpPlugins[pluginIndex].Name == "Fisherman") then
				IsInstalled = true;
				break;
			end
		end

		local tmpPlugins=Turbine.PluginManager.GetLoadedPlugins();
		local pluginIndex;
		for pluginIndex=1,#tmpPlugins do
			if (tmpPlugins[pluginIndex].Name == "Fisherman") then
				IsLoaded = true;
				break;
			end
		end

		if(IsInstalled == true and IsLoaded == true)then
			releaseWindow = Turbine.UI.Extensions.SimpleWindow();
			releaseWindow:SetSize( 40, 40 );
			releaseWindow:SetParent( FishingHelper );
			releaseWindow:SetPosition(FishingHelper:GetWidth() - 50, FishingHelper:GetHeight() - 50);
			releaseWindow:SetOpacity( 0 );
			releaseWindow:SetFadeSpeed( 0.5 );
			releaseWindow:SetVisible( true );
			releaseWindow:SetBackColor( Turbine.UI.Color( .6, .5, .7, .5) );

			centerLabelIsVisibleSearch = Turbine.UI.Label();
			centerLabelIsVisibleSearch:SetParent(FishingHelper);
			centerLabelIsVisibleSearch:SetPosition(FishingHelper:GetWidth() - 50, FishingHelper:GetHeight() - 50 );
			centerLabelIsVisibleSearch:SetSize( 32, 32  );
			centerLabelIsVisibleSearch:SetMouseVisible(false);
			centerLabelIsVisibleSearch:SetBackground(ResourcePath .. "Fisherman.tga");
			centerLabelIsVisibleSearch:SetZOrder(50);

			releaseQSBack = Turbine.UI.Control();
			releaseQSBack:SetParent( releaseWindow );
			releaseQSBack:SetZOrder(-1);
			releaseQSBack:SetSize( 40, 40 );

			releaseQS = Turbine.UI.Lotro.Quickslot();
			releaseQS:SetParent(  releaseQSBack );
			releaseQS:SetShortcut(Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, Strings.PluginReleaseAlias));
			releaseQS:SetSize( 40, 40 );
			releaseQS:SetPosition( 0, 0 );
			releaseQS:SetAllowDrop(false);
		end
	end

end
