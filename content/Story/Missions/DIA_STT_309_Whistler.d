// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_Whistler_Exit(C_INFO)
{
	npc = STT_309_Whistler;
	nr = 999;
	condition = DIA_Whistler_Exit_Condition;
	information = DIA_Whistler_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Whistler_Exit_Condition()
{
	return 1;
};

func void DIA_Whistler_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 					 Ich bin neu hier 
// **************************************************

instance DIA_Whistler_IAmNew(C_INFO)
{
	npc = STT_309_Whistler;
	nr = 1;
	condition = DIA_Whistler_IAmNew_Condition;
	information = DIA_Whistler_IAmNew_Info;
	permanent = 0;
//	description = "Hi! I'm new here!";
//	description = "Hi! Ich bin neu hier.";
	description = "Zdar! Jsem tu nový!";
};                       

func int DIA_Whistler_IAmNew_Condition()
{ 
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
func void DIA_Whistler_IAmNew_Info()
{
//	AI_Output(other,self,"DIA_Whistler_IAmNew_15_00"); //Hi! I'm new here!
//	AI_Output(other,self,"DIA_Whistler_IAmNew_15_00"); //Hi! Ich bin neu hier!
	AI_Output(other,self,"DIA_Whistler_IAmNew_15_00"); //Zdar! Jsem tady nový!
//	AI_Output(self,other,"DIA_Whistler_IAmNew_11_01"); //What do you want from me?
//	AI_Output(self,other,"DIA_Whistler_IAmNew_11_01"); //Was willst du von mir?
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_01"); //Co ode mě chceš?
//	AI_Output(other,self,"DIA_Whistler_IAmNew_15_02"); //I want to become one of you - I want to join the Camp.
//	AI_Output(other,self,"DIA_Whistler_IAmNew_15_02"); //Ich will einer von euch werden - ich will mich dem Lager anschließen.
	AI_Output(other,self,"DIA_Whistler_IAmNew_15_02"); //Chci se stát jedním z vás - chci se přidat k táboru.
//	AI_Output(self,other,"DIA_Whistler_IAmNew_11_03"); //Looking for people to support you, eh?
//	AI_Output(self,other,"DIA_Whistler_IAmNew_11_03"); //Auf der Suche nach Fürsprechern, was?
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_03"); //Hledáš lidi, kteří by ti pomohli, viď?
//	AI_Output(self,other,"DIA_Whistler_IAmNew_11_04"); //If you want me to have a word with Diego about you, you need to do me a favor.
//	AI_Output(self,other,"DIA_Whistler_IAmNew_11_04"); //Wenn ich ein gutes Wort bei Diego für dich einlegen soll, schuldest du mir einen Gefallen.
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_04"); //Jestli chceš, abych se za tebe přimluvil u Diega, musíš mi prokázat službičku.
};

// **************************************************
// 					 Welcher Gefallen
// **************************************************
	var int Whistler_BuyMySword;
	var int Whistler_BuyMySword_Day;
// **************************************************

instance DIA_Whistler_Favour(C_INFO)
{
	npc = STT_309_Whistler;
	nr = 1;
	condition = DIA_Whistler_Favour_Condition;
	information = DIA_Whistler_Favour_Info;
	permanent = 0;
//	description = "What kind of favor do you want?";
//	description = "Was ist das für ein Gefallen, den du von mir erwartest?";
	description = "Jakou službičku bys chtěl?";
};                       

func int DIA_Whistler_Favour_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Whistler_IAmNew))
	{
		return 1;
	};
};

