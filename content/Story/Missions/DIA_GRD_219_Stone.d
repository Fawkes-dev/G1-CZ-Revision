//*****************************************
//				EXIT UNTEN
//*****************************************

// ************************************************************
//							Hello
// ************************************************************

instance DIA_Stone_Hello(C_INFO)
{
	npc = Grd_219_Stone;
	nr = 1;
	condition = DIA_Stone_Hello_Condition;
	information = DIA_Stone_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "You're the smith, aren't you?";
//	description = "Du bist der Schmied, richtig?";
	description = "Ty jsi kovář, viď?";
};

func int DIA_Stone_Hello_Condition()
{
	if (Kapitel < 4)
	{
		return 1;
	};

	return 0;
};

func void DIA_Stone_Hello_Info()
{
//	AI_Output(other,self,"DIA_Stone_Hello_15_00"); //You're the smith, aren't you?
//	AI_Output(other,self,"DIA_Stone_Hello_15_00"); //Du bist der Schmied, richtig?
	AI_Output(other, self, "DIA_Stone_Hello_15_00"); //Ty jsi kovář, viď?
//	AI_Output(self,other,"DIA_Stone_Hello_06_01"); //That's right.
//	AI_Output(self,other,"DIA_Stone_Hello_06_01"); //Richtig.
	AI_Output(self, other, "DIA_Stone_Hello_06_01"); //Ano.
};

// ************************************************************
//							Kaufen
// ************************************************************

instance DIA_Stone_NotSelling(C_INFO)
{
	npc = Grd_219_Stone;
	nr = 1;
	condition = DIA_Stone_NotSelling_Condition;
	information = DIA_Stone_NotSelling_Info;
	important = 0;
	permanent = 1;
//	description = "D'you sell weapons and armor?";
//	description = "Verkaufst du Waffen und Rüstungen?";
	description = "Prodáváš zbraně a zbroj?";
};

func int DIA_Stone_NotSelling_Condition()
{
	if ((Npc_GetTrueGuild(hero) != GIL_GRD)
	&& (Kapitel < 4))
	{
		return 1;
	};

	return 0;
};

func void DIA_Stone_NotSelling_Info()
{
//	AI_Output(other,self,"DIA_Stone_NotSelling_15_00"); //D'you sell weapons and armor?
//	AI_Output(other,self,"DIA_Stone_NotSelling_15_00"); //Verkaufst du Waffen und Rüstungen?
	AI_Output(other, self, "DIA_Stone_NotSelling_15_00"); //Prodáváš zbraně a zbroj?
//	AI_Output(self,other,"DIA_Stone_NotSelling_06_01"); //Skip deals with the weapons. I just hand out the armor.
//	AI_Output(self,other,"DIA_Stone_NotSelling_06_01"); //Um die Waffen kümmert sich Skip. Ich verteile nur die Rüstungen.
	AI_Output(self, other, "DIA_Stone_NotSelling_06_01"); //O zbraně se stará Skip. Já rozděluji zbroje.
//	AI_Output(other,self,"DIA_Stone_NotSelling_15_02"); //What kinds of armor have you got on offer?
//	AI_Output(other,self,"DIA_Stone_NotSelling_15_02"); //Was für Rüstungen hast du denn da?
	AI_Output(other, self, "DIA_Stone_NotSelling_15_02"); //Jaké zbroje mi můžeš nabídnout?
//	AI_Output(self,other,"DIA_Stone_NotSelling_06_03"); //Only armor for guards. And you're no guard. So you'll have to get your armor elsewhere!
//	AI_Output(self,other,"DIA_Stone_NotSelling_06_03"); //Nur Rüstungen für Gardisten. Und du bist keiner. Also wirst du dir deine Rüstung woanders besorgen müssen, du Arsch!
	AI_Output(self, other, "DIA_Stone_NotSelling_06_03"); //Jen zbroje pro strážce. A ty strážce nejsi. Takže si musíš zbroj obstarat někde jinde!
	AI_StopProcessInfos(self);
};

//-----------------------------------------------------
// RÜSTUNG UND SCHWERT ABHOLEN WENN DER SPIELER GARDIST IST
//-----------------------------------------------------
instance GRD_219_Stone_GETSTUFF(C_INFO)
{
	npc = GRD_219_Stone;
	condition = GRD_219_Stone_GETSTUFF_Condition;
	information = GRD_219_Stone_GETSTUFF_Info;
	important = 0;
	permanent = 0;
//	description = "I need armor.";
//	description = "Ich brauche eine Rüstung.";
	description = "Potřebuji zbroj.";
};

