// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT
// **************************************************

instance Org_826_Mordrag_Exit(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 999;
	condition = Org_826_Mordrag_Exit_Condition;
	information = Org_826_Mordrag_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

func void Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance Org_826_Mordrag_Greet(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 1;
	condition = Org_826_Mordrag_Greet_Condition;
	information = Org_826_Mordrag_Greet_Info;
	permanent = 0;
	important = 1;
};

func int Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void Org_826_Mordrag_Greet_Info()
{
//	AI_Output(self,other,"Org_826_Mordrag_Greet_11_00"); //Hey, newcomer! I'm Mordrag. You should remember that name - you can buy any kind of goods from me at a cheap price!
//	AI_Output(self,other,"Org_826_Mordrag_Greet_11_00"); //Hey, Neuer! Ich bin Mordrag. Meinen Namen solltest du dir merken - ich kann dir gute Ware aller Art günstig verkaufen!
	AI_Output(self,other,"Org_826_Mordrag_Greet_11_00"); //Hej, ty novej! Já jsem Mordrag. To jméno by sis měl zapamatovat - ode mě můžeš koupit jakékoliv zboží za dobrou cenu!
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance Org_826_Mordrag_Trade(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 800;
	condition = Org_826_Mordrag_Trade_Condition;
	information = Org_826_Mordrag_Trade_Info;
	permanent = 1;
//	description = "Show me your goods.";
//	description = "Zeig mir deine Ware.";
	description = "Ukaž mi svoje zboží.";
	trade = 1;
};

func int Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

func void Org_826_Mordrag_Trade_Info()
{
//	AI_Output(other,self,"Org_826_Mordrag_Trade_15_00"); //Show me your goods.
//	AI_Output(other,self,"Org_826_Mordrag_Trade_15_00"); //Zeig mir deine Ware.
	AI_Output(other,self,"Org_826_Mordrag_Trade_15_00"); //Ukaž mi tvoje zboží.
//	AI_Output(self,other,"Org_826_Mordrag_Trade_11_01"); //Choose something...
//	AI_Output(self,other,"Org_826_Mordrag_Trade_11_01"); //Such dir was aus ...
	AI_Output(self,other,"Org_826_Mordrag_Trade_11_01"); //Něco si vyber...
	if (Mordrag_Traded==0)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
//		B_LogEntry(GE_TraderOC,"The rogue Mordrag sells stolen goods at the market.");
//		B_LogEntry(GE_TraderOC,"Bandit Mordrag verhökert am Marktplatz Diebesgut");
		B_LogEntry(GE_TraderOC,"Bandita Mordrag prodává na tržišti kradené zboží.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER FÜR MAGIER
// **************************************************

instance Org_826_Mordrag_Courier(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_Courier_Condition;
	information = Org_826_Mordrag_Courier_Info;
	permanent = 1;
//	description = "Are you really the magicians' courier?";
//	description = "Stimmt es, dass du Kurier für die Magier bist?";
	description = "Jsi doopravdy kurýr mágů?";
};

func int Org_826_Mordrag_Courier_Condition()
{
	if Thorus_MordragMageMessenger
	{
		return 1;
	};
};

func void Org_826_Mordrag_Courier_Info()
{
//	AI_Output(other,self,"Org_826_Mordrag_Courier_15_00"); //Are you really the magicians' courier?
//	AI_Output(other,self,"Org_826_Mordrag_Courier_15_00"); //Stimmt es, dass du Kurier für die Magier bist?
	AI_Output(other,self,"Org_826_Mordrag_Courier_15_00"); //Jsi doopravdy kurýr mágů?
//	AI_Output(self,other,"Org_826_Mordrag_Courier_11_01"); //What if I am?
//	AI_Output(self,other,"Org_826_Mordrag_Courier_11_01"); //Und wenn es so wäre?
	AI_Output(self,other,"Org_826_Mordrag_Courier_11_01"); //A co když jsem?
//	AI_Output(other,self,"Org_826_Mordrag_Courier_15_02"); //I'd like to have a chance to talk to the magicians. I have to get inside the castle.
//	AI_Output(other,self,"Org_826_Mordrag_Courier_15_02"); //Ich würde gerne mal Gelegenheit haben, mit den Magiern zu reden. Ich muss in die Burg.
	AI_Output(other,self,"Org_826_Mordrag_Courier_15_02"); //Potřeboval bych si promluvit s mágy. Musím se dostat do hradu.
//	AI_Output(self,other,"Org_826_Mordrag_Courier_11_03"); //The magicians' couriers bear seals which allow them entry to the castle. If you were one of us, you could get such a seal...
//	AI_Output(self,other,"Org_826_Mordrag_Courier_11_03"); //Die Kuriere der Magier haben ein Siegel, dass ihnen Zutritt zur Burg erlaubt. Wenn du einer von uns wärst, könntest du so ein Siegel bekommen ...
	AI_Output(self,other,"Org_826_Mordrag_Courier_11_03"); //Kurýři mágů nosí znak, který jim umožní vstup na hrad. Jestli jsi jeden z nás, pak bys měl mít takový znak...
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance Org_826_Mordrag_Problem(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_Problem_Condition;
	information = Org_826_Mordrag_Problem_Info;
	permanent = 0;
//	description = "You have a problem.";
//	description = "Du hast ein Problem.";
	description = "Máš problém.";
};

func int Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING
	{
		return 1;
	};
};

func void Org_826_Mordrag_Problem_Info()
{
//	AI_Output(other,self,"Org_826_Mordrag_Problem_15_00"); //You have a problem.
//	AI_Output(other,self,"Org_826_Mordrag_Problem_15_00"); //Du hast ein Problem.
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_00"); //Máš problém.
//	AI_Output(self,other,"Org_826_Mordrag_Problem_11_01"); //Really? What's that?
//	AI_Output(self,other,"Org_826_Mordrag_Problem_11_01"); //Ach? Und das wäre?
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_01"); //Opravdu? Co se děje?
//	AI_Output(other,self,"Org_826_Mordrag_Problem_15_02"); //There are people around here who want to get rid of you.
//	AI_Output(other,self,"Org_826_Mordrag_Problem_15_02"); //Es gibt Leute hier, die wollen, dass du dich hier nie wieder blicken lässt.
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_02"); //Jsou tady lidi, kteří se tě chtějí zbavit.
//	AI_Output(self,other,"Org_826_Mordrag_Problem_11_03"); //Really? Then you can tell them they should send someone along to enforce their wish.
//	AI_Output(self,other,"Org_826_Mordrag_Problem_11_03"); //So? Dann sag doch den Leuten, sie sollen jemanden schicken, der ihren Willen auch durchsetzt.
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_03"); //Opravdu? Pak jim můžeš říci, že by měli někoho vyslat, aby jim splnil jejich přání.
//	AI_Output(other,self,"Org_826_Mordrag_Problem_15_04"); //What makes you so sure I'm not the one to do it?
//	AI_Output(other,self,"Org_826_Mordrag_Problem_15_04"); //Wie kommst du darauf, dass ich das nicht tue?
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_04"); //Jak si můžeš být tak jistý, že nejsem ten, kdo to má udělat?
//	AI_Output(self,other,"Org_826_Mordrag_Problem_11_05"); //Cos I think you're smarter than that, boy. You'll soon realize that there are better opportunities than working for Gomez.
//	AI_Output(self,other,"Org_826_Mordrag_Problem_11_05"); //Weil ich denke, dass du ein schlauer Junge bist. Du wirst schnell erkennen, dass es Besseres gibt, als für Gomez zu arbeiten.
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_05"); //Protože si myslím, že na to jsi příliš bystrý, chlapče. Brzy si uvědomíš, že je lepší stát proti Gomezovi, než pro něj pracovat.
//	AI_Output(self,other,"Org_826_Mordrag_Problem_11_06"); //We too need capable people in the New Camp, and nobody tells you what to do.
//	AI_Output(self,other,"Org_826_Mordrag_Problem_11_06"); //Bei uns im Neuen Lager können wir fähige Leute genauso gut brauchen, und dort gibt es niemanden, der dir sagt, was du zu tun und zu lassen hast.
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_06"); //V Novém táboře hodně potřebujeme schopné lidi a nikdo ti tam nebude přikazovat, co máš dělat.
};

// **************************************************
//					  NCInfo
// **************************************************

instance Org_826_Mordrag_NCInfo(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_NCInfo_Condition;
	information = Org_826_Mordrag_NCInfo_Info;
	permanent = 0;
//	description = "Tell me more about the New Camp.";
//	description = "Erzähl mir was über das Neue Lager.";
	description = "Pověz mi víc o Novém táboře.";
};

func int Org_826_Mordrag_NCInfo_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier))
	{
		return 1;
	};
};

func void Org_826_Mordrag_NCInfo_Info()
{
//	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_00"); //Tell me more about the New Camp.
//	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_00"); //Erzähl mir was über das Neue Lager.
	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_00"); //Pověz mi víc o Novém táboře.
//	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_01"); //It's the camp where you have the most freedom within the colony. We don't have any Ore Barons or Gurus bossing us around.
//	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_01"); //Es ist das freieste Lager in der Kolonie. Wir haben keine Erzbarone oder Gurus, die uns herumkommandieren.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_01"); //Je to tábor, ve kterém máš největší svobodu v celé kolonii. Nemáme žádné Rudobarony ani Guru, kteří by nám šéfovali.
//	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_02"); //We have our own mine. But the ore that is produced there isn't given to the damned king!
//	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_02"); //Wir haben eine eigene Mine. Aber das Erz, das wir dort fördern, wird nicht an den verdammten König geliefert!
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_02"); //Máme vlastní důl. Ale ruda, kterou vyrábíme, neputuje k žádnému zpropadenému králi!
//	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_03"); //So what is it used for?
//	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_03"); //Sondern?
	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_03"); //Tak k čemu se používá?
//	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_04"); //Our magicians are working on a plan to break out of here. All the ore is collected for this plan.
//	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_04"); //Unsere Magier arbeiten an einem Ausbruchsplan. Dafür wird alles Erz gesammelt.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_04"); //Naši mágové pracují na plánu, jak prolomit Bariéru. Všechna ruda se shromažďuje pro tento plán.
//	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_05"); //While Gomez and his people are lazing around, we drudge for freedom - that's what's going on.
//	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_05"); //Während Gomez und seine Leute auf der faulen Haut liegen, rackern wir uns für die Freiheit ab - so sieht's aus.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_05"); //Zatímco se Gomez a jeho lidé povalují, my se dřeme za svobodu - to je to, co se děje.
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_JoinNewcamp_Condition;
	information = Org_826_Mordrag_JoinNewcamp_Info;
	permanent = 0;
//	description = "And if I want to join the New Camp...";//könntest du mir dabei helfen... ZU LANG
//	description = "Und wenn ich mich dem Neuen Lager anschließen will, ...";//könntest du mir dabei helfen... ZU LANG
	description = "A kdybych se chtěl přidat k Novému táboru... mohl bys mi pomoci?";//könntest du mir dabei helfen... ZU LANG
};

func int Org_826_Mordrag_JoinNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier))
	{
		return 1;
	};
};

