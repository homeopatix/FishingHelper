------------------------------------------------------------------------------------------
-- UIshowEquip file
-- Written by Homeopatix
-- 26 january 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- create the equipment window
------------------------------------------------------------------------------------------
function CreateUIShowLotro()	
	UIShowLotro=Turbine.UI.Lotro.GoldWindow(); 
	UIShowLotro:SetSize(300, 120); 
	UIShowLotro:SetText(Strings.FishingProeficiency1); 
	UIShowLotro:SetPosition((Turbine.UI.Display:GetWidth()-UIShowLotro:GetWidth())/2,(Turbine.UI.Display:GetHeight()-UIShowLotro:GetHeight())/2); 
	UIShowLotro:SetZOrder(100); 
	UIShowLotro:SetWantsKeyEvents(true); 

	UIShowLotro.Message=Turbine.UI.Label(); 
	UIShowLotro.Message:SetParent(UIShowLotro); 
	UIShowLotro.Message:SetSize(300, 20); 
	UIShowLotro.Message:SetPosition(UIShowLotro:GetWidth()/2 - 150, UIShowLotro:GetHeight()/2 - 25 ); 
	UIShowLotro.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	UIShowLotro.Message:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
	UIShowLotro.Message:SetForeColor(Turbine.UI.Color.Gold);
	UIShowLotro.Message:SetText(Strings.FishingProeficiency1); 
  
	textBoxLines = Turbine.UI.Lotro.TextBox();
	textBoxLines:SetParent( UIShowLotro );
	textBoxLines:SetSize(150, 30); 
	textBoxLines:SetText(settings["fishingProficiency"]["value"]); 
	textBoxLines:SetPosition(UIShowLotro:GetWidth()/2 - 75, UIShowLotro:GetHeight()/2 - 5);
	textBoxLines:SetVisible(true);
	textBoxLines:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	textBoxLines:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));
	textBoxLines:SetBackColor( Turbine.UI.Color( .9, .5, .7, .5));


	buttonValider = Turbine.UI.Lotro.GoldButton();
	buttonValider:SetParent( UIShowLotro );
	buttonValider:SetPosition(UIShowLotro:GetWidth()/2 - 100, UIShowLotro:GetHeight()/2 + 30);
	buttonValider:SetSize( 200, 20 );
	buttonValider:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	buttonValider:SetText( Strings.FishingProeficiency2 );
	buttonValider:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	buttonValider:SetVisible(true);
	buttonValider:SetMouseVisible(true);

	ValidateNewLotroCoins(namePlayerToshow);

	UIShowLotro.KeyDown=function(sender, args)
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			UIShowLotro:SetVisible(false);
		end
	end
end

function ValidateNewLotroCoins(namePlayerToshow)
	buttonValider.MouseClick = function(sender, args)
		settings["fishingProficiency"]["value"] = textBoxLines:GetText();
		UIShowLotro:SetVisible(false);
		CreateMainWindow();
		FishingHelper:SetVisible(true);
	end
end