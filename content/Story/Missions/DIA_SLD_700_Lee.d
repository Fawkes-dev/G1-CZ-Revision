//*********************************************************
// EXIT 
//*********************************************************

instance Sld_700_Lee_Exit(C_INFO)
{
	npc = Sld_700_Lee;
	nr = 999;
	condition = Sld_700_Lee_Exit_Condition;
	information = Sld_700_Lee_Exit_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Sld_700_Lee_Exit_Condition()
{
	return TRUE;
};

func void Sld_700_Lee_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************
// Greet 
//*********************************************************

instance Sld_700_Lee_Greet(C_INFO)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_Greet_Condition;
	information = Sld_700_Lee_Greet_Info;
	permanent = 0;
//	description = "You're the boss of the mercenaries, aren't you?";
//	description = "Du bist der Chef der Söldner, richtig?";
	description = "Ty jsi velitel žoldáků, viď?";
};                       

func int Sld_700_Lee_Greet_Condition()
{
	return 1;
};

func void Sld_700_Lee_Greet_Info()
{
//	AI_Output(other,self,"DIA_Lee_Greet_15_00"); //You're the boss of the mercenaries, aren't you?
//	AI_Output(other,self,"DIA_Lee_Greet_15_00"); //Du bist der Chef der Söldner, richtig?
	AI_Output(other,self,"DIA_Lee_Greet_15_00"); //Ty jsi velitel žoldáků, viď?
//	AI_Output(self,other,"DIA_Lee_Greet_08_01"); //That's right, boy!
//	AI_Output(self,other,"DIA_Lee_Greet_08_01"); //Das ist richtig, mein Junge!
	AI_Output(self,other,"DIA_Lee_Greet_08_01"); //Přesně tak, hochu!
};

//*********************************************************
// Define 
//*********************************************************

instance Sld_700_Lee_Define(C_INFO)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_Define_Condition;
	information = Sld_700_Lee_Define_Info;
	permanent = 0;
//	description = "Which tasks do the mages' mercenaries have?";
//	description = "Was sind die Aufgaben eines Söldners der Magier?";
	description = "Jaké úkoly dávají mágové žoldákům?";
};                       

func int Sld_700_Lee_Define_Condition()
{
	if (Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	{
		return 1;
	};
};

func void Sld_700_Lee_Define_Info()
{
//	AI_Output(other,self,"DIA_Lee_Define_15_00"); //Which tasks do the mages' mercenaries have?
//	AI_Output(other,self,"DIA_Lee_Define_15_00"); //Was sind die Aufgaben eines Söldners der Magier?
	AI_Output(other,self,"DIA_Lee_Define_15_00"); //Jaké úkoly dávají mágové žoldákům?
//	AI_Output(self,other,"DIA_Lee_Define_08_01"); //Very simple: Protect the ore - protect the mages.
//	AI_Output(self,other,"DIA_Lee_Define_08_01"); //Ganz einfach: Beschütze das Erz - beschütze die Magier.
	AI_Output(self,other,"DIA_Lee_Define_08_01"); //Velmi jednoduché: chránit rudu - chránit mágy.
//	AI_Output(self,other,"DIA_Lee_Define_08_02"); //Sometimes the mages have a special task for one of us.
//	AI_Output(self,other,"DIA_Lee_Define_08_02"); //Manchmal haben die Magier aber auch eine besondere Aufgabe für einen von uns.
	AI_Output(self,other,"DIA_Lee_Define_08_02"); //Občas pro nás mají mágové zvláštní úkoly.
};

//*********************************************************
// Mitmachen 
//*********************************************************

instance Sld_700_Lee_Mitmachen(C_INFO)
{
	npc = Sld_700_Lee;
	nr = 2;
	condition = Sld_700_Lee_Mitmachen_Condition;
	information = Sld_700_Lee_Mitmachen_Info;
	permanent = 0;
//	description = "I'd like to join you!";
//	description = "Ich will bei euch mitmachen!";
	description = "Chtěl bych se k vám přidat!";
};                       

func int Sld_700_Lee_Mitmachen_Condition()
{
	if (Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	&& (oldHeroGuild == 0)
	{
		return 1;
	};
};

func void Sld_700_Lee_Mitmachen_Info()
{
//	AI_Output(other,self,"DIA_Lee_Mitmachen_15_00"); //I'd like to join you!
//	AI_Output(other,self,"DIA_Lee_Mitmachen_15_00"); //Ich will bei euch mitmachen!
	AI_Output(other,self,"DIA_Lee_Mitmachen_15_00"); //Chtěl bych se k vám přidat!
//	AI_Output(self,other,"DIA_Lee_Mitmachen_08_01"); //You have a nerve! D'you honestly think I'll just take anybody who walks in here?
//	AI_Output(self,other,"DIA_Lee_Mitmachen_08_01"); //Du hast Nerven! Denkst du, ich nehme direkt jeden, der hier reinkommt?
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_01"); //Ty máš ale nervy! Ty si vážně myslíš, že přijmu každého, kdo sem přijde?
//	AI_Output(self,other,"DIA_Lee_Mitmachen_08_02"); //You can only become one of us after you spent a certain time in the Camp. I'll observe you!
//	AI_Output(self,other,"DIA_Lee_Mitmachen_08_02"); //Erst wenn du einige Zeit hier im Lager bist, kannst du einer von uns werden. Ich werde dich beobachten!
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_02"); //Můžeš se stát jedním z nás až potom, co strávíš určitý čas v táboře. Budu tě pozorovat!
};

//*********************************************************
// NowReady for Sld? 
//*********************************************************
	var int Lee_SldPossible;
//*********************************************************

instance Sld_700_Lee_NowReady(C_INFO)
{
	npc = Sld_700_Lee;
	nr = 700;
	condition = Sld_700_Lee_NowReady_Condition;
	information = Sld_700_Lee_NowReady_Info;
	permanent = 1;
//	description = "I'd like to become a mercenary of the mages - am I ready yet?";
//	description = "Ich will ein Söldner der Magier werden - bin ich jetzt soweit?";
	description = "Chtěl bych se stát žoldákem mágů - jsem na to už připravený?";
};                       

func int Sld_700_Lee_NowReady_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_ORG)
	&& (Npc_KnowsInfo(hero,Sld_700_Lee_Mitmachen) || (hero.level >= 10))
	{
		return 1;
	};
};

