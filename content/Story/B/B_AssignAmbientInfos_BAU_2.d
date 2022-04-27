// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Bau_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_2 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Bau_2_EXIT_Condition;
	information = Info_Bau_2_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Bau_2_EXIT_Condition()
{
	return 1;
};

func void Info_Bau_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Bau_2_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Bau_2_WichtigePersonen_Condition;
	information = Info_Bau_2_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Are you working in the rice fields voluntarily?";
//	description = "Arbeitest du freiwillig auf den Reisfeldern?";
	description = "Pracuješ na rýžových polích dobrovolně?";
};

func int Info_Bau_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Bau_2_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_00"); //Are you working in the rice fields voluntarily?
//	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_00"); //Arbeitest du freiwillig auf den Reisfeldern?
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_00"); //Pracuješ na rýžových polích dobrovolně?
//	AI_Output(self,other,"Info_Bau_2_WichtigePersonen_02_01"); //Yeah. That's right. Better to be working here of your own free will than being forced into it by the Rice Lord's thugs.
//	AI_Output(self,other,"Info_Bau_2_WichtigePersonen_02_01"); //Ja. Ja das tue ich. Ist nämlich besser freiwillig zu arbeiten, als von den Schlägern vom Reislord abgeholt zu werden.
	AI_Output(self,other,"Info_Bau_2_WichtigePersonen_02_01"); //Jasně. V pohodě. Lepší tu pracovat ze své vlastní vůle, než k tomu být donucen hrdlořezy Rýžového Lorda.
//	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_02"); //I see...
//	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_02"); //So so ...
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_02"); //Aha...
	var C_NPC Ricelord; Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Bau_2_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Bau_2_DasLager_Condition;
	information = Info_Bau_2_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "What can you tell me about the Camp?";
//	description = "Was kannst du mir über das Lager erzählen?";
	description = "Můžeš mi říci něco o táboře?";
};

func int Info_Bau_2_DasLager_Condition()
{
	return 1;
};

func void Info_Bau_2_DasLager_Info()
{
//	AI_Output(other,self,"Info_Bau_2_DasLager_15_00"); //What can you tell me about the Camp?
//	AI_Output(other,self,"Info_Bau_2_DasLager_15_00"); //Was kannst du mir über das Lager erzählen?
	AI_Output(other,self,"Info_Bau_2_DasLager_15_00"); //Můžeš mi něco říci o táboře?
//	AI_Output(self,other,"Info_Bau_2_DasLager_02_01"); //It's dangerous going there. Lee's mercenaries and the mages are okay, but you gotta watch out for the rogues!
//	AI_Output(self,other,"Info_Bau_2_DasLager_02_01"); //Es ist gefährlich, da hinzugehen. Lee's Söldner und die Magier sind ja ganz in Ordnung, aber auf die Banditen passt du besser auf!
	AI_Output(self,other,"Info_Bau_2_DasLager_02_01"); //Je nebezpečné tam chodit. Leeovi žoldáci a mágové jsou docela dobří, ale před gaunery se musíš mít na pozoru!
	var C_NPC Lee; Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Cronos; Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Bau_2_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Bau_2_DieLage_Condition;
	information = Info_Bau_2_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "You okay?";
//	description = "Alles klar bei dir?";
	description = "Jsi v pořádku?";
};

func int Info_Bau_2_DieLage_Condition()
{
	return 1;
};

func void Info_Bau_2_DieLage_Info()
{
//	AI_Output(other,self,"Info_Bau_2_DieLage_15_00"); //You okay?
//	AI_Output(other,self,"Info_Bau_2_DieLage_15_00"); //Alles klar bei dir?
	AI_Output(other,self,"Info_Bau_2_DieLage_15_00"); //Jsi v pořádku?
//	AI_Output(self,other,"Info_Bau_2_DieLage_02_01"); //What do you want? Did the Rice Lord send you? I'm already working as hard as I can!
//	AI_Output(self,other,"Info_Bau_2_DieLage_02_01"); //Was willst du? Hat Der Reislord dich geschickt? Ich arbeite doch jeden Tag!
	AI_Output(self,other,"Info_Bau_2_DieLage_02_01"); //Co chceš? Poslal tě Rýžový Lord? Pracuju, jak nejlépe můžu.
//	AI_Output(other,self,"Info_Bau_2_DieLage_15_02"); //Nobody sent me, I just want to talk.
//	AI_Output(other,self,"Info_Bau_2_DieLage_15_02"); //Niemand hat mich geschickt - ich will mich nur ein bisschen unterhalten.
	AI_Output(other,self,"Info_Bau_2_DieLage_15_02"); //Nikdo mě neposlal, jen jsem si chtěl popovídat.
	var C_NPC Ricelord; Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									WASSER
// *************************************************************************

instance Info_Bau_2_Wasser(C_INFO) // E1
{
	nr = 800;
	condition = Info_Bau_2_Wasser_Condition;
	information = Info_Bau_2_Wasser_Info;
	important = 0;
	permanent = 1;
//	description = "Lefty sent me. I've brought you some water.";
//	description = "Lefty schickt mich. Ich hab Wasser für dich.";
	description = "Lefty mě poslal. Přinesl jsem ti trochu vody.";
};

func int Info_Bau_2_Wasser_Condition()
{
	if ((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01)))
	&& (self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

func void Info_Bau_2_Wasser_Info()
{
//	AI_Output(other,self,"Info_Bau_2_Wasser_15_00"); //Lefty sent me. I've brought you some water.
//	AI_Output(other,self,"Info_Bau_2_Wasser_15_00"); //Lefty schickt mich. Ich hab' Wasser für dich.
	AI_Output(other,self,"Info_Bau_2_Wasser_15_00"); //Lefty mě poslal. Přinesl jsem ti trochu vody.
	if (Npc_HasItems(other,ItFo_Potion_Water_01)>=1)
	{
//		AI_Output(self,other,"Info_Bau_2_Wasser_02_01"); //Thanks, man. My mouth's like a desert!
//		AI_Output(self,other,"Info_Bau_2_Wasser_02_01"); //Danke, Mann. Ich sterbe vor Durst.
		AI_Output(self,other,"Info_Bau_2_Wasser_02_01"); //Díky, kamaráde. Umírám žízní!

		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if (C_BodystateContains(self,BS_SIT))
		{
			AI_StandUp(self);
			AI_TurnToNpc(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);

		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
//		AI_Output(self,other,"Info_Bau_2_Wasser_NOWATER_02_00"); //Water! Hey, man! There's none left! Don't tell me everyone got some except me, again?
//		AI_Output(self,other,"Info_Bau_2_Wasser_NOWATER_02_00"); //Wasser! Hey, Mann! Du hast nichts mehr! Haben wieder alle was gekriegt bis auf mich?
		AI_Output(self,other,"Info_Bau_2_Wasser_NOWATER_02_00"); //Voda! Poslyš, už ti žádná nezbyla! Neříkej mi, že všichni kromě mě dostali?
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Bau_2(var c_NPC slf)
{
	Info_Bau_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_DieLage.npc = Hlp_GetInstanceID(slf);

	Info_Bau_2_Wasser.npc = Hlp_GetInstanceID(slf);
};
