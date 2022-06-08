// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Vlk_1_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_1 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Mine_Vlk_1_EXIT_Condition;
	information = Info_Mine_Vlk_1_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Vlk_1_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

instance Info_Mine_Vlk_1_Mine(C_INFO) // E1
{
	nr = 4;
	condition = Info_Mine_Vlk_1_Mine_Condition;
	information = Info_Mine_Vlk_1_Mine_Info;
	important = 0;
	permanent = 1;
//	description = "Tell me about the mine.";
//	description = "Erzähl mir was von der Mine";
	description = "Řekni mi něco o dole.";
};

func int Info_Mine_Vlk_1_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_Mine_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_1_Mine_15_00"); //Tell me about the mine.
//	AI_Output(other,self,"Info_Mine_Vlk_1_Mine_15_00"); //Erzähl mir was von der Mine
	AI_Output(other, self, "Info_Mine_Vlk_1_Mine_15_00"); //Řekni mi něco o dole.
//	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_01"); //Mushrooms and herbs grow in caves. That stuff's easy to digest, but it don't fill you up as good as a nice, decent chunk of meat.
//	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_01"); //In Höhlen wachsen Pilze und Kraut. Das Zeug ist ganz gut verträglich. Macht aber nicht so satt wie ein anständiges Stück Fleisch.
	AI_Output(self, other, "Info_Mine_Vlk_1_Mine_01_01"); //V jeskyních rostou houby a byliny. Snadno se tráví, ale nikdy se tím nenacpeš tak krásně jako pořádnou flákotou masa!
//	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_02"); //The crawler's don't taste too good either. What a shithole.
//	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_02"); //Die Crawler sind auch ungenießbar. Was für ein Mist.
	AI_Output(self, other, "Info_Mine_Vlk_1_Mine_01_02"); //Červi tak dobře nechutnají. Taková havěť.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Vlk_1_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Mine_Vlk_1_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_1_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who's in charge here?";
//	description = "Wer hat hier was zu Sagen?";
	description = "Kdo to tady má na starosti?";
};

func int Info_Mine_Vlk_1_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_1_WichtigePersonen_15_00"); //Who's in charge here?
//	AI_Output(other,self,"Info_Mine_Vlk_1_WichtigePersonen_15_00"); //Wer hat hier was zu Sagen?
	AI_Output(other, self, "Info_Mine_Vlk_1_WichtigePersonen_15_00"); //Kdo tady velí?
//	AI_Output(self,other,"Info_Mine_Vlk_1_WichtigePersonen_01_01"); //Ian's the boss of the mine. He organizes the workforce and the exchange of goods with the Camp. if you want anything, you'd better talk to him.
//	AI_Output(self,other,"Info_Mine_Vlk_1_WichtigePersonen_01_01"); //Ian ist der Chef der Mine. Er organisiert die Arbeit und den Warenaustausch mit dem Lager. Wenn du also irgendwas willst, wende dich an ihn.
	AI_Output(self, other, "Info_Mine_Vlk_1_WichtigePersonen_01_01"); //Ian je můj šéf. Organizuje pracovní síly a vyměňuje zboží s táborem. Pokud něco chceš, měl bys mu to říci.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

instance Info_Mine_Vlk_1_Minecrawler(C_INFO)
{
	nr = 2;
	condition = Info_Mine_Vlk_1_Minecrawler_Condition;
	information = Info_Mine_Vlk_1_Minecrawler_Info;
	important = 0;
	permanent = 1;
//	description = "What do you know about minecrawlers?";
//	description = "Was weißt Du über Minecrawler?";
	description = "Co víš o červech?";
};

func int Info_Mine_Vlk_1_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_Minecrawler_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_1_Minecrawler_15_00"); //What do you know about minecrawlers?
//	AI_Output(other,self,"Info_Mine_Vlk_1_Minecrawler_15_00"); //Was weißt du über Minecrawler?
	AI_Output(other, self, "Info_Mine_Vlk_1_Minecrawler_15_00"); //Co víš o důlních červech?
//	AI_Output(self,other,"Info_Mine_Vlk_1_Minecrawler_01_01"); //The templars made a deal with Gomez. They kill the crawlers, they get to keep the beasts' mandibles.
//	AI_Output(self,other,"Info_Mine_Vlk_1_Minecrawler_01_01"); //Die Templer haben ein Geschäft mit Gomez gemacht. Sie töten die Crawler und dafür kriegen sie die Zangen der Viecher.
	AI_Output(self, other, "Info_Mine_Vlk_1_Minecrawler_01_01"); //Templáři udělali s Gomezem smlouvu. Zabijí červy a pak si budou moci nechat jejich čelisti.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Vlk_1_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Vlk_1_DieLage_Condition;
	information = Info_Mine_Vlk_1_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Mine_Vlk_1_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_1_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_Mine_Vlk_1_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other, self, "Info_Mine_Vlk_1_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Mine_Vlk_1_DieLage_01_01"); //A lot of work, not much rest. So be quick with your questions. I have work to do.
//	AI_Output(self,other,"Info_Mine_Vlk_1_DieLage_01_01"); //Viel Arbeit, wenig Ruhe. Also stell deine Fragen schnell. Ich hab' zu tun.
	AI_Output(self, other, "Info_Mine_Vlk_1_DieLage_01_01"); //Spousta práce, žádný odpočinek. Tak se rychle ptej. Mám moc práce.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_Vlk_1(var C_Npc slf)
{
	Info_Mine_Vlk_1_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_DieLage.npc = Hlp_GetInstanceID(slf);
};
