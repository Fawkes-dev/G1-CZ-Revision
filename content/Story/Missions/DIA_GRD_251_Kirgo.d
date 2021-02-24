// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kirgo_Exit(C_INFO)
{
	npc = Grd_251_Kirgo;
	nr = 999;
	condition = Info_Kirgo_Exit_Condition;
	information = Info_Kirgo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Info_Kirgo_Exit_Condition()
{
	return 1;
};

func void Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kirgo_What(C_INFO)
{
	npc = Grd_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_What_Condition;
	information = Info_Kirgo_What_Info;
	permanent = 0;
//	description = "Hi! I'm new here.";
//	description = "Hi! Ich bin neu hier.";
	description = "Zdar! Jsem tady nový.";
};                       

func int Info_Kirgo_What_Condition()
{ 
	if (Kapitel <= 2)
	{
		return 1;
	};
};
func void Info_Kirgo_What_Info()
{
//	AI_Output(other,self,"Info_Kirgo_What_15_00"); //Hi! I'm new here.
//	AI_Output(other,self,"Info_Kirgo_What_15_00"); //Hi! Ich bin neu hier.
	AI_Output(other,self,"Info_Kirgo_What_15_00"); //Zdar! Jsem tu nový.
//	AI_Output(self,other,"Info_Kirgo_What_05_01"); //You don't say! Tell me about the outside world! It's been over a month since I heard anything from outside.
//	AI_Output(self,other,"Info_Kirgo_What_05_01"); //Ein Neuer! Erzähl mir was von draußen! Es ist schon über einen Monat her, dass ich Neuigkeiten aus der Außenwelt gehört hab.
	AI_Output(self,other,"Info_Kirgo_What_05_01"); //Nováček! Řekni mi něco o vnějším světě! Už jsem o tom, co se děje venku, neslyšel přes měsíc.
//	AI_Output(self,other,"Info_Kirgo_What_05_02"); //I'm Kirgo. I fight in the arena.
//	AI_Output(self,other,"Info_Kirgo_What_05_02"); //Ich bin Kirgo. Ich kämpfe in der Arena.
	AI_Output(self,other,"Info_Kirgo_What_05_02"); //Jsem Kirgo. Bojuju v aréně.
};

// **************************************************
//				Bit du gut
// **************************************************

instance Info_Kirgo_Good(C_INFO)
{
	npc = Grd_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Good_Condition;
	information = Info_Kirgo_Good_Info;
	permanent = 0;
//	description = "Are you good? At fighting, I mean?";
//	description = "Bist du gut? - Im Kämpfen meine ich.";
	description = "A jsi dobrý? Myslím v boji.";
};                       

func int Info_Kirgo_Good_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func void Info_Kirgo_Good_Info()
{
//	AI_Output(other,self,"Info_Kirgo_Good_15_00"); //Are you good?
//	AI_Output(other,self,"Info_Kirgo_Good_15_00"); //Bist du gut?
	AI_Output(other,self,"Info_Kirgo_Good_15_00"); //A jsi dobrý?
//	AI_Output(self,other,"Info_Kirgo_Good_05_01"); //At fighting? I haven't been doing it for long, but I've already won a fight!
//	AI_Output(self,other,"Info_Kirgo_Good_05_01"); //Im Kämpfen? Ich bin noch nicht lange dabei, aber ich habe schon einen Kampf gewonnen!
	AI_Output(self,other,"Info_Kirgo_Good_05_01"); //V boji? Už jsem dlouho nebojoval, ale zatím jsem v souboji vždycky zvítězil!
};

// **************************************
//				Fordern (Vorspiel)
// **************************************

instance Info_Kirgo_Charge(C_INFO)
{
	npc = Grd_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Charge_Condition;
	information = Info_Kirgo_Charge_Info;
	permanent = 0;
//	description = "I'd like to challenge you to a fight in the arena!";
//	description = "Ich fordere dich zum Kampf in der Arena!";
	description = "Chtěl bych tě vyzvat na souboj v aréně!";
};                       

func int Info_Kirgo_Charge_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kirgo_What) && (Kapitel <= 1)) // Kapitelfix   ***Björn***
	{
		return 1;
	};
};

