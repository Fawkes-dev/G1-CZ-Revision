// *****************************
//				EXIT
// *****************************

instance DIA_TPL_1402_GorNaToth_Exit(C_INFO)
{
	npc = TPL_1402_GorNaToth;
	nr = 999;
	condition = DIA_TPL_1402_GorNaToth_Exit_Condition;
	information = DIA_TPL_1402_GorNaToth_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_TPL_1402_GorNaToth_Exit_Condition()
{
	return 1;
};

func void DIA_TPL_1402_GorNaToth_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// *****************************
//			Abweisend
// *****************************
instance DIA_GorNaToth_Abweisend(C_INFO)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = DIA_GorNaToth_Abweisend_Condition;
	information = DIA_GorNaToth_Abweisend_Info;
	important = 0;
	permanent = 1;
//	description = "Can you train me?";
//	description = "Kannst du mich trainieren?";
	description = "Můžeš mě cvičit?";
};

func int DIA_GorNaToth_Abweisend_Condition()
{
	if ((!Npc_KnowsInfo(hero,DIA_GorNaToth_AngarTalked))
	&& (!C_NpcBelongsToPsiCamp(hero)))
	{
		return 1;
	};

	return 0;
};

func void DIA_GorNaToth_Abweisend_Info()
{
//	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_15_00"); //Can you train me?
//	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_15_00"); //Kannst du mich trainieren?
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_15_00"); //Můžeš mě cvičit?
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_01"); //Out of my sight, unworthy one. I instruct only the Sleeper's templars.
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_01"); //Geh mir aus den Augen, Unwürdiger. Ich trainiere nur die Templer des Schläfers.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_01"); //Jdi mi z očí, ty nemehlo. Cvičím jen Spáčovy templáře.
	AI_StopProcessInfos(self);
};

// *****************************
//			AngarTalked
// *****************************

instance DIA_GorNaToth_AngarTalked(C_INFO)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = DIA_GorNaToth_AngarTalked_Condition;
	information = DIA_GorNaToth_AngarTalked_Info;
	important = 1;
	permanent = 0;
};

func int DIA_GorNaToth_AngarTalked_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer))
	{
		return 1;
	};

	return 0;
};

func void DIA_GorNaToth_AngarTalked_Info()
{
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_00"); //Cor Angar has spoken to you? What did he say?
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_00"); //Cor Angar hat mit dir geredet? Was hat er gesagt?
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_00"); //Mluvil s tebou Cor Angar? Co říkal?
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
//	Info_AddChoice(DIA_GorNaToth_AngarTalked,"He says you'd be unworthy of wearing the armor of a templar.",DIA_GorNaToth_AngarTalked_Unworthy);
//	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Er hat gesagt, du seist unwürdig, die Rüstung eines Templers zu tragen.",DIA_GorNaToth_AngarTalked_Unworthy);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Říká, že nejsi hoden nosit templářskou zbroj.",DIA_GorNaToth_AngarTalked_Unworthy);
//	Info_AddChoice(DIA_GorNaToth_AngarTalked,"He said he never liked the swampsharks.",DIA_GorNaToth_AngarTalked_Shark);
//	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Er sagte, die Sumpfhaie habe er noch nie leiden können.",DIA_GorNaToth_AngarTalked_Shark);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Říkal, že vždycky nesnášel močálové žraloky.",DIA_GorNaToth_AngarTalked_Shark);
//	Info_AddChoice(DIA_GorNaToth_AngarTalked,"He said I should come back as soon as I'm a templar.",DIA_GorNaToth_AngarTalked_Normal);
//	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Er hat gesagt, ich soll wiederkommen, wenn ich Templer bin.",DIA_GorNaToth_AngarTalked_Normal);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Říkal, že se mám vrátit, jakmile se stanu templářem.",DIA_GorNaToth_AngarTalked_Normal);
};

