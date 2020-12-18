// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_Huno_Exit(C_INFO)
{
	npc = Vlk_538_Huno;
	nr = 999;
	condition = DIA_Huno_Exit_Condition;
	information = DIA_Huno_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Huno_Exit_Condition()
{
	return 1;
};

func void DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//	Info YouKnowYourJob
// **************************************************
instance DIA_Huno_YouKnowYourJob(C_INFO)
{
	npc = Vlk_538_Huno;
	nr = 2;
	condition = DIA_Huno_YouKnowYourJob_Condition;
	information = DIA_Huno_YouKnowYourJob_Info;
	permanent = 0;
	important = 0;
//	description = "It looks as if you knew what you were doing.";
//	description = "Wie's aussieht, beherrschst du dein Handwerk.";
	description = "Zdá se, že své práci rozumíš.";
};

func int DIA_Huno_YouKnowYourJob_Condition()
{ 
	return TRUE;
};

func void DIA_Huno_YouKnowYourJob_Info()
{
//	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00"); //It looks as if you knew what you were doing.
//	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Wie's aussieht, beherrschst du dein Handwerk.
	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Zdá se, že své práci rozumíš.
//	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Nobody ain't complained yet.
//	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Bisher hat sich noch niemand beschwert.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Zatím si nikdo nestěžoval.
//	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02"); //But that would be a bad idea anyway. Every idiot here needs a sword, and that is what they get from me.
//	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02"); //Aber das will ich auch keinem raten. Jeder Pisser hier braucht ein Schwert, und das kriegen sie von mir.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02"); //A to bych také ani nikomu neradil. Každý idiot tu potřebuje meč a ten sežene u mě.
};

// **************************************************
//	Info HowLong
// **************************************************
instance DIA_Huno_HowLong(C_INFO)
{
	npc = Vlk_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowLong_Condition;
	information = DIA_Huno_HowLong_Info;
	permanent = 0;
	important = 0;
//	description = "How long does it take you to make one blade?";
//	description = "Wie lange brauchst du für eine Klinge?";
	description = "Jak dlouho ti trvá výroba jedné čepele?";
};

func int DIA_Huno_HowLong_Condition()
{ 
	if Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

func void DIA_Huno_HowLong_Info()
{
//	AI_Output(other,self,"DIA_Huno_HowLong_15_00"); //How long does it take you to make one blade?
//	AI_Output(other,self,"DIA_Huno_HowLong_15_00"); //Wie lange brauchst du für eine Klinge?
	AI_Output(other,self,"DIA_Huno_HowLong_15_00"); //Jak dlouho ti trvá výroba jedné čepele?
//	AI_Output(self,other,"DIA_Huno_HowLong_09_01"); //That depends. I'm as fast as a hurricane with simple swords.
//	AI_Output(self,other,"DIA_Huno_HowLong_09_01"); //Kommt drauf an. Ein einfaches Schwert mach' ich dir schneller, als deine müden Augen zuschauen können.
	AI_Output(self,other,"DIA_Huno_HowLong_09_01"); //Záleží na tom. Jednoduché meče dělám rychleji, než to stačíš svýma unavenýma očima sledovat.
//	AI_Output(self,other,"DIA_Huno_HowLong_09_02"); //Of course only on condition that the price motivates me.
//	AI_Output(self,other,"DIA_Huno_HowLong_09_02"); //Vorausgesetzt, du motivierst mich mit einer entsprechenden Bezahlung.
	AI_Output(self,other,"DIA_Huno_HowLong_09_02"); //Za předpokladu, že mě motivuje cena.
//	AI_Output(self,other,"DIA_Huno_HowLong_09_03"); //A freak like Whistler usually has to wait longer for his toy than other people.
//	AI_Output(self,other,"DIA_Huno_HowLong_09_03"); //So'n Spinner wie der Whistler muss aber meistens länger auf sein Schmuckstück warten.
	AI_Output(self,other,"DIA_Huno_HowLong_09_03"); //Podivín jako Whistler obvykle musí čekat na svou hračku déle než ostatní lidi.
//	AI_Output(other,self,"DIA_Huno_HowLong_15_04"); //Why? Doesn't he pay enough?
//	AI_Output(other,self,"DIA_Huno_HowLong_15_04"); //Wieso? Bezahlt er nicht gut?
	AI_Output(other,self,"DIA_Huno_HowLong_15_04"); //Proč? Neplatí dost?
//	AI_Output(self,other,"DIA_Huno_HowLong_09_05"); //No, on the contrary. He gave me 150 ore for his last sword.
//	AI_Output(self,other,"DIA_Huno_HowLong_09_05"); //Doch, ganz im Gegenteil. Für sein letztes Schwert hat er 150 Erz locker gemacht.
	AI_Output(self,other,"DIA_Huno_HowLong_09_05"); //Ne, právě naopak. Za poslední meč dal 150 nugetů.
//	AI_Output(self,other,"DIA_Huno_HowLong_09_06"); //The guy is into ornaments and girlie stuff like that, and of course that's not cheap.
//	AI_Output(self,other,"DIA_Huno_HowLong_09_06"); //Irgendwie hat der Typ ein Faible für Ornamente und so 'nen Weiberkram, und das hat natürlich seinen Preis.
	AI_Output(self,other,"DIA_Huno_HowLong_09_06"); //Ten chlapík má zálibu v ozdobách a žensých věcech, a to má samozřejmě svou cenu.
//	AI_Output(self,other,"DIA_Huno_HowLong_09_07"); //Hey, you ain't curious at all, are you, pal.
//	AI_Output(self,other,"DIA_Huno_HowLong_09_07"); //Hey, du bist ganz schön neugierig, Freundchen.
	AI_Output(self,other,"DIA_Huno_HowLong_09_07"); //Hele, nejsi trochu moc zvědavý, kamarádíčku?
};

// **************************************************
//	Info HowsYourBusiness
// **************************************************
instance DIA_Huno_HowsYourBusiness(C_INFO)
{
	npc = Vlk_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowsYourBusiness_Condition;
	information = DIA_Huno_HowsYourBusiness_Info;
	permanent = 1;
	important = 0;
//	description = "Well, smith, how's business?";
//	description = "Na, Schmied, wie läuft das Geschäft?";
	description = "Tak co, kováři, jak jdou obchody?";
};

func int DIA_Huno_HowsYourBusiness_Condition()
{ 
	if Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

func void DIA_Huno_HowsYourBusiness_Info()
{
//	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Well, blacksmith, how's business?
//	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Na, Schmied, wie läuft das Geschäft?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Tak co, kováři, jak jdou obchody?
//	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01"); //Why would you want to know?
//	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01"); //Was geht dich das an?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01"); //Proč to chceš vědět?
//	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02"); //I may have an order for you.
//	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Vielleicht habe ich einen Auftrag für dich.
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Měl bych pro tebe zakázku.
//	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Oh really? And what?
//	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Ach ja? Was denn?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Opravdu? A jakou?
//	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04"); //I'll think about it.
//	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Ich überleg's mir.
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Budu o tom přemýšlet.
//	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Come back when you really need something and don't get on my nerves.
//	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Komm wieder, wenn du was brauchst, und geh mir nicht auf die Nerven.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Přijď zase, až budeš něco opravdu potřebovat a přestaň mi lézt na nervy.
};

// **************************************************
//	Info LEARNSMITH
// **************************************************
var int Huno_LearnSmith;
// **************************************************

instance DIA_Huno_LEARNSMITH(C_INFO)
{
	npc = Vlk_538_Huno;
	nr = 2;
	condition = DIA_Huno_LEARNSMITH_Condition;
	information = DIA_Huno_LEARNSMITH_Info;
	permanent = 1;
	important = 0;
//	description = "I'd like to try working here as well.";
//	description = "Ich würde mich selbst gern mal an deiner Schmiede versuchen.";
	description = "Chtěl bych tu zkusit pracovat.";
};

func int DIA_Huno_LEARNSMITH_Condition()
{ 
	if Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

func void DIA_Huno_LEARNSMITH_Info()
{
//	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00"); //I'd like to try working here as well.
//	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00"); //Ich würde mich selbst gern mal an deiner Schmiede versuchen.
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00"); //Chtěl bych tu zkusit pracovat.
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01"); //Oh, but don't you think that you can make great blades!
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01"); //So so, aber glaub nur nicht, dass du tolle Klingen herstellen kannst!
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01"); //Och, ale nemysli si, že tě nechám kovat skvělé čepele!
//	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02"); //What do I have to do?
//	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02"); //Was muss ich tun?
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02"); //Co musím dělat?
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03"); //Okay, take the steel and hold into the fire.
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03"); //Okay, nimm den Rohstahl und halte ihn ins Schmiedefeuer.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03"); //Dobře, vezmi ocel a vlož ji do výhně.
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04"); //Then you have to lay the red-hot steel across the anvil.
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04"); //Dann musst du den glühenden Stahl am Amboss schmieden.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04"); //Potom musíš do ruda rozžhavenou ocel na kovadlině vytvarovat.
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05"); //When you're finished, you put the hot blade into the water bucket over there to temper it.
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05"); //Stecke dann die glühende Klinge dort drüben in den Wassereimer, um sie zu härten.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05"); //Ponoř rozžhavenou čepel támhle do toho kbelíku s vodou, abys ji zakalil.
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06"); //The cooled blade finally has to be sharpened on the grindstone.
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06"); //Am Ende muss die abgekühlte Klinge noch am Schleifstein geschärft werden.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06"); //Nakonec musíš vychladlou nabrousit na brusu.
//	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_07"); //I see.
//	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_07"); //Verstehe.
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_07"); //Rozumím.
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_08"); //However, you'll need some things for that. I could sell them to you.
//	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_08"); //Allerdings brauchst du dafür ein paar Sachen. Ich kann sie dir verkaufen.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_08"); //Budeš k tomu samozřejmě potřebovat nějaké věci, které ti mohu prodat.

	Huno_LearnSmith = TRUE;
};

