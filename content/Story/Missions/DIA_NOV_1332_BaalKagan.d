// ************************************************************
//	  EXIT 
// ************************************************************

instance DIA_BaalKagan_EXIT(C_INFO)
{
	npc = Nov_1332_BaalKagan;
	nr = 999;
	condition = DIA_BaalKagan_EXIT_Condition;
	information = DIA_BaalKagan_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalKagan_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

// ************************************************************
// Hallo
// ************************************************************

instance DIA_BaalKagan_Hello(C_INFO)
{
	npc = Nov_1332_BaalKagan;
	nr = 1;
	condition = DIA_BaalKagan_Hello_Condition;
	information = DIA_BaalKagan_Hello_Info;
	permanent = 0;
//	description = "You're from the Sect Camp, aren't you?";
//	description = "Du bist aus dem Lager der Sekte, richtig?";
	description = "Ty jsi ze Sektovního tábora, viď?";
};                       

func int DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

func void DIA_BaalKagan_Hello_Info()
{ 
//	AI_Output(other,self,"DIA_BaalKagan_Hello_15_00"); //You're from the Sect Camp, aren't you?
//	AI_Output(other,self,"DIA_BaalKagan_Hello_15_00"); //Du bist aus dem Lager der Sekte, richtig?
	AI_Output(other,self,"DIA_BaalKagan_Hello_15_00"); //Ty jsi ze Sektovního tábora, viď?
//	AI_Output(self,other,"DIA_BaalKagan_Hello_13_01"); //We call it the Brotherhood.
//	AI_Output(self,other,"DIA_BaalKagan_Hello_13_01"); //Wir nennen es die Bruderschaft.
	AI_Output(self,other,"DIA_BaalKagan_Hello_13_01"); //Říkáme tomu Bratrstvo.
//	AI_Output(self,other,"DIA_BaalKagan_Hello_13_02"); //I'm Baal Kagan. The Sleeper be with you.
//	AI_Output(self,other,"DIA_BaalKagan_Hello_13_02"); //Ich bin Baal Kagan. Der Schläfer sei mit dir.
	AI_Output(self,other,"DIA_BaalKagan_Hello_13_02"); //Jsem Baal Kagan. Spáč buď s tebou.
};

// ************************************************************
// Warum hier
// ************************************************************

instance DIA_BaalKagan_WhyHere(C_INFO)
{
	npc = Nov_1332_BaalKagan;
	nr = 1;
	condition = DIA_BaalKagan_WhyHere_Condition;
	information = DIA_BaalKagan_WhyHere_Info;
	permanent = 0;
//	description = "What are you doing here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};                       

func int DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

func void DIA_BaalKagan_WhyHere_Info()
{ 
//	AI_Output(other,self,"DIA_BaalKagan_WhyHere_15_00"); //What are you doing here?
//	AI_Output(other,self,"DIA_BaalKagan_WhyHere_15_00"); //Was machst du hier?
	AI_Output(other,self,"DIA_BaalKagan_WhyHere_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_01"); //Originally, I was sent here to convince people to join our Brotherhood.
//	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_01"); //Ursprünglich bin ich hierhin entsandt worden, um für unsere Gemeinschaft zu werben.
	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_01"); //Původně jsem sem byl vyslán, abych přesvědčoval lidi, aby se přidali k našemu Bratrstvu.
//	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_02"); //But these barbarians are not interested in spiritual enlightenment. Therefore I'm restricted to selling swampweed.
//	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_02"); //Aber diese Barbaren wollen nichts wissen von geistiger Erleuchtung. So beschränke ich mich auf den Verkauf von Sumpfkraut.
	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_02"); //Ti barbaři ale nemají vůbec zájem o duchovní osvětu. Proto jsem se omezil na prodej drogy z bažiny.
//	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_03"); //And that is a popular occupation here. Too popular. I can hardly deliver as much as they want to have.
//	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_03"); //Dies wiederum wird hier sehr gerne gesehen. Zu gerne. Ich kann allein kaum alle meine Kunden beliefern.
	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_03"); //A to je tady oblíbené zaměstnání. Příliš oblíbené. Sotva stačím uspokojovat poptávku.

	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
//	B_LogEntry(GE_TraderNC,"Baal Kagan sells stalks of weed to rogues and mercenaries in the New Camp.");
//	B_LogEntry(GE_TraderNC,"Baal Kagan verkauft Krautstengel an die Banditen und Söldner im Neuen Lager.");
	B_LogEntry(GE_TraderNC,"Baal Kagan prodává lodyhy drogy banditům a žoldákům v Novém táboře.");
};

// ************************************************************
// TRADE
// ************************************************************

instance DIA_BaalKagan_TRADE(C_INFO)
{
	npc = Nov_1332_BaalKagan;
	nr = 800;
	condition = DIA_BaalKagan_TRADE_Condition;
	information = DIA_BaalKagan_TRADE_Info;
	permanent = 1;
//	description = "Show me your goods.";
//	description = "Zeig mir deine Waren.";
	description = "Ukaž mi svoje zboží.";
	trade = 1;
};                       

func int DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

func void DIA_BaalKagan_TRADE_Info()
{ 
//	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00"); //Show me your goods.
//	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00"); //Zeig mir deine Waren.
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00"); //Ukaž mi svoje zboží.
//	AI_Output(self,other,"DIA_BaalKagan_TRADE_13_01"); //As you wish.
//	AI_Output(self,other,"DIA_BaalKagan_TRADE_13_01"); //Wie du wünschst.
	AI_Output(self,other,"DIA_BaalKagan_TRADE_13_01"); //Jak chceš.
};

// ************************************************************
// Hilfe anfordern
// ************************************************************

instance DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc = Nov_1332_BaalKagan;
	nr = 2;
	condition = DIA_BaalKagan_OrderHelp_Condition;
	information = DIA_BaalKagan_OrderHelp_Info;
	permanent = 0;
//	description = "Why don't they send an extra man here?";
//	description = "Warum schicken sie nicht einen weiteren Mann?";
	description = "Proč sem nepošlou jednoho muže navíc?";
};                       

func int DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

func void DIA_BaalKagan_OrderHelp_Info()
{ 
//	AI_Output(other,self,"DIA_BaalKagan_OrderHelp_15_00"); //Why don't they send an extra man here?
//	AI_Output(other,self,"DIA_BaalKagan_OrderHelp_15_00"); //Warum schicken sie nicht einen weiteren Mann?
	AI_Output(other,self,"DIA_BaalKagan_OrderHelp_15_00"); //Proč sem nepošlou jednoho muže navíc?
//	AI_Output(self,other,"DIA_BaalKagan_OrderHelp_13_01"); //Baal Isidro was meant to help me, but he just spends all day in the bar on the lake and trades his weed for rice schnapps.
//	AI_Output(self,other,"DIA_BaalKagan_OrderHelp_13_01"); //Baal Isidro sollte mich unterstützen, aber er sitzt den ganzen Tag in der Kneipe auf dem See und tauscht sein Kraut gegen Reisschnaps ein.
	AI_Output(self,other,"DIA_BaalKagan_OrderHelp_13_01"); //Baal Isidro mi chtěl pomáhat, ale pak se zasekl na celý den v baru na jezeře a všechnu drogu vyměnil za rýžovou pálenku.
//	AI_Output(self,other,"DIA_BaalKagan_OrderHelp_13_02"); //He's addicted to the spirit. I fear I cannot expect any help from him.
//	AI_Output(self,other,"DIA_BaalKagan_OrderHelp_13_02"); //Er ist dem Schnaps verfallen. Ich fürchte, von ihm ist keine Hilfe zu erwarten.
	AI_Output(self,other,"DIA_BaalKagan_OrderHelp_13_02"); //Stal se obětí té lihoviny. Obávám se, že s jeho pomocí nemůžu počítat.

	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic(CH1_DealerJob,LOG_MISSION);
		Log_SetTopicStatus(CH1_DealerJob,LOG_RUNNING);
//		B_LogEntry(CH1_DealerJob,"Baal Isidro is sitting in the bar at the lake and drinking all day."); 
//		B_LogEntry(CH1_DealerJob,"Baal Isidro sitzt den ganzen Tag in der Kneipe auf dem See und säuft."); 
		B_LogEntry(CH1_DealerJob,"Baal Isidro sedí v baru na jezeře a celé dny pije."); 
	};
};