func void DIA_GorNaToth_AngarTalked_Normal()
{
//	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Normal_15_00"); //He said I should come back as soon as I'm a templar.
//	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Normal_15_00"); //Er hat gesagt, ich soll wiederkommen, wenn ich Templer bin.
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Normal_15_00"); //Říkal, že se mám vrátit, jakmile se stanu templářem.
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_01"); //It would appear he has a high opinion of you. He never speaks to anybody.
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_01"); //Er scheint sehr viel von dir zu halten. Er redet so gut wie nie mit jemandem.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_01"); //To by znamenalo, že má o tobě vysoké mínění. To neříká každému.
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_02"); //It is an honor even to be noticed by him. The last time he spoke to ME was about two months ago.
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_02"); //Es ist eine große Ehre für dich, dass er dich überhaupt bemerkt hat. Mit MIR hat er das letzte Mal vor zwei Monaten geredet.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_02"); //Je čest, když si někoho vůbec všimne. Ke MNĚ naposledy promluvil asi před dvěma měsíci.
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Shark()
{
//	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Shark_15_00"); //He said he never liked the swampsharks.
//	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Shark_15_00"); //Er sagte, die Sumpfhaie habe er noch nie leiden können.
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Shark_15_00"); //Říkal, že vždycky nesnášel močálové žraloky.
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_01"); //What...? A holy task is waiting for me!
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_01"); //Was ...? (bestimmt) Eine heilige Aufgabe erwartet mich!
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_01"); //Cože...? (rozhodně) Čeká na mě svatý úkol.
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_02"); //My master's wish is my command.
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_02"); //Der Wunsch meines Meisters ist mir Befehl.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_02"); //Přání mého pána je mi rozkazem.
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Unworthy()
{
//	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00"); //He says you'll be unworthy of wearing the armor of a templar.
//	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00"); //Er hat gesagt, du seiest unwürdig, die Rüstung eines Templers zu tragen.
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00"); //Říká, že nejsi hoden nosit templářskou zbroj.
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01"); //Never! He could not have said that! Not about ME!
//	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01"); //Niemals! Das hat er nicht gesagt! Nicht über MICH!
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01"); //Nikdy! To by neřekl! Ne o MNĚ!
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

//-------------------------------------------------------
// AUFNAHME BEI DEN TEMPLERN
//-------------------------------------------------------
instance TPL_1402_GorNaToth_GETSTUFF(C_INFO)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_GETSTUFF_Condition;
	information = TPL_1402_GorNaToth_GETSTUFF_Info;
	important = 0;
	permanent = 0;
//	description = "I'd like to collect my templar's armor.";
//	description = "Ich möchte meine Templer-Rüstung abholen.";
	description = "Chtěl bych si vzít svoji templářskou zbroj.";
};

func int TPL_1402_GorNaToth_GETSTUFF_Condition()
{
	if ((Npc_KnowsInfo(hero,GUR_1202_CorAngar_WANNABETPL))
	&& (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		return 1;
	};

	return 0;
};

func void TPL_1402_GorNaToth_GETSTUFF_Info()
{
//	AI_Output(other,self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01"); //I'd like to collect my templar's armor.
//	AI_Output(other,self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01"); //Ich möchte meine Templer-Rüstung abholen.
	AI_Output(other,self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01"); //Chtěl bych si vzít svoji templářskou zbroj.
//	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02"); //I'm delighted to have the honor of handing our armor to the man who found the minecrawler eggs.
//	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02"); //Es ist mir eine Freude, dem Mann eine von unseren Rüstungen zu überreichen, der die Eier der Minecrawler gefunden hat.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02"); //Je mi potěšením mít tu čest předat naši zbroj muži, který našel vajíčka důlních červů.
//	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03"); //May this armor protect you, as the Sleeper protects the Brotherhood!
//	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03"); //Diese Rüstung soll dich schützen, so wie der Schläfer die Bruderschaft schützt!
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03"); //Ať tě tahle zbroj ochraňuje tak, jako Spáč chrání Bratrstvo!

//	B_LogEntry(GE_BecomeTemplar,"Gor Na Toth gave me my first templars' armor. Now I'm a proper member of the warrior clan!");
//	B_LogEntry(GE_BecomeTemplar,"Gor Na Toth überreichte mir meine erste Templer-Rüstung. Nun bin ich ein vollwertiges Mitglied dieser Kriegergemeinschaft!");
	B_LogEntry(GE_BecomeTemplar,"Gor Na Toth mi předal moji první templářskou zbroj. Právě jsem se stal řádným členem společenství bojovníků!");

	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
//	B_LogEntry(GE_TraderPSI,"Gor Na Toth has a better templar's ARMOR available. But in return he expects a generous donation to the Brotherhood. During the daytime, he's on the training ground.");
//	B_LogEntry(GE_TraderPSI,"Gor Na Toth verteilt bessere Templer-RÜSTUNGEN. Dafür erwarteter allerdings eine großzügige Spende an die Bruderschaft. Er ist tagsüber auf dem Übungsplatz der Templer zu finden.");
	B_LogEntry(GE_TraderPSI,"Gor Na Toth má k dispozici lepší templářskou ZBROJ. Výměnou očekává velkorysý dar pro Bratrstvo. Přes den ho najdu na cvičišti.");

	CreateInvItem(hero,TPL_ARMOR_L);

	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);

	AI_EquipBestArmor(hero);
};

/*------------------------------------------------------------------------
//							ARMOR
------------------------------------------------------------------------*/
instance TPL_1402_GorNaToth_ARMOR(C_INFO)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_ARMOR_Condition;
	information = TPL_1402_GorNaToth_ARMOR_Info;
	important = 0;
	permanent = 1;
//	description = "I need better armor.";
//	description = "Ich brauche eine bessere Rüstung.";
	description = "Potřebuju lepší zbroj.";
};