func void Org_826_Mordrag_JoinNewcamp_Info()
{
//	AI_Output(other,self,"Org_826_Mordrag_JoinNewcamp_15_00"); //And if I wanted to join the New Camp... could you help me?
//	AI_Output(other,self,"Org_826_Mordrag_JoinNewcamp_15_00"); //Und wenn ich mich dem Neuen Lager anschließen wollte, könntest du mir dabei helfen ...
	AI_Output(other,self,"Org_826_Mordrag_JoinNewcamp_15_00"); //A kdybych se chtěl přidat k Novému táboru... mohl bys mi pomoci?
//	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_01"); //If you're serious we can go now! I can take you to Lares. He's the head of our gang.
//	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Wenn du's wirklich ernst meinst, können wir direkt losgehen. Ich kann dich zu Lares bringen. Er ist der Kopf unserer Bande.
	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Jestli to myslíš vážně, můžeme hned jít! Zavedu tě k Laresovi. Je hlavou tlupy.
//	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_02"); //But if you prefer to beat me out of the Camp... Well, go for it!
//	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Aber wenn du lieber versuchen willst, mich aus dem Lager zu prügeln - bitte.
	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Ale jestli mě chceš raději zmlátit někde mimo tábor... Dobrá, do toho!
};

instance Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_GotoNewcamp_Condition;
	information = Org_826_Mordrag_GotoNewcamp_Info;
	permanent = 0;
