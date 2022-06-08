// ****************************************
// 					FIRST
// ****************************************

instance GUR_1201_CorKalom_FIRST(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_FIRST_Condition;
	information = GUR_1201_CorKalom_FIRST_Info;
	important = 1;
	permanent = 1;
};

func int GUR_1201_CorKalom_FIRST_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_FIRST_Info()
{
//	AI_Output(self,other,"GUR_1201_CorKalom_FIRST_10_00"); //What do you want?
//	AI_Output(self,other,"GUR_1201_CorKalom_FIRST_10_00"); //Was willst du?
	AI_Output(self, other, "GUR_1201_CorKalom_FIRST_10_00"); //Co chceš?
	Kalom_TalkedTo = TRUE;
};

// ****************************************
// 				Wanna Join
// ****************************************

instance GUR_1201_CorKalom_WannaJoin(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_WannaJoin_Condition;
	information = GUR_1201_CorKalom_WannaJoin_Info;
	important = 0;
	permanent = 0;
//	description = "I would like to join the Brotherhood.";
//	description = "Ich will in die Bruderschaft aufgenommen werden.";
	description = "Chci se přidat k Bratrstvu.";
};

func int GUR_1201_CorKalom_WannaJoin_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_WannaJoin_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_00"); //I would like to join the Brotherhood.
//	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_00"); //Ich will in die Bruderschaft aufgenommen werden.
	AI_Output(other, self, "GUR_1201_CorKalom_WannaJoin_15_00"); //Chci se přidat k Bratrstvu.
//	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_01"); //I've heard you're the master of the novices and that you decide who's allowed to join.
//	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_01"); //Ich habe gehört, du bist der Meister der Novizen, und entscheidest, wer aufgenommen wird.
	AI_Output(other, self, "GUR_1201_CorKalom_WannaJoin_15_01"); //Slyšel jsem, že jsi mistr noviců a že TY rozhoduješ o tom, kdo se může přidat.
//	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_02"); //I don't have time! My experiments are too important for me to spend any time on new novices.
//	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_02"); //Ich habe keine Zeit! Meine Experimente sind zu wichtig, als dass ich mich um neue Novizen kümmern könnte.
	AI_Output(self, other, "GUR_1201_CorKalom_WannaJoin_10_02"); //Nemám čas! Mé experimenty jsou příliš důležité, než abych ztrácel čas s novými novici.
//	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_03"); //I'll rely on the judgement of the Baals. When they say you're ready to wear the robe of a novice, come back to me.
//	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_03"); //Ich verlasse mich auf das Urteil der Baals. Wenn sie sagen, dass du bereit bist, die Robe eines Novizen zu tragen, kehre zu mir zurück.
	AI_Output(self, other, "GUR_1201_CorKalom_WannaJoin_10_03"); //Spoléhám se na názor Baalů. Až řeknou, že jsi hoden nosit roucho novice, přijď znovu.
	AI_StopProcessInfos(self);

	Log_CreateTopic(CH1_JoinPsi, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi, LOG_RUNNING);
//	B_LogEntry(CH1_JoinPsi,"Cor Kalom will let me join the Brotherhood as a novice if I manage to convince four of the Baals to speak in my favor.");
//	B_LogEntry(CH1_JoinPsi,"Cor Kalom nimmt mich als Novize in die Bruderschaft auf, wenn ich mindestens vier der Baal's davon überzeugen kann, für mich zu sprechen.");
	B_LogEntry(CH1_JoinPsi, "Cor Kalom mě nechá přidat se k Bratrstvu, pokud se mi podaří přesvědčit nejméně čtyři z Baalů, aby se za mě přimluvili.");
};

// ****************************************
// 				Kaloms Recipe
// ****************************************

instance GUR_1201_CorKalom_Recipe(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 20;
	condition = GUR_1201_CorKalom_Recipe_Condition;
	information = GUR_1201_CorKalom_Recipe_Info;
	important = 0;
	permanent = 0;
//	description = "One of the merchants from the Old Camp would like to have a recipe.";
//	description = "Einer der Händler aus dem alten Lager will ein Rezept von dir haben.";
	description = "Jeden z obchodníků ze Starého tábora by chtěl recept na hojivý lektvar.";
};

func int GUR_1201_CorKalom_Recipe_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_Recipe_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_Recipe_15_00"); //One of the merchants from the Old Camp would like to have the recipe for a healing potion.
//	AI_Output(other,self,"GUR_1201_CorKalom_Recipe_15_00"); //Einer der Händler aus dem Alten Lager will das Rezept für einen Heiltrank von dir haben.
	AI_Output(other, self, "GUR_1201_CorKalom_Recipe_15_00"); //Jeden z obchodníků ze Starého tábora by chtěl recept na hojivý lektvar.
//	AI_Output(self,other,"GUR_1201_CorKalom_Recipe_10_01"); //My recipes are not for sale!
//	AI_Output(self,other,"GUR_1201_CorKalom_Recipe_10_01"); //Meine Rezepte sind unverkäuflich!
	AI_Output(self, other, "GUR_1201_CorKalom_Recipe_10_01"); //Mé recepty nejsou na prodej!

//	B_LogEntry(CH1_KalomsRecipe,"Cor Kalom will not give me the recipe. But there are chests in his lab ... and he seemed to be quite busy ...");
//	B_LogEntry(CH1_KalomsRecipe,"Cor Kalom will das Rezept nicht herausrücken. Aber in seinem Labor stehen Truhen... Und er schien ziemlich beschäftigt zu sein...");
	B_LogEntry(CH1_KalomsRecipe, "Cor Kalom mi ten recept nedá. V jeho dílně jsou však truhlice... a vypadá, že je docela zaneprázdněný...");
};

// ****************************************
// 				Experimente (PERM)
// ****************************************

instance GUR_1201_CorKalom_Experimente(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 2;
	condition = GUR_1201_CorKalom_Experimente_Condition;
	information = GUR_1201_CorKalom_Experimente_Info;
	important = 0;
	permanent = 1;
//	description = "What kind of experiments do you do?";
//	description = "Was machst du für Experimente?";
	description = "Jaký druh experimentů provádíš?";
};

func int GUR_1201_CorKalom_Experimente_Condition()
{
	if (Kapitel <= 2)
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_Experimente_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_Experimente_15_00"); //What kind of experiments do you do?
//	AI_Output(other,self,"GUR_1201_CorKalom_Experimente_15_00"); //Was machst du für Experimente?
	AI_Output(other, self, "GUR_1201_CorKalom_Experimente_15_00"); //Jaký druh experimentů provádíš?
//	AI_Output(self,other,"GUR_1201_CorKalom_Experimente_10_01"); //My research takes place on a level you don't understand anything about, boy. So don't waste my time!
//	AI_Output(self,other,"GUR_1201_CorKalom_Experimente_10_01"); //Meine Forschung befindet sich auf einer Ebene, von der du nichts verstehst, Bursche. Also verschwende nicht meine Zeit!
	AI_Output(self, other, "GUR_1201_CorKalom_Experimente_10_01"); //Mé výzkumy jsou na takové úrovni, že bys jim sotva porozuměl, chlapče. Tak mě přestaň zdržovat!
};

// ****************************************
// Info BRINGWEED
// ****************************************

instance GUR_1201_CorKalom_BRINGWEED(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 2;
	condition = GUR_1201_CorKalom_BRINGWEED_Condition;
	information = GUR_1201_CorKalom_BRINGWEED_Info;
	important = 0;
	permanent = 1;
//	description = "I'm delivering the daily swampweed harvest!";
//	description = "Ich bringe die tägliche Sumpfkrauternte!";
	description = "Nesu denní sklizeň drogy z bažin!";
};

func int GUR_1201_CorKalom_BRINGWEED_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_BRINGWEED_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_BRINGWEED_15_00"); //I'm delivering the daily swampweed harvest!
//	AI_Output(other,self,"GUR_1201_CorKalom_BRINGWEED_15_00"); //Ich bringe die tägliche Sumpfkrauternte!
	AI_Output(other, self, "GUR_1201_CorKalom_BRINGWEED_15_00"); //Nesu denní sklizeň drogy z bažin!

	if (Npc_HasItems(hero, ItMi_Plants_Swampherb_01) < 100)
	{
//		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_01"); //And THAT's supposed to be the lot??? I expect the COMPLETE harvest, which means at least a 100 stalks!!!
//		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_01"); //Und DAS soll alles sein??? Ich erwarte die KOMPLETTE Ernte, das sind mindestens 100 Stengel!!!
		AI_Output(self, other, "GUR_1201_CorKalom_BRINGWEED_10_01"); //A TOHLE má být všechno??? Očekávám CELOU sklizeň, což znamená alespoň 100 lodyh!!!
		AI_StopProcessInfos(self);
	}
	else
	{
//		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_02"); //Aargh, give it to me. And now get out of my sight!
//		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_02"); //Ah, gib her. Und verzieh dich wieder!
		AI_Output(self, other, "GUR_1201_CorKalom_BRINGWEED_10_02"); //Ah, dej mi to. A teď se mi ztrať z očí!

		B_GiveInvItems(hero, self, ItMi_Plants_Swampherb_01, 100);
		Npc_RemoveInvItems(self, ItMi_Plants_Swampherb_01, 100);
		BaalOrun_FetchWeed = LOG_SUCCESS;
//		B_LogEntry(CH1_DeliverWeed,"Cor Kalom was as unbearable as always when I gave him today's swampweed harvest.");
//		B_LogEntry(CH1_DeliverWeed,"Cor Kalom war unaustehlich wie immer, als ich ihm die heutige Sumpfkrauternte übergab.");
		B_LogEntry(CH1_DeliverWeed, "Cor Kalom byl jako obvykle nesnesitelný, když jsem mu předával sklizeň drogy z bažin.");
		Log_SetTopicStatus(CH1_DeliverWeed, LOG_SUCCESS);
		B_GiveXP(XP_DeliveredWeedHarvest);

		BaalOrun_FetchWeed = LOG_SUCCESS;
		AI_StopProcessInfos(self);
	};
};

// ****************************************
// 				Crawlerzangen (PERM)
// ****************************************

instance GUR_1201_CorKalom_Crawlerzangen(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 800;
	condition = GUR_1201_CorKalom_Crawlerzangen_Condition;
	information = GUR_1201_CorKalom_Crawlerzangen_Info;
	important = 0;
	permanent = 1;
//	description = "I have crawlers' mandibles for you...";
//	description = "Ich habe Crawlerzangen für dich...";
	description = "Mám pro tebe čelisti důlních červů...";
};

