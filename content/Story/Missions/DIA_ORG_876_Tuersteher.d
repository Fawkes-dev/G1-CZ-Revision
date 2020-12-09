// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance DIA_Org_876_EXIT(C_INFO)
{
	npc = Org_876_Tuersteher;
	nr = 999;
	condition = DIA_Org_876_EXIT_Condition;
	information = DIA_Org_876_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Org_876_EXIT_Condition()
{
	return 1;
};

func void DIA_Org_876_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Bin Schürfer
// ************************************************************

instance DIA_Org_876_AmSfb(C_INFO)
{
	npc = Org_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_AmSfb_Condition;
	information = DIA_Org_876_AmSfb_Info;
	permanent = 1;
//	description = "I'm a scraper! And I'm thirsty!";
//	description = "Ich bin Schürfer! Und ich habe Durst!";
	description = "Jsem rudař! A mám žízeň!";
};                       

func int DIA_Org_876_AmSfb_Condition()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) 
	{ 
		return TRUE;
	};
};

func void DIA_Org_876_AmSfb_Info()
{ 
//	AI_Output(other,self,"DIA_Org_876_AmSfb_15_00"); //I'm a scraper! And I'm thirsty!
//	AI_Output(other,self,"DIA_Org_876_AmSfb_15_00"); //Ich bin Schürfer! Und ich habe Durst!
	AI_Output(other,self,"DIA_Org_876_AmSfb_15_00"); //Jsem rudař! A mám žízeň!

	var C_ITEM myarmor;

	myarmor = Npc_GetEquippedArmor(hero);
	if (Hlp_IsItem(myarmor, SFB_ARMOR_L))
	{
//		AI_Output(self,other,"DIA_Org_876_AmSfb_06_01"); //You look like one of those filthy rats. Come on in!
//		AI_Output(self,other,"DIA_Org_876_AmSfb_06_01"); //Du siehst auch aus wie einer von den Dreckfressern.  Immer rein mit dir.
		AI_Output(self,other,"DIA_Org_876_AmSfb_06_01"); //Vypadáš jako jedna z těch špinavejch krys. Pojď dál!
		self.aivar[AIV_PASSGATE] = TRUE; 

		AI_StopProcessInfos(self);
	}
	else
	{
//		AI_Output(self,other,"DIA_Org_876_AmSfb_NOSFB_06_00"); //You don't look like no scraper. You won't get in here like that, boy.
//		AI_Output(self,other,"DIA_Org_876_AmSfb_NOSFB_06_00"); //Du siehst nicht aus wie ein Schürfer. So kommst du hier nicht rein, Junge.
		AI_Output(self,other,"DIA_Org_876_AmSfb_NOSFB_06_00"); //Nevypadáš jako rudař. Takhle dovnitř nesmíš, hochu.
	};
};

// ************************************************************
// 						Bestechen
// ************************************************************

instance DIA_Org_876_Bribe(C_INFO)
{
	npc = Org_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_Bribe_Condition;
	information = DIA_Org_876_Bribe_Info;
	permanent = 1;
//	description = "How about some ore as an admission fee?";
//	description = "Was hältst du von etwas Erz als Eintrittsgeld?";
	description = "Co takhle nějakou rudu jako vstupné?";
};                       

func int DIA_Org_876_Bribe_Condition()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) 
	{
		return 1;
	};
};

