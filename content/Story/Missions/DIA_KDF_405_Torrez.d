//***********************************************
//					EXIT
//***********************************************

instance DIA_Torrez_Exit(C_INFO)
{
	npc = KDF_405_Torrez;
	nr = 999;
	condition = DIA_Torrez_Exit_Condition;
	information = DIA_Torrez_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Torrez_Exit_Condition()
{
	return 1;
};

func void DIA_Torrez_Exit_Info()
{
	AI_StopProcessInfos(self);
	if (!Npc_HasItems(self, ItArRuneFirebolt))
	{
		CreateInvItem(self, ItArRuneFirebolt);
	};
};

//***********************************************
//					Hallo
//***********************************************

instance DIA_Torrez_Hello(C_INFO)
{
	npc = KDF_405_Torrez;
	nr = 1;
	condition = DIA_Torrez_Hello_Condition;
	information = DIA_Torrez_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "I'm looking for the High Magician of the Circle of Fire!";
//	description = "Ich suche den obersten Feuermagier!";
	description = "Hledám Nejvyššího mága Ohnivého kruhu.";
};

func int DIA_Torrez_Hello_Condition()
{
	return 1;
};

func void DIA_Torrez_Hello_Info()
{
//	AI_Output(other,self,"DIA_Torrez_Hello_15_00"); //I'm looking for the High Magician of the Circle of Fire!
//	AI_Output(other,self,"DIA_Torrez_Hello_15_00"); //Ich suche den obersten Feuermagier!
	AI_Output(other, self, "DIA_Torrez_Hello_15_00"); //Hledám Velkého mága Kruhu ohně!
//	AI_Output(self,other,"DIA_Torrez_Hello_04_01"); //Speak to Milten! And now go!
//	AI_Output(self,other,"DIA_Torrez_Hello_04_01"); //Sprich mit Milten! Und nun geh!
	AI_Output(self, other, "DIA_Torrez_Hello_04_01"); //Řekni Miltenovi! A teď už jdi!

	AI_StopProcessInfos(self);
};

//***********************************************
//					Belohnung WÄHLEN
//***********************************************

instance DIA_Torrez_Belohnung(C_INFO)
{
	npc = KDF_405_Torrez;
	nr = 5;
	condition = DIA_Torrez_Belohnung_Condition;
	information = DIA_Torrez_Belohnung_Info;
	important = 0;
	permanent = 0;
//	description = "I've passed a letter on, and I'm to choose my own reward.";
//	description = "Ich habe einen Brief übergeben und soll meine Belohnung selber wählen.";
	description = "Dopis jsem předal a teď si chci vybrat svoji odměnu.";
};

func int DIA_Torrez_Belohnung_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_Milten_ComesBack)) && (milten_HasLetter == TRUE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Torrez_Belohnung_Info()
{
//	AI_Output(other,self,"DIA_Torrez_Belohnung_15_00"); //Corristo sent me. I've passed the letter on to him, and I'm to choose my own reward.
//	AI_Output(other,self,"DIA_Torrez_Belohnung_15_00"); //Corristo schickt mich. Ich habe den Brief übergeben und soll meine Belohnung selber wählen.
	AI_Output(other, self, "DIA_Torrez_Belohnung_15_00"); //Poslal mě Corristo. Předal jsem mu zprávu a teď jsem tu, abych si vybral odměnu.
//	AI_Output(self,other,"DIA_Torrez_Belohnung_04_01"); //You have done us a great service and you shall have your reward. Choose carefully.
//	AI_Output(self,other,"DIA_Torrez_Belohnung_04_01"); //Du hast uns einen großen Dienst erwiesen und sollst deine Belohnung erhalten. Wähle mit Bedacht.
	AI_Output(self, other, "DIA_Torrez_Belohnung_04_01"); //Udělal jsi pro nás velkou službu a dostaneš za to odměnu. Vybírej pozorně.

	Info_ClearChoices(DIA_Torrez_Belohnung);
//	Info_AddChoice(DIA_Torrez_Belohnung,"Essence of the spirit (Maximum mana +5)",DIA_Torrez_Belohnung_ManaMax);
//	Info_AddChoice(DIA_Torrez_Belohnung,"Essenz des Geistes (Maximales Mana +5)",DIA_Torrez_Belohnung_ManaMax);
	Info_AddChoice(DIA_Torrez_Belohnung, "Esence ducha (maximum many +5)", DIA_Torrez_Belohnung_ManaMax);
//	Info_AddChoice(DIA_Torrez_Belohnung,"3 spell scrolls (fireball, chain lightning and transform into scavenger)",DIA_Torrez_Belohnung_Scrolls);
//	Info_AddChoice(DIA_Torrez_Belohnung,"3 Spruchrollen (Feuerball, Blitz und Verwandeln in Scavenger)",DIA_Torrez_Belohnung_Scrolls);
	Info_AddChoice(DIA_Torrez_Belohnung, "3 kouzelné svitky (ohnivá koule, blesk, proměna v mrchožrouta)", DIA_Torrez_Belohnung_Scrolls);
//	Info_AddChoice(DIA_Torrez_Belohnung,"Ring of Dexterity (+5)",DIA_Torrez_Belohnung_Dex);
//	Info_AddChoice(DIA_Torrez_Belohnung,"Ring des Geschicks (+5)",DIA_Torrez_Belohnung_Dex);
	Info_AddChoice(DIA_Torrez_Belohnung, "Prsten obratnosti (+5)", DIA_Torrez_Belohnung_Dex);
//	Info_AddChoice(DIA_Torrez_Belohnung,"Ring of Strength (+5)",DIA_Torrez_Belohnung_Str);
//	Info_AddChoice(DIA_Torrez_Belohnung,"Stärkering (+5)",DIA_Torrez_Belohnung_Str);
	Info_AddChoice(DIA_Torrez_Belohnung, "Prsten síly (+5)", DIA_Torrez_Belohnung_Str);
};

func void DIA_Torrez_Belohnung_Str()
{
//	AI_Output(other,self,"DIA_Torrez_Belohnung_Str_15_00"); //I'll take the Ring of Strength.
//	AI_Output(other,self,"DIA_Torrez_Belohnung_Str_15_00"); //Ich nehme den Stärkering.
	AI_Output(other, self, "DIA_Torrez_Belohnung_Str_15_00"); //Vezmu si Prsten síly.
//	AI_Output(self,other,"DIA_Torrez_Belohnung_Str_04_01"); //The expected choice. Here, take the ring.
//	AI_Output(self,other,"DIA_Torrez_Belohnung_Str_04_01"); //Eine solche Wahl hatte ich von dir erwartet. Hier, nimm den Ring.
	AI_Output(self, other, "DIA_Torrez_Belohnung_Str_04_01"); //Zkušená volba. Tady je ten prsten.
	CreateInvItem(self, Staerkering);
	B_GiveInvItems(self, hero, Staerkering, 1);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Dex()
{
//	AI_Output(other,self,"DIA_Torrez_Belohnung_Dex_15_00"); //I'll take the Ring of Dexterity.
//	AI_Output(other,self,"DIA_Torrez_Belohnung_Dex_15_00"); //Ich nehme den Ring des Geschicks.
	AI_Output(other, self, "DIA_Torrez_Belohnung_Dex_15_00"); //Vezmu si tenhle Prsten zručnosti.
//	AI_Output(self,other,"DIA_Torrez_Belohnung_Dex_04_01"); //Dexterity wins over strength. A good decision.
//	AI_Output(self,other,"DIA_Torrez_Belohnung_Dex_04_01"); //Geschicklichkeit siegt über Stärke. Eine gute Entscheidung.
	AI_Output(self, other, "DIA_Torrez_Belohnung_Dex_04_01"); //Zručnost vítězí nad silou. Dobré rozhodnutí.
	CreateInvItem(self, Ring_des_Geschicks);
	B_GiveInvItems(self, hero, Ring_des_Geschicks, 1);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Scrolls()
{
//	AI_Output(other,self,"DIA_Torrez_Belohnung_Scrolls_15_00"); //Give me the spell scrolls.
//	AI_Output(other,self,"DIA_Torrez_Belohnung_Scrolls_15_00"); //Gib mir die Spruchrollen.
	AI_Output(other, self, "DIA_Torrez_Belohnung_Scrolls_15_00"); //Dej mi kouzelný svitek.
//	AI_Output(self,other,"DIA_Torrez_Belohnung_Scrolls_04_01"); //Use them wisely. You can use each of them only once!
//	AI_Output(self,other,"DIA_Torrez_Belohnung_Scrolls_04_01"); //Nutze sie mit Bedacht. Du kannst jede von ihnen nur einmal verwenden!
	AI_Output(self, other, "DIA_Torrez_Belohnung_Scrolls_04_01"); //Použij ho moudře. Každý můžeš použít jen jednou!
	CreateInvItems(self, ItArScrollFireball, 3);
	B_GiveInvItems(self, hero, ItArScrollFireball, 3); //Wegen Bildschirmausgabe, wird direkt angepasst
	Npc_RemoveInvItems(other, ItArScrollFireball, 2);
	CreateInvItem(other, ItArScrollTrfScavenger);
	CreateInvItem(other, ItArScrollChainLightning);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_ManaMax()
{
//	AI_Output(other,self,"DIA_Torrez_Belohnung_ManaMax_15_00"); //I would like to have the potion!
//	AI_Output(other,self,"DIA_Torrez_Belohnung_ManaMax_15_00"); //Ich will den Trank!
	AI_Output(other, self, "DIA_Torrez_Belohnung_ManaMax_15_00"); //Chtěl bych mít ten lektvar!
//	AI_Output(self,other,"DIA_Torrez_Belohnung_ManaMax_04_01"); //A wise choice! You have picked the most precious of all gifts. Drink the potion and your power will grow!
//	AI_Output(self,other,"DIA_Torrez_Belohnung_ManaMax_04_01"); //Deine Wahl war weise! Du hast das kostbarste Geschenk von allen gewählt. Trinke den Trank und deine Macht wird wachsen!
	AI_Output(self, other, "DIA_Torrez_Belohnung_ManaMax_04_01"); //Moudrá volba! Vybral sis nejlepší z darů. Když se toho lektvaru napiješ, tvoje síla se umocní!
	CreateInvItem(self, ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems(self, hero, ItFo_Potion_Mana_Perma_01, 1);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};

//***********************************************
//					Brief TAUSCH
//***********************************************

instance DIA_Torrez_BriefTausch(C_INFO)
{
	npc = KDF_405_Torrez;
	nr = 5;
	condition = DIA_Torrez_BriefTausch_Condition;
	information = DIA_Torrez_BriefTausch_Info;
	important = 0;
	permanent = 0;
//	description = "I have a letter for you! But I want my reward first!";
//	description = "Ich habe einen Brief für euch! Aber ich will erst meine Belohnung sehen!";
	description = "Mám pro tebe dopis! Nejdřív chci ale odměnu!";
};

func int DIA_Torrez_BriefTausch_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_Milten_ComesBack)) && (milten_HasLetter == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Torrez_BriefTausch_Info()
{
//	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_00"); //I have a letter for you! But I want my reward first!
//	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_00"); //Ich habe einen Brief für euch! Aber ich will erst meine Belohnung sehen!
	AI_Output(other, self, "DIA_Torrez_BriefTausch_15_00"); //Mám pro tebe dopis! Nejdřív chci ale odměnu!
//	AI_Output(self,other,"DIA_Torrez_BriefTausch_04_01"); //Why don't you talk to Milten?
//	AI_Output(self,other,"DIA_Torrez_BriefTausch_04_01"); //Warum sprichst du nicht mit Milten?
	AI_Output(self, other, "DIA_Torrez_BriefTausch_04_01"); //Proč si neřekneš Miltenovi?
//	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_02"); //I've done that already.
//	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_02"); //Hab ich bereits.
	AI_Output(other, self, "DIA_Torrez_BriefTausch_15_02"); //Už jsem to udělal.
//	AI_Output(self,other,"DIA_Torrez_BriefTausch_04_03"); //I understand. I have your reward here - show me the letter. Now!
//	AI_Output(self,other,"DIA_Torrez_BriefTausch_04_03"); //Verstehe. Ich habe deine Belohnung bei mir - zeig mir den Brief. Jetzt!
	AI_Output(self, other, "DIA_Torrez_BriefTausch_04_03"); //Rozumím. Tvou odměnu mám tady - ukaž mi ten dopis. Teď!
//	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_04"); //Here it is.
//	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_04"); //Hier ist er.
	AI_Output(other, self, "DIA_Torrez_BriefTausch_15_04"); //Tady je.

	if (Npc_HasItems(other, ItWr_Fire_Letter_01) >= 1)
	{
//		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_05"); //Your reward is a Ring of Strength. It's a rare artefact, and will be of great use to you.
//		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_05"); //Deine Belohnung ist ein Ring der Stärke. Es ist ein seltenes Artefakt und wird dir sicherlich sehr nützlich sein.
		AI_Output(self, other, "DIA_Torrez_BriefTausch_04_05"); //Tvoje odměna je Prsten síly. Je to vzácný artefakt a bude pro tebe velice užitečný.
//		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_06"); //Now go!
//		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_06"); //Und nun geh!
		AI_Output(self, other, "DIA_Torrez_BriefTausch_04_06"); //A teď už jdi!
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		Npc_RemoveInvItems(self, ItWr_Fire_Letter_01, 1);
		CreateInvItems(self, Staerkering, 1);
		B_GiveInvItems(self, other, Staerkering, 1);
		B_GiveXP(XP_XardasLetter);
	}
	else if (Npc_HasItems(other, ItWr_Fire_Letter_02) >= 1)
	{
//		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_07"); //The seal is broken.
//		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_07"); //Das Siegel ist gebrochen.
		AI_Output(self, other, "DIA_Torrez_BriefTausch_04_07"); //Pečeť je zlomená.
//		AI_Output(other,self,"DIA_Torrez_BriefTausch_15_08"); //Accidents happen.
//		AI_Output(other,self,"DIA_Torrez_BriefTausch_15_08"); //Unfälle passieren eben.
		AI_Output(other, self, "DIA_Torrez_BriefTausch_15_08"); //Stala se nehoda.
//		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_09"); //Your reward is a healing potion. Be content with that. Messengers who deliver letters without seals usually don't get anything!
//		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_09"); //Deine Belohnung ist ein Trank der Heilung. Sei zufrieden damit. Einem Boten, der einen Brief ohne Siegel übergibt, steht normalerweise gar nichts zu!
		AI_Output(self, other, "DIA_Torrez_BriefTausch_04_09"); //Tvoje odměna je léčivý lektvar. Buď rád, že ho dostaneš. Kurýři, kteří donesou dopis bez pečeti, obvykle nedostanou nic!
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		Npc_RemoveInvItems(self, ItWr_Fire_Letter_02, 1);
		CreateInvItems(self, ItFo_Potion_Health_03, 1);
		B_GiveInvItems(self, other, ItFo_Potion_Health_03, 1);
		B_GiveXP(XP_XardasLetterOPEN);
	};

	var C_Npc corristo; corristo = Hlp_GetNpc(KdF_402_Corristo);

	CreateInvItems(corristo, ItWr_Fire_Letter_02, 1);

	AI_StopProcessInfos(self);
};

//***********************************************
//					PERM
//***********************************************

instance DIA_Torrez_PERM(C_INFO)
{
	npc = KDF_405_Torrez;
	nr = 1;
	condition = DIA_Torrez_PERM_Condition;
	information = DIA_Torrez_PERM_Info;
	important = 0;
	permanent = 1;
//	description = "How's venturing in the magic arts?";
//	description = "Was machen die magischen Künste?";
	description = "Co je v magických uměních nebezpečné?";
};

func int DIA_Torrez_PERM_Condition()
{
	return 1;
};

func void DIA_Torrez_PERM_Info()
{
//	AI_Output(other,self,"DIA_Torrez_PERM_15_00"); //How's venturing in the magic arts?
//	AI_Output(other,self,"DIA_Torrez_PERM_15_00"); //Was machen die magischen Künste?
	AI_Output(other, self, "DIA_Torrez_PERM_15_00"); //Co je v magických uměních nebezpečné?
//	AI_Output(self,other,"DIA_Torrez_PERM_04_01"); //That's none of your business!
//	AI_Output(self,other,"DIA_Torrez_PERM_04_01"); //Das ist nicht dein Belang!
	AI_Output(self, other, "DIA_Torrez_PERM_04_01"); //To není tvoje věc!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////
///////////////////////////////////////////
/////////////   Kapitel 3 ///////////////
///////////////////////////////////////////
///////////////////////////////////////////

//---------------------------------------------------------
//					WÄHREND DER AUFNAHME
//---------------------------------------------------------
instance KDF_405_Torrez_BOOK(C_INFO)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_BOOK_Condition;
	information = KDF_405_Torrez_BOOK_Info;
	important = 1;
	permanent = 0;
};

func int KDF_405_Torrez_BOOK_Condition()
{
	if ((Npc_KnowsInfo(hero, KDF_402_Corristo_ROBE))
	&& (Npc_KnowsInfo(hero, KDF_403_Drago_RUNE)))
	{
		return 1;
	};

	return 0;
};

func void KDF_405_Torrez_BOOK_Info()
{
//	AI_Output(self,other,"KDF_405_Torrez_BOOK_Info_04_01"); //For each of the Circles there is a book explaining it's magic. Study these books. Knowledge is power!
//	AI_Output(self,other,"KDF_405_Torrez_BOOK_Info_04_01"); //Für jeden der Kreise gibt es ein Buch, in welchem die Zauber des Kreises erklärt werden. Studiere sie genau, denn Wissen bedeutet Macht.
	AI_Output(self, other, "KDF_405_Torrez_BOOK_Info_04_01"); //Pro každý Kruh existuje jedna kniha, která vysvětluje jeho kouzla. Přečti si ty knihy. Vědomosti jsou síla!
//	AI_Output(self,other,"KDF_405_Torrez_BOOK_Info_04_02"); //Take the book of the First Circle and learn to understand the Fire.
//	AI_Output(self,other,"KDF_405_Torrez_BOOK_Info_04_02"); //Nimm das Buch des ersten Kreises und lerne das Feuer zu verstehen.
	AI_Output(self, other, "KDF_405_Torrez_BOOK_Info_04_02"); //Vezmi si knihu Prvního kruhu a nauč se rozumět Ohni.
	CreateInvItem(self, ItWr_Book_Circle_01);
	B_GiveInvItems(self, hero, ItWr_Book_Circle_01, 1);
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance KDF_405_Torrez_SELLBOOKS(C_INFO)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_SELLBOOKS_Condition;
	information = KDF_405_Torrez_SELLBOOKS_Info;
	important = 0;
	permanent = 1;
	trade = 1;
//	description = "I want to acquire magic writings.";
//	description = "Ich möchte Schriften über Magie erwerben";
	description = "Rád bych získal magické spisy.";
};

func int KDF_405_Torrez_SELLBOOKS_Condition()
{
	if (Npc_KnowsInfo(hero, KDF_405_Torrez_GREET))
	{
		return 1;
	};

	return 0;
};

func void KDF_405_Torrez_SELLBOOKS_Info()
{
//	AI_Output(other,self,"KDF_405_Torrez_SELLBOOKS_Info_15_01"); //I want to acquire magic writings.
//	AI_Output(other,self,"KDF_405_Torrez_SELLBOOKS_Info_15_01"); //Ich möchte Schriften über Magie erwerben.
	AI_Output(other, self, "KDF_405_Torrez_SELLBOOKS_Info_15_01"); //Rád bych získal magické spisy.
};

/*------------------------------------------------------------------------
BEGRÜSSUNG
------------------------------------------------------------------------ */

instance KDF_405_Torrez_GREET(C_INFO)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_GREET_Condition;
	information = KDF_405_Torrez_GREET_Info;
	important = 0;
	permanent = 0;
//	description = "Greetings, Magician.";
//	description = "Ich grüße dich, Magier";
	description = "Buď zdráv, mágu.";
};

func int KDF_405_Torrez_GREET_Condition()
{
	return 1;
};

func void KDF_405_Torrez_GREET_Info()
{
//	AI_Output(other,self,"KDF_405_Torrez_GREET_Info_15_01"); //Greetings, Magician.
//	AI_Output(other,self,"KDF_405_Torrez_GREET_Info_15_01"); //Ich grüße dich, Magier.
	AI_Output(other, self, "KDF_405_Torrez_GREET_Info_15_01"); //Buď zdráv, mágu.
//	AI_Output(self,other,"KDF_405_Torrez_GREET_Info_04_02"); //May Innos watch over you! I trade in magic knowledge, and I can show you how to increase your magic powers!
//	AI_Output(self,other,"KDF_405_Torrez_GREET_Info_04_02"); //Innos wache über dich! Ich handele mit magischem Wissen und kann dir zeigen, wie du deine magische Energie steigerst!
	AI_Output(self, other, "KDF_405_Torrez_GREET_Info_04_02"); //Kéž nad tebou bdí Innos! Obchoduji s magickými vědomostmi a můžu ti ukázat, jak zvětšíš své kouzelné síly!

	Log_CreateTopic(GE_TraderOC, LOG_NOTE);
//	B_LogEntry(GE_TraderOC,"Torrez sells SPELL SCROLLS and RUNES. During the day, he stays in the courtyard.");
//	B_LogEntry(GE_TraderOC,"Torrez verkauft SPRUCHROLLEN und RUNEN. Er hält sich tagsüber im Burghof auf.");
	B_LogEntry(GE_TraderOC, "Torrez prodává KOUZELNÉ SVITKY a RUNY. Přes den bývá na nádvoří.");

	Log_CreateTopic(GE_TeacherOC, LOG_NOTE);
//	B_LogEntry(GE_TeacherOC,"Torrez can show me how to increase my MANA. During the daytime, he's in the courtyard.");
//	B_LogEntry(GE_TeacherOC,"Torrez kann mir zeigen, wie ich meine MANA steigern kann. Er hält sich tagsüber im Burghof auf.");
	B_LogEntry(GE_TeacherOC, "Torres mi může ukázat, jak zvýšit svoji MAGICKOU ENERGII. Přes den bývá na nádvoří.");
};

//
instance KDF_405_Torrez_MANA(C_INFO)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_MANA_Condition;
	information = KDF_405_Torrez_MANA_Info;
	important = 0;
	permanent = 1;
//	description = "I need more magic power.";
//	description = "Ich benötige mehr magische Kraft";
	description = "Potřebuji více magické moci.";
};

func int KDF_405_Torrez_MANA_Condition()
{
	if (Npc_KnowsInfo(hero, KDF_405_Torrez_GREET))
	{
		return 1;
	};

	return 0;
};

//TODO: replace with B_BuildLearnString
func void KDF_405_Torrez_MANA_Info()
{
//	AI_Output(other,self,"KDF_405_Torrez_MANA_Info_15_01"); //I need more magic power.
//	AI_Output(other,self,"KDF_405_Torrez_MANA_Info_15_01"); //Ich benötige mehr magische Kraft.
	AI_Output(other, self, "KDF_405_Torrez_MANA_Info_15_01"); //Pořebuju víc kouzelné síly.
//	AI_Output(self,other,"KDF_405_Torrez_MANA_Info_04_02"); //I can help you to increase your power. What use you make of it is up to you.
//	AI_Output(self,other,"KDF_405_Torrez_MANA_Info_04_02"); //Ich kann dir helfen, deine Kraft zu steigern. Wie du sie nutzt, liegt nur an dir.
	AI_Output(self, other, "KDF_405_Torrez_MANA_Info_04_02"); //Můžu ti pomoci zvětšit tvoji sílu. Jak ji použiješ, je už tvoje věc.

	Info_ClearChoices(KDF_405_Torrez_MANA);
	Info_AddChoice(KDF_405_Torrez_MANA, DIALOG_BACK, KDF_405_Torrez_MANA_BACK);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Increase mana by 5 (cost 5 skill points)",KDF_405_Torrez_MANA_MAN_5);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Mana um 5 steigern (Kosten 5 LP)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice(KDF_405_Torrez_MANA, "Zvýšení many o 5 (cena 5 dovednostních bodů)", KDF_405_Torrez_MANA_MAN_5);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Increase mana by 1 (cost 1 skill point)",KDF_405_Torrez_MANA_MAN_1);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Mana um 1 steigern (Kosten 1 LP)",KDF_405_Torrez_MANA_MAN_1);
	Info_AddChoice(KDF_405_Torrez_MANA, "Zvýšení many o 1 (cena 1 dovednostní bod)", KDF_405_Torrez_MANA_MAN_1);
};

func void KDF_405_Torrez_MANA_BACK()
{
	Info_ClearChoices(KDF_405_Torrez_MANA);
};

func void KDF_405_Torrez_MANA_MAN_1()
{
	B_BuyAttributePoints(other, ATR_MANA_MAX, 1);
	Info_ClearChoices(KDF_405_Torrez_MANA);
	Info_AddChoice(KDF_405_Torrez_MANA, DIALOG_BACK, KDF_405_Torrez_MANA_BACK);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Increase mana by 5 (cost 5 skill points)",KDF_405_Torrez_MANA_MAN_5);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Mana um 5 steigern (Kosten 5 LP)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice(KDF_405_Torrez_MANA, "Zvýšení many o 5 (cena 5 dovednostních bodů)", KDF_405_Torrez_MANA_MAN_5);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Increase mana by 1 (cost 1 skill point)",KDF_405_Torrez_MANA_MAN_1);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Mana um 1 steigern (Kosten 1 LP)",KDF_405_Torrez_MANA_MAN_1);
	Info_AddChoice(KDF_405_Torrez_MANA, "Zvýšení many o 1 (cena 1 dovednostní bod)", KDF_405_Torrez_MANA_MAN_1);
};

