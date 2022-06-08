// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Vlk_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_3 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Mine_Vlk_3_EXIT_Condition;
	information = Info_Mine_Vlk_3_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Vlk_3_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

instance Info_Mine_Vlk_3_Mine(C_INFO) // E1
{
	nr = 4;
	condition = Info_Mine_Vlk_3_Mine_Condition;
	information = Info_Mine_Vlk_3_Mine_Info;
	important = 0;
	permanent = 1;
//	description = "Tell me about the mine.";
//	description = "Erzähl mir was von der Mine";
	description = "Řekni mi něco o dole.";
};

func int Info_Mine_Vlk_3_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_Mine_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_3_Mine_15_00"); //Tell me about the mine.
//	AI_Output(other,self,"Info_Mine_Vlk_3_Mine_15_00"); //Erzähl mir was von der Mine
	AI_Output(other, self, "Info_Mine_Vlk_3_Mine_15_00"); //Povídej mi o dole.
//	AI_Output(self,other,"Info_Mine_Vlk_3_Mine_01_01"); //We all have to work hard for weeks on end, we never get to see the light of day. There is no escape. The only way out is death.
//	AI_Output(self,other,"Info_Mine_Vlk_3_Mine_01_01"); //Wir müssen alle arbeiten. Wochenlang ohne Tageslicht. Es gibt kein Entkommen. Die einzige Freiheit ist der Tod.
	AI_Output(self, other, "Info_Mine_Vlk_3_Mine_01_01"); //Celý týden musíme tvrdě pracovat a nikdy se nedočkáme denního světla. Není úniku. Jediná cesta odtud je smrt.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Vlk_3_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Mine_Vlk_3_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_3_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier was zu Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Mine_Vlk_3_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_3_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Mine_Vlk_3_WichtigePersonen_15_00"); //Wer hat hier was zu sagen?
	AI_Output(other, self, "Info_Mine_Vlk_3_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_Mine_Vlk_3_WichtigePersonen_01_01"); //Ian's the boss of the mine. Asghan's in charge of the guards.
//	AI_Output(self,other,"Info_Mine_Vlk_3_WichtigePersonen_01_01"); //Ian ist der Chef der Mine. Asghan befehligt die Gardisten.
	AI_Output(self, other, "Info_Mine_Vlk_3_WichtigePersonen_01_01"); //Ian je můj šéf. Asghan je velitel stráže.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

instance Info_Mine_Vlk_3_Minecrawler(C_INFO)
{
	nr = 2;
	condition = Info_Mine_Vlk_3_Minecrawler_Condition;
	information = Info_Mine_Vlk_3_Minecrawler_Info;
	important = 0;
	permanent = 1;
//	description = "What do you know about minecrawlers?";
//	description = "Was weißt Du über Minecrawler?";
	description = "Co víš o červech?";
};

func int Info_Mine_Vlk_3_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_Minecrawler_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_3_Minecrawler_15_00"); //What do you know about minecrawlers?
//	AI_Output(other,self,"Info_Mine_Vlk_3_Minecrawler_15_00"); //Was weißt du über Minecrawler?
	AI_Output(other, self, "Info_Mine_Vlk_3_Minecrawler_15_00"); //Co víš o důlních červech?
//	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_01"); //You mean what's the best way of dealin' with crawlers? Run. Run as fast as your legs will carry you.
//	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_01"); //Die beste Art mit den Crawlern fertig zu werden? Lauf. Lauf, so schnell deine Beine dich tragen.
	AI_Output(self, other, "Info_Mine_Vlk_3_Minecrawler_01_01"); //Jak se nejlíp vypořádat s červy? Útěkem. Utíkat, co ti síly stačí.
//	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_02"); //if you go missing, it's too late. Not that anyone's likely to miss you.
//	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_02"); //Wenn du vermisst wirst, ist es eh zu spät. Aber dich wird sowieso keiner vermissen.
	AI_Output(self, other, "Info_Mine_Vlk_3_Minecrawler_01_02"); //Když se netrefíš, je konec. Takže nesmíš nikdy minout.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Vlk_3_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Vlk_3_DieLage_Condition;
	information = Info_Mine_Vlk_3_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Mine_Vlk_3_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_3_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_Mine_Vlk_3_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other, self, "Info_Mine_Vlk_3_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_01"); //Well, my back aches, my arms feel like they're gonna drop off, my tongue's bone dry and I'm dead tired.
//	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_01"); //Tja, also mein Rücken schmerzt, meine Arme fallen mir ab, meine Kehle ist trocken und ich bin müde.
	AI_Output(self, other, "Info_Mine_Vlk_3_DieLage_01_01"); //Skvěle, bolí mě záda, ruce jako by mi upadly, jazyk suchý jako troud a k tomu jsem na smrt unavený.
//	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_02"); //And the constant hammering of the pickaxes is slowly driving me round the bend.
//	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_02"); //Und das ständige Geräusch der Spitzhacken. Ich werde noch wahnsinnig.
	AI_Output(self, other, "Info_Mine_Vlk_3_DieLage_01_02"); //A neustálé údery krumpáče mě pomalu tvarují do oblouku.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_Vlk_3(var C_Npc slf)
{
	Info_Mine_Vlk_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_DieLage.npc = Hlp_GetInstanceID(slf);
};
