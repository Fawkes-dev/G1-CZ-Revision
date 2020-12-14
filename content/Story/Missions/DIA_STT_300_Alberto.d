// ************************ EXIT **************************

instance STT_300_Alberto_Exit(C_INFO)
{
	npc = STT_300_Alberto;
	nr = 999;
	condition = STT_300_Alberto_Exit_Condition;
	information = STT_300_Alberto_Exit_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int STT_300_Alberto_Exit_Condition()
{
	return 1;
};

func void STT_300_Alberto_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ***************** Infos *****************************

instance STT_300_Alberto_BUY(C_INFO)
{
	npc = STT_300_Alberto;
	condition = STT_300_Alberto_BUY_Condition;
	information = STT_300_Alberto_BUY_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE; 
	Trade = 1;
};

func int STT_300_Alberto_BUY_Condition()
{
	return 1;
};

func void STT_300_Alberto_BUY_Info()
{
//	AI_Output(other,self,"STT_300_Alberto_BUY_Info_15_01"); //Can I trade things with you?
//	AI_Output(other,self,"STT_300_Alberto_BUY_Info_15_01"); //Bei dir kann ich tauschen?
	AI_Output(other,self,"STT_300_Alberto_BUY_Info_15_01"); //Můžu s tebou něco vyměnit?
//	AI_Output(self,other,"STT_300_Alberto_BUY_Info_12_02"); //Yep. Anything you want. If you have ore.
//	AI_Output(self,other,"STT_300_Alberto_BUY_Info_12_02"); //Jupp. Alles, was du willst. Wenn du Erz hast.
	AI_Output(self,other,"STT_300_Alberto_BUY_Info_12_02"); //Jistě. Cokoliv chceš, jestli máš rudu.

};  