func void KDF_405_Torrez_MANA_MAN_5()
{
	B_BuyAttributePoints(other, ATR_MANA_MAX, 5);
	Info_ClearChoices(KDF_405_Torrez_MANA);
	Info_AddChoice(KDF_405_Torrez_MANA, DIALOG_BACK, KDF_405_Torrez_MANA_BACK);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Increase mana by 5 (cost 5 skill points)",KDF_405_Torrez_MANA_MAN_5);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Mana um 5 steigern (Kosten 5 LP)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice(KDF_405_Torrez_MANA, "Zvýšení many o 5 (cena 5 dovednostních bodů)", KDF_405_Torrez_MANA_MAN_5);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Increase mana by 1 (cost 1 skill point)",KDF_405_Torrez_MANA_MAN_1);
//	Info_AddChoice(KDF_405_Torrez_MANA,"Mana um 1 steigern (Kosten 1 LP)",KDF_405_Torrez_MANA_MAN_1);
	Info_AddChoice(KDF_405_Torrez_MANA, "Zvýšení many o 1 (cena 1 dovednostní bod)", KDF_405_Torrez_MANA_MAN_1);
};

/*------------------------------------------------------------------------
Magier Werden?
------------------------------------------------------------------------ */

instance KDF_405_Torrez_WANNABEMAGE(C_INFO)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_WANNABEMAGE_Condition;
	information = KDF_405_Torrez_WANNABEMAGE_Info;
	important = 0;
	permanent = 0;
