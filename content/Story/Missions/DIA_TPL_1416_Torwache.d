// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_Tpl_1416_Torwache_Exit(C_INFO)
{
	npc = Tpl_1416_Templer;
	nr = 999;
	condition = DIA_Tpl_1416_Torwache_Exit_Condition;
	information = DIA_Tpl_1416_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Tpl_1416_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Tpl_1416_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 				Wie ist das Leben hier
// **************************************************

instance DIA_Tpl_1416_Torwache_Life(C_INFO)
{
	npc = Tpl_1416_Templer;
	nr = 1;
	condition = DIA_Tpl_1416_Torwache_Life_Condition;
	information = DIA_Tpl_1416_Torwache_Life_Info;
	permanent = 1;
//	description = "What's life like as one of the Brotherhood's guards?";
//	description = "Wie ist das Leben hier als Wächter der Bruderschaft?";
	description = "Jaký je život strážce Bratrstva?";
};

func int DIA_Tpl_1416_Torwache_Life_Condition()
{ 
	return 1;
};

func void DIA_Tpl_1416_Torwache_Life_Info()
{
//	AI_Output(other,self,"DIA_Tpl_1416_Torwache_Life_15_00"); //What's life like as one of the Brotherhood's guards?
//	AI_Output(other,self,"DIA_Tpl_1416_Torwache_Life_15_00"); //Wie ist das Leben hier als Wächter der Bruderschaft?
	AI_Output(other,self,"DIA_Tpl_1416_Torwache_Life_15_00"); //Jaký je život strážce Bratrstva?
//	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_01"); //I have an important task. The Enlightened One and his disciples rely on me.
//	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_01"); //Ich habe eine wichtige Aufgabe bekommen. Der Erleuchtete und seine Jünger verlassen sich auf mich.
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_01"); //Mám důležitý úkol. Osvícený a jeho žáci na mě spoléhají.
//	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_02"); //My previous life is a thing of the past now. From now on, I'm a GOR NA - a templar of the Sleeper.
//	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_02"); //Mein vorheriges Leben gehört der Vergangenheit an. Ab jetzt bin ich ein GOR NA - ein Templer des Schläfers.
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_02"); //Můj dřívější život už je minulost. Teď jsem GOR NA - Spáčův templář.
};