func int GUR_1201_CorKalom_Crawlerzangen_Condition()
{
	if (Npc_HasItems(other, ItAt_Crawler_01) > 0)
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_Crawlerzangen_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_Crawlerzangen_15_00"); //I have crawlers' mandibles for you...
//	AI_Output(other,self,"GUR_1201_CorKalom_Crawlerzangen_15_00"); //Ich habe Crawlerzangen für dich...
	AI_Output(other, self, "GUR_1201_CorKalom_Crawlerzangen_15_00"); //Mám pro tebe čelisti důlních červů...

	/*
	#Needs_Attention - toto je strasny sh#t, ktory sa ani v najmensom hracovi nevyplati :) tu domenu musime upravit
	- pri 1 celisti 1 lektvar many
	- pri 3 - 9 celistiach 2 esence many
	- pri 10 + celistiach 3 elixiry many
	Otazka je ako upravit - dal by som 1 x 1 vymenu lektvaru - a dialogy mozu ostat podla mnozstva celisti
	*/
	if (Npc_HasItems(other, ItAt_Crawler_01) > 9)
	{
//		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_01"); //Very good. Take some of my best potions as reward.
//		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_01"); //Sehr gut. Nimm einige meiner besten Tränke als Belohnung.
		AI_Output(self, other, "GUR_1201_CorKalom_Crawlerzangen_10_01"); //Výborně. Jako odměnu si vezmi mé nejlepší lektvary.
		CreateInvItems(self, ItFo_Potion_Mana_03, 3);
		B_GiveInvItems(self, hero, ItFo_Potion_Mana_03, 3);
	}
	else if (Npc_HasItems(other, ItAt_Crawler_01) > 2)
	{
//		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_02"); //Good. Take some potions as a reward.
//		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_02"); //Gut. Nimm ein paar Tränke als Belohnung.
		AI_Output(self, other, "GUR_1201_CorKalom_Crawlerzangen_10_02"); //Dobře. Jako odměnu si vezmi tyto lektvary.
		CreateInvItems(self, ItFo_Potion_Mana_02, 2);
		B_GiveInvItems(self, hero, ItFo_Potion_Mana_02, 2);
	}
	else
	{
//		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_03"); //Hm. That's all of them? Here, take a mana potion and disappear.
//		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_03"); //Hm. Das soll alles sein? Hier, nimm einen Manatrank und verschwinde.
		AI_Output(self, other, "GUR_1201_CorKalom_Crawlerzangen_10_03"); //Hm. To má být všechno? Tady, vezmi si lektvar many a zmiz.
		CreateInvItems(self, ItFo_Potion_Mana_01, 1);
		B_GiveInvItems(self, hero, ItFo_Potion_Mana_01, 1);
		AI_StopProcessInfos(self);
	};

	B_GiveInvItems(other, self, ItAt_Crawler_01, Npc_HasItems(other, ItAt_Crawler_01));
};

// ****************************************
// 				Join PSI
// ****************************************

instance GUR_1201_CorKalom_JoinPSI(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_JoinPSI_Condition;
	information = GUR_1201_CorKalom_JoinPSI_Info;
	important = 0;
	permanent = 1;
//	description = "I think I have convinced the Baals!";
//	description = "Ich glaube, ich habe die Baals überzeugt!";
	description = "Myslím, že jsem přesvědčil Baaly!";
};

func int GUR_1201_CorKalom_JoinPSI_Condition()
{
	if ((Npc_GetTrueGuild(hero) == GIL_NONE)
	&& (Npc_KnowsInfo(hero, GUR_1201_CorKalom_WannaJoin)))
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_JoinPSI_Info()
{
	var int counter;
	counter = 0; //Counter löschen, da er noch den Stand der letzten Analyse hat!

//	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_00"); //I think I have convinced the Baals!
//	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_00"); //Ich glaube, ich habe die Baals überzeugt!
	AI_Output(other, self, "GUR_1201_CorKalom_JoinPSI_15_00"); //Myslím, že jsem přesvědčil Baaly!

	if (Npc_KnowsInfo(hero, DIA_BaalOrun_GotWeed))
	{
//		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_01"); //Baal Orun says I have proven to be a worthy servant of the Sleeper.
//		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_01"); //Baal Orun sagt, ich habe mich als würdiger Diener des Schläfers erwiesen.
		//#Needs_attention - tu by som to prebasnil popravde mi to nesedi
		AI_Output(other, self, "GUR_1201_CorKalom_JoinPSI_15_01"); //Baal Orun říká, že jsem jako dobrý služebník Spáče uspěl.
		counter = counter + 1;
	};

	if (Npc_KnowsInfo(hero, DIA_BaalCadar_SleepSpell))
	{
//		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_02"); //Carry on...
//		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_02"); //Weiter ...
		AI_Output(self, other, "GUR_1201_CorKalom_JoinPSI_10_02"); //Pokračuj...
//		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_03"); //Baal Cadar considers me a receptive student.
//		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_03"); //Baal Cadar hält mich für einen gelehrigen Schüler.
		AI_Output(other, self, "GUR_1201_CorKalom_JoinPSI_15_03"); //Baal Cadar mě považuje za vnímavého žáka.
		counter = counter + 1;
	};

	if (Npc_KnowsInfo(hero, DIA_BaalNamib_FirstTalk))
	{
//		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_04"); //Baal Namib is convinced that I'm a true believer.
//		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_04"); //Baal Namib ist überzeugt, dass ich ein wahrer Anhänger des Glaubens bin.
		AI_Output(other, self, "GUR_1201_CorKalom_JoinPSI_15_04"); //Baal Namib mě považuje za pravověrce.
		counter = counter + 1;
	};

	if (Npc_KnowsInfo(hero, DIA_BaalTyon_Vision))
	{
//		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_05"); //Thanks to me, Baal Tyon had a vision.
//		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_05"); //Baal Tyon hatte dank mir eine Vision.
		AI_Output(other, self, "GUR_1201_CorKalom_JoinPSI_15_05"); //Díky mně měl Baal Tyon vidinu.
		counter = counter + 1;
	};

	if (Npc_KnowsInfo(hero, DIA_BaalTondral_SendToKalom))
	{
//		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_06"); //And?
//		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_06"); //Und?
		AI_Output(self, other, "GUR_1201_CorKalom_JoinPSI_10_06"); //A?
//		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_07"); //Baal Tondral says, I should receive the robe. I have brought him a new student.
//		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_07"); //Baal Tondral sagt, ich soll die Robe erhalten. Ich habe einen neuen Schüler zu ihm geführt.
		AI_Output(other, self, "GUR_1201_CorKalom_JoinPSI_15_07"); //Baal Tondral říká, že bych měl obdržet roucho. Přivedl jsem mu nového žáka.
		counter = counter + 1;
	};

	//-------------------------------------
	if (hero.level >= 5)
	{
		if (counter >= 4)
		{
//			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_08"); //Good. if the Baals support you, that should be enough for me.
//			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_08"); //Gut. Wenn die Baals für dich sprechen, dann soll mir das reichen.
			AI_Output(self, other, "GUR_1201_CorKalom_JoinPSI_10_08"); //Dobře. Jestli máš podporu Baalů, tak mi to stačí.
//			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_09"); //Here, put this on. And now go and make yourself useful.
//			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_09"); //Hier, zieh das an. Und jetzt geh und mach dich nützlich.
			AI_Output(self, other, "GUR_1201_CorKalom_JoinPSI_10_09"); //Tady, obleč si ho. A teď běž a snaž se být užitečný.

			// Ernennung zum Novizen
			CreateInvItem(self, NOV_ARMOR_M);
			B_GiveInvItems(self, hero, NOV_ARMOR_M, 1);
			AI_EquipBestArmor(other);
			Npc_SetTrueGuild(hero, GIL_NOV);
			hero.guild = GIL_NOV;
//			B_LogEntry(CH1_JoinPsi,"Today Cor Kalom has appointed me a novice. He was as unbearable as always, but now I really belong to the Brotherhood of the Sleeper in the swamp camp.");
//			B_LogEntry(CH1_JoinPsi,"Heute hat mich Cor Kalom zum Novizen ernannt. Er war zwar unausstehlich wie immer, doch nun gehöre ich endlich fest zur Bruderschaft im Sumpflager.");
			B_LogEntry(CH1_JoinPsi, "Dnes mě Cor Kalom jmenoval novicem. Byl jako obvykle nesnesitelný, ale konečně patřím k Bratrstvu Spáče z Tábora v bažinách.");
//			B_LogEntry(GE_TraderPSI,"I'll get better NOVICE ARMOR from Baal Namib.");
//			B_LogEntry(GE_TraderPSI,"Bessere NOVIZENRÜSTUNGEN bekomme ich von Baal Namib.");
			B_LogEntry(GE_TraderPSI, "Od Baala Namiba dostanu lepší NOVICKOU ZBROJ.");
			Log_SetTopicStatus(CH1_JoinPsi, LOG_SUCCESS);
			B_GiveXP(XP_BecomeNovice);

			// Canceln der anderen Aufnahmen
			Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
			Log_SetTopicStatus(CH1_JoinOC, LOG_FAILED);
//			B_LogEntry(CH1_JoinOC,"Since I've now finally decided to join the Brotherhood of the Sleeper in the swamp camp, I can't become one Gomez' Shadows any more.");
//			B_LogEntry(CH1_JoinOC,"Da ich mich nun endgültig für die Bruderschaft des Schläfers im Sumpflager entschieden habe, kann ich kein Schatten Gomez' mehr werden");
			B_LogEntry(CH1_JoinOC, "Protože jsem se nakonec rozhodl přidat k Bratrstvu Spáče Tábora v bažinách, nemohu se stát jedním z Gomezových Stínů.");

			Log_CreateTopic(CH1_JoinNC, LOG_MISSION);
			Log_SetTopicStatus(CH1_JoinNC, LOG_FAILED);
//			B_LogEntry(CH1_JoinNC,"I can't join the rogues of the New Camp any more, because my new place is with the Brotherhood of the Sleeper.");
//			B_LogEntry(CH1_JoinNC,"Eine Aufnahme bei den Banditen des Neuen Lagers ist nun nicht mehr möglich, denn meine neue Heimat ist die Bruderschaft des Schläfers");
			B_LogEntry(CH1_JoinNC, "Nemohu se už přidat k banditům z Nového tábora, protože moje nové místo je teď v Bratrstvu Spáče.");

			//Log_SetTopicStatus(CH1_LostNek,LOG_FAILED);
			//Log_SetTopicStatus(CH1_FiskNewDealer,LOG_FAILED);
			//Log_SetTopicStatus(CH1_KalomsRecipe,LOG_FAILED);
			//Log_SetTopicStatus(CH1_BringList,LOG_FAILED);
			//Log_SetTopicStatus(CH1_MordragKO,LOG_FAILED);
		}
		else
		{
//			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00"); //And?
//			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00"); //Und?
			AI_Output(self, other, "GUR_1201_CorKalom_JoinPSI_NOT_10_00"); //A?
//			AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01"); //That was it.
//			AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01"); //Das war alles.
			AI_Output(other, self, "GUR_1201_CorKalom_JoinPSI_NOT_15_01"); //To bylo všechno.
//			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02"); //You're wasting my precious time! Come back as soon as four of the Baals consider you worthy!
//			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02"); //Du stiehlst mir meine kostbare Zeit! Komm wieder, wenn mindestens vier der Baals dich für würdig erachten!
			AI_Output(self, other, "GUR_1201_CorKalom_JoinPSI_NOT_10_02"); //Okrádáš mě o drahocenný čas! Vrať se, až nejméně čtyři z Baalů rozhodnou, že jsi hoden.
		};
	}
	else
	{
		B_PrintGuildCondition(5);
	};
};

// ****************************************
// 				Join PSI2
// ****************************************

instance GUR_1201_CorKalom_JoinPSI2(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_JoinPSI2_Condition;
	information = GUR_1201_CorKalom_JoinPSI2_Info;
	important = 0;
	permanent = 0;
//	description = "That was it? No welcome, no nothing?";
//	description = "Das war alles? Kein 'Herzlich Willkommen', kein gar nichts?";
	description = "To bylo všechno? Žádné 'Vítej', nic?";
};

func int GUR_1201_CorKalom_JoinPSI2_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_JoinPSI2_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_10"); //"That was it? No ""welcome"", no nothing?"
//	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_10"); //Das war alles? Kein "Herzlich Willkommen", kein gar nichts?
	AI_Output(other, self, "GUR_1201_CorKalom_JoinPSI_15_10"); //To bylo všechno? Žádné 'Vítej', nic?
//	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_11"); //Welcome.
//	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_11"); //Herzlich willkommen.
	AI_Output(self, other, "GUR_1201_CorKalom_JoinPSI_10_11"); //Vítej.
//	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_12"); //Sounds much better.
//	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_12"); //Gefällt mir schon viel besser.
	AI_Output(other, self, "GUR_1201_CorKalom_JoinPSI_15_12"); //To zní mnohem líp.
//	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_13"); //Don't hang around here! Do something. Take these weeds and give them to Gomez in the Old Camp.
//	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_13"); //Steh hier nicht rum! Tu was. Hier, nimm dieses Kraut und bring es zu Gomez ins alte Lager.
	AI_Output(self, other, "GUR_1201_CorKalom_JoinPSI_10_13"); //Nemotej se tady! Dělej něco! Vezmi tuhle drogu a dones ji Gomezovi do Starého tábora.
//	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_14"); //if his henchmen don't let you pass, tell them Cor Kalom sent you.
//	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_14"); //Wenn dich seine Schergen nicht durchlassen wollen, sag ihnen Cor Kalom schickt dich.
	AI_Output(self, other, "GUR_1201_CorKalom_JoinPSI_10_14"); //Když tě jeho posluhovači nebudou chtít pustit, řekni, že tě posílá Cor Kalom.

	CreateInvItems(self, itmijoint_3, 30);
	B_GiveInvItems(self, hero, itmijoint_3, 30);

	KALOM_KRAUTBOTE = LOG_RUNNING;
	Log_CreateTopic(CH1_KrautBote, LOG_MISSION);
	Log_SetTopicStatus(CH1_KrautBote, LOG_RUNNING);
//	B_LogEntry(CH1_KrautBote,"Cor Kalom sent me to Gomez in the Old Camp to deliver him weed.");
//	B_LogEntry(CH1_KrautBote,"Auf seine charmante Art und Weise schickte Cor Kalom mich zu Gomez ins Alte Lager, um ihm eine Lieferung Kraut zu bringen.");
	B_LogEntry(CH1_KrautBote, "Cor Kalom mě svým osobitým způsobem vyslal s dodávkou drogy z bažin za Gomezem do Starého tábora.");

//	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_15"); //What, are you still here?
//	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_15"); //Du bist ja immer noch hier!
	AI_Output(self, other, "GUR_1201_CorKalom_JoinPSI_10_15"); //Cože, ty jsi ještě tady?
	AI_StopProcessInfos(self);
};

