// **************************************************
//						EXIT
// **************************************************

instance DIA_BaalOrun_Exit(C_INFO)
{
	npc = Gur_1209_BaalOrun;
	nr = 999;
	condition = DIA_BaalOrun_Exit_Condition;
	information = DIA_BaalOrun_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_BaalOrun_Exit_Condition()
{
	return 1;
};

func void DIA_BaalOrun_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 					NICHT ansprechbar (Ungläubiger)
// ************************************************************
	var int BaalOrun_Ansprechbar;
	var int BaalOrun_Sakrileg;
// ************************************************************

instance DIA_BaalOrun_NoTalk(C_INFO)
{
	npc = GUR_1209_BaalOrun;
	nr = 2;
	condition = DIA_BaalOrun_NoTalk_Condition;
	information = DIA_BaalOrun_NoTalk_Info;
	permanent = 1;
	important = 1;
};

func int DIA_BaalOrun_NoTalk_Condition()
{
	if (Npc_IsInState(self,ZS_TALK) && (BaalOrun_Ansprechbar==FALSE) && (Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalOrun_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalOrun_NoTalk);
	Info_Addchoice (DIA_BaalOrun_NoTalk,DIALOG_ENDE ,DIA_BaalOrun_NoTalk_ENDE);
//	Info_Addchoice (DIA_BaalOrun_NoTalk,"Everything alright, pal?",DIA_BaalOrun_NoTalk_Imp);
//	Info_Addchoice (DIA_BaalOrun_NoTalk,"Alles, klar, Alter?",DIA_BaalOrun_NoTalk_Imp);
	Info_Addchoice (DIA_BaalOrun_NoTalk,"Je všechno v pořádku, příteli?",DIA_BaalOrun_NoTalk_Imp);
//	Info_Addchoice (DIA_BaalOrun_NoTalk,"The Sleeper be with you!",DIA_BaalOrun_NoTalk_Sleeper);
//	Info_Addchoice (DIA_BaalOrun_NoTalk,"Der Schläfer sei mit dir!",DIA_BaalOrun_NoTalk_Sleeper);
	Info_Addchoice (DIA_BaalOrun_NoTalk,"Spáč buď s tebou!",DIA_BaalOrun_NoTalk_Sleeper);
//	Info_Addchoice (DIA_BaalOrun_NoTalk,"Hi! I'm new here!",DIA_BaalOrun_NoTalk_Hi);
//	Info_Addchoice (DIA_BaalOrun_NoTalk,"Hi! Ich bin neu hier!",DIA_BaalOrun_NoTalk_Hi);
	Info_Addchoice (DIA_BaalOrun_NoTalk,"Zdar! Jsem tu nový!",DIA_BaalOrun_NoTalk_Hi);
};

func void DIA_BaalOrun_NoTalk_Hi()
{
//	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Hi_15_00"); //Hi! I'm new here!
//	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Hi_15_00"); //Hi! Ich bin neu hier!
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Hi_15_00"); //Zdar! Jsem tu nový!
//	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Hi_12_01"); //(sigh)
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Hi_12_01"); //(vzdech)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Sleeper()
{
//	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Sleeper_15_00"); //The Sleeper be with you!
//	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Sleeper_15_00"); //Der Schläfer sei mit dir!
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Sleeper_15_00"); //Spáč buď s tebou!
//	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Sleeper_12_01"); //(sigh)
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Sleeper_12_01"); //(vzdech)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Imp()
{
//	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Imp_15_00"); //Everything alright, pal?
//	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Imp_15_00"); //Alles klar, Alter?
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Imp_15_00"); //Je všechno v pořádku, příteli?
//	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Imp_12_01"); //(sigh)
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Imp_12_01"); //(vzdech)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//		Ghorim_KickHarlok Success + MISSION
// **************************************************
instance DIA_BaalOrun_FirstTalk(C_INFO)
{
	npc = Gur_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_FirstTalk_Condition;
	information = DIA_BaalOrun_FirstTalk_Info;
	permanent = 0;
	important = 1;
};

func int DIA_BaalOrun_FirstTalk_Condition()
{
	if (Ghorim_KickHarlok == LOG_SUCCESS)
	{
		BaalOrun_Ansprechbar = TRUE; //damit NoTalk-info nicht kommt
		return 1;
	};
};

func void DIA_BaalOrun_FirstTalk_Info()
{
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_00"); //I have spoken to Ghorim. You have done one of our brothers a great service - your cause was just.
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_00"); //Ich habe mit Ghorim gesprochen. Du hast dich für einen unserer Brüder eingesetzt - und deine Sache war gerecht.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_00"); //Mluvil jsem s Ghorimem. Zastal jsi se jednoho z našich bratrů - a to od tebe bylo správné.
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_01"); //That's why I've chosen you for a special task.
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_01"); //Darum habe ich dich für eine besondere Aufgabe erwählt.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_01"); //Proto jsem si tě vybral pro speciální úkol.
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_02"); //Cor Kalom urgently needs new swampweed for his experiments.
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_02"); //Cor Kalom braucht dringend neues Sumpfkraut für seine Experimente.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_02"); //Col Kalom naléhavě potřebuje novou trávu z bažin pro své experimenty.
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_03"); //Our gatherers are working day and night. Go to them and take their entire harvest to Kalom's alchemy lab.
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_03"); //Unsere Sammler im Sumpf arbeiten Tag und Nacht. Gehe zu ihnen und bring ihre gesamte Ernte zu Kalom ins Alchemielabor.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_03"); //Naši sběrači pracují ve dne v noci. Jdi za nimi a přines celou jejich sklizeň Kalomovi do alchymistické dílny.

	B_GiveXP(XP_BaalOrunTalks);
//	B_LogEntry(CH1_GhorimsRelief,"Harlok has actually replaced Ghorim. Miracles do happen.");
//	B_LogEntry(CH1_GhorimsRelief,"Ghorim wurde tatsächlich von Harlok abgelöst. Es geschehen noch Zeichen und Wunder.");
	B_LogEntry(CH1_GhorimsRelief,"Harlok právě nahradil Ghorima. Zázraky se dějí.");
	Log_SetTopicStatus(CH1_GhorimsRelief,LOG_SUCCESS);

	Log_CreateTopic(CH1_DeliverWeed,LOG_MISSION);
	Log_SetTopicStatus(CH1_DeliverWeed,LOG_RUNNING);
//	B_LogEntry(CH1_DeliverWeed,"My powers of persuasion with Harlok seem to have impressed the Guru Baal Orun. I now have the honor of taking the entire weed from the novices in the swamp to Cor Kalom.");
//	B_LogEntry(CH1_DeliverWeed,"Meine Überredungskünste bei Harlok, scheinen den Guru Baal Orun beeindruckt zu haben. Ich haben nun die 'Ehre' das gesammelte Kraut der Novizen im Sumpf zu Cor Kalom zu bringen.");
	B_LogEntry(CH1_DeliverWeed,"Dovednost 'přemlouvání' v té věci s Harlokem udělala dojem na Baal Oruna. Nyní mám tu čest vybrat pro Cor Kaloma všechnu trávu od noviců v bažinách.");
	BaalOrun_FetchWeed = LOG_RUNNING;

	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
//	Info_Addchoice (DIA_BaalOrun_FirstTalk,"Say nothing",DIA_BaalOrun_FirstTalk_MuteEnde);
//	Info_Addchoice (DIA_BaalOrun_FirstTalk,"Nichts sagen",DIA_BaalOrun_FirstTalk_MuteEnde);
	Info_Addchoice (DIA_BaalOrun_FirstTalk,"(Neříkej nic)",DIA_BaalOrun_FirstTalk_MuteEnde);
//	Info_Addchoice (DIA_BaalOrun_FirstTalk,"Where exactly can I find the gatherers?",DIA_BaalOrun_FirstTalk_Where);
//	Info_Addchoice (DIA_BaalOrun_FirstTalk,"Wo genau kann ich die Sammler finden?",DIA_BaalOrun_FirstTalk_Where);
	Info_Addchoice (DIA_BaalOrun_FirstTalk,"Kde přesně najdu ty sběrače?",DIA_BaalOrun_FirstTalk_Where);
};

func void DIA_BaalOrun_FirstTalk_Where()
{
//	AI_Output(other,self,"DIA_BaalOrun_FirstTalk_Where_15_00"); //Where exactly can I find the gatherers?
//	AI_Output(other,self,"DIA_BaalOrun_FirstTalk_Where_15_00"); //Wo genau kann ich die Sammler finden?
	AI_Output(other,self,"DIA_BaalOrun_FirstTalk_Where_15_00"); //Kde přesně najdu ty sběrače?
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_01"); //I have not yet given you permission to address me!
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_01"); //Ich habe dir noch nicht gestattet, mich anzusprechen!
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_01"); //Nedal jsem ti povolení mě oslovovat!
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_02"); //Pray to the Sleeper that he may pardon your sacrilege! And now leave. Your mission is of extreme importance.
//	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_02"); //Bete zum Schläfer um Vergebung für dieses Sakrileg! Und nun geh. Deine Mission ist von äußerster Dringlichkeit.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_02"); //Modli se ke Spáčovi, aby ti odpustil tvůj hřích! A teď odejdi. Tvé poslání je nesmírně důležité.

	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};

func void DIA_BaalOrun_FirstTalk_MuteEnde()
{
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};

// **************************************************
//					Kraut geholt
// **************************************************

instance DIA_BaalOrun_GotWeed(C_INFO)
{
	npc = Gur_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_GotWeed_Condition;
	information = DIA_BaalOrun_GotWeed_Info;
	permanent = 0;
	important = 1;
};

func int DIA_BaalOrun_GotWeed_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS) //automatisch auch Kraut geholt
	{
		return 1;
	};
};

