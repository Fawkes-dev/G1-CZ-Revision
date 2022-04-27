// ************************ EXIT **************************

instance Tpl_1401_GorNaKosh_Exit(C_INFO)
{
	npc = Tpl_1401_GorNaKosh;
	nr = 999;
	condition = Tpl_1401_GorNaKosh_Exit_Condition;
	information = Tpl_1401_GorNaKosh_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Tpl_1401_GorNaKosh_Exit_Condition()
{
	return 1;
};

func void Tpl_1401_GorNaKosh_Exit_Info()
{
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_Exit_Info_13_02"); //May the Sleeper awaken!
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_Exit_Info_13_02"); //Der Schläfer erwache!
	AI_Output(self,other,"Tpl_1401_GorNaKosh_Exit_Info_13_02"); //Kéž Spáč procitne!
	AI_StopProcessInfos(self);
};

// ***************** Infos *****************************

instance Tpl_1401_GorNaKosh_SUGGEST(C_INFO)
{
	npc = Tpl_1401_GorNaKosh;
	condition = Tpl_1401_GorNaKosh_SUGGEST_Condition;
	information = Tpl_1401_GorNaKosh_SUGGEST_Info;
	important = 0;
	permanent = 0;
//	description = "I know where the nest of the crawlers is.";
//	description = "Ich weiß, wo das Nest der Crawler ist...";
	description = "Vím, kde je hnízdo důlních červů...";
};

func int Tpl_1401_GorNaKosh_SUGGEST_Condition()
{
	if ((Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN))
	&& (!Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN_NOW)))
	{
		return 1;
	};

	return 0;
};

func void Tpl_1401_GorNaKosh_SUGGEST_Info()
{
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_01"); //I know where the crawlers' nest is. I'm going there to get something for Kalom, so he can brew a stronger potion.
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_01"); //Ich weiß, wo das Nest der Crawler ist und werde hineingehen und etwas suchen, aus dem Kalom ein stärkeres Elixier brauen kann.
	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_01"); //Vím, kde je hnízdo důlních červů. Jdu tam hledat něco pro Kaloma, z čeho by mohl připravit silnější elixír.
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_SUGGEST_Info_13_02"); //Then you'll need my blade. I'll join you.
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_SUGGEST_Info_13_02"); //Dann wirst du meine Klinge brauchen. Ich bin dabei.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_SUGGEST_Info_13_02"); //Pak budeš potřebovat mé ostří. Přidám se k tobě.
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_03"); //Good. We'll meet at the big passage.
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_03"); //Gut. Wir treffen uns beim großen Durchgang.
	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_03"); //Dobře. Sejdeme se u velké chodby.

	Npc_ExchangeRoutine(self,"GATE");
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	B_GiveXP(XP_HireGorNaKosh);
//	B_LogEntry(CH2_MCEggs,"I convinced the templar Gor Na Kosh to join the reinforcements at Asghan's gate. He's waiting for me there.");
//	B_LogEntry(CH2_MCEggs,"Ich konnte den Templer Gor Na Kosh als Verstärkung für Asghans Tor gewinnen. Er wartet dort auf mich.");
	B_LogEntry(CH2_MCEggs,"Přesvědčil jsem templáře Gora Na Koshe, aby se přidal k posádce u Asghanových vrat. Bude tam na mě čekat.");

	AI_StopProcessInfos(self);
};

// ***************** Infos *****************************

instance Tpl_1401_GorNaKosh_INFO(C_INFO)
{
	npc = Tpl_1401_GorNaKosh;
	condition = Tpl_1401_GorNaKosh_INFO_Condition;
	information = Tpl_1401_GorNaKosh_INFO_Info;
	important = 0;
	permanent = 1;
//	description = "What are you doing here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};

func int Tpl_1401_GorNaKosh_INFO_Condition()
{
	if (!Npc_KnowsInfo(hero,Grd_263_Asghan_NEST))
	{
		return 1;
	};

	return 0;
};

func void Tpl_1401_GorNaKosh_INFO_Info()
{
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_01"); //What are you doing here?
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_01"); //Was machst du hier?
	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_01"); //Co tady děláš?
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_02"); //I'm hunting minecrawlers.
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_02"); //Ich jage Minecrawler.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_02"); //Lovím důlní červy.
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_03"); //Can you tell me something about crawler hunting?
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_03"); //Kannst du mir was über die Crawlerjagd erzählen?
	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_03"); //Můžeš mi něco říci o lovu důlních červů?
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_04"); //There's just a single rule to remember when hunting crawlers: When you see them, run at them and kill them as fast as you can.
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_04"); //Beim Crawlerjagen gibt's nur eine Regel. Wenn du sie siehst, lauf auf sie zu und töte sie, so schnell du kannst.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_04"); //Při lovu důlních červů si musíš pamatovat jednoduché pravidlo. Když je spatříš, běž k nim a zabij je, jak nejrychleji umíš.
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_05"); //Fight without fear and kill without mercy.
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_05"); //Kämpfe ohne Furcht und töte ohne Gnade.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_05"); //Bojuj beze strachu a zabíjej bez milosti.

	AI_StopProcessInfos(self); // SN:nur für die Vermeidung des Bugs, dass der letzte Satz in roter Schrift erscheint, und der InfoManager danach defekt ist
};

