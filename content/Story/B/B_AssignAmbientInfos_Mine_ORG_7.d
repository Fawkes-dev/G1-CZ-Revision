// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Org_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_7 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Mine_Org_7_EXIT_Condition;
	information = Info_Mine_Org_7_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Org_7_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 							Mine
// *************************************************************************

instance Info_Mine_Org_7_Mine(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Org_7_Mine_Condition;
	information = Info_Mine_Org_7_Mine_Info;
	important = 0;
	permanent = 1;
//	description = "Tell me something about this camp.";
//	description = "Erzähl mir mal was über das Camp hier.";
	description = "Řekni mi něco o táboře.";
};

func int Info_Mine_Org_7_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_Mine_Info()
{
//	AI_Output(other,self,"Info_Mine_Org_7_Mine_15_00"); //Tell me something about this camp.
//	AI_Output(other,self,"Info_Mine_Org_7_Mine_15_00"); //Erzähl mir mal was über das Camp hier.
	AI_Output(other,self,"Info_Mine_Org_7_Mine_15_00"); //Řekni mi něco o táboře.
//	AI_Output(self,other,"Info_Mine_Org_7_Mine_07_01"); //The camp? You mean the Hollow. It ain't so bad, really. The scrapers collect ore, the mercenaries stand on guard, and we rogues keep 'em all under control.
//	AI_Output(self,other,"Info_Mine_Org_7_Mine_07_01"); //Das Camp? Du meinst den Kessel. Ist nicht so schlecht hier. Die Schürfer bauen Erz ab, die Söldner passen auf, und wir Banditen behalten hier die Übersicht
	AI_Output(self,other,"Info_Mine_Org_7_Mine_07_01"); //Tábor? Myslíš tu Kotlinu. Ale není to tak zlé, vážně. rudaři shromažďují rudu, žoldáci drží stráž a my, bandité, je máme pod kontrolou.

};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Org_7_WichtigePersonen(C_INFO)
{
	nr = 1;
	condition = Info_Mine_Org_7_WichtigePersonen_Condition;
	information = Info_Mine_Org_7_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who's in charge here then?";
//	description = "Wer hat den hier das Kommando?";
	description = "Kdo to tady má na starosti?";
};

func int Info_Mine_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Org_7_WichtigePersonen_15_00"); //Who's in charge here then?
//	AI_Output(other,self,"Info_Mine_Org_7_WichtigePersonen_15_00"); //Wer hat den hier das Kommando?
	AI_Output(other,self,"Info_Mine_Org_7_WichtigePersonen_15_00"); //Kdo to má pak na starosti?
//	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_01"); //That depends on who you take your orders from.
//	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_01"); //Das kommt drauf an, von wem du dir was sagen lässt.
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_01"); //To záleží na tom, od koho přijímáš rozkazy.
//	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_02"); //Whatever, if Okyl wants something, you'll do well not to object. He can get pretty ugly when he's pissed off.
//	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_02"); //Wenn Okyl etwas von dir will, solltest du allerdings nicht widersprechen. Er kann nämlich ziemlich ungemütlich werden.
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_02"); //Ať je to jak chce, pokud Okyl něco chce, neměl bys nic namítat. Dokáže být pěkně nepříjemný, když se naštve.

};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Org_7_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Org_7_DieLage_Condition;
	information = Info_Mine_Org_7_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How are you?";
//	description = "Wie steht's?";
	description = "Jak to jde?";
};

func int Info_Mine_Org_7_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Org_7_DieLage_15_00"); //How are you?
//	AI_Output(other,self,"Info_Mine_Org_7_DieLage_15_00"); //Wie steht's?
	AI_Output(other,self,"Info_Mine_Org_7_DieLage_15_00"); //Jak se máš?
//	AI_Output(self,other,"Info_Mine_Org_7_DieLage_07_01"); //Man, you're getting on my nerves!
//	AI_Output(self,other,"Info_Mine_Org_7_DieLage_07_01"); //Mann, geh mir nicht auf den Sack!
	AI_Output(self,other,"Info_Mine_Org_7_DieLage_07_01"); //Chlape, hraješ mi na nervy!
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_Org_7(var c_NPC slf)
{
	Info_Mine_Org_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_DieLage.npc = Hlp_GetInstanceID(slf);
};
