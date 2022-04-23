//#####################################################################
//##
//##
//## KAPITEL 1
//##
//##
//#####################################################################

// ************************ EXIT **************************

instance DIA_GUR_1202_CorAngar_Exit(C_INFO)
{
	npc = GUR_1202_CorAngar;
	nr = 999;
	condition = DIA_GUR_1202_CorAngar_Exit_Condition;
	information = DIA_GUR_1202_CorAngar_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

func void DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ************************
//		Später Trainer
// ************************

instance DIA_CorAngar_LaterTrainer(C_INFO)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = DIA_CorAngar_LaterTrainer_Condition;
	information = DIA_CorAngar_LaterTrainer_Info;
	permanent = 0;
//	description = "Will you train me?";
//	description = "Kannst du mich trainieren?";
	description = "Budeš mě cvičit?";
};

func int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

func void DIA_CorAngar_LaterTrainer_Info()
{
//	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Will you train me?
//	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Kannst du mich trainieren?
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Budeš mě cvičit?
//	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //You want to become a strong warrior, so now you're looking for someone to instruct you.
//	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Du willst ein starker Kämpfer werden und bist auf der Suche nach jemandem, der dich unterweist.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Chceš se stát silným bojovníkem, takže hledáš někoho, kdo tě bude cvičit.
//	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //Commendable. But I'm not the man you want.
//	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //Das ist gut. Aber ich bin NICHT derjenige, den du suchst.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //To je chvályhodné. Já ale nejsem ten, koho potřebuješ.
//	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //I dedicate my time only to those belonging to the Holy Circle of Templars.
//	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Ich opfere meine Zeit nur denen, die dem heiligen Kreis der Templer angehören.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Svůj čas věnuji jen příslušníkům Svatého templářského kruhu.
};

// ************************
//		Wie Templer
// ************************

instance DIA_CorAngar_WieTempler(C_INFO)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = DIA_CorAngar_WieTempler_Condition;
	information = DIA_CorAngar_WieTempler_Info;
	permanent = 1;
//	description = "How can I become a templar?";
//	description = "Wie werde ich in den Kreis der Templer aufgenommen?";
	description = "Jak se můžu stát templářem?";
};

func int DIA_CorAngar_WieTempler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) != GIL_TPL))
	{
		return 1;
	};
};

