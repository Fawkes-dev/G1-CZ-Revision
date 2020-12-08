// ************************ EXIT **************************
instance KDW_604_Cronos_Exit(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 999; 
	condition = KDW_604_Cronos_Exit_Condition;
	information = KDW_604_Cronos_Exit_Info;
	permanent = 1;
	important = 0;
	description = DIALOG_ENDE;
};                       

func int KDW_604_Cronos_Exit_Condition()
{
	return 1;
};

func void KDW_604_Cronos_Exit_Info()
{
	AI_StopProcessInfos(self);
	if (!Npc_HasItems(self,ItArRuneIceCube))
	{
	CreateInvItem(self,ItArRuneIceCube);
	};
	if (!Npc_HasItems(self,ItArRuneThunderbolt))
	{
	CreateInvItem(self,ItArRuneThunderbolt);
	};
};

/*
// *****************************************
// Greet
// *****************************************

instance KDW_604_Cronos_Greet(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 1; 
	condition = KDW_604_Cronos_Greet_Condition;
	information = KDW_604_Cronos_Greet_Info;
	permanent = 0;
//	description = "Ich grüße dich, Magier.";
//	description = "Ich grüße dich, Magier.";
	description = "Buď zdráv, mágu.";
};                       

func int KDW_604_Cronos_Greet_Condition()
{
	return 1;
};

func void KDW_604_Cronos_Greet_Info()
{
	AI_Output(other,self,"DIA_Cronos_Greet_15_00"); //Ich grüße dich, Magier.
	AI_Output(self,other,"DIA_Cronos_Greet_08_01"); //Warum störst du den Hüter des Erzes?
};
*/

// *****************************************
// Brief
// *****************************************

instance KDW_604_Cronos_Brief(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 1; 
	condition = KDW_604_Cronos_Brief_Condition;
	information = KDW_604_Cronos_Brief_Info;
	permanent = 0;
//	description = "I have a letter for the High Magician of the Circle of Fire.";
//	description = "Ich habe einen Brief für den obersten Feuermagier.";
	description = "Mám dopis pro Velkého mága Kruhu ohně.";
};                       

func int KDW_604_Cronos_Brief_Condition()
{
	if Npc_KnowsInfo(hero,KDW_604_Cronos_Greet)
	&& (Npc_GetTrueGuild(hero) != GIL_STT)
	&& (Npc_GetTrueGuild(hero) != GIL_KDF)
	&& (hero.level < 10)
	{
		return 1;
	};
};

func void KDW_604_Cronos_Brief_Info()
{
//	AI_Output(other,self,"DIA_Cronos_Brief_15_00"); //I have a letter for the High Magician of the Circle of Fire.
//	AI_Output(other,self,"DIA_Cronos_Brief_15_00"); //Ich habe einen Brief für den obersten Feuermagier.
	AI_Output(other,self,"DIA_Cronos_Brief_15_00"); //Mám dopis pro Velkého mága Kruhu ohně.
//	AI_Output(self,other,"DIA_Cronos_Brief_08_01"); //We are the Magicians of the Circle of Water. The Magicians of the Circle of Fire live in the Old Camp.
//	AI_Output(self,other,"DIA_Cronos_Brief_08_01"); //Wir sind die Magier vom Kreis des Wassers. Die Magier vom Kreis des Feuers findest du im alten Lager.
	AI_Output(self,other,"DIA_Cronos_Brief_08_01"); //Jsme mágové Kruhu vody. Mágové Kruhu ohně žijí ve Starém táboře.
//	AI_Output(other,self,"DIA_Cronos_Brief_15_02"); //But I can't get into the castle. Could you help me?
//	AI_Output(other,self,"DIA_Cronos_Brief_15_02"); //Aber ich komme nicht in die Burg. Kannst du mir helfen?
	AI_Output(other,self,"DIA_Cronos_Brief_15_02"); //Já se ale nedostanu na hrad. Můžeš mi pomoci?
//	AI_Output(self,other,"DIA_Cronos_Brief_08_03"); //Well, occasionally we send messengers to our brothers in the Old Camp...
//	AI_Output(self,other,"DIA_Cronos_Brief_08_03"); //Nun, gelegentlich senden wir Boten zu unseren Brüdern ins Alte Lager...
	AI_Output(self,other,"DIA_Cronos_Brief_08_03"); //Dobrá, občas vysíláme k bratrům do Starého tábora kurýry...
//	AI_Output(self,other,"DIA_Cronos_Brief_08_04"); //But we only entrust these messages to Lares' men. He's been seeing to it for many years now that our messengers arrive safely.
//	AI_Output(self,other,"DIA_Cronos_Brief_08_04"); //Aber wir vertrauen diese Nachrichten nur Lares' Leuten an. Seit vielen Jahren sorgt er schon dafür, dass unsere Nachrichten sicher ankommen.
	AI_Output(self,other,"DIA_Cronos_Brief_08_04"); //Ti ovšem mohou ty dopisy pouze předat Laresovým mužům. Během mnoha let, co to takhle děláme, se naši kurýři bezpečně vracejí zpátky.
};

// *****************************************
// Barrier
// *****************************************