func int GRD_219_Stone_GETSTUFF_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return 1;
	};

	return 0;
};

func void GRD_219_Stone_GETSTUFF_Info()
{
//	AI_Output(other,self,"GRD_219_Stone_GETSTUFF_Info_15_01"); //I need armor.
//	AI_Output(other,self,"GRD_219_Stone_GETSTUFF_Info_15_01"); //Ich brauche eine Rüstung.
	AI_Output(other, self, "GRD_219_Stone_GETSTUFF_Info_15_01"); //Potřebuji zbroj.
//	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_02"); //So, Thorus has accepted you, eh? Congratulations!
//	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_02"); //Thorus hat dich in die Truppe aufgenommen? Glückwunsch!
	AI_Output(self, other, "GRD_219_Stone_GETSTUFF_Info_06_02"); //Takže tě Thorus přijal? Blahopřeji!
//	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_03"); //Another one eager to stick his neck out for Gomez. Oh well, what do I care?
//	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_03"); //Wieder einer mehr, der seinen Hals für Gomez in die Schlinge legt. Na, mir soll's recht sein.
	AI_Output(self, other, "GRD_219_Stone_GETSTUFF_Info_06_03"); //Další dychtivec, který by nastavil za Gomeze krk. No výborně, o co se mám postarat?
//	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_04"); //Here, takes this armor and sword. Welcome to the Guards.
//	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_04"); //Hier, nimm die Rüstung und dieses Schwert. Willkommen bei der Garde.
	AI_Output(self, other, "GRD_219_Stone_GETSTUFF_Info_06_04"); //Tady, vezmi si zbroj a tento meč. Vítej mezi stráže.

	CreateInvItems(self, ItMw_1H_Sword_03, 2);
	B_GiveInvItems(self, other, ItMw_1H_Sword_03, 2);
	Npc_RemoveInvItem(other, ItMw_1H_Sword_03);
	CreateInvItem(other, GRD_ARMOR_L);
	AI_EquipBestArmor(hero);
	AI_EquipBestMeleeWeapon(hero);

//	B_LogEntry(GE_BecomeGuard,"I've collected my first guard's armor at the smith Stone's. I could even buy better armor there, but he's prices are high.");
//	B_LogEntry(GE_BecomeGuard,"Ich habe meine erste Gardistenrüstung bei Stone dem Schmied abgeholt. Ich kann dort noch bessere Rüstungen kaufen, was er sich allerdings teuer bezahlen lässt.");
	B_LogEntry(GE_BecomeGuard, "U kováře Stonea jsem si vyzvedl svojí výbavu strážce. Mohu si u něj koupit lepší brnění, to bylo ovšem dost drahé.");

	AI_StopProcessInfos(self);
};

//-----------------------------------------------------
// BESSERE RÜSTUNG
//-----------------------------------------------------
instance GRD_219_Stone_BETTERARMOR(C_INFO)
{
	npc = GRD_219_Stone;
	condition = GRD_219_Stone_BETTERARMOR_Condition;
	information = GRD_219_Stone_BETTERARMOR_Info;
	important = 0;
	permanent = 1;
//	description = "I need better armor.";
//	description = "Ich brauche eine bessere Rüstung.";
	description = "Potřebuju lepší zbroj.";
};

func int GRD_219_Stone_BETTERARMOR_Condition()
{
	if ((Npc_KnowsInfo(hero, GRD_219_Stone_GETSTUFF))
	&& (Kapitel < 4))
	{
		return 1;
	};

	return 0;
};

func void GRD_219_Stone_BETTERARMOR_Info()
{
//	AI_Output(other,self,"GRD_219_Stone_BETTERARMOR_Info_15_01"); //I need better armor.
//	AI_Output(other,self,"GRD_219_Stone_BETTERARMOR_Info_15_01"); //Ich brauche eine bessere Rüstung.
	AI_Output(other, self, "GRD_219_Stone_BETTERARMOR_Info_15_01"); //Potřebuju lepší zbroj.
//	AI_Output(self,other,"GRD_219_Stone_BETTERARMOR_Info_06_02"); //You can have it when you're ready for it and only if you have enough ore...
//	AI_Output(self,other,"GRD_219_Stone_BETTERARMOR_Info_06_02"); //Wenn die Zeit gekommen ist und du genug Erz hast ...
	AI_Output(self, other, "GRD_219_Stone_BETTERARMOR_Info_06_02"); //Až přijde ten správný čas a až budeš mít dost rudy...

	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR, DIALOG_BACK, GRD_219_Stone_BETTERARMOR_BACK);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR, B_BuildBuyArmorString(NAME_StoneHeavyGuards, VALUE_GRD_ARMOR_H), GRD_219_Stone_BETTERARMOR_H);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR, B_BuildBuyArmorString(NAME_StoneGuards, VALUE_GRD_ARMOR_M), GRD_219_Stone_BETTERARMOR_M);
};