func void DIA_CorAngar_WieTempler_Info()
{
//	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //How can I become a templar?
//	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Wie werde ich in den Kreis der Templer aufgenommen?
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Jak se můžu stát templářem?
//	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //First, you will have to serve as a novice for a while to prove that you truly believe in the Sleeper.
//	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Du musst eine Zeit lang als Novize gedient haben, um deinen Glauben an den Schläfer unter Beweis zu stellen.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Zaprvé, musíš sloužit jako novic do té doby, než dokážeš, že upřímně věříš ve Spáče.
//	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Then come back to me, and I will instruct you.
//	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Dann kehre zu mir zurück, und ich werde dich unterweisen.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Pak se ke mně vrátíš a já ti dám pokyny.
	AI_StopProcessInfos(self);
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							STÄRKE UND DEX STEIGERN
//-------------------------------------------------------------------------
instance GUR_1202_CorAngar_Teach(C_INFO)
{
	npc = GUR_1202_CorAngar;
	nr = 10;
	condition = GUR_1202_CorAngar_Teach_Condition;
	information = GUR_1202_CorAngar_Teach_Info;
	permanent = 1;
//	description = "Can you train my strength and dexterity?";
//	description = "Kannst du meine Stärke und mein Geschick trainieren?";
	description = "Můžeš cvičit mojí sílu a obratnost?";
};

func int GUR_1202_CorAngar_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void GUR_1202_CorAngar_Teach_Info()
{
//	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Can you train my strength and dexterity?
//	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Kannst du meine Stärke und mein Geschick trainieren?
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Můžeš cvičit mojí sílu a obratnost?
//	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Every warrior requires strength and dexterity.
//	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Kampfkraft und Wendigkeit sind die Vorraussetzungen für jeden Kämpfer.
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Síla a obratnost jsou předpoklady každého dobrého bojovníka.

	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK ,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK ,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK ,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK ,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK ,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

//--------------------------------------------------------------
// TEMPLER WERDEN
//--------------------------------------------------------------
instance GUR_1202_CorAngar_WANNABETPL(C_INFO)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_WANNABETPL_Condition;
	information = GUR_1202_CorAngar_WANNABETPL_Info;
	important = 0;
	permanent = 1;
//	description = "I want to become a templar!";
//	description = "Ich möchte Templer werden";
	description = "Chci se stát templářem!";
};

func int GUR_1202_CorAngar_WANNABETPL_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	&& (Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};

};
func void GUR_1202_CorAngar_WANNABETPL_Info()
{
//	AI_Output(other,self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //I want to become a templar!
//	AI_Output(other,self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Ich möchte Templer werden!
	AI_Output(other,self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Chci se stát templářem!

	if (hero.level < 10)
	{
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //You are not yet ready. You can join us as soon as you've gathered more experience.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Du bist noch nicht bereit. Wenn du erfahrener geworden bist, werde ich dich aufnehmen.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Nejsi ještě připraven. Můžeš se k nám připojit, jakmile získáš víc zkušeností.
		GUR_1202_CorAngar_WANNABETPL.permanent = 1;
	}
	else if (hero.level >= 10)
	{
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //The time has come for you to join us.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Die Zeit ist gekommen, da du aufgenommen wirst.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Nadešel čas, aby ses k nám přidal.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Remember that a templar is not only a good warrior and a guardian of the Camp. We are the chosen guards of the Sleeper. The guardians of the spirit.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Du solltest eins wissen: Templer zu sein, bedeutet nicht nur gut kämpfen zu können und das Lager zu beschützen. Wir sind die auserwählte Wache des Schläfers. Die Hüter des Geistes.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Pamatuj, že templář není jen dobrým bojovníkem a strážcem tábora. Jsme vyvolení strážci Spáče. Strážci ducha.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //We make use of both our physical and our spiritual strength. Only those whose body and spirit are in unison can become true templars.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Wir nutzen unsere geistige und unsere körperliche Kraft zu gleichen Teilen. Nur ein Mann, dessen Körper und Geist sich in Einklang befinden, kann ein aufrechter Templer sein.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Používáme jak fyzickou, tak duchovní sílu. Jen ti, jejichž těla i duše splývají v jedno, jsou praví templáři.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //I'm really pleased that you managed to achieve a great deal within such a short time. Now you are ready to join us.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Es freut mich, dass du es in so kurzer Zeit geschafft hast, so weit zu kommen, dass du nun bereit bist, einer der Unseren zu werden.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Jsem opravdu potěšen, že jsi došel tak daleko v tak krátké době. Nyní jsi připraven se k nám přidat.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Remember: A focused spirit and a trained body may withstand any threat.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Und vergiss nicht: ein konzentrierter Geist in einem gestählten Körper widersteht jeder Bedrohung.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Zapamatuj si: soustředěná duše a trénované tělo odolají každé hrozbě.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Now go to Gor Na Toth at the training ground. He'll give you new armor.
//		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Gehe nun zu Gor Na Toth am Übungsplatz. Er wird dir deine neue Rüstung geben.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Teď jdi na cvičiště za Gor Na Tothem. Dá ti novou zbroj.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero,GIL_TPL);
		hero.guild = GIL_TPL;

		Log_CreateTopic(GE_BecomeTemplar,LOG_NOTE);
//		B_LogEntry(GE_BecomeTemplar,"Today Cor Angar has appointed me a templar. Gor Na Toth will hand me over my new armor. He's usually at the training ground.");
//		B_LogEntry(GE_BecomeTemplar,"Heute hat mich Cor Angar zu einem Templer ernannt. Gor Na Toth soll mir meine neue Rüstung überreichen. Er hält sich normalerweise am Übungsplatz auf.");
		B_LogEntry(GE_BecomeTemplar,"Dnes mě Cor Kalom pasoval na templáře. Gor Na Toth mi předá moji novou zbroj. Obvykle bývá na cvičišti.");
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
//		B_LogEntry(GE_TeacherPSI,"Cor Angar teaches STRENGTH, DEXTERITY and TWO-HANDED fighting. He'll only teach me the last once I'm a master of ONE-HANDED fighting. He's usually to be found at the templars' training ground on the second level of the catwalks.");
//		B_LogEntry(GE_TeacherPSI,"Cor Angar unterrichtet STÄRKE, GESCHICK und den ZWEIHÄNDIGEN Kampf. Diesen aber nur, wenn ich im EINHÄNDIGEN Kampf gemeistert bin. Man kann ihn normalerweise auf dem Übungsplatz der Templer auf der zweiten Stegebene finden.");
		B_LogEntry(GE_TeacherPSI,"Cor Angar cvičí SÍLU, OBRATNOST a boj s OBOURUČNÍMI ZBRANĚMI. Bude mě učit až tehdy, když se stanu mistrem boje s JEDNORUČNÍMI ZBRANĚMI. Obvykle bývá na cvičišti v druhé úrovni můstků.");
	};
};

//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance GUR_1202_CorAngar_ZWEIHAND1(C_INFO)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_ZWEIHAND1_Condition;
	information = GUR_1202_CorAngar_ZWEIHAND1_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0);
//	description = B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0);
	description = B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0);
};

