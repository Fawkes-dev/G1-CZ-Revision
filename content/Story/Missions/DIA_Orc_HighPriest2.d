// *********************** PRIESTER 2 ***********************

instance Info_HighPriest2(C_INFO)
{
	npc = ORC_Priest_2;
	nr = 1;
	condition = Info_HighPriest2_Condition;
	information = Info_HighPriest2_Info;
	permanent = 0;
	important = 1;
};

func int Info_HighPriest2_Condition()
{
	return TRUE;
};

func void Info_HighPriest2_Info()
{
	B_SelectWeapon (self,other);
	AI_SetWalkmode(self,NPC_WALK);
	AI_GotoNpc(self,other);

//	AI_Output(self,other,"Info_HighPriest2_17_01"); //AN INFIDEL IN THE HOUSE OF THE MASTER!!!!
//	AI_Output(self,other,"Info_HighPriest2_17_01"); //EIN UNGLÄUBIGEEEEER IM HORT DES MEEEISTERS!!!!
	AI_Output(self,other,"Info_HighPriest2_17_01"); //NEVĚREC V CHRÁMU PÁNĚ!!!!
//	AI_Output(self,other,"Info_HighPriest2_17_02"); //DAMNED BE YOOUUUU!
//	AI_Output(self,other,"Info_HighPriest2_17_02"); //VERDAMMMMMMMNIS ÜBER DIIIICH!
	AI_Output(self,other,"Info_HighPriest2_17_02"); //BUĎ PROKLAAAAT!
//	AI_Output(other,self,"Info_HighPriest2_15_03"); //YOU be damned, you stinking moldy carpet!
//	AI_Output(other,self,"Info_HighPriest2_15_03"); //Verdammt sein wirst DU, stinkender Moderteppich!
	AI_Output(other,self,"Info_HighPriest2_15_03"); //TY buď proklat, ty plesnivá páchnoucí onuce!

//	B_LogEntry(CH4_EnterTemple,"Varrag-Kasorg, another one of the five Orc shamans, will now end his sad existence down at my feet!");
//	B_LogEntry(CH4_EnterTemple,"Varrag-Kasorg, ein weiterer der fünf Ork-Schamanen, wird nun seine erbärmliche Existenz mir zu Füßen beenden!");
	B_LogEntry(CH4_EnterTemple,"Varrag-Kasorg, další z pěti skřetích šamanů, teď končí svoji bídnou existenci u mých nohou!");

	AI_StopProcessInfos(self);

	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};