instance KDW_604_Cronos_Barrier(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 2; 
	condition = KDW_604_Cronos_Barrier_Condition;
	information = KDW_604_Cronos_Barrier_Info;
	permanent = 0;
//	description = "You want to destroy the Barrier - how exactly do you plan to do that?";
//	description = "Ihr wollt die Barriere zerstören - wie genau soll das gehen?";
	description = "Chcete rozbít Bariéru - jak se to přesně chystáte udělat?";
};                       

func int KDW_604_Cronos_Barrier_Condition()
{
	if (Npc_KnowsInfo(hero,KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

func void KDW_604_Cronos_Barrier_Info()
{
//	AI_Output(other,self,"DIA_Cronos_Barrier_15_00"); //You want to destroy the Barrier - how exactly do you plan to do that?
//	AI_Output(other,self,"DIA_Cronos_Barrier_15_00"); //Ihr wollt die Barriere zerstören - wie genau soll das gehen?
	AI_Output(other,self,"DIA_Cronos_Barrier_15_00"); //Chcete rozbít Bariéru - jak se to přesně chystáte udělat?
//	AI_Output(self,other,"DIA_Cronos_Barrier_08_01"); //We need major amounts of magic ore.
//	AI_Output(self,other,"DIA_Cronos_Barrier_08_01"); //Wir brauchen eine große Menge magisches Erz. 
	AI_Output(self,other,"DIA_Cronos_Barrier_08_01"); //Potřebujeme velké množství magické rudy.
//	AI_Output(self,other,"DIA_Cronos_Barrier_08_02"); //We'll release the entire magic power in a great magic rite to blow up the Barrier.
//	AI_Output(self,other,"DIA_Cronos_Barrier_08_02"); //In einem großen magischen Ritual werden wir die gesamte magische Energie freilassen und somit die Barriere sprengen.
	AI_Output(self,other,"DIA_Cronos_Barrier_08_02"); //Při velkém magickém obřadu uvolníme všechnu magickou sílu, která rozbije Bariéru.
//	AI_Output(self,other,"DIA_Cronos_Barrier_08_03"); //Of course such a big amount of ore attracts a lot of rogues and crooks!
//	AI_Output(self,other,"DIA_Cronos_Barrier_08_03"); //Natürlich zieht eine solch große Menge Erz allerlei Lumpen und Banditen an!
	AI_Output(self,other,"DIA_Cronos_Barrier_08_03"); //Takové velké množství magické rudy ovšem samozřejmě přiláká spoustu zlodějů a darebáků!
//	AI_Output(self,other,"DIA_Cronos_Barrier_08_04"); //That's why we need a man to defend our plan.
//	AI_Output(self,other,"DIA_Cronos_Barrier_08_04"); //Also brauchen wir jeden Mann, der bereit ist unseren Plan zu verteidigen.
	AI_Output(self,other,"DIA_Cronos_Barrier_08_04"); //Proto potřebujeme někoho, kdo náš plán ochrání.
};

// *****************************************
// WannaJoin
// *****************************************

instance KDW_604_Cronos_WannaJoin(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 3; 
	condition = KDW_604_Cronos_WannaJoin_Condition;
	information = KDW_604_Cronos_WannaJoin_Info;
	permanent = 0;
//	description = "I'd like to join you!";
//	description = "Ich will bei euch mitmachen!";
	description = "Chtěl bych se k vám přidat!";
};                       

func int KDW_604_Cronos_WannaJoin_Condition()
{
	if (Npc_KnowsInfo(hero,KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

func void KDW_604_Cronos_WannaJoin_Info()
{
//	AI_Output(other,self,"DIA_Cronos_WannaJoin_15_00"); //I'd like to join you!
//	AI_Output(other,self,"DIA_Cronos_WannaJoin_15_00"); //Ich will bei euch mitmachen!
	AI_Output(other,self,"DIA_Cronos_WannaJoin_15_00"); //Chtěl bych se k vám přidat!
//	AI_Output(self,other,"DIA_Cronos_WannaJoin_08_01"); //If you want to join us, you should see Lee or Lares.
//	AI_Output(self,other,"DIA_Cronos_WannaJoin_08_01"); //Wenn du dich uns anschließen willst, solltest du zu Lee oder Lares gehen. 
	AI_Output(self,other,"DIA_Cronos_WannaJoin_08_01"); //Jestli se k nám chceš přidat, měl bys zajít za Leem nebo Laresem.
};

// *****************************************
// WannaMage
// *****************************************

instance KDW_604_Cronos_WannaMage(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 3; 
	condition = KDW_604_Cronos_WannaMage_Condition;
	information = KDW_604_Cronos_WannaMage_Info;
	permanent = 0;
//	description = "I'd like to become a magician!";
//	description = "Ich will Magier werden!";
	description = "Chtěl bych se stát mágem!";
};                       

func int KDW_604_Cronos_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,KDW_604_Cronos_WannaJoin))
	{
		return 1;
	};
};

func void KDW_604_Cronos_WannaMage_Info()
{
//	AI_Output(other,self,"DIA_Cronos_WannaMage_15_00"); //I'd like to become a magician!
//	AI_Output(other,self,"DIA_Cronos_WannaMage_15_00"); //Ich will Magier werden!
	AI_Output(other,self,"DIA_Cronos_WannaMage_15_00"); //Chtěl bych se stát mágem!
//	AI_Output(self,other,"DIA_Cronos_WannaMage_08_01"); //We cannot afford to spread our knowledge among our enemies.
//	AI_Output(self,other,"DIA_Cronos_WannaMage_08_01"); //Wir können es uns nicht leisten unser Wissen unter unseren Feinden zu verbreiten.
	AI_Output(self,other,"DIA_Cronos_WannaMage_08_01"); //Nemůžeme dopustit, aby se naše vědomosti dostaly k našim nepřátelům.
//	AI_Output(self,other,"DIA_Cronos_WannaMage_08_02"); //We will not even consider instructing you unless you prove your loyalty to us.
//	AI_Output(self,other,"DIA_Cronos_WannaMage_08_02"); //Erst wenn du deine Loyalität zu uns unter Beweis gestellt hast, werden wir überhaupt in Erwägung ziehen, dich zu unterweisen.
	AI_Output(self,other,"DIA_Cronos_WannaMage_08_02"); //Nemůžeme tě ani cvičit, dokud nám neprokážeš svoji oddanost.
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 2        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////

// *****************************************
// Bandit --> Messenger
// *****************************************

instance KDW_604_Cronos_Bandit(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 4; 
	condition = KDW_604_Cronos_Bandit_Condition;
	information = KDW_604_Cronos_Bandit_Info;
	permanent = 0;
//	description = "I am now one of Lares' men. Have you got a message for the Fire-mages?";
//	description = "Ich gehöre jetzt zu Lares. Hast du eine Nachricht für die Feuermagier?";
	description = "Jsem teď jedním z Laresových mužů. Nemáš nějakou zprávu pro mágy Ohně?";
};                       

func int KDW_604_Cronos_Bandit_Condition()
{
	if ((Npc_GetTrueGuild(hero)==GIL_ORG) || (Npc_GetTrueGuild(hero)==GIL_SLD))
	{
		return 1;
	};
};

func void KDW_604_Cronos_Bandit_Info()
{
//	AI_Output(other,self,"DIA_Cronos_Bandit_15_00"); //I am now one of Lares' men. Have you got a message for me to take over to the Magicians of Fire?
//	AI_Output(other,self,"DIA_Cronos_Bandit_15_00"); //Ich bin jetzt einer von Lares Leuten. Hast du eine Nachricht für die Feuermagier, die ich überbringen könnte?
	AI_Output(other,self,"DIA_Cronos_Bandit_15_00"); //Jsem teď jedním z Laresových mužů. Nemáš nějakou zprávu pro mágy Ohně?
//	AI_Output(self,other,"DIA_Cronos_Bandit_08_01"); //I do indeed. But you'll need to carry the sign of one of our messengers, else Gomez' men won't let you enter the castle.
//	AI_Output(self,other,"DIA_Cronos_Bandit_08_01"); //In der Tat. Aber du brauchst das Zeichen eines unserer Boten, sonst lassen dich Gomez Schergen nicht in die Burg.
	AI_Output(self,other,"DIA_Cronos_Bandit_08_01"); //Opravdu. Budeš ale potřebovat znamení našich kurýrů, jinak tě Gomezovi muži nepustí na hrad.
//	AI_Output(self,other,"DIA_Cronos_Bandit_08_02"); //Here, take the letter and the sign. And now hurry up!
//	AI_Output(self,other,"DIA_Cronos_Bandit_08_02"); //Hier, nimm Brief und Zeichen. Und nun beeile dich!
	AI_Output(self,other,"DIA_Cronos_Bandit_08_02"); //Tady je dopis a znamení. A teď už pospíchej!

	CreateInvItem(other,KdW_Amulett);
	CreateInvItem(other,Cronos_Brief);

	Cronos_Messenger = LOG_RUNNING;
};

// *****************************************
// BriefBack
// *****************************************

instance KDW_604_Cronos_BriefBack(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 3; 
	condition = KDW_604_Cronos_BriefBack_Condition;
	information = KDW_604_Cronos_BriefBack_Info;
	permanent = 0;
//	description = "I've passed the message on!";
//	description = "Ich habe deine Nachricht überbracht!";
	description = "Předal jsem tu zprávu!";
};                       

func int KDW_604_Cronos_BriefBack_Condition()
{
	if (Cronos_Messenger == LOG_SUCCESS)
	{
		return 1;
	};
};

func void KDW_604_Cronos_BriefBack_Info()
{
//	AI_Output(other,self,"DIA_Cronos_BriefBack_15_00"); //I've passed the message on!
//	AI_Output(other,self,"DIA_Cronos_BriefBack_15_00"); //Ich habe deine Nachricht überbracht!
	AI_Output(other,self,"DIA_Cronos_BriefBack_15_00"); //Předal jsem tu zprávu!
//	AI_Output(self,other,"DIA_Cronos_BriefBack_08_01"); //Ah, good! Here's a small reward for your efforts...
//	AI_Output(self,other,"DIA_Cronos_BriefBack_08_01"); //Ah gut! Hier ist eine kleine Entschädigung für deine Mühen...
	AI_Output(self,other,"DIA_Cronos_BriefBack_08_01"); //Á, výborně! Tady je malá odměna za tvoji snahu!

	CreateInvItems(self,itminugget, 200);
	B_GiveInvItems(self,other,itminugget, 200);

	B_GiveXP(XP_CronosLetter);
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 3        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////

//***************************************************************************
// Info NEWS
//***************************************************************************
instance Info_Cronos_NEWS(C_INFO)
{
	npc = KDW_604_Cronos;
	condition = Info_Cronos_NEWS_Condition;
	information = Info_Cronos_NEWS_Info;
	permanent = 0;
	important = 0;
//	description = "I have an important message for Saturas!";
//	description = "Ich habe wichtige Nachrichten für Saturas!";
	description = "Mám důležitou zprávu pro Saturase!";
};

func int Info_Cronos_NEWS_Condition()
{ 
	if (CorAngar_SendToNC==TRUE)
	&& !Npc_KnowsInfo(hero,Info_Cronos_SLEEPER)
	{
		return TRUE;
	}; 
};

func void Info_Cronos_NEWS_Info()
{
//	AI_Output(other,self,"Info_Cronos_NEWS_15_01"); //I have an important message for Saturas!
//	AI_Output(other,self,"Info_Cronos_NEWS_15_01"); //Ich habe wichtige Nachrichten für Saturas!
	AI_Output(other,self,"Info_Cronos_NEWS_15_01"); //Mám důležitou zprávu pro Saturase!
//	AI_Output(self,other,"Info_Cronos_NEWS_08_02"); //What could be so important that our spiritual leader should interrupt his important studies for it?
//	AI_Output(self,other,"Info_Cronos_NEWS_08_02"); //Was könnte schon so wichtig sein, dass unser spiritueller Anführer seine wertvollen Studien dafür unterbrechen sollte?
	AI_Output(self,other,"Info_Cronos_NEWS_08_02"); //Co může být tak důležité, aby náš duchovní vůdce kvůli tomu přerušil své důležité studium?
};

//***************************************************************************
// Info KALOM
//***************************************************************************
instance Info_Cronos_KALOM(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 10;
	condition = Info_Cronos_KALOM_Condition;
	information = Info_Cronos_KALOM_Info;
	permanent = 0;
	important = 0;
//	description = "Cor Kalom has left the Brotherhood!";
//	description = "Cor Kalom hat die Bruderschaft verlassen!";
	description = "Cor Kalom opustil Bratrstvo!";
};

func int Info_Cronos_KALOM_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_Cronos_NEWS) && !Npc_KnowsInfo(hero,Info_Cronos_SLEEPER))
	{
		return TRUE;
	}; 
};

func void Info_Cronos_KALOM_Info()
{
//	AI_Output(other,self,"Info_Cronos_KALOM_15_01"); //Cor Kalom has left the Brotherhood with some fanatical templars!
//	AI_Output(other,self,"Info_Cronos_KALOM_15_01"); //Cor Kalom hat mit ein paar fanatischen Templern die Bruderschaft verlassen!
	AI_Output(other,self,"Info_Cronos_KALOM_15_01"); //Cor Kalom opustil spolu s několika fanatickými templáři Bratrstvo!
//	AI_Output(other,self,"Info_Cronos_KALOM_15_02"); //He wants to find the Sleeper on his own and wake him up at all costs.
//	AI_Output(other,self,"Info_Cronos_KALOM_15_02"); //Er will unbedingt den Schläfer auf eigene Faust finden und ihn erwecken.
	AI_Output(other,self,"Info_Cronos_KALOM_15_02"); //Chce na vlastní pěst najít Spáče a za každou cenu ho probudit.
//	AI_Output(self,other,"Info_Cronos_KALOM_08_03"); //I've never trusted him. Second Guru or not, he's vain, insidious and he's capable of anything.
//	AI_Output(self,other,"Info_Cronos_KALOM_08_03"); //Ich habe ihm noch nie getraut. Zweiter Guru hin oder her, er ist verblendet, hinterhältig und zu allem fähig.
	AI_Output(self,other,"Info_Cronos_KALOM_08_03"); //Nikdy jsem mu nevěřil. Ať už je Druhý Guru guru nebo ne, je domýšlivý, zákeřný a všehoschopný.
//	AI_Output(self,other,"Info_Cronos_KALOM_08_04"); //The Brotherhood is better off without him!
//	AI_Output(self,other,"Info_Cronos_KALOM_08_04"); //Sicher ist die Bruderschaft ohne ihn besser dran!
	AI_Output(self,other,"Info_Cronos_KALOM_08_04"); //Bratrstvu bez něj bude líp!
//	AI_Output(self,other,"Info_Cronos_KALOM_08_05"); //I'll tell Saturas about it as soon as I get the chance. Leave now!
//	AI_Output(self,other,"Info_Cronos_KALOM_08_05"); //Ich werde Saturas bei Gelegenheit davon berichten. Geh nun!
	AI_Output(self,other,"Info_Cronos_KALOM_08_05"); //Řeknu o tom Saturasovi, jakmile k tomu dostanu příležitost. Teď jdi!

	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info YBERION
//***************************************************************************
instance Info_Cronos_YBERION(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 20;
	condition = Info_Cronos_YBERION_Condition;
	information = Info_Cronos_YBERION_Info;
	permanent = 0;
	important = 0;
//	description = "Y'Berion, the leader of the Sect Camp, is dead!";
//	description = "Y'Berion, der Anführer des Sektenlagers, ist tot!";
	description = "Y´Berion, vůdce Sektovního tábora, je mrtev!";
};

func int Info_Cronos_YBERION_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_Cronos_NEWS) && !Npc_KnowsInfo(hero,Info_Cronos_SLEEPER))
	{
		return TRUE;
	}; 
};

