// ****************************************
// 					Exit
// ****************************************

instance DIA_Aidan_Exit(C_INFO)
{
	npc = ORG_859_Aidan;
	nr = 999;
	condition = DIA_Aidan_Exit_Condition;
	information = DIA_Aidan_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Aidan_Exit_Condition()
{
	return 1;
};

func void DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_Aidan_Hello(C_INFO)
{
	npc = Org_859_Aidan;
	nr = 1;
	condition = DIA_Aidan_Hello_Condition;
	information = DIA_Aidan_Hello_Info;
	permanent = 0;
//	description = "What do you do here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};

func int DIA_Aidan_Hello_Condition()
{
	return 1;
};

func void DIA_Aidan_Hello_Info()
{
//	AI_Output(other,self,"DIA_Aidan_Hello_15_00"); //What are you doing here?
//	AI_Output(other,self,"DIA_Aidan_Hello_15_00"); //Was machst du hier?
	AI_Output(other,self,"DIA_Aidan_Hello_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_Aidan_Hello_13_01"); //I'm a hunter. I make a living out of selling skins and teeth.
//	AI_Output(self,other,"DIA_Aidan_Hello_13_01"); //Ich bin Jäger. Ich lebe vom Verkauf von Fellen und Zähnen.
	AI_Output(self,other,"DIA_Aidan_Hello_13_01"); //Jsem lovec. Žiju z prodeje kůží a zubů.
//	AI_Output(other,self,"DIA_Aidan_Hello_15_02"); //Does it pay?
//	AI_Output(other,self,"DIA_Aidan_Hello_15_02"); //Bringt das viel ein?
	AI_Output(other,self,"DIA_Aidan_Hello_15_02"); //Platí se za to?
//	AI_Output(self,other,"DIA_Aidan_Hello_13_03"); //If you know how to cut up the beasts the right way, yeah.
//	AI_Output(self,other,"DIA_Aidan_Hello_13_03"); //Wenn man weiß, wie man die Viecher richtig ausschlachtet, schon.
	AI_Output(self,other,"DIA_Aidan_Hello_13_03"); //Když víš, jak správně ty bestie rozřezat, tak jo.

	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
//	B_LogEntry(GE_TeacherOW,"Aidan, a hunter living on the way between the Old and the New Camp, can teach me how to gut animals.");
//	B_LogEntry(GE_TeacherOW,"Aidan, ein Jäger der auf dem Weg zwischen Altem und Neuen Lager lebt, kann mir beibringen, wie man Tiere richtig ausschlachtet.");
	B_LogEntry(GE_TeacherOW,"Adan, lovec žijící na cestě mezi Starým a Novým táborem, mě může naučit kuchat zvěř.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance Org_859_Aidan_Creatures(C_INFO)
{
	npc = Org_859_Aidan;
	nr = 1;
	condition = Org_859_Aidan_Creatures_Condition;
	information = Org_859_Aidan_Creatures_Info;
	permanent = 1;
//	description = "I want to learn how to cut up animals.";
//	description = "Ich will lernen, Tiere auszuschlachten.";
	description = "Chci se naučit rozřezávat zvěř.";
};

func int Org_859_Aidan_Creatures_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Aidan_Hello))
	&& ((Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE))
	{
		return 1;
	};
};

func void Org_859_Aidan_Creatures_Info()
{
//	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00"); //I want to learn how to cut up animals.
//	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00"); //Ich will lernen, Tiere auszuschlachten.
	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00"); //Chci se naučit rozřezávat zvěř.

	if ((Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE))
	{
//		AI_Output(self,other,"Org_859_Aidan_Creatures_13_01"); //What do you wanna know?
//		AI_Output(self,other,"Org_859_Aidan_Creatures_13_01"); //Was willst du wissen?
		AI_Output(self,other,"Org_859_Aidan_Creatures_13_01"); //Co bys chtěl vědět?

		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice(Org_859_Aidan_Creatures, DIALOG_BACK ,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
//			Info_AddChoice(Org_859_Aidan_Creatures,"Remove teeth (Cost: 1 skill point, 50 ore)",Org_859_Aidan_Creatures_Zahn);
//			Info_AddChoice(Org_859_Aidan_Creatures,"Zähne entfernen (Kosten: 1 LP, 50 Erz)",Org_859_Aidan_Creatures_Zahn);
			Info_AddChoice(Org_859_Aidan_Creatures,"Vyjmout zuby (cena: 1 dovednostní bod, 50 nugetů)",Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
//			Info_AddChoice(Org_859_Aidan_Creatures,"Remove fur (Cost: 1 skill point, 100 ore)",Org_859_Aidan_Creatures_Fell);
//			Info_AddChoice(Org_859_Aidan_Creatures,"Fell abziehen (Kosten: 1 LP, 100 Erz)",Org_859_Aidan_Creatures_Fell);
			Info_AddChoice(Org_859_Aidan_Creatures,"Stáhnout kožešinu (cena:1 dovednostní bod, 100 nugetů)",Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
//			Info_AddChoice(Org_859_Aidan_Creatures,"Remove claws (Cost: 1 skill point, 50 ore)",Org_859_Aidan_Creatures_Kralle);
//			Info_AddChoice(Org_859_Aidan_Creatures,"Krallen abzuziehen (Kosten: 1 LP, 50 Erz)",Org_859_Aidan_Creatures_Kralle);
			Info_AddChoice(Org_859_Aidan_Creatures,"Vyjmout drápy (cena: 1 dovednostní bod, 50 nugetů)",Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
//			Info_AddChoice(Org_859_Aidan_Creatures,"Skin reptiles (Cost: 1 skill point, 100 ore)",Org_859_Aidan_Creatures_Haut);
//			Info_AddChoice(Org_859_Aidan_Creatures,"Häuten von Reptilien (Kosten: 1 LP, 100 Erz)",Org_859_Aidan_Creatures_Haut);
			Info_AddChoice(Org_859_Aidan_Creatures,"Stáhnout plaza (cena: 1 dovednostní bod, 100 nugetů)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
//		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //I've taught you everything I know.
//		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Ich habe dir alles beigebracht, was ich weiß.
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Naučil jsem tě všechno, co vím.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
//	AI_Output(other,self,"Org_859_Aidan_Creatures_Zahn_15_00"); //How do I get the teeth?
//	AI_Output(other,self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Wie komme ich an die Zähne?
	AI_Output(other,self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Jak dostanu zuby?

	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			B_GiveInvItems(other,self,itminugget,50);

//			PrintScreen("Learn: Extracting teeth", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Lerne: Zähne nehmen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Naučit se: vytahovat zuby", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

//			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_01"); //The most important thing is to make sure the teeth don't splinter. To avoid that, put your knife near the center of the tooth and lever it out carefully.
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Du musst vor allem darauf achten, dass die Zähne nicht splittern. Um das zu verhindern, musst du dein Messer in der Mitte des Zahns ansetzen und vorsichtig hebeln.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Nejdůležitější je zajistit, aby se zuby netříštily. Tomu se vyhneš tak, že vložíš nůž blízko středu zubu a opatrně ho vypáčíš.
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_02"); //You can take the teeth of wolves, shadowbeasts and snappers.
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Zähne kannst du von Wölfen, Schattenläufern oder Snappern nehmen.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Tak si můžeš vzít zuby vlků, stínových příšer a kousavců.

			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
//			B_LogEntry(GE_AnimalTrophies,"Knowledge on the removal of teeth - wolf, Orc dog, snapper, biter, bloodhound, shadowbeast.");
//			B_LogEntry(GE_AnimalTrophies,"Wissen über Zähne entfernen - Wolf, Orchund, Snapper, Beisser, Bluthund, Schattenläufer.");
			B_LogEntry(GE_AnimalTrophies,"Znalost vytahování zubů - vlk, skřetí pes, chňapavec, kousavec, lovecký pes, stínová šelma");
		}
		else
		{
//			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Du musst mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //
//			PrintScreen("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
//		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Erst will ich mein Erz sehen - wie gesagt: Alles hat seinen Preis!
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
//	AI_Output(other,self,"Org_859_Aidan_Creatures_Fell_15_00"); //How can I skin these creatures?
//	AI_Output(other,self,"Org_859_Aidan_Creatures_Fell_15_00"); //Wie kann ich den Viechern das Fell abziehen?
	AI_Output(other,self,"Org_859_Aidan_Creatures_Fell_15_00"); //Jak dostanu kůži těch příšer?

	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			B_GiveInvItems(other,self,itminugget,100);

//			PrintScreen("Learn: Taking off the fur", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Lerne: Fell abziehen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Naučit se: stahovat kožešinu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

//			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_01"); //It's very important to skin them from the front to the back. Once you get the hang of it, it'll be easy. Furs are very valuable!
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_01"); //Wichtig ist vor allem: Immer von vorne nach hinten. Wenn du den Bogen einmal raushast, ist es kein Problem. Felle sind sehr wertvoll!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_01"); //Důležité je kůži stahovat zezadu dopředu. Jakmile se ti napne, už je to snadné. Kožešiny se velmi cení!
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_02"); //The furs of wolves and shadowbeasts can be used to make clothes. When you examine the fur of a killed animal, you'll soon notice if it can be used or not.
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_02"); //Das Fell von Wölfen oder Schattenläufern eignet sich zum Herstellen von Kleidung. Du wirst merken, ob ein erlegtes Tier ein brauchbares Fell hat, wenn du es untersuchst.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_02"); //Kůže vlků a stínových příšer se můžou použít na oděv. Když prohlídneš kožešinu zabitého zvířete, hned poznáš, jestli ji půjde použít nebo ne.

			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
//			B_LogEntry(GE_AnimalTrophies,"Knowledge on the removal of skins - wolf, Orc dog, shadowbeast, troll");
//			B_LogEntry(GE_AnimalTrophies,"Wissen über Fell abziehen - Wolf, Orkhund, Schattenläufer, Troll");
			B_LogEntry(GE_AnimalTrophies,"Znalost stahování kožešiny - vlk, skřetí pes, chňapavec, kousavec, lovecký pes, stínová šelma, trol");
		}
		else
		{
//			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Du musst mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //
//			PrintScreen("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
//		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Erst will ich mein Erz sehen - wie gesagt: Alles hat seinen Preis!
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			B_GiveInvItems(other,self,itminugget,50);

//			PrintScreen("Learn: Taking off the claws", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Lerne: Krallen abziehen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Naučit se: vytahovat drápy", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

//			AI_Output(other,self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Show me how to take off the claws!
//			AI_Output(other,self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Bring mir bei, Krallen abzuziehen!
			AI_Output(other,self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Ukaž mi, jak dostanu drápy!
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Actually it's quite simple if you know what to do. Bend the claws forward - never backwards - and you MUSTN'T pull them out either!
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Ist im Grunde ganz einfach, wenn du weißt, wie's geht. Du musst die Krallen nach vorne wegknicken, auf keinen Fall nach hinten und NICHT ziehen!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Je to v podstatě velmi jednoduché, pokud víš jak na to. Ohneš drápy dopředu - nikdy ne dozadu - ale NESMÍŠ je vytahovat!
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Lizards' claws are especially useful. From now on, you'll know which creature's claws to take.
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Krallen kannst du vor allem von Echsen nehmen. Du wirst ab jetzt erkennen, von welchem erlegten Biest du die Krallen nehmen kannst.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Drápy můžeš dostat hlavně z ještěrek. Teď už víš, jak vzít z příšer drápy.

			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
//			B_LogEntry(GE_AnimalTrophies,"Knowledge on the removal of claws - lizard, snapper, lurker, biter, razor");
//			B_LogEntry(GE_AnimalTrophies,"Wissen über Krallen abziehen - Warane, Snapper, Lurker, Beisser, Razor");
			B_LogEntry(GE_AnimalTrophies,"Znalost vytahování drápů - ještěrka, chňapavec, číhavec, kousavec, břitvoun");
		}
		else
		{
//			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Du musst mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //
//			PrintScreen("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
//		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Erst will ich mein Erz sehen - wie gesagt: Alles hat seinen Preis!
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			B_GiveInvItems(other,self,itminugget,100);

//			PrintScreen("Learn: Skin lizards", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Lerne: Echsen häuten", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Naučit se: stahovat plazí kůži", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

//			AI_Output(other,self,"Org_859_Aidan_Creatures_Haut_15_00"); //What do I have to observe while skinning reptiles?
//			AI_Output(other,self,"Org_859_Aidan_Creatures_Haut_15_00"); //Worauf muss ich beim Häuten von Reptilien achten?
			AI_Output(other,self,"Org_859_Aidan_Creatures_Haut_15_00"); //Na co musím dávat pozor, když stahuji plazí kůži?
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_01"); //The only reptiles suited for this purpose are lurkers and swampsharks.
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_01"); //Die einzigen Reptilien, die dafür geeignet sind, sind der Lurker und der Sumpfhai.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_01"); //Jediní plazi, kteří jsou k tomuhle účelu vhodní, jsou číhavci a močáloví žraloci.
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_02"); //If you slit the skin at the sides, it'll peel off by itself. From now on you should be able to skin reptiles.
//			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_02"); //Wenn du die Haut an den Seiten anschneidest, löst sie sich wie von selbst. Du solltest ab jetzt kein Problem mehr haben, Echsen zu häuten.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_02"); //Když nařízneš kůži po stranách, sloupne se sama. Teď už bys měl umět stahovat plazy.

			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
//			B_LogEntry(GE_AnimalTrophies,"Knowledge on skinning - lurker, swampshark");
//			B_LogEntry(GE_AnimalTrophies,"Wissen über Häuten - Lurker, Sumpfhai");
			B_LogEntry(GE_AnimalTrophies,"Znalost stahování plazů - číhavec, močálový žralok");
		}
		else
		{
//			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Du musst mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //You need more experience, otherwise my knowledge won't be of any use to you.
//			PrintScreen("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
//		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Erst will ich mein Erz sehen - wie gesagt: Alles hat seinen Preis!
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //I wanna see some ore first. Like I said: Everything has its price!
	};
};
