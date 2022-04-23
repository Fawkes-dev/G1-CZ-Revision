// ************************ EXIT **************************

instance Info_Riordian_EXIT(C_INFO)
{
	npc = KDW_605_Riordian;
	nr = 999;
	condition = Info_Riordian_EXIT_Condition;
	information = Info_Riordian_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void Info_Riordian_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if (!Npc_HasItems(self,ItArRuneThunderball))
	{
		CreateInvItem(self,ItArRuneThunderball);
	};

};

//#####################################################################
//##
//##
//## KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************//Bist du der Wassermagier, der die Tränke braut?
instance Info_Riordian_NEWS(C_INFO)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_NEWS_Condition;
	information = Info_Riordian_NEWS_Info;
	permanent = 0;
	important = 0;
//	description = "Saturas sent me.";
//	description = "Saturas schickt mich.";
	description = "Saturas mě poslal.";
};

func int Info_Riordian_NEWS_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_OFFER))
	{
		return TRUE;
	};
};

func void Info_Riordian_NEWS_Info()
{
//	AI_Output(other,self,"Info_Riordian_NEWS_15_01"); //Saturas sent me.
//	AI_Output(other,self,"Info_Riordian_NEWS_15_01"); //Saturas schickt mich.
	AI_Output(other,self,"Info_Riordian_NEWS_15_01"); //Saturas mě poslal.
//	AI_Output(self,other,"Info_Riordian_NEWS_14_02"); //Ahhh, come here. I've already been informed.
//	AI_Output(self,other,"Info_Riordian_NEWS_14_02"); //Ahhh, komm näher. Ich bin bereits informiert.
	AI_Output(self,other,"Info_Riordian_NEWS_14_02"); //Á, tak pojď. Už mi říkali.
//	AI_Output(self,other,"Info_Riordian_NEWS_14_03"); //Here, take these potions, they're potions of all kinds.
//	AI_Output(self,other,"Info_Riordian_NEWS_14_03"); //Hier nimm diese Tränke, da ist von jedem was dabei.
	AI_Output(self,other,"Info_Riordian_NEWS_14_03"); //Tady si vezmi lektvar, ten vyléčí všechny neduhy.
//	AI_Output(self,other,"Info_Riordian_NEWS_14_04"); //Now go and bring us the focus stones. These artefacts are our only hope.
//	AI_Output(self,other,"Info_Riordian_NEWS_14_04"); //Nun geh und bring uns die Fokussteine. Diese Artefakte sind unsere einzige Hoffnung.
	AI_Output(self,other,"Info_Riordian_NEWS_14_04"); //Teď jdi a přines nám ohniskové kameny. Ty jsou naší jedinou nadějí.

	CreateInvItems(self,ItFo_Potion_Health_01, 20);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_01, 20); //Notwendig für die Ausschrift "20 Items übergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_01, 15);

	CreateInvItems(hero,ItFo_Potion_Mana_01, 5);
	CreateInvItems(hero,ItFo_Potion_Health_02, 2);
	CreateInvItems(hero,ItFo_Potion_Mana_02, 2);
	CreateInvItems(hero,ItFo_Potion_Health_03,1);
	CreateInvItems(hero,ItFo_Potion_Mana_03,1);
	CreateInvItems(hero,ItFo_Potion_Haste_02, 2);
	CreateInvItems(hero,ItFo_Potion_Strength_01,1);
	CreateInvItems(hero,ItFo_Potion_Dex_01,1);
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Riordian_REWARD(C_INFO)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_REWARD_Condition;
	information = Info_Riordian_REWARD_Info;
	permanent = 0;
	important = 0;
//	description = "Saturas said you had a reward for me?";
//	description = "Saturas sagt, du hättest eine Belohnung für mich?";
	description = "Saturas řekl, že mě máš odměnit.";
};

func int Info_Riordian_REWARD_Condition()
{
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};
};

