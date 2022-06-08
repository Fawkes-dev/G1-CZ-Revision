// **************************************
//					EXIT
// **************************************

instance DIA_GRD_245_Exit(C_INFO)
{
	npc = GRD_245_Gardist;
	nr = 999;
	condition = DIA_GRD_245_Exit_Condition;
	information = DIA_GRD_245_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_GRD_245_Exit_Condition()
{
	return 1;
};

func void DIA_GRD_245_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************
//				PERM
// **************************************

instance DIA_GRD_245_Hello(C_INFO)
{
	npc = GRD_245_Gardist;
	nr = 1;
	condition = DIA_GRD_245_Hello_Condition;
	information = DIA_GRD_245_Hello_Info;
	important = 0;
	permanent = 1;
//	description = "What's in this house?";
//	description = "Was ist in diesem Haus?";
	description = "Co je v tom domě?";
};

func int DIA_GRD_245_Hello_Condition()
{
	return 1;
};

func void DIA_GRD_245_Hello_Info()
{
//	AI_Output(other,self,"DIA_GRD_245_Hello_15_00"); //What's in this house?
//	AI_Output(other,self,"DIA_GRD_245_Hello_15_00"); //Was ist in diesem Haus?
	AI_Output(other, self, "DIA_GRD_245_Hello_15_00"); //Co je v tom domě?
//	AI_Output(self,other,"DIA_GRD_245_Hello_13_01"); //That's the Ore Barons' house. You'd better behave yourself if you go in there!
//	AI_Output(self,other,"DIA_GRD_245_Hello_13_01"); //Das ist das Haus der Erzbarone. Also wenn du hier reingehst, benimm dich!
	AI_Output(self, other, "DIA_GRD_245_Hello_13_01"); //To je dům Rudobaronů. Pokud chceš jít dál, měl by ses lépe chovat!
};
