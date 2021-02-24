//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	=============== 
//	NSC: Grd_237_Torwache
//	Lager: OldCamp
//	Durchgang: Barrikade beim Durchgang zum Orkgebiet
//	Uhrzeit: 24h
//////////////////////////////////////////////////////////////////////////
CONST STRING Grd_237_CHECKPOINT = "OW_PATH_272";

instance Info_Grd_237_FirstWarn(C_INFO)
{
	npc = Grd_237_Gardist;
	nr = 1;
	condition = Info_Grd_237_FirstWarn_Condition;
	information = Info_Grd_237_FirstWarn_Info;
	permanent = 1;
	important = 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_Grd_237_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&& (self.aivar[AIV_PASSGATE] == FALSE ) 
	&& (Npc_GetAttitude(self,hero) != ATT_FRIENDLY ) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	{
		return TRUE;
	};
};

func void Info_Grd_237_FirstWarn_Info()
{
//	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_01"); //You'd better not stay here. The Orc land starts behind that barricade!
//	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_01"); //Verschwinde hier lieber. Hinter dieser Barrikade beginnt das Orkgebiet!
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_01"); //Neměl bys tu zůstávat. Za touhle barikádou začíná země skřetů!
//	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_02"); //Is it dangerous?
//	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_02"); //Ist das gefährlich?
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_02"); //Je to nebezpečné?
//	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_03"); //Let me put it like this: You may as well give me all your ore before you go out there and let the Orcs rip you to ribbons!
//	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_03"); //Sagen wir's mal so: Da dich die Orks sowieso in Fetzen reißen werden, kannst du uns auch genauso gut all dein Erz geben!
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_03"); //Řekněme to takhle: můžeš mi dát všechnu svoji rudu, než tam půjdeš a skřeti tě rozsápou na kusy!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_237_CHECKPOINT);

	Info_ClearChoices(Info_Grd_237_FirstWarn);
//	Info_AddChoice(Info_Grd_237_FirstWarn,"I don't think I want to do that!", Info_Grd_237_FirstWarn_Info_NO); 
//	Info_AddChoice(Info_Grd_237_FirstWarn,"Ich glaube nicht, dass ich das will!", Info_Grd_237_FirstWarn_Info_NO); 
	Info_AddChoice(Info_Grd_237_FirstWarn,"Nemyslím, že to chci udělat!", Info_Grd_237_FirstWarn_Info_NO); 
//	Info_AddChoice(Info_Grd_237_FirstWarn,"Sure, here's my ore!", Info_Grd_237_FirstWarn_Info_YES); 
//	Info_AddChoice(Info_Grd_237_FirstWarn,"Na klar, hier ist mein Erz!", Info_Grd_237_FirstWarn_Info_YES); 
	Info_AddChoice(Info_Grd_237_FirstWarn,"Jistě, tady je moje ruda!", Info_Grd_237_FirstWarn_Info_YES); 
//	Info_AddChoice(Info_Grd_237_FirstWarn,"I think it might be best if I just turn back.", Info_Grd_237_FirstWarn_Info_RETREAT); 
//	Info_AddChoice(Info_Grd_237_FirstWarn,"Ist wohl besser wenn ich wieder umdrehe!", Info_Grd_237_FirstWarn_Info_RETREAT); 
	Info_AddChoice(Info_Grd_237_FirstWarn,"Myslím, že by bylo lepší, kdybych se vrátil.", Info_Grd_237_FirstWarn_Info_RETREAT); 
};

func void Info_Grd_237_FirstWarn_Info_RETREAT()
{
	Info_ClearChoices(Info_Grd_237_FirstWarn);

//	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_04"); //I think it might be best if I just turn back.
//	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_04"); //Ist wohl besser, wenn ich wieder umdrehe!
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_04"); //Myslím, že by bylo lepší, kdybych se vrátil.
//	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_05"); //Pity, I'd have loved to take care of your ore.
//	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_05"); //Schade, hätte dein Erz gerne verwahrt.
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_05"); //Škoda, rád bych opatroval tvoji rudu.

	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos(self);
}; 

func void Info_Grd_237_FirstWarn_Info_YES()
{
	Info_ClearChoices(Info_Grd_237_FirstWarn);

//	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_06"); //Sure, here's my ore!
//	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_06"); //Na klar, hier ist mein Erz!
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_06"); //Jistě, tady je moje ruda!
//	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_07"); //Oh, now I call that very civil of you.
//	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_07"); //Oh, das ist aber sehr umsichtig von dir.
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_07"); //Och, to je od tebe nesmírně obezřetné.

	//#NEEDS_ATTENTION ak hrac nema rudu, tak by sa nemala volat B_GiveInvItems funkcia.
	//Tieto NPC su zbytocne :-/
	var int ore;
	ore = Npc_HasItems(hero,ItMiNugget);
	B_GiveInvItems(hero,self,ItMiNugget, ore);

	self.aivar[AIV_PASSGATE] = TRUE;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos(self);
}; 

func void Info_Grd_237_FirstWarn_Info_NO()
{
	Info_ClearChoices(Info_Grd_237_FirstWarn);

//	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_08"); //I don't think I want to do that!
//	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_08"); //Ich glaube nicht, dass ich das will!
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_08"); //Nemyslím, že to chci udělat!
//	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_09"); //In that case, you'd better not move another step!
//	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_09"); //Dann solltest du besser keinen Schritt mehr weiter tun!
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_09"); //V tom případě bys už neměl udělat ani krok!

	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos(self);
}; 

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_Grd_237_LastWarn(C_INFO)
{
	npc = Grd_237_Gardist;
	nr = 2;
	condition = Info_Grd_237_LastWarn_Condition;
	information = Info_Grd_237_LastWarn_Info;
	permanent = 1;
	important = 1;
};                       

func int Info_Grd_237_LastWarn_Condition()
{
	if ((self.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN )
	&& (self.aivar[AIV_PASSGATE] == FALSE ) 
	&& (Npc_GetDistToWP(hero,Grd_237_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP]-100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) 
	{
		return TRUE;
	};
};

func int Info_Grd_237_LastWarn_Info()
{
//	AI_Output(self,hero,"Info_Grd_237_LastWarn_07_01"); //Are you deaf? One more step and you're worm food!
//	AI_Output(self,hero,"Info_Grd_237_LastWarn_07_01"); //Bist du taub? Noch ein Schritt und du bist Futter für die Würmer!
	AI_Output(self,hero,"Info_Grd_237_LastWarn_07_01"); //Jsi hluchý? Ještě krok a je z tebe potrava pro červy!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_237_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN; 

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Grd_237_Attack(C_INFO)
{
	npc = Grd_237_Gardist;
	nr = 1;
	condition = Info_Grd_237_Attack_Condition;
	information = Info_Grd_237_Attack_Info;
	permanent = 1;
	important = 1;
};                       

func int Info_Grd_237_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN )
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetDistToWP(hero,Grd_237_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP]-100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) 
	{
		return TRUE;
	};
};

func int Info_Grd_237_Attack_Info()
{

	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH; 

	B_FullStop(self); 
	AI_StopProcessInfos(self); //dem Spieler sofort wieder die Kontrolle zurückgeben
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack, 1, "");
};
