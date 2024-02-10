------------------------------------------------------------------------------------------
-- GlobalDE file
-- Written by Homeopatix
-- 17 avril 2021
-- 11 mai 2021 thanslated in german by Nadia
------------------------------------------------------------------------------------------
function CreateLocalizationInfo()
	Strings = {};
	------------------------------------------------------------------------------------------
	-- Deutsche --
	------------------------------------------------------------------------------------------
	Strings.PluginName = "FishingHelper";
	Strings.PluginText = "Von Homeopatix";
	Strings.PluginEscEnable = "Escape-Taste aktiviert";
	Strings.PluginEscDesable = "Escape-Taste deaktiviert";
	Strings.PluginAltEnable = "Alt-Taste aktiviert";
	Strings.PluginAltDesable = "Alt-Taste deaktiviert";
	Strings.PluginToggleOn = "Fenster wird angezeigt";
	Strings.PluginToggleOff = "Fenster wird ausgeblendet";
	Strings.PluginEscIconOn = "Symbol wird angezeigt";
	Strings.PluginEscIconOff = "Symbol wird ausgeblendet";
	Strings.PluginWindowShow = "Fenster wird angezeigt";
	Strings.PluginWindowHide = "Fenster wird ausgeblendet";
	Strings.PluginReleaseAlias = "/fish toggle";
	------------------------------------------------------------------------------------------
	-- Main Window --
	------------------------------------------------------------------------------------------
	Strings.CanneApeche = "Angelrute";
	Strings.MasterNPC = "Meister-NPC";
	Strings.Quests = "Angel-Aufgaben";
	Strings.Fishes = "Fische";
	Strings.NormalFishes = "Normale Fische";
	Strings.RareFishes = "Seltene Fische";
	Strings.WallFishes = "Troph\195\164en";
	Strings.GarbageFishes = "M\195\188ll";
	------------------------------------------------------------------------------------------
	-- Fishing proeficiency window --
	------------------------------------------------------------------------------------------
	Strings.FishingProeficiency1 = "Angelkenntnisse";
	Strings.FishingProeficiency2 = "Speichern";
	Strings.FishingProeficiency3 = "Zum Aktualisieren klicken";
	------------------------------------------------------------------------------------------
	-- help --
	------------------------------------------------------------------------------------------
	Strings.PluginHelp1 = "\n\nListe der Befehle:\n";
	Strings.PluginHelp2 = "/wtf help - Zeigt das Hilfefenster an.\n";
	Strings.PluginHelp3 = "/wtf show - Zeigt das Fenster an.\n";
	Strings.PluginHelp4 = "/wtf hide - Blendet das Fenster aus.\n";
	Strings.PluginHelp5 = "/wtf esc - Aktiviert/Deaktiviert die Escape-Taste, um das Fenster zu schlie\195\159en.\n";
	Strings.PluginHelp6 = "/wtf alt - Alt-Taste gedr\195\188ckt halten, um das Symbol zu verschieben.\n";
	Strings.PluginHelp7 = "/wtf toggle - Fenster anzeigen/ausblenden.\n";
	Strings.PluginHelp8 = "/wtf options - Zeigt die Optionen an.\n";
	Strings.PluginHelp9 = "/wtf icon - Symbol anzeigen/ausblenden.\n\n";
	Strings.PluginHelp10 = "Klicke auf den Namen einer Region, um die Karte der Region zu \195\182ffnen.\n\n";
	Strings.PluginHelp11 = "Die Zahl vor dem Fisch gibt das Mindestlevel an, das beim Angeln erforderlich ist, um ihn zu fangen.\n\n";
	Strings.PluginHelp12 = "Wenn du auf die Zone klickst, wird die Karte der Zone angezeigt.\n\n";
	Strings.PluginHelp13 = "Wenn du auf den Ortsnamen klickst, wird eine genauere Karte des Standortes des Charakters angezeigt.\n";
	Strings.PluginCloseButton = "Fenster schlie\195\159en";
	------------------------------------------------------------------------------------------
	-- options window --
	------------------------------------------------------------------------------------------
	Strings.PluginOptionsText = "FishingHelper Optionen";
	Strings.PluginOption1 = "Gr\195\188ne Hintergrundfarbe zeigt an, dass die Kenntnisse ausreichen, den Fisch zu fangen";
	Strings.PluginOption2 = " Hintergrund einf\195\164rben";
	Strings.PluginOption3 = " Tagesfanglimit anzeigen";
	Strings.PluginOption4 = " Tageslimit anzeigen";
	Strings.PluginOption5 = " Zeigt das Fisherman-Plugin-Symbol an";
	Strings.PluginOption6 = " Symbol anzeigen";
	Strings.PluginOptionValidate = "Speichern";
	Strings.PluginOptionShowWindow = "Optionen werden angezeigt";
	------------------------------------------------------------------------------------------
	-- zones --
	------------------------------------------------------------------------------------------
	ZonesNamesAndLevel = {
        zones1 = {mapHex = 0x41008137, texte = "Auenland", lvl = "1 - 15"},
        zones2 = {mapHex =  0x4100812c, texte = "Ered Luin", lvl = "1 - 15"},
        zones3 = {mapHex =  0x41008136, texte = "Breeland", lvl = "1 - 25, 30"},
		zones16 = {mapHex = 0x4100812e, texte = "Trollh\195\182hen", lvl = "35 - 40"},
		zones17 = {mapHex = 0x4120c7c8, texte = "Der Wildwald", lvl = "45 - 45"},
		zones18 = {mapHex = 0x4120c7c8, texte = "Der Wildwald", lvl = "45 - 45"},
		zones19 = {mapHex = 0x410e3f46, texte = "Forochel", lvl = "44 - 50"},
		zones22 = {mapHex =  0x410e8708, texte = "Moria", lvl = "51 - 60"},
		zones36 = {mapHex =  0x4111961d, texte = "Dunland", lvl = "65 - 75"},
		zones55 = {mapHex =  0x4112d1df, texte = "Suthofen", lvl = "83 - 85"},
		zones56 = {mapHex =  0x411375af, texte = "Wildermark", lvl = "85"},
		zones57 = {mapHex =  0x4113C325, texte = "West-Rohan", lvl = "85 - 95"},
		zones59 = {mapHex =  0x4113C321, texte = "Ostfold", lvl = "88 - 90"},
		zones64 = {mapHex =  0x411538df, texte = "West-Gondor", lvl = "95 - 100"},
		zones104 = {mapHex =  0x411da4a0, texte = "T\195\164ler des Anduin", lvl = "120"},
		-- new maps
		zones123 = {mapHex =  0x41008134, texte = "Bree", lvl = "1 - 15"},
		zones124 = {mapHex =  0x4100812D, texte = "Bruchtal", lvl = "35 - 40"},
		zones125 = {mapHex =  0x4100812B, texte = "Thorins Halle", lvl = "1 - 15"},
		zones126 = {mapHex =  0x41132e57, texte = "Schneegrenze", lvl = "75 - 85"}, --  	Snowbourn
		zones127 = {mapHex =  0x411379ff, texte = "Forlach", lvl = "85"}, -- forloi -- landes farouche
		zones128 = {mapHex =  0x41116EFE, texte = "Galtrev", lvl = "65 - 75"}, -- galtrev
		zones129 = {mapHex =  0x410e871b, texte = "Einundzwanzigste Halle", lvl = "51 - 60"}, -- 21 eme salle
		zones130 = {mapHex =  0x4113C31E, texte = "Edoras", lvl = "85 - 95"}, -- Edoras
		zones131 = {mapHex =  0x41154e05, texte = "Dol Amroth", lvl = "98 - 100"} --  	Dol Amroth --haven of belfalas
        };
end
