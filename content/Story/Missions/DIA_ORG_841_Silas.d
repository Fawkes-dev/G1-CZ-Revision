// ************************************************************
// 			  				   EXIT
// ************************************************************

instance DIA_Silas_EXIT(C_Info)
{
	npc = Org_841_Silas;
	nr = 999;
	condition = DIA_Silas_EXIT_Condition;
	information = DIA_Silas_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Silas_EXIT_Condition()
{
	return 1;
};

func void DIA_Silas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Trade
// ************************************************************

instance DIA_Silas_Hehler(C_Info)
{
	npc = Org_841_Silas;
	nr = 1;
	condition = DIA_Silas_Hehler_Condition;
	information = DIA_Silas_Hehler_Info;
	important = 0;
	permanent = 0;
//	description = "How are things?";
//	description = "Wie läuft's denn so?";
	description = "Jak to jde?";
};

func int DIA_Silas_Hehler_Condition()
{
	return 1;
};

func void DIA_Silas_Hehler_Info()
{
//	AI_Output(other,self,"DIA_Silas_Hehler_15_00"); //How are things?
//	AI_Output(other,self,"DIA_Silas_Hehler_15_00"); //Wie läuft's denn so?
	AI_Output(other,self,"DIA_Silas_Hehler_15_00"); //Jak to jde?
//	AI_Output(self,other,"DIA_Silas_Hehler_06_01"); //Great! We trade our home-made rice schnapps for ore.
//	AI_Output(self,other,"DIA_Silas_Hehler_06_01"); //Gut! Wir verkaufen hier unseren selbstgebrannten Reisschnaps für gutes Erz.
	AI_Output(self,other,"DIA_Silas_Hehler_06_01"); //Dobře! Obchodujeme pálenkou z naší domácí rýže a měníme ji za rudu.
//	AI_Output(self,other,"DIA_Silas_Hehler_06_02"); //Well, the boys carry in enough ore. Where should they spend it if not here?
//	AI_Output(self,other,"DIA_Silas_Hehler_06_02"); //Kommt ja auch genug rein.  Wo sollen die Jungs ihr Erz auch sonst hinbringen?
	AI_Output(self,other,"DIA_Silas_Hehler_06_02"); //Dobrá, ti hoši přinesli dost rudy. Kde je utratí, když ne tady?
};

// ************************************************************
// 						Trade
// ************************************************************

instance DIA_Silas_Trade(C_Info)
{
	npc = Org_841_Silas;
	nr = 1;
	condition = DIA_Silas_Trade_Condition;
	information = DIA_Silas_Trade_Info;
	important = 0;
	permanent = 0;
	trade = 1;
//	description = "I want a drink.";
//	description = "Ich will was trinken.";
	description = "Chci se napít.";
};

func int DIA_Silas_Trade_Condition()
{
	return 1;
};

func void DIA_Silas_Trade_Info()
{
//	AI_Output(other,self,"DIA_Silas_Trade_15_00"); //I want a drink.
//	AI_Output(other,self,"DIA_Silas_Trade_15_00"); //Ich will was trinken.
	AI_Output(other,self,"DIA_Silas_Trade_15_00"); //Chci se napít.
//	AI_Output(self,other,"DIA_Silas_Trade_06_01"); //You'll have to pay for it.
//	AI_Output(self,other,"DIA_Silas_Trade_06_01"); //Dann musst du zahlen.
	AI_Output(self,other,"DIA_Silas_Trade_06_01"); //Budeš za to muset zaplatit.
};