func void Info_Cronos_YBERION_Info()
{
//	AI_Output(other,self,"Info_Cronos_YBERION_15_01"); //Y'Berion, the leader of the Sect Camp, is dead!
//	AI_Output(other,self,"Info_Cronos_YBERION_15_01"); //Y'Berion, der Anführer des Sektenlagers, ist tot!
	AI_Output(other,self,"Info_Cronos_YBERION_15_01"); //Y´Berion, vůdce Sektovního tábora, je mrtev!
//	AI_Output(self,other,"Info_Cronos_YBERION_08_02"); //WHAAAAT??? How could that happen?
//	AI_Output(self,other,"Info_Cronos_YBERION_08_02"); //WAAAS??? Wie konnte das geschehen?
	AI_Output(self,other,"Info_Cronos_YBERION_08_02"); //COŽEEE??? Jak se to stalo?
//	AI_Output(other,self,"Info_Cronos_YBERION_15_03"); //The Brotherhood performed a ritual, invoking their god.
//	AI_Output(other,self,"Info_Cronos_YBERION_15_03"); //Die Bruderschaft führte ein Ritual durch, eine Anrufung ihres Gottes.
	AI_Output(other,self,"Info_Cronos_YBERION_15_03"); //Bratrstvo provádělo obřad, při kterém vzývalo svého boha.
//	AI_Output(other,self,"Info_Cronos_YBERION_15_04"); //It seems the mental strain was too much for Y'Berion.
//	AI_Output(other,self,"Info_Cronos_YBERION_15_04"); //Die mentalen Anstrengungen waren wohl zu viel für Y'Berion.
	AI_Output(other,self,"Info_Cronos_YBERION_15_04"); //Myšlenkové napětí však bylo pro Y´Beriona příliš velké.
//	AI_Output(self,other,"Info_Cronos_YBERION_08_05"); //That's very sad. Y'Berion was a reliable ally.
//	AI_Output(self,other,"Info_Cronos_YBERION_08_05"); //Das ist sehr traurig. Y'Berion war ein zuverlässiger Verbündeter.
	AI_Output(self,other,"Info_Cronos_YBERION_08_05"); //To je velmi smutné. Y´Berion byl spolehlivý spojenec.
//	AI_Output(self,other,"Info_Cronos_YBERION_08_06"); //But it's no reason to justify interrupting Saturas' studies.
//	AI_Output(self,other,"Info_Cronos_YBERION_08_06"); //Aber es rechtfertigt nicht die Störung der Studien von Saturas.
	AI_Output(self,other,"Info_Cronos_YBERION_08_06"); //Není to ale důvod, který by ospravedlnil přerušení Saturasova studia.

	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info SLEEPER
//***************************************************************************
instance Info_Cronos_SLEEPER(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 30;
	condition = Info_Cronos_SLEEPER_Condition;
	information = Info_Cronos_SLEEPER_Info;
	permanent = 0;
	important = 0;
//	description = "The Gurus have recognized that they're praying to an evil arch demon!";
//	description = "Die Gurus haben erkannt, dass sie einen üblen Erzdämonen anbeten!";
	description = "Guru zjistili, že se modlí ke zlému arcidémonovi!";
};

func int Info_Cronos_SLEEPER_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_Cronos_NEWS))
	{
		return TRUE;
	}; 
};

