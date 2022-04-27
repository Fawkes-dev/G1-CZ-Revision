// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Stt_10_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Stt_10 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Stt_10_EXIT_Condition;
	information = Info_Stt_10_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Stt_10_EXIT_Condition()
{
	return 1;
};

func void Info_Stt_10_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Stt_10_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Stt_10_EinerVonEuchWerden_Condition;
	information = Info_Stt_10_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "I want to be a Shadow.";
//	description = "Ich will ein Schatten werden.";
	description = "Chci být Stínem.";
};

func int Info_Stt_10_EinerVonEuchWerden_Condition()
{
	 if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Stt_10_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_15_00"); //I wanna be a Shadow.
//	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_15_00"); //Ich will ein Schatten werden.
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_15_00"); //Chci být Stínem.
//	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_10_01"); //Oh? Have you talked to Diego yet?
//	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_10_01"); //So? Hast du schon mit Diego geredet?
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_10_01"); //He? Už jsi to říkal Diegovi?

	var C_NPC Diego; Diego = Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;

	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
//	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"No.", Info_Stt_10_EinerVonEuchWerden_Nein);
//	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Nein.", Info_Stt_10_EinerVonEuchWerden_Nein);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Ne.", Info_Stt_10_EinerVonEuchWerden_Nein);
//	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Yes.", Info_Stt_10_EinerVonEuchWerden_Ja);
//	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Ja.", Info_Stt_10_EinerVonEuchWerden_Ja);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Ano.", Info_Stt_10_EinerVonEuchWerden_Ja);
};

func void Info_Stt_10_EinerVonEuchWerden_Nein()
{
//	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Nein_15_00"); //Not yet.
//	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Nein_15_00"); //Bis jetzt noch nicht.
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Nein_15_00"); //Ještě ne.
//	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Nein_10_01"); //Then do so, you'll find him at the entrance to the castle.
//	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Nein_10_01"); //Dann mach das, du findest ihn am Eingang der Burg.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Nein_10_01"); //Tak to udělej, najdeš ho u vstupu do hradu.
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

func void Info_Stt_10_EinerVonEuchWerden_Ja()
{
//	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Ja_15_00"); //Yeah, I have.
//	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Ja_15_00"); //Ja, habe ich.
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Ja_15_00"); //Jo, udělám.
//	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Ja_10_01"); //Good. You just do as he says then. It didn't do me any harm. Well, not really, anyway.
//	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Ja_10_01"); //Gut. Tu einfach, was er sagt. Das hat mir auch nicht geschadet. Jedenfalls nicht wirklich .
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Ja_10_01"); //Dobře. Jednoduše udělej, co ti řekne. Mně se nic nestane. Tedy, doopravdy ne.
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Stt_10_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Stt_10_WichtigePersonen_Condition;
	information = Info_Stt_10_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "What people should I know round here?";
//	description = "Wen von den Leuten hier sollte ich kennen?";
	description = "Jaké lidi bych tu měl znát?";
};

func int Info_Stt_10_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Stt_10_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Stt_10_WichtigePersonen_15_00"); //What people should I know around here?
//	AI_Output(other,self,"Info_Stt_10_WichtigePersonen_15_00"); //Wen von den Leuten hier sollte ich kennen?
	AI_Output(other,self,"Info_Stt_10_WichtigePersonen_15_00"); //Jaké lidi bych tu měl znát?
//	AI_Output(self,other,"Info_Stt_10_WichtigePersonen_10_01"); //If you get into any trouble with the guards, go and see Gravo. You'll find him at the bathing place near the castle gate. He deals with guys who get into trouble. It happens quicker than you'd expect, especially to newcomers.
//	AI_Output(self,other,"Info_Stt_10_WichtigePersonen_10_01"); //Wenn du mal Probleme mit den Gardisten hast, geh zu Gravo. Du findest ihn am Waschplatz beim Burgtor. Er kümmert sich um Leute, die Ärger haben. Besonders bei Neuen passiert das hier schneller, als du denkst.
	AI_Output(self,other,"Info_Stt_10_WichtigePersonen_10_01"); //Jestli se dostaneš do problémů se stráží, jdi za Gravem. Najdeš ho u koupaliště nedaleko hradní brány. Ten to urovná s tím, s kým bys měl problémy. Nováčkům se to stane rychleji, než by je to napadlo.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Stt_10_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Stt_10_DasLager_Condition;
	information = Info_Stt_10_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "What can you tell me about the Camp?";
//	description = "Was kannst du mir über das Lager sagen?";
	description = "Můžeš mi říci něco o táboře?";
};

func int Info_Stt_10_DasLager_Condition()
{
	return 1;
};

func void Info_Stt_10_DasLager_Info()
{
//	AI_Output(other,self,"Info_Stt_10_DasLager_15_00"); //What can you tell me about the Camp?
//	AI_Output(other,self,"Info_Stt_10_DasLager_15_00"); //Was kannst du mir über das Lager sagen?
	AI_Output(other,self,"Info_Stt_10_DasLager_15_00"); //Co mi můžeš říci o táboru?
//	AI_Output(self,other,"Info_Stt_10_DasLager_10_01"); //I guess the most interesting part of it is the market place. If you're looking for anything in particular, that's the place to go.
//	AI_Output(self,other,"Info_Stt_10_DasLager_10_01"); //Am interessantesten hier ist wohl der Marktplatz. Wenn du mal was Bestimmtes suchst - da kriegst du fast alles.
	AI_Output(self,other,"Info_Stt_10_DasLager_10_01"); //Myslím, že nejzajímavější místo je tržiště. Když budeš shánět něco speciálního, tam to určitě najdeš.
//	AI_Output(self,other,"Info_Stt_10_DasLager_10_02"); //It's the place under the large roof south of the Outer Ring.
//	AI_Output(self,other,"Info_Stt_10_DasLager_10_02"); //Es ist der Platz unter dem großen Dach im Süden des äußeren Rings.
	AI_Output(self,other,"Info_Stt_10_DasLager_10_02"); //To je to místo pod velkou jižní střechou Vnějšího okruhu.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Stt_10_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Stt_10_DieLage_Condition;
	information = Info_Stt_10_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "Hi!";
	description = "Zdar!";
};

func int Info_Stt_10_DieLage_Condition()
{
	return 1;
};

func void Info_Stt_10_DieLage_Info()
{
//	AI_Output(other,self,"Info_Stt_10_DieLage_15_00"); //Hi!
	AI_Output(other,self,"Info_Stt_10_DieLage_15_00"); //Zdar!
//	AI_Output(self,other,"Info_Stt_10_DieLage_10_01"); //What do you want?
//	AI_Output(self,other,"Info_Stt_10_DieLage_10_01"); //Was willst du?
	AI_Output(self,other,"Info_Stt_10_DieLage_10_01"); //Co chceš?
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Stt_10(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);

	Info_Stt_10_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_DieLage.npc = Hlp_GetInstanceID(slf);
};
