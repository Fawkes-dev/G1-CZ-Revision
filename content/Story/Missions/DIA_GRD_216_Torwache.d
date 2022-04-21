// **************************************************
// 						 EXIT
// **************************************************

instance DIA_Grd_216_Exit(C_INFO)
{
	npc = Grd_216_Torwache;
	nr = 999;
	condition = DIA_Grd_216_Exit_Condition;
	information = DIA_Grd_216_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Grd_216_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_216_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 				Kap 1 Standard Hallo
// **************************************************

instance DIA_Grd_216_First(C_INFO)
{
	npc = Grd_216_Torwache;
	nr = 1;
	condition = DIA_Grd_216_First_Condition;
	information = DIA_Grd_216_First_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Grd_216_First_Condition()
{
	if (Npc_GetDistToWP(other,"OCR_NORTHGATE_ADVANCE") > 400) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,30);
	};

	if (Npc_RefuseTalk(self) == FALSE)
	{
		var C_NPC Dusty; Dusty = Hlp_GetNpc(Vlk_524_Dusty);
		if (Dusty.aivar[AIV_PARTYMEMBER] == FALSE)
		&& (Kapitel < 2)
		{
			return 1;
		};
	};
};

func void DIA_Grd_216_First_Info()
{
//	AI_Output(self,other,"DIA_Grd_216_First_13_00"); //Hey, you! I don't think I've seen you here before!
//	AI_Output(self,other,"DIA_Grd_216_First_13_00"); //Hey, du! Dich hab' ich hier noch nie gesehen!
	AI_Output(self,other,"DIA_Grd_216_First_13_00"); //Hej, ty! Tebe jsem tu nikdy neviděl!
//	AI_Output(other,self,"DIA_Grd_216_First_15_01"); //No wonder. I've only just got here.
//	AI_Output(other,self,"DIA_Grd_216_First_15_01"); //Das ist kein Wunder. Ich bin auch erst seit kurzem da.
	AI_Output(other,self,"DIA_Grd_216_First_15_01"); //Není divu. Nejsem tu dlouho.
//	AI_Output(self,other,"DIA_Grd_216_First_13_02"); //Then watch out! The outside world is pretty dangerous. You're only safe inside a camp.
//	AI_Output(self,other,"DIA_Grd_216_First_13_02"); //Dann pass gut auf dich auf! Die Welt da draußen ist ziemlich gefährlich. Nur im Lager bist du sicher.
	AI_Output(self,other,"DIA_Grd_216_First_13_02"); //Pak dávej pozor! Vnější svět je dost nebezpečný! V bezpečí jsi jedině uvnitř tábora.
};

// **************************************************
// 					Dusty Zoll
// **************************************************

instance DIA_Grd_216_DustyZoll(C_INFO)
{
	npc = Grd_216_Torwache;
	nr = 1;
	condition = DIA_Grd_216_DustyZoll_Condition;
	information = DIA_Grd_216_DustyZoll_Info;
	permanent = 1;
	important = 1;
};

func int DIA_Grd_216_DustyZoll_Condition()
{
	var C_NPC Dusty; Dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if (Dusty.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToNpc(hero,dusty)<2000)
	{
		return 1;
	};
};

func void DIA_Grd_216_DustyZoll_Info()
{
//	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_13_00"); //Stop! Where d'you think you're going with our friend?
//	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_13_00"); //Halt! Wo soll's denn mit unserem Freund hier hingehen?
	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_13_00"); //Stůj! Kamže máš se svým přítelem namířeno?
	Info_ClearChoices(DIA_Grd_216_DustyZoll);
//	Info_AddChoice(DIA_Grd_216_DustyZoll,"That's none of your business!",DIA_Grd_216_DustyZoll_PissOff);
//	Info_AddChoice(DIA_Grd_216_DustyZoll,"Das geht dich einen Dreck an!",DIA_Grd_216_DustyZoll_PissOff);
	Info_AddChoice(DIA_Grd_216_DustyZoll,"To není tvoje věc!",DIA_Grd_216_DustyZoll_PissOff);
//	Info_AddChoice(DIA_Grd_216_DustyZoll,"We're on our way to the Brotherhood's camp.",DIA_Grd_216_DustyZoll_ToPSI);
//	Info_AddChoice(DIA_Grd_216_DustyZoll,"Wir sind unterwegs ins Lager der Bruderschaft.",DIA_Grd_216_DustyZoll_ToPSI);
	Info_AddChoice(DIA_Grd_216_DustyZoll,"Jsme na cestě do tábora Bratrstva.",DIA_Grd_216_DustyZoll_ToPSI);
	if (Npc_HasItems(other,itminugget) >= 100)
	{
//		Info_AddChoice(DIA_Grd_216_DustyZoll,"We're just going for a stroll. Here's 100 ore.",DIA_Grd_216_DustyZoll_LittleWalk);
//		Info_AddChoice(DIA_Grd_216_DustyZoll,"Wir machen einen kleinen Spaziergang. Hier sind 100 Erz.",DIA_Grd_216_DustyZoll_LittleWalk);
		Info_AddChoice(DIA_Grd_216_DustyZoll,"Jdeme na malou procházku. Tady je 100 nugetů.",DIA_Grd_216_DustyZoll_LittleWalk);
	};
};

