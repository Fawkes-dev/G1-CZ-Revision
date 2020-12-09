//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	=============== 
//	NSC: Grd_213_Torwache
//	Lager: OldCamp 
//	Durchgang: Inneres Tor zur Burg (linke Wache)
//	Uhrzeit: 24h
//
//	Es passiert folgendes:
//	1. Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2. Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3. Nähert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////
const string Grd_213_CHECKPOINT = "OCC_GATE_INSIDE";

instance Info_Grd_213_FirstWarn(C_INFO)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_FirstWarn_Condition;
	information = Info_Grd_213_FirstWarn_Info;
	permanent = 1;
	important = 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_Grd_213_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&& (self.aivar[AIV_PASSGATE] == FALSE ) 
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY ) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	{
		return TRUE;
	};
};

func void Info_Grd_213_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);

//	AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_01"); //HOLD IT!
//	AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_01"); //HALT!
	AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_01"); //STŮJ!
//	AI_Output(hero,self,"Info_Grd_213_FirstWarn_Info_15_02"); //What's up?
//	AI_Output(hero,self,"Info_Grd_213_FirstWarn_Info_15_02"); //Was ist?
	AI_Output(hero,self,"Info_Grd_213_FirstWarn_Info_15_02"); //Co se děje?
//	AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_03"); //You can't go in the castle! Beat it!
//	AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_03"); //Du darfst nicht in die Burg! Hau ab!
	AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_03"); //Na hrad nesmíš! Vypadni!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_213_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN; 

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_Grd_213_LastWarn(C_INFO)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_LastWarn_Condition;
	information = Info_Grd_213_LastWarn_Info;
	permanent = 1;
	important = 1;
};                       

func int Info_Grd_213_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN )
	&& (self.aivar[AIV_PASSGATE] == FALSE ) 
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY ) 
	&& (Npc_GetDistToWP(hero,Grd_213_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP]-100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) 
	{
		return TRUE;
	};
};

func int Info_Grd_213_LastWarn_Info()
{
//	AI_Output(self,hero,"Info_Grd_213_LastWarn_07_01"); //Are you deaf? One more step and you're worm food!
//	AI_Output(self,hero,"Info_Grd_213_LastWarn_07_01"); //Bist du taub? Noch ein Schritt und du bist Futter für die Würmer!
	AI_Output(self,hero,"Info_Grd_213_LastWarn_07_01"); //Jsi hluchý? Ještě krok a je z tebe potrava pro červy!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_213_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN; 

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Grd_213_Attack(C_INFO)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_Attack_Condition;
	information = Info_Grd_213_Attack_Info;
	permanent = 1;
	important = 1;
};                       

func int Info_Grd_213_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN )
	&& (self.aivar[AIV_PASSGATE] == FALSE ) 
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY ) 
	&& (Npc_GetDistToWP(hero,Grd_213_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP]-100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) 
	{
		return TRUE;
	};
};

func int Info_Grd_213_Attack_Info()
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
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN //
------------------------------------------------------------------------*/
instance Grd_213_Torwache_WELCOME(C_INFO)
{
	npc = Grd_213_Torwache;
	condition = Grd_213_Torwache_WELCOME_Condition;
	information = Grd_213_Torwache_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int Grd_213_Torwache_WELCOME_Condition()
{ 
	if (Npc_GetTrueGuild(hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void Grd_213_Torwache_WELCOME_Info()
{
//	AI_Output(self,other,"Grd_213_Torwache_WELCOME_Info_07_01"); //I hear you're one of us now? Not bad for someone who's not been here long.
//	AI_Output(self,other,"Grd_213_Torwache_WELCOME_Info_07_01"); //Ich hab' gehört, du bist jetzt einer von uns? Nicht schlecht in so kurzer Zeit.
	AI_Output(self,other,"Grd_213_Torwache_WELCOME_Info_07_01"); //Slyšel jsem, že jsi jedním z nás? Na někoho, kdo tady není dlouho, to není špatné.
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance Info_Grd_213_EXIT(C_INFO)
{
	npc = Grd_213_Torwache;
	nr = 999;
	condition = Info_Grd_213_EXIT_Condition;
	information = Info_Grd_213_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Info_Grd_213_EXIT_Condition()
{ 
	return 1;
};

func void Info_Grd_213_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						PERM Abblitzen
// ************************************************************

instance Info_Grd_213_Abblitzen(C_INFO)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_Abblitzen_Condition;
	information = Info_Grd_213_Abblitzen_Info;
	permanent = 1;
//	description = "Bring a bit more excitement into your life! Like letting someone in...";
//	description = "Lass doch mal zur Abwechslung jemanden in die Burg.";
	description = "Trochu života do toho umírání! Jako kdyby někdo...";
};                       

func int Info_Grd_213_Abblitzen_Condition()
{ 
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

func void Info_Grd_213_Abblitzen_Info()
{
//	AI_Output(other,self,"Info_Grd_213_Abblitzen_15_00"); //You know, you really should bring a bit more excitement into your life. Like letting someone in the castle.
//	AI_Output(other,self,"Info_Grd_213_Abblitzen_15_00"); //Du könntest mal ein bisschen Abwechslung in dein Leben bringen. Lass doch mal jemanden in die Burg.
	AI_Output(other,self,"Info_Grd_213_Abblitzen_15_00"); //Víš, měl bys do života vnést trochu víc vzrušení. Jako třeba vpustit někoho na hrad.
//	AI_Output(self,other,"Info_Grd_213_Abblitzen_07_01"); //Excitement? That's not a bad idea - I ain't beaten up anyone like you in ages.
//	AI_Output(self,other,"Info_Grd_213_Abblitzen_07_01"); //Abwechslung? Ist schon 'ne gute Idee - einen wie dich hab' ich schon lange nicht mehr verprügelt.
	AI_Output(self,other,"Info_Grd_213_Abblitzen_07_01"); //Vzrušení? To není špatný nápad - už dlouho jsem nevyrazil někoho, jako jsi ty!
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						PERM Nach FirstIn
// ************************************************************

instance Info_Grd_213_Passgate(C_INFO)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_Passgate_Condition;
	information = Info_Grd_213_Passgate_Info;
	permanent = 1;
//	description = "Hey, you okay?";
//	description = "Na, alles klar?";
	description = "Jsi v pořádku?";
};                       

func int Info_Grd_213_Passgate_Condition()
{ 
	if (self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void Info_Grd_213_Passgate_Info()
{
//	AI_Output(other,self,"Info_Grd_213_Passgate_15_00"); //Hey, you okay?
//	AI_Output(other,self,"Info_Grd_213_Passgate_15_00"); //Na, alles klar?
	AI_Output(other,self,"Info_Grd_213_Passgate_15_00"); //Hej, jsi v pořádku?
//	AI_Output(self,other,"Info_Grd_213_Passgate_07_01"); //Don't hang around here - get inside.
//	AI_Output(self,other,"Info_Grd_213_Passgate_07_01"); //Lunger hier nicht rum - geh rein.
	AI_Output(self,other,"Info_Grd_213_Passgate_07_01"); //Moc se tady nemotej - běž dovnitř.
	AI_StopProcessInfos(self);
};