func void Sld_700_Lee_NowReady_Info()
{
//	AI_Output(other,self,"DIA_Lee_NowReady_15_00"); //I'd like to become a mercenary of the mages - am I ready yet?
//	AI_Output(other,self,"DIA_Lee_NowReady_15_00"); //Ich will ein Söldner der Magier werden - bin ich jetzt soweit?
	AI_Output(other,self,"DIA_Lee_NowReady_15_00"); //Chtěl bych se stát žoldákem mágů - jsem na to už připravený?

	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
//		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_01"); //Your deeds for the people in the Old Mine have demonstrated that you're quite a good man.
//		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_01"); //Deine Taten für die Bruderschaft in der Alten Mine haben gezeigt, das du einiges drauf hast. 
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_01"); //Tvoje skutky vykonané pro lidi ve Starém dolu ukázaly, že jsi docela správný chlap.
//		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_02"); //I'd be willing to let you join the mercenaries.
//		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_02"); //Ich wäre bereit, dich in die Reihen der Söldner aufzunehmen.
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_02"); //Byl bych ochotný přijmout tě k žoldákům.

		if hero.level < 10
		{
//			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_03"); //But you're not ready for the mercenaries yet. Just collect some more experience and you'll be there.
//			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_03"); //Aber du bist noch nicht bereit für die Söldner. Sammle erst noch mehr Erfahrung, dann bist du dabei.
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_03"); //Ale ještě nejsi připravený stát se žoldákem. Musíš ještě získat nějaké zkušenosti, potom budeš patřit k nám.
			AI_StopProcessInfos(self);
			B_PrintGuildCondition(10);
		}
		else if hero.level >= 10
		{
//			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //I'll give you a chance. How about it?
//			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Ich gebe dir eine Chance. Wie siehts aus?
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Dám ti příležitost. Co ty na to?
			Lee_SldPossible = TRUE;
		};
	}
	else
	{ 
		if hero.level < 10
		{
//			AI_Output(self,other,"DIA_Lee_NowReady_08_01"); //You still don't have enough experience. You need to improve your abilities.
//			AI_Output(self,other,"DIA_Lee_NowReady_08_01"); //Dir fehlt es noch an Erfahrung. Du mußt deine Fähigkeiten noch steigern.
			AI_Output(self,other,"DIA_Lee_NowReady_08_01"); //Ještě nemáš dost zkušeností. Potřebuješ ještě zlepšit své schopnosti.
			B_PrintGuildCondition(10);
		}
		else if hero.level >= 10
		{
//			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Ich gebe dir eine Chance. Wie siehts aus?
//			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Ich gebe dir eine Chance. Wie siehts aus?
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Dám ti příležitost. Co ty na to?
			Lee_SldPossible = TRUE;
		};
	};
};

/*------------------------------------------------------------------------
							SÖLDNER WERDEN 2 
------------------------------------------------------------------------*/

instance Sld_700_Lee_BECOMESLDNOW(C_INFO)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_BECOMESLDNOW_Condition;
	information = Sld_700_Lee_BECOMESLDNOW_Info;
	important = 0;
	permanent = 0;
//	description = "I want to become a mercenary."; 
//	description = "Ich will Söldner werden"; 
	description = "Chci se stát žoldákem."; 
};

