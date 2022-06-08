// **************************************************
// 						 EXIT
// **************************************************

instance DIA_BaalCadar_Exit(C_INFO)
{
	npc = Gur_1208_BaalCadar;
	nr = 999;
	condition = DIA_BaalCadar_Exit_Condition;
	information = DIA_BaalCadar_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_BaalCadar_Exit_Condition()
{
	return 1;
};

func void DIA_BaalCadar_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 					NICHT ansprechbar (Ungläubiger)
// ************************************************************
var int BaalCadar_Ansprechbar;
var int BaalCadar_Sakrileg;
// ************************************************************

instance DIA_BaalCadar_NoTalk(C_INFO)
{
	npc = GUR_1208_BaalCadar;
	nr = 2;
	condition = DIA_BaalCadar_NoTalk_Condition;
	information = DIA_BaalCadar_NoTalk_Info;
	important = 1;
	permanent = 1;
};

func int DIA_BaalCadar_NoTalk_Condition()
{
	if ((Npc_IsInState(self, ZS_TALK))
	&& (BaalCadar_Ansprechbar == FALSE)
	&& (Npc_GetPermAttitude(self, other) != ATT_FRIENDLY)
	&& (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void DIA_BaalCadar_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalCadar_NoTalk);
	Info_AddChoice(DIA_BaalCadar_NoTalk, DIALOG_ENDE, DIA_BaalCadar_NoTalk_ENDE);
//	Info_AddChoice (DIA_BaalCadar_NoTalk,"Everything alright, pal?",DIA_BaalCadar_NoTalk_Imp);
//	Info_AddChoice (DIA_BaalCadar_NoTalk,"Alles, klar, Alter?",DIA_BaalCadar_NoTalk_Imp);
	Info_AddChoice(DIA_BaalCadar_NoTalk, "Je všechno v pořádku, příteli?", DIA_BaalCadar_NoTalk_Imp);
//	Info_AddChoice (DIA_BaalCadar_NoTalk,"The Sleeper be with you!",DIA_BaalCadar_NoTalk_Sleeper);
//	Info_AddChoice (DIA_BaalCadar_NoTalk,"Der Schläfer sei mit dir!",DIA_BaalCadar_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalCadar_NoTalk, "Spáč buď s tebou!", DIA_BaalCadar_NoTalk_Sleeper);
//	Info_AddChoice (DIA_BaalCadar_NoTalk,"Hi! I'm new here!",DIA_BaalCadar_NoTalk_Hi);
//	Info_AddChoice (DIA_BaalCadar_NoTalk,"Hi! Ich bin neu hier!",DIA_BaalCadar_NoTalk_Hi);
	Info_AddChoice(DIA_BaalCadar_NoTalk, "Zdar! Jsem tu nový!", DIA_BaalCadar_NoTalk_Hi);
};

func void DIA_BaalCadar_NoTalk_Hi()
{
//	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Hi_15_00"); //Hi! I'm new here!
//	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Hi_15_00"); //Hi! Ich bin neu hier!
	AI_Output(other, self, "DIA_BaalCadar_NoTalk_Hi_15_00"); //Zdar! Jsem tu nový!
//	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(sigh)
	AI_Output(self, other, "DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Sleeper()
{
//	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Sleeper_15_00"); //The Sleeper be with you!
//	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Sleeper_15_00"); //Der Schläfer sei mit dir!
	AI_Output(other, self, "DIA_BaalCadar_NoTalk_Sleeper_15_00"); //Spáč buď s tebou!
//	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_02_01"); //(sigh)
	AI_Output(self, other, "DIA_BaalCadar_NoTalk_Sleeper_02_01"); //(vzdech)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Imp()
{
//	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Imp_15_00"); //Everything alright, pal?
//	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Imp_15_00"); //Alles klar, Alter?
	AI_Output(other, self, "DIA_BaalCadar_NoTalk_Imp_15_00"); //Je všechno v pořádku, příteli?
//	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Imp_02_01"); //(sigh)
	AI_Output(self, other, "DIA_BaalCadar_NoTalk_Imp_02_01"); //(vzdech)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};

/*
//	AI_Output(self,other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_01"); //Du solltest deinen Weg mit Bedacht wählen und nach reiflicher Überlegung.
AI_Output(self, other, "Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_01"); //Du solltest deinen Weg mit Bedacht wählen und nach reiflicher Überlegung.
AI_Output(self, other, "Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_02"); //Bedenke wie du entscheidest. In den anderen Lagern bekommst zwar Schutz und Nahrung, aber ist es das, was du willst?
AI_Output(self, other, "Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_15_03"); //Was erwartet mich, was es wert wäre, zu euch zu kommen?
AI_Output(self, other, "Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_04"); //Ich könnte dir jetzt erzählen, das die Templer einen unbezwinglichen Willen haben,das die magische Macht der Gurus, die Vorstellungskraft von Feuer- und Wassermagiern bei weitem übersteigt.
AI_Output(self, other, "Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_05"); //Das unsere Nahrung auch satt macht. Aber das ist es nicht, was diese Gemeinschaft ausmacht.
AI_Output(self, other, "Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_06"); //Was dich hier erwartet, ist die Gabe. Du wirst einen Weg beschreiten, der dir sehr viel abverlangt.
AI_Output(self, other, "Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_07"); //Aber das was du erreichen wirst ist eine Größe, eine Macht die dir Erleuchtung schenkt. Eine Macht, die dich zur Freiheit führt.
AI_Output(self, other, "Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_08"); //Ist es nicht das, was du willst?... Freiheit?
AI_Output(self, other, "Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_09"); //Also solltest du nicht die Frage stellen, warum du her kommen solltest, die Frage ist viel mehr, warum solltest du nicht?
Log_CreateTopic(GE_TeacherPSI, LOG_NOTE);
B_LogEntry(GE_TeacherPSI, "Baal Cadar kann mir zeigen, wie ich meine geistige Kraft verbessern kann.");
*/

// **************************************************
// 						 Sleep Spell
// **************************************************

instance DIA_BaalCadar_SleepSpell(C_INFO)
{
	npc = Gur_1208_BaalCadar;
	nr = 1;
	condition = DIA_BaalCadar_SleepSpell_Condition;
	information = DIA_BaalCadar_SleepSpell_Info;
	important = 1;
	permanent = 0;
};

func int DIA_BaalCadar_SleepSpell_Condition()
{
	var C_Npc Nov1336; Nov1336 = Hlp_GetNpc(Nov_1336_Novize);
	var C_Npc Nov1340; Nov1340 = Hlp_GetNpc(Nov_1340_Novize);
	var C_Npc Nov1345; Nov1345 = Hlp_GetNpc(Nov_1345_Novize);

	if ((Npc_IsInState(Nov1336, ZS_MagicSleep))
	|| (Npc_IsInState(Nov1340, ZS_MagicSleep))
	|| (Npc_IsInState(Nov1345, ZS_MagicSleep)))
	{
		return 1;
	};

	return 0;
};

func void DIA_BaalCadar_SleepSpell_Info()
{
//	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_00"); //What are you doing? I'm trying to meditate with my disciples.
//	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_00"); //Was tust du? Ich versuche hier gerade mit meinen Schülern zu meditieren.
	AI_Output(self, other, "DIA_BaalCadar_SleepSpell_02_00"); //Co děláš? Pokouším se meditovat se svými žáky.
//	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_01"); //Who taught you to use the magical powers of the Sleeper?
//	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_01"); //Wer hat dir beigebracht, die Magie des Schläfers zu wirken?
	AI_Output(self, other, "DIA_BaalCadar_SleepSpell_02_01"); //Kdo tě naučil používat Spáčovu magickou moc?
//	AI_Output(other,self,"DIA_BaalCadar_SleepSpell_15_02"); //Nobody. It was very easy.
//	AI_Output(other,self,"DIA_BaalCadar_SleepSpell_15_02"); //Niemand. Es war ganz leicht.
	AI_Output(other, self, "DIA_BaalCadar_SleepSpell_15_02"); //Nikdo. Bylo to snadné.
//	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_03"); //You seem to be an intelligent student. I will teach you.
//	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_03"); //Du scheinst ein sehr gelehriger Schüler zu sein. Ich werde dich unterrichten.
	AI_Output(self, other, "DIA_BaalCadar_SleepSpell_02_03"); //Zdá se, že jsi bystrý žák. Budu tě učit.

	BaalCadar_Ansprechbar = TRUE;
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi, LOG_RUNNING);
	};

//	B_LogEntry(CH1_JoinPsi,"Baal Cadar thinks I'm a receptive disciple!");
//	B_LogEntry(CH1_JoinPsi,"Baal Cadar hält mich für einen gelehrigen Schüler!");
	B_LogEntry(CH1_JoinPsi, "Baal Cadar mě má za vnímavého učně!");
	B_GiveXP(XP_ImpressBaalCadar);
};

/*------------------------------------------------------------------------
MANA
------------------------------------------------------------------------ */

instance Gur_1208_BaalCadar_Teach(C_INFO)
{
	npc = Gur_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_Teach_Condition;
	information = Gur_1208_BaalCadar_Teach_Info;
	important = 0;
	permanent = 1;
//	description = "I would like to learn how to increase the power of my magic.";
//	description = "Ich will lernen, die Kraft meiner Magie zu steigern.";
	description = "Chtěl bych se naučit, jak zvětšit sílu svých kouzel.";
};

func int Gur_1208_BaalCadar_Teach_Condition()
{
	if ((BaalCadar_Ansprechbar == TRUE)
	|| (Npc_GetTrueGuild(other) != GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void Gur_1208_BaalCadar_Teach_Info()
{
//	AI_Output(other,self,"Gur_1208_BaalCadar_Teach_Info_15_01"); //I would like to learn how to increase the power of my magic.
//	AI_Output(other,self,"Gur_1208_BaalCadar_Teach_Info_15_01"); //Ich will lernen, die Kraft meiner Magie zu steigern.
	AI_Output(other, self, "Gur_1208_BaalCadar_Teach_Info_15_01"); //Chtěl bych se naučit, jak zvětšit sílu svých kouzel.
//	AI_Output(self,other,"Gur_1208_BaalCadar_Teach_Info_02_02"); //The power of your spirit is the key.
//	AI_Output(self,other,"Gur_1208_BaalCadar_Teach_Info_02_02"); //Die Kraft deines Geistes ist der Schlüssel dazu.
	AI_Output(self, other, "Gur_1208_BaalCadar_Teach_Info_02_02"); //Klíčem je síla tvojí duše.

	if (log_baalcadartrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI, LOG_NOTE);
//		B_LogEntry(GE_TeacherPSI,"The Guru Baal Cadar can help me to increase my MANA.");
//		B_LogEntry(GE_TeacherPSI,"Der Guru Baal Cadar kann mir helfen, meine MANA zu steigern");
		B_LogEntry(GE_TeacherPSI, "Guru Baal Cadar mi může pomoci zvýšit MAGICKOU ENERGII.");
		log_baalcadartrain = TRUE;
	};

	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach, DIALOG_BACK, Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5, 5 * LPCOST_ATTRIBUTE_MANA, 0), Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_1, LPCOST_ATTRIBUTE_MANA, 0), Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_BACK()
{
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
};

//TODO: remove repetitive code
func void Gur_1208_BaalCadar_Teach_MAN_1()
{
	B_BuyAttributePoints(other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach, DIALOG_BACK, Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5, 5 * LPCOST_ATTRIBUTE_MANA, 0), Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_1, LPCOST_ATTRIBUTE_MANA, 0), Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_MAN_5()
{
	B_BuyAttributePoints(other, ATR_MANA_MAX, 5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach, DIALOG_BACK, Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5, 5 * LPCOST_ATTRIBUTE_MANA, 0), Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_1, LPCOST_ATTRIBUTE_MANA, 0), Gur_1208_BaalCadar_Teach_MAN_1);
};

/*------------------------------------------------------------------------
DIE KREISE DER BRUDERSCHAFT
------------------------------------------------------------------------ */

instance Gur_1208_BaalCadar_FIRSTTEST(C_INFO)
{
	npc = Gur_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_FIRSTTEST_Condition;
	information = Gur_1208_BaalCadar_FIRSTTEST_Info;
	important = 0;
	permanent = 0;
//	description = "Teach me the magic of the runes.";
//	description = "Lehre mich die Magie der Runen.";
	description = "Nauč mě magii run.";
};

func int Gur_1208_BaalCadar_FIRSTTEST_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))
	{
		return 1;
	};

	return 0;
};