func void DIA_Org_876_Bribe_Info()
{ 
//	AI_Output(other,self,"DIA_Org_876_Bribe_15_00"); //How about some ore as an admission fee?
//	AI_Output(other,self,"DIA_Org_876_Bribe_15_00"); //Was hältst du von etwas Erz als Eintrittsgeld?
	AI_Output(other,self,"DIA_Org_876_Bribe_15_00"); //Co takhle nějakou rudu jako vstupné?
//	AI_Output(self,other,"DIA_Org_876_Bribe_06_01"); //How much ore exactly is 'some'?
//	AI_Output(self,other,"DIA_Org_876_Bribe_06_01"); //Wie viel Erz ist denn 'etwas Erz'?
	AI_Output(self,other,"DIA_Org_876_Bribe_06_01"); //Co myslíš tím 'nějakou'?

	Info_ClearChoices(DIA_Org_876_Bribe);
//	Info_AddChoice(DIA_Org_876_Bribe,"100 ore nuggets should be enough.",DIA_Org_876_Bribe_100Erz);
//	Info_AddChoice(DIA_Org_876_Bribe,"Hundert Erzbrocken sollten reichen.",DIA_Org_876_Bribe_100Erz);
	Info_AddChoice(DIA_Org_876_Bribe,"100 nugetů by mělo stačit.",DIA_Org_876_Bribe_100Erz);
//	Info_AddChoice(DIA_Org_876_Bribe,"What do you say to 50 ore?",DIA_Org_876_Bribe_50Erz);
//	Info_AddChoice(DIA_Org_876_Bribe,"Was denkst du über 50 Erz?",DIA_Org_876_Bribe_50Erz);
	Info_AddChoice(DIA_Org_876_Bribe,"Co říkáš na 50 nugetů?",DIA_Org_876_Bribe_50Erz);
//	Info_AddChoice(DIA_Org_876_Bribe,"I have 10 ore - here.",DIA_Org_876_Bribe_10Erz);
//	Info_AddChoice(DIA_Org_876_Bribe,"Ich habe 10 Erz - hier.",DIA_Org_876_Bribe_10Erz);
	Info_AddChoice(DIA_Org_876_Bribe,"Mám s sebou 10 nugetů.",DIA_Org_876_Bribe_10Erz);
};

func void DIA_Org_876_Bribe_10Erz()
{
//	AI_Output(other,self,"DIA_Org_876_Bribe_10Erz_15_00"); //I have 10 ore - here.
//	AI_Output(other,self,"DIA_Org_876_Bribe_10Erz_15_00"); //Ich habe 10 Erz - hier.
	AI_Output(other,self,"DIA_Org_876_Bribe_10Erz_15_00"); //Mám s sebou 10 nugetů.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
//		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_01"); //10 Ore? For that I'll allow you to try again.
//		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_01"); //10 Erz?  Dafür werde ich dir erlauben, es noch mal zu versuchen.
		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_01"); //10 nugetů? Za to ti dovolím to zkusit znovu.
	}
	else
	{
//		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_02"); //Where? I can't see 10 ore.
//		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_02"); //Wo? Ich sehe keine 10 Erz.
		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_02"); //Kde? Nevidím těch 10 nugetů.
	};

	AI_StopProcessInfos(self);
};

func void DIA_Org_876_Bribe_50Erz()
{
//	AI_Output(other,self,"DIA_Org_876_Bribe_50Erz_15_00"); //What do you say to 50 ore?
//	AI_Output(other,self,"DIA_Org_876_Bribe_50Erz_15_00"); //Was denkst du über 50 Erz?
	AI_Output(other,self,"DIA_Org_876_Bribe_50Erz_15_00"); //Co říkáš na 50 nugetů?
	if (Npc_HasItems(other,itminugget) >= 50)
	{
//		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_01"); //That's about half of what I'd call 'some ore'.
//		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_01"); //Das ist ziemlich genau die Hälfte von dem, was ich als 'etwas Erz' bezeichnen würde.
		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_01"); //To je akorát půlka toho, čemu říkám 'nějakou rudu'.
	}
	else
	{
//		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_02"); //Where? I can't see 50 ore.
//		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_02"); //Wo? Ich sehe keine 50 Erz.
		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_02"); //Kde? Nevidím těch 50 nugetů..
	};

	AI_StopProcessInfos(self);
};

