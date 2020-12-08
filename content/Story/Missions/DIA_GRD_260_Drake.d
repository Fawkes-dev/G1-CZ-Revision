// ************************ EXIT **************************

instance Grd_260_Drake_Exit(C_INFO) //E1
{
	npc = Grd_260_Drake;
	nr = 999;
	condition = Grd_260_Drake_Exit_Condition;
	information = Grd_260_Drake_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Grd_260_Drake_Exit_Condition()
{
	return 1;
};

func void Grd_260_Drake_Exit_Info()
{
//	AI_Output(other,self,"Info_Exit_Info_15_01"); //See ya.
//	AI_Output(other,self,"Info_Exit_Info_15_01"); //Wir sehen uns.
	AI_Output(other,self,"Info_Exit_Info_15_01"); //Ještě se uvidíme.
	AI_StopProcessInfos(self);
};
/**************** GEFAHREN *********************/

instance Grd_260_Drake_Gefahr(C_INFO) //E1
{
	npc = Grd_260_Drake;
	condition = Grd_260_Drake_Gefahr_Condition;
	information = Grd_260_Drake_Gefahr_Info;
	important = 0;
	permanent = 0;
//	description = "What do I need to look out for in the mine?";
//	description = "Auf was sollte ich in der Mine achten?";
	description = "Na co si musím dát v dole pozor?";
};

func int Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo(hero,Grd_260_Drake_Mine));
};