func void Gur_1208_BaalCadar_FIRSTTEST_Info()
{
//	AI_Output(other,self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01"); //Teach me the magic of the runes.
//	AI_Output(other,self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01"); //Lehre mich die Magie der Runen.
	AI_Output(other, self, "Gur_1208_BaalCadar_FIRSTTEST_Info_15_01"); //Nauč mě magii run.
//	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02"); //Many have learnt the language of the runes, but only very few understand their magic.
//	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02"); //Die Sprache der Runen zu lernen, vermögen viele, doch nur wenige verstehen ihre Magie.
	AI_Output(self, other, "Gur_1208_BaalCadar_FIRSTTEST_Info_02_02"); //Mnozí se naučili jazyku run, ale jen někteří pochopili jejich kouzlo.
//	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03"); //I will try to teach you.
//	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03"); //Ich werde es mit dir versuchen.
	AI_Output(self, other, "Gur_1208_BaalCadar_FIRSTTEST_Info_02_03"); //Pokusím se tě to naučit.

	Log_CreateTopic(GE_TeacherPSI, LOG_NOTE);
//	B_LogEntry(GE_TeacherPSI,"Baal Cadar can teach me the magic CIRCLES of rune magic.");
//	B_LogEntry(GE_TeacherPSI,"Baal Cadar kann mich die magischen KREISE der Runenmagie lehren.");
	B_LogEntry(GE_TeacherPSI, "Baal Cadar mě může naučit magické KRUHY runové magie.");
};

