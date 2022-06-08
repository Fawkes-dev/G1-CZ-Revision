// ********************************
// 				EXIT
// ********************************

instance DIA_Gilbert_EXIT(C_INFO)
{
	npc = Non_1500_Gilbert;
	nr = 999;
	condition = DIA_Gilbert_EXIT_Condition;
	information = DIA_Gilbert_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

func void DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Gilbert_First(C_INFO)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_First_Condition;
	information = DIA_Gilbert_First_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Gilbert_First_Condition()
{
	if (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	{
		return 1;
	};

	return 0;
};

func void DIA_Gilbert_First_Info()
{
//	AI_Output(self,other,"DIA_Gilbert_First_04_00"); //What are you doing here? Don't often get visitors up here, he he!
//	AI_Output(self,other,"DIA_Gilbert_First_04_00"); //Was machst du denn hier? Hab nicht oft Besuch hier oben, hehe!
	AI_Output(self, other, "DIA_Gilbert_First_04_00"); //Co tady děláš? Moc často sem návštěvníky nepouštím, hehe!
//	AI_Output(self,other,"DIA_Gilbert_First_04_01"); //Very clever of you to find my hiding place.
//	AI_Output(self,other,"DIA_Gilbert_First_04_01"); //War ne gute Leistung von dir, mein Versteck zu finden.
	AI_Output(self, other, "DIA_Gilbert_First_04_01"); //To byl šikovný kousek, najít tohle ukryté místo.

	B_GiveXP(XP_GilbertFound);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Gilbert_Hallo(C_INFO)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_Hallo_Condition;
	information = DIA_Gilbert_Hallo_Info;
	important = 0;
	permanent = 1;
//	description = "What are you doing here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};

func int DIA_Gilbert_Hallo_Condition()
{
	//TODO: this dialogue should be available only after DIA_Gilbert_First was told
	return 1;
};

func void DIA_Gilbert_Hallo_Info()
{
//	AI_Output(other,self,"DIA_Gilbert_Hallo_15_00"); //What are you doing here?
//	AI_Output(other,self,"DIA_Gilbert_Hallo_15_00"); //Was machst du hier?
	AI_Output(other, self, "DIA_Gilbert_Hallo_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01"); //Oh, I'm fed up with the Old Camp. I had trouble with Gomez' folks. That was some time ago.
//	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01"); //Ich hatte die Schnauze voll vom alten Lager. Hatte Ärger mit Gomez Leuten. Ist aber schon ne Weile her.
	AI_Output(self, other, "DIA_Gilbert_Hallo_04_01"); //Už mám dost Starého tábora. Měl jsem problém s Gomezovými lidmi. Už je to delší dobu.
//	AI_Output(self,other,"DIA_Gilbert_Hallo_04_02"); //I guess nobody remembers that now. But I'm staying here. There's too many blockheads running about in the Old Camp for my liking.
//	AI_Output(self,other,"DIA_Gilbert_Hallo_04_02"); //Schätze, jetzt kräht kein Hahn mehr danach. Aber ich bleibe hier. Im alten Lager rennen mir zu viele Schwachköpfe rum.
	AI_Output(self, other, "DIA_Gilbert_Hallo_04_02"); //Myslím, že už si to nikdo nepamatuje. Já tady ale zůstávám. Po Starém táboře se motají spousty zabedněnců.
};
