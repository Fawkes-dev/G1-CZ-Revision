// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Bau_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_4 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Bau_4_EXIT_Condition;
	information = Info_Bau_4_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Bau_4_EXIT_Condition()
{
	return 1;
};

func void Info_Bau_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Bau_4_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Bau_4_WichtigePersonen_Condition;
	information = Info_Bau_4_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Do you have a leader?";
//	description = "Habt ihr einen Anführer?";
	description = "Máte nějakého vůdce?";
};

func int Info_Bau_4_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Bau_4_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_00"); //Do you have a leader?
//	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_00"); //Habt ihr einen Anführer?
	AI_Output(other, self, "Info_Bau_4_WichtigePersonen_15_00"); //Máte nějakého vůdce?
//	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_01"); //You could say the Rice Lord's our leader. But most of us only work for him because they're scared of him and his thugs.
//	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_01"); //Der Reislord ist so was wie unser Anführer. Aber die meisten arbeiten nur aus Angst vor ihm und seinen Schlägern.
	AI_Output(self, other, "Info_Bau_4_WichtigePersonen_04_01"); //Rýžový Lord je něco jako náš vůdce. Ale většina z nás pro něj pracuje jen ze strachu z něho a z jeho hrdlořezů.
//	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_02"); //Not like me. I been around a few years and I've had enough of being knocked around by the rogues in the Camp... the rice fields are just right for me.
//	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_02"); //Bei mir sieht das anders aus. Ich hab' schon ein paar Jahre auf dem Buckel und keine Lust mehr, mich mit den Banditen im Lager rumzuschlagen ... Die Reisfelder sind genau das Richtige für mich.
	AI_Output(self, other, "Info_Bau_4_WichtigePersonen_04_02"); //Já ale ne. Už jsem tu nějakých pár let, protože jsem měl už dost výprasků od těch lotrů z tábora... rýžová pole jsou pro mě to pravé.
	var C_Npc Ricelord; Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Bau_4_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Bau_4_DasLager_Condition;
	information = Info_Bau_4_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "Is there anything I should know about this place?";
//	description = "Was muß ich über diesen Ort wissen?";
	description = "Je něco, co bych měl vědět o tomhle místě?";
};

func int Info_Bau_4_DasLager_Condition()
{
	return 1;
};

func void Info_Bau_4_DasLager_Info()
{
//	AI_Output(other,self,"Info_Bau_4_DasLager_15_00"); //Is there anything I should know about this place?
//	AI_Output(other,self,"Info_Bau_4_DasLager_15_00"); //Was muss ich über diesen Ort wissen?
	AI_Output(other, self, "Info_Bau_4_DasLager_15_00"); //Je něco, co bych měl o tomhle místě vědět?
//	AI_Output(self,other,"Info_Bau_4_DasLager_04_01"); //Be careful at the Camp, boy! A lot of cut-throats hang out there, just waiting to lay their hands on a newcomer like you.
//	AI_Output(self,other,"Info_Bau_4_DasLager_04_01"); //Sei vorsichtig, wenn du ins Lager gehst, Junge! Da laufen so einige Halsabschneider rum, die einem Neuen wie dir an die Kehle wollen.
	AI_Output(self, other, "Info_Bau_4_DasLager_04_01"); //Dávej si v táboře pozor, chlapče. Motá se tam spousta zabijáků, kteří se nemohou dočkat, až si podají nováčky, jako jsi ty.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Bau_4_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Bau_4_DieLage_Condition;
	information = Info_Bau_4_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie läuft's denn so?";
	description = "Jak to jde?";
};

func int Info_Bau_4_DieLage_Condition()
{
	return 1;
};

func void Info_Bau_4_DieLage_Info()
{
//	AI_Output(other,self,"Info_Bau_4_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_Bau_4_DieLage_15_00"); //Wie läuft's denn so?
	AI_Output(other, self, "Info_Bau_4_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Bau_4_DieLage_04_01"); //There's a lot of work. We need a lot of rice to feed all these people.
//	AI_Output(self,other,"Info_Bau_4_DieLage_04_01"); //Gibt 'ne Menge zu tun. Wir brauchen viel Reis, um die Leute hier alle ernähren zu können.
	AI_Output(self, other, "Info_Bau_4_DieLage_04_01"); //Je tu spousta práce. Musíme dodávat hromady rýže na obživu všech těch lidí.
};

// *************************************************************************
// 									WASSER
// *************************************************************************

instance Info_Bau_4_Wasser(C_INFO) // E1
{
	nr = 800;
	condition = Info_Bau_4_Wasser_Condition;
	information = Info_Bau_4_Wasser_Info;
	important = 0;
	permanent = 1;
//	description = "Lefty sent me. I've brought you some water.";
//	description = "Lefty schickt mich. Ich hab Wasser für dich.";
	description = "Lefty mě poslal. Přinesl jsem ti trochu vody.";
};

func int Info_Bau_4_Wasser_Condition()
{
	if (((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&& (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Bau_4_Wasser_Info()
{
//	AI_Output(other,self,"Info_Bau_4_Wasser_15_00"); //Lefty sent me. I've brought you some water.
//	AI_Output(other,self,"Info_Bau_4_Wasser_15_00"); //Lefty schickt mich. Ich hab' Wasser für dich.
	AI_Output(other, self, "Info_Bau_4_Wasser_15_00"); //Lefty mě poslal. Přinesl jsem ti trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01) >= 1)
	{
		B_GiveInvItems(other, self, ItFo_Potion_Water_01, 1);
		if (C_BodystateContains(self, BS_SIT))
		{
			AI_StandUp(self);
			AI_TurnToNpc(self, hero);
		};

		AI_UseItem(self, ItFo_Potion_Water_01);

//		AI_Output(self,other,"Info_Bau_4_Wasser_04_01"); //Thanks, boy! I needed that!
//		AI_Output(self,other,"Info_Bau_4_Wasser_04_01"); //Danke, Junge! Das hab' ich gebraucht!
		AI_Output(self, other, "Info_Bau_4_Wasser_04_01"); //Díky, kamaráde. Už jsem to potřeboval!

		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if (An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};

		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
//		AI_Output(self,other,"Info_Bau_4_Wasser_NOWATER_04_00"); //But you don't have any left. Well, never mind, boy. I'll ask the others.
//		AI_Output(self,other,"Info_Bau_4_Wasser_NOWATER_04_00"); //Aber du hast nichts mehr. Ist schon gut, Junge. Ich werd mich an die andern halten.
		AI_Output(self, other, "Info_Bau_4_Wasser_NOWATER_04_00"); //Ale tobě už žádná nezůstala. Nezoufej, chlapče. Řeknu někomu jinému.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Bau_4(var C_Npc slf)
{
	Info_Bau_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_DieLage.npc = Hlp_GetInstanceID(slf);

	Info_Bau_4_Wasser.npc = Hlp_GetInstanceID(slf);
};