func int TPL_1402_GorNaToth_ARMOR_Condition()
{
	if (Npc_KnowsInfo(hero,TPL_1402_GorNaToth_GETSTUFF))
	{
		return 1;
	};

	return 0;
};

func void TPL_1402_GorNaToth_ARMOR_Info()
{
//	AI_Output(other,self,"Info_GorNaToth_ARMOR_15_01"); //I need better armor.
//	AI_Output(other,self,"Info_GorNaToth_ARMOR_15_01"); //Ich brauche eine bessere Rüstung.
	AI_Output(other,self,"Info_GorNaToth_ARMOR_15_01"); //Potřebuji lepší zbroj.
//	AI_Output(self,other,"Info_GorNaToth_ARMOR_11_02"); //I could give you better armor, but you must make a generous contribution to the Brotherhood!
//	AI_Output(self,other,"Info_GorNaToth_ARMOR_11_02"); //Ich könnte dir eine bessere Rüstung zuteilen, doch dafür musst du einen großzügigen Beitrag an die Bruderschaft spenden!
	AI_Output(self,other,"Info_GorNaToth_ARMOR_11_02"); //Mohl bych ti přidělit lepší zbroj, ale musíš poskytnout Bratrstvu velkorysý příspěvek.

	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR, DIALOG_BACK , TPL_1402_GorNaToth_ARMOR_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR, B_BuildBuyArmorString(NAME_GorNaTothHeavyTpl,VALUE_TPL_ARMOR_H),TPL_1402_GorNaToth_ARMOR_H);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR, B_BuildBuyArmorString(NAME_GorNaTothTpl,VALUE_TPL_ARMOR_M), TPL_1402_GorNaToth_ARMOR_M);
};

