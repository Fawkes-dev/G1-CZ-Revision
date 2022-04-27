// **************************************************
//						 EXIT
// **************************************************

instance DIA_GorNaDrak_EXIT(C_INFO)
{
	npc = Tpl_1439_GorNaDrak;
	nr = 999;
	condition = DIA_GorNaDrak_EXIT_Condition;
	information = DIA_GorNaDrak_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_GorNaDrak_EXIT_Condition()
{
	return 1;
};

func void DIA_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance DIA_GorNaDrak_Greet(C_INFO)
{
	npc = Tpl_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_Greet_Condition;
	information = DIA_GorNaDrak_Greet_Info;
	important = 0;
	permanent = 0;
//	description  = "Hi! Where are you off to?";
//	description  = "Hi! Wohin soll's denn gehen?";
	description  = "Zdar! Kam odcházíš?";
};

func int DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

func void DIA_GorNaDrak_Greet_Info()
{
//	AI_Output(other,self,"DIA_GorNaDrak_Greet_15_00"); //Hi! Where are you off to?
//	AI_Output(other,self,"DIA_GorNaDrak_Greet_15_00"); //Hi! Wohin soll's denn gehen?
	AI_Output(other,self,"DIA_GorNaDrak_Greet_15_00"); //Zdar! Kam odcházíš?
//	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_01"); //We take the minecrawler secretion from our brothers in the Old Mine to Cor Kalom.
//	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_01"); //Wir bringen das Sekret der Minecrawler, das unsere Brüder in der Alten Mine gewinnen, zu Cor Kalom.
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_01"); //Neseme Cor Kalomovi výměšek z důlních červů, který naši bratři získali ve Starém dole.
//	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_02"); //We go to the Old Mine every day to collect it.
//	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_02"); //Einmal täglich gehen wir zur Alten Mine, um es abzuholen.
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_02"); //Každý den si jej chodíme vyzvednout před Starý důl.
};

// **************************************************
//					Was ist Sekret
// **************************************************

instance DIA_GorNaDrak_WasSekret(C_INFO)
{
	npc = Tpl_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_WasSekret_Condition;
	information = DIA_GorNaDrak_WasSekret_Info;
	important = 0;
	permanent = 0;
//	description  = "What kind of secretion is it?";
//	description  = "Was ist das für ein Sekret?";
	description  = "Jaký druh výměšku to je?";
};

func int DIA_GorNaDrak_WasSekret_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_GorNaDrak_Greet))
	{
		return 1;
	};

	return 0;
};

func void DIA_GorNaDrak_WasSekret_Info()
{
//	AI_Output(other,self,"DIA_GorNaDrak_WasSekret_15_00"); //What kind of secretion is it?
//	AI_Output(other,self,"DIA_GorNaDrak_WasSekret_15_00"); //Was ist das für ein Sekret?
	AI_Output(other,self,"DIA_GorNaDrak_WasSekret_15_00"); //Jaký druh výměšku to je?
//	AI_Output(self,other,"DIA_GorNaDrak_WasSekret_09_01"); //We obtain it from the mandibles of the minecrawlers. If you know how to do it, you can take them out without losing the secretion.
//	AI_Output(self,other,"DIA_GorNaDrak_WasSekret_09_01"); //Wir gewinnen es aus den Zangen der Minecrawler. Wenn man weiß wie, kann man sie herausnehmen, ohne dass das Sekret verloren geht.
	AI_Output(self,other,"DIA_GorNaDrak_WasSekret_09_01"); //Získáváme jej z čelistí důlních červů. Pokud víš jak na to, můžeš je vyjmout, aniž bys přišel o výměšek.
};

// **************************************************
//			 	LERNE: Zangen Nehmen
// **************************************************

instance DIA_GorNaDrak_TeachMandibles(C_INFO)
{
	npc = Tpl_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_TeachMandibles_Condition;
	information = DIA_GorNaDrak_TeachMandibles_Info;
	important = 0;
	permanent = 0;
//	description  = "Can you tell me how to get the secretion of a minecrawler?";
//	description  = "Kannst du mir sagen, wie ich an das Sekret eines Minecrawlers herankomme?";
	description  = "Můžeš mi říct, jak mohu získat výměšek důlních červů?";
};

func int DIA_GorNaDrak_TeachMandibles_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_GorNaDrak_WasSekret)
	&& (Knows_GetMCMandibles == FALSE)))
	{
		return 1;
	};

	return 0;
};