func void DIA_BaalOrun_GotWeed_Info()
{
//	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_00"); //You have defended our gatherers...
//	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_00"); //Du hast unsere Sammler verteidigt ...
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_00"); //Ochránil jsi naše sběrače...
//	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_01"); //You have not only proved that you're on our side - you have proved that you are a worthy servant of the Sleeper.
//	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_01"); //Damit hast du nicht nur bewiesen, dass du auf unserer Seite stehst - du hast dich auch als würdiger Diener des Schläfers erwiesen.
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_01"); //Nejen že jsi prokázal, že jsi na naší straně - dokázal jsi také, že jsi věrný služebník Spáče.
//	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_02"); //I believe you are ready to wear the robe of a novice.
//	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_02"); //Du bist meiner Meinung nach bereit, die Robe eines Novizen zu tragen.
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_02"); //Podle mě jsi připraven nosit roucho novice.
	BaalOrun_Ansprechbar = TRUE;

	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};

//	B_LogEntry(CH1_JoinPsi,"Baal Orun called me a worthy servant of the Sleeper, because I've fought the bloodflies on behalf of the other novices in the swamp.");
//	B_LogEntry(CH1_JoinPsi,"Baal Orun bezeichnete mich als würdigen Diener des Schläfers, da ich für die anderen Novizen im Sumpf gegen die Blutfliegen gekämpft habe.");
	B_LogEntry(CH1_JoinPsi,"Baal Orun mě nazval věrným služebníkem Spáče, protože jsem kvůli novicům z bažin vymýtil krvavé mouchy.");
	B_GiveXP(XP_ImpressedBaalOrun);
};

