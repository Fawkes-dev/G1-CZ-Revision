// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_Grd_281_Exit(C_INFO)
{
	npc = GRD_281_Gardist;
	nr = 999;
	condition = DIA_Grd_281_Exit_Condition;
	information = DIA_Grd_281_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Grd_281_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_281_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 					Ich Wache
// **************************************************

instance DIA_Grd_281_GuardGate(C_INFO)
{
	npc = GRD_281_Gardist;
	nr = 1;
	condition = DIA_Grd_281_GuardGate_Condition;
	information = DIA_Grd_281_GuardGate_Info;
	//#Needs_Attention - zbytocny permanentny dialog - zrusil by som to
	permanent = 1;
//	description = "How's it going?"; 
//	description = "Wie steht's?"; 
	description = "Jak to jde?"; 
};

func int DIA_Grd_281_GuardGate_Condition()
{ 
	if (!C_NpcBelongsToNewcamp (other))
	{ 
		return 1;
	};
};

func void DIA_Grd_281_GuardGate_Info()
{
//	AI_Output(other,self,"DIA_Grd_281_GuardGate_15_00"); //How's it going?
//	AI_Output(other,self,"DIA_Grd_281_GuardGate_15_00"); //Wie steht's?
	AI_Output(other,self,"DIA_Grd_281_GuardGate_15_00"); //Jak to jde?
//	AI_Output(self,other,"DIA_Grd_281_GuardGate_07_01"); //Good. None of the rogues from the New Camp are to be seen anywhere!
//	AI_Output(self,other,"DIA_Grd_281_GuardGate_07_01"); //Gut. Weit und breit keiner von den Banditen aus dem Neuen Lager zu sehen!
	AI_Output(self,other,"DIA_Grd_281_GuardGate_07_01"); //Dobře. Široko daleko žádný bandita z Nového tábora!
	AI_StopProcessInfos(self);
};
