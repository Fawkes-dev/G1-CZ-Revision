//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============
//	NSC: Grd_212_Torwache
//	Lager: OldCamp
//	Durchgang: Inneres Tor zur Burg (rechte Wache)
//	Uhrzeit: 24h
//
//	Es passiert folgendes:
//	1. Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2. Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3. Nähert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////
CONST STRING Grd_212_CHECKPOINT = "OCC_GATE_INSIDE";

instance Info_Grd_212_FirstWarn(C_INFO)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_FirstWarn_Condition;
	information = Info_Grd_212_FirstWarn_Info;
	permanent = 1;
	important = 1;
};

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_Grd_212_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&& (self.aivar[AIV_PASSGATE] == FALSE )
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY )
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	{
		return TRUE;
	};
};

func void Info_Grd_212_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);

//	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_01"); //HOLD IT!
//	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_01"); //HALT!
	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_01"); //STŮJ!
//	AI_Output(hero,self,"Info_Grd_212_FirstWarn_Info_15_02"); //What's up?
//	AI_Output(hero,self,"Info_Grd_212_FirstWarn_Info_15_02"); //Was ist?
	AI_Output(hero,self,"Info_Grd_212_FirstWarn_Info_15_02"); //Co je?
//	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_03"); //You can't enter the castle without permission! Now get out of here!
//	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_03"); //Die Burg darf nur mit Genehmigung betreten werden! Mach, dass du verschwindest!
	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_03"); //Nemůžeš vstoupit do hradu bez povolení! Padej pryč!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_212_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_Grd_212_LastWarn(C_INFO)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_LastWarn_Condition;
	information = Info_Grd_212_LastWarn_Info;
	permanent = 1;
	important = 1;
};

func int Info_Grd_212_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN )
	&& (self.aivar[AIV_PASSGATE] == FALSE )
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY )
	&& (Npc_GetDistToWP(hero,Grd_212_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP]-100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)))
	{
		return TRUE;
	};
};

func int Info_Grd_212_LastWarn_Info()
{
//	AI_Output(self,hero,"Info_Grd_212_LastWarn_13_01"); //Are you deaf? One more step and you're worm food!
//	AI_Output(self,hero,"Info_Grd_212_LastWarn_13_01"); //Bist du taub? Noch ein Schritt und du bist Futter für die Würmer!
	AI_Output(self,hero,"Info_Grd_212_LastWarn_13_01"); //Jsi hluchý? Ještě krok a je z tebe potrava pro červy!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_212_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Grd_212_Attack(C_INFO)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_Attack_Condition;
	information = Info_Grd_212_Attack_Info;
	permanent = 1;
	important = 1;
};

func int Info_Grd_212_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN )
	&& (self.aivar[AIV_PASSGATE] == FALSE )
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY )
	&& (Npc_GetDistToWP(hero,Grd_212_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP]-100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)))
	{
		return TRUE;
	};
};

func int Info_Grd_212_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;

	B_FullStop(self);
	AI_StopProcessInfos(self); //dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert(self,other);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack, 1, "");
};

// ************************************************************
// 			  				   EXIT
// ************************************************************

instance Info_Grd_212_EXIT(C_INFO)
{
	npc = Grd_212_Torwache;
	nr = 999;
	condition = Info_Grd_212_EXIT_Condition;
	information = Info_Grd_212_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Grd_212_EXIT_Condition()
{
	return 1;
};

func void Info_Grd_212_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						PERM Abblitzen
// ************************************************************

instance Info_Grd_212_Abblitzen(C_INFO)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_Abblitzen_Condition;
	information = Info_Grd_212_Abblitzen_Info;
	permanent = 1;
//	description = "I want to get in the castle!";
//	description = "Ich will in die Burg.";
	description = "Chci se dostat na hrad!";
};

func int Info_Grd_212_Abblitzen_Condition()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

