// **************************************************
//						 EXIT
// **************************************************

instance DIA_Fortuno_EXIT(C_INFO)
{
	npc = NOV_1357_Fortuno;
	nr = 999;
	condition = DIA_Fortuno_EXIT_Condition;
	information = DIA_Fortuno_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Fortuno_EXIT_Condition()
{
	return 1;
};

func void DIA_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance DIA_Fortuno_Greet(C_INFO)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = DIA_Fortuno_Greet_Condition;
	information = DIA_Fortuno_Greet_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Fortuno_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};

	return 0;
};

func void DIA_Fortuno_Greet_Info()
{
//	AI_Output(self,other,"DIA_Fortuno_Greet_05_00"); //Come closer! Every newcomer to this place receives a gift of welcome!
//	AI_Output(self,other,"DIA_Fortuno_Greet_05_00"); //Tritt näher! Hier gibt es ein Willkommensgeschenk für jeden Neuen!
	AI_Output(self,other,"DIA_Fortuno_Greet_05_00"); //Pojď blíž! Každý nový příchozí dostane na přivítanou dárek!
};

// **************************************************
//				Was ist das Geschenk?
// **************************************************
	var int Fortuno_RationDay;
// **************************************************

instance DIA_Fortuno_GetGeschenk(C_INFO)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = DIA_Fortuno_GetGeschenk_Condition;
	information = DIA_Fortuno_GetGeschenk_Info;
	important = 0;
	permanent = 0;
//	description = "What have you got for me?";
//	description = "Was hast du für mich?";
	description = "Co pro mě máš?";
};

func int DIA_Fortuno_GetGeschenk_Condition()
{
	return 1;
};

func void DIA_Fortuno_GetGeschenk_Info()
{
//	AI_Output(other,self,"DIA_Fortuno_GetGeschenk_15_00"); //What have you got for me?
//	AI_Output(other,self,"DIA_Fortuno_GetGeschenk_15_00"); //Was hast du für mich?
	AI_Output(other,self,"DIA_Fortuno_GetGeschenk_15_00"); //Co pro mě máš?
//	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_01"); //Here, take three rolls of swampweed. It's Northern Dark. Good stuff.
//	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_01"); //Hier, nimm drei Rollen Sumpfkraut. Es ist Schwarzer Weiser. Gutes Zeug.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_01"); //Tady jsou tři roličky drogy z bažin. Je to Severní soumrak. Dobrý materiál.
//	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_02"); //You can have more of it every day, but if you want more than your daily ration, well, you need to pay.
//	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_02"); //Du kannst jeden Tag mehr davon haben, aber wenn du mehr als deine tägliche Ration willst, musst du zahlen.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_02"); //Každý den můžeš dostat další, ale pokud budeš chtít víc než denní příděl, musíš zaplatit.
//	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_03"); //If you find berries and herbs on the paths between the camps, you can bring them to me. I'll buy them off you.
//	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_03"); //Falls du auf deinem Weg zwischen den Lagern Kräuter und Beeren findest, bring sie zu mir. Ich werde sie dir abkaufen.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_03"); //Když najdeš na cestě mezi tábory bobule a byliny, můžeš mi je přinést a já je od tebe koupím.

	CreateInvItems(self,itmijoint_2, 3);
	B_GiveInvItems(self,other,itmijoint_2, 3);
	Fortuno_RationDay = Wld_GetDay();

	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
//	B_LogEntry(GE_TraderPSI,"Fortuno deals with herbs underneath the alchemy lab.");
//	B_LogEntry(GE_TraderPSI,"Fortuno handelt unter dem Alchemielabor mit Kräutern");
	B_LogEntry(GE_TraderPSI,"Fortuno obchoduje s bylinami pod alchymistickou dílnou.");
};

// **************************************************
//				Tägliche Ration
// **************************************************

instance DIA_Fortuno_DailyRation(C_INFO)
{
	npc = NOV_1357_Fortuno;
	nr = 3;
	condition = DIA_Fortuno_DailyRation_Condition;
	information = DIA_Fortuno_DailyRation_Info;
	important = 0;
	permanent = 1;
//	description = "I've come to collect my daily ration.";
//	description = "Ich will mir meine tägliche Ration abholen.";
	description = "Přišel jsem si vyzvednout svůj denní příděl.";
};

func int DIA_Fortuno_DailyRation_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk))
	{
		return 1;
	};

	return 0;
};

func void DIA_Fortuno_DailyRation_Info()
{
//	AI_Output(other,self,"DIA_Fortuno_DailyRation_15_00"); //I've come to collect my daily ration.
//	AI_Output(other,self,"DIA_Fortuno_DailyRation_15_00"); //Ich will mir meine tägliche Ration abholen.
	AI_Output(other,self,"DIA_Fortuno_DailyRation_15_00"); //Přišel jsem si vyzvednout svůj denní příděl.
	if (Fortuno_RationDay != Wld_GetDay())
 	{
// 		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_01"); //Here, take it. Three of the Northern Dark - but don't smoke them all at once.
// 		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_01"); //Hier nimm. 3 Schwarzer Weiser - aber nicht alle auf einmal rauchen.
 		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_01"); //Tady je. Třikrát Severní soumrak - nevykuř ale všechno najednou.
		CreateInvItems(self,itmijoint_2, 3);
		B_GiveInvItems(self,other,itmijoint_2, 3);
		Fortuno_RationDay = Wld_GetDay();
	}
	else
	{
//		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_02"); //You've already had your daily ration. If you want more, come back tomorrow or buy something.
//		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_02"); //Du hattest deine Tagesration schon. Wenn du mehr willst, komm morgen wieder oder kauf was.
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_02"); //Už jsi svůj denní příděl dostal. Jestli chceš další, musíš přijít zítra nebo si něco koupit.
	};
};

// **************************************************
//						TRADE
// **************************************************

instance DIA_Fortuno_BuyJoints(C_INFO)
{
	npc = NOV_1357_Fortuno;
	nr = 4;
	condition = DIA_Fortuno_BuyJoints_Condition;
	information = DIA_Fortuno_BuyJoints_Info;
	important = 0;
	permanent = 1;
	Trade = 1;
//	description = "I want to trade.";
//	description = "Ich will handeln.";
	description = "Chci obchodovat.";
};

func int DIA_Fortuno_BuyJoints_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk))
	{
		return 1;
	};

	return 0;
};

func void DIA_Fortuno_BuyJoints_Info()
{
//	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00"); //I want to trade.
//	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00"); //Ich will handeln.
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00"); //Chci obchodovat.
//	AI_Output(self,other,"DIA_Fortuno_BuyJoints_05_01"); //What do you want from me? Or do you want to sell something?
//	AI_Output(self,other,"DIA_Fortuno_BuyJoints_05_01"); //Was willst du haben? Oder willst du was verkaufen?
	AI_Output(self,other,"DIA_Fortuno_BuyJoints_05_01"); //Co ode mě chceš? Nebo chceš něco prodat?
};