func void GRD_219_Stone_BETTERARMOR_M()
{
//	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01"); //I want a normal guard's armor.
//	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01"); //Ich möchte eine normale Garderüstung haben.
	AI_Output(hero, self, "GRD_219_Stone_BETTERARMOR_Info_M_15_01"); //Chci obyčejnou zbroj pro stráž.

	if (Kapitel < 3)
	{
//		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02"); //Thorus says you have to make your way as a guard before you can have better armor!
//		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02"); //Thorus sagt, du musst dich erst mal als Gardist bewähren, bevor du eine bessere Rüstung bekommen kannst, du Arsch!
		AI_Output(self, hero, "GRD_219_Stone_BETTERARMOR_Info_M_06_02"); //Thorus říká, že se musíš nejdříve osvědčit jako strážce, než dostaneš lepší zbroj.
	}
	else if (Npc_HasItems(hero, ItMiNugget) < VALUE_GRD_ARMOR_M)
	{
//		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03"); //I have one in stock, but you don't seem to have enough ore with you! Come back when you can afford it!
//		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03"); //Ich hätte eine hier, aber du scheinst nicht genug Erz dabei zu haben! Komm wieder, wenn du sie dir leisten kannst!
		AI_Output(self, hero, "GRD_219_Stone_BETTERARMOR_Info_M_06_03"); //Jednu tady mám, ale vypadá to, že na ni nemáš dost rudy! Vrať se, až si ji budeš moci dovolit!
	}
	else
	{
//		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04"); //Alright, here's your new guard's armor! Don't let the mercenaries make too many dents in it, hahaha!
//		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04"); //In Ordnung, hier ist deine neue Garderüstung! Lass sie dir nicht zu sehr von den Söldnern zerbeulen, hahaha!
		AI_Output(self, hero, "GRD_219_Stone_BETTERARMOR_Info_M_06_04"); //V pořádku, tady je tvá nová zbroj pro stráže! Nedovol žoldákům, aby ti ji moc poškodili, hahaha!
		B_GiveInvItems(hero, self, ItMiNugget, VALUE_GRD_ARMOR_M);
		//#NEEDS_ATTENTION funkcia B_GiveInvItems na 100% buguje pri presune zbroji. Idealne by sme mali vsetky dialogy, kde je pouzite B_GiveInvItems prepisat,
		//vytvorit item priamo u hraca v inventari a na obrazovku vypisat, aky item hrac dostal. #Immersion :TM:
		B_GiveInvItems(self, hero, GRD_ARMOR_M, 1);
		AI_EquipBestArmor(hero);
	};

	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_H()
{
//	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01"); //I want a heavy guard's armor.
//	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01"); //Ich möchte eine schwere Garderüstung haben.
	AI_Output(hero, self, "GRD_219_Stone_BETTERARMOR_Info_H_15_01"); //Chci těžkou zbroj pro strážce.
//	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_02"); //Only the upper class of guards can have one of them. And I'm afraid it's gonna be a long time before you make it that far.
//	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_02"); //Nur die höchsten Gardisten dürfen so eine Rüstung tragen. Und du bist noch nicht lange genug dabei, fürchte ich.
	AI_Output(self, hero, "GRD_219_Stone_BETTERARMOR_Info_H_06_02"); //Takovou může mít jedině vyšší třída stráží. Ale mám obavu, že do toho máš ještě hodně daleko.
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_BACK()
{
//	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01"); //I changed my mind
//	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01"); //Ich hab' es mir anders überlegt!
	AI_Output(hero, self, "GRD_219_Stone_BETTERARMOR_Info_BACK_15_01"); //Rozmyslel jsem se.
//	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02"); //Do as you please. You know where to find me!
//	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02"); //Wie du meinst. Du weißt, wo du mich findest!
	AI_Output(self, hero, "GRD_219_Stone_BETTERARMOR_Info_BACK_06_02"); //Jak myslíš. Víš, kde mě najdeš!

	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};

// ************************ EXIT **************************

instance DIA_GRD_219_Stone_Exit(C_INFO)
{
	npc = GRD_219_Stone;
	nr = 999;
	condition = DIA_GRD_219_Stone_Exit_Condition;
	information = DIA_GRD_219_Stone_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_GRD_219_Stone_Exit_Condition()
{
	return 1;
};

func void DIA_GRD_219_Stone_Exit_Info()
{
	if (Npc_KnowsInfo(hero, DIA_GRD_219_Stone4))
	{
		AI_StopProcessInfos(self);

		var C_Npc Stone; Stone = Hlp_GetNpc(GRD_219_Stone);

		TA_BeginOverlay(Stone);
		TA_Min(Stone, 00, 00, 00, 05, ZS_Position, "OCC_MERCS_HALLWAY_BACK");
		TA_Min(Stone, 00, 05, 00, 10, ZS_Position, "OCC_MERCS_ENTRANCE");
		TA_Min(Stone, 00, 10, 00, 15, ZS_Position, "OCC_SHADOWS_CORNER");
		TA_Min(Stone, 00, 15, 00, 20, ZS_Position, "OCC_STABLE_ENTRANCE");
		TA_Min(Stone, 00, 20, 72, 00, ZS_Position, "OCC_STABLE_LEFT_FRONT");
		TA_EndOverlay(Stone);

//		AI_Output(self,other,"Info_EXIT_06_02"); //I'll see you.
//		AI_Output(self,other,"Info_EXIT_06_02"); //Wir sehen uns.
		AI_Output(self, other, "Info_EXIT_06_02"); //Ještě se uvidíme.

		AI_StopProcessInfos(self);
	}
	else {
//		AI_Output(self,other,"Info_EXIT_06_03"); //I'll see you.
//		AI_Output(self,other,"Info_EXIT_06_03"); //Wir sehen uns.
		AI_Output(self, other, "Info_EXIT_06_03"); //Ještě se uvidíme.

		AI_StopProcessInfos(self);
	};
};

//#####################################################################
//##
//##
//## KAPITEL 5/6
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Begrüßung
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone(C_INFO)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone_Condition;
	information = DIA_GRD_219_Stone_Info;
	important = 1;
	permanent = 0;
};

func int DIA_GRD_219_Stone_Condition()
{
	if (Kapitel >= 5)
	{
		return 1;
	};

	return 0;
};

func void DIA_GRD_219_Stone_Info()
{
//	AI_Output(self,other,"DIA_GRD_219_Stone_06_01"); //What do you want? You don't look like one of Gomez' henchmen?
//	AI_Output(self,other,"DIA_GRD_219_Stone_06_01"); //Was willst du, du siehst nicht aus wie einer von Gomez' Schergen?
	AI_Output(self, other, "DIA_GRD_219_Stone_06_01"); //Co chceš, nevypadáš jako jeden z Gomezových poskoků.
};

//---------------------------------------------------------------------
//	Info Stone1
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone1(C_INFO)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone1_Condition;
	information = DIA_GRD_219_Stone1_Info;
	important = 0;
	permanent = 0;
//	description = "You're right, I'm not with Gomez.";
//	description = "Stimmt, ich gehöre nicht zu Gomez";
	description = "Máš pravdu, nejsem s Gomezem.";
};

func int DIA_GRD_219_Stone1_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GRD_219_Stone))
	{
		return 1;
	};

	return 0;
};

