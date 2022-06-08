// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Grd_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_13 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Mine_Grd_13_EXIT_Condition;
	information = Info_Mine_Grd_13_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Grd_13_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Grd_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

instance Info_Mine_Grd_13_Mine(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Grd_13_Mine_Condition;
	information = Info_Mine_Grd_13_Mine_Info;
	important = 0;
	permanent = 1;
//	description = "What goes on in the mine?";
//	description = "Was läuft in der Mine?";
	description = "Co se v tom dole děje?";
};

func int Info_Mine_Grd_13_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_Mine_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_13_Mine_15_00"); //What goes on in the mine?
//	AI_Output(other,self,"Info_Mine_Grd_13_Mine_15_00"); //Was läuft in der Mine?
	AI_Output(other, self, "Info_Mine_Grd_13_Mine_15_00"); //Co se v tom dole děje?
//	AI_Output(self,other,"Info_Mine_Grd_13_Mine_13_01"); //The mine's the heart of the Old Camp. No mine, no ore. No ore, no goods. Get it?
//	AI_Output(self,other,"Info_Mine_Grd_13_Mine_13_01"); //Die Mine ist das Herz des Alten Lagers. Ohne Mine kein Erz, ohne Erz keine Waren. Alles klar?
	AI_Output(self, other, "Info_Mine_Grd_13_Mine_13_01"); //Tenhle důl je srdce Starého tábora. Žádný důl, žádná ruda. Žádná ruda, žádné zboží. Chápeš?
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Grd_13_WichtigePersonen(C_INFO)
{
	nr = 1;
	condition = Info_Mine_Grd_13_WichtigePersonen_Condition;
	information = Info_Mine_Grd_13_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Mine_Grd_13_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_13_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Mine_Grd_13_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other, self, "Info_Mine_Grd_13_WichtigePersonen_15_00"); //Kdo to tady vede?
//	AI_Output(self,other,"Info_Mine_Grd_13_WichtigePersonen_13_01"); //Asghan's our boss. But you leave him alone. Ian's the one that deals with guys like you.
//	AI_Output(self,other,"Info_Mine_Grd_13_WichtigePersonen_13_01"); //Asghan ist unser Chef. Aber lass ihn bloß in Ruhe. Für Typen wie dich ist Ian zuständig.
	AI_Output(self, other, "Info_Mine_Grd_13_WichtigePersonen_13_01"); //Asghan je náš šéf. Ale ty ho nech na pokoji. Ian je z těch, co si to s takovými, jako jsi ty, vyřídí.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

instance Info_Mine_Grd_13_DasLager(C_INFO)
{
	nr = 1;
	condition = Info_Mine_Grd_13_DasLager_Condition;
	information = Info_Mine_Grd_13_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "Tell me about the crawlers.";
//	description = "Erzähl mir was über die Crawler";
	description = "Řekni mi něco o červech.";
};

func int Info_Mine_Grd_13_DasLager_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_DasLager_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_13_DasLager_15_00"); //Tell me about the crawlers.
//	AI_Output(other,self,"Info_Mine_Grd_13_DasLager_15_00"); //Erzähl mir was über die Crawler.
	AI_Output(other, self, "Info_Mine_Grd_13_DasLager_15_00"); //Řekni mi něco o červech.
//	AI_Output(self,other,"Info_Mine_Grd_13_DasLager_13_01"); //The Brotherhood pays the Old Camp in swampweed, so they let them hunt crawlers in the mine.
//	AI_Output(self,other,"Info_Mine_Grd_13_DasLager_13_01"); //Die Bruderschaft bezahlt das Alte Lager mit Sumpfkraut, damit sie hier in der Mine die Crawler jagen dürfen.
	AI_Output(self, other, "Info_Mine_Grd_13_DasLager_13_01"); //Bratrstvo zaplatilo Starému táboru drogou z bažin, a tak je nechají v dolech lovit červy.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Grd_13_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Grd_13_DieLage_Condition;
	information = Info_Mine_Grd_13_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How's things?";
//	description = "Wie läuft's?";
	description = "Jak to jde?";
};

func int Info_Mine_Grd_13_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_13_DieLage_15_00"); //How's things?
//	AI_Output(other,self,"Info_Mine_Grd_13_DieLage_15_00"); //Wie läuft's?
	AI_Output(other, self, "Info_Mine_Grd_13_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Mine_Grd_13_DieLage_13_01"); //I ain't had a fight in ages!
//	AI_Output(self,other,"Info_Mine_Grd_13_DieLage_13_01"); //Hab schon lange keinen Kampf mehr gehabt!
	AI_Output(self, other, "Info_Mine_Grd_13_DieLage_13_01"); //Už jsem se století nerval!
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_grd_13(var C_Npc slf)
{
	Info_Mine_Grd_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DieLage.npc = Hlp_GetInstanceID(slf);
};
