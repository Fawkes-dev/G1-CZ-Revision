// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Sld_8_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Sld_8 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Sld_8_EXIT_Condition;
	information = Info_Sld_8_EXIT_Info;
	permanent = 1;
	description = "END";
};

func int Info_Sld_8_EXIT_Condition()
{
	return 1;
};

func void Info_Sld_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Sld_8_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Sld_8_EinerVonEuchWerden_Condition;
	information = Info_Sld_8_EinerVonEuchWerden_Info;
	permanent = 1;
//	description = "Do you need another good man?";
//	description = "Könnt ihr noch einen guten Mann brauchen?";
	description = "Potřebujete spolehlivého muže?";
};

func int Info_Sld_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

func void Info_Sld_8_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00"); //Do you need another good man?
//	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00"); //Könnt ihr noch einen guten Mann brauchen?
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00"); //Potřebujete spolehlivého muže?
//	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01"); //Lee won't have anyone join the mercenaries unless they've been here for years and have had a lot of experience.
//	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01"); //Lee wird keine Leute bei den Söldnern zulassen, die nicht schon 'ne Zeit lang hier waren und Erfahrung gesammelt haben.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01"); //Lee nechce, aby se někdo dával k žoldákům, dokud tu nějaký čas nepobude a nezíská dost zkušeností.
//	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02"); //If you wanna stay in the Camp, you'll have to get to grips with the rogues first.
//	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02"); //Wenn du hier im Lager bleiben willst, musst du dich zuerst mit den Banditen rumschlagen.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02"); //Jestli chceš zůstat v táboře, musíš si získat respekt u banditů.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Sld_8_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Sld_8_WichtigePersonen_Condition;
	information = Info_Sld_8_WichtigePersonen_Info;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Sld_8_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01"); //We mercenaries all follow Lee. He's made a deal with the mages - we protect 'em, they get us out of here.
//	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01"); //Wir Söldner folgen alle Lee. Er hat den Deal mit den Magiern gemacht - wir beschützen sie, und sie bringen uns hier raus.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01"); //My žoldáci jdeme všichni s Leem. Uzavřeli jsme s mágy dohodu, budeme je chránit a oni nás odtud dostanou ven.
//	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02"); //So the mages are really in charge?
//	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02"); //Also führen die Magier das Lager?
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02"); //Takže tu ve skutečnosti velí mágové?
//	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03"); //Nope. Nobody's in charge of the Camp. Most people here are just guys that couldn't or wouldn't stay in the Old Camp.
//	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03"); //Nein. Niemand führt das Lager. Die meisten hier sind einfach Männer, die im Alten Lager nicht bleiben konnten oder wollten.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03"); //Ani náhodou. V táboře nevelí nikdo. Většina lidí jsou chlapíci, kteří nemohli nebo nechtěli být ve Starém táboře.
//	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04"); //We all do our own thing here. We only agree on one thing: It's better to pile the ore into a mound and blow it up than to send it on to that goddam king!
//	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04"); //Hier kocht jeder sein eigenes Süppchen. Die Jungs sind sich nur in einem einig: Besser das ganze Erz auf einen Haufen schütten und in die Luft jagen, als es dem verdammten König in den Rachen zu schieben!
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04"); //Všichni si tady hledíme svého. Ale v jednom jsme zajedno: Je lepší dát všechnu rudu na hromadu a vyhodit ji do vzduchu, než ji cpát do chřtánu tomu zpropadenému králi!
	var C_NPC Lee; Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Cronos; Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Sld_8_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Sld_8_DasLager_Condition;
	information = Info_Sld_8_DasLager_Info;
	permanent = 1;
//	description = "What can you tell me about this camp?";
//	description = "Was kannst du mir über dieses Lager erzählen?";
	description = "Co mi můžeš říci o táboře?";
};

