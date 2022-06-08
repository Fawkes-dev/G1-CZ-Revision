// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									Vor Gespräch
// *************************************************************************

instance Info_SFB_2_Pre(C_INFO)
{
	nr = 1;
	condition = Info_SFB_2_Pre_Condition;
	information = Info_SFB_2_Pre_Info;
	important = 1;
	permanent = 0;
};

func int Info_SFB_2_Pre_Condition()
{
	return 1;
};

func void Info_SFB_2_Pre_Info()
{
//	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_00"); //What do you want? I don't want to get into any trouble.
//	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_00"); //Was willst du hier. Ich habe keine Lust, irgendwelchen Ärger zu bekommen.
	AI_Output(self, other, "Info_SFB_2_EinerVonEuchWerden_02_00"); //Co chceš? Nechci se dostat do maléru.
};

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_SFB_2_EXIT(C_INFO)
{
	nr = 999;
	condition = Info_SFB_2_EXIT_Condition;
	information = Info_SFB_2_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_SFB_2_EXIT_Condition()
{
	return 1;
};

func void Info_SFB_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_SFB_2_EinerVonEuchWerden(C_INFO)
{
	nr = 4;
	condition = Info_SFB_2_EinerVonEuchWerden_Condition;
	information = Info_SFB_2_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "What do I have to do to join you?";
//	description = "Was muss ich tun, um bei euch mitzumachen?";
	description = "Co musím udělat, abych se k vám mohl přidat?";
};

func int Info_SFB_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_SFB_2_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_SFB_2_EinerVonEuchWerden_15_00"); //What do I have to do to join you?
//	AI_Output(other,self,"Info_SFB_2_EinerVonEuchWerden_15_00"); //Was muss ich tun, um bei euch mitzumachen?
	AI_Output(other, self, "Info_SFB_2_EinerVonEuchWerden_15_00"); //Co musím udělat, abych se k vám mohl přidat?
//	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_01"); //I can't help you there. I'm small fry. Talk to Swiney.
//	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_01"); //Ich kann dir da nicht weiterhelfen. Ich bin hier nur 'ne kleine Nummer. Sprich mit Swiney.
	AI_Output(self, other, "Info_SFB_2_EinerVonEuchWerden_02_01"); //Tady ti nepomůžu. Jsem jenom malý pán. Řekni Swineymu.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_SFB_2_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_SFB_2_WichtigePersonen_Condition;
	information = Info_SFB_2_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who's in charge here.";
//	description = "Wer hat hier was zu sagen?";
	description = "Kdo to tady má na starosti?";
};

func int Info_SFB_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_SFB_2_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_SFB_2_WichtigePersonen_15_00"); //Who's in charge here?
//	AI_Output(other,self,"Info_SFB_2_WichtigePersonen_15_00"); //Wer hat hier was zu sagen?
	AI_Output(other, self, "Info_SFB_2_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_01"); //The mercenaries are in charge here in the Hollow. But not so much in the New Camp.
//	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_01"); //Hier im Kessel haben die Söldner das Sagen. Im Neuen Lager sieht das schon anders aus.
	AI_Output(self, other, "Info_SFB_2_WichtigePersonen_02_01"); //Tady v kotlině hlídkují žoldáci. Ale v Novém táboře jich tolik není.
//	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_02"); //So watch who you mess with.
//	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_02"); //Also pass gut auf, mit wem du dich anlegst.
	AI_Output(self, other, "Info_SFB_2_WichtigePersonen_02_02"); //Dávej pozor, s kým jednáš.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_SFB_2_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_SFB_2_DasLager_Condition;
	information = Info_SFB_2_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "I need to know more about the Camp.";
//	description = "Ich will mehr über dieses Lager erfahren.";
	description = "Potřebuji se o tomto táboře dozvědět víc.";
};

func int Info_SFB_2_DasLager_Condition()
{
	return 1;
};

func void Info_SFB_2_DasLager_Info()
{
//	AI_Output(other,self,"Info_SFB_2_DasLager_15_00"); //I need to know more about the Camp.
//	AI_Output(other,self,"Info_SFB_2_DasLager_15_00"); //Ich will mehr über dieses Lager erfahren.
	AI_Output(other, self, "Info_SFB_2_DasLager_15_00"); //Tady v kotlině hlídkují žoldáci. Ale v Novém táboře jich tolik není.
//	AI_Output(self,other,"Info_SFB_2_DasLager_02_01"); //I don't know that I can help you. You'd better have a word with Swiney or the mercenaries.
//	AI_Output(self,other,"Info_SFB_2_DasLager_02_01"); //Ich weiß nicht, ob ich dir da weiterhelfen kann, sprich am besten mit Swiney oder mit den Söldnern.
	AI_Output(self, other, "Info_SFB_2_DasLager_02_01"); //Nevím, jestli ti můžu pomoci. Lepší bude, když promluvíš se Swineym nebo s žoldáky.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_SFB_2_DieLage(C_INFO)
{
	nr = 1;
	condition = Info_SFB_2_DieLage_Condition;
	information = Info_SFB_2_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "What's life like here?";
//	description = "Wie ist das Leben hier?";
	description = "Jak se tady žije?";
};

func int Info_SFB_2_DieLage_Condition()
{
	return 1;
};

func void Info_SFB_2_DieLage_Info()
{
//	AI_Output(other,self,"Info_SFB_2_DieLage_15_00"); //What's life like here?
//	AI_Output(other,self,"Info_SFB_2_DieLage_15_00"); //Wie ist das Leben hier?
	AI_Output(other, self, "Info_SFB_2_DieLage_15_00"); //Jak se tady žije?
//	AI_Output(self,other,"Info_SFB_2_DieLage_02_01"); //I'm not complaining. We all have to do our share.
//	AI_Output(self,other,"Info_SFB_2_DieLage_02_01"); //Ich will mich nicht beklagen. Wir haben alle unseren Teil zu tragen.
	AI_Output(self, other, "Info_SFB_2_DieLage_02_01"); //Nestěžuju si. Musíme tady všichni držet spolu.
//	AI_Output(self,other,"Info_SFB_2_DieLage_02_02"); //At least work is better here than in the Old Camp.
//	AI_Output(self,other,"Info_SFB_2_DieLage_02_02"); //Aber zumindest ist es hier besser als im Alten Lager.
	AI_Output(self, other, "Info_SFB_2_DieLage_02_02"); //Aspoň práce je tady lepší než ve Starém táboře.
//	AI_Output(self,other,"Info_SFB_2_DieLage_02_03"); //Are you from the Old Camp?
//	AI_Output(self,other,"Info_SFB_2_DieLage_02_03"); //Kommst du aus dem Alten Lager?
	AI_Output(self, other, "Info_SFB_2_DieLage_02_03"); //Ty jsi ze Starého tábora?
//	AI_Output(self,other,"Info_SFB_2_DieLage_02_04"); //if you're from the Old Camp, just you remember I don't want any trouble!
//	AI_Output(self,other,"Info_SFB_2_DieLage_02_04"); //Wenn du aus dem Alten Lager kommst, ich will keinen Ärger!
	AI_Output(self, other, "Info_SFB_2_DieLage_02_04"); //Jestli jsi ze Starého tábora, tak si pamatuj, že tady nechci žádné problémy!
	AI_StopProcessInfos(self);
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_SFB_2(var C_Npc slf)
{
	Info_SFB_2_Pre.npc = Hlp_GetInstanceID(slf);

	Info_SFB_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_SFB_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_SFB_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_SFB_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_SFB_2_DieLage.npc = Hlp_GetInstanceID(slf);
};
