//***************************************************************************
// Info EXIT
//***************************************************************************
instance Info_GornFM_EXIT(C_INFO)
{
	npc = PC_FighterFM;
	nr   = 999;
	condition = Info_GornFM_EXIT_Condition;
	information = Info_GornFM_EXIT_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Info_GornFM_EXIT_Condition()
{
	return 1;
};

func void Info_GornFM_EXIT_Info()
{
	if self.aivar[AIV_PARTYMEMBER]
	{
//		AI_Output(self,other,"Info_GornFM_EXIT_09_01"); //Let's fight!
//		AI_Output(self,other,"Info_GornFM_EXIT_09_01"); //Auf in den Kampf!
		AI_Output(self,other,"Info_GornFM_EXIT_09_01"); //Do boje!
	}
	else
	{
//		AI_Output(self,other,"Info_GornFM_EXIT_09_02"); //See you later.
//		AI_Output(self,other,"Info_GornFM_EXIT_09_02"); //Bis später.
		AI_Output(self,other,"Info_GornFM_EXIT_09_02"); //Ještě se uvidíme.
	};

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
// Info WAIT
//---------------------------------------------------------------------
instance Info_GornFM_WAIT(C_INFO)
{
	npc = PC_FighterFM;
	condition = Info_GornFM_WAIT_Condition;
	information = Info_GornFM_WAIT_Info;
	important = 0; 
	permanent = 1;
//	description = "Hold the position, I'll check the situation!";
//	description = "Halt die Stellung, ich werde erst mal die Lage prüfen!";
	description = "Hlídej tuhle pozici, já obhlédnu situaci!";
};                       

func int Info_GornFM_WAIT_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void Info_GornFM_WAIT_Info()
{
//	AI_Output(hero,self,"Info_GornFM_WAIT_15_01"); //Hold the position, I'll check the situation!
//	AI_Output(hero,self,"Info_GornFM_WAIT_15_01"); //Halt die Stellung, ich werde erst mal die Lage prüfen!
	AI_Output(hero,self,"Info_GornFM_WAIT_15_01"); //Hlídej tuhle pozici, já obhlédnu situaci!
//	AI_Output(self,hero,"Info_GornFM_WAIT_09_02"); //Alright. I'll wait at the entrance to the mine and make sure nobody tries anything.
//	AI_Output(self,hero,"Info_GornFM_WAIT_09_02"); //Ist gut. Ich warte am Mineneingang und sorge dafür, dass dir niemand in den Rücken fällt!
	AI_Output(self,hero,"Info_GornFM_WAIT_09_02"); //Dobře. Počkám u vchodu do dolu a ty dohlídni, aby se nikdo o nic nepokusil.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"wait");
};

//---------------------------------------------------------------------
// Info FOLLOW
//---------------------------------------------------------------------
instance Info_GornFM_FOLLOW(C_INFO)
{
	npc = PC_FighterFM;
	condition = Info_GornFM_FOLLOW_Condition;
	information = Info_GornFM_FOLLOW_Info;
	important = 0; 
	permanent = 1;
//	description = "Come on, I need your help.";
//	description = "Komm mit, ich brauche deine Unterstützung!";
	description = "Pojď, potřebuji tvou pomoc.";
};                       

func int Info_GornFM_FOLLOW_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void Info_GornFM_FOLLOW_Info()
{
//	AI_Output(hero,self,"Info_GornFM_FOLLOW_15_01"); //Come on, I need your help.
//	AI_Output(hero,self,"Info_GornFM_FOLLOW_15_01"); //Komm mit, ich brauche deine Unterstützung!
	AI_Output(hero,self,"Info_GornFM_FOLLOW_15_01"); //Pojď, potřebuji tvou pomoc.
//	AI_Output(self,hero,"Info_GornFM_FOLLOW_09_02"); //At last we're moving on! You go first, I'll follow.
//	AI_Output(self,hero,"Info_GornFM_FOLLOW_09_02"); //Endlich geht es weiter! Geh voraus, ich folge dir!
	AI_Output(self,hero,"Info_GornFM_FOLLOW_09_02"); //Konečně se pohneme! Jdi první, já půjdu za tebou!

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"follow");
};

