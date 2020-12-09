// **************************************************
//						 EXIT 
// **************************************************

instance Org_825_Organisator_Exit(C_INFO)
{
	npc = Org_825_Organisator;
	nr = 999;
	condition = Org_825_Organisator_Exit_Condition;
	information = Org_825_Organisator_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Org_825_Organisator_Exit_Condition()
{
	return 1;
};

func void Org_825_Organisator_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//						PERM
// **************************************************

instance Org_825_Organisator_PERM(C_INFO)
{
	npc = Org_825_Organisator;
	nr = 1;
	condition = Org_825_Organisator_PERM_Condition;
	information = Org_825_Organisator_PERM_Info;
	permanent = 1;
//	description = "What are you guarding?";
//	description = "Was bewacht ihr hier?";
	description = "Co tady střežíte?";
};                       

func int Org_825_Organisator_PERM_Condition()
{
	return 1;
};

func void Org_825_Organisator_PERM_Info()
{
//	AI_Output(other,self,"Org_825_Organisator_PERM_15_00"); //What are you guarding?
//	AI_Output(other,self,"Org_825_Organisator_PERM_15_00"); //Was bewacht ihr hier?
	AI_Output(other,self,"Org_825_Organisator_PERM_15_00"); //Co tady střežíte?
//	AI_Output(self,other,"Org_825_Organisator_PERM_07_01"); //We make sure none of Lee's or Gomez' people come too close to Lares.
//	AI_Output(self,other,"Org_825_Organisator_PERM_07_01"); //Wir passen auf, dass keiner von Lees oder Gomez' Leuten Lares zu nahe kommt.
	AI_Output(self,other,"Org_825_Organisator_PERM_07_01"); //Dáváme pozor, aby se Leeovi ani Gomezovi lidi nedostali příliš blízko k Laresovi.
	AI_StopProcessInfos(self);
};
