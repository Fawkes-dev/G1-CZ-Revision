// ****************************************
// 					Exit
// ****************************************

instance DIA_Roscoe_Exit(C_INFO)
{
	npc = ORG_840_Roscoe;
	nr = 999;
	condition = DIA_Roscoe_Exit_Condition;
	information = DIA_Roscoe_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Roscoe_Exit_Condition()
{
	return 1;
};

func void DIA_Roscoe_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ****************************************
// 					Habe Liste
// ****************************************

instance DIA_Roscoe_BringList(C_INFO)
{
	npc = Org_840_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_BringList_Condition;
	information = DIA_Roscoe_BringList_Info;
	permanent = 0;
//	description = "I have the list of requirements for the Old Mine.";
//	description = "Ich habe die Bedarfsliste der alten Mine.";
	description = "Mám seznam požadavků pro Starý důl.";
};

func int DIA_Roscoe_BringList_Condition()
{
	if (Npc_HasItems(other,TheList)>=1)
	{
		return 1;
	};
};

func void DIA_Roscoe_BringList_Info()
{
//	AI_Output(other,self,"DIA_Roscoe_BringList_15_00"); //I have the list of requirements for the Old Mine.
//	AI_Output(other,self,"DIA_Roscoe_BringList_15_00"); //Ich habe die Bedarfsliste der alten Mine.
	AI_Output(other,self,"DIA_Roscoe_BringList_15_00"); //Mám seznam požadavků pro Starý důl.
//	AI_Output(self,other,"DIA_Roscoe_BringList_10_01"); //Not bad. How did you get it?
//	AI_Output(self,other,"DIA_Roscoe_BringList_10_01"); //Nicht schlecht. Wie bist du daran gekommen?
	AI_Output(self,other,"DIA_Roscoe_BringList_10_01"); //To není špatné. Jak jsi k němu přišel?
//	AI_Output(other,self,"DIA_Roscoe_BringList_15_02"); //Ian gave it to me.
//	AI_Output(other,self,"DIA_Roscoe_BringList_15_02"); //Ian hat sie mir gegeben.
	AI_Output(other,self,"DIA_Roscoe_BringList_15_02"); //Dal mi ho Ian.
//	AI_Output(self,other,"DIA_Roscoe_BringList_10_03"); //You got a nerve! So they sent you to test me, did they? Thorus must already be going mad, I'm sure.
//	AI_Output(self,other,"DIA_Roscoe_BringList_10_03"); //Du hast Nerven. Sie haben dich geschickt, um dich zu prüfen, was? Thorus geht bestimmt schon die Wände hoch.
	AI_Output(self,other,"DIA_Roscoe_BringList_10_03"); //Ty máš ale nervy! Tak on tě poslal, abys mě vyzkoušel, viď? Thorus se už musel úplně pomátnout, tím jsem si jistý.
//	AI_Output(other,self,"DIA_Roscoe_BringList_15_04"); //Diego gave me the order.
//	AI_Output(other,self,"DIA_Roscoe_BringList_15_04"); //Diego hat mir den Auftrag gegeben.
	AI_Output(other,self,"DIA_Roscoe_BringList_15_04"); //Ten rozkaz mi dal Diego.
//	AI_Output(self,other,"DIA_Roscoe_BringList_10_05"); //Diego does what Thorus tells him to. If I know him, he'd die laughing if he knew that you were here.
//	AI_Output(self,other,"DIA_Roscoe_BringList_10_05"); //Diego macht, was Thorus ihm sagt. So wie ich ihn kenne, würde er sich totlachen, wenn er wüsste, dass du hier bist.
	AI_Output(self,other,"DIA_Roscoe_BringList_10_05"); //Diego dělá to, co mu Thorus nakáže. Jestli ho dobře znám, tak umře smíchy, jestli se dozví, žes tady byl.
//	AI_Output(other,self,"DIA_Roscoe_BringList_15_06"); //Can I get in there now or not?
//	AI_Output(other,self,"DIA_Roscoe_BringList_15_06"); //Kann ich jetzt rein oder was?
	AI_Output(other,self,"DIA_Roscoe_BringList_15_06"); //Můžu teď dál nebo ne?
//	AI_Output(self,other,"DIA_Roscoe_BringList_10_07"); //Just go on in. Lares won't believe his eyes.
//	AI_Output(self,other,"DIA_Roscoe_BringList_10_07"); //Geh nur. Lares werden die Augen aus dem Kopf fallen.
	AI_Output(self,other,"DIA_Roscoe_BringList_10_07"); //Jdi dál. Lares nebude věřit svým očím.
	self.aivar[AIV_PASSGATE] = TRUE;
};

// ****************************************
// 			Mordrag schickt mich
// ****************************************

instance DIA_Roscoe_Mordrag(C_INFO)
{
	npc = Org_840_Roscoe;
	nr = 2;
	condition = DIA_Roscoe_Mordrag_Condition;
	information = DIA_Roscoe_Mordrag_Info;
	important = 0;
//	description = "Mordrag sent me.";
//	description = "Mordrag schickt mich.";
	description = "Poslal mě Mordrag.";
};

func int DIA_Roscoe_Mordrag_Condition()
{
	//if (Npc_KnowsInfo(hero,Org_826_Mordrag_AtNewcamp))
	if (Npc_HasItems(hero,MordragsRing))
	{
		return 1;
	};
};

func void DIA_Roscoe_Mordrag_Info()
{
//	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_00"); //Mordrag sent me.
//	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_00"); //Mordrag schickt mich.
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_00"); //Poslal mě Mordrag.
//	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_01"); //Mordrag hasn't been seen here for some time. He's probably changed over to the Old Camp.
//	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_01"); //Mordrag ist schon lange nicht mehr hier. Er ist vielleicht schon längst zum Alten Lager übergelaufen.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_01"); //Mordrag tu nebyl už hezky dlouho. Asi přešel do Starého tábora.
//	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_02"); //I came here with him.
//	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_02"); //Ich bin mit ihm hierhin gekommen.
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_02"); //Přišel jsem sem s ním.
//	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_03"); //Mordrag's back? If you meet him, tell him Lares wants to see him.
//	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_03"); //Mordrag ist wieder hier? Wenn du ihn siehst, sag ihm, Lares will ihn sehen.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_03"); //Mordrag je zpátky? Jestli ho potkáš, vzkaž mu, že ho chce vidět Lares.
//	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_04"); //Mordrag gave me something for Lares.
//	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_04"); //Mordrag hat mir etwas für Lares gegeben.
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_04"); //Mordrag mi něco dal pro Larese.
//	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_05"); //What is it?
//	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_05"); //Was?
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_05"); //Co to je?
//	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_06"); //A ring.
//	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_06"); //Einen Ring.
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_06"); //Prsten.
//	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_07"); //Certainly a precious piece... Okay, you can see him.
//	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_07"); //Bestimmt ein kostbares Stück ... Gut, du kannst zu ihm.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_07"); //Rozhodně krásný kousek... Dobrá, můžeš za ním jít.
	self.aivar[AIV_PASSGATE] = TRUE;
};

// ****************************************
// 				Wanna Join
// ****************************************

instance DIA_Roscoe_WannaJoin(C_INFO)
{
	npc = Org_840_Roscoe;
	nr = 2;
	condition = DIA_Roscoe_WannaJoin_Condition;
	information = DIA_Roscoe_WannaJoin_Info;
	permanent = 0;
//	description = "I want to join your gang.";
//	description = "Ich will mich eurer Bande anschließen.";
	description = "Chci se přidat k tvojí tlupě!";
};

func int DIA_Roscoe_WannaJoin_Condition()
{
	if !Npc_KnowsInfo(hero,DIA_Roscoe_Mordrag)
	&& !Npc_KnowsInfo(hero,DIA_Roscoe_BringList)
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	&& (oldHeroGuild == 0)
	{
		return 1;
	};
};

func void DIA_Roscoe_WannaJoin_Info()
{
//	AI_Output(other,self,"DIA_Roscoe_WannaJoin_15_00"); //I want to join your gang.
//	AI_Output(other,self,"DIA_Roscoe_WannaJoin_15_00"); //Ich will mich eurer Bande anschließen.
	AI_Output(other,self,"DIA_Roscoe_WannaJoin_15_00"); //Chci se přidat k tvojí tlupě!
//	AI_Output(self,other,"DIA_Roscoe_WannaJoin_10_01"); //Many people want to join us. You'll have to make a better offer if you want to pass through this gate.
//	AI_Output(self,other,"DIA_Roscoe_WannaJoin_10_01"); //Das wollen viele. Du musst schon mit mehr kommen, wenn du durch diese Tür gehen willst.
	AI_Output(self,other,"DIA_Roscoe_WannaJoin_10_01"); //Spousta lidí se chce přidat. Budeš muset udělat lepší nabídku, jestli se chceš dostat přes tyhle vrata.

};

// ****************************************
// 				Nochmal da
// ****************************************

instance DIA_Roscoe_ComeAgain(C_INFO)
{
	npc = Org_840_Roscoe;
	nr = 2;
	condition = DIA_Roscoe_ComeAgain_Condition;
	information = DIA_Roscoe_ComeAgain_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Roscoe_ComeAgain_Condition()
{
	if (
		((Npc_HasItems(other,TheList)>=1) && Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe))
	|| (Npc_KnowsInfo(hero,Org_826_Mordrag_AtNewcamp) && Npc_KnowsInfo(hero,ORG_801_Lares_BringList))
		)
	{
		return 1;
	};
};

func void DIA_Roscoe_ComeAgain_Info()
{
//	AI_Output(self,other,"DIA_Roscoe_ComeAgain_10_00"); //You again.
//	AI_Output(self,other,"DIA_Roscoe_ComeAgain_10_00"); //Du schon wieder.
	AI_Output(self,other,"DIA_Roscoe_ComeAgain_10_00"); //Zase ty.
};

//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//////////////////////////////////////////////////////////////////////////

// **********************************************
// Erste Warnung
// **********************************************
	const string Roscoe_CHECKPOINT = "NC_HUT22_IN_MOVEMENT";
// **********************************************

instance Info_Roscoe_FirstWarn(C_INFO)
{
	npc = Org_840_Roscoe;
	nr = 2;
	condition = Info_Roscoe_FirstWarn_Condition;
	information = Info_Roscoe_FirstWarn_Info;
	permanent = 1;
	important = 1;
};

func int Info_Roscoe_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&& (self.aivar[AIV_PASSGATE] == FALSE )
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY )
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	{
		return TRUE;
	};
};