//	description = "Let's go to the New Camp!";
//	description = "Lass uns zum Neuen Lager gehen!";
	description = "Tak pojďme do Nového tábora!";
};

func int Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

func void Org_826_Mordrag_GotoNewcamp_Info()
{
//	AI_Output(other,self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Let's go to the New Camp!
//	AI_Output(other,self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Lass uns zum Neuen Lager gehen!
	AI_Output(other,self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Tak pojďme do Nového tábora!
//	AI_Output(self,other,"Org_826_Mordrag_GotoNewcamp_11_01"); //O.K.! Follow me.
//	AI_Output(self,other,"Org_826_Mordrag_GotoNewcamp_11_01"); //Gut! Folge mir.
	AI_Output(self,other,"Org_826_Mordrag_GotoNewcamp_11_01"); //Dobře! Následuj mě.

	Mordrag_GotoNC_Day = Wld_GetDay();

	AI_StopProcessInfos(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY); // damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
	};
//	B_LogEntry(CH1_JoinNC,"Mordrag has agreed to show me the way to the New Camp. I hope this isn't a trap!");
//	B_LogEntry(CH1_JoinNC,"Mordrag hat sich bereit erklärt, mir den Weg zum neuen Lager zu zeigen. Ich hoffe, dass er mich nicht in eine Falle locken will!");
	B_LogEntry(CH1_JoinNC,"Mordrag mi slíbil, že mi ukáže cestu do Nového tábora. Doufám, že to není léčka!");

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_AtNewcamp_Condition;
	information = Org_826_Mordrag_AtNewcamp_Info;
	permanent = 0;
	important = 1;
};

