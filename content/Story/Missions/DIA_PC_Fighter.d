//***************************************************************************
// Info EXIT
//***************************************************************************

instance Info_Gorn_EXIT(C_INFO)
{
	npc = PC_Fighter;
	nr   = 999;
	condition = Info_Gorn_EXIT_Condition;
	information = Info_Gorn_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Gorn_EXIT_Condition()
{
	return 1;
};

func void Info_Gorn_EXIT_Info()
{
	if self.aivar[AIV_PARTYMEMBER]
	{
//		AI_Output(self,other,"Info_Gorn_EXIT_09_01"); //Let's fight!
//		AI_Output(self,other,"Info_Gorn_EXIT_09_01"); //Auf in den Kampf!
		AI_Output(self,other,"Info_Gorn_EXIT_09_01"); //Do boje!
	}
	else
	{
//		AI_Output(self,other,"Info_Gorn_EXIT_09_02"); //See you later.
//		AI_Output(self,other,"Info_Gorn_EXIT_09_02"); //Bis später.
		AI_Output(self,other,"Info_Gorn_EXIT_09_02"); //Ještě se uvidíme.
	};

	AI_StopProcessInfos(self);
};

//*************************************
// 1. Begrüßung
//*************************************

instance DIA_Gorn_First(C_INFO)
{
	npc = PC_Fighter;
	nr = 1;
	condition = Dia_Gorn_First_Condition;
	information = Dia_Gorn_First_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Gorn_First_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
//	AI_Output(self,other,"DIA_Gorn_First_09_00"); //Hey. A new face.
//	AI_Output(self,other,"DIA_Gorn_First_09_00"); //Hey. Ein neues Gesicht.
	AI_Output(self,other,"DIA_Gorn_First_09_00"); //Hej. Nová tvář.
//	AI_Output(other,self,"DIA_Gorn_First_15_01"); //Who are you?
//	AI_Output(other,self,"DIA_Gorn_First_15_01"); //Wer bist du?
	AI_Output(other,self,"DIA_Gorn_First_15_01"); //Kdo jsi?
//	AI_Output(self,other,"DIA_Gorn_First_09_02"); //I am Gorn, mercenary of the magicians.
//	AI_Output(self,other,"DIA_Gorn_First_09_02"); //Ich bin Gorn. Söldner der Magier.
	AI_Output(self,other,"DIA_Gorn_First_09_02"); //Jsem Gorn, žoldák mágů.
};

//*************************************
// Leben
//*************************************

instance DIA_Gorn_Leben(C_INFO)
{
	npc = PC_Fighter;
	nr = 2;
	condition = Dia_Gorn_Leben_Condition;
	information = Dia_Gorn_Leben_Info;
	permanent = 0;
//	description = "What do you have to do as a mercenary of the magicians?";
//	description = "Was machst du als Söldner der Magier?";
	description = "Co musíš dělat jako žoldák mágů?";
};

func int DIA_Gorn_Leben_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Leben_Info()
{
//	AI_Output(other,self,"DIA_Gorn_Leben_15_00"); //What do you have to do as a mercenary of the magicians?
//	AI_Output(other,self,"DIA_Gorn_Leben_15_00"); //Was machst du als Söldner der Magier?
	AI_Output(other,self,"DIA_Gorn_Leben_15_00"); //Co musíš dělat jako žoldák mágů?
//	AI_Output(self,other,"DIA_Gorn_Leben_09_01"); //Lee has made a deal with the magicians. He hires the best fighters to be found in the colony. Which means us.
//	AI_Output(self,other,"DIA_Gorn_Leben_09_01"); //Lee hat mit den Magiern eine Abmachung getroffen. Er heuert die besten Kämpfer an, die in der Kolonie zu finden sind. Also uns.
	AI_Output(self,other,"DIA_Gorn_Leben_09_01"); //Lee uzavřel s mágy smlouvu. Najímá nejlepší bojovníky, jaké je možné v kolonii najít. Tedy nás.
//	AI_Output(self,other,"DIA_Gorn_Leben_09_02"); //We take care that the scrapers can mine the ore without being bothered and keep trouble away from the magicians.
//	AI_Output(self,other,"DIA_Gorn_Leben_09_02"); //Wir sorgen dafür, dass die Schürfer ungestört Erz abbauen können und halten den Magiern den Rücken frei.
	AI_Output(self,other,"DIA_Gorn_Leben_09_02"); //Staráme se o to, aby rudaři mohli nerušeně těžit rudu a chráníme mágy před nesnázemi.
//	AI_Output(self,other,"DIA_Gorn_Leben_09_03"); //The magicians make sure we'll get out of here. And we get a small share of the ore as our pay.
//	AI_Output(self,other,"DIA_Gorn_Leben_09_03"); //Die Magier kümmern sich darum, dass wir hier rauskommen. Und einen kleinen Teil des Erzes bekommen wir als Sold.
	AI_Output(self,other,"DIA_Gorn_Leben_09_03"); //Mágové se postarají, abychom odsud mohli odejít. A my dostáváme malý podíl rudy jako žold.
};

//*************************************
// Hütte (Shrike)
//*************************************
	var int Gorn_ShrikesHut;
//*************************************

instance DIA_Gorn_Hut(C_INFO)
{
	npc = PC_Fighter;
	nr = 3;
	condition = Dia_Gorn_Hut_Condition;
	information = Dia_Gorn_Hut_Info;
	permanent = 0;
//	description = "Can I stay somewhere here?";
//	description = "Kann ich hier irgendwo pennen?";
	description = "Můžu tu někde zůstat?";
};

func int DIA_Gorn_Hut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Hut_Info()
{
//	AI_Output(other,self,"DIA_Gorn_Hut_15_00"); //Can I stay somewhere here without having to kick somebody out of his hut?
//	AI_Output(other,self,"DIA_Gorn_Hut_15_00"); //Kann ich hier irgendwo pennen, ohne dass ich vorher jemanden aus seiner Hütte prügeln muss?
	AI_Output(other,self,"DIA_Gorn_Hut_15_00"); //Můžu tu někde zůstat, aniž bych musel někoho vykopnout z jeho chatrče?
//	AI_Output(self,other,"DIA_Gorn_Hut_09_01"); //I don't think so. But if that's really what you want to do, go and see Shrike.
//	AI_Output(self,other,"DIA_Gorn_Hut_09_01"); //Ich fürchte nicht. Aber wenn du das wirklich vorhast, geh zu Shrike.
	AI_Output(self,other,"DIA_Gorn_Hut_09_01"); //Myslím, že ne. Ale jestli to opravdu chceš, zajdi za Shrikem.
//	AI_Output(self,other,"DIA_Gorn_Hut_09_02"); //He's taken the hut right at the front, at the entrance to the cave. It was empty - but it really belonged to us.
//	AI_Output(self,other,"DIA_Gorn_Hut_09_02"); //Er hat sich die Hütte ganz vorne am Höhleneingang geschnappt. Sie stand leer - aber eigentlich gehörte sie uns.
	AI_Output(self,other,"DIA_Gorn_Hut_09_02"); //Šlohnul si chatrč úplně vepředu, u vchodu do jeskyně. Byla prázdná - ale vlastně patřila nám.
//	AI_Output(other,self,"DIA_Gorn_Hut_15_03"); //Us?
//	AI_Output(other,self,"DIA_Gorn_Hut_15_03"); //Uns?
	AI_Output(other,self,"DIA_Gorn_Hut_15_03"); //Nám?
//	AI_Output(self,other,"DIA_Gorn_Hut_09_04"); //Well, us mercenaries. Mercenaries and rogues live separately here. And none of Lares' gang should be here, on this side of the big hole.
//	AI_Output(self,other,"DIA_Gorn_Hut_09_04"); //Den Söldnern eben. Söldner und Banditen leben hier getrennt. Und normalerweise hat keiner aus Lares' Bande was auf dieser Seite des großen Loches zu suchen.
	AI_Output(self,other,"DIA_Gorn_Hut_09_04"); //Ano, nám žoldákům. Žoldáci a bandité tu žijí zvlášť. A nikdo z Laresovy tlupy by tady, na straně velké propasti, neměl co pohledávat.
//	AI_Output(self,other,"DIA_Gorn_Hut_09_05"); //It doesn't make much difference really. But he didn't ask. And you can't let those rogues get away with everything, because then they get real cocky!
//	AI_Output(self,other,"DIA_Gorn_Hut_09_05"); //Im Grunde ist es völlig egal. Aber er hat niemanden gefragt. Und man kann den Banditen nicht alles durchgehen lassen, sonst werden sie aufmüpfig!
	AI_Output(self,other,"DIA_Gorn_Hut_09_05"); //Ve skutečnosti v tom není velký rozdíl. On se ale nikoho nezeptal. A těmhle banditům nesmíš nechat úplně všechno projít, protože se z nich pak stanou opravdoví nafoukanci!

	Log_CreateTopic(CH1_ShrikesHut,LOG_MISSION);
	Log_SetTopicStatus(CH1_ShrikesHut,LOG_RUNNING);
//	B_LogEntry(CH1_ShrikesHut,"Gorn, the mercenary, told me that Shrike had taken a hut of the mercenaries without asking. Since I've asked Gorn, none of the mercenaries will interfere if I can 'convince' Shrike of getting another hut.");
//	B_LogEntry(CH1_ShrikesHut,"Der Söldner Gorn erzählte mir, dass Shrike sich ohne zu Fragen eine Söldner-Hütte genommen hat. Da ICH Gorn gefragt habe, wird sich keiner der Söldner einmischen, wenn ich Shrike davon 'überzeugen' kann, sich eine andere Hütte zu suchen.");
	//#Needs_Attention: tento zapis do dennika je napr. Neznasam zapisy do dennika :)
	B_LogEntry(CH1_ShrikesHut,"Žoldák Gorn mi řekl, že Shrike bez dovolení zabral chatrč žoldáků. Požádal jsem Gorna, aby nikdo ze žoldáků nezasahoval, dokud 'nepřesvědčím' Shrika, aby si našel jinou chatrč.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
// Hütte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree(C_INFO)
{
	npc = PC_Fighter;
	nr = 3;
	condition = Dia_Gorn_HutFree_Condition;
	information = Dia_Gorn_HutFree_Info;
	permanent = 0;
//	description = "Shrike has moved to another hut.";
//	description = "Shrike hat sich eine andere Hütte gesucht.";
	description = "Shrike si našel jinou chatrč.";
};

func int DIA_Gorn_HutFree_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Shrike_GetLost))
	//#Needs_Attention tento dialog je dostupny aj ked hrac nepokecal s Gornom
	//Malo by stacit pridat podmienku na predchadzajuci dialog
	//if (Npc_KnowsInfo(hero,DIA_Gorn_Hut) && Npc_KnowsInfo(hero,DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void DIA_Gorn_HutFree_Info()
{
//	AI_Output(other,self,"DIA_Gorn_HutFree_15_00"); //Shrike has moved to another hut.
//	AI_Output(other,self,"DIA_Gorn_HutFree_15_00"); //Shrike hat sich eine andere Hütte gesucht.
	AI_Output(other,self,"DIA_Gorn_HutFree_15_00"); //Shrike si našel jinou chatrč.
//	AI_Output(self,other,"DIA_Gorn_HutFree_09_01"); //Good. Torlof just told me that he wanted to have a word with the guy.
//	AI_Output(self,other,"DIA_Gorn_HutFree_09_01"); //Gut. Gerade noch hat mich Torlof drauf angesprochen, dass er dem Burschen das Fell über die Ohren ziehen wollte.
	AI_Output(self,other,"DIA_Gorn_HutFree_09_01"); //Dobře. Zrovna mi říkal Torlof, že mu chtěl vyprášit kožich.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_ShrikesHut,LOG_SUCCESS);
//	B_LogEntry(CH1_ShrikesHut,"Gorn was really amused that I kicked Shrike out of his hut. I think he's an honest guy. Tough, but fair. I should stick to him in the future.");
//	B_LogEntry(CH1_ShrikesHut,"Gorn hat sich darüber königlich amüsert, dass ich Shrike aus seiner Hütte geworfen haben. Er macht den Eindruck einer ehrlichen Haut. Hart aber gerecht. Ich sollte mich in Zukunft an ihn halten.");
	B_LogEntry(CH1_ShrikesHut,"Gorna pobavilo, že jsem Shrika vyrazil z jeho chatrče. Myslím, že je to čestný chlapík. Měl bych s ním v budoucnu držet.");
	B_GiveXP(XP_ReportedKickedShrike);
};

//*************************************
// Söldner werden
//*************************************

instance DIA_Gorn_BecomeSLD(C_INFO)
{
	npc = PC_Fighter;
	nr = 5;
	condition = Dia_Gorn_BecomeSLD_Condition;
	information = Dia_Gorn_BecomeSLD_Info;
	permanent = 0;
//	description = "What do I have to do to join the New Camp?";
//	description = "Was muss ich tun, um im Neuen Lager aufgenommen zu werden?";
	description = "Co musím udělat, abych se mohl přidat k Novému táboru?";
};

func int DIA_Gorn_BecomeSLD_Condition()
{
	if Npc_KnowsInfo(hero,DIA_Gorn_First)
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Gorn_BecomeSLD_Info()
{
//	AI_Output(other,self,"DIA_Gorn_BecomeSLD_15_00"); //What do I have to do to join the New Camp?
//	AI_Output(other,self,"DIA_Gorn_BecomeSLD_15_00"); //Was muss ich tun, um im Neuen Lager aufgenommen zu werden?
	AI_Output(other,self,"DIA_Gorn_BecomeSLD_15_00"); //Co musím udělat, abych se mohl přidat k Novému táboru?
//	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_01"); //Before Lee admits you, you'll have to improve your fighting skills. It doesn't matter what weapon you use, but you have to be good.
//	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_01"); //Bevor dich Lee aufnimmt, musst du lernen, besser zu kämpfen. Egal, mit welcher Waffe, aber du musst gut sein.
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_01"); //Než tě Lee přijme, musíš se naučit lépe bojovat. Nezáleží na tom, jakou zbraň používáš, ale musíš být dobrý.
//	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_02"); //Besides, you should be very experienced with the life here and everything.
//	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_02"); //Außerdem musst du viel Erfahrung haben mit dem Leben hier und allem.
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_02"); //Kromě toho bys měl mít hodně zkušeností se zdejším životem a tak.
//	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_03"); //If you don't want to go to the other camps, you should try to join the rogues before you start as a mercenary.
//	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_03"); //Wenn du keine Lust hast, in die anderen Lager zu gehen, solltest du dich den Banditen anschließen, bevor du als Söldner anfängst.
//	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_03"); //Jestli nebudeš chtít do jiných táborů, mohl by ses zkusit přidat k banditům, než začneš jako žoldák.
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_03"); //Jestli nebudeš mít chuť jít do ostatních táborů, měl by ses přidat k banditům, než začneš jako žoldák.
};

/*
//*************************************
// PERM
//*************************************

instance DIA_Gorn_PERM(C_INFO)
{
	npc = PC_Fighter;
	nr = 1;
	condition = Dia_Gorn_PERM_Condition;
	information = Dia_Gorn_PERM_Info;
	permanent = 1;
	description = "";
};

func int DIA_Gorn_PERM_Condition()
{
	return 1;
};

func void DIA_Gorn_PERM_Info()
{
	AI_Output(other,self,"DIA_Gorn_PERM_15_00"); //
	AI_Output(self,other,"DIA_Gorn_PERM_09_01"); //
};
*/

//*************************************
// TRADE
//*************************************
	var int Gorn_Trade;
//*************************************

instance DIA_Gorn_TRADE(C_INFO)
{
	npc = PC_Fighter;
	nr = 800;
	condition = Dia_Gorn_TRADE_Condition;
	information = Dia_Gorn_TRADE_Info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};

func int DIA_Gorn_TRADE_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_Gorn_DuHehler))
	//{
		//return 1; //***Man darf NICHT seine Waffe weggkaufen oder so...
	//};
};

