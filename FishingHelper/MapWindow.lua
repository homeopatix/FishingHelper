------------------------------------------------------------------------------------------
-- MapWindow file
-- Written by Homeopatix
-- 17 avril 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- create the window
------------------------------------------------------------------------------------------
function CreateMapWindow(i, valPerso, whereToDisplay)
    width = 1044;
    height = 808;

    windowWidth, windowHeight = Turbine.UI.Display:GetSize();

    MapWindow=Turbine.UI.Lotro.GoldWindow(); 
    MapWindow:SetSize(windowWidth, windowHeight); 
    MapWindow:SetPosition(windowWidth / 2 - width / 2, (windowHeight / 2 - height / 2) - 20);
    MapWindow:SetSize(width, height);
    MapWindow:SetBlendMode(Turbine.UI.BlendMode.Undefined);
    MapWindow:SetBackColor(Turbine.UI.Color(0.0, 0, 0, 0));
    MapWindow:SetText(ZonesNamesAndLevel["zones" .. i].texte .. "    lvl : " .. ZonesNamesAndLevel["zones" .. i].lvl);
    MapWindow:SetVisible(false);
    MapWindow:SetWantsKeyEvents(true);

    mapLabel = Turbine.UI.Label();
    mapLabel:SetPosition(10, 30);
    mapLabel:SetSize(1024, 768);
    mapLabel:SetBackground(ZonesNamesAndLevel["zones" .. i].mapHex);
    mapLabel:SetParent(MapWindow);
    mapLabel:SetVisible(true);

    FishingHelpererDatas=Turbine.UI.Label(); 
	FishingHelpererDatas:SetParent(MapWindow); 
	FishingHelpererDatas:SetSize(200,20); 
	FishingHelpererDatas:SetPosition(804, 780); 
    FishingHelpererDatas:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold24);
    FishingHelpererDatas:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	FishingHelpererDatas:SetText("LVL :    " .. ZonesNamesAndLevel["zones" .. i].lvl); 
	FishingHelpererDatas:SetBackColor(Turbine.UI.Color(1, .2, .5, .75));
    FishingHelpererDatas:SetForeColor(Turbine.UI.Color.Gold);
	FishingHelpererDatas:SetZOrder(12);

    --------------------- help for position
          --[[  
    local position = 10;
    for i=1, 1044 do
        MapWindowLines=Turbine.UI.Label(); 
	    MapWindowLines:SetParent(MapWindow); 
	    MapWindowLines:SetSize(2, 808); 
	    MapWindowLines:SetPosition(position*i, 30 ); 
	    MapWindowLines:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
        if(i%10 == 0)then
            MapWindowLines:SetBackColor(Turbine.UI.Color.Red);
        else
            MapWindowLines:SetBackColor(Turbine.UI.Color.Black);
        end
        MapWindowLines:SetText(position*i);
        MapWindowLines:SetZOrder(100000);
        MapWindowLines:SetOpacity(0.2);

        if(i%10 == 0)then
            MapWindowLines=Turbine.UI.Label(); 
	        MapWindowLines:SetParent(MapWindow); 
	        MapWindowLines:SetSize(30, 30); 
	        MapWindowLines:SetPosition(position*i - 15, 30); 
	        MapWindowLines:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
            MapWindowLines:SetForeColor(Turbine.UI.Color.Black);
            MapWindowLines:SetText(position*i);
            MapWindowLines:SetZOrder(1000001);
            MapWindowLines:SetBackColor(Turbine.UI.Color.White);
        end

    end

    local positiony = 10;
    for i=1, 808 do
        MapWindowLines=Turbine.UI.Label(); 
	    MapWindowLines:SetParent(MapWindow); 
	    MapWindowLines:SetSize(1000, 2); 
	    MapWindowLines:SetPosition(10, positiony*i ); 
	    MapWindowLines:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
        if(i%10 == 0)then
            MapWindowLines:SetBackColor(Turbine.UI.Color.Red);
        else
            MapWindowLines:SetBackColor(Turbine.UI.Color.Black);
        end
        MapWindowLines:SetText(position*i);
        MapWindowLines:SetZOrder(100000);
        MapWindowLines:SetOpacity(0.2);

        if(i%10 == 0)then
            MapWindowLines=Turbine.UI.Label(); 
	        MapWindowLines:SetParent(MapWindow); 
	        MapWindowLines:SetSize(30, 30); 
	        MapWindowLines:SetPosition(10, positiony*i - 15 ); 
	        MapWindowLines:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
            MapWindowLines:SetForeColor(Turbine.UI.Color.Black);
            MapWindowLines:SetText(positiony*i);
            MapWindowLines:SetZOrder(1000001);
            MapWindowLines:SetBackColor(Turbine.UI.Color.White);
        end
    end
 
]]--
-----------------------------------------
    ------------------------------------------------------------------------------------------
    -- display the icon location of the NPC  -- icon = 0x4111C449 : 0x4111F2E1 : 0x410D432A
    -- 0x411310D1 : 0x411937E9 : 
    ------------------------------------------------------------------------------------------

    FishingHelpererDatas=Turbine.UI.Label(); 
	FishingHelpererDatas:SetParent(MapWindow); 
	FishingHelpererDatas:SetSize(32,32); 
    local tmpVal = ConvertingValPerso(valPerso);
	FishingHelpererDatas:SetPosition(whereToDisplay[tmpVal], whereToDisplay[tmpVal+1]); 
    FishingHelpererDatas:SetBackground(0x4111F2E1);
	FishingHelpererDatas:SetZOrder(14);
    FishingHelpererDatas:SetBlendMode(Turbine.UI.BlendMode.Overlay);


    buttonValider = Turbine.UI.Lotro.GoldButton();
	buttonValider:SetParent( MapWindow );
	buttonValider:SetPosition(400, 776);
	buttonValider:SetSize( 300, 20 );
	buttonValider:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	buttonValider:SetText( Strings.PluginCloseButton );
	buttonValider:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	buttonValider:SetVisible(true);
	buttonValider:SetMouseVisible(true);
    buttonValider:SetZOrder(10);

    buttonValider.MouseClick = function(sender, args)
        CloseMapWindow();
    end

    MapWindow.KeyDown=function(sender, args)
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			MapWindow:SetVisible(false);
		end
	end

