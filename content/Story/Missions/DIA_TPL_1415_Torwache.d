// **************************************************
// 						 EXIT
// **************************************************

instance DIA_Tpl_1415_Torwache_Exit(C_INFO)
{
	npc = Tpl_1415_Templer;
	nr = 999;
	condition = DIA_Tpl_1415_Torwache_Exit_Condition;
	information = DIA_Tpl_1415_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Tpl_1415_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Tpl_1415_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

instance DIA_Tpl_1415_Torwache_First(C_INFO)
{
	npc = Tpl_1415_Templer;
	nr = 2;
	condition = DIA_Tpl_1415_Torwache_First_Condition;
	information = DIA_Tpl_1415_Torwache_First_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Tpl_1415_Torwache_First_Condition()
{
	if (Kapitel >= 2)
	{
		return FALSE;
	};

	if (Npc_GetDistToWP(other,"PSI_START") > 800)
	{
		Npc_SetRefuseTalk(self,30);
	};

	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Tpl_1415_Torwache_First_Info()
{
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_00"); //Greetings, stranger!
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_00"); //Sei gegrüßt, Fremder!
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_00"); //Buď pozdraven, cizinče!
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_01"); //You are treading on holy ground. This is the Brotherhood of the Sleeper.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_01"); //Du bist dabei, heiligen Boden zu betreten. Dies ist die Bruderschaft des Schläfers.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_01"); //Šlapeš po svaté půdě. Tohle je Bratrstvo Spáče.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_02"); //What brings you here?
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_02"); //Was führt dich her?
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_02"); //Co tě sem přivádí?

	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
//	Info_AddChoice(DIA_Tpl_1415_Torwache_First,"I'm new here. I wanted to have a look at your camp.",DIA_Tpl_1415_Torwache_First_JustLooking);
//	Info_AddChoice(DIA_Tpl_1415_Torwache_First,"Ich bin neu hier. Ich wollte mir euer Lager ansehen.",DIA_Tpl_1415_Torwache_First_JustLooking);
	Info_AddChoice(DIA_Tpl_1415_Torwache_First,"Jsem tady nový. Chci si prohlédnout váš tábor.",DIA_Tpl_1415_Torwache_First_JustLooking);

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
//		Info_AddChoice(DIA_Tpl_1415_Torwache_First,"I want to join you.",DIA_Tpl_1415_Torwache_First_Join);
//		Info_AddChoice(DIA_Tpl_1415_Torwache_First,"Ich will mich euch anschliessen.",DIA_Tpl_1415_Torwache_First_Join);
		Info_AddChoice(DIA_Tpl_1415_Torwache_First,"Chci s k vám přidat.",DIA_Tpl_1415_Torwache_First_Join);
	};
};

func void DIA_Tpl_1415_Torwache_First_Join()
{
//	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_Join_15_00"); //I've heard you're looking for new people. I want to join you.
//	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_Join_15_00"); //Ich habe gehört, ihr seid auf der Suche nach neuen Leuten. Ich will mich euch anschließen.
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_Join_15_00"); //Slyšel jsem, že hledáte nové lidi. Chci se k vám přidat.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_01"); //Then be welcome. The Brotherhood of the Sleeper has a place for everybody who wants to be led by the spirit of the Sleeper.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_01"); //Dann sei willkommen. Die Bruderschaft des Schläfers hat einen Platz für jeden, der sich vom Geist des Schläfers führen lassen will.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_01"); //Pak buď vítán. Bratrstvo Spáče má místo pro každého, kdo se nechá vést duchem Spáče.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_02"); //If you're really serious, you should try to get Baal Namib's attention. He's standing in the courtyard just behind the gate.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_02"); //Wenn es dir wirklich ernst ist, solltest du versuchen, die Aufmerksamkeit von Baal Namib zu erregen. Er steht direkt auf dem Platz hinter dem Tor.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_02"); //Jestli to myslíš vážně, měl by ses pokusit upoutat pozornost Baala Namiba. Stojí v prostoru, hned za branou.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_04"); //But you may not speak to him. Wait until he addresses you.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_04"); //Aber du darfst ihn nicht direkt ansprechen. Warte, bis er dich anspricht.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_04"); //Nesmíš jej ale přímo oslovit. Počkej, až na tebe sám promluví.
	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
};