func void DIA_Gorn_TRADE_Info()
{
//	AI_Output(other,self,"DIA_Gorn_TRADE_15_00"); //Have you got any more of that stuff?
//	AI_Output(other,self,"DIA_Gorn_TRADE_15_00"); //Hast du noch mehr von dem Zeug?
	AI_Output(other,self,"DIA_Gorn_TRADE_15_00"); //Máš ještě víc tohohle zboží?
//	AI_Output(self,other,"DIA_Gorn_TRADE_09_01"); //Plenty. You wanna trade?
//	AI_Output(self,other,"DIA_Gorn_TRADE_09_01"); //Jede Menge. Willst du handeln?
	AI_Output(self,other,"DIA_Gorn_TRADE_09_01"); //Spousty. Chceš obchodovat?
};

//*************************************
// DU Hehler?
//*************************************

instance DIA_Gorn_DuHehler(C_INFO)
{
	npc = PC_Fighter;
	nr = 1;
	condition = Dia_Gorn_DuHehler_Condition;
	information = Dia_Gorn_DuHehler_Info;
	permanent = 0;
//	description = "Why did you take part in one of the gang's raids?";
//	description = "Wie kommt es, dass du dich an einem Überfall der Bande beteiligt hast?";
	description = "Jakto, že ses zúčastnil útoku té tlupy?";
};

func int DIA_Gorn_DuHehler_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		return 1;
	};
};

func void DIA_Gorn_DuHehler_Info()
{
//	AI_Output(other,self,"DIA_Gorn_DuHehler_15_00"); //Why did you take part in one of the gang's raids?
//	AI_Output(other,self,"DIA_Gorn_DuHehler_15_00"); //Wie kommt es, dass du dich an einem Überfall der Bande beteiligt hast?
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_00"); //Jakto, že ses zúčastnil útoku té tlupy?
//	AI_Output(self,other,"DIA_Gorn_DuHehler_09_01"); //Who says I did?
//	AI_Output(self,other,"DIA_Gorn_DuHehler_09_01"); //Wer sagt, dass es so war?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_01"); //Kdo říká, že to tak bylo?
//	AI_Output(other,self,"DIA_Gorn_DuHehler_15_02"); //Why would you have so much of the stuff if it wasn't true?
//	AI_Output(other,self,"DIA_Gorn_DuHehler_15_02"); //Warum hast du sonst so viel von diesem Zeug?
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_02"); //Kde bys teda potom vzal tolik toho zboží, kdyby to nebyla pravda?
//	AI_Output(self,other,"DIA_Gorn_DuHehler_09_03"); //Don't you think that this is all from ONE haul.
//	AI_Output(self,other,"DIA_Gorn_DuHehler_09_03"); //Denk bloß nicht, dass das alles von EINEM Fischzug kommt.
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_03"); //Nemysli si, že je to všechno z JEDNÉ várky.
//	AI_Output(other,self,"DIA_Gorn_DuHehler_15_04"); //You take part in raids regularly?
//	AI_Output(other,self,"DIA_Gorn_DuHehler_15_04"); //Du beteiligst dich regelmäßig an den Überfällen?
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_04"); //Účastníš se útoků pravidelně?
//	AI_Output(self,other,"DIA_Gorn_DuHehler_09_05"); //If I did, I couldn't tell you. Lee wouldn't like that one bit.
//	AI_Output(self,other,"DIA_Gorn_DuHehler_09_05"); //Wenn es so wäre, könnte ich es dir nicht sagen. Lee sieht so was nämlich gar nicht gerne.
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_05"); //Kdyby to tak bylo, tak bych ti to stejně neřekl. Lee toto strašně nerad vidí.
//	AI_Output(other,self,"DIA_Gorn_DuHehler_15_06"); //I see.
//	AI_Output(other,self,"DIA_Gorn_DuHehler_15_06"); //Verstehe.
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_06"); //Rozumím.

	CreateInvItems(self,ItFoApple, 21);
	B_GiveInvItems(self,other,ItFoApple,21); //Notwendig für Screenausgabe
	Npc_RemoveInvItems(other,ItFoApple,21);

	CreateInvItems(other,ItMw_1H_LightGuardsSword_03,1);
	CreateInvItems(other,ItFoApple, 5);
	CreateInvItems(other,ItFoLoaf, 5);
	CreateInvItems(other,ItFoCheese, 5);
	CreateInvItems(other,ItFoBeer, 5);
};

//#####################################################################
//##
//##
//## KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
// Info NCWAIT
//***************************************************************************
instance Info_Gorn_NCWAIT(C_INFO)
{
	npc = PC_Fighter;
	nr = 1;
	condition = Info_Gorn_NCWAIT_Condition;
	information = Info_Gorn_NCWAIT_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_NCWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"NC_PATH52")<1000)
	{
		return TRUE;
	};
};

func void Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_NCWAIT_09_01"); //Ahh, it's you! My friend Lester from the swamp camp told me all you did there.
//	AI_Output(self,other,"Info_Gorn_NCWAIT_09_01"); //Ahh, du bist es! Mein Freund Lester aus dem Sumpflager hat mir erzählt, was du dort alles vollbracht hast.
	AI_Output(self,other,"Info_Gorn_NCWAIT_09_01"); //Áhh, to jsi ty! Můj přítel Lester z tábora z bažin mi vyprávěl, co všecho jsi tam dokázal.
//	AI_Output(self,other,"Info_Gorn_NCWAIT_09_02"); //For somebody who hasn't been here for long, you've come quite a way.
//	AI_Output(self,other,"Info_Gorn_NCWAIT_09_02"); //Für jemanden, der noch nicht so lange hier ist, hast du es schon weit gebracht.
	AI_Output(self,other,"Info_Gorn_NCWAIT_09_02"); //Na někoho, kdo tu není tak dlouho, máš už docela rozhled.
//	AI_Output(other,self,"Info_Gorn_NCWAIT_15_03"); //I came quite close to becoming worm food a few times, too.
//	AI_Output(other,self,"Info_Gorn_NCWAIT_15_03"); //Es hat oft nicht viel gefehlt, und ich wäre als Futter für die Würmer geendet.
	//#Needs_Attention: neprebasnime?
	AI_Output(other,self,"Info_Gorn_NCWAIT_15_03"); //Už jsem měl taky párkrát namále, abych se nestal žrádlem pro červy.
};

//***************************************************************************
// Info MAGES
//***************************************************************************
instance Info_Gorn_MAGES(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_MAGES_Condition;
	information = Info_Gorn_MAGES_Info;
	important = 0;
	permanent = 0;
//	description = "I have an important message for the Magicians of Water!";
//	description = "Ich habe eine wichtige Botschaft für die Wassermagier!";
	description = "Mám důležitou zprávu pro mágy Vody!";
};

