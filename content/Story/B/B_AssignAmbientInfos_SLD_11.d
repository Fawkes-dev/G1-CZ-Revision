// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Sld_11_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Sld_11 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Sld_11_EXIT_Condition;
	information = Info_Sld_11_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Sld_11_EXIT_Condition()
{
	return 1;
};

func void Info_Sld_11_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Sld_11_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Sld_11_EinerVonEuchWerden_Condition;
	information = Info_Sld_11_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "I want to become a mercenary for the mages.";
//	description = "Ich will ein Söldner der Magier werden.";
	description = "Chci se stát žoldnéřem mágů.";
};

func int Info_Sld_11_EinerVonEuchWerden_Condition()
{
	if ((Npc_GetTrueGuild(other) != GIL_SLD)
	&& (Npc_GetTrueGuild(other) != GIL_KDW)
	&& (!C_NpcBelongsToOldCamp(other))
	&& (!C_NpcBelongsToPsiCamp(other)))
	{
		return TRUE;
	};
};

func void Info_Sld_11_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_00"); //I want to become a mercenary for the mages.
//	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_00"); //Ich will ein Söldner der Magier werden.
	AI_Output(other, self, "Info_Sld_11_EinerVonEuchWerden_15_00"); //Chci se stát žoldnéřem mágů.
//	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_01"); //That's not so hard. if you're prepared to fight for our cause, Lee's bound to take you on.
//	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_01"); //Das ist nicht schwer. Wenn du für unsere Sache kämpfen willst, wird Lee dich nehmen.
	AI_Output(self, other, "Info_Sld_11_EinerVonEuchWerden_11_01"); //To není tak těžké. Pokud jsi připraven bojovat za naši věc, Lee tě přijme.
//	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_02"); //But he only takes people who are good with a sword. Well, are you?
//	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_02"); //Aber er nimmt nur Leute, die gut mit dem Schwert umgehen können. Wie sieht's damit bei dir aus?
	AI_Output(self, other, "Info_Sld_11_EinerVonEuchWerden_11_02"); //Přijímá ale jen ty, co umějí zacházet s mečem. Jak jsi na tom?
//	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_03"); //Well...
//	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_03"); //Nun ...
	AI_Output(other, self, "Info_Sld_11_EinerVonEuchWerden_15_03"); //Dobře...
//	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_04"); //I thought so. if you're really serious, talk to Gorn. He's trained newcomers before.
//	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_04"); //Dachte ich mir. Wenn es dir wirklich ernst ist, rede mit Gorn. Er hat schon mal einen Frischling ausgebildet.
	AI_Output(self, other, "Info_Sld_11_EinerVonEuchWerden_11_04"); //Myslel jsem si to. Jestli to myslíš opravdu vážně, promluv si s Gornem. Ten cvičí nováčky.
//	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_05"); //Maybe you'll be lucky and he'll take the time to train you.
//	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_05"); //Vielleicht hast du ja Glück und er macht sich auch bei dir die Mühe.
	AI_Output(self, other, "Info_Sld_11_EinerVonEuchWerden_11_05"); //Možná budeš mít štěstí a vezme tě na výcvik.
	var C_Npc Gorn; Gorn = Hlp_GetNpc(PC_Fighter);
	Gorn.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Sld_11_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Sld_11_WichtigePersonen_Condition;
	information = Info_Sld_11_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Sld_11_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Sld_11_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Sld_11_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other, self, "Info_Sld_11_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_01"); //We do as the mages say. But usually they don't say nothin'. They just hang out by the ore mound and bury their noses in their books.
//	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_01"); //Wir tun was die Magier sagen. Aber meistens sagen sie gar nichts. Sie hängen beim Erzhaufen und brüten über ihren Büchern.
	AI_Output(self, other, "Info_Sld_11_WichtigePersonen_11_01"); //Děláme to, co řeknou mágové. Obvykle ale neříkají nic. Jenom sedí na své rudě a nosy mají zabořené do knih.
//	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_02"); //Basically, Lee's in charge. He's our boss.
//	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_02"); //Im Grunde regelt Lee alles. Er ist unser Anführer.
	AI_Output(self, other, "Info_Sld_11_WichtigePersonen_11_02"); //V podstatě tady velí Lee. Je náš šéf.
	var C_Npc Lee; Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_Npc Cronos; Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Sld_11_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Sld_11_DasLager_Condition;
	information = Info_Sld_11_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "Is there any trouble in this camp?";
//	description = "Gibt es Probleme hier im Lager?";
	description = "Jsou v tomhle táboře nějaké problémy?";
};

func int Info_Sld_11_DasLager_Condition()
{
	return 1;
};

func void Info_Sld_11_DasLager_Info()
{
//	AI_Output(other,self,"Info_Sld_11_DasLager_15_00"); //Is there any trouble in this camp?
//	AI_Output(other,self,"Info_Sld_11_DasLager_15_00"); //Gibt es Probleme hier im Lager?
	AI_Output(other, self, "Info_Sld_11_DasLager_15_00"); //Jsou v tomhle táboře nějaké problémy?
//	AI_Output(self,other,"Info_Sld_11_DasLager_11_01"); //Man, there's always trouble. The rogues do as they please and we mercenaries have to shield the mages and defend the Camp.
//	AI_Output(self,other,"Info_Sld_11_DasLager_11_01"); //Junge, hier gibt es immer Probleme. Die Banditen machen, was sie wollen und wir Söldner sind damit beschäftigt, die Magier zu decken und die Verteidigung des Lagers aufrecht zu erhalten.
	AI_Output(self, other, "Info_Sld_11_DasLager_11_01"); //Člověče, vždycky jsou problémy. Bandité dělají, co se jim zachce, a my, žoldáci, chráníme mágy a tábor.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Sld_11_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Sld_11_DieLage_Condition;
	information = Info_Sld_11_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "You okay?";
//	description = "Alles klar bei dir?";
	description = "Jsi v pořádku?";
};

