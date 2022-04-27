// ****************************************
// 					Exit
// ****************************************

instance DIA_Butch_Exit(C_INFO)
{
	npc = ORG_851_Butch;
	nr = 999;
	condition = DIA_Butch_Exit_Condition;
	information = DIA_Butch_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Butch_Exit_Condition()
{
	return 1;
};

func void DIA_Butch_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance DIA_Butch_Hello(C_INFO)
{
	npc = Org_851_Butch;
	nr = 1;
	condition = DIA_Butch_Hello_Condition;
	information = DIA_Butch_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "Hi. Who are you?";
//	description = "Hi. Wer bist du?";
	description = "Kdo jsi?";
};

func int DIA_Butch_Hello_Condition()
{
	return 1;
};

func void DIA_Butch_Hello_Info()
{
//	AI_Output(other,self,"DIA_Butch_Hello_15_00"); //Hi. Who are you?
//	AI_Output(other,self,"DIA_Butch_Hello_15_00"); //Hi. Wer bist du?
	AI_Output(other,self,"DIA_Butch_Hello_15_00"); //Zdar! Kdo jsi?
//	AI_Output(self,other,"DIA_Butch_Hello_13_01"); //It's none of your business! I don't like your mug!
//	AI_Output(self,other,"DIA_Butch_Hello_13_01"); //Das geht dich einen Dreck an! Deine Fresse gefällt mir nicht!
	AI_Output(self,other,"DIA_Butch_Hello_13_01"); //Po tom ti nic není! Nelíbí se mi tvůj ciferník!
	AI_StopProcessInfos(self);
};
