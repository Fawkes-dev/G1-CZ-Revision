// ************************ EXIT **************************

instance GRD_261_Brandick_Exit(C_INFO)
{
	npc = GRD_261_Brandick;
	nr = 999;
	condition = GRD_261_Brandick_Exit_Condition;
	information = GRD_261_Brandick_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int GRD_261_Brandick_Exit_Condition()
{
	return 1;
};

func void GRD_261_Brandick_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ***************** Infos *****************************

instance GRD_261_Brandick_ALEPH(C_INFO)
{
	npc = GRD_261_Brandick;
	condition = GRD_261_Brandick_ALEPH_Condition;
	information = GRD_261_Brandick_ALEPH_Info;
	important = 0;
	permanent = 0;
//	description = "(complain about Aleph)";
//	description = "(Aleph anschwärzen)";
	description = "(stěžuj si na Alepha)";
};

func int GRD_261_Brandick_ALEPH_Condition()
{
	if (Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS))
	{
		return 1;
	};
};

func void GRD_261_Brandick_ALEPH_Info()
{
//	AI_Output(other,self,"GRD_261_Brandick_ALEPH_Info_15_01"); //Listen, when you're not there Aleph just sits around there all the time without doing any work.
//	AI_Output(other,self,"GRD_261_Brandick_ALEPH_Info_15_01"); //Hör mal, wenn du nicht da bist, sitzt Aleph die ganze Zeit nur rum, ohne zu arbeiten.
	AI_Output(other,self,"GRD_261_Brandick_ALEPH_Info_15_01"); //Poslyš, když tady nejsi, Aleph tu akorát celý den posedává a nehne ani prstem.
//	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_02"); //Is that true?
//	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_02"); //Ist das so?
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_02"); //Je to pravda?
//	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_03"); //Do you know what I despise even more than lazybones? Traitors. So just get lost!
//	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_03"); //Weißt du, was ich noch viel weniger leiden kann als Faulpelze? Das sind Verräter. Also geh mir aus den Augen!
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_03"); //Víš, kým opovrhuju ještě víc než línou kůží? Zrádcema! Ztrať se!

	AI_StopProcessInfos(self);
};