func int Sld_700_Lee_BECOMESLDNOW_Condition()
{ 
	if (Lee_SldPossible == TRUE)
	&& (hero.level >= 10)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_BECOMESLDNOW_Info()
{
//	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01"); //I want to become a mercenary.
//	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01"); //Ich will Söldner werden.
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01"); //Chci se stát žoldákem.
//	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02"); //A good decision. You won't regret it.
//	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02"); //Eine gute Entscheidung. Du wirst sie nicht bereuen.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02"); //Dobré rozhodnutí. Nebudeš litovat.
//	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03"); //Tell me something: Why? Why have you joined us and not the Old Camp or the Brotherhood?
//	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03"); //Sag mir eins, warum? Warum hast du dich uns angeschlossen und nicht dem Alten Lager oder der Bruderschaft?
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03"); //Řekni mi něco: Proč? Proč jsi se přidal k nám a ne ke Starému táboru nebo k Bratrstvu?

	Log_CreateTopic(GE_BecomeMercenary,LOG_NOTE);
//	B_LogEntry(GE_BecomeMercenary,"Lee has let me join the mercenaries.");
//	B_LogEntry(GE_BecomeMercenary,"Lee hat mich bei den Söldnern aufgenommen.");
	B_LogEntry(GE_BecomeMercenary,"Lee mě nechal, abych se přidal k žoldákům.");

	Info_ClearChoices(Sld_700_Lee_BECOMESLDNOW);
//	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"The other camps aren't worth the bother.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
//	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Die anderen Lager sind es nicht wert",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Ostatní tábory nejsou tak dobré.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
//	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"I wanted freedom from the very beginning.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
//	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Ich wollte von Anfang an die Freiheit",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Chtěl jsem svobodu od samého začátku.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
//	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"It just sort of happened that way.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
//	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Es hat sich einfach so ergeben",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Něco mě k tomu táhlo.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};

func void Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
//	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01"); //The other camps aren't worth the bother.
//	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01"); //Die anderen Lager sind es nicht wert.
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01"); //Ostatní tábory nejsou tak dobré.
//	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02"); //The only thing that's worth anything in here is the hope of freedom. Welcome, MERCENARY!
//	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02"); //Das einzige, was hier drin etwas wert ist, ist die Hoffnung auf Freiheit. Willkommen, SÖLDNER!
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02"); //Jedna věc je tady nade všechno důležitá, totiž naděje na svobodu. Vítej, ŽOLDÁKU!
	CreateInvItem(self,SLD_ARMOR_L);
	B_GiveInvItems(self,hero,SLD_ARMOR_L,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos(self);
};

func void Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
//	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01"); //I wanted freedom from the very beginning.
//	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01"); //Ich wollte von Anfang an die Freiheit.
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01"); //Chtěl jsem svobodu od samého začátku.
//	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02"); //We'll get our freedom back. Welcome, MERCENARY.
//	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02"); //Wir werden uns unsere Freiheit zurückholen. Willkommen, SÖLDNER.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02"); //Dostaneme naší svobodu nazpět. Vítej, ŽOLDÁKU!
	CreateInvItem(self,SLD_ARMOR_L);
	B_GiveInvItems(self,hero,SLD_ARMOR_L,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos(self);
};

func void Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
//	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01"); //It just sort of happened that way.
//	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01"); //Es hat sich einfach so ergeben.
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01"); //Něco mě k tomu táhlo.
//	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02"); //I only hope it doesn't just sort of happen that we stay trapped in here forever. Welcome, MERCENARY.
//	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02"); //Hauptsache, es ergibt sich nicht, dass uns die Barriere für immer hier drin gefangen hält. Willkommen, SÖLDNER.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02"); //Hlavní věc, nevzdat se, aby nás ta Bariéra nepolapila navždycky. Vítej, ŽOLDÁKU!
	CreateInvItem(self,SLD_ARMOR_L);
	B_GiveInvItems(self,hero,SLD_ARMOR_L,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################
/*------------------------------------------------------------------------
							SZENE DAMM 
------------------------------------------------------------------------*/

instance Sld_700_Lee_DAMNPAST(C_INFO)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_DAMNPAST_Condition;
	information = Sld_700_Lee_DAMNPAST_Info;
	important = 1;
	permanent = 0;
};

func int Sld_700_Lee_DAMNPAST_Condition()
{ 
	if (Saturas_BringFoci == 5)
	&& (Npc_GetDistToNpc(hero,self) < 1000) 
	&& (Npc_GetDistToWp (self,"NC_DAM") < 1000) 
	{
		return TRUE;
	};
};
func void Sld_700_Lee_DAMNPAST_Info()
{
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_01"); //There was a time when I led a very different life.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_01"); //Einst führte ich ein anderes Leben.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_01"); //Bývaly časy, kdy jsem vedl úplně jiný život.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_02"); //I was one of the best generals of this country.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_02"); //Ich zählte zu den besten Generälen dieses Landes.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_02"); //Byl jsem jedním z nejlepších generálů téhle země.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_03"); //I've spent my whole life fighting for my country.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_03"); //Ich habe mein ganzes Leben lang für dieses Land gekämpft.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_03"); //Celý život jsem strávil v boji za svou vlast.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_04"); //But the nobles didn't like me, because the King listened to my advice. And they knew I posed a threat to their dirty business.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_04"); //Den Adeligen war ich ein Dorn im Auge, denn der König hörte auf meinen Rat. Und sie sahen ihre schmutzigen Geschäfte in Gefahr.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_04"); //Šlechta mě ale neměla v oblibě, protože král naslouchal mým radám. A také věděla, že představuju hrozbu pro jejich špinavé obchody.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_05"); //I hadn't counted on their insidiousness. They used the King's wife to get me.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_05"); //Ich habe nicht mit ihrer Hinterhältigkeit gerechnet. Sie haben des Königs Frau benutzt, um mich zu kriegen.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_05"); //Nepočítal jsem s jejich zákeřností. Použili proti mně královu ženu.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_06"); //I was blamed for her pointless murder. King Rhobar had no other choice.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_06"); //Der sinnlose Mord an ihr wurde mir angehängt. König Rhobar blieb keine Wahl.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_06"); //Byl jsem obviněn z její nesmyslné vraždy. Král Rhobar neměl jinou volbu.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_07"); //The services I had rendered my country saved me from the gallows. But they robbed me of my freedom.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_07"); //Meine Verdienste um das Land retteten mich vor dem Strick. Aber sie haben mir meine Freiheit genommen.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_07"); //Služby, které jsem vlasti prokázal, mě zachránily před šibenicí. Ale byl jsem zbaven svobody.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_08"); //One day I'll be free again. Then I shall return and take revenge.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_08"); //Eines Tages werde ich wieder frei sein. Dann werde ich zurückkehren und ich werde Rache nehmen.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_08"); //Jednoho dne budu zase svobodný. Pak se vrátím a pomstím se.

	AI_AlignToWP (self);

//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_09"); //I shall have my revenge.
//	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_09"); //Ich werde mich rächen.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_09"); //Provedu svoji pomstu.

	Npc_ExchangeRoutine(self,"START");

	var C_NPC Homer;
	Homer = Hlp_GetNpc(BAU_935_HOMER);
	Npc_ExchangeRoutine(Homer,"START"); 
	AI_ContinueRoutine(Homer);
};

//*********************************************************
// FMTaken 
//*********************************************************

instance Sld_700_Lee_FMTaken(C_INFO)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_FMTaken_Condition;
	information = Sld_700_Lee_FMTaken_Info;
	permanent = 1;
//	description = "What do you think about the mine?";
//	description = "Was sagst du zu der Sache mit der Mine?";
	description = "Co si myslíš o dolu?";
};                       