/*------------------------------------------------------------------------
DER ERSTE KREIS
------------------------------------------------------------------------ */

instance Gur_1208_BaalCadar_KREIS1(C_INFO)
{
	npc = Gur_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS1_Condition;
	information = Gur_1208_BaalCadar_KREIS1_Info;
	important = 0;
	permanent = 1;
//	description = "I am ready to enter the First Circle.";
//	description = "Ich bin bereit für den ersten Kreis";
	description = "Jsem připraven vstoupit do prvního kruhu.";
};

func int Gur_1208_BaalCadar_KREIS1_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 0)
	&& (Npc_KnowsInfo(hero, Gur_1208_BaalCadar_FIRSTTEST))
	&& (C_NpcBelongsToPsiCamp(hero)))
	{
		return 1;
	};

	return 0;
};

func void Gur_1208_BaalCadar_KREIS1_Info()
{
//	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS1_Info_15_01"); //I am ready to enter the First Circle.
//	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS1_Info_15_01"); //Ich bin bereit für den ersten Kreis.
	AI_Output(other, self, "Gur_1208_BaalCadar_KREIS1_Info_15_01"); //Jsem připraven vstoupit do prvního kruhu.
	if (B_GiveSkill(other, NPC_TALENT_MAGE, 1, LPCOST_TALENT_MAGE_1))
	{
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_02"); //Hear my words:
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_02"); //Höre meine Worte:
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS1_Info_02_02"); //Slyš má slova.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_03"); //A long time ago the Sleeper appeared and sent mankind a vision.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_03"); //Der Schläfer erschien vor langer Zeit und gab den Menschen eine Vision.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS1_Info_02_03"); //Před dlouhou dobou se zjevil Spáč a seslal lidstvu vizi.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_04"); //But many people refused to see his signs, they were blinded by their greed for ore.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_04"); //Viele wollten seine Zeichen jedoch nicht sehen, weil sie von der Gier nach Erz geblendet waren.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS1_Info_02_04"); //Mnozí lidé však odmítali jeho znamení vnímat, neboť byli příliš zaslepeni touhou po rudě.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_05"); //Only Y'Berion and a few others set off and founded the Brotherhood.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_05"); //Nur Y'Berion und eine Hand voll anderer machten sich auf und gründeten die Bruderschaft.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS1_Info_02_05"); //Jen Y´Berion, s hrstkou dalších, se sebral a založil Bratrstvo.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_06"); //The moment they obeyed the Sleeper's call, the First Circle was born. The magic of the runes will be understood by anybody who follows the Sleeper.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_06"); //In dem Augenblick, als sie dem Ruf des Schläfers folgten, entstand der erste Kreis. Die Magie der Runen offenbart sich demjenigen, der dem Schläfer folgt.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS1_Info_02_06"); //V okamžiku, kdy vyslyšeli Spáčovo poselství, se zrodil první kruh. Magie run je k dispozici každému, kdo následuje Spáče.
		Gur_1208_BaalCadar_KREIS1.permanent = 0;
	};

	//TODO: why?
	AI_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
