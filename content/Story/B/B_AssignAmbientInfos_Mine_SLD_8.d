// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Sld_8_EXIT(C_INFO)
{
	nr = 999;
	condition = Info_Mine_Sld_8_EXIT_Condition;
	information = Info_Mine_Sld_8_EXIT_Info;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Sld_8_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Sld_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Mine_Sld_8_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Mine_Sld_8_EinerVonEuchWerden_Condition;
	information = Info_Mine_Sld_8_EinerVonEuchWerden_Info;
	permanent = 1;
//	description = "How can I join this squad?";
//	description = "Wie kann ich diesem Trupp hier beitreten?";
	description = "Jak se můžu dostat k téhle četě?";
};

func int Info_Mine_Sld_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_8_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Mine_Sld_8_EinerVonEuchWerden_15_00"); //How can I join this squad?
//	AI_Output(other,self,"Info_Mine_Sld_8_EinerVonEuchWerden_15_00"); //Wie kann ich diesem Trupp hier beitreten?
	AI_Output(other,self,"Info_Mine_Sld_8_EinerVonEuchWerden_15_00"); //Jak se můžu dostat k téhle četě?
//	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_01"); //If you wanna work here in the Hollow, you'll have to work your way up in the New Camp first.
//	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_01"); //Um hier im Kessel zu arbeiten, musst du erst deinen Dienst im neuen Lager unter Beweis stellen.
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_01"); //Pokud pracuješ tady v Kotlině, nejprve se budeš muset propracovat do Nového tábora.
//	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_02"); //Go and ask there.
//	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_02"); //Frag dort nach.
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_02"); //Zeptej se tam.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Sld_8_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Mine_Sld_8_WichtigePersonen_Condition;
	information = Info_Mine_Sld_8_WichtigePersonen_Info;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Mine_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Sld_8_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Sld_8_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Mine_Sld_8_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other,self,"Info_Mine_Sld_8_WichtigePersonen_15_00"); //Kdo to tady vede?
//	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_01"); //Okyl's in charge here in the Hollow. Lee calls the shots in the Camp.
//	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_01"); //Hier im Kessel hat Okyl das Kommando. Im Lager hat Lee das Sagen.
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_01"); //Okyl velí v Kotlině. Lee to řídí v táboře.
//	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_02"); //So you'd better have a word with both of them.
//	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_02"); //Also wende dich am besten an diese beiden.
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_02"); //Měl bys s oběma promluvit.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Mine_Sld_8_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Mine_Sld_8_DasLager_Condition;
	information = Info_Mine_Sld_8_DasLager_Info;
	permanent = 1;
//	description = "What goes on here in the Camp?";
//	description = "Was gibt es hier im Camp?";
	description = "Co se děje v táboře?";
};

func int Info_Mine_Sld_8_DasLager_Condition()
{
	return 1;
};

func void Info_Mine_Sld_8_DasLager_Info()
{
//	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_15_00"); //What goes on here in the Camp?
//	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_15_00"); //Was gibt es hier im Camp?
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_15_00"); //Co se děje v táboře?
//	AI_Output(self,other,"Info_Mine_Sld_8_DasLager_08_01"); //We guard the entrance to the mine.
//	AI_Output(self,other,"Info_Mine_Sld_8_DasLager_08_01"); //Wir bewachen hier den Eingang zur Mine.
	AI_Output(self,other,"Info_Mine_Sld_8_DasLager_08_01"); //Střežíme vstup do dolu.
//	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_08_02"); //No-one except our people are allowed in.
//	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_08_02"); //Niemand außer unseren Leuten darf dort hinein.
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_08_02"); //Nikdo kromě našich lidí tam nesmí.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Sld_8_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Sld_8_DieLage_Condition;
	information = Info_Mine_Sld_8_DieLage_Info;
	permanent = 1;
//	description = "Okay?";
//	description = "Alles klar?";
	description = "Všechno v pořádku?";
};

func int Info_Mine_Sld_8_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Sld_8_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Sld_8_DieLage_15_00"); //Okay?
//	AI_Output(other,self,"Info_Mine_Sld_8_DieLage_15_00"); //Alles klar?
	AI_Output(other,self,"Info_Mine_Sld_8_DieLage_15_00"); //Všechno v pořádku?
//	AI_Output(self,other,"Info_Mine_Sld_8_DieLage_08_01"); //What d'you ask me that for? Everything's under control.
//	AI_Output(self,other,"Info_Mine_Sld_8_DieLage_08_01"); //Was soll die Frage? Wir haben alles unter Kontrolle.
	AI_Output(self,other,"Info_Mine_Sld_8_DieLage_08_01"); //Na co ses ptal? Máme všechno pod kontrolou.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_Sld_8(var c_NPC slf)
{
	//B_AssignFindNpcInfos(slf);

	Info_Mine_Sld_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DieLage.npc = Hlp_GetInstanceID(slf);
};
