// ************************************************************
// 			  				   EXIT
// ************************************************************

instance Info_Jackal_EXIT(C_INFO)
{
	npc = GRD_201_Jackal;
	nr = 999;
	condition = Info_Jackal_EXIT_Condition;
	information = Info_Jackal_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Jackal_EXIT_Condition()
{
	return 1;
};

func void Info_Jackal_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
var int Jackal_ProtectionPaid;
var int Jackal_PayDay;
// ************************************************************

instance Info_Jackal_Hello(C_INFO)
{
	npc = GRD_201_Jackal;
	nr = 3;
	condition = Info_Jackal_Hello_Condition;
	information = Info_Jackal_Hello_Info;
	important = 1;
	permanent = 0;
};

func int Info_Jackal_Hello_Condition()
{
	if (Kapitel <= 2)
	{
		return 1;
	};

	return 0;
};

func void Info_Jackal_Hello_Info()
{
//	AI_Output(self,other,"Info_Jackal_Hello_07_00"); //Ah! A new face.
//	AI_Output(self,other,"Info_Jackal_Hello_07_00"); //Ah! Ein neues Gesicht.
	AI_Output(self, other, "Info_Jackal_Hello_07_00"); //Á! Nová tvář.
//	AI_Output(other,self,"Info_Jackal_Hello_15_01"); //What do you want?
//	AI_Output(other,self,"Info_Jackal_Hello_15_01"); //Was willst du?
	AI_Output(other, self, "Info_Jackal_Hello_15_01"); //Co chceš?
//	AI_Output(self,other,"Info_Jackal_Hello_07_02"); //I wanna offer you help. You're new here, an' new 'uns always get into trouble... You could save yourself a lot by makin' a small donation.
//	AI_Output(self,other,"Info_Jackal_Hello_07_02"); //Ich will dir meine Hilfe anbieten. Du bist neu hier und Neue bekommen schnell Ärger ... Mit einer kleinen Spende an mich könntest du dir einiges davon ersparen.
	AI_Output(self, other, "Info_Jackal_Hello_07_02"); //Chci ti nabídnout pomoc. Jsi tady nový a nováčci se vždycky dostanou do problémů... Mohl by sis jich spoustu ušetřit poskytnutím malého příspěvku.
//	AI_Output(self,other,"Info_Jackal_Hello_07_03"); //Just 10 ore, man! It ain't much to ask.
//	AI_Output(self,other,"Info_Jackal_Hello_07_03"); //Nur 10 Erz, Mann! Das ist nicht viel.
	AI_Output(self, other, "Info_Jackal_Hello_07_03"); //Jen 10 nugetů, člověče! Není to moc.

	Info_ClearChoices(Info_Jackal_Hello);
//	Info_AddChoice(Info_Jackal_Hello,"What if I don't pay?",Info_Jackal_Hello_WhatIf);
//	Info_AddChoice(Info_Jackal_Hello,"Und wenn ich nicht zahle?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice(Info_Jackal_Hello, "A co když nezaplatím?", Info_Jackal_Hello_WhatIf);
//	Info_AddChoice(Info_Jackal_Hello,"And what do I get out of it?",Info_Jackal_Hello_WhatDoIGet);
//	Info_AddChoice(Info_Jackal_Hello,"Und was bekomme ich dafür?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice(Info_Jackal_Hello, "A co za to?", Info_Jackal_Hello_WhatDoIGet);
//	Info_AddChoice(Info_Jackal_Hello,"Here's 10 ore. And you'll have to help me if I get into trouble.",Info_Jackal_Hello_Pay);
//	Info_AddChoice(Info_Jackal_Hello,"Hier. 10 Erz. Und du hilfst mir, wenn ich Ärger habe.",Info_Jackal_Hello_Pay);
	Info_AddChoice(Info_Jackal_Hello, "Tady. 10 nugetů. A jestli budu mít potíže, tak mi pomůžeš.", Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
//	AI_Output(other,self,"Info_Jackal_Hello_Pay_15_00"); //Here's 10 ore. And you'll have to help me if I get into trouble.
//	AI_Output(other,self,"Info_Jackal_Hello_Pay_15_00"); //Hier. 10 Erz. Und du hilfst mir, wenn ich Ärger habe.
	AI_Output(other, self, "Info_Jackal_Hello_Pay_15_00"); //Tady. 10 nugetů. A jestli budu mít potíže, tak mi pomůžeš.

	if (Npc_HasItems(other, itminugget) >= 10)
	{
//		AI_Output(self,other,"Info_Jackal_Hello_Pay_07_01"); //You can count on me if I'm close by. You'll find me between the market place and the south gate.
//		AI_Output(self,other,"Info_Jackal_Hello_Pay_07_01"); //Wenn ich in der Nähe bin, kannst du auf mich zählen. Du kannst mich jederzeit zischen dem Marktplatz und dem Südtor finden.
		AI_Output(self, other, "Info_Jackal_Hello_Pay_07_01"); //Pokud budu nablízku, můžeš se mnou počítat. Najdeš mě mezi tržištěm a jižní bránou.
//		AI_Output(self,other,"Info_Jackal_Hello_Pay_07_02"); //The other areas are Fletcher and Bloodwyn's affair.
//		AI_Output(self,other,"Info_Jackal_Hello_Pay_07_02"); //Um die anderen Bereiche kümmern sich Fletcher und Bloodwyn.
		AI_Output(self, other, "Info_Jackal_Hello_Pay_07_02"); //O ostatní oblasti se stará Fletcher a Bloodwyn.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self, ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
//		AI_Output(self,other,"Info_Jackal_Schutz_NoOre_07_00"); //Hey, watch who you're trying to fool! Come back when you have the ore!
//		AI_Output(self,other,"Info_Jackal_Schutz_NoOre_07_00"); //Hey, verarsch mich nicht! Komm wieder, wenn du das Erz hast!
		AI_Output(self, other, "Info_Jackal_Schutz_NoOre_07_00"); //Hej, dávej pozor na to, z koho si zkoušíš utahovat! Vrať se, až budeš mít ty nugety!
	};

	Info_ClearChoices(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
//	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //And what do I get out of it?
//	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //Und was bekomme ich dafür?
	AI_Output(other, self, "Info_Jackal_Hello_WhatDoIGet_15_00"); //A co za to?
//	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //While you're in my district, I'll protect you.
//	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Solange du in meinem Viertel bist, passe ich auf dich auf.
	AI_Output(self, other, "Info_Jackal_Hello_WhatDoIGet_07_01"); //Pokud budeš v mé čtvrti, budeš pod mojí ochranou.
//	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //if you get into any trouble with the guys from the New Camp or if one of the sect loonies gets on your nerves, you can count on me.
//	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Wenn du mal Ärger mit Typen aus dem Neuen Lager haben solltest oder mit einem der Sektenspinner, die dir die Backe voll quatschen, kannst du auf mich zählen.
	AI_Output(self, other, "Info_Jackal_Hello_WhatDoIGet_07_02"); //Pokud se dostaneš do problémů s chlapy z Nového tábora, nebo ti bude hrát na nervy někdo z těch sektářských bláznů, můžeš se mnou počítat.
//	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //if you have bother with one of the diggers, we'll help whichever one of you has paid - it's as simple as that.
//	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Wenn du dich mit einem Buddler anlegst, helfen wir dem, der gezahlt hat - so einfach ist das.
	AI_Output(self, other, "Info_Jackal_Hello_WhatDoIGet_07_03"); //Kdybys měl potíže s některým z kopáčů, pomůžeme tomu, kdo zaplatí - jednoduchý jak facka.
//	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //And what if both have paid?
//	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //Und wenn beide gezahlt haben?
	AI_Output(other, self, "Info_Jackal_Hello_WhatDoIGet_15_04"); //A co když zaplatíme oba?
//	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Then we sit back an' watch the show. But that don't happen too often.
//	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Dann sehen wir uns die Show an. Aber oft kommt das nicht vor.
	AI_Output(self, other, "Info_Jackal_Hello_WhatDoIGet_07_05"); //Pak se na to představení podíváme. To se ale moc často nestává.
};

func void Info_Jackal_Hello_WhatIf()
{
//	AI_Output(other,self,"Info_Jackal_Hello_WhatIf_15_00"); //What if I don't pay?
//	AI_Output(other,self,"Info_Jackal_Hello_WhatIf_15_00"); //Und wenn ich nicht zahle?
	AI_Output(other, self, "Info_Jackal_Hello_WhatIf_15_00"); //A co když nezaplatím?
//	AI_Output(self,other,"Info_Jackal_Hello_WhatIf_07_01"); //Hey man, don't stress yourself! You're a newcomer - take a look around. Collect a bit of ore and when you're ready to pay, then pay.
//	AI_Output(self,other,"Info_Jackal_Hello_WhatIf_07_01"); //Hey Mann, mach dir keinen Stress! Du bist neu hier - sieh dich mal ein bisschen um. Sammel' erst mal etwas Erz und wenn du bereit bist zu zahlen - dann zahlst du.
	AI_Output(self, other, "Info_Jackal_Hello_WhatIf_07_01"); //Poslyš, člověče, nedělej si starosti! Jsi tady nový - tak se rozhlédni kolem. Dej dohromady trochu rudy a až budeš moci zaplatit, zaplať.
//	AI_Output(self,other,"Info_Jackal_Hello_WhatIf_07_02"); //You can do it anytime - but don't count on my help until you've made your contribution to my expenses - I'm sure you'll understand.
//	AI_Output(self,other,"Info_Jackal_Hello_WhatIf_07_02"); //Du kannst das jederzeit nachholen - nur bitte rechne nicht mit meiner Hilfe, solange du nicht einen kleinen Beitrag zu meinen Unkosten geleistet hast - das verstehst du doch?
	AI_Output(self, other, "Info_Jackal_Hello_WhatIf_07_02"); //Můžeš zaplatit kdykoliv - dokud ale nepřispěješ na moje výdaje, nepočítej s mojí pomocí. Jsem si jistý, že tomu rozumíš.
//	Info_AddChoice(Info_Jackal_Hello,"I'll see you later.",Info_Jackal_Hello_Later);
//	Info_AddChoice(Info_Jackal_Hello,"Wir sehen uns später.",Info_Jackal_Hello_Later);
	Info_AddChoice(Info_Jackal_Hello, "Ještě se uvidíme.", Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
//	AI_Output(other,self,"Info_Jackal_Hello_Later_15_00"); //I'll see you later.
//	AI_Output(other,self,"Info_Jackal_Hello_Later_15_00"); //Wir sehen uns später.
	AI_Output(other, self, "Info_Jackal_Hello_Later_15_00"); //Ještě se uvidíme.
//	AI_Output(self,other,"Info_Jackal_Hello_Later_07_01"); //Just you take care of yourself.
//	AI_Output(self,other,"Info_Jackal_Hello_Later_07_01"); //Pass solange gut auf dich auf.
	AI_Output(self, other, "Info_Jackal_Hello_Later_07_01"); //Tak na sebe dávej pozor.
	Jackal_ProtectionPaid = FALSE;
	Npc_SetPermAttitude(self, ATT_NEUTRAL);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Jackal_Hello);
};

// ************************************************************
// 					DOCH Schutzgeld
// ************************************************************

// Bei JACKAL reicht es, wenn man EINMAL zahlt

instance Info_Jackal_Schutz(C_INFO)
{
	npc = GRD_201_Jackal;
	nr = 3;
	condition = Info_Jackal_Schutz_Condition;
	information = Info_Jackal_Schutz_Info;
	important = 0;
	permanent = 0;
//	description = "I've been thinking about that protection money - here's your 10 ore.";
//	description = "Ich hab' noch mal über das Schutzgeld nachgedacht - hier sind deine 10 Erz.";
	description = "Přemýšlel jsem o těch penězích za ochranu - tady je tvých 10 nugetů.";
};

func int Info_Jackal_Schutz_Condition()
{
	//#Needs_Attention tento dialog je dostupny aj ked je hrac Stin/Strazca/Mag
	//Vlastne by asi nemal byt dostupny ak je hrac <> GIL_NONE hmmm
	if ((Npc_KnowsInfo(hero, Info_Jackal_Hello)) && (Jackal_ProtectionPaid == FALSE))
	{
		return 1;
	};

	return 0;
};

func void Info_Jackal_Schutz_Info()
{
	if (Npc_HasItems(other, itminugget) >= 10)
	{
//		AI_Output(other,self,"Info_Jackal_Schutz_15_00"); //I've been thinking about that protection money - here's your 10 ore.
//		AI_Output(other,self,"Info_Jackal_Schutz_15_00"); //Ich hab' noch mal über das Schutzgeld nachgedacht - hier sind deine 10 Erz.
		AI_Output(other, self, "Info_Jackal_Schutz_15_00"); //Přemýšlel jsem o těch penězích za ochranu - tady je tvých 10 nugetů.
//		AI_Output(self,other,"Info_Jackal_Schutz_07_01"); //You've made the right choice, man. I'll protect you from now on!
//		AI_Output(self,other,"Info_Jackal_Schutz_07_01"); //Du hast eine gute Wahl getroffen, Mann. Ab jetzt pass ich auf dich auf!
		AI_Output(self, other, "Info_Jackal_Schutz_07_01"); //Rozhodl ses správně, hochu. Od teďka tě budu chránit!
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self, ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
//		AI_Output(self,other,"Info_Jackal_Schutz_07_02"); //I don't see any 10 ore, man. Come back when you have it.
//		AI_Output(self,other,"Info_Jackal_Schutz_07_02"); //Ich sehe keine 10 Erz, Mann. Komm wieder, wenn du 10 Erz hast.
		AI_Output(self, other, "Info_Jackal_Schutz_07_02"); //Nevidím těch 10 nugetů, příteli. Vrať se, až je budeš mít.
	};
};

// ************************************************************
// 					Perm - wenn gezahlt
// ************************************************************

instance Info_Jackal_PermPaid(C_INFO)
{
	npc = GRD_201_Jackal;
	nr = 3;
	condition = Info_Jackal_PermPaid_Condition;
	information = Info_Jackal_PermPaid_Info;
	important = 0;
	permanent = 1;
//	description = "Well, how's it going?";
//	description = "Na, wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Jackal_PermPaid_Condition()
{
	if (Jackal_ProtectionPaid == TRUE)
	{
		return 1;
	};

	return 0;
};

func void Info_Jackal_PermPaid_Info()
{
//	AI_Output(other,self,"Info_Jackal_PermPaid_15_00"); //Well, how's it going?
//	AI_Output(other,self,"Info_Jackal_PermPaid_15_00"); //Na, wie sieht's aus?
	AI_Output(other, self, "Info_Jackal_PermPaid_15_00"); //Tak jak to jde?
//	AI_Output(self,other,"Info_Jackal_PermPaid_07_01"); //You can always count on me, kid!
//	AI_Output(self,other,"Info_Jackal_PermPaid_07_01"); //Du kannst nach wie vor auf mich zählen, Kleiner!
	AI_Output(self, other, "Info_Jackal_PermPaid_07_01"); //Se mnou můžeš kdykoliv počítat, mladej!
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN //
------------------------------------------------------------------------ */
instance GRD_201_Jackal_WELCOME(C_INFO)
{
	npc = GRD_201_Jackal;
	condition = GRD_201_Jackal_WELCOME_Condition;
	information = GRD_201_Jackal_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int GRD_201_Jackal_WELCOME_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return 1;
	};

	return 0;
};

func void GRD_201_Jackal_WELCOME_Info()
{
//	AI_Output(self,other,"GRD_201_Jackal_WELCOME_Info_07_01"); //You've worked your way up pretty fast! Well done, man!
//	AI_Output(self,other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Du hast dich ziemlich schnell nach oben gearbeitet! Gut gemacht, Mann!
	AI_Output(self, other, "GRD_201_Jackal_WELCOME_Info_07_01"); //Vypracoval jsi se docela rychle! Dobrá práce, chlape!
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info PAYDAY
//---------------------------------------------------------------------
instance Info_Jackal_PAYDAY(C_INFO)
{
	npc = GRD_201_Jackal;
	condition = Info_Jackal_PAYDAY_Condition;
	information = Info_Jackal_PAYDAY_Info;
	important = 1;
	permanent = 0;
};

func int Info_Jackal_PAYDAY_Condition()
{
	if (FMTaken)
	{
		return 1;
	};

	return 0;
};

func void Info_Jackal_PAYDAY_Info()
{
	if (C_NpcBelongsToNewCamp(hero))
	{
		if ((oldHeroGuild == GIL_GRD)
		|| (oldHeroGuild == GIL_KDF)
		|| (oldHeroGuild == GIL_STT))
		{
//			AI_Output(self,other,"Info_Jackal_PAYDAY_07_01"); //Hey, look at that! It's the traitor that switched camps!
//			AI_Output(self,other,"Info_Jackal_PAYDAY_07_01"); //Sieh mal einer an. Der Verräter, der das Lager gewechselt hat!
			//#Needs_Attention neprebasnime? který přešel z tábora do tábora! --> který přeběhl!
			AI_Output(self, other, "Info_Jackal_PAYDAY_07_01"); //Hej, podívej se na to! To je ten zrádce, který přešel z tábora do tábora!
//			AI_Output(self,other,"Info_Jackal_PAYDAY_07_02"); //You shouldn't have got involved with those losers, you'd still be one of us!
//			AI_Output(self,other,"Info_Jackal_PAYDAY_07_02"); //Du hättest dich nicht mit diesen Verlierern einlassen sollen, dann würdest du noch zu uns gehören!
			AI_Output(self, other, "Info_Jackal_PAYDAY_07_02"); //Neměl by ses stýkat s takovými ztroskotanci, nezapomeň, že jsi pořád jedním z nás!
		}
		else
		{
//			AI_Output(self,other,"Info_Jackal_PAYDAY_07_03"); //Hey, look at that! It's that guy from the New Camp, the one that caused us all that trouble!
//			AI_Output(self,other,"Info_Jackal_PAYDAY_07_03"); //Sieh mal einer an. Der Typ aus dem Neuen Lager, der uns schon so viel Ärger gemacht hat!
			AI_Output(self, other, "Info_Jackal_PAYDAY_07_03"); //Hej, podívej se na to! To je ten chlapík z Nového tábora, ten, co nás dostal do potíží!
//			AI_Output(self,other,"Info_Jackal_PAYDAY_07_04"); //if you'd shown a bit more sense back then, you could be on our side now - the side of the winners!
//			AI_Output(self,other,"Info_Jackal_PAYDAY_07_04"); //Wenn du damals schlauer gewesen wärst, würdest du heute zu uns - den Siegern - gehören!
			AI_Output(self, other, "Info_Jackal_PAYDAY_07_04"); //Kdybys byl tehdy chytřejší, byl bys teď na naší straně - na straně vítězů!
		};
	}
	else
	{
//		AI_Output(self,other,"Info_Jackal_PAYDAY_07_05"); //Will you look at that. It's the guy from the swamp camp.
//		AI_Output(self,other,"Info_Jackal_PAYDAY_07_05"); //Sieh mal einer an. Der Typ aus dem Sumpflager.
		AI_Output(self, other, "Info_Jackal_PAYDAY_07_05"); //Podívej se na to. To je ten chlapík z tábora v bažinách.
//		AI_Output(self,other,"Info_Jackal_PAYDAY_07_06"); //You've been around those loonies too long, they've made you soft in the head!
//		AI_Output(self,other,"Info_Jackal_PAYDAY_07_06"); //Du hast dich zu lange bei diesen Spinnern aufgehalten, die haben dein Hirn weich gekocht!
		AI_Output(self, other, "Info_Jackal_PAYDAY_07_06"); //Byls mezi těmi blázny tak dlouho, že ti z toho změkl mozek!
	};

	if (Jackal_ProtectionPaid)
	{
//		AI_Output(self,other,"Info_Jackal_PAYDAY_07_07"); //Even the protection money you paid me ain't gonna help you now.
//		AI_Output(self,other,"Info_Jackal_PAYDAY_07_07"); //Da hilft dir auch nicht, dass du mir Schutzgeld bezahlt hast.
		AI_Output(self, other, "Info_Jackal_PAYDAY_07_07"); //Teď už ti nepomůžou ani peníze za ochranu, které jsi mi zaplatil.
	}
	else
	{
//		AI_Output(self,other,"Info_Jackal_PAYDAY_07_08"); //You should have paid me when you still had the chance.
//		AI_Output(self,other,"Info_Jackal_PAYDAY_07_08"); //Hättest mich damals bezahlen sollen, als es noch Zeit war.
		AI_Output(self, other, "Info_Jackal_PAYDAY_07_08"); //Měl jsi mi zaplatit tehdy, když na to byl ještě čas.
	};

//	AI_Output(other,self,"Info_Jackal_PAYDAY_15_09"); //You've gone too far! It was a dumb idea to attack the mine!
//	AI_Output(other,self,"Info_Jackal_PAYDAY_15_09"); //Ihr seid zu weit gegangen! Der Überfall auf die Mine war dumm von euch!
	AI_Output(other, self, "Info_Jackal_PAYDAY_15_09"); //Zašli jste příliš daleko! Přepadení dolu byl ale hloupý nápad!
//	AI_Output(self,other,"Info_Jackal_PAYDAY_07_10"); //Seems to have worked though. And you ain't gonna change that, believe me!
//	AI_Output(self,other,"Info_Jackal_PAYDAY_07_10"); //Scheint aber funktioniert zu haben. Und du wirst daran auch nichts ändern, dafür werde ich persönlich Sorge tragen!
	AI_Output(self, other, "Info_Jackal_PAYDAY_07_10"); //Vypadá, že to fungovalo. A ty na tom nic nezměníš, o to se osobně postarám!
//	AI_Output(self,other,"Info_Jackal_PAYDAY_07_11"); //HEY GUYS, LET'S TAKE HIM OUT!!!
//	AI_Output(self,other,"Info_Jackal_PAYDAY_07_11"); //LOS, WIR MACHEN IHN KALT, JUNGS!!!
	AI_Output(self, other, "Info_Jackal_PAYDAY_07_11"); //HEJ CHLAPI, ZABTE HO!!!

	AI_StopProcessInfos(self);

	B_Story_JackalFight();
};