func int Info_Gorn_MAGES_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func void Info_Gorn_MAGES_Info()
{
//	AI_Output(other,self,"Info_Gorn_MAGES_15_01"); //I have an important message for the Magicians of Water!
//	AI_Output(other,self,"Info_Gorn_MAGES_15_01"); //Ich habe eine wichtige Botschaft für die Wassermagier!
	AI_Output(other,self,"Info_Gorn_MAGES_15_01"); //Mám důležitou zprávu pro mágy Vody!
//	AI_Output(self,other,"Info_Gorn_MAGES_09_02"); //Then you should talk to Saturas. He's the highest of the water mages and spends all day studying some writings or other.
//	AI_Output(self,other,"Info_Gorn_MAGES_09_02"); //Dann sprich am besten gleich mit Saturas. Er ist der oberste Wassermagier und studiert den ganzen Tag irgendwelche Schriften.
	AI_Output(self,other,"Info_Gorn_MAGES_09_02"); //Pak by sis měl nejlépe promluvit se Saturasem. Je nejvyšší z mágů Vody a celé dny tráví studiem nějakých písemností.
//	AI_Output(self,other,"Info_Gorn_MAGES_09_03"); //But no matter how important your message is, the guards of the upper level won't let you through to him.
//	AI_Output(self,other,"Info_Gorn_MAGES_09_03"); //Aber egal, wie wichtig die Botschaft auch ist, die Wachen zur oberen Ebene werden dich nicht zu ihm durch lassen.
	AI_Output(self,other,"Info_Gorn_MAGES_09_03"); //Bez ohledu na závažnost té zprávy tě však stráže z horní roviny za ním nepustí.
//	AI_Output(other,self,"Info_Gorn_MAGES_15_04"); //Can't you put in a good word for me?
//	AI_Output(other,self,"Info_Gorn_MAGES_15_04"); //Kannst du nicht ein gutes Wort für mich einlegen?
	AI_Output(other,self,"Info_Gorn_MAGES_15_04"); //Nemůžeš se za mě přimluvit?
//	AI_Output(self,other,"Info_Gorn_MAGES_09_05"); //I can't, but Cronos, the keeper of the ore, might be able to give you permission.
//	AI_Output(self,other,"Info_Gorn_MAGES_09_05"); //Ich nicht, aber Cronos, der Hüter des Erzes, kann dir vielleicht eine Erlaubnis erteilen.
	AI_Output(self,other,"Info_Gorn_MAGES_09_05"); //Já ne, ale Cronos, strážce rudy, by ti mohl udělit povolení.
};

//***************************************************************************
// Info CRONOS
//***************************************************************************
instance Info_Gorn_CRONOS(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_CRONOS_Condition;
	information = Info_Gorn_CRONOS_Info;
	important = 0;
	permanent = 0;
//	description = "Where can I find this 'keeper of the ore'?";
//	description = "Wo finde ich diesen 'Hüter des Erzes'?";
	description = "Kde najdu toho 'strážce rudy'?";
};

func int Info_Gorn_CRONOS_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_MAGES))
	{
		return TRUE;
	};
};

func void Info_Gorn_CRONOS_Info()
{
//	AI_Output(other,self,"Info_Gorn_CRONOS_15_01"); //Where can I find this 'keeper of the ore'?
//	AI_Output(other,self,"Info_Gorn_CRONOS_15_01"); //Wo finde ich diesen 'Hüter des Erzes'?
	AI_Output(other,self,"Info_Gorn_CRONOS_15_01"); //Kde najdu toho 'strážce rudy'?
//	AI_Output(self,other,"Info_Gorn_CRONOS_09_01a");//If you proceed from here, you'll come across the big dwelling cave behind the dam.
//	AI_Output(self,other,"Info_Gorn_CRONOS_09_01a");//Wenn du von hier weitergehst, stößt du nach dem Damm auf die große Wohnhöhle.
	AI_Output(self,other,"Info_Gorn_CRONOS_09_01a");//Když odtud vyjdeš, za přehradou narazíš na velkou obytnou jeskyní.
//	AI_Output(self,other,"Info_Gorn_CRONOS_09_02"); //Cronos is usually at the grid over the big ore mound.
//	AI_Output(self,other,"Info_Gorn_CRONOS_09_02"); //Cronos hält sich normalerweise am Gitter über dem großen Erzhaufen auf.
	AI_Output(self,other,"Info_Gorn_CRONOS_09_02"); //Cronos se obvykle zdržuje u mříže nad velkou haldou rudy.
//	AI_Output(self,other,"Info_Gorn_CRONOS_09_03"); //But he's a bit arrogant. You'll have to convince him that your message is important.
//	AI_Output(self,other,"Info_Gorn_CRONOS_09_03"); //Aber er ist ein wenig arrogant. Du wirst ihn überzeugen müssen, dass deine Botschaft wichtig ist.
	AI_Output(self,other,"Info_Gorn_CRONOS_09_03"); //Je ale trochu arogantní. Budeš ho muset přesvědčit, že je tvá zpráva opravdu důležitá.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;

//	B_LogEntry(CH3_EscapePlanNC,"Gorn recommended me to go straight to the High Magician of Water, who's called Saturas. Cronos, the keeper of the ore, can get me an audience. Cronos is to be found in the center of the Camp, at the grid above the ore mound.");
//	B_LogEntry(CH3_EscapePlanNC,"Gorn empfahl mir, direkt mit dem obersten Wassermagier mit Namen Saturas zu sprechen. Cronos, der Hüter des Erzes, kann eine Audienz erwirken. Cronos hält sich im Zentrum des Neuen Lagers, am Gitter über dem Erzhaufen auf.");
	B_LogEntry(CH3_EscapePlanNC,"Gorn mi poradil, abych šel přímo za nejvyšším mágem Vody, Saturasem. Cronos, strážce rudy, mi může zařídit audienci u Saturase. Cronos se zdržuje ve středu Nového tábora u mříže nad rudnou haldou.");

	Npc_ExchangeRoutine(self,"start");
};

//***************************************************************************
// Info RUINWAIT
//***************************************************************************
instance Info_Gorn_RUINWAIT(C_INFO)
{
	npc = PC_Fighter;
	nr = 2;
	condition = Info_Gorn_RUINWAIT_Condition;
	information = Info_Gorn_RUINWAIT_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"OW_PATH_ABYSS_4")<1000)
	{
		return 1;
	};
};

func void Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_01"); //Hi, greenhorn. As you can see, the colony is quite a small place.
//	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_01"); //Hallo, Neuer. Wie du siehst, ist die Kolonie ein kleiner Ort.
	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_01"); //Zdar, zelenáči. Jak vidíš, kolonie je malé místo.
//	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_02"); //You can't help bumping into people all the time.
//	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_02"); //Man läuft sich hier ständig über den Weg.
	//#Needs_Attention: neprebasnime?
	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_02"); //Není možné jít a nikoho nepotkat.
};

//***************************************************************************
// Info RUINWHAT
//***************************************************************************
instance Info_Gorn_RUINWHAT(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINWHAT_Condition;
	information = Info_Gorn_RUINWHAT_Info;
	important = 0;
	permanent = 0;
//	description = "What are you doing here?";
//	description = "Was führt dich denn hier her?";
	description = "Kde se tu bereš?";
};

func int Info_Gorn_RUINWHAT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func void Info_Gorn_RUINWHAT_Info()
{
//	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_01"); //What are you doing here?
//	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_01"); //Was führt dich denn hierher?
	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_01"); //Kde se tu bereš?
//	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_02"); //Oh, I'm trying to track down an old legend.
//	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_02"); //Oh, ich versuche, einer alten Legende auf die Spur zu kommen.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_02"); //Och, pokouším se vystopovat starou legendu.
//	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_03"); //A legend?
//	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_03"); //Einer Legende?
	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_03"); //Legendu?
//	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_04"); //Yes, Milten, my pal from the Old Camp, told me that monks used to live here.
//	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_04"); //Ja, Milten, mein Kumpel aus dem Alten Lager, hat mir erzählt, dass hier einst Mönche lebten.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_04"); //Ano, Milten, můj kamarád ze Starého tábora, mi říkal, že tady kdysi žili mniši.
//	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_05"); //Of course, that was long before the Barrier was created.
//	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_05"); //Das war natürlich lange, bevor es die Barriere gab.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_05"); //Samozřejmě, už dávno předtím, než tady byla Bariéra.
//	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_06"); //It's said they worshipped a god who gave them the power to turn into animals.
//	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_06"); //Sie sollen einem Gott gehuldigt haben, der seinen Anhängern die Macht gab, sich in Tiere zu verwandeln.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_06"); //Říká se, že uctívali boha, který svým stoupencům dával moc proměňovat se ve zvířata.
//	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_07"); //I'm sure there are still treasures from the old times here.
//	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_07"); //Bestimmt gibt es hier noch Schätze aus der alten Zeit.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_07"); //Zajisté tu budou poklady ze starých časů.

	if (!Npc_KnowsInfo(hero,Info_Gorn_RUINFOCUS))
	{
//		AI_Output(self,other,"Info_Gorn_RUINWHAT_09_08"); //What brings you here?
//		AI_Output(self,other,"Info_Gorn_RUINWHAT_09_08"); //Was führt dich hierher?
		AI_Output(self,other,"Info_Gorn_RUINWHAT_09_08"); //Co tě sem přivádí?
	};
};

//***************************************************************************
// Info RUINFOCUS
//***************************************************************************
instance Info_Gorn_RUINFOCUS(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINFOCUS_Condition;
	information = Info_Gorn_RUINFOCUS_Info;
	important = 0;
	permanent = 0;
//	description = "I'm looking for a magic focus.";
//	description = "Ich suche einen magischen Fokus";
	description = "Hledám magické ohnisko.";
};

func int Info_Gorn_RUINFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func void Info_Gorn_RUINFOCUS_Info()
{
//	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_01"); //I'm looking for a magic focus.
//	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_01"); //Ich suche einen magischen Fokus.
	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_01"); //Hledám magické ohnisko.
//	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_02"); //It must be somewhere in this area.
//	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_02"); //Er muss irgendwo in dieser Gegend sein.
	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_02"); //Musí tady někde být.
//	AI_Output(self,other,"Info_Gorn_RUINFOCUS_09_03"); //The thing you're looking for might be in the old ruined monastery beyond the canyon.
//	AI_Output(self,other,"Info_Gorn_RUINFOCUS_09_03"); //Was du suchst, befindet sich vielleicht innerhalb der Klosterruinen dort jenseits der Schlucht.
	AI_Output(self,other,"Info_Gorn_RUINFOCUS_09_03"); //Ta věc, kterou hledáš, by mohla být v ruinách kláštera za propastí.
};

//***************************************************************************
// Info RUINJOIN
//***************************************************************************
instance Info_Gorn_RUINJOIN(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINJOIN_Condition;
	information = Info_Gorn_RUINJOIN_Info;
	important = 0;
	permanent = 0;
//	description = "We could go on together.";
//	description = "Wir könnten unseren Weg gemeinsam fortsetzen.";
	description = "Mohli bychom pokračovat společně.";
};

