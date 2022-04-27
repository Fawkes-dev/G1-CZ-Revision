// ****************************************
// 					Exit
// ****************************************

instance DIA_Shrike_Exit(C_INFO)
{
	npc = ORG_842_Shrike;
	nr = 999;
	condition = DIA_Shrike_Exit_Condition;
	information = DIA_Shrike_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Shrike_Exit_Condition()
{
	return 1;
};

func void DIA_Shrike_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance DIA_Shrike_Hello(C_INFO)
{
	npc = Org_842_Shrike;
	nr = 1;
	condition = DIA_Shrike_Hello_Condition;
	information = DIA_Shrike_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "How are things?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int DIA_Shrike_Hello_Condition()
{
	return 1;
};

func void DIA_Shrike_Hello_Info()
{
//	AI_Output(other,self,"DIA_Shrike_Hello_15_00"); //How are things?
//	AI_Output(other,self,"DIA_Shrike_Hello_15_00"); //Wie sieht's aus?
	AI_Output(other,self,"DIA_Shrike_Hello_15_00"); //Jak to jde?
//	AI_Output(self,other,"DIA_Shrike_Hello_07_01"); //Get lost!
//	AI_Output(self,other,"DIA_Shrike_Hello_07_01"); //Verpiss dich!
	AI_Output(self,other,"DIA_Shrike_Hello_07_01"); //Ztrať se!

	//FMTaken = TRUE; //******* TEST - Helper für Sld-KdW Aufnahme!!! *********************
	//Kapitel = 4;

	AI_StopProcessInfos(self);
};

// ****************************************
// 					GetLost
// ****************************************

instance DIA_Shrike_GetLost(C_INFO)
{
	npc = Org_842_Shrike;
	nr = 1;
	condition = DIA_Shrike_GetLost_Condition;
	information = DIA_Shrike_GetLost_Info;
	important = 0;
	permanent = 0;
//	description = "Get lost.";
//	description = "Mach, dass du wegkommst.";
	description = "Ztrať se.";
};

func int DIA_Shrike_GetLost_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC])
	{
		return 1;
	};

	return 0;
};

func void DIA_Shrike_GetLost_Info()
{
//	AI_Output(other,self,"DIA_Shrike_GetLost_15_00"); //Get lost.
//	AI_Output(other,self,"DIA_Shrike_GetLost_15_00"); //Mach, dass du wegkommst.
	AI_Output(other,self,"DIA_Shrike_GetLost_15_00"); //Ztrať se.
//	AI_Output(self,other,"DIA_Shrike_GetLost_07_01"); //I'll talk to you later!
//	AI_Output(self,other,"DIA_Shrike_GetLost_07_01"); //Wir sprechen uns noch!
	AI_Output(self,other,"DIA_Shrike_GetLost_07_01"); //Ještě si popovídáme!

	Log_CreateTopic(CH1_ShrikesHut,LOG_MISSION);
	Log_SetTopicStatus(CH1_ShrikesHut,LOG_RUNNING);
//	B_LogEntry(CH1_ShrikesHut,"I was able to convince Shrike to get another hut. I'm really curious what Gorn will have to say to that.");
//	B_LogEntry(CH1_ShrikesHut,"Ich konnte Shrike davon 'überzeugen' sich eine andere Hütte zu suchen. Mal gespannt, was Gorn dazu sagt.");
	B_LogEntry(CH1_ShrikesHut,"Podařilo se přesvědčit Shrika, aby si našel jinou chatrč. Jsem zvědav, co na to řekne Gorn.");
	B_GiveXP(XP_KickedShrike);

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self,"start");
};