// **************************************************************************
// 							MISSION: Drug Monopol
// **************************************************************************

// --------------------------------------------------------------------------

instance Info_Kalom_DrugMonopol(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = Info_Kalom_DrugMonopol_Condition;
	information = Info_Kalom_DrugMonopol_Info;
	important = 0;
	permanent = 0;
//	description = "Have YOU got another task for me?";
//	description = "Hast DU noch eine Aufgabe für mich?";
	description = "Máš pro mě ještě jiný úkol?";
};

func int Info_Kalom_DrugMonopol_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NOV)
	{
		return 1;
	};

	return 0;
};

func void Info_Kalom_DrugMonopol_Info()
{
//	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00"); //Have YOU got another task for me?
//	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00"); //Hast DU noch eine Aufgabe für mich?
	AI_Output(other, self, "Mis_1_Psi_Kalom_DrugMonopol_15_00"); //Máš pro mě ještě jiný úkol?
//	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_01"); //In the New Camp there is a small group of men who have started producing their own weed.
//	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_01"); //Im Neuen Lager gibt es eine kleine Gruppe von Männern, die ihre eigene Krautproduktion angefangen haben.
	AI_Output(self, other, "Mis_1_Psi_Kalom_DrugMonopol_10_01"); //V Novém táboře je malá skupinka lidí, kteří začali vyrábět svoji vlastní drogu z bažin.
	//AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_02"); //Sie wollen unsere Kunden im Neuen Lager abwerben, Das werden wir nicht zulassen.
//	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_03"); //See to it that they stop their production.
//	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_03"); //Kümmere dich darum, dass sie die Produktion einstellen.
	AI_Output(self, other, "Mis_1_Psi_Kalom_DrugMonopol_10_03"); //Postarej se, aby tu produkci ukončili.
//	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_04"); //How...
//	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_04"); //Und wie ...
	AI_Output(other, self, "Mis_1_Psi_Kalom_DrugMonopol_15_04"); //A jak...
//	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_05"); //Do not bother me with details!
//	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_05"); //Belästige mich nicht mit Details!
	AI_Output(self, other, "Mis_1_Psi_Kalom_DrugMonopol_10_05"); //Neobtěžuj mě s podrobnostmi!
//	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_06"); //The weed mixers' camp must be somewhere outside the New Camp. You know what to do.
//	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_06"); //Die Krautmischer müssen ihr Lager irgendwo außerhalb des Neuen Lagers haben. Du weißt, was du zu tun hast.
	AI_Output(self, other, "Mis_1_Psi_Kalom_DrugMonopol_10_06"); //Tábor míchačů drogy musí být někde mimo Nový tábor. Víš, co máš dělat.

	Kalom_DrugMonopol = LOG_RUNNING;
	Log_CreateTopic(CH1_DrugMonopol, LOG_MISSION);
	Log_SetTopicStatus(CH1_DrugMonopol, LOG_RUNNING);
//	B_LogEntry(CH1_DrugMonopol,"Cor Kalom wants me to suppress the rivaling weed production in the New Camp. I don't exactly know where to start, but I should do so IN FRONT OF the New Camp.");
//	B_LogEntry(CH1_DrugMonopol,"Cor Kalom will, dass ich eine konkurrierende Krautproduktion einiger Leute im Neuen Lager unterbinde. Ich hab' keine Ahnung, wo genau ich anfangen soll zu suchen, aber ich sollte VOR dem Neuen Lager anfangen.");
	B_LogEntry(CH1_DrugMonopol, "Cor Kalom chce, abych zastavil konkurenční produkci drogy v Novém táboře. Nevím přesně kde mám hledat, ale snad bych mohl začít PŘED Novým táborem.");

	//TODO: why?
	var C_Npc Renyu;
	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	Renyu.aivar[AIV_WASDEFEATEDBYSC] = FALSE;

	var C_Npc Killian;
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Killian.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};

// **************************************************************************
// 							SUCCESS
// **************************************************************************

instance Info_Kalom_Success(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = Info_Kalom_Success_Condition;
	information = Info_Kalom_Success_Info;
	important = 0;
	permanent = 1;
//	description = "Regarding the weed production in the New Camp...";
//	description = "Wegen der Krautherstellung im Neuen Lager...";
	description = "Co se týká produkce drogy v Novém táboře...";
};

func int Info_Kalom_Success_Condition()
{
	if (Kalom_DrugMonopol == LOG_RUNNING)
	{
		return 1;
	};

	return 0;
};

func void Info_Kalom_Success_Info()
{
	var C_Npc Killian; Killian = Hlp_GetNpc(ORG_861_Killian);
	var C_Npc Renyu; Renyu = Hlp_GetNpc(ORG_860_Renyu);
	var C_Npc Jacko; Jacko = Hlp_GetNpc(ORG_862_Jacko);

//	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_00"); //Regarding the weed production in the New Camp...
//	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_00"); //Wegen der Krautherstellung im Neuen Lager ...
	AI_Output(other, self, "Mis_1_Psi_Kalom_Success_15_00"); //Co se týká produkce drogy v Novém táboře...
//	AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_01"); //Yes?
//	AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_01"); //Ja?
	AI_Output(self, other, "Mis_1_Psi_Kalom_Success_10_01"); //Ano?

	if (Stooges_Fled != TRUE)
	{
//		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_02"); //I can't find these men.
//		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_02"); //Ich finde die Männer nicht.
		AI_Output(other, self, "Mis_1_Psi_Kalom_Success_15_02"); //Nemůžu ty muže najít.
//		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_03"); //I wouldn't have expected anything else from you.
//		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_03"); //Ich hatte nichts anderes von dir erwartet.
		AI_Output(self, other, "Mis_1_Psi_Kalom_Success_10_03"); //Nic jiného jsem od tebe neočekával.
	}
	else if ((Stooges_Fled == TRUE) //#Needs_Attention - zbytocna podmienka - smažit :)
	|| (Npc_IsDead(Jacko) && Npc_IsDead(Renyu) && Npc_IsDead(Killian))) //#Needs_Attention Npc_IsDead nefunguje, ak sa NPC despawnuje (toto sposobuje chyby aj v G2A - tam nato musime tiez dat pozor)
	{
//		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04"); //They are gone.
//		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04"); //Es gibt sie nicht mehr.
		AI_Output(other, self, "Mis_1_Psi_Kalom_Success_15_04"); //Už neexistuje.
//		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_05"); //You surprise me. I underestimated your abilities. Maybe you could be useful after all.
//		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_05"); //Du überraschst mich. Ich hatte dich unterschätzt. Vielleicht könntest du uns doch zu etwas nützen.
		AI_Output(self, other, "Mis_1_Psi_Kalom_Success_10_05"); //Překvapil jsi mě. Podcenil jsem tě. Možná bys přece jen mohl být užitečný.
		//AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_06"); //Rede mit den Baals.

		Kalom_DrugMonopol = LOG_SUCCESS;
//		B_LogEntry(CH1_DrugMonopol,"I've informed Cor Kalom that the rivaling weed production in the New Camp has been stopped. His reaction was as 'friendly' as always.");
//		B_LogEntry(CH1_DrugMonopol,"Ich habe Cor Kalom die Einstellung der konkurrierenden Krautproduktion im Neuen Lager gemeldet. Er reagierte 'freundlich' wie immer.");
		B_LogEntry(CH1_DrugMonopol, "Informoval jsem Cor Kaloma o tom, jak jsem zastavil produkci drogy v Novém táboře. Jeho reakce byla 'přátelská' jako vždy.");
		Log_SetTopicStatus(CH1_DrugMonopol, LOG_SUCCESS);
		B_GiveXP(XP_DrugMonopol);
	};
};

// ****************************************************************
// 							KRAUTBOTE ZURÜCK
// ****************************************************************

