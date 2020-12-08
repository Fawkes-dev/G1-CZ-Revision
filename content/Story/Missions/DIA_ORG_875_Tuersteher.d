// ************************************************************
//	  EXIT 
// ************************************************************

instance DIA_Org_875_EXIT(C_INFO)
{
	npc = Org_875_Tuersteher;
	nr = 999;
	condition = DIA_Org_875_EXIT_Condition;
	information = DIA_Org_875_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Org_875_EXIT_Condition()
{
	return 1;
};

func void DIA_Org_875_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

// ************************************************************
// PERM
// ************************************************************

instance DIA_Org_875_PERM(C_INFO)
{
	npc = Org_875_Tuersteher;
	nr = 1;
	condition = DIA_Org_875_PERM_Condition;
	information = DIA_Org_875_PERM_Info;
	permanent = 1;
//	description = "You only let in rogues and scrapers?";
//	description = "Ihr lasst hier nur Banditen und Schürfer rein?";
	description = "Pouštíte dovnitř jenom bandity a rudaře?";
};                       

func int DIA_Org_875_PERM_Condition()
{
	return 1;
};

func void DIA_Org_875_PERM_Info()
{ 
//	AI_Output(other,self,"DIA_Org_875_PERM_15_00"); //You only let in rogues and scrapers?
//	AI_Output(other,self,"DIA_Org_875_PERM_15_00"); //Ihr lasst hier nur Banditen und Schürfer rein?
	AI_Output(other,self,"DIA_Org_875_PERM_15_00"); //Pouštíte dovnitř jenom bandity a rudaře?
//	AI_Output(self,other,"DIA_Org_875_PERM_13_01"); //We don't mind the sect brothers either.
//	AI_Output(self,other,"DIA_Org_875_PERM_13_01"); //Gegen die Brüder aus der Sekte haben wir auch nichts.
	AI_Output(self,other,"DIA_Org_875_PERM_13_01"); //Proti sektářským bratrům také nic nemáme.
//	AI_Output(self,other,"DIA_Org_875_PERM_13_02"); //But apart from that, nobody gets in here.
//	AI_Output(self,other,"DIA_Org_875_PERM_13_02"); //Aber sonst kommt uns hier keiner rein.
	AI_Output(self,other,"DIA_Org_875_PERM_13_02"); //Ale kromě nich sem už nikdo nepřijde.
};