// ************************************************************
// Ich könnte dir helfen
// ************************************************************

instance DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc = Nov_1332_BaalKagan;
	nr = 3;
	condition = DIA_BaalKagan_WannaHelp_Condition;
	information = DIA_BaalKagan_WannaHelp_Info;
	permanent = 0;
//	description = "I could help you sell your weed to the people.";
//	description = "Ich könnte dir helfen, dein Kraut unter die Leute zu bringen.";
	description = "Mohl bych ti pomoci prodávat tvou drogu lidem.";
};                       

func int DIA_BaalKagan_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))
	{
		return 1;
	};
};

func void DIA_BaalKagan_WannaHelp_Info()
{ 
//	AI_Output(other,self,"DIA_BaalKagan_WannaHelp_15_00"); //I could help you sell your weed to the people.
//	AI_Output(other,self,"DIA_BaalKagan_WannaHelp_15_00"); //Ich könnte dir helfen, dein Kraut unter die Leute zu bringen.
	AI_Output(other,self,"DIA_BaalKagan_WannaHelp_15_00"); //Mohl bych ti pomoci prodávat tvou drogu lidem.
//	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_01"); //I can only entrust such a large amount of weed to members of the Brotherhood.
//	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_01"); //Eine so große Menge Kraut kann ich dir nur anvertrauen, wenn du ein Mitglied der Bruderschaft bist.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_01"); //Takové množství drogy můžu svěřit jedině někomu z členů Bratrstva.
//	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_02"); //But you could help me give out gifts.
//	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_02"); //Aber du könntest mir helfen, Geschenke zu verteilen.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_02"); //Mohl bys mi ale pomoci rozdávat dary.
//	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_03"); //Not everybody has tasted my goods yet. As soon as they've tried the weed, they'll want more, which means I can sell more.
//	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_03"); //Es sind noch nicht alle hier auf den Geschmack gekommen. Wenn sie erst einmal unser Kraut gekostet haben, werden sie mehr verlangen und ich kann mehr verkaufen.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_03"); //Moje zboží ještě neokusili všichni. Jakmile jednou okusí tu drogu, budou chtít víc a víc, což pro mě bude znamenat lepší obchod.
//	AI_Output(other,self,"DIA_BaalKagan_WannaHelp_15_04"); //I thought you could hardly manage to do your task NOW.
//	AI_Output(other,self,"DIA_BaalKagan_WannaHelp_15_04"); //Ich denke, du schaffst es JETZT schon kaum, deine Aufgabe zu erfüllen.
	AI_Output(other,self,"DIA_BaalKagan_WannaHelp_15_04"); //Myslel jsem si, že se ti sotva podaří vykonat tvůj úkol TEĎ.
//	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_05"); //Baal Isidro will be taken care of soon. I've already sent a message to Cor Kalom.
//	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_05"); //Für Baal Isidro wird bald gesorgt. Ich habe schon eine Nachricht an Cor Kalom geschickt.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_05"); //O Baala Isidra bude brzy postaráno. Už jsem poslal Cor Kalomovi zprávu.
};