func void TPL_1402_GorNaToth_ARMOR_M()
{
//	AI_Output(hero,self,"Info_GorNaToth_ARMOR_M_15_01"); //I'd like to have the medium templar's armor.
//	AI_Output(hero,self,"Info_GorNaToth_ARMOR_M_15_01"); //Ich möchte eine mittelschwere Templer-Rüstung haben.
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_M_15_01"); //Chtěl bych střední templářskou zbroj.

	if (Kapitel < 3)
	{
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_02"); //You're not experienced enough! Prove your worth as a templar, then you'll earn the right to wear better armor.
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_02"); //Du bist noch nicht so weit! Bewähre dich erst als Templer, dann wirst dir auch das Recht zuteil, eine bessere Rüstung zu tragen.
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_02"); //Ještě nemáš dost zkušeností! Prokaž svou vážnost jako templář, tím získáš právo nosit lepší zbroj.
	}
	else if (Npc_HasItems(hero,ItMiNugget) < VALUE_TPL_ARMOR_M)
	{
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_03"); //As soon as you are able to make a sufficient donation to our community, you shall have better armor!
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_03"); //Sobald du in der Lage bist, eine ausreichend große Spende an unsere Gemeinschaft zu leisten, steht dir eine bessere Rüstung zur Verfügung!
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_03"); //Jakmile budeš schopen naší komunitě poskytnout dostatečně veliký dar, budeš mít lepší zbroj!
	}
	else
	{
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_04"); //Now that you're able to make the donation, you'll be protected by new armor.
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_04"); //Nun, da du in der Lage bist, die erforderliche Spende zu leisten, sollst du fortan von einer neuen Rüstung geschützt werden.
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_04"); //Teď, když jsi schopen poskytnout dostatečně veliký dar, budeš chráněn novou zbrojí.
		B_GiveInvItems(hero,self,ItMiNugget, VALUE_TPL_ARMOR_M);

		CreateInvItem(hero,TPL_ARMOR_M);

		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);

		AI_EquipBestArmor(hero);
	};

	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_H()
{
//	AI_Output(hero,self,"Info_GorNaToth_ARMOR_H_15_01"); //I'd like to have a heavy templar's armor.
//	AI_Output(hero,self,"Info_GorNaToth_ARMOR_H_15_01"); //Ich möchte eine schwere Templer-Rüstung haben.
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_H_15_01"); //Rád bych těžkou templářskou zbroj.

	if (Kapitel < 4)
	{
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_02"); //You're not experienced enough! Prove your worth as a member of our community, then you'll be allowed to wear such exquisite armor.
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_02"); //Du bist noch nicht so weit! Bewähre dich erst noch weiter für unsere Gemeinschaft, dann wirst dir auch das Recht zuteil, solch eine erlesene Rüstung zu tragen.
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_02"); //Ještě nemáš dost zkušeností! Prokaž svou vážnost jako člen našeho společenství, tím získáš právo nosit takovou krásnou zbroj.
	}
	else if (Npc_HasItems(hero,ItMiNugget) < VALUE_TPL_ARMOR_H)
	{
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_03"); //Meanwhile, you have earned the right to wear such armor, but at the moment you're not able to make the sufficient donation to the community!
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_03"); //Du hast dir mittlerweile das Recht verdient, einen solchen Panzer zu tragen, doch du bist zurzeit nicht in der Lage, eine ausreichende Spende an die Gemeinschaft zu leisten!
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_03"); //Získal jsi právo nosit tuto zbroj, ale v tomto okamžiku nejsi schopen poskytnout komunitě příslušný dar.
	}
	else
	{
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_04"); //From now on, wear this armor as a sign of the highest honor!
//		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_04"); //Trage diese Rüstung fortan als Zeichen der höchsten Ehre!
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_04"); //Nos tuto zbroj jako znamení nejvyšší cti!

		B_GiveInvItems(hero,self,ItMiNugget,VALUE_TPL_ARMOR_H);

		CreateInvItem(self,ItAmArrow); //SN: Kronkelgegenstand, damit die Bildschrimausgabe "1 Gegenstand erhalten" stimmt (Rüstung geht nicht, da dann immer Gor Na Toth seine eigene erst auszieht, und eine Sekunde nackt dasteht)
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);

		CreateInvItem(hero,TPL_ARMOR_H);
		AI_EquipBestArmor(hero);
	};

	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_BACK()
{
//	AI_Output(hero,self,"Info_GorNaToth_ARMOR_BACK_15_01"); //I changed my mind!
//	AI_Output(hero,self,"Info_GorNaToth_ARMOR_BACK_15_01"); //Ich hab' es mir anders überlegt!
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_BACK_15_01"); //Rozmyslel jsem se!
//	AI_Output(self,hero,"Info_GorNaToth_ARMOR_BACK_11_02"); //Whatever you want. You know where to find me!
//	AI_Output(self,hero,"Info_GorNaToth_ARMOR_BACK_11_02"); //Wie du meinst. Du weißt, wo du mich findest!
	AI_Output(self,hero,"Info_GorNaToth_ARMOR_BACK_11_02"); //Jak chceš. Víš, kde mě najdeš!

	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};

//---------------------------------------------------------------
//	 						STR + DEX
//---------------------------------------------------------------

instance TPL_1402_GorNaToth_Teach(C_INFO)
{
	npc = TPL_1402_GorNaToth;
	nr = 10;
	condition = TPL_1402_GorNaToth_Teach_Condition;
	information = TPL_1402_GorNaToth_Teach_Info;
	important = 0;
	permanent = 1;
//	description = "Can you train me?";
//	description = "Kannst du mich trainieren?";
	description = "Můžeš mě cvičit?";
};

func int TPL_1402_GorNaToth_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))
	{
		return 1;
	};

	return 0;
};

