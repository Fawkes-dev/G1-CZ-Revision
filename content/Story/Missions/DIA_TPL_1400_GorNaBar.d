// ************************ EXIT **************************

instance Tpl_1400_GorNaBar_Exit(C_INFO)
{
	npc = Tpl_1400_GorNaBar;
	nr = 999;
	condition = Tpl_1400_GorNaBar_Exit_Condition;
	information = Tpl_1400_GorNaBar_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Tpl_1400_GorNaBar_Exit_Condition()
{
	return 1;
};

func void Tpl_1400_GorNaBar_Exit_Info()
{
//	AI_Output(self,other,"Tpl_1400_GorNaBar_Exit_Info_09_02"); //May the Sleeper protect you!
//	AI_Output(self,other,"Tpl_1400_GorNaBar_Exit_Info_09_02"); //Möge der Schläfer dich schützen!
	AI_Output(self,other,"Tpl_1400_GorNaBar_Exit_Info_09_02"); //Kéž tě Spáč ochrání!
	AI_StopProcessInfos(self);
};

// ***************** TEMPLER SAMMELN  *****************************

instance Tpl_1400_GorNaBar_SUGGEST(C_INFO)
{
	npc = Tpl_1400_GorNaBar;
	condition = Tpl_1400_GorNaBar_SUGGEST_Condition;
	information = Tpl_1400_GorNaBar_SUGGEST_Info;
	important = 0;
	permanent = 0;
//	description = "I need your help.";
//	description = "Ich brauche deine Hilfe";
	description = "Potřebuju tvoji pomoc.";
};

func int Tpl_1400_GorNaBar_SUGGEST_Condition()
{
	if  Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN)
	&& !Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};

func void Tpl_1400_GorNaBar_SUGGEST_Info()
{
//	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_01"); //I need your help.
//	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_01"); //Ich brauche deine Hilfe
	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_01"); //Potřebuju tvoji pomoc.
//	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_02"); //I'm looking for secretion for Kalom and I think I know where the crawlers' nest is.
//	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_02"); //Ich bin auf der Suche nach Sekret für Kalom und glaube zu wissen, wo das Nest der Crawler ist.
	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_02"); //Hledám pro Kaloma výměšek a asi vím, kde je hnízdo důlních červů.
//	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_03"); //If we open the passage, will you be there as well?
//	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_03"); //Wenn der Durchgang geöffnet wird, bist du dabei?
	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_03"); //Jestli otevřeme průchod, budeš tam taky?
//	AI_Output(self,other,"Tpl_1400_GorNaBar_SUGGEST_Info_09_04"); //The crawlers' nest! Finally. My sword is at your service!
//	AI_Output(self,other,"Tpl_1400_GorNaBar_SUGGEST_Info_09_04"); //Das Nest der Crawler! Endlich. Mein Schwert kämpft für dich!
	AI_Output(self,other,"Tpl_1400_GorNaBar_SUGGEST_Info_09_04"); //Hnízdo důlních červů! Konečně. Můj meč je ti k službám!

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GATE");
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	B_GiveXP(XP_HireGorNaBar);

//	B_LogEntry(CH2_MCEggs,"When I mentioned the minecrawlers' nest, the templar Gor Na Bar joined my reinforcements at Asghan's gate. I'll find him there.");
//	B_LogEntry(CH2_MCEggs,"Als ich das Nest der Minecrawler erwähnte, schloß sich der Templer Gor Na Bar sofort meiner Verstärkung bei Asghans Tor an. Ich werde ihn dort finden.");
	B_LogEntry(CH2_MCEggs,"Templář Gor Na Bar se připojil k posile u Asghanovy brány hned, jak jsem se zmínil o hnízdě důlních červů. Tam ho také najdu.");
};

// ***************** Infos *****************************

instance Tpl_1400_GorNaBar_INFO(C_INFO)
{
	npc = Tpl_1400_GorNaBar;
	condition = Tpl_1400_GorNaBar_INFO_Condition;
	information = Tpl_1400_GorNaBar_INFO_Info;
	important = 0;
	permanent = 1;
//	description = "What do you know about the minecrawlers?";
//	description = "Was weißt du über die Minecrawler?";
	description = "Co víš o důlních červech?";
};