func void DIA_Tpl_1415_Torwache_First_JustLooking()
{
//	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_JustLooking_15_00"); //I'm new here. I wanted to have a look at your camp.
//	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_JustLooking_15_00"); //Ich bin neu hier. Ich wollte mir euer Lager ansehen.
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_JustLooking_15_00"); //Jsem tady nový. Chci si prohlédnout váš tábor.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_01"); //Strangers are welcome here.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_01"); //Fremde sind uns willkommen.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_01"); //Cizinci jsou tu vítáni.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_02"); //But it is important to follow our rules. There are certain areas strangers may not access.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_02"); //Aber es ist wichtig, das du unsere Regeln achtest. Es gibt bestimmte Bereiche, in denen Fremde sich nicht aufhalten dürfen.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_02"); //Je ale důležité, abys dodržoval naše pravidla. Jsou určité oblasti, do kterých cizinci nesmí.
	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
};

// **************************************************
// 				Wie sieht's im Lager aus?
// **************************************************

instance DIA_Tpl_1415_Torwache_Sit(C_INFO)
{
	npc = Tpl_1415_Templer;
	nr = 2;
	condition = DIA_Tpl_1415_Torwache_Sit_Condition;
	information = DIA_Tpl_1415_Torwache_Sit_Info;
	permanent = 1;
//	description = "How are things in the Camp?";
//	description = "Wie sieht's im Lager aus?";
	description = "Jak to v táboře jde?";
};

func int DIA_Tpl_1415_Torwache_Sit_Condition()
{
	return 1;
};

func void DIA_Tpl_1415_Torwache_Sit_Info()
{
//	AI_Output(other,self,"DIA_Tpl_1415_Torwache_Sit_15_00"); //How are things in the Camp?
//	AI_Output(other,self,"DIA_Tpl_1415_Torwache_Sit_15_00"); //Wie sieht's im Lager aus?
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_Sit_15_00"); //Jak to v táboře jde?
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_Sit_13_01"); //Everything's quiet. Just go in.
//	AI_Output(self,other,"DIA_Tpl_1415_Torwache_Sit_13_01"); //Alles ruhig. Geh nur rein.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_Sit_13_01"); //Všude klid. Tak pojď.
};
/*------------------------------------------------------------------------
//						TEMPLERAUFNAHME //
------------------------------------------------------------------------*/
instance Tpl_1415_Torwache_TEMPLERAUFNAHME(C_INFO)
{
	npc = Tpl_1415_Templer;
	condition = Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition;
	information = Tpl_1415_Torwache_TEMPLERAUFNAHME_Info;
	important = 1;
	permanent = 0;
};

func int Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition()
{
	if ((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS))
	&& (Npc_GetTrueGuild(hero) == GIL_NOV)
	&& (Npc_GetDistToNpc(hero,self) < 1000)
	{
		return TRUE;
	};
};
func void Tpl_1415_Torwache_TEMPLERAUFNAHME_Info()
{
	AI_GotoNpc(hero,self);
//	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_01"); //Hey, I've heard what happened in the mine. Good work. You deserve to be admitted to the templars!
//	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_01"); //Hey, ich habe schon gehört, was in der Mine geschehen ist. Gute Arbeit. Damit hast du dir deine Aufnahme zu den Templern verdient!
	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_01"); //Hej, slyšel jsem, co se stalo v dole. Dobrá práce. Zasloužil sis tím jmenování templářem!
//	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_02"); //Just speak to Cor Angar!
//	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_02"); //Sprich doch mal mit Cor Angar!
	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_02"); //Promluv si s Corem Angarem!

	Log_CreateTopic(GE_BecomeTemplar,LOG_NOTE);
//	B_LogEntry(GE_BecomeTemplar,"I should talk to Cor Angar. Maybe he'll let me join the templars.");
//	B_LogEntry(GE_BecomeTemplar,"Ich sollte mal mit Cor Angar reden. Vielleicht nimmt er mich in die Reihen der Templer auf.");
	B_LogEntry(GE_BecomeTemplar,"Měl bych si promluvit s Cor Angarem. Možná mi dovolí přidat se k templářům.");
};