func void DIA_Grd_216_DustyZoll_PissOff()
{
//	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_PissOff_15_00"); //That's none of your business!
//	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_PissOff_15_00"); //Das geht dich einen Dreck an!
	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_PissOff_15_00"); //To není tvoje věc!
//	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_PIssOff_13_00"); //I disagree!
//	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_PIssOff_13_00"); //Ich denke nicht!
	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_PIssOff_13_00"); //To si nemyslím!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");

	B_ExchangeRoutine(Vlk_524_Dusty,"start");
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0; // Immortal löschen
};

func void DIA_Grd_216_DustyZoll_ToPSI()
{
//	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_ToPsi_15_00"); //We're on our way to the Brotherhood's camp.
//	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_ToPsi_15_00"); //Wir sind unterwegs ins Lager der Bruderschaft.
	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_ToPsi_15_00"); //Jsme na cestě do tábora Bratrstva.
//	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_ToPsi_13_00"); //Well, you ain't gonna get there...
//	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_ToPsi_13_00"); //Wo ihr nie ankommen werdet...
	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_ToPsi_13_00"); //Tak tam se nedostanete...
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");

	B_ExchangeRoutine(Vlk_524_Dusty,"start");
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0; // Immortal löschen
};

func void DIA_Grd_216_DustyZoll_LittleWalk()
{
//	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_LittleWalk_15_00"); //We're just going for a stroll. Here's 100 ore.
//	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_LittleWalk_15_00"); //Wir machen einen kleinen Spaziergang. Hier sind 100 Erz.
	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_LittleWalk_15_00"); //Jdeme na malou procházku. Tady je 100 nugetů.
	if (Npc_HasItems(hero,itminugget) >= 100)
	{
//		AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_00"); //I never saw anything.
//		AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_00"); //Ich hab' nichts gesehen.
		AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_00"); //Nic jsem neviděl.

		B_GiveInvItems(hero,self,ItMiNugget, 100);
		DIA_Grd_216_DustyZoll.permanent = 0;
//		B_LogEntry(CH1_RecruitDusty,"I managed to bribe the guards at the rear south gate. Everyone has a price!");
//		B_LogEntry(CH1_RecruitDusty,"Die Wache am hinteren Südtor hat sich tatsächlich bestechen lassen. Es hat einfach jeder seinen Preis!");
		B_LogEntry(CH1_RecruitDusty,"Stráže u jižní brány se nechali lehce uplatit. Každý má svoji cenu!");
		B_GiveXP(XP_BribedDustyGuard);

		AI_StopProcessInfos(self);
	}
	else
	{
//		AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_02"); //Are you having me on? You won't get off that easy, kid!
//		AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_02"); //Du willst mich wohl verarschen? So nicht, Kleiner!
		AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_02"); //Děláš si ze mě blázny? Tak takhle ne, mladej!
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");

		B_ExchangeRoutine(Vlk_524_Dusty,"start");
		var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
		dusty.aivar[AIV_PARTYMEMBER] = FALSE;
		dusty.flags = 0; // Immortal löschen
	};
};

//-------------------------------------------------------
// WEGEN AUFNAHME GARDIST ZU THORUS SCHICKEN
//-------------------------------------------------------
instance GRD_216_Torwache_SEETHORUS(C_INFO)
{
	npc = GRD_216_Torwache;
	condition = GRD_216_Torwache_SEETHORUS_Condition;
	information = GRD_216_Torwache_SEETHORUS_Info;
	important = 1;
	permanent = 0;
};

func int GRD_216_Torwache_SEETHORUS_Condition()
{
	if (!Npc_KnowsInfo(hero,GRD_214_TORWACHE_SEETHORUS))
	&& ((CorKalom_BringMCQBalls == LOG_SUCCESS) || (Npc_HasItems(hero,ItAt_Crawlerqueen) >= 3))
	&& (!Npc_KnowsInfo(hero,GRD_200_Thorus_GARDIST))
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};
};

func void GRD_216_Torwache_SEETHORUS_Info()
{
//	AI_Output(self,other,"Grd_216_Torwache_SEETHORUS_Info_13_01"); //Hey, I'm glad you showed up. Thorus wants to see you!
//	AI_Output(self,other,"Grd_216_Torwache_SEETHORUS_Info_13_01"); //Hey, gut dass du da bist. Thorus will dich sprechen!
	AI_Output(self,other,"Grd_216_Torwache_SEETHORUS_Info_13_01"); //Hej, jsem rád, že tu jsi. Thorus s tebou chce mluvit.
//	AI_Output(other,self,"Grd_216_Torwache_SEETHORUS_Info_15_02"); //What does he want?
//	AI_Output(other,self,"Grd_216_Torwache_SEETHORUS_Info_15_02"); //Was will er denn?
	AI_Output(other,self,"Grd_216_Torwache_SEETHORUS_Info_15_02"); //Co chce?
//	AI_Output(self,other,"Grd_216_Torwache_SEETHORUS_Info_13_03"); //Why, I'm sure he'll tell you soon enough.
//	AI_Output(self,other,"Grd_216_Torwache_SEETHORUS_Info_13_03"); //Das wird er dir schon selber sagen.
	AI_Output(self,other,"Grd_216_Torwache_SEETHORUS_Info_13_03"); //Určitě ti to brzy sám řekne.
};