func void DIA_Whistler_Favour_Info()
{
//	AI_Output(other,self,"DIA_Whistler_Favour_15_00"); //What kind of favor do you want?
//	AI_Output(other,self,"DIA_Whistler_Favour_15_00"); //Was ist das für ein Gefallen, den du von mir erwartest?
	AI_Output(other,self,"DIA_Whistler_Favour_15_00"); //Jakou službičku bys chtěl?
//	AI_Output(self,other,"DIA_Whistler_Favour_11_01"); //I want one of Fisk's weapons. He's one of the traders at the market place.
//	AI_Output(self,other,"DIA_Whistler_Favour_11_01"); //Ich will eine Waffe von Fisk haben. Er ist einer der Händler am Marktplatz.
	AI_Output(self,other,"DIA_Whistler_Favour_11_01"); //Chci jednu z Fiskových zbraní. Je to jeden obchodník z tržiště.
//	AI_Output(self,other,"DIA_Whistler_Favour_11_02"); //He won't sell it to me. It's a broadsword with ornaments.
//	AI_Output(self,other,"DIA_Whistler_Favour_11_02"); //Er will sie mir nicht mehr verkaufen. Es ist ein Breitschwert mit Ornamenten.
	AI_Output(self,other,"DIA_Whistler_Favour_11_02"); //Nechce mi ji prodat. Je to zdobený meč se širokou čepelí.
//	AI_Output(self,other,"DIA_Whistler_Favour_11_03"); //I'll give you 100 ore to collect the weapon for me. But don't tell him about me.
//	AI_Output(self,other,"DIA_Whistler_Favour_11_03"); //Ich gebe dir 100 Erz und du holst die Waffe für mich ab. Aber sag ihm nichts von mir, klar?
	AI_Output(self,other,"DIA_Whistler_Favour_11_03"); //Dám ti 100 nugetů, abys mi tu zbraň obstaral. O mně mu ale neříkej.

	Info_ClearChoices(DIA_Whistler_Favour);
//	Info_AddChoice(DIA_Whistler_Favour,"Okay, give me the 100 ore nuggets. I'll get the thing.",DIA_Whistler_Favour_Ok);
//	Info_AddChoice(DIA_Whistler_Favour,"Okay, her mit den 100 Erzbrocken. Ich hol das Ding.",DIA_Whistler_Favour_Ok);
	Info_AddChoice(DIA_Whistler_Favour,"Dobře, dej mi těch 100 magických nugetů. Dostanu tu věc.",DIA_Whistler_Favour_Ok);
//	Info_AddChoice(DIA_Whistler_Favour,"Did you ever consider that I might just run off with the ore...?",DIA_Whistler_Favour_OreAway);
//	Info_AddChoice(DIA_Whistler_Favour,"Hast du mal daran gedacht, dass ich mit dem Erz durchbrennen könnte...?",DIA_Whistler_Favour_OreAway);
	Info_AddChoice(DIA_Whistler_Favour,"Nenapadlo tě snad, že bych mohl s tou rudou utéct...?",DIA_Whistler_Favour_OreAway);
//	Info_AddChoice(DIA_Whistler_Favour,"Why won't he sell the weapon to you any more?",DIA_Whistler_Favour_WhyNotSell);
//	Info_AddChoice(DIA_Whistler_Favour,"Warum will er dir die Waffe nicht mehr verkaufen?",DIA_Whistler_Favour_WhyNotSell);
	Info_AddChoice(DIA_Whistler_Favour,"Proč ti tu zbraň nechce prodat?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
//	AI_Output(other,self,"DIA_Whistler_Favour_Ok_15_00"); //Okay, give me the 100 ore nuggets. I'll get the thing.
//	AI_Output(other,self,"DIA_Whistler_Favour_Ok_15_00"); //Okay, her mit den 100 Erzbrocken. Ich hol' das Ding.
	AI_Output(other,self,"DIA_Whistler_Favour_Ok_15_00"); //Dobře, dej mi těch 100 magických nugetů. Dostanu tu věc.
//	AI_Output(self,other,"DIA_Whistler_Favour_Ok_11_01"); //Here you go. Come straight back to me!
//	AI_Output(self,other,"DIA_Whistler_Favour_Ok_11_01"); //Hier hast du sie. Kommt direkt zu mir zurück!
	AI_Output(self,other,"DIA_Whistler_Favour_Ok_11_01"); //Tady jsi. Pojď hned sem!

	Whistler_BuyMySword = LOG_RUNNING;

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinOC,LOG_RUNNING);
	};
//	B_LogEntry(CH1_JoinOC,"Whistler will help me if I go to see Fisk at the market and buy him a sword. He's given me 100 ore.");
//	B_LogEntry(CH1_JoinOC,"Whistler unterstützt mich, wenn ich ihm bei Fisk auf dem Marktplatz ein Schwert kaufe. Er hat mir 100 Erz gegeben.");
	B_LogEntry(CH1_JoinOC,"Whistler mi pomůže, když půjdu na tržiště za Fistem a koupím pro něj meč. Dal mi na něj 100 nugetů.");

	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);

	CreateInvItems(self,itminugget, 100);
	B_GiveInvItems(self,hero,itminugget, 100);

	Whistler_BuyMySword_Day = Wld_GetDay();

	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