func void Info_Riordian_REWARD_Info()
{
//	AI_Output(other,self,"Info_Riordian_REWARD_15_01"); //Saturas said you had a reward for me?
//	AI_Output(other,self,"Info_Riordian_REWARD_15_01"); //Saturas sagt, du hättest eine Belohnung für mich?
	AI_Output(other,self,"Info_Riordian_REWARD_15_01"); //Saturas řekl, že mě máš odměnit.
//	AI_Output(self,other,"Info_Riordian_REWARD_14_02"); //Ahhhh, come here, come here.
//	AI_Output(self,other,"Info_Riordian_REWARD_14_02"); //Ahhhh, komm näher, komm näher.
	AI_Output(self,other,"Info_Riordian_REWARD_14_02"); //Á, pojď dál, pojď dál.
//	AI_Output(self,other,"Info_Riordian_REWARD_14_03"); //Our spiritual leader has told me about your heroic deeds.
//	AI_Output(self,other,"Info_Riordian_REWARD_14_03"); //Unser spiritueller Führer hat mir von deinen Heldentaten berichtet.
	AI_Output(self,other,"Info_Riordian_REWARD_14_03"); //Náš duchovní vůdce mi vyprávěl o tvých hrdinských činech.
//	AI_Output(self,other,"Info_Riordian_REWARD_14_04"); //All the people in the Camp - no, the whole colony -are deeply indebted to you.
//	AI_Output(self,other,"Info_Riordian_REWARD_14_04"); //Wir alle hier im Lager, ja in der ganzen Kolonie sind dir zu großem Dank verpflichtet.
	AI_Output(self,other,"Info_Riordian_REWARD_14_04"); //Všichni lidé v táboře - ne, v celé kolonii - jsou ti hluboce zavázaní.
//	AI_Output(self,other,"Info_Riordian_REWARD_14_05"); //Take this as a modest reward for all your efforts.
//	AI_Output(self,other,"Info_Riordian_REWARD_14_05"); //Nimm dies als einen bescheidenen Ausgleich für all deine Mühen.
	AI_Output(self,other,"Info_Riordian_REWARD_14_05"); //Přijmi tuhle malou odměnu za všechno tvoje úsilí.

	CreateInvItems(self,ItFo_Potion_Health_02, 20);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_02, 20);//Notwenidg für Ausschrift "20 Items übergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_02, 15);

	CreateInvItems(hero,ItFo_Potion_Mana_02, 5);
	CreateInvItems(hero,ItFo_Potion_Health_03, 2);
	CreateInvItems(hero,ItFo_Potion_Mana_03, 2);
	CreateInvItems(hero,ItFo_Potion_Haste_02, 3);
	CreateInvItems(hero,ItFo_Potion_Master_01,1);
	CreateInvItems(hero,ItFo_Potion_Health_Perma_02,1);
	CreateInvItems(hero,ItFo_Potion_Mana_Perma_02,1);

//	B_LogEntry(CH3_BringFoci,"Riordian was as open-minded as usually. He gave me loads of potions. I'm sure they'll be of good use to me.");
//	B_LogEntry(CH3_BringFoci,"Riordian war aufgeschlossen wie immer. Er übergab mir einen ganzen Haufen Tränke, die ich bestimmt noch sehr gut gebrauchen kann.");
	B_LogEntry(CH3_BringFoci,"Riordian byl  jako vždy hlava otevřená. Dal mi spoustu lektvarů. Myslím, že mi jich bude zapotřebí.");
	if Npc_KnowsInfo(hero,Info_Cronos_REWARD)
	{
		Log_SetTopicStatus(CH3_BringFoci,LOG_SUCCESS);
	};
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info MESSAGE
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGE(C_INFO)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGE_Condition;
	information = Info_Riordian_MESSAGE_Info;
	permanent = 0;
	important = 1;
};

