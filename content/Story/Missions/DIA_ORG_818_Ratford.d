// **************************************************
//						 EXIT
// **************************************************

instance Org_818_Ratford_Exit(C_INFO)
{
	npc = Org_818_Ratford;
	nr = 999;
	condition = Org_818_Ratford_Exit_Condition;
	information = Org_818_Ratford_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Org_818_Ratford_Exit_Condition()
{
	return 1;
};

func void Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//					Wrong Way
// **************************************************

instance Org_818_Ratford_WrongWay(C_INFO)
{
	npc = Org_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WrongWay_Condition;
	information = Org_818_Ratford_WrongWay_Info;
	important = 1;
	permanent = 0;
};

func int Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

func void Org_818_Ratford_WrongWay_Info()
{
//	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_00"); //Hey, you!
//	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_00"); //Hey, du!
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_00"); //Hej, ty!
//	AI_Output(other,self,"Org_818_Ratford_WrongWay_15_01"); //What do you want?
//	AI_Output(other,self,"Org_818_Ratford_WrongWay_15_01"); //Was willst du?
	AI_Output(other,self,"Org_818_Ratford_WrongWay_15_01"); //Co chceš?
//	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02"); //I want to warn you. If you continue this way, you'll be entering our hunting ground.
//	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02"); //Dich warnen. Wenn du hier weiter gehst, kommst du in unser Jagdgebiet.
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02"); //Chci tě varovat. Jestli půjdeš dál touhle cestou, vstoupíš na naši loveckou půdu.
};

// **************************************************
//					Was jagt ihr
// **************************************************

instance Org_818_Ratford_WhatGame(C_INFO)
{
	npc = Org_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhatGame_Condition;
	information = Org_818_Ratford_WhatGame_Info;
	important = 0;
	permanent = 0;
//	description = "What do you hunt?";
//	description = "Was jagt ihr denn so?";
	description = "Co tady lovíte?";
};

func int Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhatGame_Info()
{
//	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_00"); //What do you hunt?
//	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_00"); //Was jagt ihr denn so?
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_00"); //Co tady lovíte?
//	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01"); //Mostly scavengers. There's a lot of meat on them. Besides, it isn't too hard to get them... Once you know how.
//	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01"); //Meistens Scavenger. Sie geben 'ne Menge Fleisch ab. Außerdem sind sie nicht so schwer zur Strecke zu bringen - wenn man weiß, wie.
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01"); //Většinou mrchožrouty. Je z nich spousta masa. Kromě toho, není tak těžké je dostat... Když víš, jak na to.
//	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02"); //Really? How's that?
//	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02"); //So? Und wie?
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02"); //Opravdu? A jak?
//	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03"); //Ask my friend Drax here - he knows more about these things than anyone.
//	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03"); //Frag meinen Freund Drax hier - der weiß über solche Sachen besser Bescheid als ich.
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03"); //Zeptej se tady mého přítele Draxe - ví o tom víc než kdokoliv jiný.
};

// **************************************************
//					Warum gefährlich
// **************************************************

instance Org_818_Ratford_WhyDangerous(C_INFO)
{
	npc = Org_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhyDangerous_Condition;
	information = Org_818_Ratford_WhyDangerous_Info;
	important = 0;
	permanent = 0;
//	description = "Why's this area so dangerous?";
//	description = "Was ist an diesem Gebiet so gefährlich?";
	description = "Proč je ta oblast tak nebezpečná?";
};

func int Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhyDangerous_Info()
{
//	AI_Output(other,self,"Org_818_Ratford_WhyDangerous_15_00"); //Why's this area so dangerous?
//	AI_Output(other,self,"Org_818_Ratford_WhyDangerous_15_00"); //Was ist an diesem Gebiet so gefährlich?
	AI_Output(other,self,"Org_818_Ratford_WhyDangerous_15_00"); //Proč je ta oblast tak nebezpečná?
//	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01"); //You've just arrived, haven't you? There are different areas in the colony which are all more or less dangerous.
//	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01"); //Du bist gerade angekommen, was? In der Kolonie gibt es unterschiedlich gefährliche Gebiete.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01"); //Právě jsi sem přišel, viď? V kolonii jsou různé oblasti, které jsou více nebo méně nebezpečné.
//	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02"); //The paths between the camps are quite safe. But even there you might come across some wolves which will look on you as easy prey.
//	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02"); //Auf den Wegen zwischen den Lagern ist es einigermaßen sicher. Aber auch dort kannst du ein paar Wölfen begegnen, die dich als leichte Beute sehen werden.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02"); //Cesty mezi tábory jsou docela bezpečné. Ale i na nich ti můžou zkřížit cestu nějací vlci, kteří na tebe budou hledět jako na snadnou kořist.
//	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03"); //And that's exactly what you are until you get a proper weapon and armor.
//	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03"); //Und genau das bist du auch, bis du geeignete Waffen und Rüstung hast.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03"); //A to právě do té doby, dokud nebudeš mít pořádnou zbraň a zbroj.
};

// **************************************************
//					Wo Ausrüstung
// **************************************************

instance Org_818_Ratford_WoEquipment(C_INFO)
{
	npc = Org_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoEquipment_Condition;
	information = Org_818_Ratford_WoEquipment_Info;
	important = 0;
	permanent = 0;
//	description = "Where can I get better equipment?";
//	description = "Wo kriege ich bessere Ausrüstung her?";
	description = "Kde dostanu lepší výbavu?";
};

func int Org_818_Ratford_WoEquipment_Condition()
{
	if (Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};

	return 0;
};

func void Org_818_Ratford_WoEquipment_Info()
{
//	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00"); //Where can I get better equipment?
//	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00"); //Wo kriege ich bessere Ausrüstung her?
	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00"); //Kde dostanu lepší vybavení?
//	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01"); //The nearest place is the Old Camp. Just follow the path that brought you here.
//	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01"); //Der nächste Ort ist das Alte Lager. Du musst nur dem Weg folgen, den du gekommen bist.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01"); //Nejblíže to bude ve Starém táboře. Přímo tahle cesta tě tam dovede.
//	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02"); //But you can get the stuff cheaper in our New Camp - provided you know the right people.
//	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02"); //Aber bei uns im Neuen Lager bekommst du die Sachen billiger - wenn du die richtigen Leute kennst.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02"); //Ale v našem táboře to dostaneš levněji. Nový tábor - tam potkáš ty správné lidi.
//	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03"); //If you go to the Old Camp, ask for Mordrag. He's one of us. For just a little ore, he'll sell you the proper goods.
//	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03"); //Wenn du ins alte Lager gehst, frag nach Mordrag. Er ist einer von uns. Er verkauft gute Ware für wenig Erz.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03"); //Jestli půjdeš do Starého tábora, ptej se po Mordragovi. Je jedním z nás. Za trochu rudy ti prodá to správné zboží.

	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
//	B_LogEntry(GE_TraderOC,"The rogue Mordrag sells all sorts of goods for reasonable prices in the Old Camp.");
//	B_LogEntry(GE_TraderOC,"Der Bandit Mordrag verkauft im Alten Lager Waren aller Art zu günstigen Preisen.");
	B_LogEntry(GE_TraderOC,"Bandita Mordrag prodává ve Starém táboře za přijatelné ceny veškeré zboží.");
};

// **************************************************
//					More Locations
// **************************************************

instance Org_818_Ratford_MoreLocations(C_INFO)
{
	npc = Org_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_MoreLocations_Condition;
	information = Org_818_Ratford_MoreLocations_Info;
	important = 0;
	permanent = 0;
//	description = "Tell me more about the areas of the colony.";
//	description = "Erzähl mir mehr über die Gebiete der Kolonie.";
	description = "Pověz mi víc o oblastech v kolonii.";
};

func int Org_818_Ratford_MoreLocations_Condition()
{
	if (Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};

	return 0;
};

func void Org_818_Ratford_MoreLocations_Info()
{
//	AI_Output(other,self,"Org_818_Ratford_MoreLocations_15_00"); //Tell me more about the areas of the colony.
//	AI_Output(other,self,"Org_818_Ratford_MoreLocations_15_00"); //Erzähl mir mehr über die Gebiete der Kolonie.
	AI_Output(other,self,"Org_818_Ratford_MoreLocations_15_00"); //Pověz mi víc o oblastech v kolonii.
//	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01"); //If you travel between the camps, you'll need a map to distinguish paths and dead ends.
//	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01"); //Wenn du zwischen den Lagern reist, solltest du eine Karte haben. So kannst du die Verbindungswege von den Sackgassen unterscheiden.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01"); //Když cestuješ mezi tábory, musíš mít mapu, abys rozpoznal cesty a slepé stezky.
//	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02"); //Dead ends often lead you to dangerous canyons where you encounter creatures you'd better avoid.
//	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02"); //Die Sackgassen führen dich oft in gefährliche Schluchten, in denen du Kreaturen begegnen wirst, denen du am Anfang besser aus dem Weg gehst.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02"); //Slepé stezky tě často dovedou do nebezpečných kaňonů, kde potkáš příšery, kterým je lepší se vyhnout.
//	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03"); //Do not enter the old ruins. There are many around here. Most of them are old fortifications dating back to the time of the first Orc war. Some are abandoned Orc dwellings.
//	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03"); //Meide alte Ruinen, die Gegend hier ist voll davon. Die meisten sind alte Befestigungen aus dem ersten Ork-Krieg oder verlassene Ork-Behausungen.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03"); //Nevcházej do starých zřícenin. Je jich tu v okolí spousta. Většina z nich se datuje do časů první skřetí války. Některé jsou opuštěná skřetí sídla.
//	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04"); //There are often Orcs in those ruins - or even worse creatures. I'd avoid those places, especially at night.
//	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04"); //In diesen Ruinen treiben sich oft Orks herum - oder Schlimmeres. Vor allem nachts würde ich diese Plätze meiden.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04"); //V těchto zříceninách bývají často skřeti - nebo ještě horší příšery. Těmhle místům bych se vyhýbal, obzvlášť v noci.
//	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05"); //And one more hint - don't go into the forest!
//	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05"); //Und wenn du noch einen letzten Tipp willst - geh nicht in den Wald!
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05"); //A ještě jedna rada - nechoď do lesa!
};

// **************************************************
//					Wo Karte?
// **************************************************

instance Org_818_Ratford_WoKarte(C_INFO)
{
	npc = Org_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoKarte_Condition;
	information = Org_818_Ratford_WoKarte_Info;
	important = 0;
	permanent = 0;
//	description = "Where do I get a map?";
//	description = "Wo kriege ich eine Karte her?";
	description = "Kde dostanu mapu?";
};

func int Org_818_Ratford_WoKarte_Condition()
{
	if (Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};

	return 0;
};

func void Org_818_Ratford_WoKarte_Info()
{
//	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00"); //Where do I get a map?
//	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00"); //Wo kriege ich eine Karte her?
	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00"); //Kde dostanu mapu?
//	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01"); //Ask the people in the Old Camp. There's a cartographer living there.
//	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01"); //Frag im Alten Lager herum, ich glaube, da gibt es einen Kartenzeichner.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01"); //Zeptej se lidí ve Starém táboře, žije tam jeden kartograf.
//	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02"); //Maybe you can steal one of his maps! If you manage to do it, take one for me as well!
//	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02"); //Vielleicht kannst du ihm ja eine seiner Karten klauen! Wenn du's schaffst, bring mir eine mit!
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02"); //Možná se ti podaří nějakou z jeho map ukrást! Jestli se ti to podaří, vezmi také jednu pro mě!

	Info_ClearChoices(Org_818_Ratford_WoKarte);
//	Info_AddChoice(Org_818_Ratford_WoKarte,"If I get them without paying, I'll take as many as I can carry!",Org_818_Ratford_WoKarte_Stehlen);
//	Info_AddChoice(Org_818_Ratford_WoKarte,"Wenn ich rankomme, ohne zu bezahlen, bringe ich mit, soviel ich tragen kann!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice(Org_818_Ratford_WoKarte,"Jestli se mi je podaří vzít bez placení, vezmu jich tolik, kolik unesu!",Org_818_Ratford_WoKarte_Stehlen);
//	Info_AddChoice(Org_818_Ratford_WoKarte,"Why? Doesn't he sell the maps? ",Org_818_Ratford_WoKarte_Kaufen);
//	Info_AddChoice(Org_818_Ratford_WoKarte,"Wieso? - Verkauft er die Karten nicht?",Org_818_Ratford_WoKarte_Kaufen);
	Info_AddChoice(Org_818_Ratford_WoKarte,"Proč? On neprodává mapy?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
//	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //If I manage to get them without paying, I'll take as many as I can carry!
//	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Wenn ich rankomme, ohne zu bezahlen, bringe ich mit, so viel ich tragen kann!
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Jestli se mi je podaří vzít bez placení, vezmu jich tolik, kolik unesu!
//	AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //You're alright! You should consider coming to the New Camp! In case you go there, ask for Lares. He takes care of the new ones. I'm sure he'll have a job for you!
//	AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //Du gefällst mir! Du solltest dir überlegen, zu uns ins Neue Lager zu kommen! Wenn du mal da bist, frag nach Lares. Er kümmert sich um die Neuen. Er hat bestimmt was zu tun für dich!
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //Líbíš se mi. Měl by ses rozhodnout pro Nový tábor! Jestli tam půjdeš, ptej se na Larese. Stará se o nové příchozí. Myslím, že pro tebe bude mít práci!

	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;

	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
//	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Why? Doesn't he sell the maps?
//	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Wieso? - Verkauft er die Karten nicht?
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Proč? On neprodává mapy?
//	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //If you get enough ore to pay for them...
//	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Wenn du an genug Erz rankommst, um sie zu bezahlen ...
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Jestli máš dost rudy, abys je zaplatil...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

// **************************************************
//						Danke
// **************************************************

instance Org_818_Ratford_Thanks(C_INFO)
{
	npc = Org_818_Ratford;
	nr = 888;
	condition = Org_818_Ratford_Thanks_Condition;
	information = Org_818_Ratford_Thanks_Info;
	important = 0;
	permanent = 0;
//	description = "Thanks for your help.";
//	description = "Danke für die Hilfe.";
	description = "Díky za pomoc.";
};

func int Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

func void Org_818_Ratford_Thanks_Info()
{
//	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00"); //Thanks for your help.
//	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00"); //Danke für die Hilfe.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00"); //Díky za pomoc.
//	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01"); //Don't go thinking everyone's going to be so friendly, kid!
//	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01"); //Glaub bloß nicht, dass hier alle so nett zu dir sind, Kleiner!
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01"); //Nemysli si, že se bude každý chovat tak přátelsky, mladej!
//	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02"); //There may not be much in a newcomer's pockets, but some folks would even beat you up for a pickaxe.
//	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02"); //Ist zwar nicht viel zu holen bei einem Neuen, aber einige hier würden dir sogar für eine alte Spitzhacke die Seele aus dem Leib prügeln.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02"); //Nový příchozí ani nemusí mít zrovna narvané kapsy, ale někteří tě zabijou třeba jenom pro krumpáč.
//	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04"); //I'll keep it in mind.
//	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04"); //Werd's mir merken.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04"); //Budu si to pamatovat.
};
