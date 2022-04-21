// ************************ EXIT **************************

instance Tpl_1436_Templer_Exit(C_INFO)
{
	npc = Tpl_1436_Templer;
	nr = 999;
	condition = Tpl_1436_Templer_Exit_Condition;
	information = Tpl_1436_Templer_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Tpl_1436_Templer_Exit_Condition()
{
	return TRUE;
};

func void Tpl_1436_Templer_Exit_Info()
{
	AI_StopProcessInfos(self);
};
// ***************************** INFOS ****************************************//

instance Tpl_1436_Templer_CRAWLER(C_INFO)
{
	npc = Tpl_1436_Templer;
	condition = Tpl_1436_Templer_CRAWLER_Condition;
	information = Tpl_1436_Templer_CRAWLER_Info;
	important = 0;
	permanent = 1;
//	description = "What's up?";
//	description = "Was liegt an?";
	description = "Co se děje?";
};

func int Tpl_1436_Templer_CRAWLER_Condition()
{
	return TRUE;
};

func void Tpl_1436_Templer_CRAWLER_Info()
{
//	AI_Output(other,self,"Tpl_1436_Templer_CRAWLER_Info_15_01"); //What's up?
//	AI_Output(other,self,"Tpl_1436_Templer_CRAWLER_Info_15_01"); //Was liegt an?
	AI_Output(other,self,"Tpl_1436_Templer_CRAWLER_Info_15_01"); //Co se děje?
//	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_02"); //We're here to hunt the crawlers. The side effect of protecting the diggers is quite popular as well.
//	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_02"); //Wir sind hier, um die Crawler zu jagen. Das wir damit gleichzeitig die Buddler beschützen, kann allen Beteiligten ja nur Recht sein.
	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_02"); //Lovíme tady důlní červy. To, že přitom chráníme kopáče, může všem přítomným jen vyhovovat.
//	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_03"); //What we really want is the secretion of the crawlers, though. Our Guru Cor Kalom brews magic potions from the secretion of the minecrawlers' mandibles.
//	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_03"); //Was wir aber wirklich wollen, ist das Sekret der Crawler. Aus dem Sekret der Minecrawler-Zangen braut unser Guru Cor Kalom magische Tränke.
	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_03"); //To, co opravdu chceme, je výměšek z čelistí důlních červů. Náš Guru Cor Kalom připravuje z výměšku magické lektvary.
};