func void DIA_GorNaDrak_TeachMandibles_Info()
{
//	AI_Output(other,self,"DIA_GorNaDrak_TeachMandibles_15_00"); //Can you tell me how to get the secretion of a minecrawler?
//	AI_Output(other,self,"DIA_GorNaDrak_TeachMandibles_15_00"); //Kannst du mir sagen, wie ich an das Sekret eines Minecrawlers herankomme?
	AI_Output(other,self,"DIA_GorNaDrak_TeachMandibles_15_00"); //Můžeš mi říct, jak mohu získat výměšek důlních červů?
//	AI_Output(self,other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Of course. After you've killed the beast, you get hold of the mandibles and pull them straight out. This way you'll get the secretion gland without destroying it.
//	AI_Output(self,other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Klar, nachdem du das Vieh getötet hast, packst du es an den Beißzangen und reißt sie gerade heraus. Dann kommt die Sekretdrüse mit raus, ohne zu zerreißen.
	AI_Output(self,other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Jistě. Když tu bestii zabiješ, vezmeš její čelisti a jednoduše je vytáhneš. Tak získáš žlázu se sekretem bez toho, aniž by se poškodila.

//	PrintScreen("Learn: Cutting out minecrawlers' mandibles", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
//	PrintScreen("Lerne: Minecrawlerzangen rausschneiden", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	PrintScreen("Naučil ses: Vyříznutí čelistí důlních červů", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
//	B_LogEntry(GE_AnimalTrophies,"How to remove mandibles - minecrawlers");
//	B_LogEntry(GE_AnimalTrophies,"Wissen über Zangen rausschneiden - Minecrawler");
	B_LogEntry(GE_AnimalTrophies,"Jak vyříznout čelisti - důlní červi");
};

// **************************************************
//			 	Wofür ist Sekret da?
// **************************************************

instance DIA_GorNaDrak_WhatFor(C_INFO)
{
	npc = Tpl_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_WhatFor_Condition;
	information = DIA_GorNaDrak_WhatFor_Info;
	important = 0;
	permanent = 0;
//	description  = "What does Cor Kalom need the secretion for?";
//	description  = "Wofür braucht Cor Kalom das Sekret?";
	description  = "Na co potřebuje Cor Kalom ten výměšek?";
};

func int DIA_GorNaDrak_WhatFor_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_GorNaDrak_WasSekret))
	{
		return 1;
	};

	return 0;
};

func void DIA_GorNaDrak_WhatFor_Info()
{
//	AI_Output(other,self,"DIA_GorNaDrak_WhatFor_15_00"); //What does Cor Kalom need the secretion for?
//	AI_Output(other,self,"DIA_GorNaDrak_WhatFor_15_00"); //Wofür braucht Cor Kalom das Sekret?
	AI_Output(other,self,"DIA_GorNaDrak_WhatFor_15_00"); //Na co potřebuje Cor Kalom ten výměšek?
//	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_01"); //As far as I know, he makes a potion with it which increases the magic powers of a novice.
//	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_01"); //Soweit ich weiß, gewinnt er daraus ein Elixier, das die magische Kraft eines Novizen steigert.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_01"); //Co já vím, získává z něj lektvar, který umocňuje magické síly noviců.
//	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_02"); //Since we are preparing for the great invocation, he can't get enough of the stuff.
//	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_02"); //Seit wir uns auf die große Anrufung vorbereiten, kann er gar nicht genug von dem Zeug bekommen.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_02"); //Od té doby, co připravujeme velké vzývání, nemůže té látky získat dostatečné množství.
//	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_03"); //With the aid of the potion, he'll prepare the novices for the great day.
//	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_03"); //Mit Hilfe des Elixiers will er die Novizen auf den großen Tag vorbereiten.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_03"); //S pomocí toho lektvaru chce připravit novice na ten velký den.
};

// **************************************************
//			 	Kap 1 Permanent
// **************************************************

instance DIA_GorNaDrak_Permanent(C_INFO)
{
	npc = Tpl_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_Permanent_Condition;
	information = DIA_GorNaDrak_Permanent_Info;
	important = 0;
	permanent = 1;
//	description  = "Have you enough of the potion for the great invocation of the Sleeper?";
//	description  = "Habt ihr schon genug Elixier für die große Anrufung des Schläfers?";
	description  = "Máte dost lektvaru na to velké vzývání Spáče?";
};

func int DIA_GorNaDrak_Permanent_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_GorNaDrak_WhatFor)
	&& (Kapitel < 3)))
	{
		return 1;
	};

	return 0;
};

func void DIA_GorNaDrak_Permanent_Info()
{
//	AI_Output(other,self,"DIA_GorNaDrak_Permanent_15_00"); //Have you enough of the potion for the great invocation of the Sleeper?
//	AI_Output(other,self,"DIA_GorNaDrak_Permanent_15_00"); //Habt ihr schon genug Elixier für die große Anrufung des Schläfers?
	AI_Output(other,self,"DIA_GorNaDrak_Permanent_15_00"); //Máte dost lektvaru na to velké vzývání Spáče?
//	AI_Output(self,other,"DIA_GorNaDrak_Permanent_09_01"); //No - We still have to collect much more - our minecrawler hunting units are in action day and night.
//	AI_Output(self,other,"DIA_GorNaDrak_Permanent_09_01"); //Nein - Wir müssen noch 'ne Menge sammeln - in der Alten Mine sind unsere Minecrawler-Jagdtrupps Tag und Nacht im Einsatz.
	AI_Output(self,other,"DIA_GorNaDrak_Permanent_09_01"); //Ne - Musíme toho ještě mnoho nasbírat - naše lovecké skupiny loví ve Starém dole ve dne, v noci.
};