func int Info_Gorn_RUINJOIN_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero,Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func void Info_Gorn_RUINJOIN_Info()
{
//	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_01"); //We could go on together.
//	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_01"); //Wir können unseren Weg gemeinsam fortsetzen.
	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_01"); //Mohli bychom pokračovat společně.
//	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_02"); //Good idea. This area is crowded with snappers.
//	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_02"); //Gute Idee. Hier wimmelt es nur so von Snappern.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_02"); //Dobrý nápad. Tahle oblast se hemží chňapavci.
//	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_03"); //When they're on their own, they're no problem for an experienced hunter. Most of the time they hunt in packs though.
//	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_03"); //Einzeln sind sie für einen geübten Kämpfer zwar kein Problem, aber sie jagen meistens in Rudeln.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_03"); //Samotní nejsou pro zkušeného lovce problém, ale většinou loví ve smečkách.
//	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_04"); //A pack can even tear the cleverest sword fighter to pieces.
//	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_04"); //So ein Rudel kann auch den gewieftesten Schwertmeister in Fetzen reißen.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_04"); //Smečka může dokonce i toho nejudatnějšího šermíře roztrhat na kusy.
//	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_05"); //So we'll go together?
//	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_05"); //Wir gehen also zusammen?
	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_05"); //Tak půjdeme spolu?
//	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_06"); //Okay, but before we cross this log, I'd like to examine the canyon. I like to know what's at my back.
//	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_06"); //Ok, doch bevor wir über diesen Baumstamm balancieren, möchte ich die Schlucht darunter erforschen. Ich habe gerne einen freien Rücken.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_06"); //Dobře, ale ještě než vyrazíme, chtěl bych prozkoumat tu propast. Rád vím, co mám za zády.
//	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_07"); //Come with me, I've discovered a path which will take us there.
//	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_07"); //Komm mit, ich habe einen Weg entdeckt, der uns dorthin führt.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_07"); //Pojď se mnou, našel jsem cestu, která tam vede.

	Log_CreateTopic(CH3_MonasteryRuin,LOG_MISSION);
	Log_SetTopicStatus(CH3_MonasteryRuin,LOG_RUNNING);
//	B_LogEntry(CH3_MonasteryRuin,"When I approached the ruined monastery, I met the mercenary Gorn. He's here to search the ruins for old treasures.");
//	B_LogEntry(CH3_MonasteryRuin,"Als ich mich der Klosterruine näherte traf ich auf den Söldner Gorn. Er ist hier, um die vor uns liegende Gemäuer nach Schätzen aus alten Tagen zu durchsuchen.");
	B_LogEntry(CH3_MonasteryRuin,"Když jsem se přiblížil k rozvalinám kláštera, potkal jsem žoldáka Gorna. Je tu, aby v rozvalinách kláštera hledal poklady ze starých časů.");
//	B_LogEntry(CH3_MonasteryRuin,"We'll continue our search together. Gorn warned me of big herds of snappers in the area.");
//	B_LogEntry(CH3_MonasteryRuin,"Wir werden unsere Suche gemeinsam fortsetzen. Gorn warnte mich vor grossen Snapper-Rudeln, die in dieser Gegend verstärkt anzutreffen sind.");
	B_LogEntry(CH3_MonasteryRuin,"Budeme pokračovat v pátrání společně. Gorn mě varoval před velkými smečkami chňapavců, které se v této oblasti vyskytují.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinAbyss");
};

//***************************************************************************
// Info RUINABYSS
//***************************************************************************
instance Info_Gorn_RUINABYSS(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINABYSS_Condition;
	information = Info_Gorn_RUINABYSS_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINABYSS_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6")<1000))
	{
		return 1;
	};
};

func void Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_01"); //That's what I call luck. Apparently this used to be a storage cave.
//	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_01"); //Das nenne ich Glück. Hier scheint eine Vorratshöhle gewesen zu sein.
	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_01"); //Tomu říkám štěstí. Určitě tu bývala zásobovací jeskyně.
//	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_02"); //Why don't you take the lead now, I just wanted to make sure that we won't be surprised on our return trip.
//	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_02"); //Übernimm du jetzt die Führung, ich wollte nur sicherstellen, dass bei unserer Rückkehr hier keine Überraschung auf uns wartet.
	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_02"); //Teď si převezmi vedení, chtěl bych mít jistotu, že na zpáteční cestě nezažijeme nějaké překvapení.

//	B_LogEntry(CH3_MonasteryRuin,"We have discovered a secret supply cave. Above all, one key and two spell scrolls proved to be quite interesting.");
//	B_LogEntry(CH3_MonasteryRuin,"Wir haben eine geheime Vorratshöhle entdeckt. Vor allem ein Schlüssel und zwei Spruchrollen haben meine Aufmerksamkeit geweckt");
	B_LogEntry(CH3_MonasteryRuin,"Nalezli jsme tajnou zásobovací jeskyni. Ze všeho nejvíce mě zaujal klíč a dva kouzelné svitky.");

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinFollow");
};

//***************************************************************************
// Info RUINLEAVE
//***************************************************************************
instance Info_Gorn_RUINLEAVE(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINLEAVE_Condition;
	information = Info_Gorn_RUINLEAVE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINLEAVE_Condition()
{
	if Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN)
	&& (Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG")>15000)
	&& !Npc_KnowsInfo(hero,Info_Gorn_RUINGATE)
	{
		return 1;
	};
};

func void Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_01"); //You seem to have lost interest in the ruined monastery.
//	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_01"); //Du scheinst doch nicht mehr an der Klosterruine interessiert zu sein.
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_01"); //Vypadá to, že už tě ta zřícenina kláštera nezajímá.
//	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_02"); //I'll go on, on my own.
//	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_02"); //Ich werde alleine weitergehen.
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_02"); //Budu pokračovat sám.
//	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_03"); //Just follow me if you change your mind.
//	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_03"); //Komm einfach nach, wenn du es dir anders überlegst.
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_03"); //Jestli si to rozmyslíš, tak jdi za mnou.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinWall");
	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info RUINWALL
//***************************************************************************
instance Info_Gorn_RUINWALL(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINWALL_Condition;
	information = Info_Gorn_RUINWALL_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINWALL_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero,Info_Gorn_RUINLEAVE))
	&& (Npc_GetDistToWP(hero,"OW_PATH_175_GATE1")<1000))
	{
		return 1;
	};
};

func void Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_RUINWALL_09_01"); //This damn gate. They say nobody in the colony has ever been able to open it.
//	AI_Output(self,other,"Info_Gorn_RUINWALL_09_01"); //Dieses verfluchte Tor. Man erzählt sich, dass bisher kein Mensch in der Kolonie es öffnen konnte.
	AI_Output(self,other,"Info_Gorn_RUINWALL_09_01"); //Ta proklatá brána. Říká se, že ji nikdo z kolonie nedokáže otevřít.
//	AI_Output(self,other,"Info_Gorn_RUINWALL_09_02"); //The little beasts over there seem to be the only ones who have managed to get into the inner yard.
//	AI_Output(self,other,"Info_Gorn_RUINWALL_09_02"); //Die kleinen Biester da drüben scheinen die Einzigen zu sein, die es geschafft haben, in den Innenhof zu gelangen.
	AI_Output(self,other,"Info_Gorn_RUINWALL_09_02"); //Ty malé bestie jsou zřejmě jediné, které se dokáží dostat na nádvoří.

//	B_LogEntry(CH3_MonasteryRuin,"We're right in front of a closed gate. Looks like it can't be opened from the outside.");
//	B_LogEntry(CH3_MonasteryRuin,"Wir stehen vor einem verschlossenen Tor. Man scheint es von außen nicht öffnen zu können.");
	B_LogEntry(CH3_MonasteryRuin,"Stojíme přímo před zavřenou bránou. Vypadá to, že zvenčí nepůjde otevřít.");

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinWall");
};

//***************************************************************************
// Info RUINWALLWHAT
//***************************************************************************
instance Info_Gorn_RUINWALLWHAT(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINWALLWHAT_Condition;
	information = Info_Gorn_RUINWALLWHAT_Info;
	important = 0;
	permanent = 1;
//	description = "What happens now?";
//	description = "Wie geht es nun weiter?";
	description = "A co teď?";
};

func int Info_Gorn_RUINWALLWHAT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_RUINWALL)
	&& !Npc_KnowsInfo(hero,Info_Gorn_RUINGATE))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINWALLWHAT_Info()
{
//	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01"); //What happens now?
//	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01"); //Wie geht es nun weiter?
	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01"); //A co teď?
//	AI_Output(self,other,"Info_Gorn_RUINWALLWHAT_09_02"); //You have to find a way to get to the other side of the gate.
//	AI_Output(self,other,"Info_Gorn_RUINWALLWHAT_09_02"); //Du musst einen Weg finden, auf die andere Seite des Tors zu gelangen.
	AI_Output(self,other,"Info_Gorn_RUINWALLWHAT_09_02"); //Musíš najít cestu na druhou stranu brány.
};

//***************************************************************************
// Info RUINLEDGE
//***************************************************************************
instance Info_Gorn_RUINLEDGE(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINLEDGE_Condition;
	information = Info_Gorn_RUINLEDGE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINLEDGE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN)
	&& !Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS)
	&& (Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02")<1000))
	{
		return 1;
	};
};

func void Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_01"); //There's some kind of platform up there. But it seems to be too high to climb.
//	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_01"); //Dort oben ist eine Art Plattform. Aber es scheint zu hoch zu sein, um zu klettern.
	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_01"); //Tamhle nahoře je nějaká plošina. Ale vypadá to, že je moc vysoko, aby se na ní dalo vyšplhat.
//	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_02"); //We'll have to find another way.
//	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_02"); //Wir müssen einen anderen Weg finden.
	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_02"); //Musíme najít jinou cestu.

	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info RUINPLATFORM
//***************************************************************************
instance Info_Gorn_RUINPLATFORM(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINPLATFORM_Condition;
	information = Info_Gorn_RUINPLATFORM_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINPLATFORM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN)
	&& !Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS)
	&& (Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4")<300))
	{
		return 1;
	};
};

func void Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_01"); //Looks like a pedestal of some sort.
//	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_01"); //Sieht aus wie ein Podest für irgendetwas.
	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_01"); //Vypadá to jako podstavec pro něco.
//	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_02"); //Perhaps the artefact you're looking for used to lay here.
//	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_02"); //Vielleicht lag hier mal das Artefakt, dass du suchst.
	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_02"); //Možná ten artefakt, který hledáš, ležel kdysi tady.

	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info RUINGATE
//***************************************************************************
instance Info_Gorn_RUINGATE(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINGATE_Condition;
	information = Info_Gorn_RUINGATE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINGATE_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero,Info_Gorn_RUINLEAVE))
	&& MonasteryRuin_GateOpen )
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_RUINGATE_09_01"); //You actually managed to open the gate. That spell of yours was real clever.
//	AI_Output(self,other,"Info_Gorn_RUINGATE_09_01"); //Du hast es tatsächlich geschafft, das Tor zu öffnen. Das mit dem Zauber war wirklich clever.
	AI_Output(self,other,"Info_Gorn_RUINGATE_09_01"); //Doopravdy se podařilo tu bránu otevřít. To tvoje kouzlo bylo skutečně šikovné.
//	AI_Output(other,self,"Info_Gorn_RUINGATE_15_02"); //And on we go, come on.
//	AI_Output(other,self,"Info_Gorn_RUINGATE_15_02"); //Los, weiter geht's.
	AI_Output(other,self,"Info_Gorn_RUINGATE_15_02"); //A můžeme jít dál.

//	B_LogEntry(CH3_MonasteryRuin,"With the aid of the spell scrolls from the supply cave, I transformed myself into a meatbug. This way I was able to crawl inside through a gap in the wall.");
//	B_LogEntry(CH3_MonasteryRuin,"Mithilfe der Spruchrollen aus der Vorratshöhle habe ich mich in eine Fleischwanze verwandelt und bin durch einen Mauerspalt ins Innere gelangt.");
	B_LogEntry(CH3_MonasteryRuin,"Pomocí kouzelného svitku ze zásobovací jeskyně jsem se proměnil ve žravou štěnici a mohl jsem proklouznout škvírou ve zdi.");