DER ZWEITE KREIS
------------------------------------------------------------------------ */

instance Gur_1208_BaalCadar_KREIS2(C_INFO)
{
	npc = Gur_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS2_Condition;
	information = Gur_1208_BaalCadar_KREIS2_Info;
	important = 0;
	permanent = 1;
//	description = "I am ready to enter the Second Circle.";
//	description = "Ich bin bereit für den zweiten Kreis";
	description = "Jsem připraven vstoupit do druhého kruhu.";
};

func int Gur_1208_BaalCadar_KREIS2_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 1)
	&& (C_NpcBelongsToPsiCamp(hero)))
	{
		return 1;
	};

	return 0;
};

func void Gur_1208_BaalCadar_KREIS2_Info()
{
//	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS2_Info_15_01"); //I am ready to enter the Second Circle.
//	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS2_Info_15_01"); //Ich bin bereit für den zweiten Kreis.
	AI_Output(other, self, "Gur_1208_BaalCadar_KREIS2_Info_15_01"); //Jsem připraven vstoupit do druhého kruhu.
	if (B_GiveSkill(other, NPC_TALENT_MAGE, 2, LPCOST_TALENT_MAGE_2))
	{
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_02"); //Then listen and understand:
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_02"); //Dann höre und begreife:
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS2_Info_02_02"); //Pak naslouchej a věz.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_03"); //The Sleeper led Y'Berion and his faithful disciples to this place, where they settled.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_03"); //Der Schläfer führte Y'Berion und seine getreuen Anhänger an diesen Ort. Hier ließen sie sich nieder.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS2_Info_02_03"); //Spáč dovedl Y´Beriona a jeho věřící žáky na toto místo, kde se usadili.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_04"); //They worked without respite - for days, weeks, months. The Camp grew. More and more men joined them, following the Sleeper's call.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_04"); //Sie arbeiteten ohne Unterlass, Tage, Wochen Monate. Und das Lager wuchs heran. Mehr Männer kamen dazu, die dem Ruf des Schläfers gefolgt waren.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS2_Info_02_04"); //Pracovali bez odpočinku, dny, týdny, měsíce. Vyrostl tento tábor. Přidávali se k němu noví a noví lidé, kteří následovali Spáčovo poselství.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_05"); //Together they tried to contact the Sleeper on a spiritual level.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_05"); //Und zusammen versuchten sie, durch Gebet und Meditation den Schläfer auf spiritueller Ebene zu treffen.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS2_Info_02_05"); //Společně se pak pokusili o spojení se Spáčem na duchovní úrovni.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_06"); //The Second Circle was born.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_06"); //Das war die Geburtsstunde des zweiten Kreises.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS2_Info_02_06"); //Tak se zrodil druhý kruh.
		Gur_1208_BaalCadar_KREIS2.permanent = 0;
	};

	//TODO: why?
	AI_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
