// **************************************************
//						EXIT 
// **************************************************

instance DIA_Ghorim_Exit(C_INFO)
{
	npc = Nov_1310_Ghorim;
	nr = 999;
	condition = DIA_Ghorim_Exit_Condition;
	information = DIA_Ghorim_Exit_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Ghorim_Exit_Condition()
{
	return 1;
};

func void DIA_Ghorim_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ghorim_MissingHarlok(C_INFO)
{
	npc = Nov_1310_Ghorim;
	nr = 1;
	condition = DIA_Ghorim_MissingHarlok_Condition;
	information = DIA_Ghorim_MissingHarlok_Info;
	permanent = 0;
//	description = "Hi! How's it going?";
//	description = "Hi! Wie sieht's aus?";
	description = "Jak to jde?";
};                       

func int DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

func void DIA_Ghorim_MissingHarlok_Info()
{
//	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00"); //Hi! How's it going?
//	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00"); //Hi! Wie sieht's aus?
	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00"); //Zdar! Jak to jde?
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_01"); //I'm dead on my feet, man. I've been working for two days without a single break.
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_01"); //Ich bin total fertig, Mann. Ich arbeite jetzt schon seit 2 Tagen ohne Pause.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_01"); //Padám únavou, člověče. Pracoval jsem dva dny bez přestávky.
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok should have taken over ages ago. It's always the same with that guy.
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok sollte mich längst abgelöst haben. Es ist immer dasselbe mir dem Kerl.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok mě měl během té doby vystřídat. Ale tak je to s těma chlapama pořád.
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_03"); //He's probably lying in his hut, fast asleep!
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_03"); //Er liegt bestimmt noch in seiner Hütte und pennt!
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_03"); //Nejspíš se vyvaluje ve své chatrči a spí!
//	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_04"); //Why don't you just go there and give him a right kick in the butt?
//	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_04"); //Wieso gehst du dann nicht zu ihm und trittst ihm ordentlich in den Hintern?
	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_04"); //Proč tam za ním nezajdeš a pořádně ho nekopneš do zadku?
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_05"); //Can't leave here while Baal Orun is in charge - the work has to be done either way!
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_05"); //Ich kann hier nicht weg, solange Baal Orun die Aufsicht hat - die Arbeit muss getan werden, so oder so!
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_05"); //Nemůžu odsud odejít, dokud tu hlídá Baal Orun - práce se musí za každou cenu dodělat!
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_06"); //But you could go there for me - he's staying right under Cor Kalom's alchemy lab, at Fortuno's.
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_06"); //Aber du könntest für mich zu ihm gehen - er wohnt unter dem Alchemielabor von Cor Kalom, direkt bei Fortuno.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_06"); //Ale ty bys za ním mohl kvůli mně zajít - bydlí hned pod alchymistickou dílnou Cora Kaloma, u Fortuna.
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_07"); //Tell him to get his butt over here.
//	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_07"); //Sag ihm, er soll seinen Hintern hier rüberschwingen.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_07"); //Řekni mu, ať hejbne zadkem a přijde sem.

	Log_CreateTopic(CH1_GhorimsRelief,LOG_MISSION);
	Log_SetTopicStatus(CH1_GhorimsRelief,LOG_RUNNING);
//	B_LogEntry(CH1_GhorimsRelief,"The novice Ghorim asked me to make lazy Harlok take over from him. Harlok usually hangs around at Fortuno's weed shop.");
//	B_LogEntry(CH1_GhorimsRelief,"Der Novize Ghorim bat mich, den faulen Harlok dazu zu bewegen, ihn abzulösen. Harlok treibt sich meistens bei Fortunos Kräuterladen herum.");
	B_LogEntry(CH1_GhorimsRelief,"Novic Ghorim mě požádal, abych ho zbavil zahálčivého Harloka. Harlok se obvykle potlouká kolem Fortunova drogového obchodu.");

	Ghorim_KickHarlok = LOG_RUNNING;
};

// **************************************************
//					SUCCESS
// **************************************************

instance DIA_Ghorim_SUCCESS(C_INFO)
{
	npc = Nov_1310_Ghorim;
	nr = 1;
	condition = DIA_Ghorim_SUCCESS_Condition;
	information = DIA_Ghorim_SUCCESS_Info;
	permanent = 1;
//	description = "Well? Has he taken over now?";
//	description = "Na? Endlich abgelöst worden?";
	description = "Tak? Vystřídá mě?";
};                       

func int DIA_Ghorim_SUCCESS_Condition()
{
	if (Ghorim_KickHarlok == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Ghorim_SUCCESS_Info()
{
//	AI_Output(other,self,"DIA_Ghorim_SUCCESS_15_00"); //Well? Has he taken over now?
//	AI_Output(other,self,"DIA_Ghorim_SUCCESS_15_00"); //Na? Endlich abgelöst worden?
	AI_Output(other,self,"DIA_Ghorim_SUCCESS_15_00"); //Tak? Vystřídá mě?
//	AI_Output(self,other,"DIA_Ghorim_SUCCESS_02_01"); //Yeah - finally I can get to sleep. Thanks, man!
//	AI_Output(self,other,"DIA_Ghorim_SUCCESS_02_01"); //Ja - jetzt kann ich endlich mal wieder richtig ausschlafen. Danke, Mann!
	AI_Output(self,other,"DIA_Ghorim_SUCCESS_02_01"); //Dobře - konečně se budu moci vyspat. Díky, člověče!
};