// **************************************************
//					Kraut abgeliefert!
// **************************************************

instance DIA_BaalOrun_WeedAtKaloms(C_INFO)
{
	npc = Gur_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_WeedAtKaloms_Condition;
	information = DIA_BaalOrun_WeedAtKaloms_Info;
	permanent = 0;
//	description = "I took the swampweed to Cor Kalom.";
//	description = "Ich habe Cor Kalom das Sumpfkraut gebracht.";
	description = "Předal jsem drogu z bažin Cor Kalomovi.";
};

func int DIA_BaalOrun_WeedAtKaloms_Condition()
{
	if (BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_WeedAtKaloms_Info()
{
//	AI_Output(other,self,"DIA_BaalOrun_WeedAtKaloms_15_00"); //I took the swampweed to Cor Kalom.
//	AI_Output(other,self,"DIA_BaalOrun_WeedAtKaloms_15_00"); //Ich habe Cor Kalom das Sumpfkraut gebracht.
	AI_Output(other,self,"DIA_BaalOrun_WeedAtKaloms_15_00"); //Předal jsem drogu z bažin Cor Kalomovi.
//	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_01"); //You have done well. I have a small reward for your efforts. Here, take it.
//	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_01"); //Daran hast du gut getan. Ich habe eine kleine Belohnung für deine Mühen. Hier, nimm es.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_01"); //Dobře jsi to provedl. Za tvé úsilí ti dám malou odměnu. Tady je, vem si ji.
//	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_02"); //It's a magic sleep spell. You can only use it once, but I hope it will be of good service to you.
//	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_02"); //Es ist ein magischer Schlafzauber. Du kannst ihn nur einmal verwenden, aber er wird dir hoffentlich gute Dienste leisten.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_02"); //To je magický svitek spánku. Můžeš je použít jen jedenkrát, ale věřím, že ti prokáže dobrou službu.

	BaalOrun_Ansprechbar = TRUE; //damit NoTalk-info nicht kommt
	B_GiveXP(XP_ReportToBaalOrun);

	CreateInvItem(self,ItArScrollSleep);
	B_GiveInvItems(self,other,ItArScrollSleep,1);
};

// **************************************************
//					Permanent
// **************************************************

instance DIA_BaalOrun_Perm(C_INFO)
{
	npc = Gur_1209_BaalOrun;
	nr = 2;
	condition = DIA_BaalOrun_Perm_Condition;
	information = DIA_BaalOrun_Perm_Info;
	permanent = 1;
//	description = "How's weed production going?";
//	description = "Wie läuft die Krautproduktion?";
	description = "Jak jde produkce drogy z bažin?";
};

func int DIA_BaalOrun_Perm_Condition()
{
	if (BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_Perm_Info()
{
//	AI_Output(other,self,"DIA_BaalOrun_Perm_15_00"); //How's weed production going?
//	AI_Output(other,self,"DIA_BaalOrun_Perm_15_00"); //Wie läuft die Krautproduktion?
	AI_Output(other,self,"DIA_BaalOrun_Perm_15_00"); //Jak jde produkce drogy z bažin?
//	AI_Output(self,other,"DIA_BaalOrun_Perm_12_01"); //We're putting maximum strain on every man to produce enough for ourselves AND trade with the other camps.
//	AI_Output(self,other,"DIA_BaalOrun_Perm_12_01"); //Wir belasten jeden Mann bis ans Äußerste, um genug für uns UND den Handel mit den anderen Lagern herzustellen.
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_01"); //Zatěžujeme každého muže, aby vyprodukoval dostatek pro nás samotné i na obchodování s ostatními tábory.
//	AI_Output(self,other,"DIA_BaalOrun_Perm_12_02"); //But it's a sacrifice for the Sleeper, one our novices willingly make.
//	AI_Output(self,other,"DIA_BaalOrun_Perm_12_02"); //Aber es ist ein Opfer für den Schläfer, und so bringen es die Novizen gerne.
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_02"); //To je ale oběť pro Spáče, kterou naši novicové ochotně přináší.
};