func int Info_Sld_8_DasLager_Condition()
{
	if (!C_NpcBelongsToNewCamp(other))
	{
		return 1;
	};
};
func void Info_Sld_8_DasLager_Info()
{
//	AI_Output(other,self,"Info_Sld_8_DasLager_15_00"); //What can you tell me about this camp?
//	AI_Output(other,self,"Info_Sld_8_DasLager_15_00"); //Was kannst du mir über dieses Lager erzählen?
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00"); //Co mi můžeš říci o táboru?
//	AI_Output(self,other,"Info_Sld_8_DasLager_08_01"); //Watch out while you're here. There are a lot of cut-throats around in the Camp.
//	AI_Output(self,other,"Info_Sld_8_DasLager_08_01"); //Pass auf dich auf, während du hier bist. Im Lager sind 'ne Menge Halsabschneider unterwegs.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01"); //Dávej si tu pozor. V táboře je spousta hrdlořezů.
//	AI_Output(self,other,"Info_Sld_8_DasLager_08_02"); //We have a number of unwritten laws here. One: Only the mercenaries can enter the mages' zone.
//	AI_Output(self,other,"Info_Sld_8_DasLager_08_02"); //Es gibt 'ne Reihe ungeschriebener Gesetze hier. Erstens: Nur die Söldner kommen in den Bereich der Magier.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02"); //Máme tu několik nepsaných zákonů. Zaprvé: jen žoldáci smějí vstoupit na území mágů.
//	AI_Output(self,other,"Info_Sld_8_DasLager_08_03"); //Two: You try to get anywhere near the ore mound, you're a dead man. Three: Don't try to get into the bar on the lake.
//	AI_Output(self,other,"Info_Sld_8_DasLager_08_03"); //Zweitens: Wer versucht, an den Erzhaufen ranzukommen, ist ein toter Mann. Drittens: Ich würde nicht versuchen, in die Kneipe auf dem See zu gehen.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03"); //Zadruhé: pokusíš se přiblížit k haldě rudy a jsi mrtvý muž. Zatřetí: nezkoušej se dostat do baru na jezeře.
//	AI_Output(self,other,"Info_Sld_8_DasLager_08_04"); //Ya see, that's the rogues' bar and they don't like new kids like you showing up there.
//	AI_Output(self,other,"Info_Sld_8_DasLager_08_04"); //Die gehört nämlich den Banditen und die sehen es nicht gerne, wenn grüne Jungs wie du da aufkreuzen.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04"); //Abys věděl, je to bar banditů a ti nemají rádi, když se tam ukazují nováčci.
	var C_NPC Cronos; Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Sld_8_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Sld_8_DieLage_Condition;
	information = Info_Sld_8_DieLage_Info;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Sld_8_DieLage_Condition()
{
	return 1;
};

func void Info_Sld_8_DieLage_Info()
{
//	AI_Output(other,self,"Info_Sld_8_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_Sld_8_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Sld_8_DieLage_08_01"); //As always. Making sure that no-one gets too close to the mages and the ore.
//	AI_Output(self,other,"Info_Sld_8_DieLage_08_01"); //Wie immer - wir passen auf, dass keiner den Magiern und dem Erz zu nahe kommt.
	AI_Output(self,other,"Info_Sld_8_DieLage_08_01"); //Jako vždycky. Staráme se, aby se nikdo nepřibližoval k mágům a k rudě.
	var C_NPC Cronos; Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

instance Info_Sld_8_Krautprobe(C_INFO) // E1
{
	nr = 5;
	condition = Info_Sld_8_Krautprobe_Condition;
	information = Info_Sld_8_Krautprobe_Info;
	permanent = 1;
//	description = "I have some swampweed here - d'you want any?";
//	description = "Ich hab Sumpfkraut dabei - willst du was?";
	description = "Mám tu trochu drogy z bažin. Dáš si?";
};

func int Info_Sld_8_Krautprobe_Condition()
{
	if ((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&& (self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

func void Info_Sld_8_Krautprobe_Info()
{
//	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00"); //I have some swampweed here - d'you want any?
//	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00"); //Ich hab Sumpfkraut dabei - willst du was?
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00"); //Mám tu trochu drogy z bažin. Dáš si?

	if ((Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0))
	{
		if (Npc_HasItems(other,ItMiJoint_1))
		{ B_GiveInvItems(other,self,ItMiJoint_1,1);  }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{ B_GiveInvItems(other,self,ItMiJoint_2,1);  }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{ B_GiveInvItems(other,self,ItMiJoint_3,1);  };

//		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01"); //Why not. I'll give you 10 Ore for it.
//		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01"); //Warum nicht. Gib mir was für 10 Erz.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01"); //Proč ne. Dám ti 10 nugetů.
//		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02"); //Go and ask some of the other guys, they're bound to want some too.
//		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02"); //Frag mal ein paar von den anderen Jungs, die wollen sicher auch was.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02"); //Jdi a řekni i ostatním chlapům, určitě budou chtít taky.

		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
//		AI_Output(self,other,"Info_Sld_8_Krautprobe_No_Joint_08_00"); //Show me the weed first. You don't have any, do you?
//		AI_Output(self,other,"Info_Sld_8_Krautprobe_No_Joint_08_00"); //Ich will erst das Kraut sehen. Du hast doch gar nichts dabei.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_No_Joint_08_00"); //Nejdřív mi ukaž drogu. Žádnou nemáš, viď?
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Sld_8(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);

	Info_Sld_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_DieLage.npc = Hlp_GetInstanceID(slf);

	Info_Sld_8_Krautprobe.npc = Hlp_GetInstanceID(slf);
};
