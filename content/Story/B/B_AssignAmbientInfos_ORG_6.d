// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Org_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_6 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Org_6_EXIT_Condition;
	information = Info_Org_6_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Org_6_EXIT_Condition()
{
	return 1;
};

func void Info_Org_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Org_6_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Org_6_EinerVonEuchWerden_Condition;
	information = Info_Org_6_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "I want to join you!";
//	description = "Ich will bei euch mitmachen!";
	description = "Chci se k vám přidat!";
};

func int Info_Org_6_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Org_6_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_00"); //I wanna join you!
//	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_00"); //Ich will bei euch mitmachen!
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_00"); //Chci se k vám přidat!
//	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_01"); //Lares decides who gets to join the gang.
//	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_01"); //Lares entscheidet, wer in die Bande aufgenommen wird.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_01"); //Lares rozhoduje, kdo se k tlupě přidá.
//	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_02"); //But you'll need a good reason if you wanna see him.
//	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_02"); //Aber wenn du zu ihm willst, musst du schon 'nen guten Grund haben.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_02"); //To ale budeš potřebovat sakra dobrý důvod, jestli se k němu chceš dostat.
//	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_03"); //Like what?
//	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_03"); //Zum Beispiel?
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_03"); //Například?
//	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_04"); //Like someone sending you to him.
//	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_04"); //Zum Beispiel jemand, der dich zu ihm schickt.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_04"); //Například někoho, kdo tě k němu posílá.
	var C_NPC Lares; Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Org_6_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Org_6_WichtigePersonen_Condition;
	information = Info_Org_6_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who's the boss?";
//	description = "Wer ist hier der Boss?";
	description = "Kdo je šéf?";
};

func int Info_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_6_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00"); //Who's the boss?
//	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00"); //Wer ist hier der Boss?
	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00"); //Kdo je šéf?
//	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_01"); //You've just come from the Old Camp, eh?
//	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_01"); //Kommst wohl gerade aus dem Alten Lager, was?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_01"); //Tys právě přišel ze Starého tábora, co?
//	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_02"); //Nobody's the boss here. That damned Lee keeps trying to keep us on a leash, but we do as we see fit.
//	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_02"); //Hier ist niemand der Boss. Der verdammte Lee versucht zwar immer, uns an der Leine zu halten, aber wir machen, was wir wollen.
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_02"); //Tady není žádný šéf! Ten prokletý Lee se nás snaží držet na uzdě, ale my si děláme, co chceme.
//	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_03"); //If we did have any kind of a boss, it'd be Lares. But he's wise enough not to get involved in other people's business!
//	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_03"); //Wenn es so was wie einen Anführer unter uns gibt, dann ist das Lares. Aber der ist schlau genug, niemandem in seine Sache reinzuquatschen!
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_03"); //Jestli máme něco jako šéfa, pak je to Lares. A ten má dost rozumu na to, aby nikomu do jeho věcí nemluvil!
	var C_NPC Lee; Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Lares; Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Org_6_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Org_6_DasLager_Condition;
	information = Info_Org_6_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "Is there anything I should know about this place?";
//	description = "Was muß ich über diesen Ort wissen?";
	description = "Je něco, co bych měl vědět o tomhle místě?";
};

func int Info_Org_6_DasLager_Condition()
{
	return 1;
};

func void Info_Org_6_DasLager_Info()
{
//	AI_Output(other,self,"Info_Org_6_DasLager_15_00"); //Is there anything I should know about this place?
//	AI_Output(other,self,"Info_Org_6_DasLager_15_00"); //Was muss ich über diesen Ort wissen?
	AI_Output(other,self,"Info_Org_6_DasLager_15_00"); //Je něco, co bych měl o tomhle místě vědět?
//	AI_Output(self,other,"Info_Org_6_DasLager_06_01"); //In the middle of the cave there's a huge hole full of ore. If you're planning on getting your hands on it somehow - forget it!
//	AI_Output(self,other,"Info_Org_6_DasLager_06_01"); //Im Zentrum der Höhle ist ein riesiges Loch voll Erz. Wenn du darüber nachdenkst, wie du da rankommen kannst - vergiss es!
	AI_Output(self,other,"Info_Org_6_DasLager_06_01"); //Uprostřed téhle jeskyně je velká kaverna plná rudy. Ale jestli přemýšlíš, jak se k ní dostat, tak na to zapomeň!
//	AI_Output(self,other,"Info_Org_6_DasLager_06_02"); //I tried it myself once, but those mercenaries keep watch night and day.
//	AI_Output(self,other,"Info_Org_6_DasLager_06_02"); //Ich hab's selber mal probiert, aber die Söldner passen Tag und Nacht auf.
	AI_Output(self,other,"Info_Org_6_DasLager_06_02"); //Sám jsem se o to jednou pokoušel, ale žoldáci to tu ve dne v noci střeží.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Org_6_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Org_6_DieLage_Condition;
	information = Info_Org_6_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How are you?";
//	description = "Wie steht's?";
	description = "Jak to jde?";
};