func int Org_826_Mordrag_AtNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21"))
	{
		self.flags = 0;
		return 1;
	};
};

func void Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{
//		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_00"); //Well, here we are.
//		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_00"); //So, hier sind wir.
		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_00"); //Tak, a jsme tady.
	}
	else
	{
//		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //I thought you'd never arrive! Never mind - we're here!
//		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //Ich dachte schon, du kommst nie an! Egal - wir sind hier!
		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //Myslel jsem, že už nikdy nepřijdeš! Nevadí - jsme tady!
	};
//	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_01"); //When you pass through the gate, you'll reach the New Camp. Talk to Lares. He'll help you. Give this to him. It's a precious ring.
//	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_01"); //Wenn du durch das Tor gehst, kommst du ins Neue Lager. Sprich mit Lares. Er wird dir weiterhelfen. Hier - gib ihm das hier von mir. Es ist ein wertvoller Ring.
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_01"); //Jakmile projdeš branou, budeš v Novém táboře. Promluv si s Laresem. Pomůže ti. Dej mu tohle. Je to nádherný prsten.
//	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_02"); //It's your ticket to see Lares. You need a good reason to be allowed to meet him.
//	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_02"); //Er ist deine Eintrittskarte zu Lares. Ohne guten Grund kommst du nicht zu ihm.
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_02"); //To je tvoje vstupenka k Laresovi. Musíš mít dobrý důvod, abys ho mohl navštívit.
//	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_03"); //Well, thinking about it, I think I'll stay here for some time. I've earned enough for now, and things are heating up in the Old Camp.
//	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_03"); //Wenn ich's mir so recht überlege - ich glaub', ich bleib' 'ne Weile hier. Ich hab' fürs Erste genug verdient und im Alten Lager wird's langsam heiß.
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_03"); //Dobrá, jak o tom přemýšlím, myslím, že tady na nějaký čas zůstanu. Už jsem vydělal dost a ve Starém táboře je teď trochu dusno.
//	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_04"); //If you want, come and meet me at the bar - it's the hut out on the lake. Take care!
//	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_04"); //Wenn du Lust hast, triff mich in der Kneipe - das Haus direkt auf dem See. Mach's gut!
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_04"); //Jestli chceš, přijď za mnou do baru - to je ta chatrč na jezeře. Dávej pozor!
//	AI_Output(other,self,"Org_826_Mordrag_AtNewcamp_15_05"); //See you.
//	AI_Output(other,self,"Org_826_Mordrag_AtNewcamp_15_05"); //Wir sehen uns.
	AI_Output(other,self,"Org_826_Mordrag_AtNewcamp_15_05"); //Uvidíme se!

	CreateInvItems(self,MordragsRing,1);
	B_GiveInvItems(self,other,MordragsRing,1);

	B_GiveXP(XP_ArrivedWithMordrag);
//	B_LogEntry(CH1_JoinNC,"Now we're in front of the gate of the New Camp. Mordrag gave me a ring I am supposed to give Lares, the leader of the rogues, if I really want to join the New Camp. Mordrag wants to stay in the bar at the lake for a while.");
//	B_LogEntry(CH1_JoinNC,"Wir stehen nun vor dem Tor des Neuen Lagers. Für den Fall, dass ich wirklich in das Neue Lager aufgenommen werden will, gab mir Mordrag einen Ring, den ich dem Anführer der Banditen mit Namen Lares bringen soll. Mordrag will erst mal hier bleiben und ist ab jetzt in der Kneipe auf dem See zu finden.");
	B_LogEntry(CH1_JoinNC,"Stojíme u přední brány Nového tábora a Mordrag mi dal prsten, který mám ukázat vůdci banditů Laresovi, pokud se chci přidat k Novému táboru. Mordrag se chce na chvilku zastavit v baru na jezeře.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;

	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance Org_826_Mordrag_Fight(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_Fight_Condition;
	information = Org_826_Mordrag_Fight_Info;
	permanent = 0;
//	description = "The camp ain't big enough for the both of us!";
//	description = "In diesem Lager ist nicht genug Platz für uns beide!";
	description = "Tenhle tábor není pro nás dva dost velký!";
};

func int Org_826_Mordrag_Fight_Condition()
{
	if ((Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)))
	{
		return 1;
	};
};