func void DIA_GRD_219_Stone1_Info()
{
//	AI_Output(other,self,"DIA_GRD_219_Stone1_15_01"); //You're right, I'm not with Gomez.
//	AI_Output(other,self,"DIA_GRD_219_Stone1_15_01"); //Stimmt, ich gehöre nicht zu Gomez.
	AI_Output(other, self, "DIA_GRD_219_Stone1_15_01"); //Máš pravdu, nejsem s Gomezem.
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_02"); //Then how did you get here? Gomez had the key to the dungeons...
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_02"); //Wie bist du dann hier rein gekommen? Gomez hatte den Schlüssel zum Kerker.
	AI_Output(self, other, "DIA_GRD_219_Stone1_06_02"); //Jak ses sem potom dostal? Gomez má klíč k vězení...
//	AI_Output(other,self,"DIA_GRD_219_Stone1_15_03"); //He gave it to me.
//	AI_Output(other,self,"DIA_GRD_219_Stone1_15_03"); //Er hat ihn mir überlassen.
	AI_Output(other, self, "DIA_GRD_219_Stone1_15_03"); //Přenechal mi ho.
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_04"); //Are you trying to tell me YOU're the guy that wiped out Gomez?
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_04"); //Du willst doch nicht andeuten, dass DU Gomez aus dem Weg geräumt hast?
	AI_Output(self, other, "DIA_GRD_219_Stone1_06_04"); //To mi chceš naznačit, že to TY jsi odstranil Gomeze?
//	AI_Output(other,self,"DIA_GRD_219_Stone1_15_05"); //That's me.
//	AI_Output(other,self,"DIA_GRD_219_Stone1_15_05"); //Doch, will ich.
	AI_Output(other, self, "DIA_GRD_219_Stone1_15_05"); //Ano, to chci.
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_06"); //Boy, I never thought you had it in you. But I'm glad the dirty cut-throat finally got what was coming to him.
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_06"); //Junge, das hätte ich dir gar nicht zugetraut, es freut mich aber, dass dieser dreckige Halsabschneider endlich das bekommen hat, was er verdient.
	AI_Output(self, other, "DIA_GRD_219_Stone1_06_06"); //Nikdy bych, hochu, neřekl, že zrovna ty bys to dokázal. Ale jsem rád, že ten hrdlořez konečně dostal to, co si zasloužil.
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_07"); //But why are you releasing me?
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_07"); //Aber warum hast du mich befreit?
	AI_Output(self, other, "DIA_GRD_219_Stone1_06_07"); //Proč jsi mě ale osvobodil?
//	AI_Output(other,self,"DIA_GRD_219_Stone1_15_08"); //I just heard you'd been locked away and I thought I'd take the opportunity of getting Gomez out of the way and rescuing you.
//	AI_Output(other,self,"DIA_GRD_219_Stone1_15_08"); //Ich habe gehört, dass du im Kerker bist, und habe die Gelegenheit genutzt, um Gomez ruhig zu stellen und dich zu befreien.
	AI_Output(other, self, "DIA_GRD_219_Stone1_15_08"); //Slyšel jsem, že jsi ve vězení, a využil jsem přílěžitosti odstranit Gomeze a tebe osvobodit.
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_09"); //Well, thank you...
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_09"); //Habe Dank ...
	AI_Output(self, other, "DIA_GRD_219_Stone1_06_09"); //Tisíceré díky...
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_10"); //... I'm much obliged to you. Come and see me at the smithy, we can talk there.
//	AI_Output(self,other,"DIA_GRD_219_Stone1_06_10"); //... ich stehe in deiner Schuld, triff mich in der Schmiede, dort reden wir weiter.
	AI_Output(self, other, "DIA_GRD_219_Stone1_06_10"); //...jsem tvým dlužníkem. Přijď za mnou do kovárny, tam si o tom můžeme promluvit.

	Npc_ExchangeRoutine(self, "OTNEW");
};