func int Sld_700_Lee_FMTaken_Condition()
{
	if FMTaken
	{
		return TRUE;
	};
};

func void Sld_700_Lee_FMTaken_Info()
{
//	AI_Output(other,self,"DIA_Lee_FMTaken_15_00"); //What do you think about the mine?
//	AI_Output(other,self,"DIA_Lee_FMTaken_15_00"); //Was sagst du zu der Sache mit der Mine?
	AI_Output(other,self,"DIA_Lee_FMTaken_15_00"); //Co si myslíš o dolu?

	if (Lee_freeminereport == 0) //SC hat jetzt die Möglichkeit, Lee über die freie Mine zu informieren! ***Björn***
	{

//		AI_Output(self,other,"DIA_Lee_FMTaken_08_01"); //They've gone too far, they'll be sorry for it.
//		AI_Output(self,other,"DIA_Lee_FMTaken_08_01"); //Sie sind zu weit gegangen, dafür werden sie büßen.
		AI_Output(self,other,"DIA_Lee_FMTaken_08_01"); //Zašli příliš daleko a budou toho litovat.

	}
	else
	{
//		AI_Output(hero,self,"Info_Lee_now_freeminefree_15_01"); //They shouldn't be a threat anymore!
//		AI_Output(hero,self,"Info_Lee_now_freeminefree_15_01"); //Die Bedrohung dürfte beendet sein!
		AI_Output(hero,self,"Info_Lee_now_freeminefree_15_01"); //Už by neměli nikdy představovat hrozbu!
//		AI_Output(self,hero,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //You've done much for our camp. I can make good use of men like you.
//		AI_Output(self,hero,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //Du hast viel für unser Lager getan. Männer wie dich kann ich gebrauchen.
		AI_Output(self,hero,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //Udělal jsi toho pro náš tábor mnoho. Pro muže, jako jsi ty, budu mít vždycky dobré místo.
//		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03"); //Thank you. I'll be on my way now.
//		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03"); //Ich danke dir. Ich werde mich jetzt wieder auf den Weg machen.
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03"); //Děkuju. Půjdu si svou cestou.
//		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01"); //One moment!
//		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01"); //Einen Moment noch!
		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01"); //Ještě moment!
//		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03"); //Take this rune of magic as a sign of our gratitude for your great deeds.
//		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03"); //Nimm diese Zauberrune als Zeichen unseres Dankes für deine großen Taten.
		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03"); //Vem si tuhle magickou runu jako vyjádření našeho vděku za tvoje velké činy.
//		AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05"); //Thank you!
//		AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05"); //Ich danke dir!
		AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05"); //Děkuju!
//		AI_Output(hero,self,"Info_Exit_Info_15_01"); //See ya.
//		AI_Output(hero,self,"Info_Exit_Info_15_01"); //Wir sehen uns.
		AI_Output(hero,self,"Info_Exit_Info_15_01"); //Ještě se uvidíme.

//		B_LogEntry(CH4_BannedFromOC, "I informed Lee about the cleaning action, Gorn and I have performed in the Free Mine. He was very pleased.");
//		B_LogEntry(CH4_BannedFromOC, "Ich habe Lee über Gorns und mein Aufräumen in der freien Mine informiert. Er zeigte sich sehr zufrieden.");
		B_LogEntry(CH4_BannedFromOC, "Informoval jsem Leeho o čistce, kterou jsme s Gornem provedli ve Svobodném dole. Byl velmi potěšen.");

 	   	B_GiveInvItems(self,other,ItArRuneFirestorm,1);
		B_GiveXP(500); 
		Lee_freeminereport = 0;
	};
};

/*------------------------------------------------------------------------
						WECHSEL VON GRD ZU SLD 
------------------------------------------------------------------------*/
instance Sld_700_Lee_CHANGESIDE(C_INFO)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_CHANGESIDE_Condition;
	information = Sld_700_Lee_CHANGESIDE_Info;
	important = 0;
	permanent = 0;
//	description = "The Old Camp has banned me, I'd like to join you!"; 
//	description = "Das Alte Lager hat mich verbannt, ich möchte mich euch anschließen!"; 
	description = "Vypověděli mě ze Starého tábora, chtěl bych se přidat k vám!"; 
};