func void Info_Cronos_SLEEPER_Info()
{
//	AI_Output(other,self,"Info_Cronos_SLEEPER_15_01"); //The Gurus have recognized that they're praying to an evil arch demon!
//	AI_Output(other,self,"Info_Cronos_SLEEPER_15_01"); //Die Gurus haben erkannt, dass sie einen üblen Erzdämonen anbeten!
	AI_Output(other,self,"Info_Cronos_SLEEPER_15_01"); //Guru zjistili, že se modlí ke zlému arcidémonovi!
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_02"); //All of a sudden they now think their Sleeper is a demon?
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_02"); //Sie halten ihren Schläfer jetzt plötzlich für einen Dämonen?
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_02"); //Všichni začali najednou věřit, že je jejich Spáč démon?
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_03"); //Sounds like another mad idea of the Brotherhood, but...
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_03"); //Hört sich nach einer weiteren Verworrenheit der Bruderschaft an, aber ...
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_03"); //Vypadá to na další šílený výmysl Bratrstva, ale...
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_04"); //... should they be right... all of us in the colony here might be in grave danger.
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_04"); //... Sollten sie Recht haben ... könnten wir alle hier in der Kolonie in großer Gefahr sein.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_04"); //...možná mají pravdu... všichni tady v kolonii bysme se mohli ocitnout ve velkém nebezpečí.
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_05"); //You must report to Saturas at once. He must decide what is to be done.
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_05"); //Das musst du sofort Saturas berichten. Er muss entscheiden, was zu tun ist.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_05"); //Musíš to ihned sdělit Saturasovi. Musí rozhodnout, co bude třeba udělat.
//	AI_Output(other,self,"Info_Cronos_SLEEPER_15_06"); //Where can I find Saturas?
//	AI_Output(other,self,"Info_Cronos_SLEEPER_15_06"); //Wo finde ich Saturas?
	AI_Output(other,self,"Info_Cronos_SLEEPER_15_06"); //Kde najdu Saturase?
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_07"); //Go to the upper level. Tell the guards there that you have my permission to pass.
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_07"); //Begib dich zur obersten Ebene. Sage den Wachen dort, du hast meine Erlaubnis zum passieren.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_07"); //Jdi do horní roviny. Řekni strážím, že máš mé povolení ke vstupu.
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_08"); //The password is TETRIANDOCH.
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_08"); //Die Parole lautet TETRIANDOCH.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_08"); //Heslo je TETRIANDOCH.
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_09"); //Saturas is by the pentagram.
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_09"); //Saturas findest du beim großen Pentagramm.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_09"); //Saturase najdeš u velkého pentagramu.
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_10"); //He spends almost all day there, studying how to blow up the big ore mound.
//	AI_Output(self,other,"Info_Cronos_SLEEPER_08_10"); //Er gibt sich dort fast den ganzen Tag seinen Studien über die Sprengung des großen Erzhaufens hin.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_10"); //Tráví tam většinu času a zkoumá, jak odpálit velkou rudnou haldu.