instance Info_Kalom_KrautboteBACK(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = Info_Kalom_KrautboteBACK_Condition;
	information = Info_Kalom_KrautboteBACK_Info;
	important = 0;
	permanent = 1;
//	description = "I've delivered the weed.";
//	description = "Ich habe das Kraut abgeliefert.";
	description = "Doručil jsem tu drogu.";
};

func int Info_Kalom_KrautboteBACK_Condition()
{
	if (Kalom_DeliveredWeed)
	{
		return 1;
	};

	return 0;
};

func void Info_Kalom_KrautboteBACK_Info()
{
//	AI_Output(other,self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00"); //I've delivered the weed.
//	AI_Output(other,self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00"); //Ich habe das Kraut abgeliefert.
	AI_Output(other, self, "Mis_1_Psi_Kalom_KrautboteBACK_15_00"); //Doručil jsem tu drogu.

	if (Npc_HasItems(hero, itminugget) >= 500)
	{
//		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01"); //Good. Get another task somewhere else.
//		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01"); //Gut. Mach dich anderweitig nützlich.
		AI_Output(self, other, "Mis_1_Psi_Kalom_KrautboteBACK_10_01"); //Dobře. Buď užitečný někde jinde.

		Kalom_DrugMonopol = LOG_SUCCESS;
//		B_LogEntry(CH1_KrautBote,"Cor Kalom received money for the weed delivery to the Ore Barons.");
//		B_LogEntry(CH1_KrautBote,"Cor Kalom hat das Geld für die Krautlieferung an die Erzbarone erhalten.");
		B_LogEntry(CH1_KrautBote, "Cor Kalom přijal peníze za dodávku drogy Rudobaronům.");
		Log_SetTopicStatus(CH1_KrautBote, LOG_SUCCESS);
		B_GiveInvItems(hero, self, ItMiNugget, 500);
		B_GiveXP(XP_WeedShipmentReported);

		Info_Kalom_KrautboteBACK.permanent = 0;
	}

	else
	{
//		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02"); //Where's the 500 ore, boy? Make sure I get them real fast!
//		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02"); //Wo sind die 500 Erz, Bursche? Beeil dich besser, sie mir zu bringen!
		AI_Output(self, other, "Mis_1_Psi_Kalom_KrautboteBACK_10_02"); //Kde je těch 500 nugetů, chlapče? Zajisti, abych je hodně rychle dostal!
	};
};

// **************************************************************************
//
// 									KAPITEL 2
//
// **************************************************************************
instance Info_CorKalom_BringFocus(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringFocus_Condition;
	information = Info_CorKalom_BringFocus_Info;
	important = 0;
	permanent = 0;
//	description = "Y'Berion sent me. I have the focus.";
//	description = "Y'Berion schickt mich. Ich habe den Fokus.";
	description = "Poslal mě Y´Berion. Mám to ohnisko.";
};

func int Info_CorKalom_BringFocus_Condition()
{
	if ((YBerion_BringFocus == LOG_SUCCESS)
	&& (Npc_HasItems(hero, Focus_1)))
	{
		return 1;
	};

	return 0;
};

func void Info_CorKalom_BringFocus_Info()
{
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01"); //Y'Berion sent me. I have the focus.
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01"); //Y'Berion schickt mich. Ich habe den Fokus.
	AI_Output(other, self, "Sit_2_PSI_Yberion_BringFocus_Info3_15_01"); //Poslal mě Y´Berion. Mám to ohnisko.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02"); //Ahhhh - the focus... At last. Now I can study the magic of these artefacts.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02"); //Ahhhh - der Fokus ... Jetzt kann ich mich endlich den Studien über die Magie dieser Artefakte widmen.
	AI_Output(self, other, "Sit_2_PSI_Yberion_BringFocus_Info3_10_02"); //Aaahh - ohnisko... Teď se konečně mohu věnovat studiu magie tohoto artefaktu.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03"); //if I only had enough secretion... damn!
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03"); //Wenn ich nur ausreichend Sekret hätte ... Verflucht!
	AI_Output(self, other, "Sit_2_PSI_Yberion_BringFocus_Info3_10_03"); //Kdybych jen měl dostatek výměšku... sakra!

//	B_LogEntry(CH2_Focus,"I've dropped of the ominous focus at Cor Kalom's!");
//	B_LogEntry(CH2_Focus,"Ich habe den ominösen Fokus bei Cor Kalom abgeliefert!");
	B_LogEntry(CH2_Focus, "Nechal jsem u Cora Kaloma zlověstné ohnisko!");
	Log_SetTopicStatus(CH2_Focus, LOG_SUCCESS);

	B_GiveInvItems(hero, self, Focus_1, 1);
	Npc_RemoveInvItem(self, Focus_1);
	B_GiveXP(XP_BringFocusToCorKalom);
};

// ------------------------------ 2. Belohnung für Fokus ergaunern ----------------------------------
instance Info_CorKalom_BLUFF(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 10;
	condition = Info_CorKalom_BLUFF_Condition;
	information = Info_CorKalom_BLUFF_Info;
	important = 0;
	permanent = 0;
//	description = "Y'Berion said you'd pay me if I brought you the focus!";
//	description = "Y'Berion sagte mir, du würdest mich entlohnen";
	description = "Y´Berion řekl, že mě odměníš, až ti to ohnisko donesu!";
};

func int Info_CorKalom_BLUFF_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_CorKalom_BringFocus))
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS))
	{
		return 1;
	};

	return 0;
};

func void Info_CorKalom_BLUFF_Info()
{
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01"); //Y'Berion said you'd pay me if I brought you the focus!
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01"); //Y'Berion sagte mir, du würdest mich entlohnen, wenn ich dir den Fokus bringe!
	AI_Output(other, self, "Sit_2_PSI_Yberion_BLUFF_Info3_15_01"); //Y´Berion řekl, že mě odměníš, až ti to ohnisko donesu!
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02"); //Really? He said that? Well then. I suppose 50 ore should be enough!
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02"); //Tatsächlich? Hat er das gesagt? Nun gut. Ich denke, 50 Erz sollten reichen!
	AI_Output(self, other, "Sit_2_PSI_Yberion_BLUFF_Info3_10_02"); //Opravdu? To, že řekl? Dobrá tedy. Předpokládám, že 50 nugetů by mělo stačit!

	CreateInvItems(self, Itminugget, 50);
	B_GiveInvItems(self, other, Itminugget, 50);
};

// ***************************** INFOS ****************************************//
instance GUR_1201_CorKalom_SACHE(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_SACHE_Condition;
	information = GUR_1201_CorKalom_SACHE_Info;
	important = 0;
	permanent = 0;
//	description = "Secretion?";
//	description = "Sekret?";
	description = "Výměšek?";
};

func int GUR_1201_CorKalom_SACHE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_CorKalom_BringFocus))
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_SACHE_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_Info_15_01"); //Secretion?
//	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_Info_15_01"); //Sekret?
	AI_Output(other, self, "GUR_1201_CorKalom_SACHE_Info_15_01"); //Výměšek?
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_02"); //Yes. As you must know, I produce the magic potions for the invocation of the Sleeper. For this purpose I need the secretion from the minecrawlers' mandibles.
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_02"); //Ja. Wie du sicher schon weißt, stelle ich die Elixiere für die Anrufung des Schläfers her. Ich benutze dafür das Sekret aus den Zangen der Minecrawler.
	AI_Output(self, other, "GUR_1201_CorKalom_SACHE_Info_10_02"); //Ano. Jak jistě víš, připravuji magický lektvar pro vzývání Spáče. Pro tento účel potřebuji výměšek z čelistí důlních červů.
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_03"); //You know what minecrawlers are, don't you?
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_03"); //Du weißt doch, was Minecrawler sind?
	AI_Output(self, other, "GUR_1201_CorKalom_SACHE_Info_10_03"); //Víš přece, co jsou důlní červi, ne?

	Info_ClearChoices(GUR_1201_CorKalom_SACHE);
//	Info_AddChoice (GUR_1201_CorKalom_SACHE,"No",GUR_1201_CorKalom_SACHE_NEIN);
//	Info_AddChoice (GUR_1201_CorKalom_SACHE,"Nein",GUR_1201_CorKalom_SACHE_NEIN);
	Info_AddChoice(GUR_1201_CorKalom_SACHE, "Ne.", GUR_1201_CorKalom_SACHE_NEIN);
//	Info_AddChoice (GUR_1201_CorKalom_SACHE,"Yes",GUR_1201_CorKalom_SACHE_JA);
//	Info_AddChoice (GUR_1201_CorKalom_SACHE,"Ja",GUR_1201_CorKalom_SACHE_JA);
	Info_AddChoice(GUR_1201_CorKalom_SACHE, "Ano.", GUR_1201_CorKalom_SACHE_JA);
};

//------------------------------------------------------
func void GUR_1201_CorKalom_SACHE_NEIN()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_NEIN_15_01"); //No.
//	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_NEIN_15_01"); //Nein
	AI_Output(other, self, "GUR_1201_CorKalom_SACHE_NEIN_15_01"); //Ne.
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_02"); //They are dangerous beasts that creep through dark mines and devour any human flesh they can get.
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_02"); //Das sind gefährliche Bestien, die durch die dunklen Minen kriechen und jeden Menschen verspeisen, den sie fassen können.
	AI_Output(self, other, "GUR_1201_CorKalom_SACHE_NEIN_10_02"); //Jsou to nebezpečné bestie, které se plíží temnými doly a sežerou každého, na koho přijdou.
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_03"); //Their mandibles contain a special secretion.
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_03"); //Ihre Zangen enthalten ein ganz besonderes Sekret.
	AI_Output(self, other, "GUR_1201_CorKalom_SACHE_NEIN_10_03"); //Jejich čelisti obsahují zvláštní výměšek.
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_04"); //I use it to produce a potion which guides the spiritual path to the Sleeper.
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_04"); //Aus diesem Sekret stelle ich ein Elixier her, das uns den spirituellen Weg zum Schläfer zeigt.
	AI_Output(self, other, "GUR_1201_CorKalom_SACHE_NEIN_10_04"); //Z tohoto výměšku připravuji elixír, který nás provádí po duchovní cestě ke Spáčovi.
	Info_ClearChoices(GUR_1201_CorKalom_SACHE);
};

//------------------------------------------------------
func void GUR_1201_CorKalom_SACHE_JA()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01"); //Yes.
//	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01"); //Ja.
	AI_Output(other, self, "GUR_1201_CorKalom_SACHE_JA_15_01"); //Ano.
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_JA_10_02"); //Very good!
//	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_JA_10_02"); //Ausgezeichnet!
	AI_Output(self, other, "GUR_1201_CorKalom_SACHE_JA_10_02"); //Výborně!
	Info_ClearChoices(GUR_1201_CorKalom_SACHE);
};

// ***************************** INFOS ****************************************//
instance GUR_1201_CorKalom_VISION(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_VISION_Condition;
	information = GUR_1201_CorKalom_VISION_Info;
	important = 0;
	permanent = 0;
//	description = "Speak on!";
//	description = "Erzähl weiter!";
	description = "Mluv dál!";
};