func int Sld_700_Lee_CHANGESIDE_Condition()
{ 
	if (Npc_KnowsInfo(hero,KDW_600_Saturas_GOTOLEE))
	{
		return TRUE;
	};

};

func void Sld_700_Lee_CHANGESIDE_Info()
{
//	AI_Output(other,self,"Sld_700_Lee_CHANGESIDE_Info_15_01"); //The Old Camp has banned me, I'd like to join you!
//	AI_Output(other,self,"Sld_700_Lee_CHANGESIDE_Info_15_01"); //Das Alte Lager hat mich verbannt, ich möchte mich euch anschließen!
	AI_Output(other,self,"Sld_700_Lee_CHANGESIDE_Info_15_01"); //Vypověděli mě ze Starého tábora, chtěl bych se přidat k vám!
//	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //You've done much for our camp. I can make good use of men like you.
//	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //Du hast viel für unser Lager getan. Männer wie dich kann ich gebrauchen.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //Udělal jsi toho pro náš tábor mnoho. Pro muže, jako jsi ty, budu mít vždycky dobré místo.
//	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_03"); //Let's keep it short. Welcome to the New Camp, MERCENARY!
//	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_03"); //Machen wir es kurz. Willkommen im Neuen Lager, SÖLDNER!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_03"); //Zkrátíme to. Vítej do Nového tábora, ŽOLDÁKU!
//	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_04"); //Here take some armor. Good that you're here with us.
//	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_04"); //Hier ist eine von unseren Rüstungen. Gut, dass du bei uns bist.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_04"); //Tady je zbroj. Dobře, že jsi tu s náma.

	CreateInvItem(self,SLD_ARMOR_M);
	B_GiveInvItems(self,hero,SLD_ARMOR_M,1);
	Npc_GetInvItemBySlot(hero,INV_ARMOR, 2);
	if (Hlp_GetInstanceID(item)==SLD_ARMOR_M)
	{ 
		AI_EquipArmor (hero,item);
	};

	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;

//	B_LogEntry(CH4_BannedFromOC,"I've changed sides. After the Old Camp has banished me, I've now joined the mercenaries. Now let's get back to Saturas!");
//	B_LogEntry(CH4_BannedFromOC,"Ich habe Lee über Gorns und mein Aufräumen in der freien Mine informiert. Er zeigte sich sehr zufrieden.");
	B_LogEntry(CH4_BannedFromOC,"Informoval jsem Leeho o čistce, kterou jsme s Gornem provedli ve Svobodném dole. Byl velmi potěšen.");

	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
//	B_LogEntry(GE_TeacherNC,"Lee can teach me to fight with TWO-HANDED WEAPONS. Apart from that, he can teach me to improve my STRENGTH and my DEXTERITY.");
//	B_LogEntry(GE_TeacherNC,"Lee kann mir den Kampf mit ZWEIHÄNDIGEN Waffen beibringen. Außerdem kann er mich lehren, meine STÄRKE und mein GESCHICK zu verbessern.");
	B_LogEntry(GE_TeacherNC,"Lee mě může naučit bojovat s OBOURUČNÍMI ZBRANĚMI. Kromě toho mi může pomoci zdokonalit moji SÍLU a OBRATNOST. ");
};  

/*------------------------------------------------------------------------
							ARMOR 
------------------------------------------------------------------------*/
instance Sld_700_Lee_ARMOR(C_INFO)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ARMOR_Condition;
	information = Sld_700_Lee_ARMOR_Info;
	important = 0;
	permanent = 1;
//	description = "I need a better armor."; 
//	description = "Ich brauche eine bessere Rüstung"; 
	description = "Potřebuju lepší zbroj."; 
};

