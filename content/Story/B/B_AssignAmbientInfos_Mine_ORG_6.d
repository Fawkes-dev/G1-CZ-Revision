// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Org_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_6 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Mine_Org_6_EXIT_Condition;
	information = Info_Mine_Org_6_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Org_6_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

instance Info_Mine_Org_6_Mine(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Org_6_Mine_Condition;
	information = Info_Mine_Org_6_Mine_Info;
	important = 0;
	permanent = 1;
//	description = "What goes on in the mine?";
//	description = "Was läuft in der Mine?";
	description = "Co se v tom dole děje?";
};

func int Info_Mine_Org_6_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_Mine_Info()
{
//	AI_Output(other,self,"Info_Mine_Org_6_Mine_15_00"); //What goes on in the mine?
//	AI_Output(other,self,"Info_Mine_Org_6_Mine_15_00"); //Was läuft in der Mine?
	AI_Output(other, self, "Info_Mine_Org_6_Mine_15_00"); //Co se v tom dole děje?
//	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_01"); //In the mine? The guys in there stay there. No-one gets in, and no-one gets out.
//	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_01"); //In der Mine? Die Typen da drin sind unter sich, es kommt keiner rein und keiner raus.
	AI_Output(self, other, "Info_Mine_Org_6_Mine_06_01"); //V tom dole? Chlapi tam zůstávají. Nikdo nechodí dovnitř, nikdo ven.
//	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_02"); //You just be glad you're out.
//	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_02"); //Man kann froh sein, dass wir hier draußen sind.
	AI_Output(self, other, "Info_Mine_Org_6_Mine_06_02"); //Měl bys být rád, že jsi venku.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Org_6_WichtigePersonen(C_INFO)
{
	nr = 1;
	condition = Info_Mine_Org_6_WichtigePersonen_Condition;
	information = Info_Mine_Org_6_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who gives the orders here?";
//	description = "Wer erteilt hier die Befehle?";
	description = "Kdo tady dává rozkazy?";
};

func int Info_Mine_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_00"); //Who gives the orders here?
//	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_00"); //Wer erteilt hier die Befehle?
	AI_Output(other, self, "Info_Mine_Org_6_WichtigePersonen_15_00"); //Kdo tady dává rozkazy?
//	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_01"); //Nobody gives me orders, but you have to know how to get there.
//	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_01"); //Mir erteilt hier niemand Befehle, aber man muss schon wissen, wie man das anstellt.
	AI_Output(self, other, "Info_Mine_Org_6_WichtigePersonen_06_01"); //Nikdo mi nedává rozkazy, ale musíš vědět, jak si to zařídit.
//	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_01"); //And how do you get there?
//	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_01"); //Und wie stellt man das an?
	AI_Output(other, self, "Info_Mine_Org_6_WichtigePersonen_15_01"); //A jak se to zařídí?
//	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_02"); //That's a trade secret! But between you and me, it ain't all that hard for a rogue.
//	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_02"); //Berufsgeheimnis! Aber unter uns, als Bandit ist das gar nicht so schwer.
	AI_Output(self, other, "Info_Mine_Org_6_WichtigePersonen_06_02"); //To je staré tajemství! Ale mezi náma, pro banditu to není nic těžkého.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Org_6_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Org_6_DieLage_Condition;
	information = Info_Mine_Org_6_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "You don't exactly seem to be overworking yourself.";
//	description = "Scheinst Dich ja nicht gerade zu überarbeiten.";
	description = "Nevypadáš, že bys byl právě přepracovaný.";
};

func int Info_Mine_Org_6_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Org_6_DieLage_15_00"); //You don't exactly seem to be overworking yourself.
//	AI_Output(other,self,"Info_Mine_Org_6_DieLage_15_00"); //Scheinst dich ja nicht gerade zu überarbeiten.
	AI_Output(other, self, "Info_Mine_Org_6_DieLage_15_00"); //Nevypadáš, že bys byl právě přepracovaný.
// 	AI_Output(self,other,"Info_Mine_Org_6_DieLage_06_01"); //Me, work? if I was a working man, I wouldn't be in the Dome, if you know what I mean.
// 	AI_Output(self,other,"Info_Mine_Org_6_DieLage_06_01"); //Ich und arbeiten? Wenn ich arbeiten würde, wäre ich nicht hier in der Kuppel, wenn du verstehst was ich meine.
	AI_Output(self, other, "Info_Mine_Org_6_DieLage_06_01"); //Já a práce?! Pokud já jsem pracoval, pak to nebylo v Paláci, jestli mi rozumíš.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_Org_6(var C_Npc slf)
{
	Info_Mine_Org_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_DieLage.npc = Hlp_GetInstanceID(slf);
};