//	B_LogEntry(CH3_MonasteryRuin,"The gate is now open.");
//	B_LogEntry(CH3_MonasteryRuin,"Das Tor ist nun offen.");
	B_LogEntry(CH3_MonasteryRuin,"Vrata jsou nyní otevřena.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RuinFollowInside");
	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info RUINLEAVEINSIDE
//***************************************************************************
instance Info_Gorn_RUINLEAVEINSIDE(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINLEAVEINSIDE_Condition;
	information = Info_Gorn_RUINLEAVEINSIDE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if Npc_KnowsInfo(hero,Info_Gorn_RUINGATE)
	&& (Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6")<1000)
	&& !Npc_HasItems(hero,Focus_4)
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //You seem to have lost interest in the ruined monastery.
//	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Du scheinst doch nicht mehr an der Klosterruine interessiert zu sein.
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Myslím, že už tě ta zřícenina kláštera přestala zajímat.
//	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //I'll go on on my own.
//	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Ich werde alleine weitersuchen.
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Budu pokračovat sám.
//	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Just follow me if you change your mind.
//	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Komm einfach nach, wenn du es dir anders überlegst.
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Jestli si to rozmyslíš, tak jdi za mnou.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinStay");
	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info RUINSUCCESS
//***************************************************************************
instance Info_Gorn_RUINSUCCESS(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINSUCCESS_Condition;
	information = Info_Gorn_RUINSUCCESS_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINSUCCESS_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN)
	&& Npc_HasItems(hero,Focus_4))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_01"); //So you found your magic artefact!
//	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_01"); //Du hast dein magisches Artefakt also gefunden!
	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_01"); //Tak jsi našel svůj kouzelný artefakt!
//	AI_Output(other,self,"Info_Gorn_RUINSUCCESS_15_02"); //Yeah. I have to take the focus to the Magicians of Water. They need it.
//	AI_Output(other,self,"Info_Gorn_RUINSUCCESS_15_02"); //Ja. Ich muss den Fokus zu den Wassermagiern bringen. Sie brauchen ihn.
	AI_Output(other,self,"Info_Gorn_RUINSUCCESS_15_02"); //Ano. Musím ohnisko předat mágům Vody. Potřebují ho.
//	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_03"); //I'll accompany you for a while.
//	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_03"); //Ich werde dich noch etwas begleiten.
	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_03"); //Budu tě ještě chvíli doprovázet.

//	B_LogEntry(CH3_MonasteryRuin,"I found the focus in a kind of study room. Gorn will accompany me some more.");
//	B_LogEntry(CH3_MonasteryRuin,"Ich habe den Fokus in einer Art Studienraum gefunden. Gorn will mich noch etwas begleiten.");
	B_LogEntry(CH3_MonasteryRuin,"V jakési studovně jsem našel ohnisko. Gorn mě bude ještě doprovázet.");

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinYard");

	Wld_InsertNpc (YoungTroll, "OW_PATH_176");
};

//***************************************************************************
// Info RUINTROLL
//***************************************************************************
instance Info_Gorn_RUINTROLL(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINTROLL_Condition;
	information = Info_Gorn_RUINTROLL_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINTROLL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS)
	&& (Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01")<1000))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_01"); //OH HELL!!! What monster's that over there?
//	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_01"); //ACH DU SCHEISSE!!! Was ist das für ein Riesenvieh dort drüben?
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_01"); //K ČERTU!!! Co je to tam za obrovskou příšeru?
//	AI_Output(other,self,"Info_Gorn_RUINTROLL_15_02"); //Where did THAT come from?
//	AI_Output(other,self,"Info_Gorn_RUINTROLL_15_02"); //Wo kommt DAS denn her???
	AI_Output(other,self,"Info_Gorn_RUINTROLL_15_02"); //Kde se TO tu vzalo?
//	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_03"); //Looks like one of those virtually invincible trolls. Only smaller!
//	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_03"); //Sieht aus wie einer dieser fast unverwundbaren Trolle. Allerdings etwas kleiner!
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_03"); //Vypadá to jako jeden z těch nepřemožitelných trolů. Jen trochu menší!
//	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_04"); //Whatever, if we want to get out of here, we have to get past that beast.
//	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_04"); //Wie auch immer, wenn wir hier raus wollen, müssen wie an diesem Biest vorbei.
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_04"); //Jestli se odtud ale chceme dostat, musíme každopádně přes tu příšeru projít.

	AI_StopProcessInfos(self);

	AI_DrawWeapon (self);
	AI_SetWalkmode(self,NPC_RUN);
	//AI_GotoWP (self,"OW_PATH_176");
};

