// **************************************
//					EXIT 
// **************************************

instance DIA_Bartholo_Exit(C_INFO)
{
	npc = EBR_106_Bartholo;
	nr = 999;
	condition = DIA_Bartholo_Exit_Condition;
	information = DIA_Bartholo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

func void DIA_Bartholo_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 					HAllo
// ************************************************************

instance Info_Bartholo_HAllo(C_INFO)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_HAllo_Condition;
	information = Info_Bartholo_HAllo_Info;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};                       

func int Info_Bartholo_HAllo_Condition()
{ 
	return 1;
};

func void Info_Bartholo_HAllo_Info()
{
//	AI_Output(other,self,"Info_Bartholo_HAllo_15_00"); //Who are you?
//	AI_Output(other,self,"Info_Bartholo_HAllo_15_00"); //Wer bist du?
	AI_Output(other,self,"Info_Bartholo_HAllo_15_00"); //Kdo jsi?
//	AI_Output(self,other,"Info_Bartholo_HAllo_12_01"); //Bartholo's the name. I see to it that the Ore Barons get their supplies.
//	AI_Output(self,other,"Info_Bartholo_HAllo_12_01"); //Ich bin Bartholo. Ich kümmere mich um die Versorgung der Erzbarone.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_01"); //Jmenuji se Bartholo. Starám se o to, aby Rudobaroni dostávali své dodávky.
//	AI_Output(self,other,"Info_Bartholo_HAllo_12_02"); //I'm in charge of the lot - from weed supplies to food and provisions for the women.
//	AI_Output(self,other,"Info_Bartholo_HAllo_12_02"); //Ich regele alles - von Krautlieferungen, über Essen bis hin zur Versorgung der Frauen.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_02"); //Starám se o všechno - od dodávek trávy z bažin přes jídlo, až po zaopatření pro ženy.
//	AI_Output(self,other,"Info_Bartholo_HAllo_12_03"); //Also, it's my job to make sure those idiotic cooks do their job right.
//	AI_Output(self,other,"Info_Bartholo_HAllo_12_03"); //Außerdem sorge ich dafür, dass die beiden idiotischen Köche ihre Arbeit gut machen.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_03"); //Mimo jiné se také starám o to, aby tihle pitomí kuchaři odváděli pořádnou práci.
//	AI_Output(self,other,"Info_Bartholo_HAllo_12_04"); //They should be grateful. Gomez won't put up with any crap. He fed the last two cooks to the lurkers in the river.
//	AI_Output(self,other,"Info_Bartholo_HAllo_12_04"); //Sie sollten mir dafür dankbar sein. Gomez lässt sich nicht jeden Fraß gefallen. Die letzten beiden hat er an die Snapper im Fluss verfüttert.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_04"); //Měli by za to být vděční. Gomez se nespokojí s žádným šlendriánem. Posledními dvěma kuchaři nakrmil číhavce v řece.
};

// ************************************************************
// 					PERM TRADE
// ************************************************************

instance Info_Bartholo_PERM(C_INFO)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_PERM_Condition;
	information = Info_Bartholo_PERM_Info;
	//#Needs_Attention toto obchodovanie nieje permanentne - takze po jednom obchodovani dialog zmizne.
	//Chceme ale aby Bartholo obchodoval?
	//Predava kluc od skladu ItKe_Storage_01 - zadarmo :-/
	permanent = 0;
//	description = "I want to make a deal with you.";
//	description = "Ich will mit dir handeln.";
	description = "Chtěl bych s tebou obchodovat.";
	trade = 1;
};                       

func int Info_Bartholo_PERM_Condition()
{ 
//SN: Problematisch, da Bartholo auch einen wichtigen Schlüssel hat!
//	if (Npc_KnowsInfo(hero,Info_Bartholo_Hallo))
//	{
//		return 1;
//	};
};

func void Info_Bartholo_PERM_Info()
{
//	AI_Output(other,self,"Info_Bartholo_PERM_15_00"); //I wanna make a deal with you.
//	AI_Output(other,self,"Info_Bartholo_PERM_15_00"); //Ich will mit dir handeln.
	AI_Output(other,self,"Info_Bartholo_PERM_15_00"); //Chtěl bych s tebou obchodovat.
//	AI_Output(self,other,"Info_Bartholo_PERM_12_01"); //I have a lot to offer - if you have enough ore.
//	AI_Output(self,other,"Info_Bartholo_PERM_12_01"); //Ich habe einiges da - wenn du genug Erz hast.
	AI_Output(self,other,"Info_Bartholo_PERM_12_01"); //Můžu ti toho hodně nabídnout - pokud máš dost rudy.
};

// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

instance Info_Bartholo_Krautbote(C_INFO)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_Krautbote_Condition;
	information = Info_Bartholo_Krautbote_Info;
	permanent = 1;
//	description = "I have some weed here for Gomez. Cor Kalom sent it.";
//	description = "Ich habe ne Ladung Kraut von Cor Kalom für Gomez.";
	description = "Mám pro Gomeze dodávku drogy z bažin od Cor Kaloma.";
};                       