func void Info_Roscoe_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);

//	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_00"); //Where do you wanna go?
//	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_00"); //Wo soll's denn hingehen?
	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_00"); //Kam chceš jít?
//	AI_Output(hero,self,"Info_Roscoe_FirstWarn_Info_15_01"); //I want to meet Lares.
//	AI_Output(hero,self,"Info_Roscoe_FirstWarn_Info_15_01"); //Ich will zu Lares.
	AI_Output(hero,self,"Info_Roscoe_FirstWarn_Info_15_01"); //Chci se setkat s Laresem.
//	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_02"); //Lares is here - but you need a good reason to disturb him.
//	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_02"); //Lares ist hier - aber ohne guten Grund wirst du ihn nicht stören.
	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_02"); //Lares je tady - ale musíš mít dobrý důvod, že ho rušíš.

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Roscoe_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_Roscoe_LastWarn(C_INFO)
{
	npc = Org_840_Roscoe;
	nr = 1;
	condition = Info_Roscoe_LastWarn_Condition;
	information = Info_Roscoe_LastWarn_Info;
	permanent = 1;
	important = 1;
};

func int Info_Roscoe_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN )
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY )
	&& (self.aivar[AIV_PASSGATE] == FALSE )
	&& (Npc_GetDistToWP(hero,Roscoe_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP]-100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)))
	{
		return TRUE;
	};
};

func int Info_Roscoe_LastWarn_Info()
{
//	AI_Output(self,hero,"Info_Roscoe_LastWarn_10_00"); //Are you deaf?
//	AI_Output(self,hero,"Info_Roscoe_LastWarn_10_00"); //Du hörst wohl schlecht.
	AI_Output(self,hero,"Info_Roscoe_LastWarn_10_00"); //Jsi hluchý?

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Roscoe_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Roscoe_Attack(C_INFO)
{
	npc = Org_840_Roscoe;
	nr = 1;
	condition = Info_Roscoe_Attack_Condition;
	information = Info_Roscoe_Attack_Info;
	permanent = 1;
	important = 1;
};

func int Info_Roscoe_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN )
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY )
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetDistToWP(hero,Roscoe_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP]-100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)))
	{
		return TRUE;
	};
};

func int Info_Roscoe_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;

	B_FullStop(self);
	AI_StopProcessInfos(self); // dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert(self,other);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack, 1, "");
};