//***************************************************************************
// Info RUINVICTORY
//***************************************************************************
instance Info_Gorn_RUINVICTORY(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINVICTORY_Condition;
	information = Info_Gorn_RUINVICTORY_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINVICTORY_Condition()
{
	var C_NPC yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);

	if Npc_KnowsInfo(hero,Info_Gorn_RUINTROLL)
	&& Npc_IsDead(yTroll)
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_01"); //That was hard work.
//	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_01"); //Das war ein hartes Stück Arbeit.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_01"); //To byla dřina.
//	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_02"); //Yeah, we defeated that monster. But if that was just a young troll...
//	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_02"); //Ja, wir haben das Monster bezwungen. Doch wenn das nur ein junger Troll war ...
	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_02"); //Jo, porazili jsme tu příšeru. Jestli to ale byl jenom mladý trol...
//	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_03"); //... then you'd rather not bump into its parents, huh?
//	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_03"); //... dann willst du wohl einem ausgewachsenen Exemplar lieber nicht zwischen die Finger geraten.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_03"); //...pak bychom se raději neměli potkat s jeho rodiči, co?
//	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_04"); //Something like that.
//	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_04"); //So in etwa.
	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_04"); //Tak nějak.
//	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_05"); //This is where we go our separate ways. I want to stay here for a while and have a look around.
//	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_05"); //Unsere Wege trennen sich hier. Ich werde noch eine Weile bleiben und herumstöbern.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_05"); //Tady se naše cesty rozdělí. Chci tady chvíli zůstat a porozhlédnout se kolem.
//	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_06"); //But I'm sure we'll meet again. See you later, my friend.
//	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_06"); //Doch wir werden uns sicher wiedersehen. Bis dann, mein Freund.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_06"); //Jsem si ale jistý, že se ještě potkáme. Tak na viděnou, příteli.

//	B_LogEntry(CH3_MonasteryRuin,"On the way back into the monastery courtyard, we met a young troll. It was a hard fight, but we've won it.");
//	B_LogEntry(CH3_MonasteryRuin,"Wir sind auf dem Rückweg in den Hof der Klosterruine auf einen jungen Troll gestoßen. Es war ein harter Kampf aber wir haben ihn gewonnen.");
	B_LogEntry(CH3_MonasteryRuin,"Na zpáteční cestě na klášternímu nádvoří jsme narazili mladého trola. Byl to tvrdý boj, ale zvítězili jsme.");
//	B_LogEntry(CH3_MonasteryRuin,"My way with Gorn has ended now. I have a feeling that I'll be meeting him again soon.");
//	B_LogEntry(CH3_MonasteryRuin,"Die Wege von Gorn und mir trennen sich nun. Mein Gefühl sagt mir, dass ich ihn bald wiedersehen werde.");
	B_LogEntry(CH3_MonasteryRuin,"Má pouť s Gornem nyní skončila. Mám pocit, že jej zase brzy potkám.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinStay");
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
// Info DIEGOMILTEN
//---------------------------------------------------------------------
instance Info_Gorn_DIEGOMILTEN(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_DIEGOMILTEN_Condition;
	information = Info_Gorn_DIEGOMILTEN_Info;
	important = 0;
	permanent = 0;
//	description = "I met Diego and Milten in front of the Old Camp!";
//	description = "Ich habe Diego und Milten vor dem Alten Lager getroffen!";
	description = "Potkal jsem před Starým táborem Diega a Miltena!";
};

func int Info_Gorn_DIEGOMILTEN_Condition()
{
	if Npc_KnowsInfo(hero,Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func void Info_Gorn_DIEGOMILTEN_Info()
{
//	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //I met Diego and Milten in front of the Old Camp!
//	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Ich habe Diego und Milten vor dem Alten Lager getroffen!
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Potkal jsem před Starým táborem Diega a Miltena!
//	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //That's good news!
//	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //Eine gute Nachricht!
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //To jsou dobré zprávy!
//	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //They want to meet you and Lester. At your usual rendezvous.
//	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Sie wollen sich mit dir und Lester treffen. An eurem üblichen Treffpunkt.
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Chtějí se s tebou a s Lesterem setkat. Na vašem obvyklém místě.
//	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Thanks. There's nothing more valuable than good friends in troubled times like these.
//	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Danke. In diesen turbulenten Zeiten sind gute Freunde unersetzlich.
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Díky. Ve špatných časech, jako jsou teď, není nic cennějšího než dobří přátelé.
//	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //You're almost one of us by now. You're reliable!
//	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Auch du gehörst mittlerweile schon fast zu uns. Auf dich ist Verlass!
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Teď už jsi téměř jedním z nás. Je na tebe spoleh!

	B_GiveXP(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE;
	}
	else
	{
//		B_LogEntry(CH4_4Friends, "I informed Lester and Gorn about the meeting with their friends. Now, this isn't my affair any longer. They'll know what do do next...");
//		B_LogEntry(CH4_4Friends, "Ich habe Lester und Gorn nun darüber informiert sich mit den anderen beiden Freunden zu treffen. Ab jetzt ist dies nicht mehr meine Angelegenheit. Sie werden schon wissen, was zu tun ist.");
		B_LogEntry(CH4_4Friends, "Řekl jsem Lesterovi a Gornovi o setkání s jejich přáteli. Teď už to není moje věc. Dál si poradí sami...");
		Log_SetTopicStatus(CH4_4Friends,LOG_SUCCESS);
	};

};

//---------------------------------------------------------------------
// Info FREEMINE
//---------------------------------------------------------------------
instance Info_Gorn_FREEMINE(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FREEMINE_Condition;
	information = Info_Gorn_FREEMINE_Info;
	important = 0;
	permanent = 0;
//	description = "What did you see in the Free Mine?";
//	description = "Was hast du in der Freien Mine gesehen?";
	description = "Co jsi viděl ve Svobodném dole?";
};

func int Info_Gorn_FREEMINE_Condition()
{
	if Npc_KnowsInfo(hero,Info_Saturas_AMBUSH)
	&& !FindXardas
	{
		return TRUE;
	};
};

func void Info_Gorn_FREEMINE_Info()
{
//	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_01"); //What did you see in the Free Mine?
//	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_01"); //Was hast du in der Freien Mine gesehen?
	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_01"); //Co jsi viděl ve Svobodném dole?
//	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_02"); //After I returned from the ruined monastery, I wanted to drop by at Okyl's, the boss of the Free Mine.
//	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_02"); //Nachdem ich von der Klosterruine zurückkam, wollte ich einen Abstecher zu Okyl, dem Boss der Freien Mine, machen.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_02"); //Když jsem se vrátil z rozbořeného kláštera, chtěl jsem se zastavit u Okyla, šéfa Svobodného dolu.
//	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_03"); //But when I arrived, there were corpses lying everywhere.
//	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_03"); //Doch als ich ankam, lagen überall Leichen herum.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_03"); //Když jsem ale přišel, všude se povalovaly mrtvoly.
//	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_04"); //I just spotted some guards entrenching themselves at the entrance to the mine.
//	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_04"); //Ich konnte gerade noch sehen, wie sich einige Gardisten im Mineneingang verschanzten.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_04"); //Zahlédl jsem akorát několik strážců, kteří se opevnili u vchodu do dolu.
//	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_05"); //How could so many mercenaries be defeated by only two dozen guards?
//	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_05"); //Wie konnten so viele Söldner zwei Dutzend Gardisten unterliegen?
	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_05"); //Jak mohly jen dva tucty stráží porazit tolik žoldáků?
//	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_06"); //It looked like an ambush to me. Nobody would have expected attackers to cross the mountains.
//	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_06"); //Sah mir sehr nach einem Angriff aus dem Hinterhalt aus! Niemand hätte erwartet, dass Angreifer über die Berge kommen würden.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_06"); //Připadalo mi to jako léčka. Nikdo nečekal, že by útočníci přišli přes hory.
//	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_07"); //The element of surprise can multiply the force of a troop.
//	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_07"); //Das Überraschungsmoment kann die Stärke einer Truppe vervielfachen.
	//#Needs_Attention: neprebasnime?
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_07"); //Prvek překvapení může mnohonásobně zvýšit sílu bojovníka.
};

//---------------------------------------------------------------------
// Info GUARDNC
//---------------------------------------------------------------------
instance Info_Gorn_GUARDNC(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_GUARDNC_Condition;
	information = Info_Gorn_GUARDNC_Info;
	important = 0;
	permanent = 0;
//	description = "What have you got planned now?";
//	description = "Was hast du jetzt vor?";
	description = "Co máš teď v plánu?";
};

func int Info_Gorn_GUARDNC_Condition()
{
	if Npc_KnowsInfo(hero,Info_Saturas_AMBUSH)
	{
		return TRUE;
	};
};

func void Info_Gorn_GUARDNC_Info()
{
//	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_01"); //What have you got planned now?
//	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_01"); //Was hast du jetzt vor?
	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_01"); //Co máš teď v plánu?
//	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_02"); //Our entire defense strategy will have to be changed. That takes time.
//	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_02"); //Die gesamte Verteidigung unseres Lagers muss nun umgestellt werden. Das braucht Zeit.
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_02"); //Celá naše obranná strategie se musí změnit. To zabere nějaký čas.
//	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_03"); //Until Lee and his people are ready, I'll join Cord's provisional guard.
//	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_03"); //Bis Lee und seine Leute so weit sind, werde ich mich erst mal Cords provisorischen Wachposten anschließen.
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_03"); //Dokud Lee a jeho lidé nebudou připraveni, přidám se ke Cordově provizorní stráži.
//	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_04"); //Are you planning a counterattack?
//	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_04"); //Plant ihr einen Gegenschlag?
	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_04"); //Chystáš protiútok?
//	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_05"); //Not yet, but the day will come.
//	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_05"); //Noch nicht, aber der Tag wird kommen!
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_05"); //Zatím ne, ale ten den přijde.
//	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_06"); //If ever you're looking for me, start here and walk towards the mine. I'll be on guard there.
//	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_06"); //Wenn du mich suchst, gehe von hier in Richtung Mine. Dort werde ich meinen Posten beziehen.
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_06"); //Jestli mě někdy budeš hledat, jdi odtud směrem k dolu. Budu tam na stráži.

	B_Story_CordsPost();

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info GUARDNCRUNNING
//---------------------------------------------------------------------
instance Info_Gorn_GUARDNCRUNNING(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_GUARDNCRUNNING_Condition;
	information = Info_Gorn_GUARDNCRUNNING_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie ist die Lage?";
	description = "Jak to jde?";
};

func int Info_Gorn_GUARDNCRUNNING_Condition()
{
	if Npc_KnowsInfo(hero,Info_Gorn_GUARDNC)
	&& !UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};
};

func void Info_Gorn_GUARDNCRUNNING_Info()
{
//	AI_Output(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //How's it going?
//	AI_Output(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //Wie ist die Lage?
	AI_Output(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //Jak to jde?
//	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Everything's quiet. Nothing's moving in the Free Mine.
//	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Alles ruhig. In der Freien Mine rührt sich nichts.
	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Všude klid. Ve Svobodném dole se nic neděje.
//	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee is still busy organizing our defense!
//	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee ist noch damit beschäftigt, unsere Verteidigung zu organisieren!
	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee je pořád zaneprázdněný organizací naší obrany.
};

//---------------------------------------------------------------------
// Info POST
//---------------------------------------------------------------------
instance Info_Gorn_POST(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_POST_Condition;
	information = Info_Gorn_POST_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_POST_Condition()
{
	if (UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func void Info_Gorn_POST_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Gorn_POST_09_01"); //You're just in time! We're preparing our counterattack.
//	AI_Output(self,hero,"Info_Gorn_POST_09_01"); //Du kommst gerade richtig! Wir bereiten uns auf den Gegenschlag vor.
	AI_Output(self,hero,"Info_Gorn_POST_09_01"); //Jdeš právě včas. Připravujeme protiútok.
//	AI_Output(self,hero,"Info_Gorn_POST_09_02"); //Taking back the Free Mine is the first step.
//	AI_Output(self,hero,"Info_Gorn_POST_09_02"); //Die Rückeroberung der Freien Mine ist der erste Schritt!
	AI_Output(self,hero,"Info_Gorn_POST_09_02"); //V první fázi převezmeme zpět Svobodný důl.
};

//---------------------------------------------------------------------
// Info TAKEBACK
//---------------------------------------------------------------------
instance Info_Gorn_TAKEBACK(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_TAKEBACK_Condition;
	information = Info_Gorn_TAKEBACK_Info;
	important = 0;
	permanent = 0;
//	description = "You're planning to retake it with just four men?";
//	description = "Eine Rückeroberung mit vier Mann? Wo sind all die anderen Söldner?";
	description = "Plánuješ jeho převzetí jenom se čtyřmi muži? Kde jsou ostatní žoldáci?";
};

func int Info_Gorn_TAKEBACK_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_POST))
	{
		return TRUE;
	};
};

func void Info_Gorn_TAKEBACK_Info()
{
//	AI_Output(hero,self,"Info_Gorn_TAKEBACK_15_01"); //You're planning to retake it with just four men? Where are all the mercenaries?
//	AI_Output(hero,self,"Info_Gorn_TAKEBACK_15_01"); //Eine Rückeroberung mit vier Mann? Wo sind all die anderen Söldner?
	AI_Output(hero,self,"Info_Gorn_TAKEBACK_15_01"); //Plánuješ jeho převzetí jenom se čtyřmi muži? Kde jsou ostatní žoldáci?
//	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_02"); //A frontal attack is no good! Gomez' people are too well entrenched for that!
//	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_02"); //Ein frontaler Angriff bringt nichts! Dafür sind Gomez' Leute zu gut verschanzt!
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_02"); //Čelní útok není dobrý! Gomezovi lidé jsou na to příliš dobře opevnění!
//	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_03"); //But we could run a stealth mission, eliminating one man after another - that could work.
//	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_03"); //Aber eine verdeckte Operation, bei der wir Mann für Mann ausschalten, könnte gelingen!
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_03"); //Mohli bysme ale zahájit tajnou misi a likvidovat jednoho muže po druhém - to by mohlo fungovat.
//	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_04"); //Lee asked me to give you a message.
//	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_04"); //Lee bat mich, dir etwas auszurichten.
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_04"); //Lee mě požádal, abych ti předal zprávu.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if (guild == GIL_SLD)
	{
//		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_05"); //As one of our best mercenaries, you have been chosen to carry out this mission.
//		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_05"); //Als einer unserer besten Söldner wurdest du bestimmt, die Operation durchzuführen!
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_05"); //Jako jeden z našich nejlepších žoldáků jsi byl vybrán, abys vykonal tuhle misi.
	}
	else if (guild == GIL_KDW)
	{
//		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_06"); //As a Magician of the Circle of Water and an experienced fighter, you have been chosen to carry out this mission.
//		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_06"); //Als Wassermagier mit sehr viel Kampferfahrung wurdest du bestimmt, die Operation durchzuführen!
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_06"); //Jako mág Kruhu vody a zkušený bojovník jsi byl vybrán, abys vykonal tuhle misi.
	}
	else if (guild == GIL_ORG)
	{
//		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_07"); //As one of our best rogues, you have been chosen to carry out this mission!
//		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_07"); //Als einer unserer besten Banditen wurdest du bestimmt, die Operation durchzuführen!
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_07"); //Jako jeden z nejlepších banditů jsi byl vybrán, abys vykonal tuhle misi.
	}
	else
	{
//		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_08"); //Although you aren't one of us, you have done our camp a great service and proved your worth more than once.
//		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_08"); //Obwohl du nicht zu uns gehörst, hast du unserem Lager schon große Dienste erwiesen und dich mehr als bewährt.
		//#Needs_Attention: kvalita hmmm
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_08"); //I když nejsi jedním z nás, vykonal jsi pro náš tábor velikou službu a vícekrát jsi dokázal svou kvalitu.
//		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_09"); //We're offering you the chance of carrying out this mission!
//		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_09"); //Wir bieten dir die Durchführung der Operation an!
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_09"); //Nabízíme ti příležitost, abys vykonal tuhle misi.
	};
//	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_10"); //I'll go with you. Together we can make it!
//	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_10"); //Ich werde mit dir gehen. Gemeinsam können wir es schaffen!
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_10"); //Půjdu s tebou. Dohromady se nám to podaří!
};

//---------------------------------------------------------------------
// Info SECOND
//---------------------------------------------------------------------
instance Info_Gorn_SECOND(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_SECOND_Condition;
	information = Info_Gorn_SECOND_Info;
	important = 0;
	permanent = 0;
//	description = "The first step? What will be the second?";
//	description = "Der erste Schritt? Was wird denn der zweite sein?";
	description = "První fáze? Co bude druhá?";
};

func int Info_Gorn_SECOND_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_POST))
	{
		return TRUE;
	};
};

func void Info_Gorn_SECOND_Info()
{
//	AI_Output(hero,self,"Info_Gorn_SECOND_15_01"); //The first step? What will be the second?
//	AI_Output(hero,self,"Info_Gorn_SECOND_15_01"); //Der erste Schritt? Was wird denn der Zweite sein?
	AI_Output(hero,self,"Info_Gorn_SECOND_15_01"); //První fáze? Co bude druhá?
//	AI_Output(self,hero,"Info_Gorn_SECOND_09_02"); //As soon as the mine is ours again, we'll start looking for the mountain pass that Gomez' people used in the raid!
//	AI_Output(self,hero,"Info_Gorn_SECOND_09_02"); //Sobald die Mine wieder in unserem Besitz ist, werden wir den Pass über die Berge suchen, den Gomez' Leute für den Überfall benutzt haben!
	AI_Output(self,hero,"Info_Gorn_SECOND_09_02"); //Jakmile bude důl zase náš, začneme hledat horský průsmyk, který použili Gomezovi lidé, aby se sem dostali!
//	AI_Output(self,hero,"Info_Gorn_SECOND_09_03"); //When the pass is closed, the situation will be under control again.
//	AI_Output(self,hero,"Info_Gorn_SECOND_09_03"); //Wenn der Pass dicht gemacht wurde, haben wir die Situation wieder im Griff.
	AI_Output(self,hero,"Info_Gorn_SECOND_09_03"); //Když bude ten průsmyk uzavřený, situace bude zase pod kontrolou.
//	AI_Output(hero,self,"Info_Gorn_SECOND_15_04"); //I see.
//	AI_Output(hero,self,"Info_Gorn_SECOND_15_04"); //Verstehe.
	AI_Output(hero,self,"Info_Gorn_SECOND_15_04"); //Aha.
};