func void DIA_Org_876_Bribe_100Erz()
{
//	AI_Output(other,self,"DIA_Org_876_Bribe_100Erz_15_00"); //100 ore nuggets should be enough.
//	AI_Output(other,self,"DIA_Org_876_Bribe_100Erz_15_00"); //Hundert Erzbrocken sollten reichen.
	AI_Output(other,self,"DIA_Org_876_Bribe_100Erz_15_00"); //100 magických nugetů by mělo stačit.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
//		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_01"); //Truly spoken - you can get in.
//		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_01"); //Ein wahres Wort - du kannst reingehen.
		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_01"); //Dobře řečeno - můžeš dál.
		self.aivar[AIV_PASSGATE] = TRUE; 
		B_GiveInvItems(other,self,ItMiNugget, 100);
	}
	else
	{
//		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_02"); //That's true. But I don't see that you have that much.
//		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_02"); //Das stimmt. Aber so viel sehe ich bei dir nicht.
		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_02"); //To sedí. Nevidím ale, že bys měl tolik.
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 							PERM
// ************************************************************

instance DIA_Org_876_PERM(C_INFO)
{
	npc = Org_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_PERM_Condition;
	information = DIA_Org_876_PERM_Info;
	permanent = 1;
//	description = "How's the schnapps business going?";
//	description = "Wie läuft das Schnapsgeschäft?";
	description = "Jak jde obchod s pálenkou?";
};                       

func int DIA_Org_876_PERM_Condition()
{
	if (self.aivar[AIV_PASSGATE] == TRUE)
	|| (Npc_GetAttitude(self,hero) == ATT_FRIENDLY) 
	{
		return 1;
	};
};

func void DIA_Org_876_PERM_Info()
{ 
//	AI_Output(other,self,"DIA_Org_876_PERM_15_00"); //How's the schnapps business going?
//	AI_Output(other,self,"DIA_Org_876_PERM_15_00"); //Wie läuft das Schnapsgeschäft?
	AI_Output(other,self,"DIA_Org_876_PERM_15_00"); //Jak jde obchod s pálenkou?
//	AI_Output(self,other,"DIA_Org_876_PERM_06_01"); //Go in and ask Silas. WE can't complain.
//	AI_Output(self,other,"DIA_Org_876_PERM_06_01"); //Geh rein und frag Silas. WIR können uns nicht beklagen.
	AI_Output(self,other,"DIA_Org_876_PERM_06_01"); //Jdi se zeptat Silase. MY jsme spokojení.
};

// ************************************************************
// 						SC = SLD oder Magier
// ************************************************************

instance DIA_Org_876_ScSld(C_INFO)
{
	npc = Org_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_ScSld_Condition;
	information = DIA_Org_876_ScSld_Info;
	permanent = 0;
	important   = 1;
};                       

func int DIA_Org_876_ScSld_Condition()
{
	if ((other.guild == GIL_SLD) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF))
	{
		return 1;
	};
};

func void DIA_Org_876_ScSld_Info()
{ 
//	AI_Output(self,other,"DIA_Org_876_ScSld_06_00"); //Stop! You know the rules. Scrapers and rogues only!
//	AI_Output(self,other,"DIA_Org_876_ScSld_06_00"); //Halt! Du kennst die Regeln. Nur Schürfer und Banditen!
	AI_Output(self,other,"DIA_Org_876_ScSld_06_00"); //Stůj! Znáš pravidla. Jen pro bandity a rudaře!
//	AI_Output(other,self,"DIA_Org_876_ScSld_15_01"); //Are you going to try and stop me?
//	AI_Output(other,self,"DIA_Org_876_ScSld_15_01"); //Willst du mich aufhalten?
	AI_Output(other,self,"DIA_Org_876_ScSld_15_01"); //Pokoušíš se mě zastavit?
//	AI_Output(self,other,"DIA_Org_876_ScSld_06_02"); //No... just go...
//	AI_Output(self,other,"DIA_Org_876_ScSld_06_02"); //Nein ... Geh nur ...
	AI_Output(self,other,"DIA_Org_876_ScSld_06_02"); //Ne... tak pojď...
	self.aivar[AIV_PASSGATE] = TRUE;
};

