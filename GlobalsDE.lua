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
	Strings.PluginToggleOn = "Fenster aktivieren";
	Strings.PluginToggleOff = "Fenster deaktivieren";
	Strings.PluginEscIconOn = "Zeige das Symbol an";
	Strings.PluginEscIconOff = "Verstecke das Symbol";
	Strings.PluginWindowShow = "Schaufenster";
	Strings.PluginWindowHide = "Verstecke das Fenster";
	Strings.PluginReleaseAlias = "/Fish toggle";
	------------------------------------------------------------------------------------------
	-- Main Window --
	------------------------------------------------------------------------------------------
	Strings.CanneApeche = "Angelrute";
	Strings.MasterNPC = "Meister-NPC";
	Strings.Quests = "Angel-Quests";
	Strings.Fishes = "Fische";
	Strings.NormalFishes = "Normale Fische";
	Strings.RareFishes = "Seltene Fische";
	Strings.WallFishes = "Wandfische";
	Strings.GarbageFishes = "M\195\188llfische";
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
	Strings.PluginHelp2 = "/WTF help - Hilfefenster anzeigen.\n";
	Strings.PluginHelp3 = "/WTF show - Fenster anzeigen.\n";
	Strings.PluginHelp4 = "/WTF hide - Fenster verbergen.\n";
	Strings.PluginHelp5 = "/WTF esc - Escape-Taste aktivieren oder deaktivieren.\n";
	Strings.PluginHelp6 = "/WTF alt - Alt-Taste aktivieren oder deaktivieren, um das Symbol zu verschieben.\n";
	Strings.PluginHelp7 = "/WTF toggle - Fenster aktivieren- und deaktivieren.\n";
	Strings.PluginHelp8 = "/WTF options - Zeigen Sie das Optionsfenster an\n";
	Strings.PluginHelp9 = "/WTF icon - Symbol ein-oder ausblenden.\n\n";
	Strings.PluginHelp10 = "Klickt auf den Namen einer Region, um die Karte der Region zu \195\182ffnen\n";
	Strings.PluginHelp11 = "Die Zahl neben einem Fisch gibt das Mindestniveau an, das beim Fischen erforderlich ist, um ihn zu fangen\n";
	Strings.PluginHelp12 = "Wenn Sie auf den Zonennamen klicken, wird die Zonenkarte angezeigt\n";
	Strings.PluginHelp13 = "Wenn Sie auf den Ortsnamen klicken, wird eine genaue Karte des Standorts des Charakters angezeigt\n";
	Strings.PluginCloseButton = "Fenster schlie\195\159en";
	------------------------------------------------------------------------------------------
	-- options window --
	------------------------------------------------------------------------------------------
	Strings.PluginOptionsText = "FishingHelper Optionen";
	Strings.PluginOption1 = "Zeigen Sie den Hintergrund in Gr\195\188n f\195\188r den Fisch an, dessen Angellevel Sie haben";
	Strings.PluginOption2 = " Hintergrund anzeigen";
	Strings.PluginOption3 = " Tagesfanglimit anzeigen";
	Strings.PluginOption4 = " Tageslimit anzeigen";
	Strings.PluginOption5 = " Zeigen Sie das Fisherman-Plugin-Symbol an";
	Strings.PluginOption6 = " Symbol anzeigen";
	Strings.PluginOptionValidate = "\195\132nderungen \195\188berpr\195\188fen";
	Strings.PluginOptionShowWindow = "Optionsfenster anzeigen";
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
		zones125 = {mapHex =  0x4100812B, texte = "Thorins halle", lvl = "1 - 15"},
		zones126 = {mapHex =  0x41132e57, texte = "Schneegrenze", lvl = "75 - 85"}, --  	Snowbourn
		zones127 = {mapHex =  0x411379ff, texte = "Forlach", lvl = "85"}, -- forloi -- landes farouche
		zones128 = {mapHex =  0x41116EFE, texte = "Galtrev", lvl = "65 - 75"}, -- galtrev
		zones129 = {mapHex =  0x410e871b, texte = "Einundzwanzigsten Halle", lvl = "51 - 60"}, -- 21 eme salle
		zones130 = {mapHex =  0x4113C31E, texte = "Edoras", lvl = "85 - 95"}, -- Edoras
		zones131 = {mapHex =  0x41154e05, texte = "Dol Amroth", lvl = "98 - 100"} --  	Dol Amroth --haven of belfalas
        };
end
