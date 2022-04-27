// ************************ EXIT **************************

instance Tpl_1433_GorNaVid_Exit(C_INFO)
{
	npc = Tpl_1433_GorNaVid;
	nr = 999;
	condition = Tpl_1433_GorNaVid_Exit_Condition;
	information = Tpl_1433_GorNaVid_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Tpl_1433_GorNaVid_Exit_Condition()
{
	return 1;
};

func void Tpl_1433_GorNaVid_Exit_Info()
{
//	AI_Output(self,other,"Tpl_1433_GorNaVid_Exit_Info_13_02"); //May the Sleeper awaken.
//	AI_Output(self,other,"Tpl_1433_GorNaVid_Exit_Info_13_02"); //Der Schläfer erwache.
	AI_Output(self,other,"Tpl_1433_GorNaVid_Exit_Info_13_02"); //Kéž Spáč procitne!
	AI_StopProcessInfos(self);
};

// ***************** Infos *****************************

instance Tpl_1433_GorNaVid_HEALTH(C_INFO)
{
	npc = Tpl_1433_GorNaVid;
	condition = Tpl_1433_GorNaVid_HEALTH_Condition;
	information = Tpl_1433_GorNaVid_HEALTH_Info;
	important = 0;
	permanent = 0;
//	description = "I need your help.";
//	description = "Ich brauche deine Hilfe";
	description = "Potřebuju tvoji pomoc.";
};

func int Tpl_1433_GorNaVid_HEALTH_Condition()
{
	if ((Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN))
	&& (!Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN_NOW)))
	{
		return 1;
	};

	return 0;
};

func void Tpl_1433_GorNaVid_HEALTH_Info()
{
//	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_01"); //I need your help.
//	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_01"); //Ich brauche deine Hilfe
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_01"); //Potřebuju tvoji pomoc.
//	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_02"); //I'm looking for secretion for Kalom and I know where the crawlers' nest is.
//	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_02"); //Ich bin auf der Suche nach Sekret für Kalom und weiß, wo sich das Nest der Crawler befindet.
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_02"); //Hledám pro Kaloma výměšek a vím, kde je hnízdo důlních červů.
//	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_03"); //Will you be there when the passage is opened?
//	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_03"); //Wenn der Durchgang geöffnet wird, bist du dabei?
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_03"); //Budeš tam, až otevřeme chodbu?
//	AI_Output(self,other,"Tpl_1433_GorNaVid_HEALTH_Info_13_04"); //When fighting crawlers it often costs a lot of blood. If you bring me a healing potion, you can count me in.
//	AI_Output(self,other,"Tpl_1433_GorNaVid_HEALTH_Info_13_04"); //Der Kampf gegen Crawler kostet Blut. Wenn du mir einen Heiltrank bringst, bin ich dabei.
	AI_Output(self,other,"Tpl_1433_GorNaVid_HEALTH_Info_13_04"); //Boj s důlními červy je krvavá záležitost. Když mi přineseš hojivý lektvar, můžeš se mnou počítat.
};

// ***************** Infos *****************************

instance Tpl_1433_GorNaVid_IAN(C_INFO)
{
	npc = Tpl_1433_GorNaVid;
	condition = Tpl_1433_GorNaVid_IAN_Condition;
	information = Tpl_1433_GorNaVid_IAN_Info;
	important = 0;
	permanent = 0;
//	description = "I'm looking for the nest of the minecrawlers.";
//	description = "Ich suche das Nest der Minecrawler";
	description = "Hledám hnízdo důlních červů.";
};

func int Tpl_1433_GorNaVid_IAN_Condition()
{
	if ((CorKalom_BringMCQBalls == LOG_RUNNING)
	&& (!Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN)))
	{
		return 1;
	};

	return 0;
};

func void Tpl_1433_GorNaVid_IAN_Info()
{
//	AI_Output(other,self,"Tpl_1433_GorNaVid_IAN_Info_15_01"); //I'm looking for the nest of the minecrawlers.
//	AI_Output(other,self,"Tpl_1433_GorNaVid_IAN_Info_15_01"); //Ich suche das Nest der Minecrawler
	AI_Output(other,self,"Tpl_1433_GorNaVid_IAN_Info_15_01"); //Hledám hnízdo důlních červů.
//	AI_Output(self,other,"Tpl_1433_GorNaVid_IAN_Info_13_02"); //There are many caves next to the main shaft in the mine, but we haven't found any nest.
//	AI_Output(self,other,"Tpl_1433_GorNaVid_IAN_Info_13_02"); //Hier in der Mine gibt es viele Höhlen neben dem Hauptschacht, aber dort haben wir noch kein Nest gefunden.
	AI_Output(self,other,"Tpl_1433_GorNaVid_IAN_Info_13_02"); //Tady v dole je hodně jeskyní vedle hlavní šachty, ale tam jsme žádné hnízdo nenašli.
};