//---------------------------------------------------------------------
//	Info Stone3
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone3(C_INFO)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone3_Condition;
	information = DIA_GRD_219_Stone3_Info;
	important = 1;
	permanent = 0;
};

func int DIA_GRD_219_Stone3_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_GRD_219_Stone1))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), "OCC_STABLE_LEFT_FRONT")))
	{
		return 1;
	};

	return 0;
};

func void DIA_GRD_219_Stone3_Info()
{
//		AI_Output(self,other,"DIA_GRD_219_Stone3_06_01"); //There you are. I owe you for getting me out of that rat's nest, man!
//		AI_Output(self,other,"DIA_GRD_219_Stone3_06_01"); //Da bist du ja. Da du mich aus diesem Rattenloch befreit hast, hast du was gut bei mir, Mann!
	AI_Output(self, other, "DIA_GRD_219_Stone3_06_01"); //Tady jsi. Jsem ti vděčný, žes mě vytáhl z toho krysího doupěte.
//		AI_Output(self,other,"DIA_GRD_219_Stone3_06_02"); //You know, I was thinking: There's not much I can give you, so I'll forge something for you.
//		AI_Output(self,other,"DIA_GRD_219_Stone3_06_02"); //Ich habe mir überlegt, da es nicht viel gibt, was ich dir geben kann, werde ich dir etwas schmieden.
	AI_Output(self, other, "DIA_GRD_219_Stone3_06_02"); //Není toho moc, co bych ti mohl dát, ale mohl bych pro tebe něco ukovat.
//		AI_Output(self,other,"DIA_GRD_219_Stone3_06_03"); //Maybe a ring or some such thing...
//		AI_Output(self,other,"DIA_GRD_219_Stone3_06_03"); //Könnte ein Ring sein oder etwas Vergleichbares ...
	AI_Output(self, other, "DIA_GRD_219_Stone3_06_03"); //Možná prsten nebo něco takového...
};