//	description = "What do I have to do to become a magician?";
//	description = "Was muss ich tun, um Magier zu werden?";
	description = "Co musím udělat, abych se stal mágem?";
};

func int KDF_405_Torrez_WANNABEMAGE_Condition()
{
	if ((Npc_KnowsInfo(hero, KDF_405_Torrez_GREET))
	&& (Npc_GetTrueGuild(hero) != GIL_KDF)
	&& (!Npc_KnowsInfo(hero, KDF_402_Corristo_WANNBEKDF)))
	{
		return 1;
	};

	return 0;
};

func void KDF_405_Torrez_WANNABEMAGE_Info()
{
//	AI_Output(other,self,"KDF_405_Torrez_WANNABEMAGE_Info_15_01"); //What do I have to do to become a magician?
//	AI_Output(other,self,"KDF_405_Torrez_WANNABEMAGE_Info_15_01"); //Was muss ich tun, um Magier zu werden?
	AI_Output(other, self, "KDF_405_Torrez_WANNABEMAGE_Info_15_01"); //Co musím udělat, abych se stal mágem?
//	AI_Output(self,other,"KDF_405_Torrez_WANNABEMAGE_Info_04_02"); //Talk to Master Corristo, if he has time for you.
//	AI_Output(self,other,"KDF_405_Torrez_WANNABEMAGE_Info_04_02"); //Sprich mit Meister Corristo, wenn er Zeit für dich hat.
	AI_Output(self, other, "KDF_405_Torrez_WANNABEMAGE_Info_04_02"); //Řekni mistrovi Corristovi, pokud na tebe bude mít čas.
};
