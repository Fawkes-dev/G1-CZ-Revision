//***************************************************************************
//	Info EXIT
//***************************************************************************
instance Info_Pacho_EXIT(C_INFO)
{
	npc = Grd_224_Pacho;
	nr = 999;
	condition = Info_Pacho_EXIT_Condition;
	information = Info_Pacho_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Pacho_EXIT_Condition()
{
	return 1;
};

func void Info_Pacho_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//## KAPITEL 1
//##
//##
//#####################################################################
//---------------------------------------------------------------------
//	Info STOP
//---------------------------------------------------------------------
instance Info_Pacho_STOP(C_INFO)
{
	npc = Grd_224_Pacho;
	condition = Info_Pacho_STOP_Condition;
	information = Info_Pacho_STOP_Info;
	important = 1;
	permanent = 0;
};

func int Info_Pacho_STOP_Condition()
{
	return 1;
};

func void Info_Pacho_STOP_Info()
{
//	AI_Output(self,hero,"Info_Pacho_STOP_13_01"); //Hey, you!
//	AI_Output(self,hero,"Info_Pacho_STOP_13_01"); //Hey, du!
	AI_Output(self,hero,"Info_Pacho_STOP_13_01"); //Hej, ty!
//	AI_Output(hero,self,"Info_Pacho_STOP_15_02"); //Who? Me?
//	AI_Output(hero,self,"Info_Pacho_STOP_15_02"); //Wer? Ich?
	AI_Output(hero,self,"Info_Pacho_STOP_15_02"); //Kdo? Já?
//	AI_Output(self,hero,"Info_Pacho_STOP_13_03"); //No, your grandmother... Who else could I mean?!
//	AI_Output(self,hero,"Info_Pacho_STOP_13_03"); //Nein, ich mein deine Großmutter ... Natürlich mein ich dich!
	AI_Output(self,hero,"Info_Pacho_STOP_13_03"); //Ne, tvoje bába... Kdo jiný asi?!
//	AI_Output(self,hero,"Info_Pacho_STOP_13_04"); //I wouldn't go down that way if I were you!
//	AI_Output(self,hero,"Info_Pacho_STOP_13_04"); //Wenn ich du wäre, dann würde ich diesen Weg hier nicht weitergehen!
	AI_Output(self,hero,"Info_Pacho_STOP_13_04"); //Být tebou, tak bych tudy nechodil!
//	AI_Output(hero,self,"Info_Pacho_STOP_15_05"); //Why not?
//	AI_Output(hero,self,"Info_Pacho_STOP_15_05"); //Warum nicht?
	AI_Output(hero,self,"Info_Pacho_STOP_15_05"); //Proč ne?
//	AI_Output(self,hero,"Info_Pacho_STOP_13_06"); //You can't have been here long!
//	AI_Output(self,hero,"Info_Pacho_STOP_13_06"); //Du scheinst wirklich neu hier zu sein!
	AI_Output(self,hero,"Info_Pacho_STOP_13_06"); //Ty tady asi nejsi ještě dlouho!
//	AI_Output(self,hero,"Info_Pacho_STOP_13_07"); //Man, that's the way to the Orc land...
//	AI_Output(self,hero,"Info_Pacho_STOP_13_07"); //Mann, hier geht es ins Orkgebiet!
	AI_Output(self,hero,"Info_Pacho_STOP_13_07"); //Člověče, to je cesta do země skřetů...
//	AI_Output(self,hero,"Info_Pacho_STOP_13_08"); //They'll make mincemeat out of you!
//	AI_Output(self,hero,"Info_Pacho_STOP_13_08"); //Die machen Kleinholz aus dir!
	AI_Output(self,hero,"Info_Pacho_STOP_13_08"); //Rozsekají tě na třísky!
//	AI_Output(hero,self,"Info_Pacho_STOP_15_09"); //Oh.
//	AI_Output(hero,self,"Info_Pacho_STOP_15_09"); //Oh.
	AI_Output(hero,self,"Info_Pacho_STOP_15_09"); //Ou.
//	AI_Output(self,hero,"Info_Pacho_STOP_13_10"); //You're welcome!
//	AI_Output(self,hero,"Info_Pacho_STOP_13_10"); //Gern geschehen!
	AI_Output(self,hero,"Info_Pacho_STOP_13_10"); //Nemáš zač!

	AI_StopProcessInfos(self);
};