//---------------------------------------------------------------------
//	Info Stone2
//---------------------------------------------------------------------
// Warum ist Stone im Kerker
instance DIA_GRD_219_Stone2(C_INFO)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone2_Condition;
	information = DIA_GRD_219_Stone2_Info;
	important = 0;
	permanent = 0;
//	description = "Why did they lock you in the dungeons?";
//	description = "Warum hat man dich in den Kerker geworfen?";
	description = "Proč tě zavřeli do vězení?";
};

func int DIA_GRD_219_Stone2_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GRD_219_Stone3))
	{
		return 1;
	};

	return 0;
};

func void DIA_GRD_219_Stone2_Info()
{
//	AI_Output(other,self,"DIA_GRD_219_Stone2_15_01"); //Why did they lock you in the dungeons?
//	AI_Output(other,self,"DIA_GRD_219_Stone2_15_01"); //Warum hat man dich in den Kerker geworfen?
	AI_Output(other, self, "DIA_GRD_219_Stone2_15_01"); //Proč tě zavřeli do vězení?
//	AI_Output(self,other,"DIA_GRD_219_Stone2_06_02"); //Gomez - the bastard - claimed I was in cahoots with the fire mages. The only reason he didn't kill me is because I'm the best smith in the whole Old Camp.
//	AI_Output(self,other,"DIA_GRD_219_Stone2_06_02"); //Gomez! Der Bastard hat mir unterstellt, dass ich gemeinsame Sache mit den Feuermagiern machen würde. Nur weil ich der beste Schmied im Alten Lager bin, konnte ich meinen Kopf retten.
	AI_Output(self, other, "DIA_GRD_219_Stone2_06_02"); //Gomez! Ten bastard předpokládal, že jsem přívrženec mágů Ohně. Jediný důvod, proč mě nezabil, bylo to, že jsem nejlepší kovář ve Starém táboře.
//	AI_Output(self,other,"DIA_GRD_219_Stone2_06_03"); //So he threw me into the rat's nest and only let me out when he needed me to make something for him.
//	AI_Output(self,other,"DIA_GRD_219_Stone2_06_03"); //Er hat mich in dieses Rattenloch werfen lassen und immer nur dann rausgelassen, wenn er meine Fähigkeiten gebraucht hat.
	AI_Output(self, other, "DIA_GRD_219_Stone2_06_03"); //A tak mě uvrhl do té krysí díry a pouštěl mě ven jenom tehdy, když potřeboval něco vyrobit.
};

//---------------------------------------------------------------------
//	Info Stone4
//---------------------------------------------------------------------
// Rüstung verbessern lassen
instance DIA_GRD_219_Stone4(C_INFO)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone4_Condition;
	information = DIA_GRD_219_Stone4_Info;
	important = 0;
	permanent = 0;
//	description = "Can you reinforce this ore armor for me?";
//	description = "Kannst du mir diese Erzrüstung verstärken?";
	description = "Můžeš mi vyztužit tuhle rudnou zbroj?";
};

func int DIA_GRD_219_Stone4_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_GRD_219_Stone3))
	&& (Npc_HasItems(hero, ORE_ARMOR_M))
	&& (KnowStone == 0))
	{
		return 1;
	};

	return 0;
};

func void DIA_GRD_219_Stone4_Info()
{
//	AI_Output(other,self,"DIA_GRD_219_Stone4_15_01"); //Can you reinforce this ore armor for me?
//	AI_Output(other,self,"DIA_GRD_219_Stone4_15_01"); //Kannst du mir diese Erzrüstung verstärken?
	AI_Output(other, self, "DIA_GRD_219_Stone4_15_01"); //Můžeš mi vyztužit tuhle rudnou zbroj?
//	AI_Output(self,other,"DIA_GRD_219_Stone4_06_02"); //Sure I can. Hand it over and hang on a minute.
//	AI_Output(self,other,"DIA_GRD_219_Stone4_06_02"); //Natürlich kann ich sie verstärken? Gib sie mir und warte kurz.
	AI_Output(self, other, "DIA_GRD_219_Stone4_06_02"); //Samozřejmě, že můžu. Sundej jí a chvilku počkej.

	AI_UnequipArmor(hero);
	B_GiveInvItems(hero, self, ORE_ARMOR_M, 1);
	Npc_RemoveInvItem(self, ORE_ARMOR_M);

	B_StartUseMob(self, "BSFIRE");
	AI_Wait(self, 1);
	B_StopUseMob(self, "BSFIRE");
	AI_Wait(self, 1);
	B_StartUseMob(self, "BSANVIL");
	AI_Wait(self, 1);
	B_StopUseMob(self, "BSANVIL");
	AI_Wait(self, 1);
	AI_GotoNpc(self, hero);

	CreateInvItem(self, ORE_ARMOR_H);
	B_GiveInvItems(self, hero, ORE_ARMOR_H, 1);

//	AI_Output(self,other,"DIA_GRD_219_Stone4_06_03"); //Here is the reinforced armor. We're quits now.
//	AI_Output(self,other,"DIA_GRD_219_Stone4_06_03"); //Hier ist die verstärkte Rüstung, damit habe ich meine Schuld beglichen.
	AI_Output(self, other, "DIA_GRD_219_Stone4_06_03"); //Tady je vyztužená zbroj, tím jsem splatil svůj dluh.

	KnowStone = 1;
};

