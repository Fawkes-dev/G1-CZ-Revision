// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Bau_9_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_9 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Bau_9_EXIT_Condition;
	information = Info_Bau_9_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Bau_9_EXIT_Condition()
{
	return 1;
};

func void Info_Bau_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Bau_9_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Bau_9_WichtigePersonen_Condition;
	information = Info_Bau_9_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Whose job is it to make sure everything goes according to plan in the fields?";
//	description = "Wer kümmert sich darum, daß hier auf den Feldern alles glatt geht?";
	description = "Kdo má na starosti dohled nad plněním plánu práce na těch polích?";
};

func int Info_Bau_9_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Bau_9_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Bau_9_WichtigePersonen_15_00"); //Whose job is it to make sure everything goes according to plan in the fields?
//	AI_Output(other,self,"Info_Bau_9_WichtigePersonen_15_00"); //Wer kümmert sich darum, dass hier auf den Feldern alles glatt geht?
	AI_Output(other, self, "Info_Bau_9_WichtigePersonen_15_00"); //Kdo má na starosti dohled nad plněním plánu práce na těch polích?
//	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_01"); //Everyone's! The Rice Lord's supposed to be watching over the work, but if you ask me he spends all day sitting in his bunker counting his sacks.
//	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_01"); //Na, wir alle! Der Reislord überwacht zwar alles, aber ich glaube, er sitzt den ganzen Tag in seinem Bunker und zählt die Säcke.
	AI_Output(self, other, "Info_Bau_9_WichtigePersonen_09_01"); //Každý! Rýžový Lord sice hlídá všechno, ale já mám dojem, že celé dny prosedí ve svém bunkru a počítá pytle.
//	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_02"); //Well, him and Homer did set all this up...
//	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_02"); //Na, immerhin hat er zusammen mit Homer die ganze Anlage hier gebaut ...
	AI_Output(self, other, "Info_Bau_9_WichtigePersonen_09_02"); //On a Homer to všechno vymysleli.
	var C_Npc Ricelord; Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Bau_9_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Bau_9_DasLager_Condition;
	information = Info_Bau_9_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "Tell me about this camp.";
//	description = "Erzähl mir was über dieses Lager.";
	description = "Povídej mi o táboře.";
};

func int Info_Bau_9_DasLager_Condition()
{
	return 1;
};

func void Info_Bau_9_DasLager_Info()
{
//	AI_Output(other,self,"Info_Bau_9_DasLager_15_00"); //Tell me about this camp.
//	AI_Output(other,self,"Info_Bau_9_DasLager_15_00"); //Erzähl mir was über dieses Lager.
	AI_Output(other, self, "Info_Bau_9_DasLager_15_00"); //Povídej mi o táboře.
//	AI_Output(self,other,"Info_Bau_9_DasLager_09_01"); //It's full to the brim with bastards. if it was up to me, I'd have the mercenaries throw all the rogues out of the Camp.
//	AI_Output(self,other,"Info_Bau_9_DasLager_09_01"); //Es ist randvoll mit Arschlöchern. Wenn's nach mir ginge, sollten die Söldner alle Banditen einfach aus dem Lager werfen.
	AI_Output(self, other, "Info_Bau_9_DasLager_09_01"); //Je až po střechu plný bastardů. Kdyby bylo po mém, nechal bych žoldáky, aby všechny ty lotry z tábora vyházeli.
//	AI_Output(self,other,"Info_Bau_9_DasLager_09_02"); //They don't do their share and only make trouble.
//	AI_Output(self,other,"Info_Bau_9_DasLager_09_02"); //Die tun gar nichts für uns. Machen nur Ärger.
	AI_Output(self, other, "Info_Bau_9_DasLager_09_02"); //Nedělají nic...jenom problémy.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Bau_9_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Bau_9_DieLage_Condition;
	information = Info_Bau_9_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How are you?";
//	description = "Wie steht's?";
	description = "Jak to jde?";
};

func int Info_Bau_9_DieLage_Condition()
{
	return 1;
};

func void Info_Bau_9_DieLage_Info()
{
//	AI_Output(other,self,"Info_Bau_9_DieLage_15_00"); //How are you?
//	AI_Output(other,self,"Info_Bau_9_DieLage_15_00"); //Wie steht's?
	AI_Output(other, self, "Info_Bau_9_DieLage_15_00"); //Jak se máš?
//	AI_Output(self,other,"Info_Bau_9_DieLage_09_01"); //We're working our butts off to make sure we get somethin' to eat!
//	AI_Output(self,other,"Info_Bau_9_DieLage_09_01"); //Wir arbeiten uns den Arsch ab, damit hier alle was zu futtern kriegen!
	AI_Output(self, other, "Info_Bau_9_DieLage_09_01"); //Pracujeme do úmoru, abysme dostali něco k jídlu!
};

// *************************************************************************
// 									WASSER
// *************************************************************************

instance Info_Bau_9_Wasser(C_INFO) // E1
{
	nr = 800;
	condition = Info_Bau_9_Wasser_Condition;
	information = Info_Bau_9_Wasser_Info;
	important = 0;
	permanent = 1;
//	description = "Lefty sent me. I've brought you some water.";
//	description = "Lefty schickt mich. Ich hab Wasser für dich.";
	description = "Lefty mě poslal. Přinesl jsem ti trochu vody.";
};

func int Info_Bau_9_Wasser_Condition()
{
	if (((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&& (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Bau_9_Wasser_Info()
{
//	AI_Output(other,self,"Info_Bau_9_Wasser_15_00"); //Lefty sent me. I've brought you some water.
//	AI_Output(other,self,"Info_Bau_9_Wasser_15_00"); //Lefty schickt mich. Ich hab' Wasser für dich.
	AI_Output(other, self, "Info_Bau_9_Wasser_15_00"); //Lefty mě poslal. Přinesl jsem ti trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01) >= 1)
	{
		B_GiveInvItems(other, self, ItFo_Potion_Water_01, 1);
		if (C_BodystateContains(self, BS_SIT))
		{
			AI_StandUp(self);
			AI_TurnToNpc(self, hero);
		};

		AI_UseItem(self, ItFo_Potion_Water_01);

//		AI_Output(self,other,"Info_Bau_9_Wasser_09_01"); //Thanks, man! A bit longer and I'd have started drinking mud.
//		AI_Output(self,other,"Info_Bau_9_Wasser_09_01"); //Danke, Mann! Ich war schon kurz davor, den Schlamm zu saufen.
		AI_Output(self, other, "Info_Bau_9_Wasser_09_01"); //Díky, kamaráde! Ještě chvilku a zešílel bych žízní!

		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if (An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};

		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
//		AI_Output(self,other,"Info_Bau_9_Wasser_NOWATER_09_00"); //You've run out. I'll get some from the others.
//		AI_Output(self,other,"Info_Bau_9_Wasser_NOWATER_09_00"); //Du hast nichts mehr. Ich hol' mir von den anderen was.
		AI_Output(self, other, "Info_Bau_9_Wasser_NOWATER_09_00"); //Už nic nezbylo. Vezmu trochu od ostatních.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Bau_9(var C_Npc slf)
{
	Info_Bau_9_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Bau_9_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Bau_9_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Bau_9_DieLage.npc = Hlp_GetInstanceID(slf);

	Info_Bau_9_Wasser.npc = Hlp_GetInstanceID(slf);
};
