------------------------------------------------------------------------------------------
-- GlobalFR file
-- Written by Homeopatix
-- 17 avril 2021

------------------------------------------------------------------------------------------
function CreateLocalizationInfo()
	Strings = {};
	------------------------------------------------------------------------------------------
	-- Francais --
	------------------------------------------------------------------------------------------
	Strings.PluginName = "FishingHelper";
	Strings.PluginText = "Par Homeopatix";
	Strings.PluginEscEnable = "Touche Escape activ\195\169";
	Strings.PluginEscDesable = "Touche Escape desactiv\195\169";
	Strings.PluginAltEnable = "Touche Alt activ\195\169";
	Strings.PluginAltDesable = "Touche Alt desactiv\195\169";
	Strings.PluginToggleOn = "Basculage de la fen\195\170tre ON";
	Strings.PluginToggleOff = "Basculage de la fen\195\170tre OFF";
	Strings.PluginEscIconOn = "Affiche l'icone";
	Strings.PluginEscIconOff = "Masque l'icone";
	Strings.PluginWindowShow = "Affiche la fen\195\168tre.";
	Strings.PluginWindowHide = "Cache la fen\195\168tre.";
	Strings.PluginReleaseAlias = "/Fish toggle";
	------------------------------------------------------------------------------------------
	-- Main Window --
	------------------------------------------------------------------------------------------
	Strings.CanneApeche = "Canne \195\160 p\195\170che";
	Strings.MasterNPC = "Ma\195\174tre PNJ";
	Strings.Quests = "Qu\195\170tes de p\195\170che";
	Strings.Fishes = "Poissons";
	Strings.NormalFishes = "Poissons normaux";
	Strings.RareFishes = "Poissons rares";
	Strings.WallFishes = "Poissons de mur";
	Strings.GarbageFishes = "Ordures";
	------------------------------------------------------------------------------------------
	-- Fishing proeficiency window --
	------------------------------------------------------------------------------------------
	Strings.FishingProeficiency1 = "Comp\195\169tence de p\195\170che";
	Strings.FishingProeficiency2 = "Sauvegarder";
	Strings.FishingProeficiency3 = "Cliquez pour D\195\169finir";
	------------------------------------------------------------------------------------------
	-- help --
	------------------------------------------------------------------------------------------
	Strings.PluginHelp1 = "\n\nListe des commandes:\n";
	Strings.PluginHelp2 = "/WTF help - affiche la fen\195\168tre. d'aide\n";
	Strings.PluginHelp3 = "/WTF show - affiche la fen\195\168tre.\n";
	Strings.PluginHelp4 = "/WTF hide - cache la fen\195\168tre.\n";
	Strings.PluginHelp5 = "/WTF esc - Active ou d\195\169sactive la touche Escape.\n";
	Strings.PluginHelp6 = "/WTF alt - Active ou d\195\169sactive la touche alt pour le d\195\169placement de l'icon.\n";
	Strings.PluginHelp7 = "/WTF toggle - Basculer la fen\195\170tre.\n";
	Strings.PluginHelp8 = "/WTF options - Affiche la fen\195\170tre d'options\n";
	Strings.PluginHelp9 = "/WTF icon - Affiche ou masque l'icone.\n\n";
	Strings.PluginHelp10 = "Vous pouvez cliquer sur le nom d'une r\195\169gion pour ouvrir la carte de cette r\195\169gion\n";
	Strings.PluginHelp11 = "Le chiffre \195\160 cot\195\169 d'un poisson indique le niveau minimum \195\160 avoir en p\195\170che pour l'attraper\n";
	Strings.PluginHelp12 = "Cliquer sur le nom de la zone affiche la carte de la zone\n";
	Strings.PluginHelp13 = "Cliquer le nom du lieux affiche une carte pr\195\169cise de l'emplacement du personnage'\n";
	Strings.PluginCloseButton = "Fermer la fen\195\170tre";
	------------------------------------------------------------------------------------------
	-- options window --
	------------------------------------------------------------------------------------------
	Strings.PluginOptionsText = "FishingHelper Options";
	Strings.PluginOption1 = "Afficher le fond en vert pour les poissons d'ont vous avez le niveau de p\195\170che";
	Strings.PluginOption2 = " Afficher le fond";
	Strings.PluginOption3 = " Afficher la limite de p\195\170che du jour";
	Strings.PluginOption4 = " Afficher le limite";
	Strings.PluginOption5 = " Afficher l'icone du plugin Fisherman";
	Strings.PluginOption6 = " Afficher l'icone";
	Strings.PluginOptionValidate = "Valider les changements";
	Strings.PluginOptionShowWindow = "Affiche la fen\195\168tre d'options";
	------------------------------------------------------------------------------------------
	-- zones --
	------------------------------------------------------------------------------------------
	ZonesNamesAndLevel = {
        zones1 = {mapHex = 0x41008137, texte = "La compt\195\170", lvl = "1 - 15"},
        zones2 = {mapHex =  0x4100812c, texte = "Ered Luin", lvl = "1 - 15"},
        zones3 = {mapHex =  0x41008136, texte = "Pays du Bree", lvl = "1 - 25, 30"},
		zones16 = {mapHex = 0x412169ae, texte = "Trou\195\170e des trolls", lvl = "35 - 40"},
		zones17 = {mapHex = 0x4120c7c8, texte = "Les bois sauvages", lvl = "45 - 45"},
		zones18 = {mapHex = 0x4120c7c8, texte = "Les bois sauvages", lvl = "45 - 45"},
		zones19 = {mapHex = 0x410e3f46, texte = "Forochel", lvl = "44 - 50"},
		zones22 = {mapHex =  0x410e8708, texte = "Moria", lvl = "51 - 60"},
		zones36 = {mapHex =  0x4111961d, texte = "Pays de Dun", lvl = "65 - 75"},
		zones55 = {mapHex =  0x4112d1df, texte = "Sutcrofts", lvl = "83 - 85"},
		zones56 = {mapHex =  0x411375af, texte = "Les Landes farouches", lvl = "85"},
		zones57 = {mapHex =  0x4113C325, texte = "Rohan Ouest", lvl = "85 - 95"},
		zones59 = {mapHex =  0x4113C321, texte = "Estfolde", lvl = "88 - 90"},
		zones64 = {mapHex =  0x411538df, texte = "Ouest du Gondor", lvl = "95 - 100"},
		zones104 = {mapHex =  0x411da4a0, texte = "Le Val d'Anduin", lvl = "120"},
		-- new maps
		zones123 = {mapHex =  0x41008134, texte = "Bree", lvl = "1 - 15"},
		zones124 = {mapHex =  0x4100812D, texte = "Fondcombe", lvl = "35 - 40"},
		zones125 = {mapHex =  0x4100812B, texte = "Palais de Thorin", lvl = "1 - 15"},
		zones126 = {mapHex =  0x41132e57, texte = "Neigebronne", lvl = "75 - 85"}, --  	Snowbourn
		zones127 = {mapHex =  0x411379ff, texte = "forloi", lvl = "85"}, -- forloi -- landes farouche
		zones128 = {mapHex =  0x41116EFE, texte = "galtrev", lvl = "65 - 75"}, -- galtrev
		zones129 = {mapHex =  0x410e871b, texte = "21 \195\168me salle", lvl = "51 - 60"}, -- 21 eme salle
		zones130 = {mapHex =  0x4113C31E, texte = "Edoras", lvl = "85 - 95"}, -- Edoras
		zones131 = {mapHex =  0x41154e05, texte = "Dol Amroth", lvl = "98 - 100"} --  	Dol Amroth --haven of belfalas
		};
end