// ************************************************************
// Was ist drin?
// ************************************************************

instance DIA_BaalKagan_WasDrin(C_INFO)
{
	npc = Nov_1332_BaalKagan;
	nr = 3;
	condition = DIA_BaalKagan_WasDrin_Condition;
	information = DIA_BaalKagan_WasDrin_Info;
	permanent = 0;
//	description = "What's in it for me if I hand out the weed for you?";
//	description = "Wenn ich das Kraut für dich verteile - was ist für mich drin?";
	description = "Co dostanu, když budu za tebe roznášet tu drogu?";
};                       

func int DIA_BaalKagan_WasDrin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

func void DIA_BaalKagan_WasDrin_Info()
{ 
//	AI_Output(other,self,"DIA_BaalKagan_WasDrin_15_00"); //What's in it for me if I hand out the weed for you?
//	AI_Output(other,self,"DIA_BaalKagan_WasDrin_15_00"); //Wenn ich das Kraut für dich verteile - was ist für mich drin?
	AI_Output(other,self,"DIA_BaalKagan_WasDrin_15_00"); //Co dostanu, když bude za tebe roznášet tu drogu?
//	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_01"); //I can reward you in many different ways.
//	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_01"); //Ich kann dich auf viele Arten entlohnen.
	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_01"); //Může tě odměnit různými způsoby.
//	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_02"); //You can get magic spell scrolls from me, bearing the powerful magic of the Sleeper.
//	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_02"); //Du kannst von mir magische Spruchrollen erhalten, die mit mächtiger Magie des Schläfers belegt sind.
	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_02"); //Můžeš ode mě dostat magické svitky, které v sobě mají silné Spáčovo kouzlo.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
//		AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_03"); //Or I can help you join our community, if that's what you want. I have very good contacts to Cor Kalom and Baal Tyon.
//		AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_03"); //Ich kann dir aber auch helfen, leichter in unsere Gemeinschaft aufgenommen zu werden, wenn du das wünschst. Ich habe sehr gute Kontakte zu Cor Kalom und Baal Tyon.
		AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_03"); //Nebo ti můžu pomoci přidat se k naší komunitě, pokud bys to chtěl. Mám velmi dobré kontakty s Cor Kalomem a Baalem Tyonem.
//		AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_04"); //Both are very close to Y'Berion, our master.
//		AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_04"); //Beide stehen Y'Berion, unserem Meister, sehr nahe.
		AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_04"); //Oba mají velmi blízko k Y´Berionovi, našemu mistrovi.
	};