// ***************** Infos *****************************

instance Tpl_1401_GorNaKosh_CRAWLER(C_INFO)
{
	npc = Tpl_1401_GorNaKosh;
	condition = Tpl_1401_GorNaKosh_CRAWLER_Condition;
	information = Tpl_1401_GorNaKosh_CRAWLER_Info;
	important = 0;
	permanent = 1;
//	description = "Can you tell me more about the crawlers?";
//	description = "Kannst du mir mehr von den Crawlern erzählen?";
	description = "Můžeš mi říci něco víc o těch důlních červech?";
};

func int Tpl_1401_GorNaKosh_CRAWLER_Condition()
{
	if (Npc_KnowsInfo(hero,Tpl_1401_GorNaKosh_INFO))
	{
		return 1;
	};

	return 0;
};

func void Tpl_1401_GorNaKosh_CRAWLER_Info()
{
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_CRAWLER_Info_15_01"); //Can you tell me more about the crawlers?
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_CRAWLER_Info_15_01"); //Kannst du mir mehr von den Crawlern erzählen?
	AI_Output(other,self,"Tpl_1401_GorNaKosh_CRAWLER_Info_15_01"); //Můžeš mi říci něco víc o těch důlních červech?
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_02"); //They act instinctively, anything non-crawler is killed.
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_02"); //Sie handeln nach ihrem Instinkt. Alles, was kein Crawler ist, wird getötet.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_02"); //Chovají se instinktivně. Vše, co není důlní červ, zabijí.
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_03"); //Use this knowledge in your fight against them.
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_03"); //Wenn du gegen sie kämpfst, mach dir dieses Wissen zu Nutze.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_03"); //Použij tyto vědomosti, když s nimi bojuješ.
};

// ***************************** Die Königin ist tot, lang lebe die Königin ****************************************//

instance Tpl_1401_GorNaKosh_VICTORY(C_INFO)
{
	npc = Tpl_1401_GorNaKosh;
	condition = Tpl_1401_GorNaKosh_VICTORY_Condition;
	information = Tpl_1401_GorNaKosh_VICTORY_Info;
	important = 0;
	permanent = 0;
//	description = "I've found the crawler nest!";
//	description = "Ich habe das Nest der Crawler gefunden!";
	description = "Našel jsem hnízdo důlních červů!";
};

func int Tpl_1401_GorNaKosh_VICTORY_Condition()
{
	if (Npc_HasItems(hero,ItAt_Crawlerqueen) > 3)
	{
		return 1;
	};

	return 0;
};

func void Tpl_1401_GorNaKosh_VICTORY_Info()
{
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_VICTORY_Info_15_01"); //I've found the crawler nest!
//	AI_Output(other,self,"Tpl_1401_GorNaKosh_VICTORY_Info_15_01"); //Ich habe das Nest der Crawler gefunden!
	AI_Output(other,self,"Tpl_1401_GorNaKosh_VICTORY_Info_15_01"); //Našel jsem hnízdo důlních červů!
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_VICTORY_Info_13_02"); //Wonderful! Now go back to the Camp and finish this mission. Cor Kalom will be waiting for you!
//	AI_Output(self,other,"Tpl_1401_GorNaKosh_VICTORY_Info_13_02"); //Wunderbar! Gehe nun zurück ins Lager und beende deine Mission. Cor Kalom erwartet dich bestimmt schon!
	AI_Output(self,other,"Tpl_1401_GorNaKosh_VICTORY_Info_13_02"); //Výborně! Jdi zpátky do tábora a dokonči svůj úkol. Cor Kalom tě jistě očekává!
//	B_LogEntry(CH2_MCEggs,"I'm to take the eggs to Cor Kalom, he's waiting for them.");
//	B_LogEntry(CH2_MCEggs,"Ich sollte die Eier zu Cor-Kalom bringen, er wird sie schon sehnsüchtig erwarten.");
	B_LogEntry(CH2_MCEggs,"Měl bych donést ta vajíčka Cor Kalomovi, určitě na ně už čeká.");
};
