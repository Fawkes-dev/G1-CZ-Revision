// ************************ EXIT **************************

instance Org_843_Sharky_Exit(C_INFO)
{
	npc = Org_843_Sharky;
	nr = 999;
	condition = Org_843_Sharky_Exit_Condition;
	information = Org_843_Sharky_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Org_843_Sharky_Exit_Condition()
{
	return 1;
};

func void Org_843_Sharky_Exit_Info()
{
	AI_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
						HANDEL
------------------------------------------------------------------------*/

instance Org_843_Sharky_Fisk(C_INFO)
{
	npc = Org_843_Sharky;
	nr = 2;
	condition = Org_843_Sharky_Fisk_Condition;
	information = Org_843_Sharky_Fisk_Info;
	permanent = 0;
//	description = "Fisk from the Old Camp is looking for a new trading partner.";
//	description = "Fisk aus dem Alten Lager sucht nach einem neuen Handelspartner.";
	description = "Fisk ze Starého tábora hledá nového obchodního partnera.";
	trade = 1;
};

func int Org_843_Sharky_Fisk_Condition()
{
	if (Fisk_GetNewHehler == LOG_RUNNING)
	{
		return TRUE;
	};

};
func void Org_843_Sharky_Fisk_Info()
{
//	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_00"); //Fisk from the Old Camp is looking for a new trading partner.
//	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_00"); //Fisk aus dem Alten Lager ist auf der Suche nach einem neuen Handelspartner.
	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_00"); //Fisk ze Starého tábora hledá nového obchodního partnera.
//	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_01"); //And why are you telling me about it?
//	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_01"); //Und warum erzählst du mir das?
	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_01"); //A proč mi to říkáš?
//	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_02"); //I thought you might be interested in earning some ore.
//	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_02"); //Ich dachte, du hättest vielleicht Lust, ein bisschen Erz zu verdienen.
	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_02"); //Myslel jsem si, že bys mohl mít zájem vydělat si nějakou rudu.
//	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_03"); //Why not... tell Fisk he can count on me in the next few days.
//	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_03"); //Warum nicht ... Sag Fisk, er kann in den nächsten Tagen mit mir rechnen.
	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_03"); //Proč ne... řekni Fiskovi, že se mnou může během pár dní počítat.
};

/*------------------------------------------------------------------------
						HANDEL
------------------------------------------------------------------------*/

instance Org_843_Sharky_TRADE(C_INFO)
{
	npc = Org_843_Sharky;
	condition = Org_843_Sharky_TRADE_Condition;
	information = Org_843_Sharky_TRADE_Info;
	important = 0;
	permanent = 1;
//	description = "I need a few things...";
//	description = "Ich könnte ein paar Sachen gebrauchen";
	description = "Potřebuji pár věcí...";
	trade = 1;
};

func int Org_843_Sharky_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,Org_843_Sharky_GREET))
	{
		return TRUE;
	};

};
func void Org_843_Sharky_TRADE_Info()
{
//	AI_Output(other,self,"Org_843_Sharky_TRADE_Info_15_01"); //I need a few things...
//	AI_Output(other,self,"Org_843_Sharky_TRADE_Info_15_01"); //Ich könnte ein paar Sachen gebrauchen ...
	AI_Output(other,self,"Org_843_Sharky_TRADE_Info_15_01"); //Potřebuji pár věcí...
};

/*------------------------------------------------------------------------
							TRADE BEGRÜßUNG
------------------------------------------------------------------------*/

instance Org_843_Sharky_GREET(C_INFO)
{
	npc = Org_843_Sharky;
	condition = Org_843_Sharky_GREET_Condition;
	information = Org_843_Sharky_GREET_Info;
	important = 0;
	permanent = 0;
//	description = "Hey, how's it going?";
//	description = "Hey, wie siehts aus?";
	description = "Jak to jde?";
};

func int Org_843_Sharky_GREET_Condition()
{
	return TRUE;
};

func void Org_843_Sharky_GREET_Info()
{
//	AI_Output(other,self,"Org_843_Sharky_GREET_Info_15_01"); //Hey, how's it going?
//	AI_Output(other,self,"Org_843_Sharky_GREET_Info_15_01"); //Hey, wie sieht's aus?
	AI_Output(other,self,"Org_843_Sharky_GREET_Info_15_01"); //Hej, jak to jde?
//	AI_Output(self,other,"Org_843_Sharky_GREET_Info_10_02"); //Do you want to buy something?
//	AI_Output(self,other,"Org_843_Sharky_GREET_Info_10_02"); //Willst du was kaufen?
	AI_Output(self,other,"Org_843_Sharky_GREET_Info_10_02"); //Chceš si něco koupit?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
//	B_LogEntry(GE_TraderNC,"Sharky, the rogue, deals with WEAPONS and other goods. He is usually somewhere in the New Camp.");
//	B_LogEntry(GE_TraderNC,"Sharky der Bandit, handelt mit WAFFEN und anderen Waren. Er hält sich meistens irgendwo im Neuen Lager auf.");
	B_LogEntry(GE_TraderNC,"Bandita Sharky obchoduje se ZBRANĚMI a jiným zbožím. Obvykle je k nalezení v Novém táboře.");
};