func void Org_826_Mordrag_Fight_Info()
{
//	AI_Output(other,self,"Org_826_Mordrag_Fight_15_00"); //There camp ain't big enough for the both of us!
//	AI_Output(other,self,"Org_826_Mordrag_Fight_15_00"); //In diesem Lager ist nicht genug Platz für uns beide!
	AI_Output(other,self,"Org_826_Mordrag_Fight_15_00"); //Tenhle tábor není pro nás dva dost velký!
//	AI_Output(self,other,"Org_826_Mordrag_Fight_11_01"); //Pardon me?
//	AI_Output(self,other,"Org_826_Mordrag_Fight_11_01"); //Bitte, was?
	AI_Output(self,other,"Org_826_Mordrag_Fight_11_01"); //Co prosím?

	Info_ClearChoices(Org_826_Mordrag_Fight);
//	Info_AddChoice(Org_826_Mordrag_Fight,"Just scram out of this camp!",Info_Mordrag_Fight_GetAway);
//	Info_AddChoice(Org_826_Mordrag_Fight,"Mach dass du aus diesem Lager verschwindest!",Info_Mordrag_Fight_GetAway);
	Info_AddChoice(Org_826_Mordrag_Fight,"Prostě odsud vypadni!",Info_Mordrag_Fight_GetAway);
//	Info_AddChoice(Org_826_Mordrag_Fight,"There's no room here for people who steal from the Ore Barons!",Info_Mordrag_Fight_OreBarons);
//	Info_AddChoice(Org_826_Mordrag_Fight,"Hier ist kein Platz für Leute, die die Erzbarone bestehlen!",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice(Org_826_Mordrag_Fight,"Tady není místo pro lidi, kteří kradou u Rudobaronů!",Info_Mordrag_Fight_OreBarons);
//	Info_AddChoice(Org_826_Mordrag_Fight,"Thorus sent me. He wants to get rid of you once and for all.",Info_Mordrag_Fight_Thorus);
//	Info_AddChoice(Org_826_Mordrag_Fight,"Thorus schickt mich. Er will dich für immer loswerden.",Info_Mordrag_Fight_Thorus);
	Info_AddChoice(Org_826_Mordrag_Fight,"Poslal mě Thorus. Chce, abych tě provždy odstranil.",Info_Mordrag_Fight_Thorus);
};