//---------------------------------------------------------------------
// Info WHYME
//---------------------------------------------------------------------
instance Info_Gorn_WHYME(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_WHYME_Condition;
	information = Info_Gorn_WHYME_Info;
	important = 0;
	permanent = 0;
//	description = "Why me, of all people?";
//	description = "Warum gerade ich?";
	description = "Proč právě já?";
};

func int Info_Gorn_WHYME_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func void Info_Gorn_WHYME_Info()
{
//	AI_Output(hero,self,"Info_Gorn_WHYME_15_01"); //Why me, of all people?
//	AI_Output(hero,self,"Info_Gorn_WHYME_15_01"); //Warum gerade ich?
	AI_Output(hero,self,"Info_Gorn_WHYME_15_01"); //Proč právě já?
//	AI_Output(self,hero,"Info_Gorn_WHYME_09_02"); //You've already proved more than once that you can be brave and clever at the same time!
//	AI_Output(self,hero,"Info_Gorn_WHYME_09_02"); //Du hast schon mehrmals bewiesen, dass du Mut hast und gleichzeitig denken kannst!
	AI_Output(self,hero,"Info_Gorn_WHYME_09_02"); //Už jsi vícekrát dokázal, že jsi současně odvážný i chytrý!
//	AI_Output(self,hero,"Info_Gorn_WHYME_09_03"); //Besides, you know the Old Camp and the guards better than most of us.
//	AI_Output(self,hero,"Info_Gorn_WHYME_09_03"); //Außerdem kennst du das Alte Lager und die Gardisten besser als die meisten von uns.
	AI_Output(self,hero,"Info_Gorn_WHYME_09_03"); //A kromě toho znáš Starý tábor a jeho stráže lépe než kdokoliv z nás.
//	AI_Output(self,hero,"Info_Gorn_WHYME_09_04"); //You are the best man for this difficult job!
//	AI_Output(self,hero,"Info_Gorn_WHYME_09_04"); //Du bist der beste Mann für diesen schwierigen Job!
	AI_Output(self,hero,"Info_Gorn_WHYME_09_04"); //Pro tenhle úkol jsi nejlepší muž!
};

//---------------------------------------------------------------------
// Info KICKBUTT
//---------------------------------------------------------------------
instance Info_Gorn_KICKBUTT(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_KICKBUTT_Condition;
	information = Info_Gorn_KICKBUTT_Info;
	important = 0;
	permanent = 0;
//	description = "Okay, let's go and teach the unwelcome guests in the mine a lesson!";
//	description = "Lass uns den ungebetenen Gästen in der Mine kräftig in den Hintern treten!";
	description = "Dobrá, tak pojďme dát našim nevítaným hostům do dolu pořádnou lekci!";
};

func int Info_Gorn_KICKBUTT_Condition()
{
	if  Npc_KnowsInfo(hero,Info_Gorn_WHYME)
	&& !Npc_KnowsInfo(hero,Info_Gorn_MYWAY)
	{
		return TRUE;
	};
};

func void Info_Gorn_KICKBUTT_Info()
{
//	AI_Output(hero,self,"Info_Gorn_KICKBUTT_15_01"); //Okay, let's go and teach the unwelcome guests in the mine a lesson!
//	AI_Output(hero,self,"Info_Gorn_KICKBUTT_15_01"); //Okay, lass uns den ungebetenen Gästen in der Mine kräftig in den Hintern treten!
	AI_Output(hero,self,"Info_Gorn_KICKBUTT_15_01"); //Dobrá, tak pojďme dát našim nevítaným hostům do dolu pořádnou lekci!
//	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_02"); //I didn't expect you to say anything else!
//	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_02"); //Nichts anderes habe ich von dir erwartet!
	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_02"); //Nečekal jsem, že řekneš něco jiného!
//	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_03"); //Here, take this key. It opens the gatehouse in front of the entrance to the mine.
//	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_03"); //Hier, nimm diesen Schlüssel. Er öffnet das Torhaus vor dem Eingang der Mine.
	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_03"); //Tady je klíč. Je od vrátnice před vstupem do dolu.

	B_Story_GornJoins();
};

//---------------------------------------------------------------------
// Info MYWAY
//---------------------------------------------------------------------
instance Info_Gorn_MYWAY(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_MYWAY_Condition;
	information = Info_Gorn_MYWAY_Info;
	important = 0;
	permanent = 0;
//	description = "Why not. I need to get into the mine anyway!";
//	description = "Warum nicht. Ich muss ohnehin in die Mine!";
	description = "Proč ne. Potřebuju se stejně dostat do dolu!";
};

func int Info_Gorn_MYWAY_Condition()
{
	if  Npc_KnowsInfo(hero,Info_Gorn_WHYME)
	&& !Npc_KnowsInfo(hero,Info_Gorn_KICKBUTT)
	{
		return TRUE;
	};
};

func void Info_Gorn_MYWAY_Info()
{
//	AI_Output(hero,self,"Info_Gorn_MYWAY_15_01"); //Why not. I need to get into the mine anyway!
//	AI_Output(hero,self,"Info_Gorn_MYWAY_15_01"); //Warum nicht. Ich muss ohnehin in die Mine!
	AI_Output(hero,self,"Info_Gorn_MYWAY_15_01"); //Proč ne. Potřebuju se stejně dostat do dolu!
//	AI_Output(self,hero,"Info_Gorn_MYWAY_09_02"); //Whatever YOUR reasons may be, I'm glad we're dealing with this thing together!
//	AI_Output(self,hero,"Info_Gorn_MYWAY_09_02"); //Was immer auch DEINE Gründe sein mögen, ich bin froh, dass wir diese Sache gemeinsam erledigen!
	AI_Output(self,hero,"Info_Gorn_MYWAY_09_02"); //Ať už máš k tomu jakýkoliv důvod, jsem rád, že jsme se v téhle věci spolu dohodli!
//	AI_Output(self,hero,"Info_Gorn_MYWAY_09_03"); //Here, take this key. It opens the gatehouse in front of the entrance to the mine.
//	AI_Output(self,hero,"Info_Gorn_MYWAY_09_03"); //Hier, nimm diesen Schlüssel. Er öffnet das Torhaus vor dem Eingang der Mine.
	AI_Output(self,hero,"Info_Gorn_MYWAY_09_03"); //Tady je klíč. Je od vrátnice před vstupem do dolu.

	B_Story_GornJoins();
};

//---------------------------------------------------------------------
// Info WOLF
//---------------------------------------------------------------------
instance Info_Gorn_WOLF(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_WOLF_Condition;
	information = Info_Gorn_WOLF_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_WOLF_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero,"OW_PATH_076")<500)
	{
		return TRUE;
	};
};

func void Info_Gorn_WOLF_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Gorn_WOLF_09_01"); //Oh, I nearly forgot!
//	AI_Output(self,hero,"Info_Gorn_WOLF_09_01"); //Fast hätte ich es vergessen!
	AI_Output(self,hero,"Info_Gorn_WOLF_09_01"); //Och, málem jsem zapomněl!
//	AI_Output(self,hero,"Info_Gorn_WOLF_09_02"); //The rogue Wolf wants to talk to you urgently before we leave for the mine.
//	AI_Output(self,hero,"Info_Gorn_WOLF_09_02"); //Der Bandit Wolf will dich unbedingt sprechen, bevor wir zur Mine aufbrechen!
	AI_Output(self,hero,"Info_Gorn_WOLF_09_02"); //Bandita Wolf chce s tebou nutně mluvit, ještě než odejdeš do dolu.

	Info_ClearChoices(Info_Gorn_WOLF);

//	Info_AddChoice(Info_Gorn_WOLF, "He can wait, we have more important things to do.", Info_Gorn_WOLF_FM);
//	Info_AddChoice(Info_Gorn_WOLF, "Er kann warten, wir haben jetzt wichtigeres zu tun!", Info_Gorn_WOLF_FM);
	Info_AddChoice(Info_Gorn_WOLF, "Může počkat, máme na práci důležitější věci.",Info_Gorn_WOLF_FM);

//	Info_AddChoice(Info_Gorn_WOLF, "Then I'd better go there now.", Info_Gorn_WOLF_WOLF);
//	Info_AddChoice(Info_Gorn_WOLF, "Dann werde ihn besser noch vorher aufsuchen!", Info_Gorn_WOLF_WOLF);
	Info_AddChoice(Info_Gorn_WOLF, "Pak tam raději půjdu hned.",Info_Gorn_WOLF_WOLF);

//	B_LogEntry(CH4_UluMulu,"Wolf, the rogue, wants to speak to me again before we make our way to the mine. I'm to look in on him.");
//	B_LogEntry(CH4_UluMulu,"Wolf der Bandit will mich unbedingt nochmal sprechen, bevor wir zur Mine aufbrechen. Ich sollte bei ihm vorbeischauen.");
	B_LogEntry(CH4_UluMulu,"Bandita Wolf se mnou chce mluvit ještě předtím, než se vydáme na cestu do dolu. Půjdu ho navštívit.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM()
{
//	AI_Output(hero,self,"Info_Gorn_WOLF_15_04"); //He can wait, we have more important things to do.
//	AI_Output(hero,self,"Info_Gorn_WOLF_15_04"); //Er kann warten, wir haben jetzt Wichtigeres zu tun!
	AI_Output(hero,self,"Info_Gorn_WOLF_15_04"); //Může počkat, máme na práci důležitější věci.
//	AI_Output(self,hero,"Info_Gorn_WOLF_09_05"); //Whatever you say!
//	AI_Output(self,hero,"Info_Gorn_WOLF_09_05"); //Wie du meinst!
	AI_Output(self,hero,"Info_Gorn_WOLF_09_05"); //Jak říkáš!
	AI_StopProcessInfos(self);
};

func void Info_Gorn_WOLF_WOLF()
{
//	AI_Output(hero,self,"Info_Gorn_WOLF_15_06"); //Then I'd better go there now.
//	AI_Output(hero,self,"Info_Gorn_WOLF_15_06"); //Dann werde ich ihn besser noch vorher aufsuchen!
	AI_Output(hero,self,"Info_Gorn_WOLF_15_06"); //Pak tam raději půjdu hned.
//	AI_Output(self,hero,"Info_Gorn_WOLF_09_07"); //You do that. I'll wait for you right here.
//	AI_Output(self,hero,"Info_Gorn_WOLF_09_07"); //Tu das. Ich warte hier am Wachposten auf dich!
	AI_Output(self,hero,"Info_Gorn_WOLF_09_07"); //Udělej to. Počkám na tebe tady u strážnice.

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"GuardNC");
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info LEAVEFORPOST
//---------------------------------------------------------------------
instance Info_Gorn_LEAVEFORPOST(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_LEAVEFORPOST_Condition;
	information = Info_Gorn_LEAVEFORPOST_Info;
	important = 1;
	permanent = 1;
};

func int Info_Gorn_LEAVEFORPOST_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero,"OW_PATH_074")<2000)
	&& (FreemineOrc_LookingUlumulu != LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc(self,hero);

	if (Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
//		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Looks like you do want to speak to Wolf!
//		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Du scheinst doch noch mit Wolf sprechen zu wollen!
		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Vypadá to, že chceš mluvit s Wolfem!
	}
	else
	{
//		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_02"); //This is the wrong direction! We have to go to the mine!
//		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_02"); //Du läufst in die falsche Richtung! Wir müssen zur Mine!
		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_02"); //Běžíš špatným směrem! Musíme jít k dolu!
	};
//	AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_03"); //I'll wait for you at the provisional guardpost!
//	AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Ich warte am provisorischen Wachposten auf dich!
	AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Počkám na tebe u provizorní strážnice!

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"GuardNC");
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info REJOINFORFM
//---------------------------------------------------------------------
instance Info_Gorn_REJOINFORFM(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_REJOINFORFM_Condition;
	information = Info_Gorn_REJOINFORFM_Info;
	important = 0;
	permanent = 1;
//	description = "Let's set out for the mine!";
//	description = "Es kann losgehen! Auf zur Mine!";
	description = "Pojďme k dolu!";
};