func void Grd_260_Drake_Gefahr_Info()
{

//	AI_Output(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//What do I need to look out for in the mine?
//	AI_Output(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//Auf was sollte ich in der Mine achten?
	AI_Output(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//Na co si musím dát v dole pozor?
//	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Minecrawlers, mainly. Dangerous beasts.
//	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Vor allem auf Minecrawler. Das sind gefährliche Biester.
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Hlavně na důlní červy. Nebezpečné bestie.
//	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//We've had to give up a few caves because of them. They've eaten quite a few diggers, too.
//	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//Wir mussten wegen ihnen schon einige Höhlen aufgeben. Haben schon so manchen Buddler verspeist.
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//Museli jsme se kvůli nim vzdát dvou jeskyní. Sežrali už pár kopáčů.
//	AI_Output(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Tell me about the crawlers.
//	AI_Output(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Erzähl mir von den Crawlern.
	AI_Output(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Vyprávěj mi o těch červech.
//	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Oh, but my tongue's so dry...
//	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Nun, ich hab' eine ziemlich trockene Kehle.
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Och, když já mám tak sucho na jazyku...
//	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//You bring me a beer, and I'll tell you something about the crawlers.
//	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Wenn du ein Bier ausgibst, erzähl ich dir noch was über die Crawler.
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Přines mi pivo a já ti za to povím něco o těch červech.

};
/**************** CRAWLER, MEHR GEFAHREN INFOS *********************/

instance Grd_260_Drake_Crawler_Okay(C_INFO) //E1
{
	npc = Grd_260_Drake;
	condition = Grd_260_Drake_Crawler_Okay_Condition;
	information = Grd_260_Drake_Crawler_Okay_Info;
	important = 0;
	permanent = 0;
//	description = "(give beer)";
//	description = "(Bier ausgeben)";
	description = "(podej pivo)";
};

func int Grd_260_Drake_Crawler_Okay_Condition()
{
	if (Npc_KnowsInfo(hero,Grd_260_Drake_Gefahr))
	{
			return 1;
	};
};
func void Grd_260_Drake_Crawler_Okay_Info()
{
	if (Npc_HasItems(hero,ItFobeer))
	{
//		AI_Output(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Here, drink to my health!
//		AI_Output(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Hier, trink einen auf mein Wohl!
		AI_Output(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Tady, napij se na moje zdraví!

		B_GiveInvItems(hero,self,ItFoBeer,1);
		if (C_BodystateContains(self,BS_SIT))
		{
			AI_StandUp(self);
			AI_TurnToNpc(self,hero);
		};
		AI_UseItem(self,ItFobeer);

//		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Thanks. Well, crawlers live in large packs, mostly in the side caves.
//		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Danke. Also die Crawler gibt es hier zuhauf in vielen Nebenhöhlen.
		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Díky. Tak dobře. Červi žijou ve velkých skupinách, většinou v postranních jeskyních.
//		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//They've never attacked us here in the main shaft yet. If you ever meet one of 'em, run!
//		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//Hier im Hauptschacht haben sie noch nicht angegriffen. Wenn du ihnen mal begegnest, dann lauf!
		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//V hlavní šachtě na nás ještě nikdy nezaútočili. Kdybys ale nějakého viděl, uteč!
//		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Or stand with your back to the wall. That way you may stand a chance!
//		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Oder stell dich mit dem Rücken zur Wand. Dann hast du vielleicht noch eine Chance!
		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Nebo se postav zády ke stěně. Jedině tak máš šanci!

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
//		AI_Output(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Are you kidding me? Come back when you have some beer.
//		AI_Output(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Willst du mich verarschen? Komm wieder, wenn du Bier hast.
		AI_Output(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Děláš si ze mě blázny? Vrať se, až budeš mít nějaké pivo.
   		Grd_260_Drake_Crawler_Okay.permanent = 1;
   };
};
// ***************** DIE MINE *****************************

instance Grd_260_Drake_Mine(C_INFO) //E1
{
	npc = Grd_260_Drake;
	condition = Grd_260_Drake_Mine_Condition;
	information = Grd_260_Drake_Mine_Info;
	important = 0;
	permanent = 0;
//	description = "Can you tell me anything about the mine?";
//	description = "Kannst du mir was über die Mine erzählen?";
	description = "Můžeš mi říci něco o tom dole?";
};

func int Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info()
{
//	AI_Output(other,self,"Grd_260_Drake_Mine_Info_15_01");//Can you tell me anything about the mine?
//	AI_Output(other,self,"Grd_260_Drake_Mine_Info_15_01");//Kannst du mir was über die Mine erzählen?
	AI_Output(other,self,"Grd_260_Drake_Mine_Info_15_01");//Můžeš mi říci něco o tom dole?
//	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_02");//Well, this part we're standing in now is the main shaft. A system of catwalks takes you down to the bottom.
//	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_02");//Hier, wo wir uns befinden, das ist der Hauptschacht. Über ein Stegsystem kommst du bis ganz nach unten.
	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_02");//Dobrá, ta část, v které právě jsme, je v současnosti hlavní šachta. Po systému úzkých můstků se dostaneš až na dno.
//	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_03");//And they're digging for ore everywhere. But you need to be careful, there are many minecrawlers there as well.
//	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_03");//Und überall wird Erz geschürft. Doch sei vorsichtig, hier gibt's auch eine Menge Minecrawler.
	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_03");//Magická ruda se kope všude. Musíš být ale opatrný, je tady spousta důlních červů.
//	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_04");//Right at the bottom is the smelting place. We're smelting a part of the ore to use it right there.
//	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_04");//Ganz unten steht die Schmelze. Einen Teil des Erzes schmelzen wir direkt ein und verarbeiten es.
	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_04");//Přímo na dně je tavírna. Tady tavíme část rudy pro místní použití.

};
// ***************** MEHR MINE *****************************
instance Grd_260_Drake_Mine_Mehr(C_INFO) //E1
{
	npc = Grd_260_Drake;
	condition = Grd_260_Drake_Mine_Mehr_Condition;
	information = Grd_260_Drake_Mine_Mehr_Info;
	important = 0;
	permanent = 0;
//	description = "Tell me more about the mine!";
//	description = "Erzähl mehr von der Mine";
	description = "Řekni mi víc o tom dolu!";
};

func int Grd_260_Drake_Mine_Mehr_Condition()
{
	if (Npc_KnowsInfo(hero,Grd_260_Drake_Mine))
	{
		return 1;
	};
};
func void Grd_260_Drake_Mine_Mehr_Info()
{
//	AI_Output(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Tell me more about it!
//	AI_Output(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Erzähl mir mehr davon!
	AI_Output(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Řekni mi o tom ještě víc!
//	AI_Output(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//If you want to know more, go to Viper. He's the smelter.
//	AI_Output(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Wenn du mehr wissen willst, dann wende dich an Viper. Er ist der Schmelzer.
	AI_Output(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Když chceš vědět víc, zajdi za Viperem. To je tavič.
//	AI_Output(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Or talk to Ian. He's the boss. He organizes everything here in the mine.
//	AI_Output(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Oder wende dich an Ian. Er ist der Boss. Er organisiert hier in der Mine alles.
	AI_Output(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Nebo řekni Ianovi. To je šéf. Organizuje práci v celém dole.

};

// ***************** IAN *****************************
instance Grd_260_Drake_Ian(C_INFO) //E1
{
	npc = Grd_260_Drake;
	condition = Grd_260_Drake_Ian_Condition;
	information = Grd_260_Drake_Ian_Info;
	important = 0;
	permanent = 0;
	description = "Where can I find Ian?";
};

func int Grd_260_Drake_Ian_Condition()
{
	if !(Npc_KnowsInfo(hero,STT_301_IAN_HI)) && (Npc_KnowsInfo(hero,Grd_260_Drake_Mine_Mehr))
	{
		return TRUE;
	};

};
func void Grd_260_Drake_Ian_Info()
{
//	AI_Output(other,self,"Grd_260_Drake_Ian_Info_15_01");//Where can I find Ian?
//	AI_Output(other,self,"Grd_260_Drake_Ian_Info_15_01");//Wo kann ich Ian finden ?
	AI_Output(other,self,"Grd_260_Drake_Ian_Info_15_01");//Kde najdu Iana?
//	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_02");//He's right in the middle of the main shaft, next to the storeroom.
//	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_02");//Er steht in der Mitte des Hauptschachtes, beim Warenlager.
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_02");//Je přímo uprostřed hlavní šachty, za skladištěm.
//	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_03");//Oh, one more thing - you know Thorus, don't you? Forget him!
//	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_03");//Ach noch was, du kennst doch Thorus? Vergiss ihn!
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_03");//Jo, a ještě něco - znáš Thoruse, že jo? Pus't ho z hlavy!
//	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_04");//There's just one person who has the say in here and that's Ian. He's the boss.
//	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_04");//Hier drin hat nur einer das Sagen und das ist Ian. Er ist hier der Chef.
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_04");//Jediný, kdo tady má co říci, je Ian. On je tu šéf.
//	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_05");//If you get into trouble with him, you'll be in trouble with us all. Understood?
//	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_05");//Legst du dich mit ihm an, legst du dich mit uns allen an. Verstanden?
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_05");//Pokud s ním budeš mít těžkosti, budeš je mít s náma se všema! Rozumíš?
};  

/*------------------------------------------------------------------------
// GARDEAUFNAHME //
------------------------------------------------------------------------*/
instance Grd_260_Drake_GARDEAUFNAHME(C_INFO)
{
	npc = Grd_260_Drake;
	condition = Grd_260_Drake_GARDEAUFNAHME_Condition;
	information = Grd_260_Drake_GARDEAUFNAHME_Info;
	important = 1;
	permanent = 0;
};

func int Grd_260_Drake_GARDEAUFNAHME_Condition()
{ 
	if (Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) 
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	&& (!Npc_KnowsInfo(hero,Grd_264_Gardist_GARDEAUFNAHME))
	{
		return TRUE;
	};
};
func void Grd_260_Drake_GARDEAUFNAHME_Info()
{
//	AI_Output(self,other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hey, you did a good job with the crawlers! You deserve to be admitted as a guard now!
//	AI_Output(self,other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hey, gute Arbeit, das mit den Crawlern! Damit hast du dir deine Aufnahme bei den Gardisten verdient!
	AI_Output(self,other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hej, s těmi červy jsi odvedl skvělou práci! Tím jsi si zasloužil jmenování ke strážím.
//	AI_Output(self,other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Just go over to the Old Camp and speak to Thorus about it!
//	AI_Output(self,other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Geh doch mal zum Alten Lager und sprich mit Thorus darüber!
	AI_Output(self,other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Běž do Starého tábora a řekni to Thorusovi!

	Log_CreateTopic(GE_BecomeGuard,LOG_NOTE);
//	B_LogEntry(GE_BecomeGuard,"As soon as I've returned the eggs, I should have a word with Thorus. Maybe he'll let me join the guards.");
//	B_LogEntry(GE_BecomeGuard,"Wenn ich die Eier zurückgebracht habe, sollte ich mal mit Thorus reden. Vielleicht nimmt er mich in die Reihen der Gardisten auf.");
	B_LogEntry(GE_BecomeGuard,"Jakmile přinesu ta vajíčka, musím si promluvit s Thorusem. Možná mě přijme ke strážím.");
};