func void TPL_1402_GorNaToth_Teach_Info()
{
//	AI_Output(other,self,"TPL_1402_GorNaToth_Teach_15_00"); //Can you train me?
//	AI_Output(other,self,"TPL_1402_GorNaToth_Teach_15_00"); //Kannst du mich trainieren?
	AI_Output(other,self,"TPL_1402_GorNaToth_Teach_15_00"); //Můžeš mě cvičit?
//	AI_Output(self,other,"TPL_1402_GorNaToth_Teach_11_01"); //Strength and dexterity are as important as the power of the mind.
//	AI_Output(self,other,"TPL_1402_GorNaToth_Teach_11_01"); //Stärke und Geschicklichkeit sind ebenso wichtig wie geistige Kraft.
	AI_Output(self,other,"TPL_1402_GorNaToth_Teach_11_01"); //Síla a obratnost jsou zrovna tak důležité jako duchovní síla.

	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK ,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);

	if (log_gornatothtrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
//		B_LogEntry(GE_TeacherPSI,"The templar Gor Na Toth can help me to improve my STRENGTH, DEXTERITY and MANA.");
//		B_LogEntry(GE_TeacherPSI,"Der Templer Gor Na Toth kann mir helfen, meine STÄRKE, mein GESCHICK und mein MANA zu verbessern.");
		B_LogEntry(GE_TeacherPSI,"Templář Gor Na Toth mi může pomoci zvýšit moji SÍLU, OBRATNOST a MAGICKOU ENERGII.");
		log_gornatothtrain = TRUE;
	};
};

func void TPL_1402_GorNaToth_Teach_BACK()
{
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
};

func void TPL_1402_GorNaToth_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK ,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK ,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK ,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK ,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};
func void TPL_1402_GorNaToth_Teach_MAN_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK ,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_MAN_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK ,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};
/*------------------------------------------------------------------------
						EINHANDKAMPF DIE ERSTE LEHRSTUNDE
------------------------------------------------------------------------*/

instance TPL_1402_GorNaToth_TRAIN(C_INFO)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_TRAIN_Condition;
	information = TPL_1402_GorNaToth_TRAIN_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,0);
};

func int TPL_1402_GorNaToth_TRAIN_Condition()
{
	if ((Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 1)
	&& (C_NpcBelongsToPsiCamp(hero)))
	{
		return 1;
	};

	return 0;
};

func void TPL_1402_GorNaToth_TRAIN_Info()
{
	if (log_gornatothfight == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
//		B_LogEntry(GE_TeacherPSI,"The templar Gor Na Toth can teach me to fight with ONE-HANDED weapons.");
//		B_LogEntry(GE_TeacherPSI,"Der Templer Gor Na Toth kann mir den Kampf mit EINHÄNDIGEN Waffen beibringen.");
		B_LogEntry(GE_TeacherPSI,"Templář Gor Na Toth mě může naučit bojovat s JEDNORUČNÍMI zbraněmi.");
		log_gornatothfight = TRUE;
	};

//	AI_Output(other,self,"TPL_1402_GorNaToth_TRAIN_Info_15_00"); //I want to improve my handling of one-handed weapons.
//	AI_Output(other,self,"TPL_1402_GorNaToth_TRAIN_Info_15_00"); //Ich will besser mit Einhandwaffen umgehen können.
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAIN_Info_15_00"); //Chci se zlepšit v ovládání jednoručních zbraní.

	if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
	{
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_01"); //That's a good decision! Before you can improve your technique, you'll have to learn how to hold the weapon right.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_01"); //Gute Entscheidung! Um deine Technik zu verbessern, musst du erst einmal lernen, deine Waffe richtig zu halten.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_01"); //Dobrá volba! Abys mohl začít zlepšovat techniku, musíš se nejdříve naučit zbraň správně držet.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_02"); //Beginners often tend to hold one-handed weapons with both hands. Now, you'd better not even start getting into that habit, it'll only get in the way.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_02"); //Anfänger neigen dazu, Einhandwaffen mit beiden Händen zu halten. Mit so was fängst du am besten gar nicht erst an, das behindert dich nur.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_02"); //Začátečníci mají tendenci držet jednoruční zbraň oběma rukama. Tímto způsobem rozhodně nezačínej, bylo by to jen na obtíž.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_03"); //Hold the weapon with one hand, blade up, and keep swinging it.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_03"); //Halt die Waffe mit einer Hand, Klinge nach oben, und dann immer schön schwingen lassen.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_03"); //Drž zbraň v jedné ruce, čepelí vzhůru a nech ji mírně pohupovat. #NEEDS_ATTENTION
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_04"); //You have to learn to harmonize your weapon's swing with your own movements. That'll make you faster in the attack.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_04"); //Du musst lernen, den Schwung deiner Waffe mit deinen Bewegungen in Einklang zu bringen, dann kannst du schneller zuschlagen.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_04"); //Musíš se naučit sladit pohyb zbraně s pohybem svého těla. Pak můžeš rychleji útočit.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_05"); //If you keep in mind what I've taught you, your fights will be more elegant and a lot faster in future.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_05"); //Wenn du dich an meine Anweisungen hältst, wirst du in Zukunft eleganter und vor allem schneller kämpfen.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_05"); //Pokud se budeš držet mých rad, budeš v budoucnu bojovat elegantněji a rychleji.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_06"); //Oh yeah, one more thing: Some hits cause more damage than others! As a beginner, you don't stand much of a chance of making critical hits.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_06"); //Ach, und noch was: Manche Treffer richten mehr Schaden an als andere! Als Anfänger hast du nur eine geringe Chance, solche kritischen Treffer zu landen.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_06"); //Ah, ještě jednu věc. Některé údery působí větší škodu než ostatní. Jako začátečníkovi se ti často nepovede takové údery zasadit.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_07"); //But the further you progress, the better you get.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_07"); //Aber je weiter du fortschreitest, desto besser wird diese Fähigkeit.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_07"); //Ale čím více budeš trénovat, tím větší šanci budeš mít.
		TPL_1402_GorNaToth_TRAIN.permanent = 0;

		AI_StopProcessInfos(self);
		B_PracticeCombat ("PSI_PATH_6_7");
	};
};

