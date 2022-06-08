// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Mine_Vlk_2_EXIT_Condition;
	information = Info_Mine_Vlk_2_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Vlk_2_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

instance Info_Mine_Vlk_2_Mine(C_INFO) // E1
{
	nr = 4;
	condition = Info_Mine_Vlk_2_Mine_Condition;
	information = Info_Mine_Vlk_2_Mine_Info;
	important = 0;
	permanent = 1;
//	description = "Tell me about the mine.";
//	description = "Erzähl mir was von der Mine";
	description = "Řekni mi něco o dole.";
};

func int Info_Mine_Vlk_2_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_Mine_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00"); //Tell me about the mine.
//	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00"); //Erzähl mir was von der Mine
	AI_Output(other, self, "Info_Mine_Vlk_2_Mine_15_00"); //Povídej mi o dole.
//	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01"); //There's a lot of caves where there's still some ore left. But the crawlers just make it impossible to work in them.
//	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01"); //Es gibt einen ganzen Haufen Höhlen, in denen auch noch Erz zu holen ist. Aber die Crawler, machen die Arbeit darin unmöglich.
	AI_Output(self, other, "Info_Mine_Vlk_2_Mine_01_01"); //Je tu spousta jeskyní, kde ještě zůstala nějaká ruda. Ale kvůli červům není možné se k ní dostat.
//	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02"); //Too many attacks, too many losses.
//	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02"); //Zu viele Angriffe, zu viele Verluste.
	AI_Output(self, other, "Info_Mine_Vlk_2_Mine_01_02"); //Příliš útoků, příliš ztrát.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Vlk_2_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Mine_Vlk_2_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_2_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who has the say round here?";
//	description = "Wer hat hier was zu Sagen?";
	description = "Kdo tady má velení?";
};

func int Info_Mine_Vlk_2_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00"); //Who has the say round here?
//	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00"); //Wer hat hier was zu sagen?
	AI_Output(other, self, "Info_Mine_Vlk_2_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01"); //Viper's the smelter. He knows all about the oven, he has a body like iron. He don't mind the heat. He spends all day melting the ore.
//	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01"); //Viper ist der Schmelzer. Er kennt sich mit dem Ofen aus. Er hat einen Körper aus Stahl. Ihm macht die Hitze nichts aus. Den ganzen Tag schmilzt er das Erz ein.
	AI_Output(self, other, "Info_Mine_Vlk_2_WichtigePersonen_01_01"); //Viper je tavič. Ví o pecích všechno a tělo má jak z železa. Vůbec neví, co je horko. Celý den stráví tavením rudy.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

instance Info_Mine_Vlk_2_Minecrawler(C_INFO)
{
	nr = 2;
	condition = Info_Mine_Vlk_2_Minecrawler_Condition;
	information = Info_Mine_Vlk_2_Minecrawler_Info;
	important = 0;
	permanent = 1;
//	description = "What do you know about minecrawlers?";
//	description = "Was weißt Du über Minecrawler?";
	description = "Co víš o červech?";
};

func int Info_Mine_Vlk_2_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_Minecrawler_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00"); //What do you know about minecrawlers?
//	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00"); //Was weißt du über Minecrawler?
	AI_Output(other, self, "Info_Mine_Vlk_2_Minecrawler_15_00"); //Co víš o důlních červech?
//	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01"); //We had to close down the big pit at the bottom. It's overrun with minecrawlers.
//	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01"); //Wir haben den großen Schacht ganz unten zugemacht. Da gibt's zu viele Minecrawler.
	AI_Output(self, other, "Info_Mine_Vlk_2_Minecrawler_01_01"); //Musíme se dostat blíž k té velké jámě u dna. Je to tam samý červ.
//	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02"); //There are minecrawlers all over the place. Can't you hear 'em? I sure can!
//	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02"); //Hier gibt's überall Minecrawler. Hörst du sie? Ich kann sie hören!
	AI_Output(self, other, "Info_Mine_Vlk_2_Minecrawler_01_02"); //Důlní červi jsou tady všude. Ty je neslyšíš? Já tedy jo!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Vlk_2_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Vlk_2_DieLage_Condition;
	information = Info_Mine_Vlk_2_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How are you?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Mine_Vlk_2_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00"); //How are you?
//	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other, self, "Info_Mine_Vlk_2_DieLage_15_00"); //Jak se máš?
//	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01"); //I have to work. if the guards catch me standing around talking, they'll cut my rations.
//	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01"); //Ich muss arbeiten. Wenn die Gardisten sehen, dass ich rede, dann kürzen sie meine Ration.
	AI_Output(self, other, "Info_Mine_Vlk_2_DieLage_01_01"); //Mám moc práce. Jestli mě stráže nachytají, jak tady zahálím, zarazí mi příděly.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_Vlk_2(var C_Npc slf)
{
	Info_Mine_Vlk_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_DieLage.npc = Hlp_GetInstanceID(slf);
};
