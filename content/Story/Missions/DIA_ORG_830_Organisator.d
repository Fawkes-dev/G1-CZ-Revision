// ************************************************************
// 			  				   EXIT
// ************************************************************

instance Info_ORG_830_EXIT(C_INFO)
{
	npc = ORG_830_Organisator;
	nr = 999;
	condition = Info_ORG_830_EXIT_Condition;
	information = Info_ORG_830_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_ORG_830_EXIT_Condition()
{
	return 1;
};

func void Info_ORG_830_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

instance Info_ORG_830_Hello(C_INFO)
{
	npc = ORG_830_Organisator;
	nr = 1;
	condition = Info_ORG_830_Hello_Condition;
	information = Info_ORG_830_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "Hi! I'm new here.";
//	description = "Hi! Ich bin neu hier.";
	description = "Zdar! Jsem tady nový.";
};

func int Info_ORG_830_Hello_Condition()
{
	return 1;
};

func void Info_ORG_830_Hello_Info()
{
//	AI_Output(other,self,"Info_ORG_830_Hello_15_00"); //Hi! I'm new here.
//	AI_Output(other,self,"Info_ORG_830_Hello_15_00"); //Hi! Ich bin neu hier.
	AI_Output(other,self,"Info_ORG_830_Hello_15_00"); //Zdar! Jsem tady nový!
//	AI_Output(self,other,"Info_ORG_830_Hello_13_01"); //So what?
//	AI_Output(self,other,"Info_ORG_830_Hello_13_01"); //Und?
	AI_Output(self,other,"Info_ORG_830_Hello_13_01"); //A co?
};

// ************************************************************
// 						Was machst du hier?
// ************************************************************

instance Info_ORG_830_What(C_INFO)
{
	npc = ORG_830_Organisator;
	nr = 1;
	condition = Info_ORG_830_What_Condition;
	information = Info_ORG_830_What_Info;
	important = 0;
	permanent = 0;
//	description = "What are you doing?";
//	description = "Was machst du hier?";
	description = "Co děláš?";
};

func int Info_ORG_830_What_Condition()
{
	if (Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};

	return 0;
};

func void Info_ORG_830_What_Info()
{
//	AI_Output(other,self,"Info_ORG_830_What_15_00"); //What are you doing?
//	AI_Output(other,self,"Info_ORG_830_What_15_00"); //Was machst du hier?
	AI_Output(other,self,"Info_ORG_830_What_15_00"); //Co tady děláš?
//	AI_Output(self,other,"Info_ORG_830_What_13_01"); //What's it look like? I'm smoking.
//	AI_Output(self,other,"Info_ORG_830_What_13_01"); //Wonach sieht's denn aus? Ich rauche mir einen.
	AI_Output(self,other,"Info_ORG_830_What_13_01"); //Jak to vypadá? Kouřím.
//	AI_Output(self,other,"Info_ORG_830_What_13_02"); //If you think I'll let you have a drag... Forget it!
//	AI_Output(self,other,"Info_ORG_830_What_13_02"); //Wenn du denkst, ich lass dich mal ziehen, vergiss es!
	AI_Output(self,other,"Info_ORG_830_What_13_02"); //Jestli si myslíš, že tě nechám potáhnout... Zapomeň na to!
};

// ************************************************************
// 						Aufhalten
// ************************************************************

instance Info_ORG_830_Aufhalten(C_INFO)
{
	npc = ORG_830_Organisator;
	nr = 2;
	condition = Info_ORG_830_Aufhalten_Condition;
	information = Info_ORG_830_Aufhalten_Info;
	important = 0;
	permanent = 0;
//	description = "Aren't you going to try and stop me? Ask me what or something?";
//	description = "Willst du mich nicht aufhalten? Mich fragen, was ich hier will oder so?";
	description = "Nechceš se mě pokusit zastavit? Zeptat se mě, co tu chci nebo tak?";
};

func int Info_ORG_830_Aufhalten_Condition()
{
	if (Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};

	return 0;
};

func void Info_ORG_830_Aufhalten_Info()
{
//	AI_Output(other,self,"Info_ORG_830_Aufhalten_15_00"); //Aren't you going to try and stop me? Ask me what or something?
//	AI_Output(other,self,"Info_ORG_830_Aufhalten_15_00"); //Willst du mich nicht aufhalten? Mich fragen, was ich hier will oder so?
	AI_Output(other,self,"Info_ORG_830_Aufhalten_15_00"); //Nechceš se mě pokusit zastavit? Zeptat se mě, co tu chci nebo tak?
//	AI_Output(self,other,"Info_ORG_830_Aufhalten_13_01"); //No. That's too much trouble for me. Besides, someone like you won't do much damage in there.
//	AI_Output(self,other,"Info_ORG_830_Aufhalten_13_01"); //Nein. Ist mir zu viel Stress. Außerdem kann einer wie du sowieso nicht viel Schaden da drin anrichten.
	AI_Output(self,other,"Info_ORG_830_Aufhalten_13_01"); //Ne. Ještě by mě to znervóznilo. Kromě toho, někdo jako ty tady moc škody nenadělá.
};

// ************************************************************
// 							PERM
// ************************************************************

instance Info_ORG_830_Perm(C_INFO)
{
	npc = ORG_830_Organisator;
	nr = 3;
	condition = Info_ORG_830_Perm_Condition;
	information = Info_ORG_830_Perm_Info;
	important = 0;
	permanent = 1;
//	description = "What's it like inside?";
//	description = "Wie sieht's drinnen aus?";
	description = "Jaké je to uvnitř?";
};

func int Info_ORG_830_Perm_Condition()
{
	if (Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};

	return 0;
};

func void Info_ORG_830_Perm_Info()
{
//	AI_Output(other,self,"Info_ORG_830_Perm_15_00"); //What's it like inside?
//	AI_Output(other,self,"Info_ORG_830_Perm_15_00"); //Wie sieht's drinnen aus?
	AI_Output(other,self,"Info_ORG_830_Perm_15_00"); //Jaké je to uvnitř?
//	AI_Output(self,other,"Info_ORG_830_Perm_13_01"); //Like always - calm, just a couple of brawls.
//	AI_Output(self,other,"Info_ORG_830_Perm_13_01"); //Das Übliche - ruhig bis auf ein paar kleine Schlägereien.
	AI_Output(self,other,"Info_ORG_830_Perm_13_01"); //Jako vždy - klid, až na pár hádek.
};
