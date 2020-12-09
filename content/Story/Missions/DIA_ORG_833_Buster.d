instance DIA_ORG_833_Buster(C_INFO)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster_Condition;
	information = DIA_ORG_833_Buster_Info;
	important = 1;
	permanent = 0;
};

func int DIA_ORG_833_Buster_Condition()
{
	if (Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void DIA_ORG_833_Buster_Info()
{
//	AI_Output(self,other,"DIA_ORG_833_Buster_02_01"); //You don't look very agile. I could help you.
//	AI_Output(self,other,"DIA_ORG_833_Buster_02_01"); //Du siehst ganz schön ungelenkig aus, ich könnte dir helfen.
	AI_Output(self,other,"DIA_ORG_833_Buster_02_01"); //Nevypadáš moc hbitě. Mohl bych ti pomoci.
};

// ************************ EXIT **************************

instance DIA_ORG_833_Buster_Exit(C_INFO)
{
	npc = ORG_833_Buster;
	nr = 999;
	condition = DIA_ORG_833_Buster_Exit_Condition;
	information = DIA_ORG_833_Buster_Exit_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_ORG_833_Buster_Exit_Condition()
{
	return 1;
};

func void DIA_ORG_833_Buster_Exit_Info()
{

	AI_StopProcessInfos(self);
};

// *********** Talent lernen *******************
instance DIA_ORG_833_Buster3(C_INFO)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster3_Condition;
	information = DIA_ORG_833_Buster3_Info;
	important = 0;
	permanent = 1;
//	description = "How can you help me?"; 
//	description = "Wie kannst du mir helfen?"; 
	description = "Jak mi můžeš pomoci?"; 
};

func int DIA_ORG_833_Buster3_Condition()
{ 
	return Npc_KnowsInfo(hero,DIA_ORG_833_Buster);
};

func void DIA_ORG_833_Buster3_Info()
{
//	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01"); //I can show you how to control your body. It's the art of ACROBATICS.
//	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01"); //Ich kann dir die hohe Kunst der Körperbeherrschung zeigen. AKROBATIK.
	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01"); //Můžu ti ukázat, jak ovládat své tělo. To je umění AKROBACIE.

	Info_ClearChoices(DIA_ORG_833_Buster3);
	Info_AddChoice(DIA_ORG_833_Buster3, DIALOG_BACK , DIA_ORG_833_Buster_Back);
	Info_AddChoice(DIA_ORG_833_Buster3, B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT,0), DIA_ORG_833_Buster_Train1);

	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
//	B_LogEntry(GE_TeacherNC,"Buster, the rogue, teaches the skill of ACROBATICS.");
//	B_LogEntry(GE_TeacherNC,"Buster der Bandit unterichtet das Talent AKROBATIK.");
	B_LogEntry(GE_TeacherNC,"Bandita Buster mě naučí umění AKROBACIE.");
};

// ************* Talent lernen **********************
func void DIA_ORG_833_Buster_Train1()
{
	Info_ClearChoices(DIA_ORG_833_Buster3);

	if (B_GiveSkill(other,NPC_TALENT_ACROBAT , 1, LPCOST_TALENT_ACROBAT))
	{
//		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02"); //As soon as you've gained control of your body, you'll be able to jump much further.
//		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02"); //Wenn du deinen Körper beherrscht, bist du in der Lage viel weiter zu springen.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02"); //Brzy získáš kontrolu nad svým tělem a budeš schopen skákat mnohem dál.
//		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03"); //You'll learn how to roll off and what's the best way to land when falling. But don't forget, you're not immortal!
//		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03"); //Du lernst dich richtig abzurollen und aus dem Fall heraus richtig zu landen. Aber denk daran, du bist nicht unsterblich!
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03"); //Naučil ses, jak se stočit a jak nejlépe při pádu dopadnout na zem. Ale nezapomeň - nejsi nesmrtelný!
//		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04"); //Acrobatics can also be very useful during a battle. You'll be able to change the distance between you and your foe very quickly. Good luck!
//		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04"); //Auch im Kampf ist Akrobatik sehr hilfreich. Du kannst deinen Abstand zum Gegner sehr schnell verändern. Viel Glück!
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04"); //Akrobacie může být také velmi užitečná v boji. Můžeš velmi rychle měnit vzdálenost mezi tebou a tvým nepřítelem. Hodně štěstí!
	}; 
};  

// **************** Back ************************
func void DIA_ORG_833_Buster_Back()
{
	Info_ClearChoices(DIA_ORG_833_Buster3);
};