// ************************************************************
// 						SC = Sekte
// ************************************************************

instance DIA_Org_876_ScSekte(C_INFO)
{
	npc = Org_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_ScSekte_Condition;
	information = DIA_Org_876_ScSekte_Info;
	permanent = 0;
	important   = 1;
};                       

func int DIA_Org_876_ScSekte_Condition()
{
	if ((other.guild == GIL_NOV) || (other.guild == GIL_TPL))
	{
		return 1;
	};
};

func void DIA_Org_876_ScSekte_Info()
{ 
//	AI_Output(self,other,"DIA_Org_876_ScSekte_06_00"); //We usually let only our boys in but there's nothing to be said against the Brotherhood.
//	AI_Output(self,other,"DIA_Org_876_ScSekte_06_00"); //Eigentlich lassen wir ja nur unsere Jungs hier rein, aber gegen die Bruderschaft kann man wirklich nichts einwenden.
	AI_Output(self,other,"DIA_Org_876_ScSekte_06_00"); //Obvykle pouštím dovnitř jenom naše hochy, ale proti Bratrstvu nemůžu říci nic.
//	AI_Output(self,other,"DIA_Org_876_ScSekte_06_01"); //Especially not when they have something to smoke on them.
//	AI_Output(self,other,"DIA_Org_876_ScSekte_06_01"); //Vor allem nicht, wenn die Leute was zu rauchen dabei haben.
	AI_Output(self,other,"DIA_Org_876_ScSekte_06_01"); //Obzvlášť pak ne, když mají sebou něco ke kouření.
};

// ************************************************************
// 						Kraut geben
// ************************************************************
	var int Org_876_GotJoint;
// ************************************************************

instance DIA_Org_876_GibKraut(C_INFO)
{
	npc = Org_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_GibKraut_Condition;
	information = DIA_Org_876_GibKraut_Info;
	permanent = 1;
//	description = "I have some stalks on me - here, take one.";
//	description = "Ich habe ein paar Krautstengel bei mir - hier, nimm einen.";
	description = "Mám s sebou pár lodyh - tady, vezmi si jednu.";
};                       

func int DIA_Org_876_GibKraut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Org_876_ScSekte))
	{
		return 1;
	};
};

func void DIA_Org_876_GibKraut_Info()
{ 
//	AI_Output(other,self,"DIA_Org_876_GibKraut_15_00"); //I have some stalks on me - here, take one.
//	AI_Output(other,self,"DIA_Org_876_GibKraut_15_00"); //Ich habe ein paar Krautstengel bei mir - hier, nimm einen.
	AI_Output(other,self,"DIA_Org_876_GibKraut_15_00"); //Mám s sebou pár lodyh - tady, vezmi si jednu.

	if ((Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0))
	{
		if (Npc_HasItems(other,ItMiJoint_1))
		{ B_GiveInvItems(other,self,ItMiJoint_1,1); }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{ B_GiveInvItems(other,self,ItMiJoint_2,1); }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{ B_GiveInvItems(other,self,ItMiJoint_3,1); };

//		AI_Output(self,other,"DIA_Org_876_GibKraut_06_01"); //You're always welcome, man.
//		AI_Output(self,other,"DIA_Org_876_GibKraut_06_01"); //Du bist hier immer herzlich willkommen, Mann.
		AI_Output(self,other,"DIA_Org_876_GibKraut_06_01"); //Buď vždycky vítán, člověče.
		self.aivar[AIV_PASSGATE] = TRUE;
		Org_876_GotJoint = TRUE;
	}
	else
	{
//		AI_Output(other,self,"DIA_Org_876_GibKraut_KEIN_15_00"); //Oh... Hold on. I don't have anything after all.
//		AI_Output(other,self,"DIA_Org_876_GibKraut_KEIN_15_00"); //Äh ... Warte mal. Hab' doch nichts.
		AI_Output(other,self,"DIA_Org_876_GibKraut_KEIN_15_00"); //Och... Počkej. Já vlastně nic nemám.
//		AI_Output(self,other,"DIA_Org_876_GibKraut_KEIN_06_00"); //Great. Think of me the next time.
//		AI_Output(self,other,"DIA_Org_876_GibKraut_KEIN_06_00"); //Na toll. Denk beim nächsten Mal an mich.
		AI_Output(self,other,"DIA_Org_876_GibKraut_KEIN_06_00"); //Výborně. Mysli na mě příště.
		self.aivar[AIV_PASSGATE] = TRUE;
	};
};