func int Sld_700_Lee_ARMOR_Condition()
{ 
	if (Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return TRUE;
	};

};
func void Sld_700_Lee_ARMOR_Info()
{
//	AI_Output(other,self,"Sld_700_Lee_ARMOR_Info_15_01"); //I need a better armor.
//	AI_Output(other,self,"Sld_700_Lee_ARMOR_Info_15_01"); //Ich brauche eine bessere Rüstung.
	AI_Output(other,self,"Sld_700_Lee_ARMOR_Info_15_01"); //Potřebuju lepší zbroj.
//	AI_Output(self,other,"Sld_700_Lee_ARMOR_Info_08_02"); //You'll first have to earn your armor. Apart from that they don't come cheap.
//	AI_Output(self,other,"Sld_700_Lee_ARMOR_Info_08_02"); //Die Rüstungen musst du dir erst verdienen. Außerdem sind sie nicht ganz billig.
	AI_Output(self,other,"Sld_700_Lee_ARMOR_Info_08_02"); //Na svoji zbroj si musíš nejdříve vydělat. Nehledě na to, že tě přijde draho.

	Info_ClearChoices(Sld_700_Lee_ARMOR);
//	Info_AddChoice(Sld_700_Lee_ARMOR,"DIALOG_BACK",Sld_700_Lee_ARMOR_BACK);
	Info_AddChoice(Sld_700_Lee_ARMOR,DIALOG_BACK,Sld_700_Lee_ARMOR_BACK);
//	Info_AddChoice(Sld_700_Lee_ARMOR,"B_BuildBuyArmorString(NAME_LeeMercs, VALUE_SLD_ARMOR_M) ",Sld_700_Lee_ARMOR_M);
	Info_AddChoice(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeMercs, VALUE_SLD_ARMOR_M),Sld_700_Lee_ARMOR_M);
//	Info_AddChoice(Sld_700_Lee_ARMOR,"B_BuildBuyArmorString(NAME_LeeHeavyMercs, VALUE_SLD_ARMOR_H)",Sld_700_Lee_ARMOR_H);
	Info_AddChoice(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeHeavyMercs, VALUE_SLD_ARMOR_H),Sld_700_Lee_ARMOR_H);
};  
func void Sld_700_Lee_ARMOR_BACK()
{
	Info_ClearChoices(Sld_700_Lee_ARMOR);
};
func void Sld_700_Lee_ARMOR_M()
{
//	AI_Output(other,self,"Sld_700_Lee_ARMOR_M_Info_08_01"); //I'd like to have the medium armor.
//	AI_Output(other,self,"Sld_700_Lee_ARMOR_M_Info_08_01"); //Ich möchte die mittelschwere Rüstung haben.
	AI_Output(other,self,"Sld_700_Lee_ARMOR_M_Info_08_01"); //Chtěl bych střední zbroj.
	if (Kapitel < 3)
	{
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_02"); //You're not experienced enough to wear better armor. Come back as soon as you've gained more experience.
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_02"); //Du bist noch nicht so weit, eine bessere Rüstung zu tragen. Komm wieder, wenn du erfahrener geworden bist.
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_02"); //Ještě nejsi dost zkušený, abys nosil lepší zbroj. Přijď, až budeš mít víc zkušeností.
	}
	else if (Npc_HasItems(hero,ItMinugget) < VALUE_SLD_ARMOR_M) 
	{
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_03"); //Without ore you won't get any armor either.
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_03"); //Ohne Erz gibt es auch keine Rüstung.
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_03"); //Bez rudy nedostaneš žádnou zbroj.
	}
	else 
	{
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_04"); //This armor is a good piece of work. It'll protect your body well.
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_04"); //Diese Rüstung ist ein ordentliches Stück Arbeit. Sie wird deinen Körper gut schützen.
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_04"); //Tahle zbroj je pěkná práce. Ochrání tvé tělo velmi dobře.
		B_GiveInvItems(hero,self,ItMinugget,VALUE_SLD_ARMOR_M);
		CreateInvItem(hero,SLD_ARMOR_M);

		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};
func void Sld_700_Lee_ARMOR_H()
{
//	AI_Output(other,self,"Sld_700_Lee_ARMOR_H_Info_08_01"); //Give me the heavy armor.
//	AI_Output(other,self,"Sld_700_Lee_ARMOR_H_Info_08_01"); //Gib mir die schwere Rüstung.
	AI_Output(other,self,"Sld_700_Lee_ARMOR_H_Info_08_01"); //Dej mi těžkou zbroj.
	if (Kapitel < 4)
	{
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_02"); //You're not experienced enough to wear the heavy armor. Come back as soon as you've gained more experience.
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_02"); //Du bist noch nicht so weit, die schwere Rüstung zu tragen. Komm wieder, wenn du erfahrener geworden bist.
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_02"); //Ještě nejsi dost zkušený, abys nosil těžkou zbroj. Přijď, až budeš mít víc zkušeností.
	}
	else if (Npc_HasItems(hero,ItMinugget) < VALUE_SLD_ARMOR_H) 
	{
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_03"); //Without ore you won't get armor either.
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_03"); //Ohne Erz gibt es auch keine Rüstung.
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_03"); //Bez rudy nedostaneš žádnou zbroj.
	}
	else 
	{
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_04"); //This armor is the best piece you'll ever get inside the Barrier. And believe me, it's worth the ore.
//		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_04"); //Diese Rüstung ist das Beste, was du in der Barriere bekommen kannst. Und, glaub mir, sie ist das Erz wert.
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_04"); //Tahle zbroj je nejlepší kousek, jaký kdy byl uvnitř Bariéry. A věř mi, má cenu rudy.
		B_GiveInvItems(hero,self,ItMinugget,VALUE_SLD_ARMOR_H);

		CreateInvItem(hero,SLD_ARMOR_H); //SN: ohne B_GiveInvItem, weil sonst Lee nackt dasteht!

		// nur wegen Bildschirmausgabe "1 Gegenstand erhalten"
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};

};
/*------------------------------------------------------------------------
							STR + DEX 
------------------------------------------------------------------------*/
instance Sld_700_Lee_Teach(C_INFO)
{
	npc = Sld_700_Lee;
	nr = 10;
	condition = Sld_700_Lee_Teach_Condition;
	information = Sld_700_Lee_Teach_Info;
	permanent = 1;
//	description = "Can you teach me something?";
//	description = "Kannst du mir was beibringen?";
	description = "Můžeš mě něco naučit?";
};                       

func int Sld_700_Lee_Teach_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_SLD)

	{
		return TRUE;
	};
};

