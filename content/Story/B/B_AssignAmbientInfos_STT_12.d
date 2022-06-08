// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Stt_12_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Stt_12 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Stt_12_EXIT_Condition;
	information = Info_Stt_12_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Stt_12_EXIT_Condition()
{
	return 1;
};

func void Info_Stt_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Stt_12_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Stt_12_EinerVonEuchWerden_Condition;
	information = Info_Stt_12_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "I'd like to join the Shadows.";
//	description = "Ich würde mich gerne den Schatten anschliessen.";
	description = "Chtěl bych se dát ke Stínům.";
};

func int Info_Stt_12_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Stt_12_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_00"); //I'd like to join the Shadows.
//	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_00"); //Ich würde mich gerne den Schatten anschließen.
	AI_Output(other, self, "Info_Stt_12_EinerVonEuchWerden_15_00"); //Chtěl bych se dát ke Stínům.
//	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_01"); //Oh. Then you should know that Gomez doesn't tolerate failures. if you wanna be one of us, you have to be prepared to go through fire for him!
//	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_01"); //So? Dann solltest du wissen, dass Gomez kein Versagen duldet. Wenn du einer von uns werden willst, musst du für ihn durchs Feuer gehen!
	AI_Output(self, other, "Info_Stt_12_EinerVonEuchWerden_12_01"); //Oh. Pak bys měl vědět, že Gomez neodpouští chyby. Jestli chceš být jedním z nás, musíš být připravený jít za ním do ohně!
//	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_02"); //Only half of those who tried ever got accepted.
//	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_02"); //Nur die Hälfte derer, die es versucht haben, sind aufgenommen worden.
	AI_Output(self, other, "Info_Stt_12_EinerVonEuchWerden_12_02"); //Přijal jen polovinu těch, co to zkoušeli.
//	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_03"); //What happened to the rest of them?
//	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_03"); //Was ist mit dem Rest passiert?
	AI_Output(other, self, "Info_Stt_12_EinerVonEuchWerden_15_03"); //Co se stalo s těmi, kteří neuspěli?
//	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_04"); //They're probably sitting in the New Camp munching rice. Hee hee hee.
//	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_04"); //Vermutlich sitzen die im Neuen Lager und fressen Reis. He he he.
	AI_Output(self, other, "Info_Stt_12_EinerVonEuchWerden_12_04"); //Nejspíš sedí v Novém táboře a přežvykují rýži. Hahaha.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Stt_12_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Stt_12_WichtigePersonen_Condition;
	information = Info_Stt_12_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who's the boss of this place?";
//	description = "Wer ist hier der Boss?";
	description = "Kdo je tady šéf?";
};

func int Info_Stt_12_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Stt_12_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Stt_12_WichtigePersonen_15_00"); //Who's the boss of this place?
//	AI_Output(other,self,"Info_Stt_12_WichtigePersonen_15_00"); //Wer ist hier der Boss?
	AI_Output(other, self, "Info_Stt_12_WichtigePersonen_15_00"); //Kdo je tady šéf?
//	AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_01"); //Diego's what you might call the head of the Shadows. But Thorus decides who gets to see Gomez.
//	AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_01"); //Diego ist unter den Schatten so was wie der Anführer. Aber Thorus entscheidet, wer zu Gomez vorgelassen wird.
	AI_Output(self, other, "Info_Stt_12_WichtigePersonen_12_01"); //Za hlavu Stínů se dá považovat Diego. Ale o tom, kdo se může setkat s Gomezem, rozhoduje Thorus.

	var C_Npc Diego; Diego = Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	var C_Npc Thorus; Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Stt_12_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Stt_12_DasLager_Condition;
	information = Info_Stt_12_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "I want to know what this camp has to offer.";
//	description = "Ich will wissen, was es hier im Lager alles gibt.";
	description = "Chci vědět, co tenhle tábor může nabídnout.";
};

func int Info_Stt_12_DasLager_Condition()
{
	return 1;
};

func void Info_Stt_12_DasLager_Info()
{
//	AI_Output(other,self,"Info_Stt_12_DasLager_15_00"); //I want to know what this camp has to offer.
//	AI_Output(other,self,"Info_Stt_12_DasLager_15_00"); //Ich will wissen, was es hier im Lager alles gibt.
	AI_Output(other, self, "Info_Stt_12_DasLager_15_00"); //Chci vědět, co tenhle tábor může nabídnout.
//	AI_Output(self,other,"Info_Stt_12_DasLager_12_01"); //Then you'd better ask the diggers. They don't have anything to do all day anyway.
//	AI_Output(self,other,"Info_Stt_12_DasLager_12_01"); //Frag am besten die Buddler. Die haben sowieso den ganzen Tag nichts zu tun.
	AI_Output(self, other, "Info_Stt_12_DasLager_12_01"); //Pak se raději zeptej kopáčů. Stejně nemají celý den co na práci.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Stt_12_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Stt_12_DieLage_Condition;
	information = Info_Stt_12_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "Well, how's it going?";
//	description = "Na, wie steht's?";
	description = "Jak to jde?";
};

func int Info_Stt_12_DieLage_Condition()
{
	return 1;
};

func void Info_Stt_12_DieLage_Info()
{
//	AI_Output(other,self,"Info_Stt_12_DieLage_15_00"); //Well, how's it going?
//	AI_Output(other,self,"Info_Stt_12_DieLage_15_00"); //Na, wie steht's?
	AI_Output(other, self, "Info_Stt_12_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Stt_12_DieLage_12_01"); //What do you want?
//	AI_Output(self,other,"Info_Stt_12_DieLage_12_01"); //Was genau willst du von mir?
	AI_Output(self, other, "Info_Stt_12_DieLage_12_01"); //Co chceš?
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Stt_12(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);

	Info_Stt_12_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_DieLage.npc = Hlp_GetInstanceID(slf);
};
