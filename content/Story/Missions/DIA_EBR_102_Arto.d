// ************************************************************
// 			  				   EXIT
// ************************************************************

instance DIA_ARTO_EXIT(C_INFO)
{
	npc = Ebr_102_Arto;
	nr = 999;
	condition = DIA_ARTO_EXIT_Condition;
	information = DIA_ARTO_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_ARTO_EXIT_Condition()
{
	return 1;
};

func void DIA_ARTO_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

instance DIA_ARTO_Hello(C_INFO)
{
	npc = Ebr_102_Arto;
	nr = 3;
	condition = DIA_ARTO_Hello_Condition;
	information = DIA_ARTO_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};

func int DIA_ARTO_Hello_Condition()
{
	return 1;
};

func void DIA_ARTO_Hello_Info()
{
//	AI_Output(other,self,"DIA_ARTO_Hello_15_00"); //Who are you?
//	AI_Output(other,self,"DIA_ARTO_Hello_15_00"); //Wer bist du?
	AI_Output(other,self,"DIA_ARTO_Hello_15_00"); //Kdo jsi?
//	AI_Output(self,other,"DIA_ARTO_Hello_13_01"); //I'm Arto.
//	AI_Output(self,other,"DIA_ARTO_Hello_13_01"); //Ich bin Arto.
	AI_Output(self,other,"DIA_ARTO_Hello_13_01"); //Jsem Arto.
};

// ************************************************************
// 							What
// ************************************************************

instance DIA_ARTO_What(C_INFO)
{
	npc = Ebr_102_Arto;
	nr = 3;
	condition = DIA_ARTO_What_Condition;
	information = DIA_ARTO_What_Info;
	important = 0;
	permanent = 0;
//	description = "What do you do round here?";
//	description = "Was machst du so?";
	description = "Co tady máš na práci?";
};

func int DIA_ARTO_What_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_ARTO_Hello))
	{
		return 1;
	};

	return 0;
};

func void DIA_ARTO_What_Info()
{
//	AI_Output(other,self,"DIA_ARTO_What_15_00"); //What do you do around here?
//	AI_Output(other,self,"DIA_ARTO_What_15_00"); //Was machst du so?
	AI_Output(other,self,"DIA_ARTO_What_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_ARTO_What_13_01"); //I'm Gomez' bodyguard.
//	AI_Output(self,other,"DIA_ARTO_What_13_01"); //Ich bin Gomez' Leibwächter.
	AI_Output(self,other,"DIA_ARTO_What_13_01"); //Jsem Gomezův osobní strážce.
};

// ************************************************************
// 							PERM
// ************************************************************

instance DIA_ARTO_PERM(C_INFO)
{
	npc = Ebr_102_Arto;
	nr = 3;
	condition = DIA_ARTO_PERM_Condition;
	information = DIA_ARTO_PERM_Info;
	important = 0;
	permanent = 1;
//	description = "You don't talk much, do you?";
//	description = "Du redest nicht viel, was?";
	description = "Ty toho moc nenamluvíš, co?";
};

func int DIA_ARTO_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_ARTO_What))
	{
		return 1;
	};

	return 0;
};

func void DIA_ARTO_PERM_Info()
{
//	AI_Output(other,self,"DIA_ARTO_PERM_15_00"); //You don't talk much, do you?
//	AI_Output(other,self,"DIA_ARTO_PERM_15_00"); //Du redest nicht viel, was?
	AI_Output(other,self,"DIA_ARTO_PERM_15_00"); //Ty toho moc nenamluvíš, co?
//	AI_Output(self,other,"DIA_ARTO_PERM_13_01"); //Nope.
//	AI_Output(self,other,"DIA_ARTO_PERM_13_01"); //Nein.
	AI_Output(self,other,"DIA_ARTO_PERM_13_01"); //Moc ne.
};
