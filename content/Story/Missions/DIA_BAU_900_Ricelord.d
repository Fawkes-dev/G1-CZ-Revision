// ************************************************************
//	  EXIT
// ************************************************************

instance DIA_Ricelord_EXIT(C_INFO)
{
	npc = Bau_900_Ricelord;
	nr = 999;
	condition = DIA_Ricelord_EXIT_Condition;
	information = DIA_Ricelord_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Ricelord_EXIT_Condition()
{
	return 1;
};

func void DIA_Ricelord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// Hallo
// ************************************************************

instance DIA_Ricelord_Hello(C_INFO)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Hello_Condition;
	information = DIA_Ricelord_Hello_Info;
	permanent = 0;
//	description = "You take care of the rice fields, don't you?";
//	description = "Du kümmerst dich um die Reisfelder, richtig?";
	description = "Staráš se o rýžová pole, že jo?";
};

func int DIA_Ricelord_Hello_Condition()
{
	return 1;
};

func void DIA_Ricelord_Hello_Info()
{
//	AI_Output(other,self,"DIA_Ricelord_Hello_15_00"); //You take care of the rice fields, don't you?
//	AI_Output(other,self,"DIA_Ricelord_Hello_15_00"); //Du kümmerst dich um die Reisfelder, richtig?
	AI_Output(other,self,"DIA_Ricelord_Hello_15_00"); //Staráš se o rýžová pole, že jo?
//	AI_Output(self,other,"DIA_Ricelord_Hello_12_01"); //Why? You looking for work?
//	AI_Output(self,other,"DIA_Ricelord_Hello_12_01"); //Warum? Suchst du Arbeit?
	AI_Output(self,other,"DIA_Ricelord_Hello_12_01"); //Proč? Sháníš práci?
};

// ************************************************************
// Arbeit
// ************************************************************

instance DIA_Ricelord_Arbeit(C_INFO)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Arbeit_Condition;
	information = DIA_Ricelord_Arbeit_Info;
	permanent = 0;
//	description = "Have you got work for me?";
//	description = "Hast du Arbeit für mich?";
	description = "Máš pro mě nějakou práci?";
};

func int DIA_Ricelord_Arbeit_Condition()
{
	if Npc_KnowsInfo(hero,DIA_Ricelord_Hello)
	&& !Npc_KnowsInfo(hero,DIA_Lefty_First)
	&& (LeftyDead == False)
	{
		return 1;
	};
};

func void DIA_Ricelord_Arbeit_Info()
{
//	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00"); //Have you got work for me?
//	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00"); //Hast du Arbeit für mich?
	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00"); //Máš pro mě nějakou práci?
//	AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01"); //Go and see Lefty. He's usually to the right of the shed.
//	AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01"); //Geh zu Lefty. Er ist meistens hier vorne rechts neben der Scheune.
	AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01"); //Běž za Leftym. Obvykle bývá napravo od stodoly.
};

// ************************************************************
// TRADE
// ************************************************************

instance DIA_Ricelord_TRADE(C_INFO)
{
	npc = Bau_900_Ricelord;
	nr = 800;
	condition = DIA_Ricelord_TRADE_Condition;
	information = DIA_Ricelord_TRADE_Info;
	permanent = 1;
//	description = "We could make a deal...";
//	description = "Wir könnten handeln...";
	description = "Můžeme uzavřít smlouvu.";
	trade = 1;
};

func int DIA_Ricelord_TRADE_Condition()
{
// if (Npc_KnowsInfo(hero,DIA_Ricelord_Hello))
// {
// return 1;
// };
};

func void DIA_Ricelord_TRADE_Info()
{
//	AI_Output(other,self,"DIA_Ricelord_TRADE_15_00"); //We could make a deal...
//	AI_Output(other,self,"DIA_Ricelord_TRADE_15_00"); //Wir könnten handeln ...
	AI_Output(other,self,"DIA_Ricelord_TRADE_15_00"); //Můžeme uzavřít smlouvu.
//	AI_Output(self,other,"DIA_Ricelord_TRADE_12_01"); //What have you got to offer?
//	AI_Output(self,other,"DIA_Ricelord_TRADE_12_01"); //Was hast du denn zu bieten?
	AI_Output(self,other,"DIA_Ricelord_TRADE_12_01"); //Co mi můžeš nabídnout?
};

// ************************************************************
// Lefty Mission
// ************************************************************
instance DIA_Ricelord_LeftySentMe(C_INFO)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_LeftySentMe_Condition;
	information = DIA_Ricelord_LeftySentMe_Info;
	permanent = 1;
//	description = "Lefty sent me.";
//	description = "Lefty schickt mich.";
	description = "Poslal mě Lefty.";
};