func void Info_Kirgo_Charge_Info()
{
//	AI_Output(other,self,"Info_Kirgo_Charge_15_00"); //I'd like to challenge you to a fight in the arena!
//	AI_Output(other,self,"Info_Kirgo_Charge_15_00"); //Ich fordere dich zum Kampf in der Arena!
	AI_Output(other,self,"Info_Kirgo_Charge_15_00"); //Chtěl bych tě vyzvat na souboj v aréně!
//	AI_Output(self,other,"Info_Kirgo_Charge_05_01"); //What? But I don't wanna fight. Why don't we just have a beer together and talk about the outside world?
//	AI_Output(self,other,"Info_Kirgo_Charge_05_01"); //Was? Aber ich hab' gerade keine Lust zu kämpfen. Lass uns doch lieber ein Bier zusammen trinken und erzähl mir was von draußen.
	AI_Output(self,other,"Info_Kirgo_Charge_05_01"); //Cože? Ale já bojovat nechci. Proč si raději nedáme pivo a nepopovídáme o vnějším světě?
	Info_ClearChoices(Info_Kirgo_Charge);
//	Info_AddChoice(Info_Kirgo_Charge,"No! I want to fight. Now!",Info_Kirgo_Charge_NOW);
//	Info_AddChoice(Info_Kirgo_Charge,"Nein! Ich will gegen dich kämpfen. Jetzt!",Info_Kirgo_Charge_NOW);
	Info_AddChoice(Info_Kirgo_Charge,"Ne! Chci bojovat. Teď!",Info_Kirgo_Charge_NOW);
//	Info_AddChoice(Info_Kirgo_Charge,"Okay, give me a beer then!",Info_Kirgo_Charge_Beer);
//	Info_AddChoice(Info_Kirgo_Charge,"Okay, gib ein Bier rüber!",Info_Kirgo_Charge_Beer);
	Info_AddChoice(Info_Kirgo_Charge,"Dobře, pak mám u tebe pivo!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
//	AI_Output(other,self,"Info_Kirgo_Charge_NOW_15_00"); //No! I want to fight. Now!
//	AI_Output(other,self,"Info_Kirgo_Charge_NOW_15_00"); //Nein! Ich will gegen dich kämpfen. Jetzt!
	AI_Output(other,self,"Info_Kirgo_Charge_NOW_15_00"); //Ne! Chci proti tobě bojovat. Teď!
//	AI_Output(self,other,"Info_Kirgo_Charge_NOW_05_01"); //In that case... I'm ready when you are.
//	AI_Output(self,other,"Info_Kirgo_Charge_NOW_05_01"); //Wie du willst ... Ich bin bereit, wenn du es bist.
	AI_Output(self,other,"Info_Kirgo_Charge_NOW_05_01"); //Jak si přeješ... Jestli jsi připraven, tak já taky.
	Info_ClearChoices(Info_Kirgo_Charge);
};

func void Info_Kirgo_Charge_Beer()
{
//	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_00"); //Okay, give me a beer then!
//	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_00"); //Okay, gib mir ein Bier rüber!
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_00"); //Dobře, pak mám u tebe pivo!
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_01"); //Here you are!
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_01"); //Hier nimm!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_01"); //Tady je!
//	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_02"); //Thanks! I'm afraid I can't tell you much about the outside world - they kept me locked away in a dark hole for almost two months before throwing me in here.
//	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_02"); //Danke! Ich fürchte, von draußen kann ich nicht viel erzählen - sie haben mich fast zwei Monate in einem dunklen Loch gefangen gehalten, bevor sie mich hier reingeworfen haben.
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_02"); //Díky! Obávám se, že ti toho o vnějším světě nebudu moci tolik říci - drželi mě skoro dva měsíce zamknutého v tmavé díře, než mě hodili sem.
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_03"); //That's a shame... Oh well, never mind... Hey, you're still looking pretty good for someone who's been locked up for two months.
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_03"); //Schade ... Na, was soll's ... Hey, für zwei Monate Kerker siehst du aber noch ziemlich gut aus.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_03"); //Škoda... No nic... Hej, na někoho, kdo byl dva měsíce pod zámkem, ale vypadáš docela dobře.
//	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_04"); //I'd like it to stay that way, too.
//	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_04"); //Ich werde zusehen, dass das so bleibt.
	//#NEEDS_ATTENTION neprebasnime?
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_04"); //Postarám se, aby to tak zůstalo.
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_05"); //Then why do you insist on fighting one of us?
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_05"); //Warum willst du dann unbedingt gegen einen von uns antreten?
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_05"); //Proč potom trváš na tom, abychom se spolu utkali?
//	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_06"); //I want to get acknowledged in the Camp!
//	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_06"); //Ich will Anerkennung im Lager finden!
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_06"); //Chci, aby mě v táboře uznávali!
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_07"); //By Scatty, you mean? Hm, he's one of the most influential men in the Outer Ring... You might be able to impress him by defeating me...
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_07"); //Bei Scatty, meinst du? Hm, er ist einer der einflussreichsten Leute hier im Außenring ... Wenn du mich besiegst, könnte ihn das schon beeindrucken ...
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_07"); //Myslíš Scattyho? Hm, to je jeden z nejvýznamnějších mužů z Vnějšího okruhu... Když mě porazíš, určitě to na něj zapůsobí...
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_08"); //But if you really want to impress him, it's Kharim you need to beat. Only thing is, I'm afraid he might be too good for you!
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_08"); //Aber wenn du ihm richtig imponieren willst, müsstest du Kharim umhauen. Ich fürchte nur, er ist viel zu gut für dich!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_08"); //Ale jestli ho doopravdy chceš zaujmout, pak musíš porazit Kharima. Jen se bojím, že na tebe bude příliš silný!
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_09"); //If you still want to fight me, let me know! But I won't enjoy knocking you out cold.
//	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_09"); //Falls du immer noch gegen mich kämpfen willst - sag mir Bescheid! Aber ich werd' dir nicht gerne die Fresse polieren.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_09"); //Jestli chceš ještě pořád se mnou bojovat, dej mi vědět. Nebudu mít ale radost z toho, až ti zmaluju obličej.

	//#Bugfix Kirgo si od hraca zobral pivo :)
	//CreateInvItem(other,ItFoBeer);
	//B_GiveInvItems(other,self,ItFoBeer,1);
	CreateInvItem(self, ItFoBeer);
	B_GiveInvItems(self, other, ItFoBeer, 1);

	self.npctype = npctype_FRIEND;

	Info_ClearChoices(Info_Kirgo_Charge);
};