func int GUR_1202_CorAngar_ZWEIHAND1_Condition()
{
	if (Npc_GetTalentSkill (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return TRUE;
	};

};
func void GUR_1202_CorAngar_ZWEIHAND1_Info()
{
//	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //I want to learn how to handle a two-handed sword.
//	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Ich möchte den Umgang mit dem Zweihänder lernen.
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Chci se naučit zacházet s obouručním mečem.

	if (B_GiveSkill(other,NPC_TALENT_2H, 1, LPCOST_TALENT_2H_1))
	{
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Fighting with two-handed weapons requires certain levels of strength and dexterity.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Der Kampf mit zweihändigen Waffen setzt nicht nur ein Mindestmaß an Stärke und Geschick voraus.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Boj s obouručními zbraněmi nevyžaduje jen určitou sílu a obratnost.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //To wield a two-handed weapon, you will not only need to master your body, but your mind as well.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Um eine zweihändige Waffe zu führen, musst du nicht nur deinen Körper, sondern auch deinen Geist beherrschen.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Abys dokázal zacházet s obouruční zbraní, musíš být nejen pánem svého těla, ale zrovna tak své mysli.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Only if you master both mind and body will you be able to learn the skill.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Nur wenn du Körper und Geist ganz beherrscht, kannst du das Talent lernen.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Jedině když se staneš pánem svého těla i mysli zároveň, můžeš se umění boje naučit.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Concentration is the key. Body and mind unite in concentration.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Konzentration ist der Schlüssel. Körper und Geist verschmelzen in Konzentration zusammen.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Klíčem úspěchu je soustředění. Soustředěná jednota těla a mysli.

		//#Needs_Attention - tato metoda zmeny permanent si myslim nefunguje - TODO: otestovat
		GUR_1202_CorAngar_ZWEIHAND1.permanent = 0;

		AI_StopProcessInfos(self);
		B_PracticeCombat ("PSI_PATH_6_7");
	};
};
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance GUR_1202_CorAngar_ZWEIHAND2(C_INFO)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_ZWEIHAND2_Condition;
	information = GUR_1202_CorAngar_ZWEIHAND2_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0);
//	description = B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0);
	description = B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2, 0);
};

func int GUR_1202_CorAngar_ZWEIHAND2_Condition()
{
	if (Npc_GetTalentSkill (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return TRUE;
	};

};
func void GUR_1202_CorAngar_ZWEIHAND2_Info()
{
//	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01"); //I want to learn more about fighting with two-handed weapons.
//	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01"); //Ich möchte mehr über den zweihändigen Kampf lernen.
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01"); //Chci se naučit víc o boji s obouručními zbraněmi.

	if (B_GiveSkill(other,NPC_TALENT_2H, 2, LPCOST_TALENT_2H_2))
	{
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //You're now in command of the dance with the blade. Now I'll show you how to master the fight.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Den Tanz mit der Klinge beherrscht du nun. Jetzt werde ich dir die Meisterschaft des Kampfes zeigen.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Teď ovládáš tanec s ostřím. Naučím tě, jak se stát mistrem v boji.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Use your spiritual force to anticipate your enemy's movements before he attacks.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Nutze deine geistige Kraft, um die Bewegungen des Gegners vor dem Angriff zu erkennen.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Použij duchovní sílu k tomu, abys vyčetl protivníkův pohyb, ještě než zaútočí.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Knowing how your enemy fights is half the victory.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Zu wissen, wie dein Gegner kämpft, ist der halbe Sieg über ihn.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Znalost protivníkovy taktiky boje je poloviční vítězství.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Be fast, your movements will have to be surprising and fluent, your hits precise and hard.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Sei schnell, deine Bewegungen müssen überraschend und fließend sein, deine Schläge präzise und hart.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Buď rychlý, tvoje útoky musí být překvapující a plynulé, údery přesné a tvrdé.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Learn to ignore the pain. It's your willpower that will finally decide the outcome of the fight.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Lerne den Schmerz zu ignorieren. Dein Wille ist es, der letztendlich über den Ausgang des Kampfes entscheidet.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Nauč se nevnímat bolest. Výsledek zápasu vždy nakonec rozhodne síla tvojí vůle.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Remain calm. Only if you enter a fight calmly and with concentration, will you survive it.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Bewahre die Ruhe. Nur wenn du ruhig und konzentriert in einen Kampf gehst, wirst du ihn auch überleben.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Zůstaň klidný. Přežiješ jen tehdy, když se pustíš do boje s klidem a soustředěním.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Use your skill cautiously. And remember: To provoke a fight means you will die in a fight.
//		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Setze dein Talent mit Vorsicht ein. Und denke daran: Wer den Kampf fordert, kommt durch den Kampf um.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Využívej své umění obezřetně. A zapamatuj si: vyprovokovat boj znamená totéž, co v něm zemřít.

		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos(self);
		B_PracticeCombat ("PSI_PATH_6_7");
	};
};

//#####################################################################
//##
//##
//## KAPITEL 3
//##
//##
//#####################################################################

// **************************************************************************
// 				nach der großen Beschwörung
// **************************************************************************
instance GUR_1202_CorAngar_SENDS(C_INFO)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_SENDS_Condition;
	information = GUR_1202_CorAngar_SENDS_Info;
	important = 0;
	permanent = 0;
//	description = "What happens now?";
//	description = "Wie geht es jetzt weiter?";
	//#Needs_attention - Neprebasnime, povedal by som skor nieco v tom zmysle: 'A co teď?'
	description = "Jak to dopadlo?";
};