end
------------------------------------------------------------------------------------------
-- Convertisseur de valeur
------------------------------------------------------------------------------------------
function ConvertingValPerso(value)
    local valToReturn = 0;
    if(value == 1)then
        valToReturn = 1;
    end
    if(value == 2)then
        valToReturn = 3;
    end
    if(value == 3)then
        valToReturn = 5;
    end
    if(value == 4)then
        valToReturn = 7;
    end
    if(value == 5)then
        valToReturn = 9;
    end
    if(value == 6)then
        valToReturn = 11;
    end
    if(value == 7)then
        valToReturn = 13;
    end
    if(value == 8)then
        valToReturn = 15;
    end
    if(value == 9)then
        valToReturn = 17;
    end
    if(value == 10)then
        valToReturn = 19;
    end
    if(value == 11)then
        valToReturn = 21;
    end
    if(value == 12)then
        valToReturn = 23;
    end
    if(value == 13)then
        valToReturn = 25;
    end
    if(value == 14)then
        valToReturn = 27;
    end
    if(value == 15)then
        valToReturn = 29;
    end
    if(value == 16)then
        valToReturn = 31;
    end
    if(value == 17)then
        valToReturn = 33;
    end
    return valToReturn;
end
------------------------------------------------------------------------------------------
-- boutton valider
------------------------------------------------------------------------------------------
function CloseMapWindow()
    MapWindow:SetVisible(false);
    settings["isMapWindowVisible"]["value"] = false;
end