DER DRITTE KREIS
------------------------------------------------------------------------ */

instance Gur_1208_BaalCadar_KREIS3(C_INFO)
{
	npc = Gur_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS3_Condition;
	information = Gur_1208_BaalCadar_KREIS3_Info;
	important = 0;
	permanent = 1;
//	description = "I am ready to enter the Third Circle.";
//	description = "Ich bin bereit für den dritten Kreis";
	description = "Jsem připraven vstoupit do třetího kruhu.";
};

func int Gur_1208_BaalCadar_KREIS3_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 2)
	&& (C_NpcBelongsToPsiCamp(hero)))
	{
		return 1;
	};

	return 0;
};

func void Gur_1208_BaalCadar_KREIS3_Info()
{
//	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS3_Info_15_01"); //I am ready to enter the Third Circle.
//	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS3_Info_15_01"); //Ich bin bereit für den dritten Kreis.
	AI_Output(other, self, "Gur_1208_BaalCadar_KREIS3_Info_15_01"); //Jsem připraven vstoupit do třetího kruhu.
	if (B_GiveSkill(other, NPC_TALENT_MAGE, 3, LPCOST_TALENT_MAGE_3))
	{
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_02"); //Mark this:
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_02"); //Achte das Wort:
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS3_Info_02_02"); //Zapamatuj si toto:
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_03"); //The visions became clear, but the spiritual power of the Brotherhood was insufficient for contact.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_03"); //Die Visionen wurden deutlicher, jedoch war die geistige Kraft der Brüder nicht ausreichend für einen Kontakt.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS3_Info_02_03"); //Vize se staly jasnější, ale síla Bratrstva nestačila pro navázání spojení.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_04"); //One of the Gurus, an alchemist, solved the problem. He brewed a potion extracted from the secretion of a minecrawler. The brothers took it before prayers and their spiritual powers were united for the very first time.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_04"); //Einer der Gurus, ein Alchemist, fand einen Weg. Mit Hilfe eines Elixiers aus dem Sekret der Minecrawler, das die Brüder vor dem Gebet einnahmen, wurde es erstmalig möglich, die geistigen Kräfte zu vereinen.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS3_Info_02_04"); //Jeden z Guru, alchymista, ten problém vyřešil. Připravil lektvar extrahovaný z výměšku z čelistí důlních červů. Bratři pak spojili své modlitby a jejich duchovní síla se poprvé sjednotila.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_05"); //At the same time, the novices set out for the Camps, to preach the Sleeper's word and to convince the infidels of the truth.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_05"); //Zur gleichen Zeit machten sich die Novizen auf in die Lager, die Worte des Schläfers zu predigen, um mehr Ungläubige von der Wahrheit zu überzeugen.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS3_Info_02_05"); //V tu dobu se novicové vydali do táborů, aby tam zvěstovali Spáčovo učení a přesvědčovali nevěrce o víře.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_06"); //Thus the Third Circle was accomplished.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_06"); //Dadurch wurde der dritte Kreis vollendet.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS3_Info_02_06"); //Tak byl dovršen třetí kruh.
	};

	//TODO: why?
	AI_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