func int Info_Riordian_MESSAGE_Condition()
{
	if UrShak_SpokeOfUluMulu
	&& !EnteredFreeMine
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGE_Info()
{
//	AI_Output(self,hero,"Info_Riordian_MESSAGE_14_01"); //I'm glad you've come! I've been expecting you!
//	AI_Output(self,hero,"Info_Riordian_MESSAGE_14_01"); //Gut, dass du kommst! Ich habe schon auf dich gewartet!
	AI_Output(self,hero,"Info_Riordian_MESSAGE_14_01"); //Jsem rád, že jsi přišel! Očekával jsem tě!
};

//---------------------------------------------------------------------
//	Info MESSAGEWHY
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGEWHY(C_INFO)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGEWHY_Condition;
	information = Info_Riordian_MESSAGEWHY_Info;
	permanent = 0;
	important = 0;
//	description = "You've been expecting me? Why?";
//	description = "Du hast auf mich gewartet? Warum?";
	description = "Očekával jsi mě? Jak to?";
};

func int Info_Riordian_MESSAGEWHY_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGEWHY_Info()
{
//	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_01"); //You've been expecting me? Why?
//	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_01"); //Du hast auf mich gewartet? Warum?
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_01"); //Očekával jsi mě? Jak to?
//	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_02"); //Gorn asked me to send you to him as soon as you arrived!
//	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_02"); //Gorn bat mich, dich bei deinem Auftauchen hier sofort zu ihm zu schicken!
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_02"); //Gorn mi říkal, abych tě k němu poslal ihned, jak přijdeš!
//	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_03"); //What's up?
//	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_03"); //Was ist los?
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_03"); //Co se děje?
//	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_04"); //He has a plan to free the occupied mine.
//	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_04"); //Er hat einen Plan zur Befreiung der besetzten Mine.
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_04"); //Má plán na osvobození obsazeného dolu.
//	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_05"); //Is he still guarding the entrance to the mine?
//	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_05"); //Bewacht er noch den Zugang zur Mine?
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_05"); //Střeží pořád vchod toho dolu?
//	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_06"); //Yes! Please see him as soon as possible!
//	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_06"); //Ja! Bitte suche ihn so schnell wie möglich auf!
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_06"); //Ano! Zajdi za ním, prosím, co nejdříve!
};
/*------------------------------------------------------------------------
//							WELCOME //
------------------------------------------------------------------------*/
instance KDW_605_Riordian_WELCOME(C_INFO)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_WELCOME_Condition;
	information = KDW_605_Riordian_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int KDW_605_Riordian_WELCOME_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_KDW )

	{
		return TRUE;
	};
};
func void KDW_605_Riordian_WELCOME_Info()
{
//	AI_Output(self,other,"KDW_605_Riordian_WELCOME_Info_14_01"); //I'm glad you've joined us.
//	AI_Output(self,other,"KDW_605_Riordian_WELCOME_Info_14_01"); //Gut, dass du uns beigetreten bist.
	AI_Output(self,other,"KDW_605_Riordian_WELCOME_Info_14_01"); //Jsem rád, že ses dal k nám.
};
//-----------------------------------------------------------
instance KDW_605_Riordian_HEAL(C_INFO)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_HEAL_Condition;
	information = KDW_605_Riordian_HEAL_Info;
	important = 1;
	permanent = 0;
};

func int KDW_605_Riordian_HEAL_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_KDW)
	&& (Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};
func void KDW_605_Riordian_HEAL_Info()
{
//	AI_Output(self,other,"KDW_605_Riordian_HEAL_Info_14_01"); //If you're injured, I will heal you.
//	AI_Output(self,other,"KDW_605_Riordian_HEAL_Info_14_01"); //Wenn du verletzt bist, werde ich dich heilen.
	AI_Output(self,other,"KDW_605_Riordian_HEAL_Info_14_01"); //Jestliže budeš zraněn, já tě vyhojím.
};
// ***************************** INFOS ****************************************//

