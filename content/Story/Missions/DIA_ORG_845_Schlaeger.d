// **************************************
//					EXIT
// **************************************

instance DIA_845_Exit(C_INFO)
{
	npc = Org_845_Schlaeger;
	nr = 999;
	condition = DIA_Lefty_Exit_Condition;
	information = DIA_Lefty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_845_Exit_Condition()
{
	return 1;
};

func void DIA_845_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************
//			Hallo
// **************************************

instance DIA_845_Hello(C_INFO)
{
	npc = Org_845_Schlaeger;
	nr = 1;
	condition = DIA_845_Hello_Condition;
	information = DIA_845_Hello_Info;
	permanent = 0;
//	description = "What are you doing here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};

func int DIA_845_Hello_Condition()
{
	return 1;
};

func void DIA_845_Hello_Info()
{
//	AI_Output(other,self,"DIA_845_Hello_15_00"); //What are you doing here?
//	AI_Output(other,self,"DIA_845_Hello_15_00"); //Was machst du hier?
	AI_Output(other,self,"DIA_845_Hello_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_845_Hello_13_01"); //I'm working for the Rice Lord.
//	AI_Output(self,other,"DIA_845_Hello_13_01"); //Ich arbeite für den Reislord.
	AI_Output(self,other,"DIA_845_Hello_13_01"); //Pracuju pro Rýžového Lorda.

	var C_NPC Lefty; Lefty = Hlp_GetNpc(Org_844_Lefty);
	if (!Npc_IsDead(Lefty))
	{
//		AI_Output(self,other,"DIA_845_Hello_13_02"); //If you need something, ask Lefty.
//		AI_Output(self,other,"DIA_845_Hello_13_02"); //Wenn du was willst, rede mit Lefty.
		AI_Output(self,other,"DIA_845_Hello_13_02"); //Kdybys něco potřeboval, řekni Leftymu.
	};
};