DER VIERTE KREIS
------------------------------------------------------------------------ */

instance Gur_1208_BaalCadar_KREIS4(C_INFO)
{
	npc = Gur_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS4_Condition;
	information = Gur_1208_BaalCadar_KREIS4_Info;
	important = 0;
	permanent = 1;
//	description = "I am ready to enter the Fourth Circle.";
//	description = "Ich bin bereit für den vierten Kreis";
	description = "Jsem připraven vstoupit do čtvrtého kruhu.";
};

func int Gur_1208_BaalCadar_KREIS4_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 3)
	&& (C_NpcBelongsToPsiCamp(hero)))
	{
		return 1;
	};

	return 0;
};

func void Gur_1208_BaalCadar_KREIS4_Info()
{
//	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS4_Info_15_01"); //I am ready to enter the Fourth Circle.
//	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS4_Info_15_01"); //Ich bin bereit für den vierten Kreis.
	AI_Output(other, self, "Gur_1208_BaalCadar_KREIS4_Info_15_01"); //Jsem připraven vstoupit do čtvrtého kruhu.
	if (B_GiveSkill(other, NPC_TALENT_MAGE, 4, LPCOST_TALENT_MAGE_4))
	{
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_02"); //A long time has passed since the Camp was founded. Many things have changed.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_02"); //Seit der Gründung des Lagers ist viel Zeit vergangen. Viel hat sich geändert.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS4_Info_02_02"); //Uběhla dlouhá doba od založení tábora. Mnoho se toho změnilo.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_03"); //The faith has grown, it has been strengthened and it has spread.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_03"); //Der Glaube ist gewachsen, hat sich gefestigt und wurde weitergetragen.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS4_Info_02_03"); //Víra zesílila, upevnila se a rozšířila.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_04"); //We have not forgotten our objective. We have not given up on trying to invoke the Sleeper.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_04"); //Und wir haben unser Ziel nie aus den Augen verloren, haben nicht aufgegeben, den Schläfer zu rufen.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS4_Info_02_04"); //Nezapomněli jsme však na naše poslání. Nevzdávali jsme se pokusů o vzývání Spáče.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_05"); //Perseverance and stability of faith represent the Fourth Circle.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_05"); //Die Beständigkeit und Festigung des Glaubens, das ist der vierte Kreis.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS4_Info_02_05"); //Vytrvalost a síla víry představují čtvrtý kruh.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_06"); //Now you know everything a brother needs to know about magic. You have been a good student.
//		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_06"); //Du weißt nun alles, was ein Bruder über Magie wissen muss. Du warst ein gelehriger Schüler.
		AI_Output(self, other, "Gur_1208_BaalCadar_KREIS4_Info_02_06"); //Teď víš všechno, co bratr potřebuje o kouzlech vědět. Byl jsi dobrý žák.
		Gur_1208_BaalCadar_KREIS4.permanent = 0;
	};
};