func int GUR_1202_CorAngar_SENDS_Condition()
{
	if (Kapitel == 3)
	&& (CorAngar_GotoOGY == FALSE)
	{
		return 1;
	};

};
func void GUR_1202_CorAngar_SENDS_Info()
{
//	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //What happens now?
//	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Wie geht es jetzt weiter?
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Jak to dopadlo?
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //The vision was very vague, it brought us more riddles than answers.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Die Vision war sehr verschwommen und gab mehr Rätsel auf, als dass sie uns Antworten brachte.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Vidina byla příliš nejasná. Přinesla nám víc hádanek než odpovědí.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //But one thing was perfectly clear: I saw an Orc in a cave. There is an old abandoned Orcish place of worship nearby.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Aber eines war klar. Mann konnte einen Ork in einer Höhle erkennen. Es gibt eine alte verlassene Kultstätte der Orks ganz hier in der Nähe.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Jedna věc je však docela jasná. Viděl jsem jednoho skřeta v jeskyni. Nedaleko je jedna stará opuštěná skřetí jeskyně, kterou používali pro bohoslužby.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //The Orcs used to bury their dead there, that's why we call this system of caves the Orc cemetery.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Früher haben dort die Orks ihre Verstorbenen beigesetzt, daher nennen wir dieses Höhlensystem den Ork-Friedhof.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Skřeti tam pohřbívali své mrtvé, proto tomu systému jeskyní říkáme Skřetí hřbitov.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //The Guru Baal Lukor has gone there with some templars. Maybe we'll find something there to help us understand the vision.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Der Guru Baal Lukor ist mit einigen Templern dorthin aufgebrochen. Vielleicht finden wir dort etwas, das uns hilft, die Vision besser zu verstehen.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Guru Baal Lukor tam odešel s několika templáři. Možná tam najdeme něco, co by nám pomohlo porozumět té vidině.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //I need somebody to have a look around that place and to report to me about the situation.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Ich brauche jemanden, der dort nach dem Rechten sieht und mir von der Situation berichtet.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Potřebuji, aby se tam někdo porozhlédl a dal mi zprávu o tom, jak se věci mají.
//	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Why don't you go yourself? You are the leader of the templars!
//	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Warum gehst du nicht selber? Du bist doch der Anführer der Templer!
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Proč tam nejdeš sám? Jsi přece vůdce templářů!
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //My task is to protect the Enlightened One. I must stay here with Y'Berion and guard him.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Meine Aufgabe ist es, den Erleuchteten zu schützen. Ich bleibe hier bei Y'Berion und wache über ihn.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Můj úkol je chránit Osvíceného. Musím tu zůstat s Y´Berionem a střežit ho.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //You have done good service for the Camp. I trust you more than anybody else here.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Du hast dem Lager schon große Dienste erwiesen. Ich vertraue dir mehr als jedem anderen hier.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Vykonal jsi pro tábor veliké služby. Věřím ti víc než komukoliv jinému odtud.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //I am asking you to go to the Orc cemetery and report to me what the templars have found.
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Ich bitte dich, gehe zum Ork-Friedhof und berichte mir, was die Templer dort gefunden haben.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Žádám tě, abys šel do Skřetího hřbitova a podal mi zprávu, co tam templáři našli.

	Info_ClearChoices(GUR_1202_CorAngar_SENDS);
//	Info_AddChoice(GUR_1202_CorAngar_SENDS,"What will I get in exchange?", GUR_1202_CorAngar_SENDS_EARN);
//	Info_AddChoice(GUR_1202_CorAngar_SENDS,"Was springt für mich dabei raus?", GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice(GUR_1202_CorAngar_SENDS,"Co dostanu za odměnu?", GUR_1202_CorAngar_SENDS_EARN);
//	Info_AddChoice(GUR_1202_CorAngar_SENDS,"I'll get on my way right now!", GUR_1202_CorAngar_SENDS_KNOW);
//	Info_AddChoice(GUR_1202_CorAngar_SENDS,"Ich mache mich sofort auf den Weg!", GUR_1202_CorAngar_SENDS_KNOW);
	Info_AddChoice(GUR_1202_CorAngar_SENDS,"Ihned se vydám na cestu!", GUR_1202_CorAngar_SENDS_KNOW);
};
func void GUR_1202_CorAngar_SENDS_EARN()
{
//	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //What will I get in exchange?
//	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //Was springt für mich dabei raus?
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //Co dostanu za odměnu?
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //You want ore? It seems my impression of you was wrong after all. But I need you. Here, take 100 ore. You won't get any more!
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Du willst Erz? Anscheinend habe ich mich in dir getäuscht. Aber ich brauche dich. Hier, 100 Erz. Mehr gibt es nicht!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Chceš rudu? Vidím, že jsem se v tobě zmýlil. Ale potřebuju tě. Tady je 100 nugetů. Víc už nedostaneš!
	CreateInvItems(self,ItMiNugget,100);
	B_GiveInvItems(self,hero,ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
//	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //I'll get on my way right now!
//	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Ich mache mich sofort auf den Weg!
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Ihned se vydám na cestu!
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Before you go, take this ring. May it protect you in battle!
//	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Bevor du losgehst, nimm diesen Ring. Er möge dich im Kampf schützen!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Ještě než odejdeš, vezmi si tenhle prsten. Ochrání tě v boji!

	B_Story_GotoOrcGraveyard();

	CreateInvItem(self,Schutzring_Geschosse1);
	B_GiveInvItems(self,hero,Schutzring_Geschosse1,1);
	Info_ClearChoices(GUR_1202_CorAngar_SENDS);
};

instance GUR_1202_CorAngar_WHERE(C_INFO)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_WHERE_Condition;
	information = GUR_1202_CorAngar_WHERE_Info;
	important = 0;
	permanent = 0;
//	description = "Where is the Orc cemetery?";
//	description = "Wo ist der Ork Friedhof?";
	description = "Kde je Skřetí hřbitov?";
};