func int Tpl_1400_GorNaBar_INFO_Condition()
{
	if ! (Npc_KnowsInfo(hero,Grd_263_Asghan_NEST ))
	{
		return 1;
	};
};

func void Tpl_1400_GorNaBar_INFO_Info()
{
//	AI_Output(other,self,"Tpl_1400_GorNaBar_INFO_Info_15_01"); //What do you know about the minecrawlers?
//	AI_Output(other,self,"Tpl_1400_GorNaBar_INFO_Info_15_01"); //Was weißt du über die Minecrawler?
	AI_Output(other,self,"Tpl_1400_GorNaBar_INFO_Info_15_01"); //Co víš o důlních červech?
//	AI_Output(self,other,"Tpl_1400_GorNaBar_INFO_Info_09_02"); //The crawlers must have a nest somewhere. If we only knew where, we could destroy the whole brood!
//	AI_Output(self,other,"Tpl_1400_GorNaBar_INFO_Info_09_02"); //Die Crawler müssen irgendwo ein Nest haben. Wenn wir nur wüssten, wo es ist, dann würden wir die ganze Brut ausrotten!
	AI_Output(self,other,"Tpl_1400_GorNaBar_INFO_Info_09_02"); //Důlní červi tu musí mít někde hnízdo. Kdybychom jenom věděli kde, mohli bychom zničit všechna mláďata.
};

// EIER AM START
instance Tpl_1400_GorNaBar_VICTORY(C_INFO)
{
	npc = Tpl_1400_GorNaBar;
	condition = Tpl_1400_GorNaBar_VICTORY_Condition;
	information = Tpl_1400_GorNaBar_VICTORY_Info;
	important = 0;
	permanent = 0;
//	description = "I've found the nest of the queen!";
//	description = "Ich habe das Nest der Königin gefunden!";
	description = "Našel jsem hnízdo královny!";
};

func int Tpl_1400_GorNaBar_VICTORY_Condition()
{
	if Npc_HasItems(hero,ItAt_Crawlerqueen ) >= 1
	{
		return TRUE;
	};

};
func void Tpl_1400_GorNaBar_VICTORY_Info()
{
//	AI_Output(other,self,"Tpl_1400_GorNaBar_VICTORY_Info_15_01"); //I've found the nest of the queen!
//	AI_Output(other,self,"Tpl_1400_GorNaBar_VICTORY_Info_15_01"); //Ich habe das Nest der Königin gefunden!
	AI_Output(other,self,"Tpl_1400_GorNaBar_VICTORY_Info_15_01"); //Našel jsem hnízdo královny!
//	AI_Output(self,other,"Tpl_1400_GorNaBar_VICTORY_Info_09_02"); //You've shown courage and spirit. We need people like you!
//	AI_Output(self,other,"Tpl_1400_GorNaBar_VICTORY_Info_09_02"); //Du hast Mut und Kampfgeist bewiesen. Solche Leute können wir gebrauchen!
	AI_Output(self,other,"Tpl_1400_GorNaBar_VICTORY_Info_09_02"); //Ukázal jsi odvahu a důvtip! Potřebujeme lidi, jako jsi ty!

	Log_CreateTopic(GE_BecomeTemplar,LOG_NOTE);
//	B_LogEntry(GE_BecomeTemplar,"After bringing back the eggs, I should talk to Cor Angar. Maybe he'll let me join the templars.");
//	B_LogEntry(GE_BecomeTemplar,"Wenn ich die Eier zurückgebracht habe, sollte ich mal mit Cor Angar reden. Vielleicht nimmt er mich in die Reihen der Templer auf.");
	B_LogEntry(GE_BecomeTemplar,"Až přinesu ta vajíčka, měl bych si promluvit s Corem Angarem. Možná mě přijme k templářům.");
};
