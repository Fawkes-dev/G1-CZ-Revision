// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kharim_Exit(C_INFO)
{
	npc = Sld_729_Kharim;
	nr = 999;
	condition = Info_Kharim_Exit_Condition;
	information = Info_Kharim_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Info_Kharim_Exit_Condition()
{
	return 1;
};

func void Info_Kharim_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kharim_What(C_INFO)
{
	npc = Sld_729_Kharim;
	nr = 1;
	condition = Info_Kharim_What_Condition;
	information = Info_Kharim_What_Info;
	permanent = 0;
//	description = "I'm new here. Who are you?";
//	description = "Ich bin neu hier. Wer bist du?";
	description = "Jsem tady nový. Kdo jsi?";
};                       

func int Info_Kharim_What_Condition()
{
	return 1;
};

func void Info_Kharim_What_Info()
{
//	AI_Output(other,self,"Info_Kharim_What_15_00"); //I'm new here. Who are you?
//	AI_Output(other,self,"Info_Kharim_What_15_00"); //Ich bin neu hier. Wer bist du?
	AI_Output(other,self,"Info_Kharim_What_15_00"); //Jsem tady nový. Kdo jsi ty?
//	AI_Output(self,other,"Info_Kharim_What_09_01"); //I'm Kharim! You must have just been booted in here - or else you'd have heard of me!
//	AI_Output(self,other,"Info_Kharim_What_09_01"); //Ich bin Kharim! Du bist wohl wirklich gerade erst reingeworfen worden - sonst hättest du schon von mir gehört!
	AI_Output(self,other,"Info_Kharim_What_09_01"); //Já jsem Kharim! Ty tady musíš být úplně nový - jinak bys už o mně slyšel!
//	AI_Output(self,other,"Info_Kharim_What_09_02"); //I'm the best fighter this damned camp has ever seen.
//	AI_Output(self,other,"Info_Kharim_What_09_02"); //Ich bin der beste Kämpfer, den dieses dreckige Lager je gesehen hat.
	AI_Output(self,other,"Info_Kharim_What_09_02"); //Jsem nejlepší bojovník, jakého kdy tenhle zpropadený tábor viděl.
};

// **************************************
//				Fordern
// **************************************
	var int Kharim_Charged;
// **************************************

instance Info_Kharim_Charge(C_INFO)
{
	npc = Sld_729_Kharim;
	nr = 2;
	condition = Info_Kharim_Charge_Condition;
	information = Info_Kharim_Charge_Info;
	permanent = 1;
//	description = "I'll challenge you! Let's go to the arena!";
//	description = "Ich fordere dich heraus! Lass es uns in der Arena austragen!";
	description = "Vyzývám tě na souboj! Pojďme do arény!";
};                       

func int Info_Kharim_Charge_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Kapitel <= 1)) // Kapitelfix ***Björn***
	{
		return 1;
	};
};