func int GUR_1202_CorAngar_WHERE_Condition()
{
	if (Npc_KnowsInfo(hero,GUR_1202_CorAngar_SENDS))
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_WHERE_Info()
{
//	AI_Output(other,self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Where is the Orc cemetery?
//	AI_Output(other,self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Wo ist der Ork-Friedhof?
	AI_Output(other,self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Kde je Skřetí hřbitov?
//	AI_Output(self,other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Not far from here. The novice Talas knows the way. You'll find him in the temple courtyard. He'll guide you there.
//	AI_Output(self,other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Nicht weit von hier. Der Novize Talas kennt den Weg. Du findest ihn unten auf dem Vorplatz des Tempels. Er wird dich dort hinführen.
	AI_Output(self,other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Nedaleko odtud. Novic Talas zná cestu. Najdeš ho na dvoře u chrámu. Dovede tě tam.

//	B_LogEntry(CH3_OrcGraveyard,"The novice Talas will show me the way to the Orc cemetery. He's waiting for me at the temple forecourt.");
//	B_LogEntry(CH3_OrcGraveyard,"Der Novize Talas wird mir den Weg zum Ork-Friedhof zeigen. Er wartet auf dem Tempelvorplatz auf mich.");
	B_LogEntry(CH3_OrcGraveyard,"Novic Talas mi ukáže cestu k Skřetímu hřbitovu. Počká na mě na nádvoří chrámu.");
};

// **************************************************************************
// 				nach dem Ork-Friedhof
// **************************************************************************
instance GUR_1202_CorAngar_AFTER(C_INFO)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_AFTER_Condition;
	information = GUR_1202_CorAngar_AFTER_Info;
	important = 0;
	permanent = 0;
//	description = "I've been to the Orc cemetery.";
//	description = "Ich war im Ork Friedhof";
	description = "Byl jsem na Skřetím hřbitově.";
};

func int GUR_1202_CorAngar_AFTER_Condition()
{
	if (BaalLukor_BringParchment == 4)
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_AFTER_Info()
{
//	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //I've been to the Orc cemetery. There was NOTHING THERE. No Sleeper, no sign, no nothing.
//	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //Ich war im Ork-Friedhof. Dort gibt es NICHTS. Keinen Schläfer, kein Zeichen, gar nichts.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //Byl jsem na Skřetím hřbitově. Není TAM NIC. Žádný Spáč, žádné znamení, prostě nic.
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //What about Baal Lukor and the templars?
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //Was ist mit Baal Lukor und den Templern?
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //A co Baal Lukor a templáři?
//	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //They're all dead.
//	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Sie sind alle tot.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Všichni jsou mrtví.
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Dead? But why, what happened?
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Tot? Aber warum, was ist dort vorgefallen?
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Mrtví? Ale proč, jak se to stalo?
//	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //The entire cave system is teeming with Orcs. They killed all of the templars.
//	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //Im gesamten Höhlensystem wimmelte es von Orks. Sie haben alle Templer getötet.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //Celý jeskynní systém se hemží skřety. Zabili všechny templáře.
//	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Baal Lukor and myself survived, but suddenly Baal Lukor went mad.
//	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Baal Lukor und ich, wir haben überlebt, aber auf einmal drehte Baal Lukor völlig durch.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Baal Lukor a já jsme přežili, ale Lukor znenadání zešílel.
//	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //He screamed that the Sleeper had ordered him to kill me, and he intended to obey this order.
//	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Er schrie, der Schläfer hätte ihm befohlen, mich zu töten, und das wollte er dann auch tun.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Vykřikoval, že mu Spáč nařídil, aby mě zabil a chystal se svůj rozkaz splnit.
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //It would appear he couldn't handle the fact that he hadn't found anything.
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Offensichtlich kam er mit der großen Enttäuschung, nichts gefunden zu haben, nicht zurecht.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Vypadalo to, že se nemůže smířit s tím, že nic nenašel.
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //I don't believe that the influence of the Sleeper can cause such violent deeds.
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Ich glaube nicht, dass der Einfluss des Schläfers solch grausame Taten verursacht.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Nemůžu uvěřit, že by Spáčův vliv mohl vést k takovýmhle násilným činům.
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //It cannot... cannot... IRRELEVANT!
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //Es darf nicht ... darf nicht ... EGAL!
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //To nemůže být... nemůže být... JEN TAK!
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //The most important thing is that Baal Lukor did not succeed in his madness.
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Die Hauptsache ist, dass Baal Lukor in seinem Wahn keinen Erfolg hatte.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Nejdůležitější ale je, že se to Baal Lukorovi v jeho šílenství nepodařilo.
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Y'Berion is our only hope now.
//	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Y'Berion ist nun unsere einzige Hoffnung.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Y´Berion je teď naše jediná naděje.

	B_GiveXP(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};

// **************************************************************************
// 				MISSION: Find Herb
// **************************************************************************
instance Info_CorAngar_FindHerb(C_INFO)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_FindHerb_Condition;
	information = Info_CorAngar_FindHerb_Info;
	permanent = 0;
	important = 0;
//	description = "How is Y'Berion doing?";
//	description = "Wie steht es um Y'Berion?";
	description = "Co je s Y´Berionem?";
};

func int Info_CorAngar_FindHerb_Condition()
{
	if (Npc_KnowsInfo(hero,GUR_1202_CorAngar_AFTER))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_Info()
{
//	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //How is Y'Berion doing?
//	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Wie steht es um Y'Berion?
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Co je s Y´Berionem?
//	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //He won't wake of his own accord. And he is growing weaker and weaker. I know how to wake him up, but I need your help.
//	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Er wird nicht von alleine erwachen. Und er wird immer schwächer. Ich weiß, wie ich ihn wachbekommen kann, aber dazu brauche ich deine Hilfe.
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Nedokáže se sám probudit. Je stále slabší a slabší. Vím, jak ho probudit, ale potřebuji tvou pomoc.
//	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //What do you want me to do?
//	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Was ist zu tun?
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Co mám udělat?
//	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Get me the healing herbs from the swamp. Five of the strongest kind should be sufficient!
//	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Besorge mir die Heilkräuter aus dem Sumpf. Fünf von der stärksten Sorte sollten genügen!
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Přines mi z bažin léčivé byliny. Pět nejsilnějších druhů by mělo stačit!
//	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Please hurry!
//	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Und bitte beeile dich!
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //A prosím pospěš si!
	AI_StopProcessInfos(self);
	CorAngar_FindHerb = LOG_RUNNING;

	Log_CreateTopic(CH3_FindHerbs,LOG_MISSION);
	Log_SetTopicStatus(CH3_FindHerbs,LOG_RUNNING);
//	B_LogEntry(CH3_FindHerbs,"Y'Berion is still unconscious. Cor Angar asked me to collect five medical herbs of the strongest kind.");
//	B_LogEntry(CH3_FindHerbs,"Y'Berion liegt immer noch im Koma. Cor Angar bat mich, fünf Heilkräuter der stärksten Sorte zu sammeln.");
	B_LogEntry(CH3_FindHerbs,"Y´Berion je stále v bezvědomí. Cor Angar mě požádal, abych nasbíral pět nejsilnějších léčivých bylin.");
};

// ---------------------------- FindHerb - WHERE ---------------------------------------
instance Info_CorAngar_FindHerb_WHERE(C_INFO)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_WHERE_Condition;
	information = Info_CorAngar_FindHerb_WHERE_Info;
	permanent = 0;
	important = 0;
//	description = "Where can I find these plants?";
//	description = "Wo findet man solche Pflanzen ?";
	description = "Kde najdu ty byliny?";
};

func int Info_CorAngar_FindHerb_WHERE_Condition()
{
	if ((CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_WHERE_Info()
{
//	AI_Output(other,self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Where can I find these plants?
//	AI_Output(other,self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Wo findet man solche Pflanzen ?
	AI_Output(other,self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Kde najdu ty byliny?
//	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Search for them in the swamp behind the Camp. You need to go very deep into it, but mind the swampsharks don't get you.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Suche im Sumpf hinter dem Lager. Du musst sehr tief hineingehen aber pass auf, dass dich die Sumpfhaie nicht erwischen.
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Hledej je v bažinách za táborem. Musíš pro ně jít hluboko do močálu, ale dávej pozor, ať tě nedostanou močáloví žraloci.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_03"); //And now don't waste my time. Go!
//	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_03"); //Und jetzt verliere nicht noch mehr Zeit. Geh!
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_03"); //A teď už se nezdržuj. Běž!
	AI_StopProcessInfos(self);

//	B_LogEntry(CH3_FindHerbs,"The required medical herbs for Y'Berion grow deep in the swamp behind the camp of the Brotherhood. The dangerous swampsharks are there as well, though. I'll need to keep my eyes peeled.");
//	B_LogEntry(CH3_FindHerbs,"Die benötigten Heilkräuter für Y'Berion wachsen tief im Sumpf hinter dem Lager der Bruderschaft. Allerdings gibt es dort die gefährlichen Sumpfhaie. Ich muss die Augen offen halten.");
	B_LogEntry(CH3_FindHerbs,"Léčivé byliny na lék pro Y´Beriona rostou hluboko v bažinách za táborem Bratrstva. Jsou tam také nebezpeční močáloví žraloci. Musím si na ně dát pozor.");
};

// ---------------------------- FindHerb - LOOK ---------------------------------------
instance Info_CorAngar_FindHerb_LOOK(C_INFO)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_LOOK_Condition;
	information = Info_CorAngar_FindHerb_LOOK_Info;
	permanent = 0;
	important = 0;
//	description = "How will I recognize these herbs?";
//	description = "Wie kann ich diese Kräuter erkennen?";
	description = "Jak ty byliny poznám?";
};

func int Info_CorAngar_FindHerb_LOOK_Condition()
{
	if ((CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_LOOK_Info()
{
//	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01"); //How will I recognize these herbs?
//	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Wie kann ich diese Kräuter erkennen?
	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Jak ty byliny poznám?
//	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_02"); //They look like a star with eight green and orange leaves.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Sie sehen aus wie ein Stern und tragen acht grüne und orangefarbene Blätter.
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Vypadají jako hvězdy s osmi zelenými a oranžovými cípy.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_03"); //On your way now.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_03"); //Nun geh aber los.
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_03"); //A teď se vydej na cestu.
	AI_StopProcessInfos(self);

//	B_LogEntry(CH3_FindHerbs,"The medical herbs look like a star with four green and four orange leaves.");
//	B_LogEntry(CH3_FindHerbs,"Die Heilkräuter sehen aus wie ein Stern mit vier grünen und vier orangefarbenen Blättern.");
	B_LogEntry(CH3_FindHerbs,"Léčivé byliny vypadají jako hvězdice s čtyřmi zelenými a čtyřmi oranžovými listy.");
};

// ---------------------------- RUNNING ---------------------------------------
instance Info_CorAngar_FindHerb_Running(C_INFO)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_Running_Condition;
	information = Info_CorAngar_FindHerb_Running_Info;
	permanent = 1;
	important = 0;
//	description = "I haven't found enough healing herbs yet.";
//	description = "Ich habe noch nicht genug Heilkräuter gefunden";
	description = "Ještě jsem nenašel dost léčivých bylin.";
};

func int Info_CorAngar_FindHerb_Running_Condition()
{
	if (CorAngar_FindHerb==LOG_RUNNING)
	&& (Npc_HasItems(other,ItFo_Plants_Herb_03)<5)
	&& Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE)
	&& Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK)
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_Running_Info()
{
//	AI_Output(other,self,"Info_CorAngar_FindHerb_Running_15_01");//I haven't found enough healing herbs yet.
//	AI_Output(other,self,"Info_CorAngar_FindHerb_Running_15_01");//Ich habe noch nicht genug Heilkräuter gefunden
	AI_Output(other,self,"Info_CorAngar_FindHerb_Running_15_01");//Ještě jsem nenašel léčivých bylin dost.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");//Maybe Fortuno, the herbs trader, has some in stock.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");//Vielleicht hat auch Fortuno, der Kräuterhändler, zurzeit einige davon in seinen Regalen.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");//Možná má nějaké na skladě Fortuno, obchodník s bylinkami.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_03");//Hurry. I need five of them. Y'Berion doesn't have much time left.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_03");//Beeil dich. Ich brauche fünf Stück. Y'Berion bleibt nicht mehr viel Zeit.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_03");//Pospěš si. Potřebuji jich pět. Y´Berion ztratil příliš času.
	AI_StopProcessInfos(self);

	//-------- Fortuno die Kräuter "unterschieben" --------
	if (!Fortuno_HasYBerionHerbs)
	{
		var C_NPC fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems(fortuno, ItFo_Plants_Herb_03, 5);

		Fortuno_HasYBerionHerbs = TRUE;
//		B_LogEntry(CH3_FindHerbs,"Fortuno, the herb trader of the Brotherhood, might have such medical herbs.");
//		B_LogEntry(CH3_FindHerbs,"Fortuno der Kräuterhändler der Bruderschaft könnte solche Heilkräuter haben.");
		B_LogEntry(CH3_FindHerbs,"Fortuno, obchodník s bylinkami z Bratrstva, by takové byliny mohl mít.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
instance Info_CorAngar_FindHerb_Success(C_INFO)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_FindHerb_Success_Condition;
	information = Info_CorAngar_FindHerb_Success_Info;
	permanent = 0;
//	description = "I have the healing herbs for Y'Berion.";
//	description = "Ich habe die Heilkräuter für Y'Berion.";
	description = "Mám léčivé byliny pro Y´Beriona.";
};

func int Info_CorAngar_FindHerb_Success_Condition()
{
	if (Npc_HasItems(other,ItFo_Plants_Herb_03) >= 5) && (CorAngar_FindHerb == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Info_CorAngar_FindHerb_Success_Info()
{
//	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_01"); //I have the healing herbs for Y'Berion.
//	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_01"); //Ich habe die Heilkräuter für Y'Berion.
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_01"); //Mám léčivé byliny pro Y´Beriona.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02"); //Well done. Y'Berion woke up for a short time while you were out.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02"); //Gut gemacht. Als du unterwegs warst, ist Y'Berion kurzzeitig erwacht.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02"); //Výborně. Zatímco jsi byl pryč, Y´Berion na chvilku procitl.
//	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03"); //Did he say anything?
//	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03"); //Hat er was gesagt?
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03"); //Říkal něco?
//	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04"); //Yes, he said that the Sleeper is not what we think he is. We must try not to awaken him again.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04"); //Ja, er sagte, das der Schläfer nicht der ist, für den wir ihn halten. Wir dürfen nicht weiter versuchen, ihn zu erwecken.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04"); //Ano, říkal, že Spáč není to, co si myslíme. Nesmíme se ho znovu pokoušet probudit.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05"); //All we can do is hope that it is not too late for Y'Berion.
//	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05"); //Jetzt können wir nur noch hoffen, das es noch nicht zu spät für Y'Berion ist.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05"); //Vše, co teď můžeme dělat, je doufat, že pro Y´Beriona není ještě moc pozdě.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems(other,self,ItFo_Plants_Herb_03, 5);
	Npc_RemoveInvItems(self,ItFo_Plants_Herb_03, 5);
	B_GiveXP(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;

//	B_LogEntry(CH3_FindHerbs,"I've given Cor Angar enough medical herbs. Now we can only hope that we're not too late.");
//	B_LogEntry(CH3_FindHerbs,"Ich habe Cor Angar ausreichend der dringend benötigten Heilkräuter übergeben. Jetzt können wir nur noch hoffen, dass ich nicht zu spät kam.");
	B_LogEntry(CH3_FindHerbs,"Dodal jsem Cor Angarovi dostatek léčivých bylin. Teď můžeme jen doufat, že nebylo příliš pozdě.");
	Log_SetTopicStatus(CH3_FindHerbs,LOG_SUCCESS);

	//-------- Versuch YBerion zu heilen... --------
	var C_NPC YBerion; YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	AI_Wait(self,1);
	AI_GotoNpc(self,YBerion);
	AI_TurnToNpc(self,YBerion);
	AI_PlayAni (self,"T_PLUNDER");
	AI_WaitTillEnd (self,YBerion);
	//YBerion.attribute[ATR_HITPOINTS] = 0;
	//AI_StartState(YBerion, ZS_Dead, 0, "");

	//-------- ...scheitert. YBerion ist tot --------
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION IS DEAD. Our spiritual leader has left us!
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION IST TOT. Unser geistiger Anführer ist von uns gegangen!
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y´BERION JE MRTEV. Náš duchovní vůdce nás opustil.
	AI_TurnToNpc(self,other);
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Even your quick help could not prevent his death!
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Selbst deine schnelle Hilfe konnte seinen Tod nicht mehr verhindern!
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Ani tvoje rychlá pomoc ho nestačila zachránit.
//	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //What now, Cor Angar?
//	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //Was jetzt, Cor Angar?
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //A co teď, Cor Angare?
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //I have always trusted Y'Berion. Shortly before he died, he placed all his hopes on the escape plan of the Magicians of Water.
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Ich habe Y'Berion immer vertraut. Kurz bevor er starb, legte er all seine Hoffnungen in den Ausbruchsplan der Wassermagier.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Vždycky jsem Y´Berionovi věřil. Krátce před svou smrtí upínal všechny své naděje na plán útěku mágů Vody.
//	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Then we should support the Magicians of Water in their plan.
//	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Dann sollten wir die Wassermagier bei ihrem Vorhaben unterstützen.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Pak bychom měli mágům Vody s jejich plánem pomoci.
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //They'll need the focus and the almanac. Both things are still in Cor Kalom's possession.
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Sie werden den Fokus und den Almanach benötigen. Beides befindet sich noch in Cor Kaloms Besitz.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Budou potřebovat ohnisko a almanach. Obě věci jsou stále majetkem Cor Kaloma.
//	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //Where is Cor Kalom?
//	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //Wo ist Cor Kalom?
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //Kde je Cor Kalom?
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //In a rage, he set out with a couple of templars to find his own way to the Sleeper.
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //Er ist mit einigen Templern völlig zornerfüllt aufgebrochen, um einen eigenen Weg zum Schläfer zu finden.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //V hněvu se vydal s několika templáři svou vlastní cestou ke Spáčovi.
//	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Damn, how can we get the focus now?
//	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Verdammt, wie sollen wir jetzt an den Fokus kommen?
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Sakra, jak teď to ohnisko dostaneme?
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //I believe he left the book and focus in his laboratory. Here is the key for the chest.
//	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Ich schätze, er ließ Buch und Fokus in seinem Labor zurück. Hier ist der Schlüssel für seine Truhe.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Myslím, že to ohnisko i almanach nechal ve své laboratoři. Tady je klíč k té truhle.

	CreateInvItem(self,ITKE_PSI_KALOM_01);
	B_GiveInvItems(self,other,ITKE_PSI_KALOM_01,1);
};

// ------------------------------ TELEPORT ----------------------------------
instance Info_CorAngar_TELEPORT(C_INFO)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_TELEPORT_Condition;
	information = Info_CorAngar_TELEPORT_Info;
	permanent = 0;
	important = 1;
};

func int Info_CorAngar_TELEPORT_Condition()
{
	if Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success)
	{
		return TRUE;
	};
};

func void Info_CorAngar_TELEPORT_Info()
{
	AI_GotoNpc(self,hero);
//	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01"); //One moment!
//	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01"); //Einen Moment noch!
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01"); //Ještě moment!
//	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_02"); //Yes?
//	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_02"); //Ja?
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_02"); //Ano?
//	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03"); //Take this rune of magic as a sign of our gratitude for your great deeds.
//	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03"); //Nimm diese Zauberrune als Zeichen unseres Dankes für deine großen Taten.
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03"); //Vezmi si tuhle magickou runu jako vyjádření našeho vděku za tvoje velké činy.
//	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_04"); //This will allow you to teleport fast and easily to the courtyard of our temple whenever the need arises.
//	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_04"); //Damit kannst du dich jederzeit schnell und bequem auf unseren Tempelvorplatz teleportieren.
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_04"); //S pomocí této runy se snadno a rychle přeneseš do chrámového dvora, kdykoliv budeš potřebovat.
//	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05"); //Thank you!
//	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05"); //Ich danke dir!
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05"); //Děkuju!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC();
};