func int GUR_1201_CorKalom_VISION_Condition()
{
	if (Npc_KnowsInfo(hero, GUR_1201_CorKalom_SACHE))
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_VISION_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_01"); //Speak on!
//	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_01"); //Erzähl weiter!
	AI_Output(other, self, "GUR_1201_CorKalom_VISION_Info_15_01"); //Mluv dál!
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_02"); //Well, just a short time ago I had a vision of the Sleeper himself. He gave me a sign.
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_02"); //Also, ich hatte vor kurzem eine Vision vom Schläfer persönlich. Er gab mir ein Zeichen.
	AI_Output(self, other, "GUR_1201_CorKalom_VISION_Info_10_02"); //Dobrá, před nedávnem jsem měl sám vidinu Spáče. Dal mi znamení.
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_03"); //He made me understand that there is a means other than the secretion from the mandibles.
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_03"); //Er gab mir zu verstehen, dass es ein anderes Mittel gibt als das Sekret der Zangen.
	AI_Output(self, other, "GUR_1201_CorKalom_VISION_Info_10_03"); //Sdělil mi, že existuje ještě jiný prostředek, než ten výměšek z čelistí.
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_04"); //And he chose me to pass on this mission. You're not getting this mission from me. You're getting it from the Sleeper!
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_04"); //Und er wählte mich, diese Mission weiterzugeben. Du bekommst diese Mission nicht von mir. Du bekommst sie vom Schläfer!
	AI_Output(self, other, "GUR_1201_CorKalom_VISION_Info_10_04"); //A vybral si mě, abych předal toto poselství. Toto poselství není ode mě. Toto poselství je od Spáče!
//	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_05"); //Impossible!
//	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_05"); //Nicht möglich!
	AI_Output(other, self, "GUR_1201_CorKalom_VISION_Info_15_05"); //To není možné!
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_06"); //Be silent, fool!
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_06"); //Schweig, Narr!
	AI_Output(self, other, "GUR_1201_CorKalom_VISION_Info_10_06"); //Ticho, hlupáku!
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_07"); //He made me understand that the path I have embarked upon is right, but the means aren't strong enough.
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_07"); //Er gab mir zu verstehen, dass mein Weg richtig ist, nur dass das Mittel nicht stark genug sei.
	//#Needs_attention - 'ten prostředek' mi tu nesedi, neprebasnime?
	AI_Output(self, other, "GUR_1201_CorKalom_VISION_Info_10_07"); //Srozuměl mě, že cesta, na kterou jsem se dal, je TA pravá, ale ten prostředek v lektvaru není dostatečně silný.
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_08"); //The right means can be found with the minecrawlers, but the mandibles are not sufficient.
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_08"); //Das bedeutet, das Mittel, was wir suchen, finden wir bei den Minecrawlern, nur die Zangen sind nicht ausreichend.
	AI_Output(self, other, "GUR_1201_CorKalom_VISION_Info_10_08"); //To znamená... ten prostředek, co potřebujeme najdeme u důlních červů, ale čelisti to nejsou.
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_09"); //There must be something else.
//	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_09"); //Es muss etwas anderes geben.
	AI_Output(self, other, "GUR_1201_CorKalom_VISION_Info_10_09"); //Musí tu být ještě něco jiného.
};

// ***************************** INFOS ****************************************//

instance GUR_1201_CorKalom_NEST(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_NEST_Condition;
	information = GUR_1201_CorKalom_NEST_Info;
	important = 0;
	permanent = 0;
//	description = "Have you never examined the minecrawlers?";
//	description = "Habt ihr die Minecrawler nie untersucht?";
	description = "Vy jste důlní červy nikdy nezkoumali?";
};

func int GUR_1201_CorKalom_NEST_Condition()
{
	if (Npc_KnowsInfo(hero, GUR_1201_CorKalom_VISION))
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_NEST_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_NEST_Info_15_01"); //Have you never examined the minecrawlers? I mean, maybe there's another body part which contains more of the secretion.
//	AI_Output(other,self,"GUR_1201_CorKalom_NEST_Info_15_01"); //Habt ihr die Minecrawler nie untersucht? Ich meine, vielleicht gibt es ein anders Körperteil, das mehr von dem Sekret enthält.
	AI_Output(other, self, "GUR_1201_CorKalom_NEST_Info_15_01"); //Vy jste důlní červy nikdy nezkoumali? Myslím, že třeba ještě nějaká jiná část jejich těla obsahuje více toho výměšku.
//	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_02"); //Of course we have taken some minecrawlers apart, but only their mandibles seemed to contain the secretion.
//	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_02"); //Natürlich haben wir schon einige Minecrawler seziert, aber nur ihre Zangen scheinen das Sekret zu enthalten.
	AI_Output(self, other, "GUR_1201_CorKalom_NEST_Info_10_02"); //Samozřejmě jsme několik důlních červů pitvali, ale zdá se, že jedině čelisti obsahují ten výměšek.
//	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_03"); //There must be something else. Find their nest and you'll find the answer!
//	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_03"); //Es muss etwas anderes geben. Finde ihr Nest und du findest die Antwort!
	AI_Output(self, other, "GUR_1201_CorKalom_NEST_Info_10_03"); //Musí tu být ještě něco jiného. Najdi jejich hnízdo a tam najdeš odpověď!

	CorKalom_BringMCQBalls = LOG_RUNNING;
};

// ***************************** Mission MCEggs annehmen ****************************************//
func void GUR_1201_CorKalom_WEG_ACCEPT()
{
	Log_CreateTopic(CH2_MCEggs, LOG_MISSION);
	Log_SetTopicStatus(CH2_MCEggs, LOG_RUNNING);
//	B_LogEntry(CH2_MCEggs,"The Guru Cor Kalom asked me to look for a source of minecrawler secretion in the Old Mine. So far the monsters' mandibles have been used, but I'm to find something different to produce a stronger secretion.");
//	B_LogEntry(CH2_MCEggs,"Der Guru Cor Kalom hat mich beauftragt in der Alten Mine nach einer Quelle für Minecrawlersekret zu suchen. Bisher wurden dafür die Zangen dieser Monster benutzt, doch ich soll etwas anderes, besonderes finden, aus dem man ein besonders starkes Sekret herstellen könnte");
	B_LogEntry(CH2_MCEggs, "Guru Cor Kalom mě požádal, abych našel jiný zdroj výměšku důlních červů ve Starém dole. Doposud se používaly čelisti těch oblud a já mám objevit jiný zdroj, který obsahuje silnější výměšek.");

	//TODO: not required
	if (PresseTourJanuar2001)
	{
		CreateInvItems(hero, ItAt_Crawlerqueen, 3);
	};
};

// ***************************** INFOS ****************************************//

instance GUR_1201_CorKalom_WEG(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 21;
	condition = GUR_1201_CorKalom_WEG_Condition;
	information = GUR_1201_CorKalom_WEG_Info;
	important = 0;
	permanent = 0;
//	description = "That sounds like a dark and sinister kind of search!";
//	description = "Das wird bestimmt eine finstere Suche!";
	description = "To vypadá na temné a zlověstné pátrání!";
};