// **************************************************
//	Info BUYSMITH
// **************************************************
instance DIA_Huno_BUYSMITH(C_INFO)
{
	npc = Vlk_538_Huno;
	nr = 2;
	condition = DIA_Huno_BUYSMITH_Condition;
	information = DIA_Huno_BUYSMITH_Info;
	permanent = 1;
	important = 0;
//	description = "I'd like to buy blacksmith equipment!";
//	description = "Ich möchte Dinge fürs Schmieden kaufen!";
	description = "Chtěl bych koupit kovářskou výbavu.";
	trade = 1;
};

func int DIA_Huno_BUYSMITH_Condition()
{ 
	if (Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Huno_BUYSMITH_Info()
{
//	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00"); //I'd like to buy some blacksmith equipment!
//	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00"); //Ich möchte Dinge fürs Schmieden kaufen!
	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00"); //Chtěl bych koupit kovářskou výbavu.

	if (Npc_HasItems(self,ItMiSwordRaw ) < 5) { CreateInvItems(self,ItMiSwordRaw, 5); };
	if (Npc_HasItems(self,ItMiSwordRawHot ) < 5) { CreateInvItems(self,ItMiSwordRawHot, 5); };
	if (Npc_HasItems(self,ItMiSwordBladeHot) < 5) { CreateInvItems(self,ItMiSwordBladeHot, 5); };
	if (Npc_HasItems(self,ItMiSwordBlade ) < 5) { CreateInvItems(self,ItMiSwordBlade, 5); };
};