// ***************** Infos *****************************
instance Tpl_1433_GorNaVid_HEALTH_SUC(C_INFO)
{
	npc = Tpl_1433_GorNaVid;
	condition = Tpl_1433_GorNaVid_HEALTH_SUC_Condition;
	information = Tpl_1433_GorNaVid_HEALTH_SUC_Info;
	important = 0;
	permanent = 0;
//	description = "(give healing potion)";
//	description = "(Heiltrank geben)";
	description = "(podej hojivý lektvar)";
};

func int Tpl_1433_GorNaVid_HEALTH_SUC_Condition()
{
	if (Npc_KnowsInfo(hero,Tpl_1433_GorNaVid_HEALTH))
	{
		if ((Npc_HasItems(hero,Itfo_Potion_Health_01))
		|| (Npc_HasItems(hero,Itfo_Potion_Health_02))
		|| (Npc_HasItems(hero,Itfo_Potion_Health_03)))
		{
			return 1;
		};
	};

	return 0;
};

func void Tpl_1433_GorNaVid_HEALTH_SUC_Info()
{
//	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01"); //Here, maybe that'll help.
//	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01"); //Hier, vielleicht hilft dir das.
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01"); //Tady, možná ti to pomůže.
//	AI_Output(self,other,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_13_02"); //Thanks. You can count on me. We'll meet down below with Ashgan.
//	AI_Output(self,other,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_13_02"); //Danke. Du kannst auf meine Stärke zählen. Wir treffen uns unten bei Ashgan.
	AI_Output(self,other,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_13_02"); //Díky, můžeš se mnou počítat. Sejdeme se dole s Asghanem.
//	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_03"); //I'll be there.
//	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_03"); //Ich werde dort sein.
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_03"); //Budu tam.

	if (Npc_HasItems(hero,Itfo_Potion_Health_01))
	{
		B_GiveInvItems(hero,self,Itfo_Potion_Health_01,1);
	}
	else if (Npc_HasItems(hero,Itfo_Potion_Health_02))
	{
		B_GiveInvItems(hero,self,Itfo_Potion_Health_02,1);
	}
	else if (Npc_HasItems(hero,Itfo_Potion_Health_03))
	{
	 	B_GiveInvItems(hero,self,Itfo_Potion_Health_03,1);
	}
	else
	{
		PrintDebugNpc (PD_MISSION, "KEINE POTION= UNMÖGLICH");
	};

	Npc_ExchangeRoutine(self,"GATE");
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	B_GiveXP(XP_HireGorNaVid);
//	B_LogEntry(CH2_MCEggs,"I had to give a healing potion to Gor Na Vid before he agreed to join the reinforcements at Asghan's gate.");
//	B_LogEntry(CH2_MCEggs,"Ich mußte Gor Na Vid erst einen Heiltrank geben, bevor er sich als Verstärkung bei Asghans Tor zur Verfügung stellte.");
	B_LogEntry(CH2_MCEggs,"Než Gor Na Vid souhlasil, že se přidá k posile u Asghanovy brány, musel jsem mu dát hojivý lektvar.");

	AI_StopProcessInfos(self);
};

//---------EIER GEFUNDEN------------------------------------------------------

instance Tpl_1433_GorNavid_VICTORY(C_INFO)
{
	npc = Tpl_1433_GorNavid;
	condition = Tpl_1433_GorNavid_VICTORY_Condition;
	information = Tpl_1433_GorNavid_VICTORY_Info;
	important = 0;
	permanent = 0;
//	description = "I've found the nest of the queen!";
//	description = "Ich habe das Nest der Königin gefunden!";
	description = "Našel jsem hnízdo královny!";
};

func int Tpl_1433_GorNavid_VICTORY_Condition()
{
	if (Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1)
	{
		return 1;
	};

	return 0;
};

func void Tpl_1433_GorNavid_VICTORY_Info()
{
//	AI_Output(other,self,"Tpl_1433_GorNavid_VICTORY_Info_15_01"); //I've found the nest of the queen!
//	AI_Output(other,self,"Tpl_1433_GorNavid_VICTORY_Info_15_01"); //Ich habe das Nest der Königin gefunden!
	AI_Output(other,self,"Tpl_1433_GorNavid_VICTORY_Info_15_01"); //Našel jsem hnízdo královny!
//	AI_Output(self,other,"Tpl_1433_GorNavid_VICTORY_Info_13_02"); //I thank you in the name of the entire Brotherhood!
//	AI_Output(self,other,"Tpl_1433_GorNavid_VICTORY_Info_13_02"); //Im Namen der gesamten Bruderschaft danke ich dir dafür!
	AI_Output(self,other,"Tpl_1433_GorNavid_VICTORY_Info_13_02"); //Děkuju ti ve jménu celého Bratrstva!
//	AI_Output(self,other,"Tpl_1433_GorNavid_VICTORY_Info_13_03"); //May the Sleeper continue to hold his protective hand over you!
//	AI_Output(self,other,"Tpl_1433_GorNavid_VICTORY_Info_13_03"); //Möge der Schläfer auch weiterhin seine schützende Hand über dich halten!
	AI_Output(self,other,"Tpl_1433_GorNavid_VICTORY_Info_13_03"); //Nechť nad tebou Spáč drží ochrannou ruku!
};
