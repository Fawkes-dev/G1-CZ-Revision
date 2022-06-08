//-------------------- Intro ---------------------------

instance DIA_SLD_751_Soeldner_INTRO(C_INFO)
{
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_INTRO_CONDITION;
	information = DIA_SLD_751_Soeldner_INTRO_INFO;
	important = 1;
	permanent = 0;
};

func int DIA_SLD_751_Soeldner_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc(self, hero) < 300)
//&& (Hlp_StrCmp(Npc_GetNearestWP (self),self.wp)== 0))
	{
		return 1;
	};

	return 0;
};

func void DIA_SLD_751_Soeldner_INTRO_INFO()
{
//	AI_Output(self,other,"DIA_SLD_751_Soeldner_INTRO_INFO_01_01"); //Ah, a visitor! Don't make any trouble here or or else you'll be for it!
//	AI_Output(self,other,"DIA_SLD_751_Soeldner_INTRO_INFO_01_01"); //Ah, Besuch! Mach uns keinen Ärger, sonst bekommst du welchen!
	AI_Output(self, other, "DIA_SLD_751_Soeldner_INTRO_INFO_01_01"); //Á, návštěvník! Nedělej nám tu žádné problémy, jinak to schytáš!
};

//-------------------- Exit 1 -----------------------------

instance DIA_SLD_751_Soeldner_EXIT_1(C_INFO)
{
	npc = SLD_751_Soeldner;
	nr = 999;
	condition = DIA_SLD_751_Soeldner_EXIT_1_CONDITION;
	information = DIA_SLD_751_Soeldner_EXIT_1_INFO;
	important = 0;
	permanent = 0;
//	description = "I'd better be going.";
//	description = "Ich geh dann mal.";
	description = "Raději půjdu!";
};

func int DIA_SLD_751_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_EXIT_1_INFO()
{
//	AI_Output(other,self,"DIA_SLD_751_Soeldner_EXIT_1_INFO_15_01"); //I'd better be going.
//	AI_Output(other,self,"DIA_SLD_751_Soeldner_EXIT_1_INFO_15_01"); //Ich geh' dann mal.
	AI_Output(other, self, "DIA_SLD_751_Soeldner_EXIT_1_INFO_15_01"); //Raději půjdu!
//	AI_Output(self,other,"DIA_SLD_751_Soeldner_EXIT_1_INFO_01_02");//I hope we understand each other.
//	AI_Output(self,other,"DIA_SLD_751_Soeldner_EXIT_1_INFO_01_02");//Ich hoffe, wir verstehen uns.
	AI_Output(self, other, "DIA_SLD_751_Soeldner_EXIT_1_INFO_01_02"); //Doufám, že si rozumíme.
	AI_StopProcessInfos(self);
};

//-------------------- Exit 2 -----------------------------

instance DIA_SLD_751_Soeldner_EXIT_2(C_INFO)
{
	npc = SLD_751_Soeldner;
	nr = 999;
	condition = DIA_SLD_751_Soeldner_EXIT_2_CONDITION;
	information = DIA_SLD_751_Soeldner_EXIT_2_INFO;
	important = 0;
	permanent = 1;
//	description = "I need to go on.";
//	description = "Ich muss weiter.";
	description = "Musím jít dál.";
};

func int DIA_SLD_751_Soeldner_EXIT_2_CONDITION()
{
	if (Npc_KnowsInfo(hero, DIA_SLD_751_Soeldner_EXIT_1))
	{
		return 1;
	};

	return 0;
};

func void DIA_SLD_751_Soeldner_EXIT_2_INFO()
{
//	AI_Output(other,self,"DIA_SLD_751_Soeldner_EXIT_2_INFO_15_01"); //I need to go on.
//	AI_Output(other,self,"DIA_SLD_751_Soeldner_EXIT_2_INFO_15_01"); //Ich muss weiter.
	AI_Output(other, self, "DIA_SLD_751_Soeldner_EXIT_2_INFO_15_01"); //Musím jít dál.
//	AI_Output(self,other,"DIA_SLD_751_Soeldner_EXIT_2_INFO_01_02");//Just go then.
//	AI_Output(self,other,"DIA_SLD_751_Soeldner_EXIT_2_INFO_01_02");//Dann geh mal.
	AI_Output(self, other, "DIA_SLD_751_Soeldner_EXIT_2_INFO_01_02"); //Tak běž.
	AI_StopProcessInfos(self);
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_751_Soeldner_UMSEHEN(C_INFO)
{
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_UMSEHEN_CONDITION;
	information = DIA_SLD_751_Soeldner_UMSEHEN_INFO;
	important = 0;
	permanent = 0;
//	description = "I just want to have a look around here.";
//	description = "Ich will mich hier nur mal umsehen.";
	description = "Chci se tu jen porozhlédnout.";
};

func int DIA_SLD_751_Soeldner_UMSEHEN_CONDITION()
{
	//TODO: dialogue should be available after DIA_SLD_751_Soeldner_INTRO
	return 1;
};

func void DIA_SLD_751_Soeldner_UMSEHEN_INFO()
{
//	AI_Output(other,self,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_15_01"); //I just want to have a look around here.
//	AI_Output(other,self,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_15_01"); //Ich will mich hier nur mal umsehen.
	AI_Output(other, self, "DIA_SLD_751_Soeldner_UMSEHEN_INFO_15_01"); //Chci se tu jen porozhlédnout.
//	AI_Output(self,other,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_01_02");//Then mind you don't step on anybody's feet.
//	AI_Output(self,other,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_01_02");//Dann pass auf, dass du niemanden auf die Füße trittst.
	AI_Output(self, other, "DIA_SLD_751_Soeldner_UMSEHEN_INFO_01_02"); //Pak dávej pozor, abys nikomu nešlápl na nohu.
};

//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_751_Soeldner_INMINE(C_INFO)
{
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_INMINE_CONDITION;
	information = DIA_SLD_751_Soeldner_INMINE_INFO;
	important = 0;
	permanent = 0;
//	description = "I want to go into the mine.";
//	description = "Ich will in die Mine.";
	description = "Chci jít do dolu.";
};

func int DIA_SLD_751_Soeldner_INMINE_CONDITION()
{
	//TODO: dialogue should be available after DIA_SLD_751_Soeldner_INTRO
	return 1;
};

func void DIA_SLD_751_Soeldner_INMINE_INFO()
{
//	AI_Output(other,self,"DIA_SLD_751_Soeldner_INMINE_INFO_15_01"); //I want to go into the mine.
//	AI_Output(other,self,"DIA_SLD_751_Soeldner_INMINE_INFO_15_01"); //Ich will in die Mine.
	AI_Output(other, self, "DIA_SLD_751_Soeldner_INMINE_INFO_15_01"); //Chci jít do dolu.
//	AI_Output(self,other,"DIA_SLD_751_Soeldner_INMINE_INFO_01_02");//I can hardly believe you'll manage that. But just speak to Okyl.
//	AI_Output(self,other,"DIA_SLD_751_Soeldner_INMINE_INFO_01_02");//Ich glaube kaum, dass dir dass gelingen wird. Aber sprich mal mit Okyl.
	AI_Output(self, other, "DIA_SLD_751_Soeldner_INMINE_INFO_01_02"); //Nevěřím, že se ti to povede, ale promluv si s Okylem.
};