instance KDW_605_Riordian_HEALINFO(C_INFO)
{
	npc = KDW_605_Riordian;
	nr = 100;
	condition = KDW_605_Riordian_HEALINFO_Condition;
	information = KDW_605_Riordian_HEALINFO_Info;
	important = 0;
	permanent = 1;
//	description = "I'm injured. Can you heal me?";
//	description = "Ich bin verletzt. Kannst du mich heilen?";
	description = "Jsem zraněn. Dokážeš mě vyhojit?";
};

func int KDW_605_Riordian_HEALINFO_Condition()
{
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	&& (Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};

};
func void KDW_605_Riordian_HEALINFO_Info()
{
//	AI_Output(other,self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //I'm injured. Can you heal me?
//	AI_Output(other,self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //Ich bin verletzt. Kannst du mich heilen?
	AI_Output(other,self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //Jsem zraněn. Dokážeš mě vyhojit?
//	AI_Output(self,other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Through my words I call upon the powers of healing, your body and spirit shall be well!
//	AI_Output(self,other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Durch mein Wort rufe ich die Kraft der Heilung und lasse diesen Körper und den Geist gesunden!
	AI_Output(self,other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Těmito slovy vyvolávám léčivé síly a tvoje tělo i duše budou uzdraveny!

	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
	Snd_Play("MFX_Heal_Cast");
};
/*------------------------------------------------------------------------
							GREET
------------------------------------------------------------------------*/

instance KDW_605_Riordian_GREET(C_INFO)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_GREET_Condition;
	information = KDW_605_Riordian_GREET_Info;
	important = 0;
	permanent = 0;
//	description = "Greetings, Magician!";
//	description = "Ich grüße dich Magier";
	description = "Buď pozdraven, mágu.";
};

func int KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};

func void KDW_605_Riordian_GREET_Info()
{
//	AI_Output(other,self,"KDW_605_Riordian_GREET_Info_15_01"); //Greetings, Magician!
//	AI_Output(other,self,"KDW_605_Riordian_GREET_Info_15_01"); //Ich grüße dich Magier!
	AI_Output(other,self,"KDW_605_Riordian_GREET_Info_15_01"); //Buď pozdraven, mágu.
//	AI_Output(self,other,"KDW_605_Riordian_GREET_Info_14_02"); //I am Riordian, the alchemist. I gather you want a potion?
//	AI_Output(self,other,"KDW_605_Riordian_GREET_Info_14_02"); //Ich bin Riordian, der Alchemist. Du willst bestimmt einen Trank?
	AI_Output(self,other,"KDW_605_Riordian_GREET_Info_14_02"); //Jsem Riordian, alchymista. Ty určitě chceš nějaký lektvar?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
//	B_LogEntry(GE_TraderNC,"Riordian, the Magician of Water, trades with POTIONS. He is in the alchemy lab on the upper level.");
//	B_LogEntry(GE_TraderNC,"Riordian der Wassermagier handelt mit TRÄNKEN. Er ist im Alchemielabor auf der obersten Ebene zu finden.");
	B_LogEntry(GE_TraderNC,"Riordian, mág Vody, obchoduje s LEKTVARY. Bývá v alchymistické dílně v horní rovině.");

};
/*------------------------------------------------------------------------
							TRADE
------------------------------------------------------------------------*/

instance KDW_605_Riordian_TRADE(C_INFO)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_TRADE_Condition;
	information = KDW_605_Riordian_TRADE_Info;
	important = 0;
	permanent = 1;
//	description = "Show me your goods.";
//	description = "Zeig mir deine Ware";
	description = "Ukaž mi svoje zboží.";
	trade = 1;
};

func int KDW_605_Riordian_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};

};
func void KDW_605_Riordian_TRADE_Info()
{
//	AI_Output(other,self,"KDW_605_Riordian_TRADE_Info_15_01"); //Show me your goods.
//	AI_Output(other,self,"KDW_605_Riordian_TRADE_Info_15_01"); //Zeig mir deine Ware.
	AI_Output(other,self,"KDW_605_Riordian_TRADE_Info_15_01"); //Ukaž mi svoje zboží.

};