// Ring des Lebens
instance DIA_GRD_219_Stone5(C_INFO)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone5_Condition;
	information = DIA_GRD_219_Stone5_Info;
	important = 0;
	permanent = 0;
//	description = "I could use a ring to increase my life energy.";
//	description = "Ich könnte einen Ring gebrauchen, der meine Lebenskraft steigert.";
	description = "Potřeboval bych prsten, který zvyšuje životní energii.";
};

func int DIA_GRD_219_Stone5_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_GRD_219_Stone3))
	&& (KnowStone == 0))
	{
		return 1;
	};

	return 0;
};

func void DIA_GRD_219_Stone5_Info()
{
//	AI_Output(other,self,"DIA_GRD_219_Stone5_15_01"); //I could use a ring to increase my life energy.
//	AI_Output(other,self,"DIA_GRD_219_Stone5_15_01"); //Ich könnte einen Ring gebrauchen, der meine Lebenskraft steigert.
	AI_Output(other, self, "DIA_GRD_219_Stone5_15_01"); //Potřeboval bych prsten, který zvyšuje životní energii.
//	AI_Output(self,other,"DIA_GRD_219_Stone5_06_02"); //That's not difficult, hold on.
//	AI_Output(self,other,"DIA_GRD_219_Stone5_06_02"); //Das ist nicht so schwer, warte kurz.
	AI_Output(self, other, "DIA_GRD_219_Stone5_06_02"); //To není tak těžké, počkej chvilku.

	B_StartUseMob(self, "BSFIRE");
	AI_Wait(self, 1);
	B_StopUseMob(self, "BSFIRE");
	AI_Wait(self, 1);
	B_StartUseMob(self, "BSANVIL");
	AI_Wait(self, 1);
	B_StopUseMob(self, "BSANVIL");
	AI_Wait(self, 1);
	AI_GotoNpc(self, hero);

//	AI_Output(self,other,"DIA_GRD_219_Stone5_06_03"); //This ring will give you extra life energy. That should be more than enough to settle the score between us.
//	AI_Output(self,other,"DIA_GRD_219_Stone5_06_03"); //Dieser Ring verleiht dir Lebenskraft, damit müsste meine Schuld mehr als beglichen sein.
	AI_Output(self, other, "DIA_GRD_219_Stone5_06_03"); //Tenhle prsten ti dodá zvláštní životní energii. Tohle by mělo být víc než dost pro naše vyrovnání.

	CreateInvItem(self, Ring_des_Lebens2);
	B_GiveInvItems(self, other, Ring_des_Lebens2, 1);

	KnowStone = 1;
};

// Schutzring
instance DIA_GRD_219_Stone6(C_INFO)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone6_Condition;
	information = DIA_GRD_219_Stone6_Info;
	important = 0;
	permanent = 0;
//	description = "I want you to forge me a protection ring.";
//	description = "Ich will einen Schutzring geschmiedet haben";
	description = "Chci, abys mi vykoval ochranný prsten.";
};

func int DIA_GRD_219_Stone6_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_GRD_219_Stone3))
	&& (KnowStone == 0))
	{
		return 1;
	};

	return 0;
};