//	AI_Output(other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Did you ever consider that I might just run off with the ore...?
//	AI_Output(other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Hast du mal daran gedacht, dass ich einfach mit dem Erz durchbrennen könnte ...?
	AI_Output(other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Nenapadlo tě snad, že bych mohl s tou rudou utéct...?
//	AI_Output(self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Don't forget: The colony is small! If you run off with my ore, I'll find you!
//	AI_Output(self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Vergiss nicht: Die Kolonie ist klein! Wenn du mit dem Erz durchbrennst, finde ich dich!
	AI_Output(self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Nezapomeň: kolonie je malá! Jestli mi s tou rudou utečeš, najdu si tě!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
//	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Why won't he sell the weapon to you any more?
//	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Warum will er dir die Waffe nicht mehr verkaufen?
	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Proč ti tu zbraň nechce prodat?
//	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //We had a little argument.
//	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Wir hatten eine kleine Meinungsverschiedenheit.
	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Má k tomu malý důvod.
//	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //And?
//	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //Und?
	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //Jaký?
//	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //And that's all you need to know!
//	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //Und das ist alles, was du wissen musst!
	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //Tohle ti musí stačit!
};

// **************************************************
// 					 RUNNING 110
// **************************************************

instance DIA_Whistler_Running110(C_INFO)
{
	npc = STT_309_Whistler;
	nr = 4;
	condition = DIA_Whistler_Running110_Condition;
	information = DIA_Whistler_Running110_Info;
	permanent = 0;
//	description = "Fisk wants 110 ore for his sword now.";
//	description = "Fisk will jetzt 110 Erz für dein Schwert";
	description = "Fisk chce teď za tu zbraň 110 nugetů.";
};                       

func int DIA_Whistler_Running110_Condition()
{
	if ((Whistler_BuyMySword==LOG_RUNNING) && (Fisk_SCknows110 == TRUE))
	{
		return 1;
	};
};

func void DIA_Whistler_Running110_Info()
{
//	AI_Output(other,self,"DIA_Whistler_Running110_15_00"); //Fisk wants 110 ore for his sword now.
//	AI_Output(other,self,"DIA_Whistler_Running110_15_00"); //Fisk will jetzt 110 Erz für dein Schwert.
	AI_Output(other,self,"DIA_Whistler_Running110_15_00"); //Fisk chce teď za tu zbraň 110 nugetů.
//	AI_Output(self,other,"DIA_Whistler_Running110_11_01"); //And you want me to give you the 10 ore now...
//	AI_Output(self,other,"DIA_Whistler_Running110_11_01"); //Und ich soll dir jetzt noch 10 Erz geben ...
	AI_Output(self,other,"DIA_Whistler_Running110_11_01"); //A ty chceš, abych ti teď dal těch 10 nugetů...
//	AI_Output(other,self,"DIA_Whistler_Running110_15_02"); //I thought you wanted to have that sword.
//	AI_Output(other,self,"DIA_Whistler_Running110_15_02"); //Ich dachte, du legst Wert auf dein Schwert.
	AI_Output(other,self,"DIA_Whistler_Running110_15_02"); //Myslel jsem, že chceš ten meč.
//	AI_Output(self,other,"DIA_Whistler_Running110_11_03"); //Here, take it, and now hurry!
//	AI_Output(self,other,"DIA_Whistler_Running110_11_03"); //Hier, nimm, und jetzt beeil dich!
	AI_Output(self,other,"DIA_Whistler_Running110_11_03"); //Tady, vem si to a už spěchej!
	CreateInvItems(self,itminugget,10);
	B_GiveInvItems(self,hero,itminugget, 10);
}; 

// **************************************************
// 				RUNNING - PayBack
// **************************************************

instance DIA_Whistler_RunningPayBack(C_INFO)
{
	npc = STT_309_Whistler;
	nr = 5;
	condition = DIA_Whistler_RunningPayBack_Condition;
	information = DIA_Whistler_RunningPayBack_Info;
	permanent = 1;
//	description = "I can't get the sword - here's your 100 ore back.";
//	description = "Ich kriege das Schwert nicht - hier hast du deine 100 Erz zurück.";
	description = "Nedostal jsem ten meč - tady je tvých 100 nugetů zpátky.";
};                       

func int DIA_Whistler_RunningPayBack_Condition()
{
	if ((Whistler_BuyMySword==LOG_RUNNING))
	{
		return 1;
	};
};

func void DIA_Whistler_RunningPayBack_Info()
{
//	AI_Output(other,self,"DIA_Whistler_RunningPayBack_15_00"); //I can't get the sword - here's your 100 ore back.
//	AI_Output(other,self,"DIA_Whistler_RunningPayBack_15_00"); //Ich kriege das Schwert nicht - hier hast du deine 100 Erz zurück.
	AI_Output(other,self,"DIA_Whistler_RunningPayBack_15_00"); //Nedostal jsem ten meč - tady je tvých 100 nugetů zpátky.

	if (Npc_HasItems(other,itminugget) >= 100)
	{
//		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_01"); //You idiot! We don't need idiots like you here! Get lost!
//		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_01"); //Du Idiot! So 'ne Flasche wie dich können wir hier nicht gebrauchen! Zieh Leine!
		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_01"); //Ty idiote! Nepotřebujeme tu takové idioty! Ztrať se!
		B_GiveInvItems(hero,self,itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;

//		B_LogEntry(CH1_JoinOC,"I've messed it up, Whistler will never get his sword.");
//		B_LogEntry(CH1_JoinOC,"Ich habs vermasselt, Whistler kriegt sein Schwert nie.");
		B_LogEntry(CH1_JoinOC,"Nepochodil jsem, Whistler svůj meč už nikdy nedostane.");

		AI_StopProcessInfos(self);
	}
	else
	{
//		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_02"); //I don't see any 100 ore though - you'd better get them as fast as you can, else you'll be in trouble!
//		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_02"); //Ich sehe aber keine 100 Erz - du besorgst sie am besten, so schnell du kannst, sonst gibt's Ärger!
		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_02"); //Já ale nevidím žádných 100 nugetů - uděláš nejlíp, když odtud vypadneš, jak nejrychleji můžeš, jinak se dostaneš do maléru!
		AI_StopProcessInfos(self);
	};
}; 

// **************************************************
// 					 Too late
// **************************************************

instance DIA_Whistler_MySword_TooLate(C_INFO)
{
	npc = STT_309_Whistler;
	nr = 1;
	condition = DIA_Whistler_MySword_TooLate_Condition;
	information = DIA_Whistler_MySword_TooLate_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_Whistler_MySword_TooLate_Condition()
{
	if ((Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day<=(Wld_GetDay()-2)))
	{
		return 1;
	};
};

func void DIA_Whistler_MySword_TooLate_Info()
{
//	AI_Output(self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Here you are! Wanted to run off with my ore, eh? Come here, sonny!
//	AI_Output(self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Da bist du ja! Wolltest mit meinen Erz durchbrennen, was? Komm her, Bürschchen!
	AI_Output(self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Tady jsi! Chtěl jsi utéci s mojí rudou, ech? Pojď sem, synku!

	Whistler_BuyMySword = LOG_FAILED;

//	B_LogEntry(CH1_JoinOC,"I've messed it up. Whistler is really fed up with me.");
//	B_LogEntry(CH1_JoinOC,"Ich hab's vermasselt. Whistler ist ganz schön sauer auf mich.");
	B_LogEntry(CH1_JoinOC,"Nepochodil jsem, Whistler se na mě pořádně naštval.");

	AI_StopProcessInfos(self);

	Npc_SetPermAttitude(self,ATT_ANGRY);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK, 1, "");
};

// **************************************************
// 					Success
// **************************************************

instance DIA_Whistler_MySword_Success(C_INFO)
{
	npc = STT_309_Whistler;
	nr = 800;
	condition = DIA_Whistler_MySword_Success_Condition;
	information = DIA_Whistler_MySword_Success_Info;
	permanent = 1;
//	description = "I have your sword...";
//	description = "Ich hab' dein Schwert...";
	description = "Mám tvůj meč...";
};                       

func int DIA_Whistler_MySword_Success_Condition()
{
	if ((Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day>(Wld_GetDay()-2)) 
		&& (Npc_HasItems(other,Whistlers_Schwert)>=1))
	{
		return 1;
	};
};

func void DIA_Whistler_MySword_Success_Info()
{
//	AI_Output(other,self,"DIA_Whistler_MySword_Success_15_00"); //I have your sword...
//	AI_Output(other,self,"DIA_Whistler_MySword_Success_15_00"); //Ich hab' dein Schwert ...
	AI_Output(other,self,"DIA_Whistler_MySword_Success_15_00"); //Mám tvůj meč...

	B_GiveInvItems(other,self,Whistlers_Schwert,1);

//	AI_Output(self,other,"DIA_Whistler_MySword_Success_11_01"); //Wasn't too hard, was it. Whatever - you do me a favor and I'll do you one.
//	AI_Output(self,other,"DIA_Whistler_MySword_Success_11_01"); //War ja auch nicht wirklich schwierig. Wie auch immer - eine Hand wäscht die andere.
	AI_Output(self,other,"DIA_Whistler_MySword_Success_11_01"); //To nebylo tak těžké, že ne? Ale aťsi - prokázal jsi mi službu a já ti ji teď oplatím.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
//	AI_Output(self,other,"DIA_Whistler_MySword_Success_11_02"); //If Diego should ask after you, I'll speak in your favor. Until then - have a good time!
//	AI_Output(self,other,"DIA_Whistler_MySword_Success_11_02"); //Falls Diego mich nach dir fragt, ist dir meine Stimme sicher. Bis dahin - mach's gut!
	AI_Output(self,other,"DIA_Whistler_MySword_Success_11_02"); //Když se na tebe bude Diego ptát, budu mluvit v tvůj prospěch. Do té doby - měj se!

//	B_LogEntry(CH1_JoinOC,"Whistler was content when I gave him the sword he wanted. He'll recommend me to Diego.");
//	B_LogEntry(CH1_JoinOC,"Whistler war zufrieden, als ich ihm das gewünschte Schwert übergab. Er will sich bei Diego für mich einsetzen.");
	B_LogEntry(CH1_JoinOC,"Whistler byl spokojený, když jsem mu dal meč, o který žádal. Doporučil mě Diegovi.");
	}
	else
	{
//	B_LogEntry(CH1_JoinOC,"Whistler was content when I gave him the sword he wanted. Unfortunately, there's nothing in it for me, because I can't become a Shadow any more.");
//	B_LogEntry(CH1_JoinOC,"Whistler war zufrieden, als ich ihm das gewünschte Schwert übergab.Leider nützt mir das nicht viel, denn Schatten kann ich nicht mehr werden.");
	B_LogEntry(CH1_JoinOC,"Whistler byl spokojený, když jsem mu dal meč, o který žádal. Bohužel z toho nic nebudu mít, protože už se nikdy nebudu moci stát Stínem.");
	};
	Whistler_BuyMySword = LOG_SUCCESS;
	B_GiveXP(XP_Whistlerssword);

	AI_StopProcessInfos(self);
};

// **************************************************
// 			STANDARD - Kap 1 nach SUCCESS
// **************************************************

instance DIA_Whistler_StandardKap1(C_INFO)
{
	npc = STT_309_Whistler;
	nr = 800;
	condition = DIA_Whistler_StandardKap1_Condition;
	information = DIA_Whistler_StandardKap1_Info;
	permanent = 1;
//	description = "How's it going...";
//	description = "Wie sieht's aus...";
	description = "Jak to jde...";
};                       

func int DIA_Whistler_StandardKap1_Condition()
{
	if ( Whistler_BuyMySword == LOG_SUCCESS )
	{
		return 1;
	};
};

func void DIA_Whistler_StandardKap1_Info()
{
//	AI_Output(other,self,"DIA_Whistler_StandardKap1_15_00"); //How's it going...
//	AI_Output(other,self,"DIA_Whistler_StandardKap1_15_00"); //Wie sieht's aus ...
	AI_Output(other,self,"DIA_Whistler_StandardKap1_15_00"); //Jak to jde...
//	AI_Output(self,other,"DIA_Whistler_StandardKap1_11_01"); //Good! You've done me a favor, I'll do you one. I'll tell Diego that you're a reliable man.
//	AI_Output(self,other,"DIA_Whistler_StandardKap1_11_01"); //Gut! Du hast mir einen Gefallen getan, ich tue dir einen. Ich werd Diego erzählen, dass du ein zuverlässiger Mann bist.
	AI_Output(self,other,"DIA_Whistler_StandardKap1_11_01"); //Výborně! Prokázal jsi mi službu a já ti ji teď oplatím. Řeknu Diegovi, že jsi spolehlivý muž.
};