//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	=============== 
//	NSC: Org_876_Tuersteher
//	Lager: NewCamp 
//	Durchgang: Kneipe (rechte Wache)
//	Uhrzeit: 24h
//
//	Es passiert folgendes:
//	1. Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2. Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3. Nähert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////

// **********************************************
// Erste Warnung
// **********************************************
	const string Org_876_CHECKPOINT = "NC_TAVERN_BAR";
// **********************************************

instance Info_Org_876_FirstWarn(C_INFO)
{
	npc = Org_876_Tuersteher;
	nr = 2;
	condition = Info_Org_876_FirstWarn_Condition;
	information = Info_Org_876_FirstWarn_Info;
	permanent = 1;
	important = 1;
};                       

func int Info_Org_876_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&& (self.aivar[AIV_PASSGATE] == FALSE ) 
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY ) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	{
		return TRUE;
	};
};

func void Info_Org_876_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);

//	AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_00"); //And where do YOU want to go?
//	AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_00"); //Wo willst DU denn hin?
	AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_00"); //A kampak CHCEŠ jít?
//	AI_Output(hero,self,"Info_Org_876_FirstWarn_Info_15_01"); //Why, in there.
//	AI_Output(hero,self,"Info_Org_876_FirstWarn_Info_15_01"); //Na, da rein.
	AI_Output(hero,self,"Info_Org_876_FirstWarn_Info_15_01"); //No, dovnitř.
//	AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_02"); //Forget it! Silas only wants to see scrapers and rogues in his bar.
//	AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_02"); //Vergiss es! Silas will in seiner Kneipe nur Schürfer und Banditen sehen .
	AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_02"); //Zapomeň na to! Silas chce v baru vidět jenom rudaře a bandity.

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Org_876_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN; 
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_Org_876_LastWarn(C_INFO)
{
	npc = Org_876_Tuersteher;
	nr = 1;
	condition = Info_Org_876_LastWarn_Condition;
	information = Info_Org_876_LastWarn_Info;
	permanent = 1;
	important = 1;
};                       

func int Info_Org_876_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN )
	&& (self.aivar[AIV_PASSGATE] == FALSE )
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY ) 
	&& (Npc_GetDistToWP(hero,Org_876_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP]-100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) 
	{
		return TRUE;
	};
};

func int Info_Org_876_LastWarn_Info()
{
//	AI_Output(self,hero,"Info_Org_876_LastWarn_06_00"); //Are you deaf or what, pal!
//	AI_Output(self,hero,"Info_Org_876_LastWarn_06_00"); //Du hörst wohl schlecht, Bürschchen!
	AI_Output(self,hero,"Info_Org_876_LastWarn_06_00"); //Jsi hluchej, nebo co, příteli?

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Org_876_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN; 

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Org_876_Attack(C_INFO)
{
	npc = Org_876_Tuersteher;
	nr = 1;
	condition = Info_Org_876_Attack_Condition;
	information = Info_Org_876_Attack_Info;
	permanent = 1;
	important = 1;
};                       

func int Info_Org_876_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN )
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY ) 
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetDistToWP(hero,Org_876_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP]-100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) 
	{
		return TRUE;
	};
};

func int Info_Org_876_Attack_Info()
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