func int DIA_Ricelord_LeftySentMe_Condition()
{
	if Npc_KnowsInfo(hero,DIA_Ricelord_Hello)
	&& (Lefty_Mission == LOG_RUNNING)
	&& (Ricelord_AskedForWater == FALSE)
	&& (LeftyDead == False)
	{
		return 1;
	};
};

func void DIA_Ricelord_LeftySentMe_Info()
{
//	AI_Output(other,self,"DIA_Ricelord_LeftySentMe_15_00"); //Lefty sent me.
//	AI_Output(other,self,"DIA_Ricelord_LeftySentMe_15_00"); //Lefty schickt mich.
	AI_Output(other,self,"DIA_Ricelord_LeftySentMe_15_00"); //Poslal mě Lefty.
//	AI_Output(self,other,"DIA_Ricelord_LeftySentMe_12_01"); //Oh yeah. What did he say?
//	AI_Output(self,other,"DIA_Ricelord_LeftySentMe_12_01"); //Ach so. Was hat er gesagt?
	AI_Output(self,other,"DIA_Ricelord_LeftySentMe_12_01"); //Aha. Co říkal?
	Ricelord_AskedForWater = TRUE;
};

// ************************************************************
// Lefty Mission
// ************************************************************

instance DIA_Ricelord_GetWater(C_INFO)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_GetWater_Condition;
	information = DIA_Ricelord_GetWater_Info;
	permanent = 1;
//	description = "I'm to bring the peasants some water.";
//	description = "Ich soll den Bauern Wasser bringen.";
	description = "Mám přinést rolníkům vodu.";
};

func int DIA_Ricelord_GetWater_Condition()
{
	if (Ricelord_AskedForWater == TRUE)
	{
		return 1;
	};
};

func void DIA_Ricelord_GetWater_Info()
{
//	AI_Output(other,self,"DIA_Ricelord_GetWater_15_00"); //I'm to bring the peasants some water.
//	AI_Output(other,self,"DIA_Ricelord_GetWater_15_00"); //Ich soll den Bauern Wasser bringen.
	AI_Output(other,self,"DIA_Ricelord_GetWater_15_00"); //Mám přinést rolníkům vodu.

	if(Lefty_WorkDay == Wld_GetDay())
	{
//		AI_Output(self,other,"DIA_Ricelord_GetWater_12_01"); //Right. Here's a dozen bottles of water.
//		AI_Output(self,other,"DIA_Ricelord_GetWater_12_01"); //Gut. Hier sind ein Dutzend Flaschen Wasser.
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_01"); //Dobře. Tady je tucet láhví vody.
//		AI_Output(self,other,"DIA_Ricelord_GetWater_12_02"); //There's about twice that amount of peasants, so make sure you share it out evenly.
//		AI_Output(self,other,"DIA_Ricelord_GetWater_12_02"); //Es gibt etwa doppelt so viele Bauern, also verteil sie gleichmäßig.
//		AI_Output(self,other,"DIA_Ricelord_GetWater_12_02"); //Je toho asi dvakrát víc než potřebují, tak dávej pozor, aby se rozdělila rovnoměrně.
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_02"); //Je tu asi dvakrát víc rolníků, tak dávej pozor, abys ji rozdělil rovnoměrně.

		CreateInvItems(self,ItFo_Potion_Water_01, 12);
		B_GiveInvItems(self,other,ItFo_Potion_Water_01, 12);

		Ricelord_AskedForWater = FALSE;
//		B_LogEntry(CH1_CarryWater,"The Rice Lord gave me a dozen water bottles.");
//		B_LogEntry(CH1_CarryWater,"Der Reislord gab mir ein Dutzend Wasserflaschen.");
		B_LogEntry(CH1_CarryWater,"Rýžový lord mi dal tucet lahví s vodou.");

		AI_StopProcessInfos(self);
	}
	else if (Lefty_WorkDay == Wld_GetDay()-1)
	{
//		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_00"); //That was yesterday, lad! You'd better go to him. He has something to tell you.
//		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_00"); //Das war gestern, Bursche! Geh besser zu ihm. Er hat dir was zu sagen.
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_00"); //To bylo včera, hochu! Bude lepší, když za ním zajdeš. Musí ti něco říci.
		AI_StopProcessInfos(self);
	}
	else
	{
//		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_01"); //That was a few days ago, lad! You'd better go to him. He has something to tell you.
//		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_01"); //Das war vor einigen Tagen, Bursche! Geh besser zu ihm. Er hat dir was zu sagen.
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_01"); //To bylo před pár dny, hochu! Měl bys za ním jít. Musí ti něco říci.
		AI_StopProcessInfos(self);
	};
};

