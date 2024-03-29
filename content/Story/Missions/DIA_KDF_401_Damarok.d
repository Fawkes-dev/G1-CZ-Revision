instance KDF_401_Damarok_WELCOME(C_INFO)
{
	npc = KDF_401_Damarok;
	condition = KDF_401_Damarok_WELCOME_Condition;
	information = KDF_401_Damarok_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int KDF_401_Damarok_WELCOME_Condition()
{
	if (Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE))
	&& (Npc_KnowsInfo(hero,KDF_403_Drago_RUNE))
	&& (Npc_KnowsInfo(hero,KDF_405_Torrez_BOOK))
	&& (Npc_GetDistToNpc(hero,self) < 1000)
	{
		return TRUE;
	};
};
func void KDF_401_Damarok_WELCOME_Info()
{
	AI_GotoNpc(self,hero);
//	AI_Output(self,other,"KDF_401_Damarok_WELCOME_Info_14_01"); //May the Fire always protect you!
//	AI_Output(self,other,"KDF_401_Damarok_WELCOME_Info_14_01"); //Möge das Feuer dich allzeit beschützen!
	AI_Output(self,other,"KDF_401_Damarok_WELCOME_Info_14_01"); //Kéž tě Oheň ochrání!

	Corristo_KDFAufnahme = 6;
	B_Story_Feueraufnahme();
	AI_StopProcessInfos(self);
};
// ************************ EXIT **************************

instance KDF_401_Damarok_Exit(C_INFO)
{
	npc = KDF_401_Damarok;
	nr = 999;
	condition = KDF_401_Damarok_Exit_Condition;
	information = KDF_401_Damarok_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int KDF_401_Damarok_Exit_Condition()
{
	return TRUE;
};

func void KDF_401_Damarok_Exit_Info()
{
	AI_StopProcessInfos(self);
};
//-----------------------------------------------------------
instance KDF_401_Damarok_HEAL(C_INFO)
{
	npc = KDF_401_Damarok;
	condition = KDF_401_Damarok_HEAL_Condition;
	information = KDF_401_Damarok_HEAL_Info;
	important = 1;
	permanent = 0;
};

func int KDF_401_Damarok_HEAL_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_KDF)
	&& (Npc_IsInRoutine  (self,Rtn_START_401))
	{
		return TRUE;
	};
};
func void KDF_401_Damarok_HEAL_Info()
{
//	AI_Output(self,other,"KDF_401_Damarok_HEAL_Info_14_01"); //If you are injured, I shall heal you.
//	AI_Output(self,other,"KDF_401_Damarok_HEAL_Info_14_01"); //Wenn du Schaden nehmen solltest, werde ich dich heilen.
	AI_Output(self,other,"KDF_401_Damarok_HEAL_Info_14_01"); //Jestliže budeš zraněn, já tě vyhojím.
	AI_StopProcessInfos(self);
};
// ***************************** INFOS ****************************************//

instance KDF_401_Damarok_HEALINFO(C_INFO)
{
	npc = KDF_401_Damarok;
	nr = 100;
	condition = KDF_401_Damarok_HEALINFO_Condition;
	information = KDF_401_Damarok_HEALINFO_Info;
	important = 0;
	permanent = 1;
//	description = "I'm injured. Can you heal me?";
//	description = "Ich bin verletzt. Kannst du mich heilen?";
	description = "Jsem zraněn. Dokážeš mě vyhojit?";
};

func int KDF_401_Damarok_HEALINFO_Condition()
{
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	&& (Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};

};
func void KDF_401_Damarok_HEALINFO_Info()
{
//	AI_Output(other,self,"KDF_401_Damarok_HEALINFO_Info_15_01"); //I'm injured. Can you heal me?
//	AI_Output(other,self,"KDF_401_Damarok_HEALINFO_Info_15_01"); //Ich bin verletzt. Kannst du mich heilen?
	AI_Output(other,self,"KDF_401_Damarok_HEALINFO_Info_15_01"); //Jsem zraněn. Dokážeš mě vyhojit?
//	AI_Output(self,other,"KDF_401_Damarok_HEALINFO_Info_14_02"); //The body heals, the spirit grows clear.
//	AI_Output(self,other,"KDF_401_Damarok_HEALINFO_Info_14_02"); //Der Körper gesundet, der Geist wird klar.
	AI_Output(self,other,"KDF_401_Damarok_HEALINFO_Info_14_02"); //Tělo se hojí, duše vyjasňuje.
	Snd_Play("MFX_Heal_Cast");
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
};