/*------------------------------------------------------------------------
						Novizenröckchen
------------------------------------------------------------------------*/

instance Tpl_1415_Templer_ROCK(C_INFO)
{
	npc = Tpl_1415_Templer;
	condition = Tpl_1415_Templer_ROCK_Condition;
	information = Tpl_1415_Templer_ROCK_Info;
	important = 0;
	permanent = 1;
//	description = "I need armor.";
//	description = "Ich brauche eine Rüstung";
	description = "Potřebuji zbroj.";
};

func int Tpl_1415_Templer_ROCK_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};

};
func void Tpl_1415_Templer_ROCK_Info()
{
//	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_15_01"); //I need armor.
//	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_15_01"); //Ich brauche eine Rüstung.
	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_15_01"); //Potřebuji zbroj.
//	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_13_02"); //You have to earn a templar's armor like I'm wearing. But you can have a novice's loincloth.
//	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_13_02"); //So eine Templerrüstung, wie ich sie trage, musst du dir erst verdienen. Aber du kannst einen Novizenrock haben.
	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_13_02"); //Templářskou zbroj jako nosím já si musíš nejdříve zasloužit. Ale můžeš mít bederní roušku novice.
//	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_15_03"); //Better than nothing...
//	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_15_03"); //Immerhin besser als Nichts ...
	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_15_03"); //Lepší než nic...
//	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_13_04"); //You won't get it for free though!
//	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_13_04"); //Umsonst gibt es den allerdings nicht!
	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_13_04"); //Avšak, není zdarma!

	Info_ClearChoices(Tpl_1415_Templer_ROCK);
	Info_Addchoice (Tpl_1415_Templer_ROCK,DIALOG_BACK,Tpl_1415_Templer_ROCK_BACK);
	Info_Addchoice (Tpl_1415_Templer_ROCK,B_BuildBuyArmorString(NAME_TorwachenPsiRock,VALUE_NOV_ARMOR_L),Tpl_1415_Templer_ROCK_BUY);
};

func void Tpl_1415_Templer_ROCK_BACK()
{
	Info_ClearChoices(Tpl_1415_Templer_ROCK);
};

func void Tpl_1415_Templer_ROCK_BUY()
{
//	AI_Output(other,self,"Tpl_1415_Templer_ROCK_BUY_15_01"); //Okay, give me the loincloth.
//	AI_Output(other,self,"Tpl_1415_Templer_ROCK_BUY_15_01"); //Na schön, gib mir den Rock.
	AI_Output(other,self,"Tpl_1415_Templer_ROCK_BUY_15_01"); //Dobře, dej mi tu bederní roušku.
	if (Npc_HasItems(hero,ItMiNugget) <  VALUE_NOV_ARMOR_L)
	{
//		AI_Output(self,other,"Tpl_1415_Templer_ROCK_BUY_13_02"); //Come back as soon as you have enough ore!
//		AI_Output(self,other,"Tpl_1415_Templer_ROCK_BUY_13_02"); //Komm wieder, wenn du genug Erz hast!
		AI_Output(self,other,"Tpl_1415_Templer_ROCK_BUY_13_02"); //Vrať se, až budeš mít dost rudy!
	}
	else
	{
//		AI_Output(self,other,"Tpl_1415_Templer_ROCK_BUY_13_03"); //This piece of cloth can save your life!
//		AI_Output(self,other,"Tpl_1415_Templer_ROCK_BUY_13_03"); //Dieser Rock kann dir das Leben retten!
		AI_Output(self,other,"Tpl_1415_Templer_ROCK_BUY_13_03"); //Tahle bederní rouška ti může zachránit život!
		B_GiveInvItems(hero,self,ItMinugget, VALUE_NOV_ARMOR_L);
		CreateInvItem(self,NOV_ARMOR_L);
		B_GiveInvItems(self,hero,NOV_ARMOR_L,1);
		Tpl_1415_Templer_ROCK.permanent = 0;
	};

};

