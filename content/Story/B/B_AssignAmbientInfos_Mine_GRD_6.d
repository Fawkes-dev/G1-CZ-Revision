// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Grd_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Grd_6 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Mine_Grd_6_EXIT_Condition;
	information = Info_Mine_Grd_6_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Grd_6_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Grd_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

instance Info_Mine_Grd_6_Mine(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Grd_6_Mine_Condition;
	information = Info_Mine_Grd_6_Mine_Info;
	important = 0;
	permanent = 1;
//	description = "What goes on in the mine?";
//	description = "Was läuft in der Mine?";
	description = "Co se v tom dole děje?";
};

func int Info_Mine_Grd_6_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_6_Mine_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_6_Mine_15_00"); //What goes on in the mine?
//	AI_Output(other,self,"Info_Mine_Grd_6_Mine_15_00"); //Was läuft in der Mine?
	AI_Output(other,self,"Info_Mine_Grd_6_Mine_15_00"); //Co se v tom dole děje?
//	AI_Output(self,other,"Info_Mine_Grd_6_Mine_06_01"); //The diggers collect the ore and if they don't, they get a good beating!
//	AI_Output(self,other,"Info_Mine_Grd_6_Mine_06_01"); //Die Buddler schürfen das Erz und wenn sie das nicht tun, dann gibt's was aufs Maul!
	AI_Output(self,other,"Info_Mine_Grd_6_Mine_06_01"); //Kopáči rubou rudu a pokud ne, dostanou nakládačku!

};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Grd_6_WichtigePersonen(C_INFO)
{
	nr = 1;
	condition = Info_Mine_Grd_6_WichtigePersonen_Condition;
	information = Info_Mine_Grd_6_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Mine_Grd_6_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_6_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_6_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Mine_Grd_6_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other,self,"Info_Mine_Grd_6_WichtigePersonen_15_00"); //Kdo to tady vede?
//	AI_Output(self,other,"Info_Mine_Grd_6_WichtigePersonen_06_01"); //Asghan's our boss, but Ian organizes things, like ore and the diggers.
//	AI_Output(self,other,"Info_Mine_Grd_6_WichtigePersonen_06_01"); //Asghan ist unser Chef, Ian kümmert sich um die ganze Organisation, Erz und Buddler.
	AI_Output(self,other,"Info_Mine_Grd_6_WichtigePersonen_06_01"); //Asghan je náš šéf, ale Ian se stará o věci jako jsou kopáči a ruda.

};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

instance Info_Mine_Grd_6_Minecrawler(C_INFO)
{
	nr = 1;
	condition = Info_Mine_Grd_6_Minecrawler_Condition;
	information = Info_Mine_Grd_6_Minecrawler_Info;
	important = 0;
	permanent = 1;
//	description = "Tell me about the crawlers.";
//	description = "Erzähl mir was von den Crawlern";
	description = "Řekni mi něco o červech.";
};

func int Info_Mine_Grd_6_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_6_Minecrawler_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_6_Minecrawler_15_00"); //Tell me about the crawlers.
//	AI_Output(other,self,"Info_Mine_Grd_6_Minecrawler_15_00"); //Erzähl mir was von den Crawlern.
	AI_Output(other,self,"Info_Mine_Grd_6_Minecrawler_15_00"); //Řekni mi něco o červech.
//	AI_Output(self,other,"Info_Mine_Grd_6_Minecrawler_06_01"); //Those beasts are nothing but trouble. I don't know what causes us more work, those creatures or the diggers.
//	AI_Output(self,other,"Info_Mine_Grd_6_Minecrawler_06_01"); //Die Drecksviecher machen uns das Leben schwer. Ich weiß nicht, wer mehr Arbeit macht, die Viecher oder die Buddler.
	AI_Output(self,other,"Info_Mine_Grd_6_Minecrawler_06_01"); //Ty bestie představují jenom problémy. Nevím, co nám přidělává víc práce, jestli ty potvory nebo kopáči.

};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Grd_6_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Grd_6_DieLage_Condition;
	information = Info_Mine_Grd_6_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Mine_Grd_6_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_6_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Grd_6_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_Mine_Grd_6_DieLage_15_00"); //Wie siehts aus?
	AI_Output(other,self,"Info_Mine_Grd_6_DieLage_15_00"); //Jak to jde?
// 	AI_Output(self,other,"Info_Mine_Grd_6_DieLage_06_01"); //Well, what do you think?
// 	AI_Output(self,other,"Info_Mine_Grd_6_DieLage_06_01"); //Ja, was glaubst du?
 	AI_Output(self,other,"Info_Mine_Grd_6_DieLage_06_01"); //No, co si myslíš?
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_GRD_6(var c_NPC slf)
{
	Info_Mine_Grd_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_DieLage.npc = Hlp_GetInstanceID(slf);
};