//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------

instance Gur_1208_BaalCadar_SELLSTUFF(C_INFO)
{
	npc = Gur_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_SELLSTUFF_Condition;
	information = Gur_1208_BaalCadar_SELLSTUFF_Info;
	important = 0;
	permanent = 1;
	trade = 1;
	description = DIALOG_TRADE;
};

func int Gur_1208_BaalCadar_SELLSTUFF_Condition()
{
	if ((BaalCadar_Ansprechbar == TRUE)
	|| (Npc_GetTrueGuild(other) != GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void Gur_1208_BaalCadar_SELLSTUFF_Info()
{
	if (log_baalcadarsell == FALSE)
	{
		Log_CreateTopic(GE_TraderPSI, LOG_NOTE);
//		B_LogEntry(GE_TraderPSI,"The Guru Baal Cadar sells RUNES, MAGIC SCROLLS, POTIONS, AMULETS and RINGS.");
//		B_LogEntry(GE_TraderPSI,"Der Guru Baal Cadar verkauft RUNEN, SPRUCHROLLEN, TRÄNKE, AMULETTE und RINGE.");
		B_LogEntry(GE_TraderPSI, "Guru Baal Cadar prodává RUNY, KOUZELNÉ SVITKY, LEKTVARY, AMULETY a PRSTENY.");
		log_baalcadarsell = TRUE;
	};

//	AI_Output(other,self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01"); //I want to acquire magic writings.
//	AI_Output(other,self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01"); //Ich möchte Schriften über Magie erwerben.
	AI_Output(other, self, "Gur_1208_BaalCadar_SELLSTUFF_Info_15_01"); //Rád bych získal magické spisy.
};
