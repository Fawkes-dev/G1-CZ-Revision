// ************************************************************
// 								EXIT
// ************************************************************

instance Info_GRD_276_Exit(C_INFO)
{
	npc = GRD_276_Brueckenwache;
	nr = 999;
	condition = Info_GRD_276_Exit_Condition;
	information = Info_GRD_276_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_GRD_276_Exit_Condition()
{
	return 1;
};

func void Info_GRD_276_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// *****************************************************************
// 								Hi
// *****************************************************************

instance Info_GRD_276_Tips(C_INFO)
{
	npc = GRD_276_Brueckenwache;
	nr = 1;
	condition = Info_GRD_276_Tips_Condition;
	information = Info_GRD_276_Tips_Info;
	permanent = 0;
//	description = "Hi! I'm new here.";
//	description = "Hi! Ich bin neu hier.";
	description = "Zdar! Jsem tady nový.";
};

func int Info_GRD_276_Tips_Condition()
{
	if (Kapitel <= 2)
	{
		return 1;
	};
};
func void Info_GRD_276_Tips_Info()
{
//	AI_Output(other,self,"Info_GRD_276_Tips_15_00"); //Hi! I'm new here.
//	AI_Output(other,self,"Info_GRD_276_Tips_15_00"); //Hi! Ich bin neu hier.
	AI_Output(other,self,"Info_GRD_276_Tips_15_00"); //Zdar! Jsem tady novej!
//	AI_Output(self,other,"Info_GRD_276_Tips_07_01"); //How nice for you.
//	AI_Output(self,other,"Info_GRD_276_Tips_07_01"); //Schön für dich.
	AI_Output(self,other,"Info_GRD_276_Tips_07_01"); //To se teda máš!
};

// *****************************************************************
// 								Tips
// *****************************************************************

instance Info_GRD_276_Bla(C_INFO)
{
	npc = GRD_276_Brueckenwache;
	nr = 2;
	condition = Info_GRD_276_Bla_Condition;
	information = Info_GRD_276_Bla_Info;
	//#Needs_Attention zbytocny permanent dialog - to by som zrusil
	permanent = 1;
//	description = "Is that the Old Camp over there?";
//	description = "Ist das da hinten das Alte Lager?";
	description = "Je támhleto Starý tábor?";
};

func int Info_GRD_276_Bla_Condition()
{
	if (Npc_KnowsInfo(hero,Info_GRD_276_Tips))
	{
		return 1;
	};
};

func void Info_GRD_276_Bla_Info()
{
//	AI_Output(other,self,"Info_GRD_276_Bla_15_00"); //Is that the Old Camp over there?
//	AI_Output(other,self,"Info_GRD_276_Bla_15_00"); //Ist das da hinten das Alte Lager?
	AI_Output(other,self,"Info_GRD_276_Bla_15_00"); //Je támhleto Starý tábor?
//	AI_Output(self,other,"Info_GRD_276_Bla_07_01"); //No, that's the New Camp. The Old Camp is underneath the bridge.
//	AI_Output(self,other,"Info_GRD_276_Bla_07_01"); //Nein, das ist das Neue Lager. Das Alte Lager liegt unter der Brücke.
	AI_Output(self,other,"Info_GRD_276_Bla_07_01"); //Ne, to je Nový tábor. Starý tábor je pod mostem. (ironicky)
	AI_StopProcessInfos(self);
};