func void DIA_GRD_219_Stone6_Info()
{
//	AI_Output(other,self,"DIA_GRD_219_Stone6_15_01"); //I want you to forge me a protection ring.
//	AI_Output(other,self,"DIA_GRD_219_Stone6_15_01"); //Ich will einen Schutzring geschmiedet haben.
	AI_Output(other, self, "DIA_GRD_219_Stone6_15_01"); //Chci, abys mi vykoval ochranný prsten.
//	AI_Output(self,other,"DIA_GRD_219_Stone6_06_02"); //A protection ring? Okay, I'll start right away. Just wait a while.
//	AI_Output(self,other,"DIA_GRD_219_Stone6_06_02"); //Einen Schutzring, dann gehe ich an die Arbeit. Warte solange.
	AI_Output(self, other, "DIA_GRD_219_Stone6_06_02"); //Ochranný prsten? Dobře, hned s tím začnu. Počkej chvilku.

	B_StartUseMob(self, "BSFIRE");
	AI_Wait(self, 1);
	B_StopUseMob(self, "BSFIRE");
	AI_Wait(self, 1);
	B_StartUseMob(self, "BSANVIL");
	AI_Wait(self, 1);
	B_StopUseMob(self, "BSANVIL");
	AI_Wait(self, 1);
	AI_GotoNpc(self, hero);

//	AI_Output(self,other,"DIA_GRD_219_Stone6_06_03"); //You asked for a protection ring, you have one, so now we're quits.
//	AI_Output(self,other,"DIA_GRD_219_Stone6_06_03"); //Einen Schutzring wolltest du, hier ist er, jetzt sind wir quitt.
	AI_Output(self, other, "DIA_GRD_219_Stone6_06_03"); //Chtěl jsi ochranný prsten, tady ho máš. Teď jsme vyrovnáni.

	CreateInvItem(self, Schutzring_Total2);
	B_GiveInvItems(self, other, Schutzring_Total2, 1);

	KnowStone = 1;
};

instance DIA_GRD_219_Stone7(C_INFO)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone7_Condition;
	information = DIA_GRD_219_Stone7_Info;
	important = 0;
	permanent = 0;
//	description = "Make me something to increase my magic powers.";
//	description = "Schmiede mir einen Gegenstand, der meine magische Energie vermehrt.";
	description = "Udělej mi něco, co by zvýšilo moji magickou moc.";
};

func int DIA_GRD_219_Stone7_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_GRD_219_Stone3))
	&& (KnowStone == 0))
	{
		return 1;
	};

	return 0;
};

func void DIA_GRD_219_Stone7_Info()
{
//	AI_Output(other,self,"DIA_GRD_219_Stone7_15_01"); //Make me something to increase my magic powers.
//	AI_Output(other,self,"DIA_GRD_219_Stone7_15_01"); //Schmiede mir einen Gegenstand, der meine magische Energie vermehrt.
	AI_Output(other, self, "DIA_GRD_219_Stone7_15_01"); //Udělej mi něco, co by zvýšilo moji magickou moc.
//	AI_Output(self,other,"DIA_GRD_219_Stone7_06_02"); //... Something to increase magic powers...? An amulet! That's it, I'll forge an amulet for you. It won't take long.
//	AI_Output(self,other,"DIA_GRD_219_Stone7_06_02"); //... Einen Gegenstand, der magische Energie vermehrt ... ein Amulett, ich schmiede dir ein Amulett. Das dauert nicht lange.
	AI_Output(self, other, "DIA_GRD_219_Stone7_06_02"); //...Něco, co by zvýšilo magickou moc... Amulet! To je ono! Udělám ti amulet. Nebude to dlouho trvat.

	B_StartUseMob(self, "BSFIRE");
	AI_Wait(self, 1);
	B_StopUseMob(self, "BSFIRE");
	AI_Wait(self, 1);
	B_StartUseMob(self, "BSANVIL");
	AI_Wait(self, 1);
	B_StopUseMob(self, "BSANVIL");
	AI_Wait(self, 1);
	AI_GotoNpc(self, hero);

//	AI_Output(self,other,"DIA_GRD_219_Stone7_06_03"); //Right, the amulet's finished, and I must say I've made a good job of it. We're quits now.
//	AI_Output(self,other,"DIA_GRD_219_Stone7_06_03"); //So, das Amulett ist fertig, und ich muss sagen, es ist mir gut gelungen. Somit ist die Schuld beglichen.
	AI_Output(self, other, "DIA_GRD_219_Stone7_06_03"); //Tak, amulet je hotový a musím říci, že se mi povedl. Teď jsme vyrovnáni.

	CreateInvItem(self, Amulett_der_Magie);
	B_GiveInvItems(self, other, Amulett_der_Magie, 1);

	KnowStone = 1;
};
