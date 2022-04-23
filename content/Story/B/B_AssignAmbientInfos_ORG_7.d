// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Org_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_7 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Org_7_EXIT_Condition;
	information = Info_Org_7_EXIT_Info;
	permanent = 1;
	description = "END";
};

func int Info_Org_7_EXIT_Condition()
{
	return 1;
};

func void Info_Org_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Org_7_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Org_7_EinerVonEuchWerden_Condition;
	information = Info_Org_7_EinerVonEuchWerden_Info;
	permanent = 1;
//	description = "What do I have to do to join the Camp?";
//	description = "Was muß ich tun, wenn ich mich dem Lager anschließen will?";
	description = "Co musím udělat, abych se mohl přidat k táboru?";
};

func int Info_Org_7_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Org_7_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_00"); //What do I have to do to join the Camp?
//	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_00"); //Was muss ich tun, wenn ich mich dem Lager anschließen will?
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_00"); //Co musím udělat, abych se mohl přidat k táboru?
//	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_01"); //You can join our gang. But first you have to prove you're against Gomez.
//	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_01"); //Du kannst dich unserer Bande anschließen. Aber dazu musst du beweisen, dass du gegen Gomez bist.
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_01"); //Můžeš se dát k naší tlupě. Ale nejdřív se musíš postavit Gomezovi.
//	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_02"); //How do I do that?
//	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_02"); //Und wie soll ich das machen?
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_02"); //Jak to mám udělat?
//	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_03"); //If I were you, I'd get something important from the Old Camp or the Old Mine and take it to Lares.
//	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_03"); //Wenn ich du wäre, würde ich Lares irgendwas Wichtiges aus dem Alten Lager oder der Alten Mine bringen.
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_03"); //Být tebou, vzal bych něco důležitého z Starého tábora nebo ze Starého dolu a dal to Laresovi.
	var C_NPC Lares; Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Org_7_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Org_7_WichtigePersonen_Condition;
	information = Info_Org_7_WichtigePersonen_Info;
	permanent = 1;
//	description = "Who's your leader?";
//	description = "Wer ist euer Anführer?";
	description = "Kdo je váš vůdce?";
};

func int Info_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_7_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Org_7_WichtigePersonen_15_00"); //Who's your leader?
//	AI_Output(other,self,"Info_Org_7_WichtigePersonen_15_00"); //Wer ist euer Anführer?
	AI_Output(other,self,"Info_Org_7_WichtigePersonen_15_00"); //Kdo je váš vůdce?
//	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_01"); //Lares is the head of the gang. Most folks accept him.
//	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_01"); //Lares ist das Oberhaupt der Bande. Die meisten akzeptieren ihn.
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_01"); //Lares je hlava tlupy. Většina lidí ho uznává.
//	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_02"); //But he don't tell us what to do.
//	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_02"); //Aber er sagt uns nicht, was wir machen sollen.
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_02"); //Ten nám ale neříká, co dělat.
	var C_NPC Lares; Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Org_7_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Org_7_DasLager_Condition;
	information = Info_Org_7_DasLager_Info;
	permanent = 1;
//	description = "What can you tell me about this camp?";
//	description = "Was kannst du mir über dieses Lager sagen?";
	description = "Co mi můžeš říci o táboře?";
};

func int Info_Org_7_DasLager_Condition()
{
	return 1;
};

func void Info_Org_7_DasLager_Info()
{
//	AI_Output(other,self,"Info_Org_7_DasLager_15_00"); //What can you tell me about this camp?
//	AI_Output(other,self,"Info_Org_7_DasLager_15_00"); //Was kannst du mir über dieses Lager sagen?
	AI_Output(other,self,"Info_Org_7_DasLager_15_00"); //Co mi můžeš říci o táboru?
//	AI_Output(self,other,"Info_Org_7_DasLager_07_01"); //It's a kind of community for community's sake, if you know what I mean. We all do as we please, but there are so many of us that Gomez can't wipe us out that easily.
//	AI_Output(self,other,"Info_Org_7_DasLager_07_01"); //Es ist 'ne Art Zweckgemeinschaft, die wir hier haben. Jeder macht im Grunde, was er will, aber wir sind so viele, dass Gomez uns nicht einfach ausrotten kann.
	AI_Output(self,other,"Info_Org_7_DasLager_07_01"); //Je to jakási komunita pro komunitu, jestli mi rozumíš. Všichni si děláme, co chceme, ale je nás tu tolik, že nás Gomez jentak nevyhladí.
//	AI_Output(self,other,"Info_Org_7_DasLager_07_02"); //Although that's probably what he dreams of at night.
//	AI_Output(self,other,"Info_Org_7_DasLager_07_02"); //Obwohl er das sicher am liebsten tun würde.
	AI_Output(self,other,"Info_Org_7_DasLager_07_02"); //Ačkoli je to přesně to, co by nejraději udělal.
//	AI_Output(other,self,"Info_Org_7_DasLager_15_03"); //What do you have to do with Gomez?
//	AI_Output(other,self,"Info_Org_7_DasLager_15_03"); //Was habt ihr mit Gomez zu schaffen?
	AI_Output(other,self,"Info_Org_7_DasLager_15_03"); //Co vlastně máte s Gomezem?
//	AI_Output(self,other,"Info_Org_7_DasLager_07_04"); //We steal from him!
//	AI_Output(self,other,"Info_Org_7_DasLager_07_04"); //Wir stehlen ihm sein Zeug!
	AI_Output(self,other,"Info_Org_7_DasLager_07_04"); //Okrademe ho!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Org_7_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Org_7_DieLage_Condition;
	information = Info_Org_7_DieLage_Info;
	permanent = 1;
//	description = "What goes on here?";
//	description = "Was läuft denn so?";
	description = "Co se tu děje?";
};

