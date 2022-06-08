// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Org_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_13 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Mine_Org_13_EXIT_Condition;
	information = Info_Mine_Org_13_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Org_13_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 							Mine
// *************************************************************************

instance Info_Mine_Org_13_Mine(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Org_13_Mine_Condition;
	information = Info_Mine_Org_13_Mine_Info;
	important = 0;
	permanent = 1;
//	description = "Tell me something about this camp.";
//	description = "Erzähl mir mal was über das Camp hier.";
	description = "Řekni mi něco o táboře.";
};

func int Info_Mine_Org_13_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_Mine_Info()
{
//	AI_Output(other,self,"Info_Mine_Org_13_Mine_15_00"); //Tell me something about this camp.
//	AI_Output(other,self,"Info_Mine_Org_13_Mine_15_00"); //Erzähl mir mal was über das Lager hier.
	AI_Output(other, self, "Info_Mine_Org_13_Mine_15_00"); //Řekni mi něco o táboře.
//	AI_Output(self,other,"Info_Mine_Org_13_Mine_13_01"); //This hole in the rock is gonna get us out of here. Once we have enough ore, we can forget about the Old Camp.
//	AI_Output(self,other,"Info_Mine_Org_13_Mine_13_01"); //Dieses Felsloch wird uns hier raus bringen. Wenn wir erst genug Erz haben, kann uns das Alte Lager egal sein.
	AI_Output(self, other, "Info_Mine_Org_13_Mine_13_01"); //TA díra ve skále nás odsud dostane. Jakmile budeme mít dost rudy, může nám být Starý tábor ukradený.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Org_13_WichtigePersonen(C_INFO)
{
	nr = 1;
	condition = Info_Mine_Org_13_WichtigePersonen_Condition;
	information = Info_Mine_Org_13_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who gives the orders here?";
//	description = "Wer gibt hier die Befehle?";
	description = "Kdo tady dává rozkazy?";
};

func int Info_Mine_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Org_13_WichtigePersonen_15_00"); //Who gives the orders here?
//	AI_Output(other,self,"Info_Mine_Org_13_WichtigePersonen_15_00"); //Wer gibt hier die Befehle?
	AI_Output(other, self, "Info_Mine_Org_13_WichtigePersonen_15_00"); //Kdo tady dává rozkazy?
//	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_01"); //Okyl calls the shots.
//	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_01"); //Okyl hat hier das Sagen.
	AI_Output(self, other, "Info_Mine_Org_13_WichtigePersonen_13_01"); //Okyl to tady vede.
//	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_02"); //But he usually leaves us rogues alone.
//	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_02"); //Aber uns Banditen lässt er meist ins Ruhe.
	AI_Output(self, other, "Info_Mine_Org_13_WichtigePersonen_13_02"); //Nás bandity ale obvykle nechává na pokoji.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Org_13_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Org_13_DieLage_Condition;
	information = Info_Mine_Org_13_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "Are you okay?";
//	description = "Alles klar bei Dir?";
	description = "Jsi v pořádku?";
};

func int Info_Mine_Org_13_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Org_13_DieLage_15_00"); //Are you okay?
//	AI_Output(other,self,"Info_Mine_Org_13_DieLage_15_00"); //Alles klar bei dir?
	AI_Output(other, self, "Info_Mine_Org_13_DieLage_15_00"); //Jsi v pořádku?
//	AI_Output(self,other,"Info_Mine_Org_13_DieLage_13_01");//No worse than yesterday.
//	AI_Output(self,other,"Info_Mine_Org_13_DieLage_13_01");//Nicht schlechter als gestern.
	AI_Output(self, other, "Info_Mine_Org_13_DieLage_13_01"); //Včera bylo hůř.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_Org_13(var C_Npc slf)
{
	Info_Mine_Org_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_DieLage.npc = Hlp_GetInstanceID(slf);
};
