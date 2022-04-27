// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Mine_Vlk_4_EXIT_Condition;
	information = Info_Mine_Vlk_4_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Vlk_4_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Die Mine
// *************************************************************************

instance Info_Mine_Vlk_4_Mine(C_INFO) // E1
{
	nr = 4;
	condition = Info_Mine_Vlk_4_Mine_Condition;
	information = Info_Mine_Vlk_4_Mine_Info;
	important = 0;
	permanent = 1;
//	description = "Tell me about the mine.";
//	description = "Erzähl mir was von der Mine";
	description = "Řekni mi něco o dole.";
};

func int Info_Mine_Vlk_4_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_4_Mine_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_4_Mine_15_00"); //Tell me about the mine.
//	AI_Output(other,self,"Info_Mine_Vlk_4_Mine_15_00"); //Erzähl mir was von der Mine
	AI_Output(other,self,"Info_Mine_Vlk_4_Mine_15_00"); //Povídej mi o dole.
//	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01"); //Pickaxes and sweat. That's what you get in here. You come, you go.
//	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01"); //Eine Spitzhacke und Schweiß. Das brauchst du hier drin. Du kommst hier rein und du gehst auch wieder.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01"); //Krumpáče a pot. To jediné tady je. Nastoupíš a makáš.
//	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_02"); //But, when you're long gone, I'll still be here, hewing the ore from the rock. That's my job, and my life.
//	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_02"); //Aber, wenn du längst weg bist, werde ich hier immer noch das Erz aus dem Berg schlagen. Das ist meine Aufgabe. Das ist mein Leben.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_02"); //Ty už budeš dávno pryč a já tu budu pořád rubat ze skály rudu. To je moje práce, můj život.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Vlk_4_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Mine_Vlk_4_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_4_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who's in charge here?";
//	description = "Wer hat hier was zu Sagen?";
	description = "Kdo to tady má na starosti?";
};

func int Info_Mine_Vlk_4_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_4_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_4_WichtigePersonen_15_00"); //Who's in charge here?
//	AI_Output(other,self,"Info_Mine_Vlk_4_WichtigePersonen_15_00"); //Wer hat hier was zu sagen?
	AI_Output(other,self,"Info_Mine_Vlk_4_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_Mine_Vlk_4_WichtigePersonen_01_01"); //Santino and Alberto swap goods for the ore that we dig. They give us our daily rations.
//	AI_Output(self,other,"Info_Mine_Vlk_4_WichtigePersonen_01_01"); //Santino und Alberto tauschen Waren gegen das Erz, das wir schürfen. Von ihnen bekommen wir unsere täglichen Rationen.
	AI_Output(self,other,"Info_Mine_Vlk_4_WichtigePersonen_01_01"); //Santino a Alberto vyměňují zboží za rudu, kterou vytěžíme. Od nich dostáváme denní příděly.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Mine_Vlk_4_Minecrawler(C_INFO)
{
	nr = 2;
	condition = Info_Mine_Vlk_4_Minecrawler_Condition;
	information = Info_Mine_Vlk_4_Minecrawler_Info;
	important = 0;
	permanent = 1;
//	description = "What do you know about minecrawlers?";
//	description = "Was weißt Du über Minecrawler?";
	description = "Co víš o červech?";
};

func int Info_Mine_Vlk_4_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_4_Minecrawler_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_4_Minecrawler_15_00"); //What do you know about minecrawlers?
//	AI_Output(other,self,"Info_Mine_Vlk_4_Minecrawler_15_00"); //Was weißt du über Minecrawler?
	AI_Output(other,self,"Info_Mine_Vlk_4_Minecrawler_15_00"); //Co víš o důlních červech?
//	AI_Output(self,other,"Info_Mine_Vlk_4_Minecrawler_01_01"); //If you see one of them crawler scum, whack it between the eyes with your pickaxe. But you have to take good aim, you won't get no second chance.
//	AI_Output(self,other,"Info_Mine_Vlk_4_Minecrawler_01_01"); //Wenn eins von den Crawlerviechern ankommt, dann schlag es mit der Spitze zwischen die Augen. Aber du musst beim ersten Mal treffen, eine zweite Chance gibt es nicht.
	AI_Output(self,other,"Info_Mine_Vlk_4_Minecrawler_01_01"); //Jakmile uvidíš nějakého červa před sebou, musíš ho praštit krumpáčem mezi oči. Když špatně míříš, druhou šanci už nedostaneš.

};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Vlk_4_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Vlk_4_DieLage_Condition;
	information = Info_Mine_Vlk_4_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How are you?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Mine_Vlk_4_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_4_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_4_DieLage_15_00"); //How are you?
//	AI_Output(other,self,"Info_Mine_Vlk_4_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other,self,"Info_Mine_Vlk_4_DieLage_15_00"); //Jak se máš?
//	AI_Output(self,other,"Info_Mine_Vlk_4_DieLage_01_01"); //I've been better.
//	AI_Output(self,other,"Info_Mine_Vlk_4_DieLage_01_01"); //Früher war alles besser.
	AI_Output(self,other,"Info_Mine_Vlk_4_DieLage_01_01"); //Je to lepší.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_Vlk_4(var c_NPC slf)
{
	Info_Mine_Vlk_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_DieLage.npc = Hlp_GetInstanceID(slf);
};