func void Info_Mordrag_Fight_GetAway()
{
//	AI_Output(other,self,"Info_Mordrag_Fight_GetAway_15_00"); //Just get out of this camp!
//	AI_Output(other,self,"Info_Mordrag_Fight_GetAway_15_00"); //Mach, dass du aus diesem Lager verschwindest!
	AI_Output(other,self,"Info_Mordrag_Fight_GetAway_15_00"); //Prostě odsud vypadni!
//	AI_Output(self,other,"Info_Mordrag_Fight_GetAway_11_01"); //Big words from a small man...
//	AI_Output(self,other,"Info_Mordrag_Fight_GetAway_11_01"); //Große Worte für einen kleinen Mann ...
	AI_Output(self,other,"Info_Mordrag_Fight_GetAway_11_01"); //Velký slova malýho chlapa...

	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void Info_Mordrag_Fight_OreBarons()
{
//	AI_Output(other,self,"Info_Mordrag_Fight_OreBarons_15_00"); //There ain't no room for people who steal from the Ore Barons!
//	AI_Output(other,self,"Info_Mordrag_Fight_OreBarons_15_00"); //Hier ist kein Platz für Leute, die die Erzbarone bestehlen!
	AI_Output(other,self,"Info_Mordrag_Fight_OreBarons_15_00"); //Tady není místo pro lidi, kteří kradou u Rudobaronů!
//	AI_Output(self,other,"Info_Mordrag_Fight_OreBarons_11_01"); //Oh, that's what you mean! Why didn't you just say so...
//	AI_Output(self,other,"Info_Mordrag_Fight_OreBarons_11_01"); //Ach, so ist das! Sag das doch gleich ...
	AI_Output(self,other,"Info_Mordrag_Fight_OreBarons_11_01"); //Á, tak tohle máš na mysli! Proč neřekneš rovnou...

	MordragKO_PlayerChoseOreBarons = TRUE;

	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void Info_Mordrag_Fight_Thorus()
{
//	AI_Output(other,self,"Info_Mordrag_Fight_Thorus_15_00"); //Thorus sent me. He wants to get rid of you once and for all.
//	AI_Output(other,self,"Info_Mordrag_Fight_Thorus_15_00"); //Thorus schickt mich. Er will dich für immer loswerden.
	AI_Output(other,self,"Info_Mordrag_Fight_Thorus_15_00"); //Poslal mě Thorus. Chce, abych tě provždy odstranil.
//	AI_Output(self,other,"Info_Mordrag_Fight_Thorus_11_01"); //Really? Thorus? That's all I wanted to know...
//	AI_Output(self,other,"Info_Mordrag_Fight_Thorus_11_01"); //So? Thorus also? Das war alles, was ich wissen wollte ...
	AI_Output(self,other,"Info_Mordrag_Fight_Thorus_11_01"); //Opravdu? Thorus? To je všechno, co jsem chtěl vědět...

	MordragKO_PlayerChoseThorus = TRUE;

	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance Org_826_Mordrag_HauAb(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_HauAb_Condition;
	information = Org_826_Mordrag_HauAb_Info;
	permanent = 0;
	important = 1;
};

func int Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);

	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

func void Org_826_Mordrag_HauAb_Info()
{
//	AI_Output(other,self,"Org_826_HauAb_GotoNewcamp_15_00"); //Just get out of here...
//	AI_Output(other,self,"Org_826_HauAb_GotoNewcamp_15_00"); //Mach, dass du wegkommst ...
	AI_Output(other,self,"Org_826_HauAb_GotoNewcamp_15_00"); //Tak odsud vypadni...

	AI_StopProcessInfos(self);

	MordragKO_HauAb = TRUE;

//	B_LogEntry(CH1_MordragKO,"I knocked Mordrag out and told him I never wanted to see him in the Old Camp again.");
//	B_LogEntry(CH1_MordragKO,"Ich habe Mordrag bewusstlos geschlagen und ihm gesagt, er soll sich nie wieder im alten Lager blicken lassen.");
	B_LogEntry(CH1_MordragKO,"Vyběhl jsem s Mordragem a řekl mu, že ho už nikdy nechci ve Starém táboře vidět.");

	Npc_ExchangeRoutine(self,"Start");
};

// **************************************************
//					GotoKalom
// **************************************************

instance Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 2;
	condition = Org_826_Mordrag_GotoKalom_Condition;
	information = Org_826_Mordrag_GotoKalom_Info;
	permanent = 0;
//	description = "Lares has a message for you.";
//	description = "Lares hat eine Nachricht für dich.";
	description = "Lares má pro tebe zprávu.";
};

func int Org_826_Mordrag_GotoKalom_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_ORG)
	&& (Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

func void Org_826_Mordrag_GotoKalom_Info()
{
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares has a message for you.
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares hat eine Nachricht für dich.
	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares má pro tebe zprávu.
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_01"); //Tell me about it.
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_01"); //Lass hören.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_01"); //Řekni mi o tom.
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_02"); //He wants to know what's going on in the Sect Camp and he wants you to find out.
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_02"); //Er will wissen, was im Lager der Sekte vorgeht. Er sagt, du sollst dich darum kümmern.
	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_02"); //Chce vědět, co se děje v Sektovním táboře a chce, abys mu to zjistil ty.
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_03"); //I get the feeling this problem will solve itself...
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_03"); //Ich hab' so ein Gefühl, als wenn sich die Sache von alleine erledigt ...
	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_03"); //Mám pocit, že se ten problém vyřeší sám...

//	B_LogEntry(CH1_JoinNC,"I told Mordrag what Lares asked me to say. He mumbled something about things taking care of themselves. No idea what he meant by it!");
//	B_LogEntry(CH1_JoinNC,"Habe Mordrag gesagt was Lares mir aufgetragen hat. Er faselte etwas davon, dass sich die Sache von selbst regelt. Keine Ahnung, was er damit meint!");
	B_LogEntry(CH1_JoinNC,"Řekl jsem Mordragovi, co po mně Lares chtěl. Mumlal něco o tom, že se věci vyvrbí samy. Nemám tušení, co tím měl na mysli!");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 2;
	condition = Org_826_Mordrag_GotoKalomNOW_Condition;
	information = Org_826_Mordrag_GotoKalomNOW_Info;
	permanent = 0;
//	description = "Lares told me to help you with this sect business.";
//	description = "Lares sagt, ich soll dich bei der Sektensache unterstützen.";
	description = "Lares mi řekl, abych ti pomohl s tou sektářskou záležitostí.";
};