func int Info_Sld_11_DieLage_Condition()
{
	return 1;
};

func void Info_Sld_11_DieLage_Info()
{
//	AI_Output(other,self,"Info_Sld_11_DieLage_15_00"); //You okay?
//	AI_Output(other,self,"Info_Sld_11_DieLage_15_00"); //Alles klar bei dir?
	AI_Output(other, self, "Info_Sld_11_DieLage_15_00"); //Jsi v pořádku?
//	AI_Output(self,other,"Info_Sld_11_DieLage_11_01"); //All's quiet for now...
//	AI_Output(self,other,"Info_Sld_11_DieLage_11_01"); //Noch ist alles ruhig ...
	AI_Output(self, other, "Info_Sld_11_DieLage_11_01"); //Všechno je teď v klidu...
//	AI_Output(other,self,"Info_Sld_11_DieLage_15_02"); //For now?
//	AI_Output(other,self,"Info_Sld_11_DieLage_15_02"); //Noch?
	AI_Output(other, self, "Info_Sld_11_DieLage_15_02"); //Teď?
//	AI_Output(self,other,"Info_Sld_11_DieLage_11_03"); //if the rogues keep on attacking Gomez' convoys, it won't be long before him and his army come knocking down the gates.
//	AI_Output(self,other,"Info_Sld_11_DieLage_11_03"); //Wenn die Banditen weiter Gomez' Konvois überfallen, steht er irgendwann mit seiner Armee hier vor dem Tor.
	AI_Output(self, other, "Info_Sld_11_DieLage_11_03"); //Jestliže budou bandité dále přepadat Gomezovy konvoje, nebude dlouho trvat, než sem dorazí jeho armáda a prorazí bránu.
//	AI_Output(self,other,"Info_Sld_11_DieLage_11_04"); //And that's not gonna be much fun.
//	AI_Output(self,other,"Info_Sld_11_DieLage_11_04"); //Und das wird bestimmt kein Spaß.
	AI_Output(self, other, "Info_Sld_11_DieLage_11_04"); //Pak to nebude žádná legrace
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

instance Info_Sld_11_Krautprobe(C_INFO) // E1
{
	nr = 5;
	condition = Info_Sld_11_Krautprobe_Condition;
	information = Info_Sld_11_Krautprobe_Info;
	important = 0;
	permanent = 1;
//	description = "D'you want some swampweed?";
//	description = "Willst du etwas Sumpfkraut?";
	description = "Chceš trochu drogy z bažin?";
};

func int Info_Sld_11_Krautprobe_Condition()
{
	if (((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&& (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Sld_11_Krautprobe_Info()
{
//	AI_Output(other,self,"Info_Sld_11_Krautprobe_15_00"); //D'you want some swampweed?
//	AI_Output(other,self,"Info_Sld_11_Krautprobe_15_00"); //Willst du etwas Sumpfkraut?
	AI_Output(other, self, "Info_Sld_11_Krautprobe_15_00"); //Chceš trochu drogy z bažin?

	if ((Npc_HasItems(other, ItMiJoint_1) > 0) || (Npc_HasItems(other, ItMiJoint_2) > 0) || (Npc_HasItems(other, ItMiJoint_3) > 0))
	{
		if (Npc_HasItems(other, ItMiJoint_1))
		{ B_GiveInvItems(other, self, ItMiJoint_1, 1); }

		else if (Npc_HasItems(other, ItMiJoint_2))
		{ B_GiveInvItems(other, self, ItMiJoint_2, 1); }

		else if (Npc_HasItems(other, ItMiJoint_3))
		{ B_GiveInvItems(other, self, ItMiJoint_3, 1); };
//		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_01"); //Sure I do. Here's 10 Ore.
//		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_01"); //Gib her. Hier - 10 Erz.
		AI_Output(self, other, "Info_Sld_11_Krautprobe_11_01"); //Určitě. Tady je 10 nugetů.
//		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_02"); //if you get your hands on any more - you know...
//		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_02"); //Wenn du wieder mal was hast - du weißt Bescheid..
		AI_Output(self, other, "Info_Sld_11_Krautprobe_11_02"); //Až budeš zase něco mít, víš kam s tím zajít...

		CreateInvItems(self, itminugget, 10);
		B_GiveInvItems(self, other, itminugget, 10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
//		AI_Output(self,other,"Info_Sld_11_Krautprobe_No_Joint_11_00"); //Get me some, then we'll talk.
//		AI_Output(self,other,"Info_Sld_11_Krautprobe_No_Joint_11_00"); //Besorg mir was, dann reden wir weiter.
		AI_Output(self, other, "Info_Sld_11_Krautprobe_No_Joint_11_00"); //Dej mi trochu, pak si promluvíme.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Sld_11(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);

	Info_Sld_11_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_DieLage.npc = Hlp_GetInstanceID(slf);

	Info_Sld_11_Krautprobe.npc = Hlp_GetInstanceID(slf);
};