func void Sld_700_Lee_Teach_Info()
{
//	AI_Output(other,self,"Sld_700_Lee_Teach_15_00"); //Can you teach me something?
//	AI_Output(other,self,"Sld_700_Lee_Teach_15_00"); //Kannst du mir was beibringen?
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00"); //Můžeš mě něco naučit?
//	AI_Output(self,other,"Sld_700_Lee_Teach_08_01"); //I can help you to get stronger and more dexterous.
//	AI_Output(self,other,"Sld_700_Lee_Teach_08_01"); //Ich kann dir helfen, stärker und geschickter zu werden.
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01"); //Můžu ti pomoci stát se silnější a obratnější.

	Info_ClearChoices(Sld_700_Lee_Teach);
//	Info_AddChoice(Sld_700_Lee_Teach,"DIALOG_BACK																",Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK ,Sld_700_Lee_Teach_BACK);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		",Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		",Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	",Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		",Sld_700_Lee_Teach_DEX_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_BACK()
{

	Info_ClearChoices(Sld_700_Lee_Teach);
};

func void Sld_700_Lee_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Sld_700_Lee_Teach);
//	Info_AddChoice(Sld_700_Lee_Teach,"DIALOG_BACK																",Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK ,Sld_700_Lee_Teach_BACK);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		",Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		",Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	",Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		",Sld_700_Lee_Teach_DEX_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Sld_700_Lee_Teach);
//	Info_AddChoice(Sld_700_Lee_Teach,"DIALOG_BACK																",Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK ,Sld_700_Lee_Teach_BACK);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		",Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		",Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	",Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		",Sld_700_Lee_Teach_DEX_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Sld_700_Lee_Teach);
//	Info_AddChoice(Sld_700_Lee_Teach,"DIALOG_BACK																",Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK ,Sld_700_Lee_Teach_BACK);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		",Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		",Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	",Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		",Sld_700_Lee_Teach_DEX_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Sld_700_Lee_Teach);
//	Info_AddChoice(Sld_700_Lee_Teach,"DIALOG_BACK																",Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK ,Sld_700_Lee_Teach_BACK);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		",Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		",Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	",Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
//	Info_AddChoice(Sld_700_Lee_Teach,"B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		",Sld_700_Lee_Teach_DEX_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};
//-------------------------------------------------------------------------
// ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance Sld_700_Lee_ZWEIHAND1(C_INFO)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ZWEIHAND1_Condition;
	information = Sld_700_Lee_ZWEIHAND1_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
//	description = B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
	description = B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0); 
};

