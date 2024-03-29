// ************************************************************
// 			  				   EXIT
// ************************************************************

instance DIA_Sfb_1001_EXIT(C_INFO)
{
	npc = SFB_1001_Schuerfer;
	nr = 999;
	condition = DIA_Sfb_1001_EXIT_Condition;
	information = DIA_Sfb_1001_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Sfb_1001_EXIT_Condition()
{
	return 1;
};

func void DIA_Sfb_1001_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 							Hallo - PERM
// ************************************************************

instance DIA_Sfb_1001_Hello(C_INFO)
{
	npc = SFB_1001_Schuerfer;
	nr = 1;
	condition = DIA_Sfb_1001_Hello_Condition;
	information = DIA_Sfb_1001_Hello_Info;
	permanent = 1;
//	description = "Well, how's the mine going on?";
//	description = "Na, wie steht's in der Mine?";
	description = "Tak jak to jde v dole?";
};

func int DIA_Sfb_1001_Hello_Condition()
{
	return 1;
};

func void DIA_Sfb_1001_Hello_Info()
{
//	AI_Output(other,self,"DIA_Sfb_1001_Hello_15_00"); //Well, how's the mine going on?
//	AI_Output(other,self,"DIA_Sfb_1001_Hello_15_00"); //Na, wie steht's in der Mine?
	AI_Output(other,self,"DIA_Sfb_1001_Hello_15_00"); //Tak jak to jde v dolu?
//	AI_Output(self,other,"DIA_Sfb_1001_Hello_02_01"); //We've done most of it. Just a few more weeks and we'll have enough.
//	AI_Output(self,other,"DIA_Sfb_1001_Hello_02_01"); //Wir haben das Meiste hinter uns. Nur noch wenige Wochen, dann haben wir genug.
	AI_Output(self,other,"DIA_Sfb_1001_Hello_02_01"); //Už máme skoro všechno. Ještě pár týdnů a budeme mít dost.
	AI_StopProcessInfos(self);
};
