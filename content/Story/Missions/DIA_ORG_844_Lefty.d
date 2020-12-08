// **************************************
// EXIT 
// **************************************

instance DIA_Lefty_Exit(C_INFO)
{
	npc = Org_844_Lefty;
	nr = 999;
	condition = DIA_Lefty_Exit_Condition;
	information = DIA_Lefty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Lefty_Exit_Condition()
{
	return 1;
};

func void DIA_Lefty_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************
// First At Night
// **************************************

instance DIA_Lefty_FirstAtNight(C_INFO)
{
	npc = Org_844_Lefty;
	nr = 1;
	condition = DIA_Lefty_FirstAtNight_Condition;
	information = DIA_Lefty_FirstAtNight_Info;
	permanent = 0;
//	description = "What are you doing here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};                       

func int DIA_Lefty_FirstAtNight_Condition()
{
	if (Wld_IsTime(19,00,08,00))
	&& (!Npc_KnowsInfo(hero,DIA_Lefty_First))
	{
		return 1;
	};
};

func void DIA_Lefty_FirstAtNight_Info()
{
//	AI_Output(other,self,"DIA_Aidan_Hello_15_00"); //What are you doing here?
//	AI_Output(other,self,"DIA_Aidan_Hello_15_00"); //Was machst du hier?
	AI_Output(other,self,"DIA_Aidan_Hello_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_846_Hello_07_01"); //I'm working for the Rice Lord.
//	AI_Output(self,other,"DIA_846_Hello_07_01"); //Ich arbeite für den Reislord.
	AI_Output(self,other,"DIA_846_Hello_07_01"); //Pracuju pro Rýžového Lorda.
//	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00"); //Have you got work for me?
//	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00"); //Hast du Arbeit für mich?
	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00"); //Máš pro mě nějakou práci?
//	AI_Output(self,other,"DIA_Shrike_GetLost_07_01"); //I'll talk to you later!
//	AI_Output(self,other,"DIA_Shrike_GetLost_07_01"); //Wir sprechen uns noch!
	AI_Output(self,other,"DIA_Shrike_GetLost_07_01"); //Ještě si popovídáme!
	AI_StopProcessInfos(self);
};

// **************************************
// First
// **************************************

instance DIA_Lefty_First(C_INFO)
{
	npc = Org_844_Lefty;
	nr = 1;
	condition = DIA_Lefty_First_Condition;
	information = DIA_Lefty_First_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_Lefty_First_Condition()
{
	if (Wld_IsTime(08,00,19,00))
	&& (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	{
		return 1;
	};
};

func void DIA_Lefty_First_Info()
{
//	AI_Output(self,other,"DIA_Lefty_First_07_00"); //Hey! Just arrived? We need somebody to take some water to the peasants in the rice fields.
//	AI_Output(self,other,"DIA_Lefty_First_07_00"); //Hey, du! Neu hier, was? Auf den Reisfeldern brauchen wir noch jemanden, der den Bauern Wasser bringt.
	AI_Output(self,other,"DIA_Lefty_First_07_00"); //Hej! Ty jsi právě přišel? Potřebujeme někoho, kdo by nosil vodu rolníkům na rýžová pole.
//	AI_Output(self,other,"DIA_Lefty_First_07_01"); //This way you can make friends with a few people. What do you think?
//	AI_Output(self,other,"DIA_Lefty_First_07_01"); //Da kannst du dir direkt ein paar Freunde machen. Was denkst du?
	AI_Output(self,other,"DIA_Lefty_First_07_01"); //Takhle můžeš s některými lidmi navázat přátelství. Tak co říkáš?

	Log_CreateTopic(CH1_CarryWater,LOG_MISSION);
	Log_SetTopicStatus(CH1_CarryWater,LOG_RUNNING);
//	B_LogEntry(CH1_CarryWater,"Lefty, a rogue from the New Camp who is really full of himself,wants me to take water to the peasants in the rice fields.");
//	B_LogEntry(CH1_CarryWater,"Lefty, ein ziemlich großkotziger Bandit aus dem neuen Lager will, dass ich den Bauern auf den Reisfeldern Wasser bringe.");
	B_LogEntry(CH1_CarryWater,"Lefty, otravný bandita z Nového tábora, po mně chce, abych nosil rolníkům na pole vodu.");

	Info_ClearChoices(DIA_Lefty_First);
//	Info_AddChoice(DIA_Lefty_First,"Maybe later.",DIA_Lefty_First_Later);
//	Info_AddChoice(DIA_Lefty_First,""Vielleicht später."				",DIA_Lefty_First_Later);
	Info_AddChoice(DIA_Lefty_First,"Možná později.",DIA_Lefty_First_Later);
//	Info_AddChoice(DIA_Lefty_First,"Take the water to the peasants yourself!",DIA_Lefty_First_Never);
//	Info_AddChoice(DIA_Lefty_First,""Bring dein Wasser selbst rum!"	",DIA_Lefty_First_Never);
	Info_AddChoice(DIA_Lefty_First,"Dones tu vodu rolníkům sám!",DIA_Lefty_First_Never);
//	Info_AddChoice(DIA_Lefty_First,"Sure, I'll be glad to help.",DIA_Lefty_First_Yes);
//	Info_AddChoice(DIA_Lefty_First,""Klar, ich helfe gerne."			",DIA_Lefty_First_Yes);
	Info_AddChoice(DIA_Lefty_First,"Jistě, rád pomůžu.",DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
//	AI_Output(other,self,"DIA_Lefty_First_Yes_15_00"); //Sure, I'll be glad to help.
//	AI_Output(other,self,"DIA_Lefty_First_Yes_15_00"); //Klar, ich helfe gern.
	AI_Output(other,self,"DIA_Lefty_First_Yes_15_00"); //Jistě, rád pomůžu.
//	AI_Output(self,other,"DIA_Lefty_First_Yes_07_01"); //Great! Go to the Rice Lord. He'll give you the water and tell you everything you need to know. 
//	AI_Output(self,other,"DIA_Lefty_First_Yes_07_01"); //Gut! Geh zum Reislord. Er gibt dir das Wasser und erzählt dir alles andere.
	AI_Output(self,other,"DIA_Lefty_First_Yes_07_01"); //Výborně! Jdi za Rýžovým Lordem. Dá ti vodu a řekne všechno, co je potřeba udělat.
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
//	B_LogEntry(CH1_CarryWater,"Although it's probably quite a stupid task, I agreed, because maybe I can make some friends there. I have to get the water from the so-called Rice Lord.");
//	B_LogEntry(CH1_CarryWater,"Lefty, ein ziemlich großkotziger Bandit aus dem neuen Lager will, dass ich den Bauern auf den Reisfeldern Wasser bringe.");
	B_LogEntry(CH1_CarryWater,"Lefty, otravný bandita z Nového tábora, po mně chce, abych nosil rolníkům na pole vodu.");

	Info_ClearChoices(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
//	AI_Output(other,self,"DIA_Lefty_First_Never_15_00"); //Take the water to the peasants yourself!
//	AI_Output(other,self,"DIA_Lefty_First_Never_15_00"); //Bring dein Wasser selbst rum!
	AI_Output(other,self,"DIA_Lefty_First_Never_15_00"); //Dones tu vodu rolníkům sám!
//	AI_Output(self,other,"DIA_Lefty_First_Never_07_01"); //That's no good way of treating friends! I think I'll have to teach you some manners!
//	AI_Output(self,other,"DIA_Lefty_First_Never_07_01"); //So geht man aber nicht mit Freunden um! Ich glaube, ich muss dir mal Manieren beibringen!
	AI_Output(self,other,"DIA_Lefty_First_Never_07_01"); //To není dobrý způsob, jak navazovat přátelství!  Budu tě muset naučit slušnému chování!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
//	B_LogEntry(CH1_CarryWater,"When I turned down Lefty's 'offer', he got quite unpleasant! And I thought the Old Camp was a rough place!");
//	B_LogEntry(CH1_CarryWater,"Obwohl es vermutlich eine stupide Aufgabe ist, habe ich zugesagt, um mir vielleicht ein paar Freunde zu machen. Das zu verteilende Wasser soll ich vom sogenannten 'Reislord' abholen.");
	B_LogEntry(CH1_CarryWater,"Přestože to je dosti stupidní úkol, přijal jsem to, protože si tam možná najdu nějaké přátele. Musím si vyzvednout vodu od takzvaného Rýžového lorda.");

	Info_ClearChoices(DIA_Lefty_First);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
//	AI_Output(other,self,"DIA_Lefty_First_Later_15_00"); //Maybe later.
//	AI_Output(other,self,"DIA_Lefty_First_Later_15_00"); //Vielleicht später.
	AI_Output(other,self,"DIA_Lefty_First_Later_15_00"); //Možná později.
//	AI_Output(self,other,"DIA_Lefty_First_Later_07_01"); //But I won't need anybody later. I need your help right NOW. Do you want to help me or not?
//	AI_Output(self,other,"DIA_Lefty_First_Later_07_01"); //Später brauche ich aber niemanden. Ich brauche JETZT Hilfe.  Willst du mir nun helfen oder nicht?
	AI_Output(self,other,"DIA_Lefty_First_Later_07_01"); //Později už nebudu nikoho potřebovat. Potřebuju tvou pomoc teď HNED. Chceš mi pomoci nebo ne?
};

// **************************************
// Every Day
// **************************************
var int CarriedWaterForLefty;
// **************************************

instance DIA_Lefty_WorkDay(C_INFO)
{
	npc = Org_844_Lefty;
	nr = 1;
	condition = DIA_Lefty_WorkDay_Condition;
	information = DIA_Lefty_WorkDay_Info;
	permanent = 1;
	important = 1;
};                       

func int DIA_Lefty_WorkDay_Condition()
{
	if (Wld_IsTime(08,00,19,00) || (Lefty_Mission == LOG_SUCCESS)) // wenn Wasser verteilt, dann auch abends am Lagerfeuer!
	&& (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	&& ((Lefty_WorkDay <= Wld_GetDay()-1) || (Lefty_Mission == LOG_SUCCESS)) // wenn Wasser verteilt, dann auch noch am selben Tag! 
	{
		return 1;
	};
};

func void DIA_Lefty_WorkDay_Info()
{
//	AI_Output(self,other,"DIA_Lefty_WorkDay_07_00"); //Hey, you!
//	AI_Output(self,other,"DIA_Lefty_WorkDay_07_00"); //Hey, du!
	AI_Output(self,other,"DIA_Lefty_WorkDay_07_00"); //Hej, ty!

	if (Lefty_Mission == LOG_FAILED)
	{
//		AI_Output(self,other,"DIA_Lefty_WorkDay_NextChance_07_00"); //You're in luck! I'll give you a second chance.
//		AI_Output(self,other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Du hast Glück! Du bekommst eine neue Chance.
		AI_Output(self,other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Máš štěstí! Dám ti druhou příležitost.
//		AI_Output(self,other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Try not to mess it up this time! Well, go to the Rice Lord and then take water to all the peasants. Got it?
//		AI_Output(self,other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Diesmal solltest du's nicht vermasseln! Also: Du gehst zum Reislord und dann bringst du schön brav allen Bauern ihr Wasser, klar?
		AI_Output(self,other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Zkus to tentokrát nezkazit! Dobrá, jdi za Rýžovým Lordem a pak roznes vodu všem rolníkům. Jasný?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
//		B_LogEntry(CH1_CarryWater,"I met Lefty again! He wants me to go to the Rice Lord and get the water for the peasants on the rice fields.");
//		B_LogEntry(CH1_CarryWater,"Als ich Leftys 'Angebot' ablehnte, wurde er ziemlich ungehalten! Und ich dachte schon, das Alte Lager ist ein rauher Ort.");
		B_LogEntry(CH1_CarryWater,"Když jsem Leftyho 'nabídku' odmítl, tvářil se hodně naštvaně! A já si myslel, jaké je Starý tábor drsné místo!");

		AI_StopProcessInfos(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
//		AI_Output(self,other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //I told you to take some water to the peasants!
//		AI_Output(self,other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Ich habe dir doch gesagt, du sollst den Bauern Wasser bringen!
		AI_Output(self,other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Řekl jsem ti, abys zanesl vodu rolníkům!
//		AI_Output(self,other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //I don't like people who make promises and then don't keep them!
//		AI_Output(self,other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Ich mag es nicht, wenn man mir Sachen verspricht und sie dann nicht hält!
		AI_Output(self,other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Nemám rád lidi, kteří dávají sliby a pak je neplní!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
//		B_LogEntry(CH1_CarryWater,"Lefty was really mad that I hadn't distributed the water yet! Looks like I might get some fun out of that guy yet.");
//		B_LogEntry(CH1_CarryWater,"Schon wieder bin ich Lefty über den Weg gelaufen! Er will, dass ich jetzt endlich zum Reislord gehe und das Wasser für die Verteilung an die Bauern auf den Reisfeldern abhole.");
		B_LogEntry(CH1_CarryWater,"Znovu jsem se setkal s Leftym! Chce po mně, abych šel k Rýžovému lordovi vyzvednout vodu pro rolníky na polích.");

		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
//		AI_Output(self,other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Well done! You're useful for something after all.
//		AI_Output(self,other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Gut gemacht! Du bist ja zu was zu gebrauchen.
		AI_Output(self,other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Dobrá práce! Přece jen jsi k něčemu užitečný.
//		AI_Output(self,other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //I think this is exactly the right task for you. From now on, you'll do it every day. Go on with it right now.
//		AI_Output(self,other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Ich denke, das ist genau die richtige Aufgabe für dich. Du wirst das ab jetzt jeden Tag tun. Fang direkt wieder damit an
		AI_Output(self,other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Myslím, že to je úkol právě pro tebe. Od teďka to budeš dělat každý den. Tak a teď pokračuj.
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if !CarriedWaterForLefty
		{
//			B_LogEntry(CH1_CarryWater,"I don't believe it. After I distributed the water everywhere, Lefty really wants me to do the water carrying every day. I think this idiot needs to be told a few things.");
//			B_LogEntry(CH1_CarryWater,"Lefty war stinksauer darüber, dass ich das Wasser noch nicht verteilt haben! Das kann ja noch heiter werden mit diesem Burschen.");
			B_LogEntry(CH1_CarryWater,"Lefty byl doopravdy na padnutí, že jsem ještě neroznesl vodu! Jako bych si z toho čipery střílel. ");
			B_GiveXP(XP_LeftyCarriedWater);
			CarriedWaterForLefty = TRUE;
		};

		AI_StopProcessInfos(self);
	};
};

// **************************************
// NICHT MEHR
// **************************************

instance DIA_Lefty_NeverAgain(C_INFO)
{
	npc = Org_844_Lefty;
	nr = 1;
	condition = DIA_Lefty_NeverAgain_Condition;
	information = DIA_Lefty_NeverAgain_Info;
	permanent = 1;
//	description = "From now on you can carry the water yourself.";
//	description = "Du kannst dein Wasser ab jetzt selbst bringen.";
	description = "Od teďka si můžeš tu vodu nosit sám.";
};                       

func int DIA_Lefty_NeverAgain_Condition()
{
	if ((Lefty_Mission == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE))
	{
		return 1;
	};
};

func void DIA_Lefty_NeverAgain_Info()
{
//	AI_Output(other,self,"DIA_Lefty_NeverAgain_15_00"); //From now on you can carry the water yourself.
//	AI_Output(other,self,"DIA_Lefty_NeverAgain_15_00"); //Du kannst dein Wasser ab jetzt selbst bringen.
	AI_Output(other,self,"DIA_Lefty_NeverAgain_15_00"); //Od teďka si můžeš tu vodu nosit sám.
//	AI_Output(self,other,"DIA_Lefty_NeverAgain_07_01"); //Oh? Have you got better plans?
//	AI_Output(self,other,"DIA_Lefty_NeverAgain_07_01"); //Ach? Hast du was Besseres vor?
	AI_Output(self,other,"DIA_Lefty_NeverAgain_07_01"); //Ale? Máš něco lepšího?
//	AI_Output(self,other,"DIA_Lefty_NeverAgain_07_02"); //I think I'll have to remind you who's the boss!
//	AI_Output(self,other,"DIA_Lefty_NeverAgain_07_02"); //Ich glaube, ich muss dich noch einmal daran erinnern, wer hier der Boss ist!
	AI_Output(self,other,"DIA_Lefty_NeverAgain_07_02"); //Myslím, že je čas ti připomenout, kdo je tady šéf!

	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK, 1, "");
}; 

// **************************************
// PERM
// **************************************
var int LeftyWasBeaten;
// **************************************
instance DIA_Lefty_PERM(C_INFO)
{
	npc = Org_844_Lefty;
	nr = 1;
	condition = DIA_Lefty_PERM_Condition;
	information = DIA_Lefty_PERM_Info;
	permanent = 1;
//	description = "How are you, my friend?";
//	description = "Na, mein Freund?";
	description = "Jak se máš, příteli?";
};                       

func int DIA_Lefty_PERM_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) 
	{
		return 1;
	};
};

func void DIA_Lefty_PERM_Info()
{
//	AI_Output(other,self,"DIA_Lefty_PERM_15_00"); //How are you, my friend?
//	AI_Output(other,self,"DIA_Lefty_PERM_15_00"); //Na, mein Freund?
	AI_Output(other,self,"DIA_Lefty_PERM_15_00"); //Jak se máš, příteli?
//	AI_Output(self,other,"DIA_Lefty_PERM_07_01"); //Oh, man! What do you want?
//	AI_Output(self,other,"DIA_Lefty_PERM_07_01"); //Mann! Was willst du?
	AI_Output(self,other,"DIA_Lefty_PERM_07_01"); //Ach, člověče! Co chceš?

	if !LeftyWasBeaten
	{
//		B_LogEntry(CH1_CarryWater,"I made it clear to Lefty that he'd better not annoy me with his water carrying theories. Some people only learn through pain.");
//		B_LogEntry(CH1_CarryWater,"Ich fasse es nicht. Nachdem ich das Wasser überall verteilt habe, will Lefty doch tatsächlich, dass ich nun jeden Tag den Wasserträger spiele. Ich glaube dieser Idiot muss mal seine Grenzen aufgezeigt bekommen.");
		B_LogEntry(CH1_CarryWater,"Nemůžu tomu uvěřit. Potom, co jsem všude roznesl vodu, Lefty snad vážně chce, abych to dělal každý den. Mám pocit, že tomu idiotovi budu muset pár věcí vysvětlit.");
		Log_SetTopicStatus(CH1_CarryWater,LOG_SUCCESS);
		B_GiveXP(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};

	Info_ClearChoices(DIA_Lefty_PERM);
//	Info_AddChoice(DIA_Lefty_PERM,"Just wanted to see how you are.",DIA_Lefty_PERM_Nothing);
//	Info_AddChoice(DIA_Lefty_PERM,""Wollte nur mal sehen, wie's dir geht."												",DIA_Lefty_PERM_Nothing);
	Info_AddChoice(DIA_Lefty_PERM,"Jen jsem chtěl vědět, jak se máš.",DIA_Lefty_PERM_Nothing);
//	Info_AddChoice(DIA_Lefty_PERM,"The peasants look thirsty.",DIA_Lefty_PERM_Durstig);
//	Info_AddChoice(DIA_Lefty_PERM,""Die Bauern sehen durstig aus."														",DIA_Lefty_PERM_Durstig);
	Info_AddChoice(DIA_Lefty_PERM,"Rolníci vypadají žíznivě.",DIA_Lefty_PERM_Durstig);
//	Info_AddChoice(DIA_Lefty_PERM,"I've had a really bad day. I want to relieve my tension - hold still...",DIA_Lefty_PERM_AufsMaul);
//	Info_AddChoice(DIA_Lefty_PERM,""Ich hatte nen schlechten Tag und suche einen Ausgleich... Halt mal still."	",DIA_Lefty_PERM_AufsMaul);
	Info_AddChoice(DIA_Lefty_PERM,"Měl jsem vážně zlej den. Radím ti, abys mě neprovokoval a zůstal raději zticha.",DIA_Lefty_PERM_AufsMaul);

}; 

func void DIA_Lefty_PERM_AufsMaul()
{
//	AI_Output(other,self,"DIA_Lefty_PERM_AufsMaul_15_00"); //I've had a really bad day and I'm looking for a way to relieve my tension... just stay like that for a minute.
//	AI_Output(other,self,"DIA_Lefty_PERM_AufsMaul_15_00"); //Ich hatte 'nen schlechten Tag und suche ein bisschen Ausgleich ... Halt mal still.
	AI_Output(other,self,"DIA_Lefty_PERM_AufsMaul_15_00"); //Měl jsem opravdu špatný den a hledám způsob, jak uvolnit napětí... jen takhle ještě chvilku stůj.
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices(DIA_Lefty_PERM);
	AI_StopProcessInfos(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
//	AI_Output(other,self,"DIA_Lefty_PERM_Durstig_15_00"); //The peasants look thirsty.
//	AI_Output(other,self,"DIA_Lefty_PERM_Durstig_15_00"); //Die Bauern sehen durstig aus.
	AI_Output(other,self,"DIA_Lefty_PERM_Durstig_15_00"); //Rolníci vypadají žíznivě.
//	AI_Output(self,other,"DIA_Lefty_PERM_Durstig_07_01"); //I'll see to it... don't worry.
//	AI_Output(self,other,"DIA_Lefty_PERM_Durstig_07_01"); //Ich kümmere mich drum ... Mach dir keine Sorgen.
	AI_Output(self,other,"DIA_Lefty_PERM_Durstig_07_01"); //Dohlédnu na to... bez starosti.
	AI_StopProcessInfos(self);
};

func void DIA_Lefty_PERM_Nothing()
{
//	AI_Output(other,self,"DIA_Lefty_PERM_Nothing_15_00"); //Just wanted to see how you are.
//	AI_Output(other,self,"DIA_Lefty_PERM_Nothing_15_00"); //Wollte nur mal sehen, wie's dir geht.
	AI_Output(other,self,"DIA_Lefty_PERM_Nothing_15_00"); //Jen jsem chtěl vědět, jak se máš.
	AI_StopProcessInfos(self);
};

