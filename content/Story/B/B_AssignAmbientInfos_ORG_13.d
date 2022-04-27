// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Org_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_13 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Org_13_EXIT_Condition;
	information = Info_Org_13_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Org_13_EXIT_Condition()
{
	return 1;
};

func void Info_Org_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Org_13_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Org_13_EinerVonEuchWerden_Condition;
	information = Info_Org_13_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "What do I have to do to join the Camp?";
//	description = "Was muß ich tun, wenn ich mich dem Lager anschließen will?";
	description = "Co musím udělat, abych se mohl přidat k táboru?";
};

func int Info_Org_13_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Org_13_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Org_13_EinerVonEuchWerden_15_00"); //What do I have to do to join the Camp?
//	AI_Output(other,self,"Info_Org_13_EinerVonEuchWerden_15_00"); //Was muss ich tun, wenn ich mich dem Lager anschließen will?
	AI_Output(other,self,"Info_Org_13_EinerVonEuchWerden_15_00"); //Co musím udělat, abych se mohl přidat k táboru?
//	AI_Output(self,other,"Info_Org_13_EinerVonEuchWerden_13_01"); //Go out into the fields and help the peasants collect the rice.
//	AI_Output(self,other,"Info_Org_13_EinerVonEuchWerden_13_01"); //Geh auf die Felder und hilf den Bauern beim Reispflücken.
	AI_Output(self,other,"Info_Org_13_EinerVonEuchWerden_13_01"); //Jdi na pole a pomoz rolníkům sklízet rýži.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Org_13_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Org_13_WichtigePersonen_Condition;
	information = Info_Org_13_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_13_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Org_13_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Org_13_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other,self,"Info_Org_13_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_Org_13_WichtigePersonen_13_01"); //Lee's the head of the mercenaries, if THAT's what you mean. But I'm no mercenary and I'm damned if I'll let them boss me around!
//	AI_Output(self,other,"Info_Org_13_WichtigePersonen_13_01"); //Lee führt die Söldner an, wenn du DAS wissen wolltest. Aber ich bin kein Söldner und ich lasse mir von den Pennern auch bestimmt nichts sagen!
	AI_Output(self,other,"Info_Org_13_WichtigePersonen_13_01"); //Lee je hlava žoldáků, jestli tě zrovna TOHLE zajímá. Ale já nejsem žoldák a ať mě vezme čert, jestli je nechám, aby mi rozkazovali!
	var C_NPC Lee; Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Org_13_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Org_13_DasLager_Condition;
	information = Info_Org_13_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "I want to know more about this camp.";
//	description = "Ich will mehr über dieses Lager erfahren.";
	description = "Chci vědět o táboru víc.";
};

func int Info_Org_13_DasLager_Condition()
{
	return 1;
};

func void Info_Org_13_DasLager_Info()
{
//	AI_Output(other,self,"Info_Org_13_DasLager_15_00"); //I want to know more about this camp.
//	AI_Output(other,self,"Info_Org_13_DasLager_15_00"); //Ich will mehr über dieses Lager erfahren.
	AI_Output(other,self,"Info_Org_13_DasLager_15_00"); //Chci vědět o táboru víc.
//	AI_Output(self,other,"Info_Org_13_DasLager_13_01"); //Then go on in and take a look round. So long as you're not one of Gomez' men, no-one'll stop you.
//	AI_Output(self,other,"Info_Org_13_DasLager_13_01"); //Dann geh rein und schau es dir an. Solange du nicht einer von Gomez' Leuten bist, wird dich keiner aufhalten.
	AI_Output(self,other,"Info_Org_13_DasLager_13_01"); //Tak jdi a porozhlédni se kolem. Dokud nebudeš patřit ke  Gomezových mužům, nikdo ti v tom nebude bránit.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Org_13_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Org_13_DieLage_Condition;
	information = Info_Org_13_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Org_13_DieLage_Condition()
{
	return 1;
};

func void Info_Org_13_DieLage_Info()
{
//	AI_Output(other,self,"Info_Org_13_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_Org_13_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other,self,"Info_Org_13_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Org_13_DieLage_13_01"); //And what do YOU want?
//	AI_Output(self,other,"Info_Org_13_DieLage_13_01"); //Was willst DU denn von mir?
	AI_Output(self,other,"Info_Org_13_DieLage_13_01"); //Co TY mi vlastně chceš?
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

instance Info_Org_13_Krautprobe(C_INFO) // E1
{
	nr = 5;
	condition = Info_Org_13_Krautprobe_Condition;
	information = Info_Org_13_Krautprobe_Info;
	important = 0;
	permanent = 1;
//	description = "You look like you could do with some swampweed.";
//	description = "Du siehst aus, als wenn du etwas Sumpfkraut haben wolltest.";
	description = "Vypadá to, jako bys měl co dělat s drogou z bažin.";
};

func int Info_Org_13_Krautprobe_Condition()
{
	if ((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&& (self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

func void Info_Org_13_Krautprobe_Info()
{
//	AI_Output(other,self,"Info_Org_13_Krautprobe_15_00"); //You look like you could do with some swampweed.
//	AI_Output(other,self,"Info_Org_13_Krautprobe_15_00"); //Du siehst aus, als wenn du etwas Sumpfkraut haben wolltest.
	AI_Output(other,self,"Info_Org_13_Krautprobe_15_00"); //Vypadá to, jako bys měl co dělat s drogou z bažin.

	if ((Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0))
	{
		if (Npc_HasItems(other,ItMiJoint_1))
		{ B_GiveInvItems(other,self,ItMiJoint_1,1);  }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{ B_GiveInvItems(other,self,ItMiJoint_2,1);  }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{ B_GiveInvItems(other,self,ItMiJoint_3,1);  };

//		AI_Output(self,other,"Info_Org_13_Krautprobe_13_01"); //You got some? I'll have a stalk for 10 Ore.
//		AI_Output(self,other,"Info_Org_13_Krautprobe_13_01"); //Hast du was? Ich nehm einen Stengel für 10 Erz.
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_01"); //Máš něco? Dám ti za jednu lodyhu 10 nugetů.
//		AI_Output(self,other,"Info_Org_13_Krautprobe_13_02"); //Come back anytime, brother.
//		AI_Output(self,other,"Info_Org_13_Krautprobe_13_02"); //Kannst jederzeit wieder kommen, Bruder.
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_02"); //Můžeš vždycky zase přijít, bratře.

		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
//		AI_Output(self,other,"Info_Org_13_Krautprobe_No_Joint_13_00"); //But you've got none. Hey! Don't piss me around!
//		AI_Output(self,other,"Info_Org_13_Krautprobe_No_Joint_13_00"); //Aber du hast nichts. Mach keine dummen Späße mit mir, klar?
		AI_Output(self,other,"Info_Org_13_Krautprobe_No_Joint_13_00"); //Ale ty nic nemáš. Přestaň si ze mě dělat blázny, jasný?
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Org_13(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);

	Info_Org_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_DieLage.npc = Hlp_GetInstanceID(slf);

	Info_Org_13_Krautprobe.npc = Hlp_GetInstanceID(slf);
};