func void Info_Grd_212_Abblitzen_Info()
{
//	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_00"); //I want to get in the castle!
//	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_00"); //Ich will in die Burg!
	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_00"); //Chci se dostat na hrad!
//	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_01"); //Interesting! I wanna get out of the goddamn colony!
//	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_01"); //Das ist ja interessant! ICH will raus aus der verdammten Kolonie!
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_01"); //Zajímavé! Já se chci dostat z téhle proklaté Kolonie!
//	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_02"); //I can think of better things than stopping bums like you from going where they've no business.
//	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_02"); //Kann mir nämlich was Besseres vorstellen, als Pennern wie dir den Eintritt zu verbieten.
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_02"); //Umím si představit lepší práci, než zastavovat takové pobudy jako ty, aby nelezli tam, kde nemají co dělat!
//	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_03"); //You could just let me in...
//	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_03"); //Du könntest mich auch reinlassen.
	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_03"); //Mohl bys mě nechat jenom vejít...
//	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_04"); //No, I can't! Thorus can.
//	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_04"); //Kann ich nicht! Thorus kann das.
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_04"); //Ne, nemohl! To může Thorus.
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Erstes Mal rein
// ************************************************************

instance Info_Grd_212_FirstIn(C_INFO)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_FirstIn_Condition;
	information = Info_Grd_212_FirstIn_Info;
	permanent = 0;
	important = 1;
};

func int Info_Grd_212_FirstIn_Condition()
{
	if (self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void Info_Grd_212_FirstIn_Info()
{
//	AI_Output(self,other,"Info_Grd_212_FirstIn_13_00"); //Stop!
//	AI_Output(self,other,"Info_Grd_212_FirstIn_13_00"); //Halt!
	AI_Output(self,other,"Info_Grd_212_FirstIn_13_00"); //Stůj!
//	AI_Output(other,self,"Info_Grd_212_FirstIn_15_01"); //Relax! I've talked to Thorus. I'm allowed in.
//	AI_Output(other,self,"Info_Grd_212_FirstIn_15_01"); //Entspann dich! Ich hab' mit Thorus geredet. Ich kann rein.
	AI_Output(other,self,"Info_Grd_212_FirstIn_15_01"); //Klid. Mluvil jsem s Thorusem. Smím dovnitř.
//	AI_Output(self,other,"Info_Grd_212_FirstIn_13_02"); //I won't forget your face, pal! You get into trouble and it won't end quickly!
//	AI_Output(self,other,"Info_Grd_212_FirstIn_13_02"); //Ich werd' mir deine Visage merken. Wenn du Ärger machst, bist du dran!
	AI_Output(self,other,"Info_Grd_212_FirstIn_13_02"); //Budu si tě pamatovat, příteli! Pokud budeš dělat problémy, je s tebou konec!
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						PERM Nach FirstIn
// ************************************************************

instance Info_Grd_212_Passgate(C_INFO)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_Passgate_Condition;
	information = Info_Grd_212_Passgate_Info;
	permanent = 1;
//	description = "Can I still go in?";
//	description = "Kann ich immer noch rein?";
	description = "Můžu ještě pořád dovnitř?";
};

func int Info_Grd_212_Passgate_Condition()
{
	if (self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void Info_Grd_212_Passgate_Info()
{
//	AI_Output(other,self,"Info_Grd_212_Passgate_15_00"); //Can I still go in?
//	AI_Output(other,self,"Info_Grd_212_Passgate_15_00"); //Kann ich immer noch rein?
	AI_Output(other,self,"Info_Grd_212_Passgate_15_00"); //Můžu ještě pořád dovnitř?
//	AI_Output(self,other,"Info_Grd_212_Passgate_13_01"); //Only if you quit asking stupid questions.
//	AI_Output(self,other,"Info_Grd_212_Passgate_13_01"); //Wenn du noch mal so dämlich fragst, nicht mehr.
	AI_Output(self,other,"Info_Grd_212_Passgate_13_01"); //Jen když se přestaneš takhle blbě ptát.
	AI_StopProcessInfos(self);
};