func int Info_Org_7_DieLage_Condition()
{
	return 1;
};

func void Info_Org_7_DieLage_Info()
{
//	AI_Output(other,self,"Info_Org_7_DieLage_15_00"); //What goes on here?
//	AI_Output(other,self,"Info_Org_7_DieLage_15_00"); //Was läuft denn so?
	AI_Output(other,self,"Info_Org_7_DieLage_15_00"); //Co se tu děje?
//	AI_Output(self,other,"Info_Org_7_DieLage_07_01"); //You've not been here long, have you?
//	AI_Output(self,other,"Info_Org_7_DieLage_07_01"); //Du bist wohl noch nicht lange hier, was?
	AI_Output(self,other,"Info_Org_7_DieLage_07_01"); //Tys tady asi ještě nebyl, viď?
//	AI_Output(self,other,"Info_Org_7_DieLage_07_02"); //The mages have been preparing for the blasting of the ore mound for years. They say it won't be long now.
//	AI_Output(self,other,"Info_Org_7_DieLage_07_02"); //Die Magier bereiten sich schon seit Jahren auf die Sprengung des Erzhaufens vor. Es heißt, der große Tag ist nicht mehr weit entfernt.
	AI_Output(self,other,"Info_Org_7_DieLage_07_02"); //Mágové se už léta chystají k odstřelení rudné haldy. Říkají, že už to nebude dlouho trvat.
//	AI_Output(self,other,"Info_Org_7_DieLage_07_03"); //At least it looks that way, considering the huge mound that the scrapers have assembled so far.
//	AI_Output(self,other,"Info_Org_7_DieLage_07_03"); //Zumindest sollte man das annehmen, wenn man sich den Riesenhaufen ansieht, den die Schürfer bis jetzt zusammengekratzt haben.
	AI_Output(self,other,"Info_Org_7_DieLage_07_03"); //Tak se aspoň ukáže cesta. Když se vezme v úvahu to množství rudonosné horniny, kterou rudaři tak dlouho shromažďovali.
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

instance Info_Org_7_Krautprobe(C_INFO) // E1
{
	nr = 5;
	condition = Info_Org_7_Krautprobe_Condition;
	information = Info_Org_7_Krautprobe_Info;
	permanent = 1;
//	description = "D'you want some swampweed?";
//	description = "Willst du etwas Sumpfkraut?";
	description = "Chceš trochu drogy z bažin?";
};

func int Info_Org_7_Krautprobe_Condition()
{
	if ((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&& (self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

func void Info_Org_7_Krautprobe_Info()
{
//	AI_Output(other,self,"Info_Org_7_Krautprobe_15_00"); //D'you want some swampweed?
//	AI_Output(other,self,"Info_Org_7_Krautprobe_15_00"); //Willst du etwas Sumpfkraut?
	AI_Output(other,self,"Info_Org_7_Krautprobe_15_00"); //Chceš trochu drogy z bažin?

	if ((Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0))
	{
		if (Npc_HasItems(other,ItMiJoint_1))
		{ B_GiveInvItems(other,self,ItMiJoint_1,1);  }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{ B_GiveInvItems(other,self,ItMiJoint_2,1);  }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{ B_GiveInvItems(other,self,ItMiJoint_3,1);  };

//		AI_Output(self,other,"Info_Org_7_Krautprobe_07_01"); //I'll give you 10 Ore for it - here.
//		AI_Output(self,other,"Info_Org_7_Krautprobe_07_01"); //Ich geb dir 10 Erz dafür - hier.
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_01"); //Dám ti za ní 10 nugetů, tady jsou.
//		AI_Output(self,other,"Info_Org_7_Krautprobe_07_02"); //Anytime you need to get rid of some more, just stop by.
//		AI_Output(self,other,"Info_Org_7_Krautprobe_07_02"); //Wenn du mal wieder was loswerden willst, komm zu mir.
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_02"); //Až se jí zase budeš potřebovat zbavit, přijď za mnou.

		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
//		AI_Output(self,other,"Info_Org_7_Krautprobe_No_Joint_07_00"); //Where? I see no weed.
//		AI_Output(self,other,"Info_Org_7_Krautprobe_No_Joint_07_00"); //Wo? Ich sehe kein Kraut.
		AI_Output(self,other,"Info_Org_7_Krautprobe_No_Joint_07_00"); //Kde? Žádnou drogu tu nevidím.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Org_7(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);

	Info_Org_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_DieLage.npc = Hlp_GetInstanceID(slf);

	Info_Org_7_Krautprobe.npc = Hlp_GetInstanceID(slf);
};