func int GUR_1201_CorKalom_WEG_Condition()
{
	if ((Npc_KnowsInfo(hero, GUR_1201_CorKalom_NEST))
	&& (!Npc_KnowsInfo(hero, GUR_1201_CorKalom_RAT)))
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_WEG_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_WEG_Info_15_01"); //That sounds like a dark and sinister kind of search!
//	AI_Output(other,self,"GUR_1201_CorKalom_WEG_Info_15_01"); //Das wird bestimmt eine finstere Suche!
	AI_Output(other, self, "GUR_1201_CorKalom_WEG_Info_15_01"); //To vypadá na temné a zlověstné pátrání!
//	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_02"); //Take these spell scrolls of light, you'll be able to make good use of them in the dark shafts.
//	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_02"); //Nimm diese Spruchrollen des Lichts, du wirst sie in den dunklen Stollen gut gebrauchen können.
	AI_Output(self, other, "GUR_1201_CorKalom_WEG_Info_10_02"); //Vezmi si tyhle kouzelné světelné svitky - v temných šachtách ti mohou být velmi užitečné.
//	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_03"); //The templars in the mines will help you.
//	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_03"); //Die Templer in den Minen werden dir helfen.
	AI_Output(self, other, "GUR_1201_CorKalom_WEG_Info_10_03"); //Templáři v dolech ti pomohou.
//	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_04"); //May the Sleeper give you power, may his light shine on your path and enlighten your spirit, and may he strengthen your will!
//	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_04"); //Möge der Schläfer dir Kraft schenken, möge sein Licht auf deinem Weg leuchten, deinen Geist erhellen und deinen Willen festigen!
	AI_Output(self, other, "GUR_1201_CorKalom_WEG_Info_10_04"); //Ať ti Spáč dodá sílu, ať ti svítí na cestu a osvítí ducha a nechť posílí tvoji mysl!

	CreateInvItems(self, ItArScrollLight, 5);
	B_GiveInvItems(self, other, ItArScrollLight, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};

// ***************************** INFOS ****************************************//
instance GUR_1201_CorKalom_RAT(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 20;
	condition = GUR_1201_CorKalom_RAT_Condition;
	information = GUR_1201_CorKalom_RAT_Info;
	important = 0;
	permanent = 0;
//	description = "Looks like this might become quite a bloody adventure!";
//	description = "Das wird bestimmt ein blutiges Abenteuer!";
	description = "Uvědom si, že by to mohlo být docela krvavé dobrodružství!";
};

func int GUR_1201_CorKalom_RAT_Condition()
{
	if ((Npc_KnowsInfo(hero, GUR_1201_CorKalom_NEST))
	&& (!Npc_KnowsInfo(hero, GUR_1201_CorKalom_WEG)))
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_RAT_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_RAT_Info_15_01"); //Looks like this might become quite a bloody adventure!
//	AI_Output(other,self,"GUR_1201_CorKalom_RAT_Info_15_01"); //Das wird bestimmt ein blutiges Abenteuer!
	AI_Output(other, self, "GUR_1201_CorKalom_RAT_Info_15_01"); //Uvědom si, že by to mohlo být docela krvavé dobrodružství!
//	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_02"); //Take these potions with you.
//	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_02"); //Nimm diese Heiltränke mit.
	AI_Output(self, other, "GUR_1201_CorKalom_RAT_Info_10_02"); //Vezmi si s sebou tyhle lektvary.
//	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_03"); //I am not giving them to you because I want you to stay alive, but because this task needs to be done.
//	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_03"); //Ich gebe sie dir nicht, weil ich unbedingt will, das du am Leben bleibst, sondern weil diese Aufgabe erfüllt werden muss.
	AI_Output(self, other, "GUR_1201_CorKalom_RAT_Info_10_03"); //Nedávám ti je, protože bych chtěl, abys zůstal naživu, ale protože tento úkol musí být splněn.

	CreateInvItems(self, ItFo_Potion_Health_02, 5);
	B_GiveInvItems(self, other, ItFo_Potion_Health_02, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};

// ***************************** INFOS ****************************************//
instance GUR_1201_CorKalom_RUN(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_RUN_Condition;
	information = GUR_1201_CorKalom_RUN_Info;
	important = 0;
	permanent = 0;
//	description = "Where will I find the minecrawlers?";
//	description = "Wo finde ich die Minecrawler?";
	description = "Kde najdu důlní červy?";
};

func int GUR_1201_CorKalom_RUN_Condition()
{
	if ((CorKalom_BringMCQBalls == LOG_RUNNING)
	&& (Npc_HasItems(hero, ItAt_Crawlerqueen) < 1))
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_RUN_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_01"); //Where will I find the minecrawlers?
//	AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_01"); //Wo finde ich die Minecrawler?
	AI_Output(other, self, "GUR_1201_CorKalom_RUN_Info_15_01"); //Kde najdu důlní červy?
//	AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_02"); //In the Old Mine.
//	AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_02"); //In der Alten Mine.
	AI_Output(self, other, "GUR_1201_CorKalom_RUN_Info_10_02"); //Ve Starém dole.

	if (!EnteredOldMine)
	{
//		AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_03"); //Where is the Old Mine?
//		AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_03"); //Wo ist die Alte Mine?
		AI_Output(other, self, "GUR_1201_CorKalom_RUN_Info_15_03"); //Kde je Starý důl?
//		AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_04"); //Take this map. Any important places within the Barrier are marked on it.
//		AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_04"); //Nimm diese Karte. Dort sind alle wichtigen Orte innerhalb der Barriere eingezeichnet.
		AI_Output(self, other, "GUR_1201_CorKalom_RUN_Info_10_04"); //Vem si tuhle mapu! Jsou na ní vyznačena všechna důležitá místa uvnitř Bariéry.
		CreateInvItem(self, ItWrWorldmap);
		B_GiveInvItems(self, other, ItWrWorldmap, 1);
	};
};

// ***************************** INFOS ****************************************//
instance GUR_1201_CorKalom_CRAWLER(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_CRAWLER_Condition;
	information = GUR_1201_CorKalom_CRAWLER_Info;
	important = 0;
	permanent = 0;
//	description = "What's the best way to fight the minecrawlers?";
//	description = "Wie kämpfe ich am besten gegen die Minecrawler?";
	description = "Jaký je nejlepší způsob boje s důlními červy?";
};

func int GUR_1201_CorKalom_CRAWLER_Condition()
{
	if ((Npc_KnowsInfo(hero, GUR_1201_CorKalom_RUN))
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS))
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_CRAWLER_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_CRAWLER_Info_15_01"); //What's the best way to fight the minecrawlers?
//	AI_Output(other,self,"GUR_1201_CorKalom_CRAWLER_Info_15_01"); //Wie kämpfe ich am besten gegen die Minecrawler?
	AI_Output(other, self, "GUR_1201_CorKalom_CRAWLER_Info_15_01"); //Jaký je nejlepší způsob boje s důlními červy?
//	AI_Output(self,other,"GUR_1201_CorKalom_CRAWLER_Info_10_02"); //There are templars in the mine. They hunt the crawlers for their mandibles. Speak to Gor Na Vid. He will help you.
//	AI_Output(self,other,"GUR_1201_CorKalom_CRAWLER_Info_10_02"); //In der Mine sind Templer. Sie jagen die Crawler wegen ihrer Zangen. Wende dich an Gor Na Vid. Er wird dir helfen.
	AI_Output(self, other, "GUR_1201_CorKalom_CRAWLER_Info_10_02"); //V dole jsou templáři. Loví červy kvůli čelistem. Zeptej se Gor Na Vida. Pomůže ti.
};

// ***************************** INFOS ****************************************//
instance GUR_1201_CorKalom_FIND(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_FIND_Condition;
	information = GUR_1201_CorKalom_FIND_Info;
	important = 0;
	permanent = 0;
//	description = "How can I find the nest in the mine?";
//	description = "Wie soll ich in der Mine das Nest finden?";
	description = "Jak najdu v dole hnízdo?";
};

func int GUR_1201_CorKalom_FIND_Condition()
{
	if (Npc_KnowsInfo(hero, GUR_1201_CorKalom_CRAWLER))
	{
		return 1;
	};

	return 0;
};

func void GUR_1201_CorKalom_FIND_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_01"); //How can I find the nest in the mine?
//	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_01"); //Wie soll ich in der Mine das Nest finden?
	AI_Output(other, self, "GUR_1201_CorKalom_FIND_Info_15_01"); //Jak najdu v dole hnízdo?
//	AI_Output(self,other,"GUR_1201_CorKalom_FIND_Info_10_02"); //That's the hardest part of the mission. I can't tell you where to search, nor what to search for. But the Sleeper will be with you.
//	AI_Output(self,other,"GUR_1201_CorKalom_FIND_Info_10_02"); //Das ist der schwierige Teil der Mission. Ich kann dir weder sagen wo, noch was du suchen musst. Aber der Schläfer wird bei dir sein.
	AI_Output(self, other, "GUR_1201_CorKalom_FIND_Info_10_02"); //To je nejobtížnější část tvého úkolu. Neřeknu ti, kde jej hledat, ani co v něm hledat. Spáč však bude při tobě.
//	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_03"); //Well, that's a comfort.
//	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_03"); //Na dann bin ich ja beruhigt.
	AI_Output(other, self, "GUR_1201_CorKalom_FIND_Info_15_03"); //Dobrá, to je útěcha.
};

// ------------------------------ SUCCESS ----------------------------------

instance Info_CorKalom_BringMCQBalls_Success(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringMCQBalls_Success_Condition;
	information = Info_CorKalom_BringMCQBalls_Success_Info;
	important = 0;
	permanent = 0;
//	description = "I found eggs belonging to a crawler queen";
//	description = "Ich habe Eier einer Crawler-Königin gefunden";
	description = "Našel jsem vajíčka královny důlních červů.";
};

