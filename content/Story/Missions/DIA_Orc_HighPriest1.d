// *********************** PRIESTER 1 ***********************

instance Info_HighPriest1(C_INFO)
{
	npc = ORC_Priest_1;
	nr = 1;
	condition = Info_HighPriest1_Condition;
	information = Info_HighPriest1_Info;
	permanent = 0;
	important = 1;
};

func int Info_HighPriest1_Condition()
{
	return TRUE;
};

func void Info_HighPriest1_Info()
{
	B_SelectWeapon (self,other);
	AI_SetWalkmode(self,NPC_WALK);
	AI_GotoNpc(self,other);

//	AI_Output(self,other,"Info_HighPriest1_17_01"); //MOOOOOOORTAAAL!
//	AI_Output(self,other,"Info_HighPriest1_17_01"); //STEEERBLICHEEERRRR!!!!
	AI_Output(self,other,"Info_HighPriest1_17_01"); //SMMRRRTEEELLNNÍÍÍÍKKŮŮŮŮŮ!
//	AI_Output(self,other,"Info_HighPriest1_17_02"); //YOU DAAARE TO DISTURB MY PEEEAACE!
//	AI_Output(self,other,"Info_HighPriest1_17_02"); //DU WAAAGST ES, MEINE RUUHHE ZU STÖÖÖREN!
	AI_Output(self,other,"Info_HighPriest1_17_02"); //JAK SE OOPOOVAAŽUUJEEŠŠ RUUŠŠIIIT MŮŮŮJJ KLIIIIID?
//	AI_Output(self,other,"Info_HighPriest1_17_03"); //PREEPAAARE FOR THE EEEND!
//	AI_Output(self,other,"Info_HighPriest1_17_03"); //BEREEEITE DIIICH AUF DAS EEEENDE VOOOR!
	AI_Output(self,other,"Info_HighPriest1_17_03"); //PŘIIIPRAAAV SEE NAAA KOONEEC!
//	AI_Output(other,self,"Info_HighPriest1_15_04"); //It remains to be seen whose end it's going to be, you worm-bitten meatloaf!
//	AI_Output(other,self,"Info_HighPriest1_15_04"); //Fragt sich, nur wessen Ende, du wurmzerfressener Fleischklops!
	AI_Output(other,self,"Info_HighPriest1_15_04"); //Otázka je, čí konec nadchází, ty červem okousaná hroudo masa!

//	B_LogEntry(CH4_EnterTemple,"I'm facing Varrag-Hashor, one of the five Orc shamans, who brought the Sleeper to this world. I'll put an end to his undead existence.");
//	B_LogEntry(CH4_EnterTemple,"Varrag-Hashor, einer der fünf Ork-Schamanen, die damals den Schläfer auf diese Welt geholt haben, steht mir gegenüber. Ich werde sein untotes Dasein ein für allemal beenden.");
	B_LogEntry(CH4_EnterTemple,"Stojím tváří v tvář Varrag-Hashorovi, jednomu z pěti skřetích šamanů, kteří do tohoto světa vnesli Spáče. Skončím jeho nemrtvou existenci.");

	AI_StopProcessInfos(self);

	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