func int Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if (Npc_GetTrueGuild(other)==GIL_ORG)
	&& Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

func void Org_826_Mordrag_GotoKalomNOW_Info()
{
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares told me to help you with this sect business.
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares sagt, ich soll dich bei der Sektensache unterstützen.
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares mi řekl, abych ti pomohl s tou sektářskou záležitostí.
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //You see... I knew I wouldn't have to take care of it myself.
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Siehst du ... Ich dachte mir, ich müsste mich nicht selbst drum kümmern.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Vidíš... Věděl jsem, že se o to nebudu muset starat sám.
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Do you want me to settle the affair all by myself?
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Soll ich die Sache ganz allein erledigen?
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Chceš, abych ten případ vyřešil celý já sám?
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //I'm sure you'll make it. Listen: It's important to find out the truth about this invocation story.
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Das schaffst du schon. Hör zu: Es geht darum, rauszufinden, was an dieser ganzen Beschwörungsklamotte dran ist.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Jsem si jistý, že to zvládneš. Poslouchej: důležité je zjistit, co je pravdy na těch pověstech o vzývání.
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //I know that those sect loonies are planning a big invocation. Me, I don't believe in the Sleeper - but one thing's for sure:
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //Ich weiß, dass die Sektenspinner eine große Anrufung planen. Ich persönlich glaube ja nicht an den Schläfer - aber eins steht fest:
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //Vím, ti sektářští blázni plánují velké vzývání. Co se mě týče, já ve Spáče nevěřím - jedna věc je ale jistá:
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //The Gurus have powerful magic at their command. Therefore it's better to know what's going on. You with me so far?
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Die Gurus sind mit mächtiger Magie im Bunde. Und es ist besser, wenn wir wissen, was da abgeht. Soweit alles klar?
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Guru mají ve své moci silná kouzla. Proto bude lepší vědět, o co půjde. Rozumíš mi?

//	B_LogEntry(CH1_GotoPsiCamp,"Mordrag has passed the buck of spying on the swamp camp quite cleverly to me. The Gurus seem to be preparing a big invocation, but I should get more details.");
//	B_LogEntry(CH1_GotoPsiCamp,"Mordrag hat die Spitzelaufgabe im Sumpflager geschickt auf mich abgewälzt. Die Gurus scheinen eine große Beschwörung vorzubereiten, aber was da dran ist, sollte ich besser genauer in Erfahrung bringen.");
	B_LogEntry(CH1_GotoPsiCamp,"Mordrag provedl svůj výzvědný úkol v táboře v bažinách docela chytře. Guru se zřejmě připravují k velkému vzývání, já bych chtěl ale znát další podrobnosti.");
	B_GiveXP(XP_AssistMordrag);

	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;

	Info_ClearChoices(Org_826_Mordrag_GotoKalomNOW);
//	Info_AddChoice(Org_826_Mordrag_GotoKalomNOW,"Could you give me more concrete instructions?",Org_826_Mordrag_GotoKalomNOW_Precise);
//	Info_AddChoice(Org_826_Mordrag_GotoKalomNOW,"Hast du genauere Anweisungen?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice(Org_826_Mordrag_GotoKalomNOW,"Můžeš mi dát nějaké podrobnější pokyny?",Org_826_Mordrag_GotoKalomNOW_Precise);
//	Info_AddChoice(Org_826_Mordrag_GotoKalomNOW,"I'll see what I can do.",Org_826_Mordrag_GotoKalomNOW_DoIt);
//	Info_AddChoice(Org_826_Mordrag_GotoKalomNOW,"Werd' sehen was ich rausfinden kann.",Org_826_Mordrag_GotoKalomNOW_DoIt);
	Info_AddChoice(Org_826_Mordrag_GotoKalomNOW,"Uvidím, co budu moci udělat.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Could you give me more concrete instructions?
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Hast du genauere Anweisungen?
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Můžeš mi dát nějaké podrobnější pokyny?
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Talk to Lester. I once spent a long time in the Sect Camp, and he helped me back then. He's with the good guys.
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Rede mit Lester. Ich war mal 'ne Zeit lang im Sektenlager. Er hat mir damals geholfen. Er ist einer von den Guten.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Řekni Lesterovi. Kdysi jsem strávil dlouhou dobu v Sektovním táboře a on mi tam pomáhal. Patří k těm dobrým chlapům.
//	B_LogEntry(CH1_GotoPsiCamp,"I'm supposed to talk to a novice called Lester in the camp of the Brotherhood. He seems to be trustworthy and he's helped Mordrag before.");
//	B_LogEntry(CH1_GotoPsiCamp,"Im Lager der Bruderschaft soll ich einen Novizen namens Lester ansprechen. Er scheint vertrauenswürdig zu sein und hat Mordrag in der Vergangenheit auch schon mal geholfen.");
	B_LogEntry(CH1_GotoPsiCamp,"V táboře Bratrstva si mám promluvit s novicem Lesterem. Zdá se, že je důvěryhodný, protože kdysi pomohl Mordragovi.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //I'll see what I can do.
//	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Werd' sehen, was ich rausfinden kann.
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Uvidím, co budu moci udělat.
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //As soon as you know about their plans, come back and report.
//	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Sobald du genau weißt, was sie im Schilde führen, melde dich.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Jakmile se dozvíš o jejich plánech, vrať se a podej mi hlášení.
	Info_ClearChoices(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance Org_826_Mordrag_RUNNING(C_INFO)
{
	npc = Org_826_Mordrag;
	nr = 2;
	condition = Org_826_Mordrag_RUNNING_Condition;
	information = Org_826_Mordrag_RUNNING_Info;
	permanent = 1;
//	description = "About that sect business...";
//	description = "Wegen der Sektensache...";
	description = "O té sektářské záležitosti...";
};

func int Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

func void Org_826_Mordrag_RUNNING_Info()
{
//	AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_00"); //About that sect business...
//	AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_00"); //Wegen der Sektensache ...
	AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_00"); //O té sektářské záležitosti...
//	AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_01"); //What?
//	AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_01"); //Was gibt's?
	AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_01"); //Cože?

	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
//			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04"); //The great invocation has taken place.
//			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04"); //Die große Beschwörung hat stattgefunden.
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04"); //Nadešlo velké vzývání.
//			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_09"); //No! You mean you took part in their folly?
//			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_09"); //Nein! Du machst bei dem Schwachsinn mit?
			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_09"); //Ne! Zúčastnil ses toho jejich bláznovství?
		}
		else
		{
//			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_06"); //They intend to strengthen themselves and to contact the Sleeper by means of a potion they produce from minecrawlers' eggs.
//			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_06"); //Sie wollen mit der Hilfe eines mächtigen Elixiers, das sie aus Minecrawlereiern gewinnen, ihre geistigen Kräfte stärken und Kontakt zum Schläfer herstellen.
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_06"); //Mají v úmyslu kontaktovat Spáče prostřednictvím lektvaru, který vyrobili z vajíček důlních červů.
//			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_07"); //What a scream! Those madcaps really believe all that, don't they?
//			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_07"); //Ich lach' mich tot! Diese Spinner glauben wirklich daran, was?
			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_07"); //Jak pošetilé! Ty šílené hlavy tomu všemu opravdu věří, že jo?
		};
//		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_10"); //I'm curious about the result.
//		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_10"); //Ich bin neugierig, was dabei rauskommt.
		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_10"); //Jsem zvědavý, co z toho vzejde.
//		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_11"); //Me too. Let me know when the Gurus have finished making complete fools of themselves.
//		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_11"); //Ich auch. Sag mir Bescheid, wenn sich die Gurus bis auf die Knochen blamiert haben.
		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_11"); //Já taky. Dej mi vědět, až z toho Guru konečně úplně zešílí.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP(XP_ReportToMordrag);
		Log_SetTopicStatus(CH1_GotoPsiCamp,LOG_SUCCESS);
//		B_LogEntry(CH1_GotoPsiCamp,"Mordrag killed himself laughing when I told him about the minecrawlers' eggs. He doesn't seem to be very interested in spying on the Gurus any more, though. I'll just consider the matter settled!");
//		B_LogEntry(CH1_GotoPsiCamp,"Mordrag hat sich halbtotgelacht, als ich ihm von den Minecrawlereiern erzählte. Er scheint allerdings kein großes Interesse mehr an der Spitzelei bei den Gurus zu haben. Ich betrachte den Auftrag einfach als erledigt!");
		B_LogEntry(CH1_GotoPsiCamp,"Mordrag se mohl potrhat smíchy, když jsem mu řekl o vajíčkách důlního červa. Vypadá to, že už ho vyzvídání u guru příliš nezajímá. Shledávám že záležitost je vyřešena!");
	}
	else
	{
//		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_02"); //I haven't found anything out yet.
//		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_02"); //Ich hab' noch nichts rausgefunden.
		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_02"); //Nic jsme neobjevil.
//		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_03"); //Then get on with it...
//		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_03"); //Bleib dran ...
		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_03"); //Tak v tom pokračuj...
	};

/*
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.

		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der Tür, um sich ihr Erz abzuholen...
*/
};