func int Info_CorKalom_BringMCQBalls_Success_Condition()
{
	if (Npc_HasItems(hero, ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};

	return 0;
};

func void Info_CorKalom_BringMCQBalls_Success_Info()
{
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01"); //I found eggs belonging to a crawler queen
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01"); //Ich habe Eier einer Crawler-Königin gefunden
	AI_Output(other, self, "Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01"); //Našel jsem vajíčka královny důlních červů.
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02"); //I knew it. My vision was a sign. The queen's eggs must contain the strong secretion!
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02"); //Ich wusste es. Meine Vision war ein Zeichen. Die Eier ihrer Königin enthalten also das starke Sekret!
	AI_Output(self, other, "Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02"); //Znám je. Má vidina byla znamením. Královnina vajíčka musí obsahovat ten silnější výměšek.
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03"); //Excellent, with it I can create a potion to contact the Sleeper!
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03"); //Ausgezeichnet, damit kann ich ein Elixier brauen, das uns den Kontakt zum Schläfer ermöglicht!
	AI_Output(self, other, "Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03"); //Výborně, s ním vytvořím ten elixír pro spojení se Spáčem.
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04"); //What about my reward?
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04"); //Was ist mit der Belohnung?
	AI_Output(other, self, "Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04"); //A co má odměna?
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05"); //Oh, right... Thank you.
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05"); //Ah, ja richtig ... Danke.
	AI_Output(self, other, "Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05"); //Správně... Děkuju ti.
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06"); //I mean a TANGIBLE reward.
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06"); //Ich meine eine HANDFESTE Belohnung.
	AI_Output(other, self, "Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06"); //Myslím HMATATELNOU odměnu.
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07"); //Okay, okay. What do you want?
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07"); //Na gut, na gut. Was willst du?
	AI_Output(self, other, "Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07"); //No dobře, dobře. Co bys chtěl?
	CorKalom_BringMCQBalls = LOG_SUCCESS;
	B_GiveInvItems(hero, self, ItAt_Crawlerqueen, 3);
	Npc_RemoveInvItems(self, ItAt_Crawlerqueen, 3);
	B_GiveXP(XP_BringMCEggs);
//	B_LogEntry(CH2_MCEggs,"I've given Cor Kalom three of the minecrawlers' eggs. He was really unfriendly and I had to ask for my meager reward!");
//	B_LogEntry(CH2_MCEggs,"Ich habe Cor Kalom 3 der Minecrawler-Eier übergeben. Er war recht unhöflich und ich mußte meine karge Belohnung erst penetrant einfordern!");
	B_LogEntry(CH2_MCEggs, "Předal jsem Cor Kalomovi tři vajíčka důlních červů. Tvářil se velmi nepřátelsky a já ho musel požádat o svoji malou odměnu.");
	Log_SetTopicStatus(CH2_MCEggs, LOG_SUCCESS);

//	B_LogEntry(CH1_GotoPsiCamp,"I believe I now know enough about the sect business, so I can report to Mordrag about it.");
//	B_LogEntry(CH1_GotoPsiCamp,"Ich glaube, ich weiß jetzt genug über die Sektensache, daß ich Mordrag etwas darüber erzählen kann.");
	B_LogEntry(CH1_GotoPsiCamp, "Myslím, že toho o záměrech sekty vím již dost, a tak o tom můžu podat zprávu Mordragovi. ");
//	B_LogEntry(CH1_GotoPsi,"I believe I now know enough about the sect business. I should tell Raven about it as soon as I'm in the Old Camp.");
//	B_LogEntry(CH1_GotoPsi,"Ich glaube, ich weiß jetzt genug über die Sektensache. Ich sollte Raven davon erzählen, sobald ich wieder im alten Lager bin.");
	B_LogEntry(CH1_GotoPsi, "Myslím, že toho o záměrech sekty vím již dost. Jakmile budu ve Starém táboře, měl bych se o tom zmínit Ravenovi.");

	//#Needs_attention - pri tychto odmenach hrac nevie co vlastne dostane (Hojivý lektvar - je perma lektvar zivota) - nepouzijeme tu RM mechanizmus na odmeny ? (otvori sa inventar ako pri kradnuti - a mozes si vybrat 1 item)

	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
//	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"A rune.",Info_CorKalom_BringMCQBalls_Success_RUNE);
//	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Eine Rune",Info_CorKalom_BringMCQBalls_Success_RUNE);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success, "Runu.", Info_CorKalom_BringMCQBalls_Success_RUNE);
//	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"A weapon.",Info_CorKalom_BringMCQBalls_Success_WAFFE);
//	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Eine Waffe",Info_CorKalom_BringMCQBalls_Success_WAFFE);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success, "Nějakou zbraň.", Info_CorKalom_BringMCQBalls_Success_WAFFE);
//	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"A healing potion.",Info_CorKalom_BringMCQBalls_Success_HEAL);
//	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Heilmittel",Info_CorKalom_BringMCQBalls_Success_HEAL);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success, "Hojivý lektvar.", Info_CorKalom_BringMCQBalls_Success_HEAL);
//	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Ore.",Info_CorKalom_BringMCQBalls_Success_ORE);
//	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Erz",Info_CorKalom_BringMCQBalls_Success_ORE);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success, "Rudu.", Info_CorKalom_BringMCQBalls_Success_ORE);
//	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Mana.",Info_CorKalom_BringMCQBalls_Success_MANA);
//	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Manatrank",Info_CorKalom_BringMCQBalls_Success_MANA);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success, "Letvar many.", Info_CorKalom_BringMCQBalls_Success_MANA);
};

func void Info_CorKalom_BringMCQBalls_Success_RUNE()
{
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01"); //A rune.
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01"); //Eine Rune.
	AI_Output(other, self, "Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01"); //Runu.
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02"); //May this rune shine on your path!
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02"); //Möge diese Rune hier deinen Weg erleuchten!
	AI_Output(self, other, "Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02"); //Ať ti tato runa osvítí cestu!
	CreateInvItem(self, ItArRuneLight);
	B_GiveInvItems(self, hero, ItArRuneLight, 1);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_WAFFE()
{
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01"); //A weapon.
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01"); //Eine Waffe.
	AI_Output(other, self, "Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01"); //Nějakou zbraň.
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02"); //May this weapon destroy your enemies!
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02"); //Möge diese Waffe deine Feinde niederstrecken!
	AI_Output(self, other, "Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02"); //Kéž tato zbraň zničí tvé nepřátele!
	CreateInvItem(self, ItMw_1H_Mace_War_03);
	B_GiveInvItems(self, hero, ItMw_1H_Mace_War_03, 1);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_HEAL()
{
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01"); //A healing potion.
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01"); //Ein Heilmittel.
	AI_Output(other, self, "Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01"); //Hojivý lektvar.
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02"); //May this potion prolong your life!
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02"); //Möge dieser Trank dein Leben verlängern !
	AI_Output(self, other, "Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02"); //Kéž ti tento lektvar prodlouží život!
	CreateInvItem(self, ItFo_Potion_Health_Perma_01);
	B_GiveInvItems(self, hero, ItFo_Potion_Health_Perma_01, 1);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_ORE()
{
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01"); //Ore.
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01"); //Erz.
	AI_Output(other, self, "Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01"); //Rudu.
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02"); //Take this ore as a sign of gratitude from the entire Brotherhood!
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02"); //Nimm dieses Erz als Zeichen der Dankbarkeit der gesamten Bruderschaft!
	AI_Output(self, other, "Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02"); //Vem si tuhle rudu jako znamení vděčnosti celého Bratrstva!
	CreateInvItems(self, ItMinugget, 100);
	B_GiveInvItems(self, hero, ItMinugget, 100);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_MANA()
{
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01"); //Mana.
//	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01"); //Mana.
	AI_Output(other, self, "Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01"); //Letvar many.
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02"); //May this potion strengthen the magic within you!
//	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02"); //Möge dieser Trank die magische Energie in dir stärken!
	AI_Output(self, other, "Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02"); //Kéž tento lektvar probudí kouzlo, které v tobě dřímá!
	CreateInvItem(self, ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems(self, hero, ItFo_Potion_Mana_Perma_01, 1);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

// **************************************************************************
// 				MISSION: Bring Book
// **************************************************************************
instance Info_CorKalom_BringBook(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringBook_Condition;
	information = Info_CorKalom_BringBook_Info;
	important = 0;
	permanent = 0;
//	description = "Can we start invoking the Sleeper now?";
//	description = "Kann nun die Anrufung des Schläfers beginnen?";
	description = "Můžeme začít vzývat Spáče?";
};

func int Info_CorKalom_BringBook_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		return 1;
	};

	return 0;
};

func void Info_CorKalom_BringBook_Info()
{
//	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_01"); //Can we start invoking the Sleeper now?
//	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_01"); //Kann nun die Anrufung des Schläfers beginnen?
	AI_Output(other, self, "Info_CorKalom_BringBook_Info_15_01"); //Můžeme začít vzývat Spáče?
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_02"); //No! I haven't found a method to charge the focus yet.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_02"); //Nein! Es ist mir noch nicht gelungen, eine Methode zu entwickeln, den Fokus aufzuladen.
	AI_Output(self, other, "Info_CorKalom_BringBook_Info_10_02"); //Ne! Nenašel jsem ještě způsob, jak nabít to ohnisko.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_03"); //We are missing the ancient knowledge about these artefacts.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_03"); //Uns fehlt das Alte Wissen über diese Artefakte.
	AI_Output(self, other, "Info_CorKalom_BringBook_Info_10_03"); //Chybí nám staré znalosti o těchto artefaktech.
//	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_04"); //Do you mean to say I collected the eggs for nothing?
//	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_04"); //Heißt das, es war vergebens, die Eier zu holen?
	AI_Output(other, self, "Info_CorKalom_BringBook_Info_15_04"); //Chceš říci, že jsem sbíral TA vajíčka nadarmo?
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_05"); //No, listen to me. There's an almanac which contains what we need to know.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_05"); //Nein, hör mir zu. Es gibt einen Almanach, in dem das steht, was wir wissen müssen.
	AI_Output(self, other, "Info_CorKalom_BringBook_Info_10_05"); //Ne, poslouchej mě. Existuje jeden almanach, ve kterém je vše, co potřebujeme vědět.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_06"); //We bought the book off the fire mage Corristo from the Old Camp.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_06"); //Wir haben dieses Buch dem Feuermagier Corristo aus dem Alten Lager abgekauft.
	AI_Output(self, other, "Info_CorKalom_BringBook_Info_10_06"); //Koupili jsme tu knihu od mága Corrista ze Starého tábora.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_07"); //However, it was stolen when they tried to bring it here from the Old Camp.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_07"); //Allerdings ist es beim Transport vom Alten Lager hierher geraubt worden.
	AI_Output(self, other, "Info_CorKalom_BringBook_Info_10_07"); //Byla však ukradena, když se jí sem pokoušeli ze Starého tábor přinést.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_08"); //I had charged Talas, a novice, with collecting the book for me, but he was robbed.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_08"); //Ich hatte Talas, einen Novizen, damit beauftragt, das Buch zu mir zu bringen, aber er wurde überfallen.
	AI_Output(self, other, "Info_CorKalom_BringBook_Info_10_08"); //Pověřil jsem novice Talase, aby ji pro mě vyzvedl, ale byl přepaden.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_09"); //He let me down, but I've given him another chance. He must get the stolen almanac back.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_09"); //Er hat mich enttäuscht, aber ich habe ihm noch eine Chance gegeben. Er hat nun den Auftrag, den gestohlenen Almanach zurückzuholen.
	AI_Output(self, other, "Info_CorKalom_BringBook_Info_10_09"); //Zklamal mě, ale já mu dal ještě jednu šanci. Musí přinést ukradený almanach zpátky.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_10"); //Talk to him. He'll need any help he can get.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_10"); //Sprich mit ihm. Er wird alle Hilfe brauchen, die er bekommen kann.
	AI_Output(self, other, "Info_CorKalom_BringBook_Info_10_10"); //Promluv si s ním. Bude potřebovat každou pomocnou ruku.

	CorKalom_BringBook = LOG_RUNNING;
	Log_CreateTopic(CH2_Book, LOG_MISSION);
	Log_SetTopicStatus(CH2_Book, LOG_RUNNING);
//	B_LogEntry(CH2_Book,"Cor Kalom needs a last object for the great invocation of the Sleeper. It's a book about the use of the focus stones. The novice Talas was so clumsy, goblins robbed the almanac. Right now he's looking for somebody at the temple forecourt to help him to get the book back.");
//	B_LogEntry(CH2_Book,"Cor Kalom benötigt einen letzten Gegenstand für die große Anrufung des Schläfers. Es handelt sich um ein Buch über die Benutzung der Fokus-Steine. Der Novize Talas war wohl so ungeschickt, sich den Almanach von Goblins rauben zu lassen. Er sucht derzeit auf dem Tempelvorplatz nach Hilfe bei der Wiederbeschaffung des Buches");
	B_LogEntry(CH2_Book, "Cor Kalom potřebuje pro vzývání Spáče poslední předmět. Je to kniha o použití ohniskových kamenů. Novic Talas byl tak neopatrný, že si ten rukopis nechal ukrást gobliny. Nyní hledá na chrámovém nádvoří někoho, kdo by mu pomohl získat knihu zpět.");

	Info_ClearChoices(Info_CorKalom_BringBook);

	Info_AddChoice(Info_CorKalom_BringBook, DIALOG_BACK, Info_CorKalom_BringBook_BACK);
//	Info_AddChoice(Info_CorKalom_BringBook,"What will I get for it?",Info_CorKalom_BringBook_EARN);
//	Info_AddChoice(Info_CorKalom_BringBook,"Was ist für mich drin?",Info_CorKalom_BringBook_EARN);
	Info_AddChoice(Info_CorKalom_BringBook, "Co za to dostanu?", Info_CorKalom_BringBook_EARN);
//	Info_AddChoice(Info_CorKalom_BringBook,"Who stole the almanac?",Info_CorKalom_BringBook_WHO);
//	Info_AddChoice(Info_CorKalom_BringBook,"Wer hat den Almanach gestohlen?",Info_CorKalom_BringBook_WHO);
	Info_AddChoice(Info_CorKalom_BringBook, "Kdo ukradl ten almanach?", Info_CorKalom_BringBook_WHO);
//	Info_AddChoice(Info_CorKalom_BringBook,"Where can I find Talas?",Info_CorKalom_BringBook_WHERE);
//	Info_AddChoice(Info_CorKalom_BringBook,"Wo finde ich Talas?",Info_CorKalom_BringBook_WHERE);
	Info_AddChoice(Info_CorKalom_BringBook, "Kde najdu Talase?", Info_CorKalom_BringBook_WHERE);
};

func void Info_CorKalom_BringBook_BACK()
{
	Info_ClearChoices(Info_CorKalom_BringBook);
};

func void Info_CorKalom_BringBook_WHERE()
{
//	AI_Output(other,self,"Info_CorKalom_BringBook_Where_15_01"); //Where can I find Talas?
//	AI_Output(other,self,"Info_CorKalom_BringBook_Where_15_01"); //Wo finde ich Talas?
	AI_Output(other, self, "Info_CorKalom_BringBook_Where_15_01"); //Kde najdu Talase?
//	AI_Output(self,other,"Info_CorKalom_BringBook_Where_10_02"); //He's in the forecourt at the temple hill, trying to get people to help him.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Where_10_02"); //Er versucht auf dem Vorplatz des Tempelbergs Leute zu finden, die ihm helfen.
	AI_Output(self, other, "Info_CorKalom_BringBook_Where_10_02"); //Je na nádvoří u chrámu, kde se snaží najít lidi, kteří by mu pomohli.
};

func void Info_CorKalom_BringBook_WHO()
{
//	AI_Output(other,self,"Info_CorKalom_BringBook_Who_15_01"); //Who stole the almanac?
//	AI_Output(other,self,"Info_CorKalom_BringBook_Who_15_01"); //Wer hat den Almanach gestohlen?
	AI_Output(other, self, "Info_CorKalom_BringBook_Who_15_01"); //Kdo ukradl ten almanach?
//	AI_Output(self,other,"Info_CorKalom_BringBook_Who_10_02"); //Talas told me he was mugged by black goblins. It sounds strange, but not impossible.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Who_10_02"); //Talas hat berichtet, dass er von schwarzen Goblins überfallen wurde. Merkwürdig, aber nicht unmöglich.
	AI_Output(self, other, "Info_CorKalom_BringBook_Who_10_02"); //Talas říkal, že mu ho ukradl černý goblin. Zní to podivně, ale není to nemožné.
};

func void Info_CorKalom_BringBook_EARN()
{
//	AI_Output(other,self,"Info_CorKalom_BringBook_Earn_15_01"); //What will I get for it?
//	AI_Output(other,self,"Info_CorKalom_BringBook_Earn_15_01"); //Was ist für mich drin?
	AI_Output(other, self, "Info_CorKalom_BringBook_Earn_15_01"); //Co za to dostanu?
//	AI_Output(self,other,"Info_CorKalom_BringBook_Earn_10_02"); //Have I not already proven my generosity to you? You will receive a just reward.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Earn_10_02"); //Habe ich nicht schon mehr als einmal meine Großzügigkeit bewiesen? Du wirst angemessen entlohnt werden.
	AI_Output(self, other, "Info_CorKalom_BringBook_Earn_10_02"); //To jsem ti ještě neprokázal dost velkorysosti? Dostaneš odměnu.
};

// ------------------------------ SUCCESS ----------------------------------

instance Info_CorKalom_BringBook_Success(C_INFO)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringBook_Success_Condition;
	information = Info_CorKalom_BringBook_Success_Info;
	important = 0;
	permanent = 0;
//	description = "I've found the book";
//	description = "Ich hab' das Buch gefunden";
	description = "Našel jsem tu knihu.";
};

func int Info_CorKalom_BringBook_Success_Condition()
{
	if ((Npc_HasItems(Hero, ItWrFokusbuch))
	&& (CorKalom_BringBook == LOG_RUNNING))
	{
		return 1;
	};

	return 0;
};

func void Info_CorKalom_BringBook_Success_Info()
{
//	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_01"); //I've found the book
//	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_01"); //Ich hab' das Buch gefunden
	AI_Output(other, self, "Info_CorKalom_BringBook_Success_15_01"); //Našel jsem tu knihu.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_02"); //Good work. You have all we need.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_02"); //Gute Arbeit. Du hast alles besorgt, was wir brauchen.
	AI_Output(self, other, "Info_CorKalom_BringBook_Success_10_02"); //Výborná práce. Máme vše, co potřebujeme.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_03"); //I'll complete the preparations now.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_03"); //Ich werde jetzt die letzten Vorbereitungen treffen.
	AI_Output(self, other, "Info_CorKalom_BringBook_Success_10_03"); //Teď dokončím přípravy.
//	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_04"); //Where will the invocation take place?
//	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_04"); //Wo wird die Anrufung stattfinden?
	AI_Output(other, self, "Info_CorKalom_BringBook_Success_15_04"); //Kdy bude probíhat vzývání?
//	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_05"); //Wait till nighttime, then come to the temple courtyard. We will gather there to invoke the almighty Sleeper.
//	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_05"); //Komme bei Nacht zum Tempelvorplatz. Dort werden wir uns versammeln, um den allmächtigen Schläfer zu rufen.
	AI_Output(self, other, "Info_CorKalom_BringBook_Success_10_05"); //Přijď v noci na chrámové nádvoří. Tam se sejdeme, abychom probudili všemohoucího spáče.

	B_GiveInvItems(hero, self, ItWrFokusbuch, 1);
	Npc_RemoveInvItem(self, ItWrFokusbuch);
	B_GiveXP(XP_BringBook);
	CorKalom_BringBook = LOG_SUCCESS;

//	B_LogEntry(CH2_Book,"After I took the almanac to Cor Kalom, he's now preparing the Brotherhood for the great invocation of the Sleeper. It shall take place at the temple forecourt during the night.");
//	B_LogEntry(CH2_Book,"Nachdem ich den Almanach bei Cor Kalom abgeliefert habe, bereitet sich die Bruderschaft nun auf die Große Anrufung des Schläfers vor. Sie soll bei Nacht auf dem Tempelvorplatz stattfinden.");
	B_LogEntry(CH2_Book, "Předal jsem rukopis Cor Kalomovi, který teď Bratrstvo připravuje na velké vzývání Spáče. To se bude se odehrávat v noci na chrámovém nádvoří.");
	Log_SetTopicStatus(CH2_Book, LOG_SUCCESS);

	//-------- Gurus und Novizen auf dem Tempelvorplatz versammeln --------
	AI_StopProcessInfos(self);

	B_Story_PrepareRitual();
};

// ----------------------------BELOHNUNG ---------------------------------------
instance Info_CorKalom_Belohnung(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = Info_CorKalom_Belohnung_Condition;
	information = Info_CorKalom_Belohnung_Info;
	important = 0;
	permanent = 0;
//	description = "What about my payment?";
//	description = "Wie sieht es mit einer Belohnung aus?";
	description = "A co moje odměna?";
};

func int Info_CorKalom_Belohnung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_CorKalom_BringBook_Success))
	{
		return 1;
	};

	return 0;
};