//	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_05"); //I can pay you with plain ore as well if you prefer. 100 nuggets should be enough for your efforts.
//	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_05"); //Ich kann dich aber auch mit schnödem Erz bezahlen, wenn das dein Wunsch ist. 100 Brocken sollten für deine Mühe genügen.
	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_05"); //Můžu ti ale také zaplatit přímo rudou, když budeš chtít. 100 nugetů by ti za tvou snahu mělo stačit.
};

// ************************************************************
// Gib mir Kraut
// ************************************************************
	var int BaalKAgan_VerteilKraut;
// ************************************************************

instance DIA_BaalKagan_GimmeKraut(C_INFO)
{
	npc = Nov_1332_BaalKagan;
	nr = 3;
	condition = DIA_BaalKagan_GimmeKraut_Condition;
	information = DIA_BaalKagan_GimmeKraut_Info;
	permanent = 0;
//	description = "Okay, give me the weed. Who do you want me to give it to?";
//	description = "Okay, gib her das Kraut. An wen soll ich es verteilen?";
	description = "Dobrá, dej mi tu drogu. Komu chceš, abych ji předal?";
};                       

func int DIA_BaalKagan_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WasDrin))
	{
		return 1;
	};
};

func void DIA_BaalKagan_GimmeKraut_Info()
{ 
//	AI_Output(other,self,"DIA_BaalKagan_GimmeKraut_15_00"); //Okay, give me the weed. Who do you want me to give it to?
//	AI_Output(other,self,"DIA_BaalKagan_GimmeKraut_15_00"); //Okay, gib her das Kraut. An wen soll ich es verteilen?
	AI_Output(other,self,"DIA_BaalKagan_GimmeKraut_15_00"); //Dobrá, dej mi tu drogu. Komu chceš, abych ji předal?
//	AI_Output(self,other,"DIA_BaalKagan_GimmeKraut_13_01"); //You're sure to find someone who'll take it. Talk to people. But only give ONE stalk to each person.
//	AI_Output(self,other,"DIA_BaalKagan_GimmeKraut_13_01"); //Du findest sicher leicht Abnehmer. Rede mit den Leuten. Aber gib jedem nur EINEN Stengel.
	AI_Output(self,other,"DIA_BaalKagan_GimmeKraut_13_01"); //Jistě někoho najdeš, kdo ji bude chtít. Řekni lidem. Ale dávej pouze po JEDNÉ lodyze na osobu.
//	AI_Output(self,other,"DIA_BaalKagan_GimmeKraut_13_02"); //One more thing: If you let somebody take the weed from you or if you smoke it yourself,our deal ceases to exist.
//	AI_Output(self,other,"DIA_BaalKagan_GimmeKraut_13_02"); //Noch was: Wenn du dir das Kraut abnehmen lässt oder es selber rauchst, gilt unsere Abmachung nicht mehr.
	AI_Output(self,other,"DIA_BaalKagan_GimmeKraut_13_02"); //A ještě důležitá věc: jestli si tu drogu necháš od někoho sebrat, nebo ji vykouříš sám, naše domluva padá.
//	AI_Output(other,self,"DIA_BaalKagan_GimmeKraut_15_03"); //Sure.
//	AI_Output(other,self,"DIA_BaalKagan_GimmeKraut_15_03"); //Sicher.
	AI_Output(other,self,"DIA_BaalKagan_GimmeKraut_15_03"); //Jistě.
	BaalKagan_VerteilKraut = LOG_RUNNING;

	Log_CreateTopic(CH1_SpreadJoints,LOG_MISSION);
	Log_SetTopicStatus(CH1_SpreadJoints,LOG_RUNNING);
//	B_LogEntry(CH1_SpreadJoints,"The novice Baal Kagan gave me 10 stalks of Green Novice weed, which I have to distribute in the New Camp."); 
//	B_LogEntry(CH1_SpreadJoints,"Der Novize Baal Kagan hat mir 10 Stengel Sumpfkraut Grüner Novize gegeben, die ich im Neuen Lager verteilen soll."); 
	B_LogEntry(CH1_SpreadJoints,"Novic Baal Kagan mi předal 10 lodyh drogy od mladých noviců, které musím rozdat v Novém táboře. "); 

	CreateInvItems(self,itmijoint_1, 10);
	B_GiveInvItems(self,hero,itmijoint_1, 10);
};

