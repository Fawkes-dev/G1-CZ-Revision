// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Grd_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Grd_6 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Grd_6_EXIT_Condition;
	information = Info_Grd_6_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Grd_6_EXIT_Condition()
{
	return 1;
};

func void Info_Grd_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Grd_6_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 1;
	condition = Info_Grd_6_EinerVonEuchWerden_Condition;
	information = Info_Grd_6_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "D'you need an extra man?";
//	description = "Ich will Gardist werden.";
	description = "Nepotřebujete jednoho dobrého chlapa?";
};

func int Info_Grd_6_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) != GIL_GRD)
	&& (Npc_GetTrueGuild(other) != GIL_KDF)
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

func void Info_Grd_6_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Grd_6_EinerVonEuchWerden_15_00"); //D'you need an extra man?
//	AI_Output(other,self,"Info_Grd_6_EinerVonEuchWerden_15_00"); //Könnt ihr noch einen guten Mann brauchen?
	AI_Output(other,self,"Info_Grd_6_EinerVonEuchWerden_15_00"); //Nepotřebujete jednoho dobrého chlapa?
//	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_01"); //You must be one of the new ones, eh? If you're looking for a camp to join, try the sect loonies, they're not fussy about who they take on.
//	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_01"); //Frischling, was? Wenn du ein Lager suchst, das dich aufnimmt, probier's doch bei den Sektenspinnern, die nehmen jeden.
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_01"); //Ty musíš být jedním z těch nových, co? Jestli se rozmýšlíš, ke kterému táboru se dát, zkus ty sektářské blázny, těm je fuk, koho zaměstnávají.
//	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_02"); //We don't take just anyone, not unless you wanna go digging in the Old Mine!
//	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_02"); //Bei uns wird nicht jeder genommen, es sei denn, du willst in der alten Mine buddeln gehen!
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_02"); //Nikoho nebereme, ale ty bys mohl jít kopat do Starého dolu!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Grd_6_WichtigePersonen(C_INFO)
{
	nr = 1;
	condition = Info_Grd_6_WichtigePersonen_Condition;
	information = Info_Grd_6_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Grd_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Grd_6_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Grd_6_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Grd_6_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other,self,"Info_Grd_6_WichtigePersonen_15_00"); //Kdo to tady vede?
//	AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_01"); //Thorus is the one that makes sure things don't fall apart. He's right under Gomez.
//	AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_01"); //Thorus kümmert sich drum das alles läuft. Er ist direkt von Gomez beauftragt.
	AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_01"); //Thorus je jedním z těch, kteří hlídají, aby se nic neztratilo. Je dvojka hned po Gomezovi.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Grd_6_DasLager(C_INFO)
{
	nr = 1;
	condition = Info_Grd_6_DasLager_Condition;
	information = Info_Grd_6_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "I'm new here. How's things?";
//	description = "Ich bin neu hier. Was läuft denn so?";
	description = "Jsem tady nový.";
};

func int Info_Grd_6_DasLager_Condition()
{
	if (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
func void Info_Grd_6_DasLager_Info()
{
//	AI_Output(other,self,"Info_Grd_6_DasLager_15_00"); //I'm new here.
//	AI_Output(other,self,"Info_Grd_6_DasLager_15_00"); //Ich bin neu hier.
	AI_Output(other,self,"Info_Grd_6_DasLager_15_00"); //Jsem tady nový.
//	AI_Output(self,other,"Info_Grd_6_DasLager_06_01"); //So I see.
//	AI_Output(self,other,"Info_Grd_6_DasLager_06_01"); //Sehe ich.
	AI_Output(self,other,"Info_Grd_6_DasLager_06_01"); //Tak uvidíme.
//	AI_Output(other,self,"Info_Grd_6_DasLager_15_02"); //How's things?
//	AI_Output(other,self,"Info_Grd_6_DasLager_15_02"); //Was läuft denn so?
	AI_Output(other,self,"Info_Grd_6_DasLager_15_02"); //Jak to jde?
//	AI_Output(self,other,"Info_Grd_6_DasLager_06_03"); //You make trouble here, you get punished.
//	AI_Output(self,other,"Info_Grd_6_DasLager_06_03"); //Wer hier Ärger macht bekommt was aufs Maul.
	AI_Output(self,other,"Info_Grd_6_DasLager_06_03"); //Jestli tu budeš dělat problémy, budeš potrestán.
	Info_ClearChoices(Info_Grd_6_DasLager);
//	Info_AddChoice(Info_Grd_6_DasLager,"I see.", Info_Grd_6_DasLager_Verstehe);
//	Info_AddChoice(Info_Grd_6_DasLager,"Verstehe.", Info_Grd_6_DasLager_Verstehe);
	Info_AddChoice(Info_Grd_6_DasLager,"Aha...", Info_Grd_6_DasLager_Verstehe);
//	Info_AddChoice(Info_Grd_6_DasLager,"What do you call trouble?", Info_Grd_6_DasLager_WasIstAerger);
//	Info_AddChoice(Info_Grd_6_DasLager,"Was verstehst du unter Ärger?", Info_Grd_6_DasLager_WasIstAerger);
	Info_AddChoice(Info_Grd_6_DasLager,"Čemu říkáš problémy?", Info_Grd_6_DasLager_WasIstAerger);
};

func void Info_Grd_6_DasLager_Verstehe()
{
//	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00"); //I see.
//	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00"); //Verstehe.
	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00"); //Já vím.
	Info_ClearChoices(Info_Grd_6_DasLager);
};

func void Info_Grd_6_DasLager_WasIstAerger()
{
//	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_00"); //What do you call trouble?
//	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_00"); //Was verstehst du unter Ärger?
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_00"); //Čemu říkáš problémy?
//	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_01"); //Most diggers pay us to protect 'em.
//	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_01"); //Die meisten Buddler bezahlen uns, damit wir sie beschützen.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_01"); //Většina kopáčů nám platí za ochranu.
//	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_02"); //If you mess with one of them, we'll deal with you.
//	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_02"); //Wenn du dich mit einem von ihnen anlegst, lernst du uns kennen.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_02"); //Pokud se někoho z nich dotkneš, vyřídíme si to s tebou.
//	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_03"); //If I catch you rummaging around in other people's huts...
//	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_03"); //Erwische ich dich beim rumstöbern in fremden Hütten ...
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_03"); //Jestli tě nachytám šmejdit kolem cizích chatrčí..
//	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); //Okay, okay, I get the point.
//	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); //Schon gut, ich hab's verstanden.
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); //Dobře, dobře. Dám si pozor.
	Info_ClearChoices(Info_Grd_6_DasLager);
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Grd_6_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Grd_6_DieLage_Condition;
	information = Info_Grd_6_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Grd_6_DieLage_Condition()
{
	return 1;
};

func void Info_Grd_6_DieLage_Info()
{
//	AI_Output(other,self,"Info_Grd_6_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_Grd_6_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other,self,"Info_Grd_6_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Grd_6_DieLage_06_01"); //You lookin' for trouble?
//	AI_Output(self,other,"Info_Grd_6_DieLage_06_01"); //Willst du Ärger machen?
	AI_Output(self,other,"Info_Grd_6_DieLage_06_01"); //Říkáš si o malér?
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_GRD_6(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);

	Info_Grd_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_DieLage.npc = Hlp_GetInstanceID(slf);
};