// **************************************
//				Fordern REAL
// **************************************
	var int Kirgo_Charged;
// **************************************

instance Info_Kirgo_ChargeREAL(C_INFO)
{
	npc = Grd_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_ChargeREAL_Condition;
	information = Info_Kirgo_ChargeREAL_Info;
	permanent = 0;
//	description = "Let's fight - are you ready?";
//	description = "Lass uns kämpfen - Bist du bereit?";
	description = "Tak pojďme bojovat - jsi připraven?";
};                       

func int Info_Kirgo_ChargeREAL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Kirgo_Charge) && (Kapitel <= 1)) //Kapitelfix ****Björn****
	{
		return 1;
	};
};

func void Info_Kirgo_ChargeREAL_Info()
{
//	AI_Output(other,self,"Info_Kirgo_ChargeREAL_15_00"); //Let's fight - are you ready?
//	AI_Output(other,self,"Info_Kirgo_ChargeREAL_15_00"); //Lass uns kämpfen - Bist du bereit?
	AI_Output(other,self,"Info_Kirgo_ChargeREAL_15_00"); //Tak pojďme bojovat - jsi připraven?
//	AI_Output(self,other,"Info_Kirgo_ChargeREAL_05_01"); //Follow me!
//	AI_Output(self,other,"Info_Kirgo_ChargeREAL_05_01"); //Folge mir!
	AI_Output(self,other,"Info_Kirgo_ChargeREAL_05_01"); //Pojď za mnou!

	AI_StopProcessInfos(self);

	Kirgo_Charged = TRUE;

	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kirgo_InArena(C_INFO)
{
	npc = Grd_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_InArena_Condition;
	information = Info_Kirgo_InArena_Info;
	permanent = 0;
	important = 1;
};                       

func int Info_Kirgo_InArena_Condition()
{
	if ((Kirgo_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void Info_Kirgo_InArena_Info()
{
	if (Kapitel <= 1) //Fix für spätere Kapitel ****Björn****
	{
//		AI_Output(self,other,"Info_Kirgo_InArena_05_00"); //Right, let's get to it. May the best man win!
//		AI_Output(self,other,"Info_Kirgo_InArena_05_00"); //So, dann wollen wir mal. Möge der Bessere gewinnen!
		AI_Output(self,other,"Info_Kirgo_InArena_05_00"); //Dobře, pojďme na to. Ať vyhraje ten nejlepší!

		AI_StopProcessInfos(self);

		Npc_ExchangeRoutine(self,"START");

		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
//		AI_Output(self,other,"SVM_5_LetsForgetOurLittleFight"); //Den kleinen Streit vergessen wir, okay? 
//		AI_Output(self,other,"SVM_5_LetsForgetOurLittleFight"); //Den kleinen Streit vergessen wir, okay?
		AI_Output(self,other,"SVM_5_LetsForgetOurLittleFight"); //Dobrá, zapomeňme na tuhle hádku, ano?
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};

};

