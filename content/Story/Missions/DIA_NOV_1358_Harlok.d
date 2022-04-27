// **************************************************
//						EXIT
// **************************************************

instance DIA_Harlok_Exit(C_INFO)
{
	npc = Nov_1358_Harlok;
	nr = 999;
	condition = DIA_Harlok_Exit_Condition;
	information = DIA_Harlok_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Harlok_Exit_Condition()
{
	return 1;
};

func void DIA_Harlok_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//				Harlok abholen
// **************************************************

instance DIA_Harlok_FetchHarlok(C_INFO)
{
	npc = Nov_1358_Harlok;
	nr = 1;
	condition = DIA_Harlok_FetchHarlok_Condition;
	information = DIA_Harlok_FetchHarlok_Info;
	important = 0;
	permanent = 0;
//	description = "Ghorim sent me.";
//	description = "Ghorim schickt mich.";
	description = "Poslal mě Ghorim.";
};

func int DIA_Harlok_FetchHarlok_Condition()
{
	if (Ghorim_KickHarlok == LOG_RUNNING)
	{
		return 1;
	};

	return 0;
};

func void DIA_Harlok_FetchHarlok_Info()
{
//	AI_Output(other,self,"DIA_Harlok_FetchHarlok_15_00"); //Ghorim sent me.
//	AI_Output(other,self,"DIA_Harlok_FetchHarlok_15_00"); //Ghorim schickt mich.
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_15_00"); //Poslal mě Ghorim.
//	AI_Output(self,other,"DIA_Harlok_FetchHarlok_01_01"); //What?
//	AI_Output(self,other,"DIA_Harlok_FetchHarlok_01_01"); //Was?
	AI_Output(self,other,"DIA_Harlok_FetchHarlok_01_01"); //Cože?
	Info_ClearChoices(DIA_Harlok_FetchHarlok);
	Info_Addchoice (DIA_Harlok_FetchHarlok,DIALOG_BACK ,DIA_Harlok_FetchHarlok_BACK);
//	Info_Addchoice (DIA_Harlok_FetchHarlok,"Get your arse to the weed mashers or you'll be for it. ",DIA_Harlok_FetchHarlok_OrElse);
//	Info_Addchoice (DIA_Harlok_FetchHarlok,"Schwing deinen Hintern zu den Krautstampfern, oder es gibt saures.",DIA_Harlok_FetchHarlok_OrElse);
	Info_Addchoice (DIA_Harlok_FetchHarlok,"Pohni svým zadkem k mísičům drogy, nebo uvidíš.",DIA_Harlok_FetchHarlok_OrElse);
//	Info_Addchoice (DIA_Harlok_FetchHarlok,"I'm here to remind you that you're to take over from him.",DIA_Harlok_FetchHarlok_Please);
//	Info_Addchoice (DIA_Harlok_FetchHarlok,"Ich soll dich daran erinnern, dass du ihn ablösen sollst.",DIA_Harlok_FetchHarlok_Please);
	Info_Addchoice (DIA_Harlok_FetchHarlok,"Mám ti připomenout, že ho máš vystřídat.",DIA_Harlok_FetchHarlok_Please);
};

func int DIA_Harlok_FetchHarlok_Please()
{
//	AI_Output(other,self,"DIA_Harlok_FetchHarlok_Please_15_00"); //I'm here to remind you that you're to take over from him.
//	AI_Output(other,self,"DIA_Harlok_FetchHarlok_Please_15_00"); //Ich soll dich daran erinnern, dass du ihn ablösen sollst.
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_Please_15_00"); //Mám ti připomenout, že ho máš vystřídat.
//	AI_Output(self,other,"DIA_Harlok_FetchHarlok_Please_01_01"); //That's very nice of you. Remind me again when I'm through sleeping, yeah?
//	AI_Output(self,other,"DIA_Harlok_FetchHarlok_Please_01_01"); //Das ist aber nett von dir. Erinnere mich doch noch mal, wenn ich ausgeschlafen habe, ja?
	AI_Output(self,other,"DIA_Harlok_FetchHarlok_Please_01_01"); //To je od tebe hezké. Připomeň mi to znova, až budu spát, jo?
};

func int DIA_Harlok_FetchHarlok_OrElse()
{
//	AI_Output(other,self,"DIA_Harlok_FetchHarlok_OrElse_15_00"); //Get your ass to the weed mashers or you'll be for it.
//	AI_Output(other,self,"DIA_Harlok_FetchHarlok_OrElse_15_00"); //Schwing deinen Hintern zu den Krautstampfern, oder es gibt Saures.
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_OrElse_15_00"); //Pohni svým zadkem k mísičům drogy, nebo uvidíš.
//	AI_Output(self,other,"DIA_Harlok_FetchHarlok_OrElse_01_01"); //Just TRY to mess with me again, sucker!
//	AI_Output(self,other,"DIA_Harlok_FetchHarlok_OrElse_01_01"); //VERSUCH doch mal, dich mit mir anzulegen, du Penner!
	AI_Output(self,other,"DIA_Harlok_FetchHarlok_OrElse_01_01"); //ZKUS mě s tím ještě jednou otravovat, cucáku!

	AI_StopProcessInfos(self);
};

func int DIA_Harlok_FetchHarlok_BACK()
{
//	AI_Output(other,self,"DIA_Harlok_FetchHarlok_BACK_15_00"); //Okay, okay.
//	AI_Output(other,self,"DIA_Harlok_FetchHarlok_BACK_15_00"); //Schon gut.
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_BACK_15_00"); //Dobře, dobře...
	Info_ClearChoices(DIA_Harlok_FetchHarlok);
};

// **************************************************
//				Harlok NOCHMAL überzeugen
// **************************************************

instance DIA_Harlok_HarlokAgain(C_INFO)
{
	npc = Nov_1358_Harlok;
	nr = 1;
	condition = DIA_Harlok_HarlokAgain_Condition;
	information = DIA_Harlok_HarlokAgain_Info;
	important = 0;
	permanent = 0;
//	description = "I just wanted to remind you to take your pal's place now!";
//	description = "Ich wollte dich nochmal dran erinnern, deinen Kumpel abzulösen!";
	description = "Chtěl jsem ti jenom připomenout, že bys měl ihned vystřídat svého kamaráda!";
};

func int DIA_Harlok_HarlokAgain_Condition()
{
	if ((self.aivar[AIV_WASDEFEATEDBYSC] == FALSE)
	&& (Npc_KnowsInfo(hero,DIA_Harlok_FetchHarlok)))
	{
		return 1;
	};

	return 0;
};

func void DIA_Harlok_HarlokAgain_Info()
{
//	AI_Output(other,self,"DIA_Harlok_HarlokAgain_15_00"); //I just wanted to remind you to take your pal's place now!
//	AI_Output(other,self,"DIA_Harlok_HarlokAgain_15_00"); //Ich wollte dich noch mal dran erinnern, deinen Kumpel abzulösen!
	AI_Output(other,self,"DIA_Harlok_HarlokAgain_15_00"); //Chtěl jsem ti jenom připomenout, že bys měl ihned vystřídat svého kamaráda!
//	AI_Output(self,other,"DIA_Harlok_HarlokAgain_01_01"); //Listen! I told you to get lost!
//	AI_Output(self,other,"DIA_Harlok_HarlokAgain_01_01"); //Hör zu! Ich habe gesagt, mach, dass du wegkommst!
	AI_Output(self,other,"DIA_Harlok_HarlokAgain_01_01"); //Poslouchej! Řekl jsem ti, aby ses ztratil!

//	B_LogEntry(CH1_GhorimsRelief,"Looks like Harlok's not only lazy but stubborn as well. Perhaps I should help him along ...");
//	B_LogEntry(CH1_GhorimsRelief,"Harlok scheint ein uneinsichtiger Faulenzer zu sein. Ich glaube ich sollte seiner Einsicht etwas auf die Sprünge helfen...");
	B_LogEntry(CH1_GhorimsRelief,"Vypadá to, že je Harlok nejen líný, ale také tvrdohlavý. Snad bych mu měl pomoci...");
};

// **************************************************
//				Harlok schicken (nach Aufs-Maul)
// **************************************************

instance DIA_Harlok_SendHarlok(C_INFO)
{
	npc = Nov_1358_Harlok;
	nr = 1;
	condition = DIA_Harlok_SendHarlok_Condition;
	information = DIA_Harlok_SendHarlok_Info;
	important = 0;
	permanent = 0;
//	description = "Well, d'you feel like giving your pal a break now? ";
//	description = "Hast du langsam Lust bekommen, deinen Freud abzulösen?";
	description = "Dobrá, nemáš pocit, že bys měl taky nechat svého kamaráda odpočinout?";
};

func int DIA_Harlok_SendHarlok_Condition()
{
	if ((self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	&& (Npc_KnowsInfo(hero,DIA_Harlok_FetchHarlok)))
	{
		return 1;
	};

	return 0;
};

func void DIA_Harlok_SendHarlok_Info()
{
//	AI_Output(other,self,"DIA_Harlok_SendHarlok_15_00"); //Well, d'you feel like giving your pal a break now?
//	AI_Output(other,self,"DIA_Harlok_SendHarlok_15_00"); //Na, hast du langsam Lust bekommen, deinen Freund abzulösen?
	AI_Output(other,self,"DIA_Harlok_SendHarlok_15_00"); //Dobrá, nemáš pocit, že bys měl taky nechat svého kamaráda odpočinout?
//	AI_Output(self,other,"DIA_Harlok_SendHarlok_01_01"); //You damn pain in the butt! Why do you have to meddle in my affairs?
//	AI_Output(self,other,"DIA_Harlok_SendHarlok_01_01"); //Du verdammter Mistkerl! Wieso mischst du dich überhaupt in unsere Angelegenheiten?
	AI_Output(self,other,"DIA_Harlok_SendHarlok_01_01"); //Ty zatracenej otrapo! Proč se musíš plést do mých věcí?
//	AI_Output(other,self,"DIA_Harlok_SendHarlok_15_02"); //I just want to see you mashing.
//	AI_Output(other,self,"DIA_Harlok_SendHarlok_15_02"); //Ich will dich einfach stampfen sehen.
	AI_Output(other,self,"DIA_Harlok_SendHarlok_15_02"); //Akorát tě chci vidět pracovat.
//	AI_Output(self,other,"DIA_Harlok_SendHarlok_01_03"); //Okay, okay - I'm on my way... sucker!
//	AI_Output(self,other,"DIA_Harlok_SendHarlok_01_03"); //Ist ja schon gut - ich gehe ja ...  Mistkerl!
	AI_Output(self,other,"DIA_Harlok_SendHarlok_01_03"); //Dobře, dobře - už jdu... cucáku!

//	B_LogEntry(CH1_GhorimsRelief,"Harlok finally got the message. Now he will take over from Ghorim.");
//	B_LogEntry(CH1_GhorimsRelief,"Harlok -traf- die Einsicht. Er will nun Ghorim ablösen.");
	B_LogEntry(CH1_GhorimsRelief,"Harlokovi to konečně došlo. Teď už vystřídá Ghorima.");
	B_GiveXP(XP_SentHarlok);

	Npc_ExchangeRoutine(self,"START");
	var C_NPC Ghorim; Ghorim = Hlp_GetNpc(Nov_1310_Ghorim);
	Npc_ExchangeRoutine(Ghorim,"START");
	Ghorim_KickHarlok = LOG_SUCCESS;
	Npc_SetPermAttitude(Ghorim,ATT_FRIENDLY);
	Npc_SetPermAttitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
};

// **************************************************
//			Harlok REFUSE TALK - PERM
// **************************************************

instance DIA_Harlok_Angry(C_INFO)
{
	npc = Nov_1358_Harlok;
	nr = 1;
	condition = DIA_Harlok_Angry_Condition;
	information = DIA_Harlok_Angry_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Harlok_Angry_Condition()
{
	if ((Npc_IsInState(self,ZS_TALK))
	&& (Ghorim_KickHarlok == LOG_SUCCESS))
	{
		return 1;
	};

	return 0;
};

func void DIA_Harlok_Angry_Info()
{
//	AI_Output(self,other,"DIA_Harlok_Angry_01_00"); //Leave me alone! I'm going...
//	AI_Output(self,other,"DIA_Harlok_Angry_01_00"); //Lass mich in Ruhe! Ich mach' ja schon ...
	AI_Output(self,other,"DIA_Harlok_Angry_01_00"); //Nech mě na pokoji! Vždyť už dělám...

	AI_StopProcessInfos(self);
};