/*------------------------------------------------------------------------
						EINHANDKAMPF DIE ZWEITE LEHRSTUNDE
------------------------------------------------------------------------*/

instance TPL_1402_GorNaToth_TRAINAGAIN(C_INFO)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_TRAINAGAIN_Condition;
	information = TPL_1402_GorNaToth_TRAINAGAIN_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,0);
//	description = B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,0);
	description = B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,0);
};

func int TPL_1402_GorNaToth_TRAINAGAIN_Condition()
{
	if ((Npc_GetTalentSkill (hero,NPC_TALENT_1H) == 1)
	&& (C_NpcBelongsToPsiCamp(hero)))
	{
		return 1;
	};

	return 0;
};

func void TPL_1402_GorNaToth_TRAINAGAIN_Info()
{
//	AI_Output(other,self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01"); //Teach me how to handle one-handed weapons more skillfully.
//	AI_Output(other,self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01"); //Zeige mir, wie ich im Umgang mit Waffen noch besser werden kann.
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01"); //Nauč mě ještě lépe ovládat jednoruční zbraně.
	if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
	{
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02"); //Okay, you know the basics. Holding the weapon lower down will let you put more force into your first strike.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02"); //Na gut, die Grundkenntnisse hast du ja schon. Wenn du die Waffe gesenkt hältst, dann kannst du direkt mehr Wucht in deinen ersten Schlag legen.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02"); //Dobrá, základy znáš. Když podržíš zbraň níž, budeš moci vložit do svého prvního švihu více síly.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03"); //Use the swing, remember? Okay, now you need to use your body more. When you've struck twice, spin around. That'll confuse the opponent and put you in an excellent position.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03"); //Nutze den Schwung, weißt du noch? Gut, der nächste Schritt ist, dass du deinen Körper mehr einsetzt. Wenn du zweimal geschlagen hast, drehe dich um die eigene Achse, damit überraschst du den Gegner und bist in einer optimalen Position.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03"); //Využívej švihu, vzpomínáš? Dobře, dalším krokem je pohyb těla. Po druhém úderu se otoč kolem své vlastní osy, abys zmátl protivníka a získal optimální pozici.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04"); //Then bring your blade across from right to left once more.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04"); //Dann ziehst du deine Klinge noch einmal quer von rechts nach links .
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04"); //Poté veď čepel šikmo zprava doleva.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05"); //And back to the front. Don't forget: practice makes perfect. So, get going and become a real master of the art of one-handed fighting.
//		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05"); //Und wieder von vorne. Vergiss nicht, Übung macht den Meister. Also, geh jetzt und werde ein wahrer Meister des einhändigen Kampfes.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05"); //A znovu kupředu. Nezapomeň, cvičení dělá mistra. Tak běž a staň se mistrem jednoručních zbraní.
		B_GiveInvItems(hero,self,ItMiNugget, 50);
		TPL_1402_GorNaToth_TRAINAGAIN.permanent = 0;

		AI_StopProcessInfos(self);
		B_PracticeCombat ("PSI_PATH_6_7");
	};
};
