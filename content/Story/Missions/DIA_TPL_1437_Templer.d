// ************************ EXIT **************************

instance Tpl_1437_Templer_Exit(C_INFO)
{
	npc = Tpl_1437_Templer;
	nr = 999;
	condition = Tpl_1437_Templer_Exit_Condition;
	information = Tpl_1437_Templer_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Tpl_1437_Templer_Exit_Condition()
{
	return 1;
};

func void Tpl_1437_Templer_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ***************************** BESSER NICHT ANSPRECHEN ****************************************//

instance Tpl_1437_Templer_NERV(C_INFO)
{
	npc = Tpl_1437_Templer;
	condition = Tpl_1437_Templer_NERV_Condition;
	information = Tpl_1437_Templer_NERV_Info;
	important = 0;
	permanent = 1;
//	description = "What's up?";
//	description = "Was liegt an?";
	description = "Co se děje?";
};

func int Tpl_1437_Templer_NERV_Condition()
{
	return 1;
};

func void Tpl_1437_Templer_NERV_Info()
{
//	AI_Output(other,self,"Tpl_1437_Templer_NERV_Info_15_01"); //What's up?
//	AI_Output(other,self,"Tpl_1437_Templer_NERV_Info_15_01"); //Was liegt an?
	AI_Output(other,self,"Tpl_1437_Templer_NERV_Info_15_01"); //Co se děje?
//	AI_Output(self,other,"Tpl_1437_Templer_NERV_Info_13_02"); //Listen, do you really need to accost everybody here?
//	AI_Output(self,other,"Tpl_1437_Templer_NERV_Info_13_02"); //Hör mal, musst du eigentlich jeden anquatschen, der hier rumläuft?
	AI_Output(self,other,"Tpl_1437_Templer_NERV_Info_13_02"); //Poslouchej, opravdu tady musíš každého otravovat?
	AI_StopProcessInfos(self);
};

// ERNEUTES ANSPRECHEN ------------------------------------

instance Tpl_1437_Templer_LEAVE(C_INFO)
{
	npc = Tpl_1437_Templer;
	condition = Tpl_1437_Templer_LEAVE_Condition;
	information = Tpl_1437_Templer_LEAVE_Info;
	important = 0;
	permanent = 0;
//	description = "Everything alright?";
//	description = "Alles klar bei dir?";
	description = "Všechno v pořádku?";
};

func int Tpl_1437_Templer_LEAVE_Condition()
{
	if (Npc_KnowsInfo(hero,Tpl_1437_Templer_NERV))
	{
		return 1;
	};

	return 0;
};

func void Tpl_1437_Templer_LEAVE_Info()
{
//	AI_Output(other,self,"Tpl_1437_Templer_LEAVE_Info_15_01"); //Everything alright?
//	AI_Output(other,self,"Tpl_1437_Templer_LEAVE_Info_15_01"); //Alles klar bei dir?
	AI_Output(other,self,"Tpl_1437_Templer_LEAVE_Info_15_01"); //Všechno v pořádku?
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVE_Info_13_02"); //I want my peace, got it? So just clear off and do something else - anything!
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVE_Info_13_02"); //Ich will meine Ruhe haben, verstanden? Also geh einfach weg und mach irgendwas, irgendwas anderes!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVE_Info_13_02"); //Chci svůj klid, jasný? Tak se kliď a dělej něco... něco jiného! #NEEDS_ATTENTION
	AI_StopProcessInfos(self);
};

// ERNEUTES ANSPRECHEN ------------------------------------

instance Tpl_1437_Templer_LEAVENOW(C_INFO)
{
	npc = Tpl_1437_Templer;
	condition = Tpl_1437_Templer_LEAVENOW_Condition;
	information = Tpl_1437_Templer_LEAVENOW_Info;
	important = 0;
	permanent = 0;
//	description = "No, I just don't understand you!";
//	description = "Nein, ich verstehe dich einfach nicht!";
	description = "Ne, nerozumím ti!";
};

func int Tpl_1437_Templer_LEAVENOW_Condition()
{
	if (Npc_KnowsInfo(hero,Tpl_1437_Templer_LEAVE))
	{
		return 1;
	};

	return 0;
};

func void Tpl_1437_Templer_LEAVENOW_Info()
{
//	AI_Output(other,self,"Tpl_1437_Templer_LEAVENOW_Info_15_01"); //No, I just don't understand you!
//	AI_Output(other,self,"Tpl_1437_Templer_LEAVENOW_Info_15_01"); //Nein, ich verstehe dich einfach nicht!
	AI_Output(other,self,"Tpl_1437_Templer_LEAVENOW_Info_15_01"); //Ne, nerozumím ti!
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_02"); //Well then, I'll try to make it clear to you.
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_02"); //Na gut dann will ich es dir mal deutlich machen.
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_02"); //Dobrá, pokusím se ti to teda vysvětlit.
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_03"); //Scram!
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_03"); //Verschwinde!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_03"); //Vypadni!
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_04"); //Leave this mine!
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_04"); //Verlass diese Mine!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_04"); //Odejdi z dolu!
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_05"); //NEVER address me again!
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_05"); //Sprich mich NIE wieder an!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_05"); //NIKDY už na mě nemluv!
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_06"); //Clear off! Leave me alone!
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_06"); //Hau ab! lass mich in Ruhe!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_06"); //Vypadni! Nech mě být!
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_07"); //GET LOST!!
//	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_07"); //VERPISS DICH !!!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_07"); //ZTRAŤ SE!!
	AI_StopProcessInfos(self);
};