func int Info_Org_6_DieLage_Condition()
{
	return 1;
};

func void Info_Org_6_DieLage_Info()
{
//	AI_Output(other,self,"Info_Org_6_DieLage_15_00"); //How are you?
//	AI_Output(other,self,"Info_Org_6_DieLage_15_00"); //Wie steht's?
	AI_Output(other,self,"Info_Org_6_DieLage_15_00"); //Jak se máš?
//	AI_Output(self,other,"Info_Org_6_DieLage_06_01"); //Man! What do you think? Eating rice all day and waiting all the time for a chance to get some ore.
//	AI_Output(self,other,"Info_Org_6_DieLage_06_01"); //Mann! Wie soll's schon aussehen. Den ganzen Tag Reis fressen und darauf warten, dass sich 'ne Gelegenheit bietet, an Erz zu kommen.
	AI_Output(self,other,"Info_Org_6_DieLage_06_01"); //Člověče! Co si myslíš? Celý den se cpát rýží a celou dobu čekat na příležitost, jak se dostat k nějaké rudě.
//	AI_Output(self,other,"Info_Org_6_DieLage_06_02"); //Then off to the bar and fill myself up to the brim with rice schnapps!
//	AI_Output(self,other,"Info_Org_6_DieLage_06_02"); //Dann kann man sich mal wieder richtig in der Kneipe mit Reisschnaps voll laufen lassen!
	AI_Output(self,other,"Info_Org_6_DieLage_06_02"); //Pak hurá do baru a naleju se až po okraj rýžovou pálenkou!
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

instance Info_Org_6_Krautprobe(C_INFO) // E1
{
	nr = 5;
	condition = Info_Org_6_Krautprobe_Condition;
	information = Info_Org_6_Krautprobe_Info;
	important = 0;
	permanent = 1;
//	description = "I have some swampweed here. D'you want some?";
//	description = "Ich hab ein bißchen Sumpfkraut dabei. Willst du was?";
	description = "Mám tu trochu drogy z bažin. Dáš si?";
};

func int Info_Org_6_Krautprobe_Condition()
{
	if ((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&& (self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

func void Info_Org_6_Krautprobe_Info()
{
//	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00"); //I have some swampweed here. D'you want some?
//	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00"); //Ich hab ein bißchen Sumpfkraut dabei. Willst du was?
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00"); //Mám tu trochu drogy z bažin. Dáš si?

	if ((Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0))
	{
		if (Npc_HasItems(other,ItMiJoint_1))
		{ B_GiveInvItems(other,self,ItMiJoint_1,1);  }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{ B_GiveInvItems(other,self,ItMiJoint_2,1);  }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{ B_GiveInvItems(other,self,ItMiJoint_3,1);  };

//		AI_Output(self,other,"Info_Org_6_Krautprobe_06_01"); //Sure. Here's 10 Ore.
//		AI_Output(self,other,"Info_Org_6_Krautprobe_06_01"); //Klar. Hier sind 10 Erz. Gib her.
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_01"); //Jasně. Tady je 10 nugetů.
//		AI_Output(self,other,"Info_Org_6_Krautprobe_06_02"); //Come by again when you get some more, will ya?
//		AI_Output(self,other,"Info_Org_6_Krautprobe_06_02"); //Wenn du mal wieder was hast, komm vorbei.
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_02"); //Až budeš mít další, přijď zase, jo?

		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
//		AI_Output(self,other,"Info_Org_6_Krautprobe_No_Joint_06_00"); //Where? I don't see no weed.
//		AI_Output(self,other,"Info_Org_6_Krautprobe_No_Joint_06_00"); //Wo? Ich sehe kein Kraut.
		AI_Output(self,other,"Info_Org_6_Krautprobe_No_Joint_06_00"); //Kde? Žádnou drogu tu nevidím.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Org_6(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);

	Info_Org_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_DieLage.npc = Hlp_GetInstanceID(slf);

	Info_Org_6_Krautprobe.npc = Hlp_GetInstanceID(slf);
};