func void Info_Kharim_Charge_Info()
{
//	AI_Output(other,self,"Info_Kharim_Charge_15_00"); //I'll challenge you! Let's go to the arena!
//	AI_Output(other,self,"Info_Kharim_Charge_15_00"); //Ich fordere dich heraus! Lass es uns in der Arena austragen!
	AI_Output(other,self,"Info_Kharim_Charge_15_00"); //Vyzvu tě na souboj! Pojďme do arény!
//	AI_Output(self,other,"Info_Kharim_Charge_09_01"); //YOU?! I'll have you for breakfast, kid!
//	AI_Output(self,other,"Info_Kharim_Charge_09_01"); //DU?! Ich fress' dich zum Frühstück, Kleiner!
	AI_Output(self,other,"Info_Kharim_Charge_09_01"); //TY?! Dám si tě k snídani, mazánku!
//	AI_Output(self,other,"Info_Kharim_Charge_09_02"); //Do yourself a favor and get lost!
//	AI_Output(self,other,"Info_Kharim_Charge_09_02"); //Tu dir selber einen Gefallen und mach, dass du wegkommst!
	AI_Output(self,other,"Info_Kharim_Charge_09_02"); //Udělej si pro sebe laskavost a ztrať se!

	Info_ClearChoices(Info_Kharim_Charge);
//	Info_AddChoice(Info_Kharim_Charge,"Okay, okay, let's forget about it.",Info_Kharim_Charge_BACK);
//	Info_AddChoice(Info_Kharim_Charge,"Okay, okay, vergessen wir die Sache.",Info_Kharim_Charge_BACK);
	Info_AddChoice(Info_Kharim_Charge,"Dobře, dobře, zapomeneme na to!",Info_Kharim_Charge_BACK);
//	Info_AddChoice(Info_Kharim_Charge,"So you don't get hurt, you coward?!",Info_Kharim_Charge_Insult);
//	Info_AddChoice(Info_Kharim_Charge,"Damit du ungeschoren davonkommst, du feiges Schwein?!",Info_Kharim_Charge_Insult);
	Info_AddChoice(Info_Kharim_Charge,"Ne tak zhurta, ty zbabělče?!",Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
//	AI_Output(other,self,"Info_Kharim_Charge_BACK_15_00"); //Okay, okay, let's forget about it.
//	AI_Output(other,self,"Info_Kharim_Charge_BACK_15_00"); //Okay, okay, vergessen wir die Sache.
	AI_Output(other,self,"Info_Kharim_Charge_BACK_15_00"); //Dobře, dobře, zapomeneme na to!

	AI_StopProcessInfos(self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
//	AI_Output(other,self,"Info_Kharim_Charge_Insult_15_00"); //So you don't get hurt, you coward?!
//	AI_Output(other,self,"Info_Kharim_Charge_Insult_15_00"); //Damit du ungeschoren davonkommst, du feiges Schwein?!
	AI_Output(other,self,"Info_Kharim_Charge_Insult_15_00"); //Ne tak zhurta, ty zbabělče?!
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_09_01"); //Don't you have any better ideas, boy?
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_09_01"); //Fällt dir nichts besseres ein, Kleiner?
	AI_Output(self,other,"Info_Kharim_Charge_Insult_09_01"); //Nemáš žádný lepší nápad, chlapečku?

	Info_ClearChoices(Info_Kharim_Charge);
//	Info_AddChoice(Info_Kharim_Charge,"You're only here to get a chance to kiss Gomez' ass!",Info_Kharim_Charge_Insult_GomezAss);
//	Info_AddChoice(Info_Kharim_Charge,"Du bist doch nur hier, um Gomez in den Arsch zu kriechen!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice(Info_Kharim_Charge,"Jsi tady akorát proto, abys dostal příležitost políbit Gomezovi zadek!",Info_Kharim_Charge_Insult_GomezAss);
//	Info_AddChoice(Info_Kharim_Charge,"How about: Your mother's a sheep-shagging...",Info_Kharim_Charge_Insult_Goats);
//	Info_AddChoice(Info_Kharim_Charge,"Wie wär's mit: Deine Mutter treibt's mit Ziegen...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice(Info_Kharim_Charge,"Jako třeba: tvoje matka obcuje s každým...",Info_Kharim_Charge_Insult_Goats);
//	Info_AddChoice(Info_Kharim_Charge,"No, there's nothing I can think of you'd actually understand.",Info_Kharim_Charge_Insult_Stupid);
//	Info_AddChoice(Info_Kharim_Charge,"Nein, mir fällt nichts ein, das du begreifen würdest.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice(Info_Kharim_Charge,"Tak se nad tím zamysli: ne, není co si rozmýšlet, jestli jsi to pochopil.",Info_Kharim_Charge_Insult_Stupid);
//	Info_AddChoice(Info_Kharim_Charge,"You've got thin arms, but then I saw your ugly mug.",Info_Kharim_Charge_Insult_Face);
//	Info_AddChoice(Info_Kharim_Charge,"Deine dürren Ärmchen sind nichts gegen deine häßliche Visage.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice(Info_Kharim_Charge,"Máš tenký paže, ale pak jsem uviděl tvůj hnusný ciferník.",Info_Kharim_Charge_Insult_Face);
//	Info_AddChoice(Info_Kharim_Charge,"Okay, okay, let's forget about it.",Info_Kharim_Charge_BACK);
//	Info_AddChoice(Info_Kharim_Charge,"Okay, okay, vergessen wir die Sache.",Info_Kharim_Charge_BACK);
	Info_AddChoice(Info_Kharim_Charge,"Dobře, dobře, zapomeneme na to!",Info_Kharim_Charge_BACK);

};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
//	AI_Output(other,self,"Info_Kharim_Charge_Insult_Goats_15_00"); //How about: Your mother's a sheep-shagging...
//	AI_Output(other,self,"Info_Kharim_Charge_Insult_Goats_15_00"); //Wie wär's mit: Deine Mutter treibt's mit Ziegen ...
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Goats_15_00"); //Jako třeba: tvoje matka obcuje s každým...
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Yeah, I guess she is...
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Das tut sie vermutlich wirklich ...
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Jasně, tušil jsem to...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
//	AI_Output(other,self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //You're only here to get a chance to kiss Gomez' ass!
//	AI_Output(other,self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //Du bist doch nur hier, damit du mal 'ne Chance bekommst, Gomez in den Arsch zu kriechen!
	AI_Output(other,self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //Jsi tady akorát proto, abys dostal příležitost políbit Gomezovi zadek!
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //WHAT!?! You worm! You know nothing about us! The New Camp is INDEPENDENT from all that shit!
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //WAS!?! Du Wurm! Du weißt gar nichts über uns! Das Neue Lager ist UNABHÄNGIG von dieser ganzen Scheiße!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //COŽE?! Ty červe! Nic o nás nevíš! Nový tábor je NEZÁVISLÝ na všem tady!
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //And apart from that there's only one reason why I'm here: So I can beat the brains out of smart asses like you.
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //Und im Übrigen gibt es nur einen Grund, warum ich hier bin: Damit ich Klugscheißern wie dir das Hirn aus dem Schädel prügeln kann.
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //A kromě toho mám jediný důvod, proč tady jsem: abych mohl vyrazit mozek z takovejch oslů, jako seš ty.
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //It'll be my pleasure to do the same to YOU! Your destiny is awaiting you in the arena!
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //Es wird mir ein Vergnügen sein, das bei DIR zu tun! Dein Schicksal erwartet dich in der Arena!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //Bude mi potěšením udělat to samý TOBĚ! Tvůj osud tě čeká v aréně!

	Kharim_Charged = TRUE;

	Info_ClearChoices(Info_Kharim_Charge);
	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
//	AI_Output(other,self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Let's think about it: No, there's nothing I can think of you'd actually understand.
//	AI_Output(other,self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Lass mal überlegen: Nein, mir fällt nichts ein, was du begreifen würdest.
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Tak se nad tím zamysli: ne, není co si rozmýšlet, jestli jsi to pochopil.
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Maybe you should give it a try.
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Vielleicht solltest du es auf einen Versuch ankommen lassen.
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Možná by ses o to mohl pokusit.
};

func void Info_Kharim_Charge_Insult_Face()
{
//	AI_Output(other,self,"Info_Kharim_Charge_Insult_Face_15_00"); //At first I wanted to say something about your thin arms, but then I saw your ugly mug.
//	AI_Output(other,self,"Info_Kharim_Charge_Insult_Face_15_00"); //Ich wollte zuerst was über deine dürren Ärmchen sagen, aber dann fiel mir deine hässliche Fesse auf.
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Face_15_00"); //Zaprvé, chtěl jsem něco říci o tvých tenkých pažích, ale pak jsem uviděl tvůj hnusný ciferník.
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_Face_09_01"); //I think this is your last chance to finally GET LOST!
//	AI_Output(self,other,"Info_Kharim_Charge_Insult_Face_09_01"); //Ich denke, das ist deine letzte Chance, hier ENDLICH ZU VERSCHWINDEN!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Face_09_01"); //Myslím, že máš poslední šanci ihned ZMIZET!
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kharim_InArena(C_INFO)
{
	npc = Sld_729_Kharim;
	nr = 1;
	condition = Info_Kharim_InArena_Condition;
	information = Info_Kharim_InArena_Info;
	permanent = 0;
	important = 1;
};                       

func int Info_Kharim_InArena_Condition()
{
	if ((Kharim_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void Info_Kharim_InArena_Info()
{
	if (Kapitel <= 1) // Kapitelfix ***Björn***
	{
//		AI_Output(self,other,"Info_Kharim_InArena_09_00"); //Pain is a question of willpower!
//		AI_Output(self,other,"Info_Kharim_InArena_09_00"); //Schmerzen sind eine Frage des Willens!
		AI_Output(self,other,"Info_Kharim_InArena_09_00"); //Bolest je otázkou síly vůle!

		AI_StopProcessInfos(self);

		Npc_ExchangeRoutine(self,"START");

		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
//		AI_Output(self,other,"SVM_9_LetsForgetOurLittleFight"); //Von mir aus können wir unseren Streit vergessen ... 
//		AI_Output(self,other,"SVM_9_LetsForgetOurLittleFight"); //Von mir aus können wir unseren Streit vergessen ...
		AI_Output(self,other,"SVM_9_LetsForgetOurLittleFight"); //Raději bych na tohle malé nedorozumění zapomněl...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};

};
