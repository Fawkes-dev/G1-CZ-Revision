// *********************** PRIESTER 3 ***********************

instance Info_HighPriest3(C_INFO)
{
	npc = ORC_Priest_3;
	nr = 1;
	condition = Info_HighPriest3_Condition;
	information = Info_HighPriest3_Info;
	important = 1;
};

func int Info_HighPriest3_Condition()
{
	return 1;
};

func void Info_HighPriest3_Info()
{
	B_SelectWeapon (self,other);
	AI_SetWalkmode(self,NPC_WALK);
	AI_GotoNpc(self,other);

//	AI_Output(self,other,"Info_HighPriest3_17_01"); //MOOORTAAAAL!!!!!
//	AI_Output(self,other,"Info_HighPriest3_17_01"); //STEEEEERBLICHEEEEER!!!!!
	AI_Output(self,other,"Info_HighPriest3_17_01"); //SMMRRRTEEELLNNÍÍÍÍKKŮŮŮŮŮ!
//	AI_Output(self,other,"Info_HighPriest3_17_02"); //YOOOOOOUR TRAAAVELS EEEND HEEERE WIITH MEEEEEEE!!
//	AI_Output(self,other,"Info_HighPriest3_17_02"); //DEINEEEEEE REISEEEEE EEEENDET HIIEEER BEI MIIIIR!!
	AI_Output(self,other,"Info_HighPriest3_17_02"); //TVÁÁÁÁ CEESTAAA KOONČÍÍÍ TAADYYY UU MĚĚĚ!!
//	AI_Output(other,self,"Info_HighPriest3_15_03"); //I'll send you traveling first, you moldy maggot's idea of paradise!
//	AI_Output(other,self,"Info_HighPriest3_15_03"); //Erst mal schicke ich dich auf eine neue Reise, verfaultes Madenparadies!
	AI_Output(other,self,"Info_HighPriest3_15_03"); //Nejdřív pošlu na cestu já tebe, ty zatuchlá utkvělá představo ráje!

//	B_LogEntry(CH4_EnterTemple,"Varrag-Unhilqt, one of the five Orc shamans of the Sleeper, is right in front of me. Only one of us will leave this chamber alive!");
//	B_LogEntry(CH4_EnterTemple,"Varrag-Unhilqt, einer der fünf Ork-Schamanen des Schläfers, steht vor mir. Nur einer von uns wird diese Kammer verlassen!");
	B_LogEntry(CH4_EnterTemple,"Varrag-Unhilqt, jeden z pěti Spáčových šamanů, stojí přede mnou. Jen jeden z nás vyjde z této komnaty živý!");

	AI_StopProcessInfos(self);

	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