func int Info_Gorn_REJOINFORFM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Gorn_MYWAY) || Npc_KnowsInfo(hero,Info_Gorn_KICKBUTT))
	&& (Npc_GetDistToWP(hero,"OW_PATH_075_GUARD4")<1000)
	&& (!Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func void Info_Gorn_REJOINFORFM_Info()
{
//	AI_Output(hero,self,"Info_Gorn_REJOINFORFM_15_01"); //Let's set out for the mine!
//	AI_Output(hero,self,"Info_Gorn_REJOINFORFM_15_01"); //Es kann losgehen! Auf zur Mine!
	AI_Output(hero,self,"Info_Gorn_REJOINFORFM_15_01"); //Pojďme k dolu!
//	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_02"); //It's time to drive the guards out of there!
//	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_02"); //Höchste Zeit, dass wir die Gardisten von dort vertreiben!
	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_02"); //Nejvyšší čas vyhnat odtud stráže!
//	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_03"); //You go on ahead, I'll follow!
//	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_03"); //Geh du vor, ich folge dir!
	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_03"); //Jdi napřed, půjdu za tebou!

	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FollowToFMC");
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info RAZOR
//---------------------------------------------------------------------
instance Info_Gorn_RAZOR(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RAZOR_Condition;
	information = Info_Gorn_RAZOR_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RAZOR_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero,"OW_PATH_3000")<1000)
	{
		return TRUE;
	};
};

func void Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Gorn_RAZOR_09_01"); //WATCH OUT, RAZORS!!!
//	AI_Output(self,hero,"Info_Gorn_RAZOR_09_01"); //VORSICHT, RAZORS!!!
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_01"); //POZOR, BŘITVY!!!
//	AI_Output(self,hero,"Info_Gorn_RAZOR_09_02"); //They hunt in packs like snappers, but they bite much harder!
//	AI_Output(self,hero,"Info_Gorn_RAZOR_09_02"); //Die arbeiten genauso in Rudeln wie die Snapper, nur dass sie viel heftiger zubeißen!
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_02"); //Loví ve smečkách jako chňapavci, ale koušou daleko hůř!
//	AI_Output(self,hero,"Info_Gorn_RAZOR_09_03"); //We should do away with them. You know me, I like to know what's at my back.
//	AI_Output(self,hero,"Info_Gorn_RAZOR_09_03"); //Wir sollten sie aus dem Weg räumen! Du weißt ja, ich habe gerne einen freien Rücken!
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_03"); //Měli bychom je sprovodit ze světa. Znáš mě, mám rád, když vím, co mám za zády.

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info FMCENTRANCE
//---------------------------------------------------------------------
instance Info_Gorn_FMCENTRANCE(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FMCENTRANCE_Condition;
	information = Info_Gorn_FMCENTRANCE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_FMCENTRANCE_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero,"FMC_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func void Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_01"); //Hold on, do you see all these corpses?
//	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_01"); //Warte mal, siehst du all die Leichen hier?
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_01"); //Zadrž, vidíš všechny ty mrtvoly?
//	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_02"); //You go down to the entrance to the mine, I'll stay here and make sure that we don't get a nasty surprise thrown at us from behind.
//	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_02"); //Geh du runter zum Mineneingang, ich bleib' erst mal hier oben und stelle sicher, dass es keine Überraschung von hinten gibt.
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_02"); //Jdi ke vchodu do dolu, já zůstanu tady a ohlídám, abychom nebyli zezadu nemile zaskočeni.
//	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_03"); //When you're down there, I'll follow.
//	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_03"); //Wenn du unten bist, komme ich nach.
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_03"); //Až budeš dole, příjdu za tebou.

	Npc_ExchangeRoutine(self,"WaitFMC");
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info FMGATE
//---------------------------------------------------------------------
instance Info_Gorn_FMGATE(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FMGATE_Condition;
	information = Info_Gorn_FMGATE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_FMGATE_Condition()
{
	if Gorn_JoinedForFM
	&& !FM_GateOpen
	&& (Npc_GetDistToWP(hero,"FMC_FM_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func void Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Gorn_FMGATE_09_01"); //I heard you fighting and went after you immediately.
//	AI_Output(self,hero,"Info_Gorn_FMGATE_09_01"); //Ich hörte dich kämpfen, da bin ich sofort hinterher.
	AI_Output(self,hero,"Info_Gorn_FMGATE_09_01"); //Slyšel jsem, jak bojuješ, a tak jsem za tebou ihned vyrazil.
//	AI_Output(hero,self,"Info_Gorn_FMGATE_15_02"); //An old acquaintance... But that account is settled.
//	AI_Output(hero,self,"Info_Gorn_FMGATE_15_02"); //Ein alter Bekannter ... aber die Rechnung ist beglichen.
	AI_Output(hero,self,"Info_Gorn_FMGATE_15_02"); //Starý známý... Ale účet je srovnaný!
//	AI_Output(self,hero,"Info_Gorn_FMGATE_09_03"); //Good, open the gate, I'll watch out.
//	AI_Output(self,hero,"Info_Gorn_FMGATE_09_03"); //Gut, öffne du das Tor, ich pass' hier auf!
	AI_Output(self,hero,"Info_Gorn_FMGATE_09_03"); //Dobrá, otevři ta vrata, já budu hlídat.

	Npc_ExchangeRoutine(self,"WaitFM");
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info AFTERFM
//---------------------------------------------------------------------
instance Info_Gorn_AFTERFM(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_AFTERFM_Condition;
	information = Info_Gorn_AFTERFM_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_AFTERFM_Condition()
{
	if FreemineOrc_LookingUlumulu
	{
		return TRUE;
	};
};

func void Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_01"); //Oh, man. That was a really tough fight.
//	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_01"); //Oh, Mann. Das war ein wirklich beinharter Kampf.
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_01"); //Ach, člověče. To byl opravdu tvrdý boj.
//	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_02"); //I'd never have thought Gomez' guards would offer that much resistance.
//	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_02"); //Hätte nicht gedacht, dass Gomez' Gardisten so viel Widerstand leisten.
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_02"); //Nikdy bych si nebyl pomyslel, že by Gomezovy stráže dokázaly klást takový odpor.
//	AI_Output(hero,self,"Info_Gorn_AFTERFM_15_03"); //The main thing is that we've driven them out of our mine again.
//	AI_Output(hero,self,"Info_Gorn_AFTERFM_15_03"); //Die Hauptsache ist, dass wir sie wieder aus unserer Mine vertrieben haben!
	AI_Output(hero,self,"Info_Gorn_AFTERFM_15_03"); //Hlavní je, že jsme je vyhnali z našeho dolu.
//	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_04"); //I'll stay here and make sure it stays that way!
//	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_04"); //Ich werde hier bleiben und dafür sorgen, dass das auch so bleibt!
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_04"); //Já tu zůstanu a postarám se o to, aby to tak zůstalo!

	B_Story_LeftFM();

	Lee_freeminereport = 1;  //jetzt kann der SC Lee über die befreite Mine informieren.     ***Björn***

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info FMWATCH
//---------------------------------------------------------------------
instance Info_Gorn_FMWATCH(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FMWATCH_Condition;
	information = Info_Gorn_FMWATCH_Info;
	important = 0;
	permanent = 1;
//	description = "How's the situation?";
//	description = "Wie ist die Lage?";
	description = "Jaká je situace?";
};

func int Info_Gorn_FMWATCH_Condition()
{
	if Npc_KnowsInfo(hero,Info_Gorn_AFTERFM)
	{
		return TRUE;
	};
};

func void Info_Gorn_FMWATCH_Info()
{
//	AI_Output(hero,self,"Info_Gorn_FMWATCH_15_01"); //How's the situation?
//	AI_Output(hero,self,"Info_Gorn_FMWATCH_15_01"); //Wie ist die Lage?
	AI_Output(hero,self,"Info_Gorn_FMWATCH_15_01"); //Jaká je situace?
//	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_02"); //Everything's quiet. Nothing moving in the Free Mine.
//	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_02"); //Alles ruhig. In der Freien Mine rührt sich nichts.
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_02"); //Všude klid. Ve Svobodném dole se nic neděje.
//	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_03"); //It can't be long now till Lee sends reinforcements up here.
//	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_03"); //Es kann nicht mehr lange dauern, bis Lee die Verstärkung hier hoch schickt.
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_03"); //Nemůže dlouho trvat, než sem dorazí posily, které vyslal Lee.
//	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_04"); //I'll just make myself at home until then.
//	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_04"); //So lange werde ich es mir hier gemütlich machen.
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_04"); //Do té doby bych se tu měl uvelebit.
};

//---------------------------------------------------------------------
// Info FOUNDULUMULU
//---------------------------------------------------------------------
instance Info_Gorn_FOUNDULUMULU(C_INFO)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FOUNDULUMULU_Condition;
	information = Info_Gorn_FOUNDULUMULU_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_FOUNDULUMULU_Condition()
{
	if (FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_01"); //That's an interesting Orc standard you have there.
//	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_01"); //Eine interessante Ork-Standarte, die du da hast.
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_01"); //To je zajímavá skřetí standarta, co tady máš.
//	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_02"); //Is that from the former Orc slave in the mine?
//	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_02"); //Stammt sie von dem befreiten Ork-Sklaven in der Mine?
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_02"); //Patřila tomu skřetímu otrokovi z dolu?
//	AI_Output(hero,self,"Info_Gorn_FOUNDULUMULU_15_03"); //It's an Orcish symbol for friendship. I want to enter the Orc town with it.
//	AI_Output(hero,self,"Info_Gorn_FOUNDULUMULU_15_03"); //Es ist ein orkisches Symbol für Freundschaft. Ich will damit die Stadt der Orks betreten.
	AI_Output(hero,self,"Info_Gorn_FOUNDULUMULU_15_03"); //Je to skřetí symbol přátelství. Chci s ním jít do skřetího města.
//	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_04"); //I hope for your sake that the Orcs will respect this... THING!
//	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Ich hoffe für dich, die Orks respektieren dieses ... ETWAS!
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Doufám, že budeš mít štěstí a že budou skřeti respektovat tuhle... VĚC!

	B_Kapitelwechsel (5);

	AI_StopProcessInfos(self);
};

