//***********************************************
//					EXIT
//***********************************************

instance DIA_Rodriguez_Exit(C_INFO)
{
	npc = KDF_400_Rodriguez;
	nr = 999;
	condition = DIA_Rodriguez_Exit_Condition;
	information = DIA_Rodriguez_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Rodriguez_Exit_Condition()
{
	return 1;
};

func void DIA_Rodriguez_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//***********************************************
//				Hallo und tschüß
//***********************************************

instance DIA_Rodriguez_Hello(C_INFO)
{
	npc = KDF_400_Rodriguez;
	nr = 1;
	condition = DIA_Rodriguez_Hello_Condition;
	information = DIA_Rodriguez_Hello_Info;
	important = 0;
	permanent = 1;
//	description = "I'm looking for the High Magician of the Circle of Fire!";
//	description = "Ich suche den obersten Magier des Feuers!";
	description = "Hledám Nejvyššího mága Ohnivého kruhu.";
};

func int DIA_Rodriguez_Hello_Condition()
{
	if (Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return 1;
	};

	return 0;
};

func void DIA_Rodriguez_Hello_Info()
{
//	AI_Output(other,self,"DIA_Rodriguez_Hello_15_00"); //I'm looking for the High Magician of the Circle of Fire!
//	AI_Output(other,self,"DIA_Rodriguez_Hello_15_00"); //Ich suche den obersten Magier des Feuers!
	AI_Output(other,self,"DIA_Rodriguez_Hello_15_00"); //Hledám Nejvyššího mága Ohnivého kruhu.
//	AI_Output(self,other,"DIA_Rodriguez_Hello_12_01"); //Just go to Milten. He deals with gofers like you.
//	AI_Output(self,other,"DIA_Rodriguez_Hello_12_01"); //Geh zu Milten. Der gibt sich mit Laufburschen wie dir ab.
	AI_Output(self,other,"DIA_Rodriguez_Hello_12_01"); //Jdi k Miltenovi. Ten se zabývá poslíčky, jako jsi ty.
	AI_StopProcessInfos(self);
};