//	B_LogEntry(CH3_EscapePlanNC,"Cronos gave me permission to visit Saturas on the upper level. Usually you can find the High Magician of the Circle of Water at the pentagram. The password for the guards is ... Damn, what was it again?");
//	B_LogEntry(CH3_EscapePlanNC,"Cronos gab mir die Erlaubnis Saturas auf der obersten Ebene aufzusuchen. Man kann den obersten Wassermagier normalerweise beim Pentragramm finden. Die Parole für die Wachen lautete... verdammt wie war die doch gleich?");
	B_LogEntry(CH3_EscapePlanNC,"Cronos mi dal svolení navštívit Saturase v horní rovině. Velkého mága Kruhu vody lze obvykle najít u pentagramu. Heslo pro stráž zní... Sakra, jak to jen bylo?");

	B_GiveXP(XP_GetCronosPermission);

	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info PAROLE
//***************************************************************************
instance Info_Cronos_PAROLE(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 30;
	condition = Info_Cronos_PAROLE_Condition;
	information = Info_Cronos_PAROLE_Info;
	permanent = 0;
	important = 0;
//	description = "What was the password again?";
//	description = "Wie war die Parole nochmal?";
	description = "Jakže bylo to heslo?";
};

func int Info_Cronos_PAROLE_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_Cronos_SLEEPER) && !Npc_KnowsInfo(hero,Info_Saturas_NEWS))
	{
		return TRUE;
	}; 
};