func int Sld_700_Lee_ZWEIHAND1_Condition()
{ 
	if ( 
			(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
			&& ((Npc_GetTrueGuild(hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  ) //jetzt auch als Wassermagier im 4. Kapitel möglich ***BJÖRN***
		)
	{
		return TRUE;
	};

};
func void Sld_700_Lee_ZWEIHAND1_Info()
{
//	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND1_Info_15_01"); //I want to learn how to handle a two-handed sword.
//	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND1_Info_15_01"); //Ich möchte den Umgang mit Zweihändern lernen.
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND1_Info_15_01"); //Chci se naučit zacházet s obouručním mečem.

	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_02"); //Okay, let's go through the basics first.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_02"); //Nun, dann gehen wir zuerst die Grundbegriffe durch.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_02"); //Dobře, ale nejdřív musíme pobrat základy.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_03"); //Hold the sword in a horizontal position. You'll need a great swing to attack your opponent with such a heavy weapon.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_03"); //Halte das Schwert waagerecht. Um den Gegner mit einer großen Waffe anzugreifen, brauchst du viel Schwung.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_03"); //Meč musíš držet vodorovně. Potřebuješ silnější rozmach, abys mohl na nepřítele zaútočit takovou těžkou zbraní.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_04"); //Raise your arm and swing it straight down. That's usually enough to knock the opponent down.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_04"); //Hole mit der Waffe aus und schlage am besten direkt von oben. Meistens reicht das aus, um den Gegner zu Boden zu strecken.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_04"); //Zvedni ruku a rozmáchni se rovnou dolu. To obvykle stačí na to, abys nepřítele srazil k zemi.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_05"); //Use the momentum of the weapon to bring it straight back up again.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_05"); //Nutze den Schwung, wenn die Waffe unten ist, um direkt wieder nach oben zu schlagen.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_05"); //Toho momentu pak využiješ k novému rozmáchnutí.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_06"); //Two-handed swords are ideal for coordinating side hits to keep the opponents at a distance.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_06"); //Seitliche Schläge lassen sich ausgezeichnet mit einem Zweihänder koordinieren. Damit hältst du dir die Gegner vom Hals.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_06"); //Obouruční meče jsou ideální k zasazování bočních úderů, kterými si nepřítele udržíš od těla.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_07"); //That should do to begin with. Have a practice.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_07"); //Das sollte erst einmal reichen. Übe das!
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_07"); //To by mohlo pro začátek stačit. Trénuj.

		Sld_700_Lee_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
// ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance Sld_700_Lee_ZWEIHAND2(C_INFO)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ZWEIHAND2_Condition;
	information = Sld_700_Lee_ZWEIHAND2_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
//	description = B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
	description = B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0); 
};

func int Sld_700_Lee_ZWEIHAND2_Condition()
{ 
	if
		( 
			(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
			&& ((Npc_GetTrueGuild(hero) == GIL_SLD) ||  ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  ) //jetzt auch als Wassermagier im 4. Kapitel möglich ***BJÖRN***
		)
	{
		return TRUE;
	};

};
func void Sld_700_Lee_ZWEIHAND2_Info()
{
//	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND2_Info_15_01"); //I want to learn more about fighting with a two-handed sword.
//	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND2_Info_15_01"); //Ich möchte mehr über den zweihändigen Kampf lernen.
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND2_Info_15_01"); //Chci se dozvědět víc o boji s obouručním mečem.

	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_02"); //First of all, you need to change your basic stance. Hold the sword vertically, grasp the hilt firmly in both hands and hold it at the side of your body.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_02"); //Ändere zunächst deine Grundhaltung. Halte das Schwert aufrecht, fasse den Griff mit beiden Händen und halte es seitlich am Körper.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_02"); //Ze všeho nejdříve musíš zaujmout základní postoj. Meč musíš držet svisle, stranou od těla a údery vést silně oběma rukama.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_03"); //Bring it down quickly and swing the blade over your shoulder. Now's your chance to do a quick slash to your right.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_03"); //Schlage schnell von oben und lass die Klinge über deine Schulter gleiten. Nun hast du die Möglichkeit, einen schnellen Schlag nach rechts zu machen.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_03"); //Švihnout rychle dolu a ostří vést přes rameno. Pak máš šanci provést rychlý švih napravo.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_04"); //Your opponent won't stand a chance of coming at you.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_04"); //Damit bietest du dem Gegner keine Chance, an dich ranzukommen.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_04"); //Tvůj protivník nebude mít šanci se k tobě dostat.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_05"); //Or bring the sword down from the top left in a forward thrust to drive your opponent back.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_05"); //Sonst schlage wieder von links oben nach vorne, um so den Gegner zurückzutreiben.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_05"); //Nebo mečem švihni z levé horní strany směrem dopředu, abys odrazil protivníka dozadu.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_06"); //Spin round to give your next blow the necessary momentum to strike your opponent down.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_06"); //Eine schnelle Körperdrehung verleiht deinem nächsten Schlag die nötige Wucht, um den Gegner zu Boden zu zwingen.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_06"); //Pořád se otáčej, abys následnému švihu vždy dodával potřebnou sílu, která protivníka srazí.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_07"); //If it isn't enough, use your remaining swing to wield the sword again.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_07"); //Falls das nicht ausreichen sollte, dann nutze den übrigen Schwung, um die Klinge noch einmal tanzen zu lassen.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_07"); //Pokud to nebude stačit, zbylý švih využij k novému napřáhnutí meče.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_08"); //When you've finished your attack, block your opponent and wait for an opening to strike again.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_08"); //Geh nach deinem Angriff in den Block und suche eine Lücke, damit du erneut zuschlagen kannst.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_08"); //Až útok dokončíš, zneškodni protivníka a vyčkej na další souboj.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_09"); //The key to success is varying your stances and changing positions.
//		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_09"); //Abwechslung in den Kampfbewegungen und Positionswechsel sind der Schlüssel zum Sieg.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_09"); //Klíčem k úspěchu je měnit postoje a polohy.

		Sld_700_Lee_ZWEIHAND2.permanent = 0;
	};
};  
