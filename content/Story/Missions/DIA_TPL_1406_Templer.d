// **************************************************
// EXIT 
// **************************************************

instance DIA_KalomsGuard_Exit(C_INFO)
{
	npc = Tpl_1406_Templer;
	nr = 999;
	condition = DIA_KalomsGuard_Exit_Condition;
	information = DIA_KalomsGuard_Exit_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_KalomsGuard_Exit_Condition()
{
	return 1;
};

func void DIA_KalomsGuard_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// PERM
// **************************************************

instance DIA_KalomsGuard_PERM(C_INFO)
{
	npc = Tpl_1406_Templer;
	nr = 1;
	condition = DIA_KalomsGuard_PERM_Condition;
	information = DIA_KalomsGuard_PERM_Info;
	permanent = 1;
//	description = "I'm sure you won't mind my going in there...?";
//	description = "Du hast doch nichts dagegen, wenn ich da reingehe?";
	description = "Jistě nemáš nic proti tomu, abych šel dál...?";
};                       

func int DIA_KalomsGuard_PERM_Condition()
{
	return 1;
};

func void DIA_KalomsGuard_PERM_Info()
{
//	AI_Output(other,self,"DIA_KalomsGuard_PERM_15_00"); //I'm sure you won't mind me going in there...?
//	AI_Output(other,self,"DIA_KalomsGuard_PERM_15_00"); //Du hast doch nichts dagegen, wenn ich da reingehe?
	AI_Output(other,self,"DIA_KalomsGuard_PERM_15_00"); //Jistě nemáš nic proti tomu, abych šel dál...?
//	AI_Output(self,other,"DIA_KalomsGuard_PERM_13_01"); //If you're disrespectful to my master, I'll kill you.
//	AI_Output(self,other,"DIA_KalomsGuard_PERM_13_01"); //Wenn du meinem Meister keinen Respekt entgegen bringst, werde ich dich töten.
	AI_Output(self,other,"DIA_KalomsGuard_PERM_13_01"); //Jestli budeš k mému mistrovi neuctivý, zabiju tě!
	AI_StopProcessInfos(self);
};