func void Info_Cronos_PAROLE_Info()
{
//	AI_Output(other,self,"Info_Cronos_PAROLE_15_01"); //What was the password again?
//	AI_Output(other,self,"Info_Cronos_PAROLE_15_01"); //Wie war die Parole noch mal?
	AI_Output(other,self,"Info_Cronos_PAROLE_15_01"); //Jakže bylo to heslo?
//	AI_Output(self,other,"Info_Cronos_PAROLE_08_02"); //"You're more of a scatterbrain than my old granny. It is ""TETRIANDOCH"""
//	AI_Output(self,other,"Info_Cronos_PAROLE_08_02"); //Du bist vergesslicher als meine Großmutter. Sie lautet "TETRIANDOCH"
	AI_Output(self,other,"Info_Cronos_PAROLE_08_02"); //Jsi ještě roztržitější než moje bába. Zní 'TETRIANDOCH'.
};

//***************************************************************************
// Info REWARD
//***************************************************************************
instance Info_Cronos_REWARD(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 30;
	condition = Info_Cronos_REWARD_Condition;
	information = Info_Cronos_REWARD_Info;
	permanent = 0;
	important = 0;
//	description = "Saturas said you had a reward for me.";
//	description = "Saturas sagte, du hättest eine Belohnung für mich.";
	description = "Saturas řekl, že mě máš odměnit.";
};

func int Info_Cronos_REWARD_Condition()
{ 
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	}; 
};

