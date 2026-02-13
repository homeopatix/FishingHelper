------------------------------------------------------------------------------------------
-- librarys file
-- Written by Homeopatix
-- 17 avril 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- define librairies
------------------------------------------------------------------------------------------
import "Turbine";
import "Turbine.UI";
import "Turbine.UI.Lotro";
import "Turbine.UI.Extensions";
import "Turbine.Gameplay";
------------------------------------------------------------------------------------------
-- Import Globals --
------------------------------------------------------------------------------------------
if Turbine.Engine.GetLanguage() == Turbine.Language.German then
	import "Homeopatix.FishingHelper.GlobalsDE";
	GLocale = "de";
elseif Turbine.Engine.GetLanguage() == Turbine.Language.French then
	import "Homeopatix.FishingHelper.GlobalsFR";
	GLocale = "fr";
elseif Turbine.Engine.GetLanguage() == Turbine.Language.English then
	import "Homeopatix.FishingHelper.GlobalsEN";
	GLocale = "en";
end
------------------------------------------------------------------------------------------
-- Import Utility --
------------------------------------------------------------------------------------------
import "Homeopatix.FishingHelper.Notification";
import "Homeopatix.FishingHelper.LoadAndSave";
import "Homeopatix.FishingHelper.MinimizedIcon";
import "Homeopatix.FishingHelper.VindarPatch";
import "Homeopatix.FishingHelper.FCT";
------------------------------------------------------------------------------------------
-- Import initialization --
------------------------------------------------------------------------------------------
import "Homeopatix.FishingHelper.Init";
import "Homeopatix.FishingHelper.Activation";
import "Homeopatix.FishingHelper.PlayerStats";
------------------------------------------------------------------------------------------
-- Import Scripts --
------------------------------------------------------------------------------------------
import "Homeopatix.FishingHelper.Main";
------------------------------------------------------------------------------------------
-- Import UI elements --
------------------------------------------------------------------------------------------
import "Homeopatix.FishingHelper.UI";
import "Homeopatix.FishingHelper.OptionsWindow";
import "Homeopatix.FishingHelper.MapWindow";
if Turbine.Engine.GetLanguage() == Turbine.Language.German then
	import "Homeopatix.FishingHelper.DATA_DE";
elseif Turbine.Engine.GetLanguage() == Turbine.Language.French then
	import "Homeopatix.FishingHelper.DATA_FR";
elseif Turbine.Engine.GetLanguage() == Turbine.Language.English then
	import "Homeopatix.FishingHelper.DATA_EN";
end
import "Homeopatix.FishingHelper.FarmWindow";
import "Homeopatix.FishingHelper.UIShowLotro";
------------------------------------------------------------------------------------------
-- Import Commands --
------------------------------------------------------------------------------------------
import "Homeopatix.FishingHelper.Commands";