func void Info_CorKalom_Belohnung_Info()
{
//	AI_Output(other,self,"Info_CorKalom_Belohnung_15_00");//What about my payment?
//	AI_Output(other,self,"Info_CorKalom_Belohnung_15_00");//Wie sieht es mit einer Belohnung aus?
	AI_Output(other, self, "Info_CorKalom_Belohnung_15_00"); //A co moje odměna?
//	AI_Output(self,other,"Info_CorKalom_Belohnung_10_01");//What do you want?
//	AI_Output(self,other,"Info_CorKalom_Belohnung_10_01");//Was willst du haben?
	AI_Output(self, other, "Info_CorKalom_Belohnung_10_01"); //Co bys chtěl?

	Info_ClearChoices(Info_CorKalom_Belohnung);
//	Info_AddChoice(Info_CorKalom_Belohnung,"A spell scroll",Info_CorKalom_Belohnung_SCROLL);
//	Info_AddChoice(Info_CorKalom_Belohnung,"Eine Spruchrolle",Info_CorKalom_Belohnung_SCROLL);
	Info_AddChoice(Info_CorKalom_Belohnung, "Kouzelné svitky.", Info_CorKalom_Belohnung_SCROLL);
//	Info_AddChoice(Info_CorKalom_Belohnung,"Ore",Info_CorKalom_Belohnung_ORE);
//	Info_AddChoice(Info_CorKalom_Belohnung,"Erz",Info_CorKalom_Belohnung_ORE);
	Info_AddChoice(Info_CorKalom_Belohnung, "Rudu.", Info_CorKalom_Belohnung_ORE);
//	Info_AddChoice(Info_CorKalom_Belohnung,"Mana potion",Info_CorKalom_Belohnung_MANA);
//	Info_AddChoice(Info_CorKalom_Belohnung,"Manatrank",Info_CorKalom_Belohnung_MANA);
	Info_AddChoice(Info_CorKalom_Belohnung, "Lektvary many.", Info_CorKalom_Belohnung_MANA);
};

func void Info_CorKalom_Belohnung_SCROLL()
{
//	AI_Output(other,self,"Info_CorKalom_Belohnung_SCROLL_15_00");//Give me these spell scrolls.
//	AI_Output(other,self,"Info_CorKalom_Belohnung_SCROLL_15_00");//Gib mir die Spruchrollen.
	AI_Output(other, self, "Info_CorKalom_Belohnung_SCROLL_15_00"); //Dej mi kouzelné svitky.
//	AI_Output(self,other,"Info_CorKalom_Belohnung_SCROLL_10_01");//Use these spells wisely.
//	AI_Output(self,other,"Info_CorKalom_Belohnung_SCROLL_10_01");//Setze diese Zauber hier mit Bedacht ein!
	AI_Output(self, other, "Info_CorKalom_Belohnung_SCROLL_10_01"); //Užívej tyto svitky moudře.
	CreateInvItems(self, ItArScrollSleep, 3);
	B_GiveInvItems(self, hero, ItArScrollSleep, 3);
	Info_ClearChoices(Info_CorKalom_Belohnung);
};

func void Info_CorKalom_Belohnung_ORE()
{
//	AI_Output(other,self,"Info_CorKalom_Belohnung_ORE_15_00");//Give me ore.
//	AI_Output(other,self,"Info_CorKalom_Belohnung_ORE_15_00");//Gib mir Erz.
	AI_Output(other, self, "Info_CorKalom_Belohnung_ORE_15_00"); //Dej mi rudu.
//	AI_Output(self,other,"Info_CorKalom_Belohnung_ORE_10_01");//This should satisfy your greed for ore.
//	AI_Output(self,other,"Info_CorKalom_Belohnung_ORE_10_01");//Dies soll deine Gier nach Erz zufrieden stellen!
	AI_Output(self, other, "Info_CorKalom_Belohnung_ORE_10_01"); //To by mělo nasytit tvůj hlad po rudě.
	CreateInvItems(self, ItMinugget, 300);
	B_GiveInvItems(self, hero, ItMinugget, 300);
	Info_ClearChoices(Info_CorKalom_Belohnung);
};

func void Info_CorKalom_Belohnung_MANA()
{
//	AI_Output(other,self,"Info_CorKalom_Belohnung_MANA_15_00");//Mana potions.
//	AI_Output(other,self,"Info_CorKalom_Belohnung_MANA_15_00");//Manatränke.
	AI_Output(other, self, "Info_CorKalom_Belohnung_MANA_15_00"); //Lektvary many.
//	AI_Output(self,other,"Info_CorKalom_Belohnung_MANA_10_01");//May these potions give you strength!
//	AI_Output(self,other,"Info_CorKalom_Belohnung_MANA_10_01");//Mögen diese Tränke dir Kraft schenken!
	AI_Output(self, other, "Info_CorKalom_Belohnung_MANA_10_01"); //Kéž ti tyto lektvary dají sílu!
	CreateInvItems(self, ItFo_Potion_Mana_02, 5);
	B_GiveInvItems(self, hero, ItFo_Potion_Mana_02, 5);
	Info_ClearChoices(Info_CorKalom_Belohnung);
};

// ************************ EXIT **************************************************************************

instance GUR_1201_CorKalom_Exit(C_INFO)
{
	npc = GUR_1201_CorKalom;
	nr = 999;
	condition = GUR_1201_CorKalom_Exit_Condition;
	information = GUR_1201_CorKalom_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int GUR_1201_CorKalom_Exit_Condition()
{
	return 1;
};

func void GUR_1201_CorKalom_Exit_Info()
{
//	AI_Output(other,self,"GUR_1201_CorKalom_Exit_15_01"); //I'll be seeing you.
//	AI_Output(other,self,"GUR_1201_CorKalom_Exit_15_01"); //Wir sehen uns.
	AI_Output(other, self, "GUR_1201_CorKalom_Exit_15_01"); //Uvidíme se.
//	AI_Output(self,other,"GUR_1201_CorKalom_Exit_10_02"); //May the Sleeper enlighten you.
//	AI_Output(self,other,"GUR_1201_CorKalom_Exit_10_02"); //Möge der Schläfer dich erleuchten.
	AI_Output(self, other, "GUR_1201_CorKalom_Exit_10_02"); //Kéž tě Spáč osvítí.

	AI_StopProcessInfos(self);
};

// *******************************************************************************************************
