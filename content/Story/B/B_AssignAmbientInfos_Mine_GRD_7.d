// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Mine_Grd_7_EXIT_Condition;
	information = Info_Mine_Grd_7_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Grd_7_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Grd_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 							Mine
// *************************************************************************

instance Info_Mine_Grd_7_Mine(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Grd_7_Mine_Condition;
	information = Info_Mine_Grd_7_Mine_Info;
	important = 0;
	permanent = 1;
//	description = "Tell me about the mine.";
//	description = "Erzähl mir von der Mine";
	description = "Řekni mi něco o dole.";
};

func int Info_Mine_Grd_7_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_Mine_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_7_Mine_15_00"); //Tell me about the mine.
//	AI_Output(other,self,"Info_Mine_Grd_7_Mine_15_00"); //Erzähl mir von der Mine
	AI_Output(other, self, "Info_Mine_Grd_7_Mine_15_00"); //Povídej mi o dole.
//	AI_Output(self,other,"Info_Mine_Grd_7_Mine_07_01"); //The diggers collect the ore and we protect them from the crawlers.
//	AI_Output(self,other,"Info_Mine_Grd_7_Mine_07_01"); //Die Buddler schürfen das Erz und wir beschützen sie vor den Crawlern.
	AI_Output(self, other, "Info_Mine_Grd_7_Mine_07_01"); //Kopáči rubou rudu a my je chráníme před červy.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Grd_7_WichtigePersonen(C_INFO)
{
	nr = 1;
	condition = Info_Mine_Grd_7_WichtigePersonen_Condition;
	information = Info_Mine_Grd_7_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Mine_Grd_7_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_7_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Mine_Grd_7_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other, self, "Info_Mine_Grd_7_WichtigePersonen_15_00"); //Kdo to tady vede?
//	AI_Output(self,other,"Info_Mine_Grd_7_WichtigePersonen_07_01"); //Ian and Asghan. if you want anything, you'd better talk to them.
//	AI_Output(self,other,"Info_Mine_Grd_7_WichtigePersonen_07_01"); //Ian und Asghan. Wende dich an sie, wenn du was willst.
	AI_Output(self, other, "Info_Mine_Grd_7_WichtigePersonen_07_01"); //Ian a Asghan. Když něco chceš, měl bys jim to říci.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

instance Info_Mine_Grd_7_Minecrawler(C_INFO)
{
	nr = 1;
	condition = Info_Mine_Grd_7_Minecrawler_Condition;
	information = Info_Mine_Grd_7_Minecrawler_Info;
	important = 0;
	permanent = 1;
//	description = "What do you know about the crawlers?";
//	description = "Weißt Du was über die Crawler?";
	description = "Co víš o červech.";
};

func int Info_Mine_Grd_7_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_Minecrawler_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_7_Minecrawler_15_00"); //What do you know about the crawlers?
//	AI_Output(other,self,"Info_Mine_Grd_7_Minecrawler_15_00"); //Weißt du was über die Crawler?
	AI_Output(other, self, "Info_Mine_Grd_7_Minecrawler_15_00"); //Co si myslíš o červech?
//	AI_Output(self,other,"Info_Mine_Grd_7_Minecrawler_07_01"); //The whole lot of 'em should be wiped out, if you ask me!
//	AI_Output(self,other,"Info_Mine_Grd_7_Minecrawler_07_01"); //Die ganze Brut sollte man ausrotten!
	AI_Output(self, other, "Info_Mine_Grd_7_Minecrawler_07_01"); //Spousta by jich měla být vyhlazena, pokud se ptáš mě!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Grd_7_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Grd_7_DieLage_Condition;
	information = Info_Mine_Grd_7_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How are you?";
//	description = "Wie steht's?";
	description = "Jak to jde?";
};

func int Info_Mine_Grd_7_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_7_DieLage_15_00"); //How are you?
//	AI_Output(other,self,"Info_Mine_Grd_7_DieLage_15_00"); //Wie steht's?
	AI_Output(other, self, "Info_Mine_Grd_7_DieLage_15_00"); //Jak se máš?
//	AI_Output(self,other,"Info_Mine_Grd_7_DieLage_07_01"); //Man, you're getting on my nerves!
//	AI_Output(self,other,"Info_Mine_Grd_7_DieLage_07_01"); //Mann, geh mir nicht auf den Sack!
	AI_Output(self, other, "Info_Mine_Grd_7_DieLage_07_01"); //Chlape, hraješ mi na nervy!
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_grd_7(var C_Npc slf)
{
	Info_Mine_Grd_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_DieLage.npc = Hlp_GetInstanceID(slf);
};