func int Info_Bartholo_Krautbote_Condition()
{ 
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

func void Info_Bartholo_Krautbote_Info()
{
//	AI_Output(other,self,"Info_Bartholo_Krautbote_15_00"); //I have some weed here for Gomez. Cor Kalom sent it.
//	AI_Output(other,self,"Info_Bartholo_Krautbote_15_00"); //Ich habe 'ne Ladung Kraut von Cor Kalom für Gomez.
	AI_Output(other,self,"Info_Bartholo_Krautbote_15_00"); //Mám pro Gomeze dodávku drogy z bažin od Cor Kaloma.
//	AI_Output(self,other,"Info_Bartholo_Krautbote_12_01"); //Show me!
//	AI_Output(self,other,"Info_Bartholo_Krautbote_12_01"); //Zeig her!
	AI_Output(self,other,"Info_Bartholo_Krautbote_12_01"); //Ukaž mi to!

	if (Npc_HasItems(other,itmijoint_3) >= 30)
	{
//		AI_Output(self,other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmmm...
//		AI_Output(self,other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmmm ...
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmmm...
//		AI_Output(self,other,"Info_Bartholo_Krautbote_12_03"); //Alright! Gomez has been getting impatient. It's lucky for you that you delivered it today!
//		AI_Output(self,other,"Info_Bartholo_Krautbote_12_03"); //Gut! Gomez ist beinahe ungeduldig geworden. Sei froh, dass du es heute noch abgeliefert hast!
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_03"); //Dobrá! Gomez už začínal být netrpělivý. Máš štěstí, žes ji přinesl už dneska!
//		AI_Output(other,self,"Info_Bartholo_Krautbote_15_04"); //What about the pay?
//		AI_Output(other,self,"Info_Bartholo_Krautbote_15_04"); //Was ist mit der Bezahlung?
		AI_Output(other,self,"Info_Bartholo_Krautbote_15_04"); //A co bude s mým platem?
//		AI_Output(self,other,"Info_Bartholo_Krautbote_12_05"); //Not so fast... Here, take that. 500 ore is what we agreed on.
//		AI_Output(self,other,"Info_Bartholo_Krautbote_12_05"); //Nicht so eilig ... Hier, nimm. 500 Erz waren abgemacht.
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_05"); //Ne tak zhurta... Ták, tady. 500 nugetů, jak to bylo domluveno.

		B_GiveInvItems(other,self,itmijoint_3,30);
		CreateInvItems(self,itminugget, 500);
		B_GiveInvItems(self,other,itminugget, 500);

		Kalom_DeliveredWeed = TRUE;
//		B_LogEntry(CH1_KrautBote,"Bartholo has given me 500 ore for the weed delivery.");
//		B_LogEntry(CH1_KrautBote,"Bartholo hat mir 500 Erz für die Krautlieferung gegeben.");
		B_LogEntry(CH1_KrautBote,"Bartholo mi dal za zásilku drogy z bažin 500 nugetů.");
		B_GiveXP(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
//		AI_Output(self,other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //You don't have enough weed to be a gofer! I hope for your sake that you haven't sold the stuff elsewhere! Come back when you have the right amount!
//		AI_Output(self,other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Du hast zu wenig Kraut für einen Boten! Ich will für dich nicht hoffen, dass du das Zeug verscherbelt hast! Komm wieder, wenn du die richtige Menge dabei hast!
		AI_Output(self,other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Na poslíčka té drogy moc nemáš! Doufám, žes tu zásilku už nerozprodal někde jinde! Vrať se, až budeš mít to správné množství!
	};
};

// **************************************************************************
// 				Wartet auf den SC
// **************************************************************************

instance DIA_EBR_106_Bartholo_Wait4SC(C_INFO)
{
	npc = EBR_106_Bartholo;
	condition = DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information = DIA_EBR_106_Bartholo_Wait4SC_Info;
	important = 1;
	permanent = 0;
};

func int DIA_EBR_106_Bartholo_Wait4SC_Condition()
{ 
	if ExploreSunkenTower
	{
		return TRUE;
	};
};
func void DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	AI_SetWalkmode(self,NPC_WALK);
	AI_GotoNpc(self,other);
//	AI_Output(self,other,"Info_Bartholo_12_01"); //I knew that somebody would try to get at us through the pentagram!
//	AI_Output(self,other,"Info_Bartholo_12_01"); //Ich hatte mir fast gedacht, dass es jemand durch das Pentagramm versuchen würde!
	AI_Output(self,other,"Info_Bartholo_12_01"); //Věděl jsem, že se k nám někdo pokusí dostat přes pentagram!
//	AI_Output(self,other,"Info_Bartholo_12_02"); //But, unlike that traitorous smith Stone, we don't need you any more!
//	AI_Output(self,other,"Info_Bartholo_12_02"); //Aber im Gegensatz zu diesem verräterischen Schmied Stone brauchen wir dich nicht mehr!
	AI_Output(self,other,"Info_Bartholo_12_02"); //Ale na rozdíl od toho zrádného kováře Stonea tebe už nebudeme potřebovat!
//	AI_Output(other,self,"Info_Bartholo_15_03"); //Where is Stone?
//	AI_Output(other,self,"Info_Bartholo_15_03"); //Wo ist Stone?
	AI_Output(other,self,"Info_Bartholo_15_03"); //Kde je Stone?
//	AI_Output(self,other,"Info_Bartholo_12_04"); //Behind bars! But you're gonna be six feet under in a minute!
//	AI_Output(self,other,"Info_Bartholo_12_04"); //Hinter Gittern! Aber dafür wirst du gleich unter der Erde liegen!
	AI_Output(self,other,"Info_Bartholo_12_04"); //Za katrem! Ale ty budeš za chvilku pod drnem!
//	AI_Output(self,other,"Info_Bartholo_12_05"); //Get him, guys, and slice him up!
//	AI_Output(self,other,"Info_Bartholo_12_05"); //Schnappt ihn euch, Jungs, und macht ihn kalt!
	AI_Output(self,other,"Info_Bartholo_12_05"); //Chyťte ho, chlapi, zabte ho!

	AI_StopProcessInfos(self);

	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR); 
};