func void Info_Cronos_REWARD_Info()
{
//	AI_Output(other,self,"Info_Cronos_REWARD_15_01"); //Saturas said you had a reward for me.
//	AI_Output(other,self,"Info_Cronos_REWARD_15_01"); //Saturas sagte, du hättest eine Belohnung für mich.
	AI_Output(other,self,"Info_Cronos_REWARD_15_01"); //Saturas řekl, že mě máš odměnit.
//	AI_Output(self,other,"Info_Cronos_REWARD_08_02"); //As the keeper of the ore, I'd like to give you a small portion of our ore for your great deeds on behalf of the Camp.
//	AI_Output(self,other,"Info_Cronos_REWARD_08_02"); //Als Hüter des Erzes möchte ich für deine großen Dienste für unser Lager einen kleinen Teil des Erzes in deine Hände geben.
	AI_Output(self,other,"Info_Cronos_REWARD_08_02"); //Jako strážce magické rudy bych ti za tvoje velké činy pro náš tábor chtěl  dát trošku naší rudy.
//	AI_Output(self,other,"Info_Cronos_REWARD_08_03"); //I hope you'll make as good use of it as we do!
//	AI_Output(self,other,"Info_Cronos_REWARD_08_03"); //Ich hoffe, du hast eine ebenso sinnvolle Verwendung wie wir dafür!
	AI_Output(self,other,"Info_Cronos_REWARD_08_03"); //Doufám, že ho použiješ, jak nejlépe budeš umět!

//	B_LogEntry(CH3_BringFoci,"Cronos gave me a huge amount of ore, which will hardly diminish this giant ore mound.");
//	B_LogEntry(CH3_BringFoci,"Cronos übergab mir eine stattliche Menge Erz, die diesen riesiegen Erzhaufen wohl kaum merklich verkleinern werden.");
	B_LogEntry(CH3_BringFoci,"Cronos mi dal velké množství rudy, které dost zmenší tu obrovitou rudnou haldu.");
	if Npc_KnowsInfo(hero,Info_Riordian_REWARD)
	{
		Log_SetTopicStatus(CH3_BringFoci,LOG_SUCCESS);
	};

	CreateInvItems(self,ItMiNugget, 1000);
	B_GiveInvItems(self,hero,ItMiNugget, 1000);
};
/*------------------------------------------------------------------------
// NACH DER WEIHE //
------------------------------------------------------------------------*/
instance KDW_604_Cronos_WELCOME(C_INFO)
{
	npc = KDW_604_Cronos;
	condition = KDW_604_Cronos_WELCOME_Condition;
	information = KDW_604_Cronos_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int KDW_604_Cronos_WELCOME_Condition()
{ 
	if (Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};
func void KDW_604_Cronos_WELCOME_Info()
{
//	AI_Output(self,other,"KDW_604_Cronos_WELCOME_Info_08_01"); //Your decision to join the Magicians of Water was right. Be welcome, brother!
//	AI_Output(self,other,"KDW_604_Cronos_WELCOME_Info_08_01"); //Deine Entscheidung, zu den Wassermagiern zu kommen, war richtig. Willkommen, Bruder!
	AI_Output(self,other,"KDW_604_Cronos_WELCOME_Info_08_01"); //Tvoje rozhodnutí přidat se mágům Vody bylo správné. Buď vítán, bratře!
	AI_StopProcessInfos(self);  
};
//--------------------------------------------------------------------------
// MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance KDW_604_Cronos_MANA(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 800;
	condition = KDW_604_Cronos_MANA_Condition;
	information = KDW_604_Cronos_MANA_Info;
	important = 0;
	permanent = 1;
//	description = "I need more magic power."; 
//	description = "Ich benötige mehr magische Kraft"; 
	description = "Potřebuji více magické moci."; 
};

func int KDW_604_Cronos_MANA_Condition()
{ 
	if (Npc_KnowsInfo(hero,KDW_604_Cronos_GREET))
	&& ((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero,Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
func void KDW_604_Cronos_MANA_Info()
{
//	AI_Output(other,self,"KDW_604_Cronos_MANA_Info_15_01"); //I need more magic power.
//	AI_Output(other,self,"KDW_604_Cronos_MANA_Info_15_01"); //Ich benötige mehr magische Kraft
	AI_Output(other,self,"KDW_604_Cronos_MANA_Info_15_01"); //Potřebuju více magické síly.
//	AI_Output(self,other,"KDW_604_Cronos_MANA_Info_08_02"); //I can help you to increase your power. Use it wisely.
//	AI_Output(self,other,"KDW_604_Cronos_MANA_Info_08_02"); //Ich kann dir helfen, deine Kraft zu steigern. Setze sie mit Bedacht ein!
	AI_Output(self,other,"KDW_604_Cronos_MANA_Info_08_02"); //Můžu ti pomoci zvětšit tvoji sílu. Užívej ji moudře.

	Info_ClearChoices(KDW_604_Cronos_MANA);
//	Info_AddChoice(KDW_604_Cronos_MANA,"DIALOG_BACK									",KDW_604_Cronos_MANA_BACK);
	Info_AddChoice(KDW_604_Cronos_MANA,DIALOG_BACK ,KDW_604_Cronos_MANA_BACK);
//	Info_AddChoice(KDW_604_Cronos_MANA," B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			",KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_5);
//	Info_AddChoice(KDW_604_Cronos_MANA,"B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		",KDW_604_Cronos_MANA_MAN_1);
	Info_AddChoice(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_1);
};  
func void KDW_604_Cronos_MANA_BACK()
{
	Info_ClearChoices(KDW_604_Cronos_MANA);
};

func void KDW_604_Cronos_MANA_MAN_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(KDW_604_Cronos_MANA);
//	Info_AddChoice(KDW_604_Cronos_MANA,"DIALOG_BACK									",KDW_604_Cronos_MANA_BACK);
	Info_AddChoice(KDW_604_Cronos_MANA,DIALOG_BACK ,KDW_604_Cronos_MANA_BACK);
//	Info_AddChoice(KDW_604_Cronos_MANA," B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			",KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_5);
//	Info_AddChoice(KDW_604_Cronos_MANA,"B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		",KDW_604_Cronos_MANA_MAN_1);
	Info_AddChoice(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_1);

};

func void KDW_604_Cronos_MANA_MAN_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(KDW_604_Cronos_MANA);
//	Info_AddChoice(KDW_604_Cronos_MANA,"DIALOG_BACK									",KDW_604_Cronos_MANA_BACK);
	Info_AddChoice(KDW_604_Cronos_MANA,DIALOG_BACK ,KDW_604_Cronos_MANA_BACK);
//	Info_AddChoice(KDW_604_Cronos_MANA," B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			",KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_5);
//	Info_AddChoice(KDW_604_Cronos_MANA,"B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		",KDW_604_Cronos_MANA_MAN_1);
	Info_AddChoice(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_1);

};
//---------------------------------------------------------
// MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance KDW_604_Cronos_SELLSTUFF(C_INFO)
{
	npc = KDW_604_Cronos;
	nr = 900;
	condition = KDW_604_Cronos_SELLSTUFF_Condition;
	information = KDW_604_Cronos_SELLSTUFF_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE; 
	trade = 1;
};

func int KDW_604_Cronos_SELLSTUFF_Condition()
{ 
	if (Npc_KnowsInfo(hero,KDW_604_Cronos_GREET))
	&& ((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero,Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
func void KDW_604_Cronos_SELLSTUFF_Info()
{
//	AI_Output(other,self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //I want to acquire magic writings.
//	AI_Output(other,self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Ich möchte Schriften über Magie erwerben.
	AI_Output(other,self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Rád bych získal magické spisy.

};  
/*------------------------------------------------------------------------
						BEGRÜSSUNG 
------------------------------------------------------------------------*/

instance KDW_604_Cronos_GREET(C_INFO)
{
	npc = KDW_604_Cronos;
	condition = KDW_604_Cronos_GREET_Condition;
	information = KDW_604_Cronos_GREET_Info;
	important = 0;
	permanent = 0;
//	description = "Greetings, Magician."; 
//	description = "Ich grüße dich, Magier."; 
	description = "Buď zdráv, mágu."; 
};

func int KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};

func void KDW_604_Cronos_GREET_Info()
{
//	AI_Output(other,self,"KDW_604_Cronos_GREET_Info_15_01"); //Greetings, Magician.
//	AI_Output(other,self,"KDW_604_Cronos_GREET_Info_15_01"); //Ich grüße dich, Magier.
	AI_Output(other,self,"KDW_604_Cronos_GREET_Info_15_01"); //Buď pozdraven, mágu.
//	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_02"); //May the blessing of Adanos be with you. I can help you to increase your magic powers or give you some useful items.
//	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_02"); //Der Segen Adanos sei mit dir. Ich kann dir helfen, deine geistige Kraft zu stärken oder dir ein paar nützliche Dinge anbieten.
	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_02"); //Kéž je Adanosovo požehnání s tebou. Můžu ti pomoci zvětšit tvé magické síly, nebo ti dát pár užitečných věcí.
//	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_03"); //What can I do for you?
//	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_03"); //Was kann ich für dich tun?
	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_03"); //Co pro tebe můžu udělat?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
//	B_LogEntry(GE_TraderNC,"Cronos sells magic items such as RUNES, SCROLLS and RINGS. I can find him at the grid above the big ore mound day and night."); 
//	B_LogEntry(GE_TraderNC,"Cronos verkauft magische Utensilien wie RUNEN, SPRUCHROLLEN und RINGE. Er ist Tag und Nacht am Gitter über dem großen Erzhaufen zu finden."); 
	B_LogEntry(GE_TraderNC,"Cronos prodává magické předměty jako RUNY, SVITKY a PRSTENY. Můžu ho ve dne v noci najít u mříže nad velkou rudnou haldou."); 
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
//	B_LogEntry(GE_TeacherNC,"Cronos can help me to increase my MANA. I can find him at the grid above the big ore mound day and night.");
//	B_LogEntry(GE_TeacherNC,"Cronos kann mir helfen, meine MANA zu steigern. Er ist Tag und Nacht am Gitter über dem großen Erzhaufen zu finden.");
	B_LogEntry(GE_TeacherNC,"Cronos mi může pomoci zvýšit MAGICKOU ENERGII. Můžu ho ve dne v noci najít u mříže nad velkou rudnou haldou.");
};