// ************************************************************
// SUCCESS
// ************************************************************

instance DIA_BaalKagan_SUCCESS(C_INFO)
{
	npc = Nov_1332_BaalKagan;
	nr = 3;
	condition = DIA_BaalKagan_SUCCESS_Condition;
	information = DIA_BaalKagan_SUCCESS_Info;
	permanent = 1;
//	description = "I've shared out the weed.";
//	description = "Ich habe das Kraut verteilt";
	description = "Rozdal jsem všechnu drogu.";
};                       

func int DIA_BaalKagan_SUCCESS_Condition()
{
	if (BaalKagan_VerteilKraut==LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_BaalKagan_SUCCESS_Info()
{ 
//	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_15_00"); //I've shared out the weed.
//	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_15_00"); //Ich habe das Kraut verteilt.
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_15_00"); //Rozdal jsem všechnu drogu.
	if (NC_Joints_verteilt >= 8)
	{
//		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_13_01"); //The first new customers have already been to see me. You've done a good job.
//		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_13_01"); //Die ersten neuen Kunden waren schon bei mir. Du hast gute Arbeit geleistet.
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_13_01"); //První noví zákazníci mě už navštívili. Odvedl jsi výbornou práci.
//		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_13_02"); //What will you have as a reward?
//		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_13_02"); //Wie soll deine Belohnung aussehen.
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_13_02"); //Co budeš chtít za odměnu?

		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
//		Info_AddChoice(DIA_BaalKagan_SUCCESS,"I'll take the ore.",DIA_BaalKagan_SUCCESS_Erz);
//		Info_AddChoice(DIA_BaalKagan_SUCCESS," "Ich nehme das Erz."	",DIA_BaalKagan_SUCCESS_Erz);
		Info_AddChoice(DIA_BaalKagan_SUCCESS,"Vezmu si rudu.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
//			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Help me to join the Brotherhood.",DIA_BaalKagan_SUCCESS_Join);
//			Info_AddChoice(DIA_BaalKagan_SUCCESS," "Hilf mir, in der Bruderschaft aufgenommen zu werden."	",DIA_BaalKagan_SUCCESS_Join);
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Pomoz mi vstoupit do Bratrstva.",DIA_BaalKagan_SUCCESS_Join);
		};
//		Info_AddChoice(DIA_BaalKagan_SUCCESS,"These spell scrolls are quite interesting - what kind of spells are they?",DIA_BaalKagan_SUCCESS_WhatSpells);
//		Info_AddChoice(DIA_BaalKagan_SUCCESS," "Die Spruchrollen interessieren mich - was sind das für Sprüche?"	",DIA_BaalKagan_SUCCESS_WhatSpells);
		Info_AddChoice(DIA_BaalKagan_SUCCESS,"Tyto kouzelné svitky jsou také docela zajímavé - jaký druh kouzla mají?",DIA_BaalKagan_SUCCESS_WhatSpells);

		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_SpreadJoints,LOG_SUCCESS);
//		B_LogEntry(CH1_SpreadJoints,"Baal Kagan has new customers and I have my reward.");
//		B_LogEntry(CH1_SpreadJoints,"Baal Kagan hat neue Kunden und ich meine Belohnung.");
		B_LogEntry(CH1_SpreadJoints,"Baal Kagan má nové zákazníky a já svoji odměnu.");
		B_GiveXP(XP_DistributedWeedForKagan);
	}
	else
	{
//		AI_Output(self,other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //I haven't seen any new customers yet. Share out some more.
//		AI_Output(self,other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Ich habe noch keinen neuen Kunden hier gesehen. Verteil mehr.
		AI_Output(self,other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Neviděl jsem žádného nového zákazníka. Rozdej ještě další.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
//	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //These spell scrolls are quite interesting - what kind of spells are they?
//	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Die Spruchrollen interessieren mich - was sind das für Sprüche?
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Tyto kouzelné svitky jsou také docela zajímavé - jaký druh kouzla mají?
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Fist of Wind, Charm, Telekinesis, Pyrokinesis and Sleep. You may pick three of these spells.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Windfaust, Charme, Telekinese, Pyrokinese und Schlaf. Von diesen Sprüchen darfst du drei wählen.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Větrnou pěst, telekinezi, pyrokinezi a spánek. Můžeš si vybrat tři z nich.
//	Info_AddChoice(DIA_BaalKagan_SUCCESS,"I'll take the three spell scrolls.",DIA_BaalKagan_SUCCESS_TakeScrolls);
//	Info_AddChoice(DIA_BaalKagan_SUCCESS," "Ich nehme die drei Spruchrollen."	",DIA_BaalKagan_SUCCESS_TakeScrolls);
	Info_AddChoice(DIA_BaalKagan_SUCCESS,"Vezmu si tři kouzelné svitky.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
//	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Help me to join the Brotherhood.
//	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Hilf mir, in der Bruderschaft aufgenommen zu werden.
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Pomoz mi vstoupit do Bratrstva.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Your request is modest. I'll help you, so listen to me. Baal Tyon is one of the lower Gurus - just like myself.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Deine Bitte ist bescheiden. Ich werde dir helfen, hör gut zu. Baal Tyon ist einer der niederen Gurus - so wie ich.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Tvůj požadavek je maličkost. Pomůžu ti, tak mě poslouchej. Baal Tyon je jedním z Guru - právě tak jako já.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y'Berion has made him one of his advisors. That has not done him any good.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y'Berion hat ihn zu einem seiner Berater gemacht. Das ist ihm nicht bekommen.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y´Berion ho jmenoval jedním ze svých rádců. To se nemělo stát.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //He now thinks he's so important that he'll talk to nobody but his disciples.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Er hält sich jetzt für so wichtig, dass er mit niemanden außer seinen Schülern mehr redet.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Myslí si teď, že je velmi důležitý, a proto nemluví s nikým jiným než se svými žáky.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //If you give him this here, it'll loosen his tongue.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Wenn du ihm das hier gibst, wird sich seine Zunge lösen.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Když mu dáš tohle, rozváže mu to jazyk.
	CreateInvItem       (self,SpecialJoint);
	B_GiveInvItems(self,other,SpecialJoint,1);

	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
//	B_LogEntry(CH1_JoinPsi,"Baal Kagan gave me a special DREAMCALL for Baal Tyon. That'll help me to join the Brotherhood of the sect.");
//	B_LogEntry(CH1_JoinPsi,"Baal Kagan hat mir einen speziell präparierten TRAUMRUF für Baal Tyon gegeben. Es wird mir helfen in die Bruderschaft der Sekte aufgenommen zu werden.");
	B_LogEntry(CH1_JoinPsi,"Baal Kagan mi předal speciální PŘIVOLÁVAČ SNŮ pro Baala Tyona. To mi pomůže přidat se k sektě Bratrstva.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
//	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //I'll take the 100 ore.
//	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Ich nehme die 100 Erz.
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Vezmu si těch 100 nugetů.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Very well. Here.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Wie du willst. Hier.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Velmi dobře. Tady.

	CreateInvItems(self,itminugget, 100);
	B_GiveInvItems(self,other,itminugget, 100);
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
//	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //I'll take the spell scrolls.
//	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Ich nehme die Spruchrollen.
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Vezmu si ty kouzelné svitky.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //A good decision. Pick three.
//	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Eine gute Entscheidung. Wähle drei aus.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Dobré rozhodnutí. Vem si tři.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
//	Info_AddChoice(DIA_BaalKagan_SUCCESS,"Fist of Wind",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
//	Info_AddChoice(DIA_BaalKagan_SUCCESS," "Windfaust"	",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice(DIA_BaalKagan_SUCCESS,"Úder větru.",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
//	Info_AddChoice(DIA_BaalKagan_SUCCESS,"Telekinesis",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
//	Info_AddChoice(DIA_BaalKagan_SUCCESS," "Telekinese"	",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice(DIA_BaalKagan_SUCCESS,"Telekineze.",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
//	Info_AddChoice(DIA_BaalKagan_SUCCESS,"Pyrokinesis",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
//	Info_AddChoice(DIA_BaalKagan_SUCCESS," "Pyrokinese"	",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice(DIA_BaalKagan_SUCCESS,"Pyrokineze.",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
//	Info_AddChoice(DIA_BaalKagan_SUCCESS,"Sleep",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
//	Info_AddChoice(DIA_BaalKagan_SUCCESS," "Schlaf."		",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice(DIA_BaalKagan_SUCCESS,"Spánek.",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
//	Info_AddChoice(DIA_BaalKagan_SUCCESS,"Charm",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
//	Info_AddChoice(DIA_BaalKagan_SUCCESS," "Charme"		",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
	Info_AddChoice(DIA_BaalKagan_SUCCESS,"Šarm.",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
};
//-----------------------------------------------------------------------
	var int BaalKagan_drei;
//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust()
{
	CreateInvItem(self,ItArScrollWindfist);
	B_GiveInvItems(self,hero,ItArScrollWindfist,1);

	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)  
	{ 
//		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //That was three. Use them wisely.
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices(DIA_BaalKagan_SUCCESS); 
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese()
{
	CreateInvItem(self,ItArScrollTelekinesis);
	B_GiveInvItems(self,hero,ItArScrollTelekinesis,1);

	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)  
	{ 
//		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //That was three. Use them wisely.
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices(DIA_BaalKagan_SUCCESS); 
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese()
{
	CreateInvItem(self,ItArScrollPyrokinesis);
	B_GiveInvItems(self,hero,ItArScrollPyrokinesis,1);

	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)  
	{ 
//		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //That was three. Use them wisely.
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices(DIA_BaalKagan_SUCCESS); 
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf()
{
	CreateInvItem(self,ItArScrollSleep);
	B_GiveInvItems(self,hero,ItArScrollSleep,1);

	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)  
	{ 
//		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //That was three. Use them wisely.
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices(DIA_BaalKagan_SUCCESS); 
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Charme()
{
	CreateInvItem(self,ItArScrollCharm);
	B_GiveInvItems(self,hero,ItArScrollCharm,1);

	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)  
	{ 
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //That was three. Use them wisely.
		Info_ClearChoices(DIA_BaalKagan_SUCCESS); 
	};
};

