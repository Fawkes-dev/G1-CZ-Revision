// ************************************************************
//	  EXIT 
// ************************************************************

instance DIA_Senyan_EXIT(C_INFO)
{
	npc = SFB_1000_Senyan;
	nr = 999;
	condition = DIA_Senyan_EXIT_Condition;
	information = DIA_Senyan_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Senyan_EXIT_Condition()
{
	return 1;
};

func void DIA_Senyan_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

// ************************************************************
// Hallo
// ************************************************************

instance DIA_Senyan_Hello(C_INFO)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = DIA_Senyan_Hello_Condition;
	information = DIA_Senyan_Hello_Info;
	permanent = 0;
//	description = "You're from the Free Mine, right?";
//	description = "Du kommst aus der Freien Mine, richtig?";
	description = "Ty jsi ze Svobodného dolu, že jo?";
};                       

func int DIA_Senyan_Hello_Condition()
{
	return 1;
};

func void DIA_Senyan_Hello_Info()
{ 
//	AI_Output(other,self,"DIA_Senyan_Hello_15_00"); //You're from the Free Mine, right?
//	AI_Output(other,self,"DIA_Senyan_Hello_15_00"); //Du kommst aus der Freien Mine, richtig?
	AI_Output(other,self,"DIA_Senyan_Hello_15_00"); //Ty jsi ze Svobodného dolu, že jo?
//	AI_Output(self,other,"DIA_Senyan_Hello_01_01"); //Right. How did you find that out?
//	AI_Output(self,other,"DIA_Senyan_Hello_01_01"); //Richtig. Wie hast du das bloß rausgefunden?
	AI_Output(self,other,"DIA_Senyan_Hello_01_01"); //Ano. Jak jsi na to přišel?
	AI_StopProcessInfos(self);
};

// ************************************************************
// Hallo
// ************************************************************

instance DIA_Senyan_JustTalk(C_INFO)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = DIA_Senyan_JustTalk_Condition;
	information = DIA_Senyan_JustTalk_Info;
	permanent = 1;
//	description = "I just want to talk to you.";
//	description = "Ich will nur mit dir reden.";
	description = "Chci s tebou mluvit.";
};                       

func int DIA_Senyan_JustTalk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Senyan_Hello))
	{
		return 1;
	};
};

func void DIA_Senyan_JustTalk_Info()
{ 
//	AI_Output(other,self,"DIA_Senyan_JustTalk_15_00"); //I just want to talk to you.
//	AI_Output(other,self,"DIA_Senyan_JustTalk_15_00"); //Ich will nur mit dir reden.
	AI_Output(other,self,"DIA_Senyan_JustTalk_15_00"); //Chci s tebou mluvit.
//	AI_Output(self,other,"DIA_Senyan_JustTalk_01_01"); //I'm not here to talk.
//	AI_Output(self,other,"DIA_Senyan_JustTalk_01_01"); //Ich bin nicht zum Reden hier.
	AI_Output(self,other,"DIA_Senyan_JustTalk_01_01"); //Nejsem tu kvůli mluvení.
	AI_StopProcessInfos(self);
};
