//****************************************
//					EXIT
//****************************************

instance DIA_ORG_855_Wolf_Exit(C_INFO)
{
	npc = ORG_855_Wolf;
	nr = 999;
	condition = DIA_ORG_855_Wolf_Exit_Condition;
	information = DIA_ORG_855_Wolf_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_ORG_855_Wolf_Exit_Condition()
{
	return 1;
};

func void DIA_ORG_855_Wolf_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//****************************************
//					Hallo
//****************************************

instance DIA_Wolf_Hello(C_INFO)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_Hello_Condition;
	information = DIA_Wolf_Hello_Info;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};

func int DIA_Wolf_Hello_Condition()
{
	return 1;
};

func void DIA_Wolf_Hello_Info()
{
//	AI_Output(other,self,"DIA_Wolf_Hello_15_00"); //Who are you?
//	AI_Output(other,self,"DIA_Wolf_Hello_15_00"); //Wer bist du?
	AI_Output(other,self,"DIA_Wolf_Hello_15_00"); //Kdo jsi?
//	AI_Output(self,other,"DIA_Wolf_Hello_09_01"); //I'm Wolf. I make armor.
//	AI_Output(self,other,"DIA_Wolf_Hello_09_01"); //Ich bin Wolf, der Rüstungsbauer.
	AI_Output(self,other,"DIA_Wolf_Hello_09_01"); //Jsem Wolf. Vyrábím zbroj.

//	B_LogEntry(GE_TraderNC,"Wolf supplies the rogues with ARMOR. He's usually in front of his hut in the big living cave.");
//	B_LogEntry(GE_TraderNC,"Wolf versorgt die Banditen mit RÜSTUNGEN. Er ist normalerweise vor seiner Hütte in der Großen Wohnhöhle zu finden.");
	B_LogEntry(GE_TraderNC,"Wolf dodává banditům zbroj. Obvykle bývá ve své chatrči v přední části velké obytné jeskyně.");
};

//****************************************
//				Bin ORG!
//****************************************

instance DIA_Wolf_GreetORG(C_INFO)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_GreetORG_Condition;
	information = DIA_Wolf_GreetORG_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Wolf_GreetORG_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void DIA_Wolf_GreetORG_Info()
{
//	AI_Output(self,other,"DIA_Wolf_GreetORG_09_00"); //Hey! Now you're one of us, kid.
//	AI_Output(self,other,"DIA_Wolf_GreetORG_09_00"); //Hey! Du bist jetzt einer von uns, Kleiner.
	AI_Output(self,other,"DIA_Wolf_GreetORG_09_00"); //Hej! Teď jsi jedním z nás, chlapče.
};

//****************************************
//				TRADE
//****************************************

instance Org_855_Wolf_TRADE(C_INFO)
{
	npc = Org_855_Wolf;
	nr = 800;
	condition = Org_855_Wolf_TRADE_Condition;
	information = Org_855_Wolf_TRADE_Info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};

func int Org_855_Wolf_TRADE_Condition()
{
	return 1;
};

func void Org_855_Wolf_TRADE_Info()
{
//	AI_Output(other,self,"Org_855_Wolf_TRADE_15_00"); //Do you trade in anything else?
//	AI_Output(other,self,"Org_855_Wolf_TRADE_15_00"); //Handelst du noch mit was anderem?
	AI_Output(other,self,"Org_855_Wolf_TRADE_15_00"); //Obchoduješ ještě s něčím jiným?
//	AI_Output(self,other,"Org_855_Wolf_TRADE_09_01"); //I buy furs and skins from the hunters. If you get something like that, I'll buy it.
//	AI_Output(self,other,"Org_855_Wolf_TRADE_09_01"); //Ich kaufe Felle und Häute von den Jägern. Wenn du an so was rankommst, kauf' ich dir die Sachen ab.
	AI_Output(self,other,"Org_855_Wolf_TRADE_09_01"); //Nakupuju od lovců kožešiny a kůže. Jestli něco takového máš, koupím to.

};

//****************************************
//				Wo Jäger
//****************************************

instance Org_855_Wolf_WhereHunter(C_INFO)
{
	npc = Org_855_Wolf;
	nr = 900;
	condition = Org_855_Wolf_WhereHunter_Condition;
	information = Org_855_Wolf_WhereHunter_Info;
	permanent = 1;
//	description = "How do I get furs and skins?";
//	description = "Wie komme ich an Felle und Häute?";
	description = "Jak stáhnu kožešiny a kůže?";
};

func int Org_855_Wolf_WhereHunter_Condition()
{
	return 1;
};

func void Org_855_Wolf_WhereHunter_Info()
{
//	AI_Output(other,self,"Org_855_Wolf_WhereHunter_15_00"); //How do I get furs and skins?
//	AI_Output(other,self,"Org_855_Wolf_WhereHunter_15_00"); //Wie komme ich an Felle und Häute?
	AI_Output(other,self,"Org_855_Wolf_WhereHunter_15_00"); //Jak stáhnu kožešiny a kůže?
//	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_01"); //On the way to the New Camp you'll come across Aidan. He can teach you how to skin animals.
//	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_01"); //Auf dem Weg zum Neuen Lager findest du Aidan. Er kann dir beibringen, wie du Tieren das Fell abziehst.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_01"); //Po cestě do Nového tábora přijdeš k Aidanovi. Naučí tě stahovat zvěř.
//	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_02"); //Ratford and Drax are hanging around in the north of the Old Camp. It's on the way to the trading square.
//	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_02"); //Ratford und Drax treiben sich nördlich vom Alten Lager rum, auf dem Weg zum Austauschplatz.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_02"); //Ratford a Drax se potloukají severně od Starého tábora. Je to po cestě k místu výměny.
};

//****************************************
//				Sell Armor
//****************************************

instance DIA_Wolf_SellArmor(C_INFO)
{
	npc = ORG_855_Wolf;
	nr = 700;
	condition = DIA_Wolf_SellArmor_Condition;
	information = DIA_Wolf_SellArmor_Info;
	permanent = 1;
//	description = "I'm looking for better armor.";
//	description = "Ich suche eine bessere Rüstung.";
	description = "Sháním lepší zbroj.";
};

func int DIA_Wolf_SellArmor_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	&& (!Npc_KnowsInfo(hero,Info_Wolf_ARMORFINISHED)))
	{
		return 1;
	};
};

func void DIA_Wolf_SellArmor_Info()
{
//	AI_Output(other,self,"DIA_Wolf_SellArmor_15_00"); //I'm looking for better armor.
//	AI_Output(other,self,"DIA_Wolf_SellArmor_15_00"); //Ich suche eine bessere Rüstung.
	AI_Output(other,self,"DIA_Wolf_SellArmor_15_00"); //Sháním lepší zbroj.

	if ((Npc_GetTrueGuild(other)==GIL_ORG) || (Npc_GetTrueGuild(other)==GIL_SLD))
	{
//		AI_Output(self,other,"DIA_Wolf_SellArmor_09_01"); //Since you're one of us now, I can sell you one.
//		AI_Output(self,other,"DIA_Wolf_SellArmor_09_01"); //Jetzt, wo du einer von uns bist, kann ich dir eine verkaufen.
		AI_Output(self,other,"DIA_Wolf_SellArmor_09_01"); //Teď když jsi jedním z nás, můžu ti jednu prodat.

		Info_ClearChoices(DIA_Wolf_SellArmor);
		Info_Addchoice (DIA_Wolf_SellArmor,DIALOG_BACK ,DIA_Wolf_SellArmor_BACK);
		Info_Addchoice (DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_Addchoice (DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H),DIA_Wolf_SellArmor_H);
	}
	else
	{
//		AI_Output(self,other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //I can't sell you anything. Lares would kill me if I sold armor to strangers.
//		AI_Output(self,other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //Ich kann dir keine verkaufen. Lares reißt mir den Kopf ab, wenn ich unsere Rüstungen an Fremde verkaufe.
		AI_Output(self,other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //Nemůžu ti nic prodat. Lares by mě zabil, kdybych prodal zbroj cizincům.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
//	AI_Output(other,self,"DIA_Wolf_SellArmor_M_15_01"); //I want medium armor.
//	AI_Output(other,self,"DIA_Wolf_SellArmor_M_15_01"); //Ich möchte die mittlere Rüstung haben.
	AI_Output(other,self,"DIA_Wolf_SellArmor_M_15_01"); //Chci střední zbroj.

	if (Npc_HasItems(hero,ItMinugget)< VALUE_ORG_ARMOR_M)
	{
//		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02"); //No ore, no armor.
//		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02"); //Ohne Erz gibt es auch keine Rüstung.
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02"); //Žádná ruda, žádná zbroj.
	}
	else
	{
//		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_03"); //It's good armor. Still not as good as what I wear, but it protects you well enough.
//		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_03"); //Eine gute Rüstung.Noch nicht so gut, wie das, was ich trage, aber sie bietet ausreichend Schutz.
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_03"); //To je dobrá zbroj. Ne sice tak dobrá jako ta, co nosím já, ale ochrání tě také dobře.

		B_GiveInvItems(hero,self,ItMinugget,VALUE_ORG_ARMOR_M);

		CreateInvItem(hero,ORG_ARMOR_M);

		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
//	AI_Output(other,self,"DIA_Wolf_SellArmor_H_15_01"); //Can you sell me heavy armor?
//	AI_Output(other,self,"DIA_Wolf_SellArmor_H_15_01"); //Kannst du mir eine schwere Rüstung verkaufen?
	AI_Output(other,self,"DIA_Wolf_SellArmor_H_15_01"); //Můžeš mi prodat těžkou zbroj?

	if (Npc_HasItems(hero,ItMinugget) < VALUE_ORG_ARMOR_H)
	{
//		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_02"); //No ore, no armor.
//		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_02"); //Ohne Erz gibt es auch keine Rüstung.
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_02"); //Žádná ruda, žádná zbroj.
	}
	else
	{
//		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_03"); //This armor will protect you from any dangers! I wear it myself,and I've survived so far. Not least thanks to the armor.
//		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_03"); //Diese Rüstung wird dich vor allen Gefahren schützen! Ich trage sie auch und habe bisher überlebt. Nicht zuletzt dank der Rüstung.
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_03"); //Tahle zbroj tě ochrání před každým nebezpečím! Nosím ji sám a přežívám už dost dlouho. V neposledním díky téhle zbroji.

		B_GiveInvItems(hero,self,ItMinugget,VALUE_ORG_ARMOR_H);

		CreateInvItem(hero,ORG_ARMOR_H);

		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

/*------------------------------------------------------------------------
							BOGENSCHIESSEN DAS ANGEBOT
------------------------------------------------------------------------*/

instance ORG_855_Wolf_TRAINOFFER(C_INFO)
{
	npc = ORG_855_Wolf;
	nr = 100;
	condition = ORG_855_Wolf_TRAINOFFER_Condition;
	information = ORG_855_Wolf_TRAINOFFER_Info;
	important = 0;
	permanent = 0;
//	description = "I'd like to learn how to handle a bow.";
//	description = "Ich möchte den richtigen Umgang mit dem Bogen lernen";
	description = "Rád bych se naučil zacházet s lukem.";
};

func int ORG_855_Wolf_TRAINOFFER_Condition()
{
	if( Npc_GetTalentSkill (hero,NPC_TALENT_BOW) != 2)
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAINOFFER_Info()
{
//	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //I'd like to learn how to handle a bow.
//	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //Ich möchte den richtigen Umgang mit dem Bogen lernen.
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //Rád bych se naučil zacházet s lukem.
//	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //I can teach you. But I can't do it as a favor. After all, I have to eat as well.
//	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //Kann ich dir beibringen. Das ist aber keine Gefälligkeit, denn auch ich muss essen.
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //Můžu tě to naučit. Ale nemůžu to dělat jenom pro radost. Především musím také něco jíst.
//	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //How much?
//	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //Wie viel?
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //Kolik?
//	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //Anything I teach you will cost you 50 ore. I don't haggle.
//	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //Alles, was ich dir beibringe, kostet dich 50 Erz. Ich feilsche nicht.
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //Všechno, co tě naučím, bude stát 50 nugetů. A bez smlouvání.

	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
//	B_LogEntry(GE_TeacherNC,"Wolf, the rogue, can teach me how to use a BOW.");
//	B_LogEntry(GE_TeacherNC,"Wolf der Bandit kann mir den Umgang mit dem BOGEN beibringen.");
	B_LogEntry(GE_TeacherNC,"Bandita Wolf mě může naučit používat LUK.");

};
/*------------------------------------------------------------------------
						BOGENSCHIESSEN DIE ERSTE LEHRSTUNDE
------------------------------------------------------------------------*/

instance ORG_855_Wolf_TRAIN(C_INFO)
{
	npc = ORG_855_Wolf;
	nr = 100;
	condition = ORG_855_Wolf_TRAIN_Condition;
	information = ORG_855_Wolf_TRAIN_Info;
	important = 0;
	permanent = 0;
	description = B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50);
};

func int ORG_855_Wolf_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		return TRUE;
	};

};
func void ORG_855_Wolf_TRAIN_Info()
{
//	AI_Output(other,self,"ORG_855_Wolf_TRAIN_Info_15_01"); //Teach me how to use a bow.
//	AI_Output(other,self,"ORG_855_Wolf_TRAIN_Info_15_01"); //Bring mir den Umgang mit dem Bogen bei.
	AI_Output(other,self,"ORG_855_Wolf_TRAIN_Info_15_01"); //Nauč mě zacházet s lukem.
	if (Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1)
		{
//			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_02"); //Your hits depend on your dexterity. The more dexterous you become, the more accurately your arrows will hit their targets.
//			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_02"); //Deine Geschicklichkeit ist das Maß für einen Treffer. Je geschickter du wirst, umso genauer werden deine Pfeile ihr Ziel treffen.
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_02"); //Tvůj zásah záleží na tvé zručnosti. Čím pohotovější budeš, tím přesněji zasáhne tvůj šíp cíl.
//			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_03"); //Your skill determines the distance from which you can hit your targets. In order to become a good marksman, you should improve both equally.
//			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_03"); //Dein Talent bestimmt, auf welche Reichweite du dein Ziel noch triffst. Um ein guter Schütze zu werden, solltest du beides zu gleichen Teilen steigern.
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_03"); //Tvoje obratnost určuje vzdálenost, ze které dokážeš zasáhnout cíl. Aby se z tebe stal dobrý střelec, měl bys vylepšovat obojí rovnoměrně.
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};
/*------------------------------------------------------------------------
						BOGENSCHIESSEN DIE ZWEITE LEHRSTUNDE
------------------------------------------------------------------------*/

instance ORG_855_Wolf_TRAINAGAIN(C_INFO)
{
	npc = ORG_855_Wolf;
	nr = 100;
	condition = ORG_855_Wolf_TRAINAGAIN_Condition;
	information = ORG_855_Wolf_TRAINAGAIN_Info;
	important = 0;
	permanent = 0;
//	description = B_BuildLearnString(NAME_LearnBow_2, LPCOST_TALENT_BOW_2,50);
//	description = B_BuildLearnString(NAME_LearnBow_2, LPCOST_TALENT_BOW_2,50);
	description = B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,50);
};

func int ORG_855_Wolf_TRAINAGAIN_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		return TRUE;
	};

};
func void ORG_855_Wolf_TRAINAGAIN_Info()
{
//	AI_Output(other,self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //I want to improve my skill with the bow.
//	AI_Output(other,self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //Ich will mein Talent mit dem Bogen verbessern.
	AI_Output(other,self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //Chci se zlepšit v umění lukostřelby.
	if (Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2)
		{
//			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //You're a good hunter already. Now acquire the remaining knowledge.
//			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //Du bist jetzt schon ein guter Jäger. Erfahre nun das letzte Wissen.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //Už je z tebe dobrý lovec. Teď si osvojíš zbývající znalosti.
//			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //To become a good marksman, you need to stop trying to be one.
//			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //Um ein Meisterschütze zu werden, musst du aufhören, einer sein zu wollen.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //Aby ses stal dobrým střelcem, musíš se o to přestat snažit.
//			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //Discover the laws of the eye, tension, trajectory and target. Always watch out and be prepared at all times.
//			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //Erkenne das Gesetz von Auge, Spannkraft, Flugbahn und Ziel. Sei immer auf der Hut, sei immer bereit.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //Objev zákony zraku, napětí, dráhy a cíle. Vždy buď ve střehu a buď připravený.
//			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //You've mastered the technique very well now. Now go and apply your knowledge and skill.
//			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //Die Technik beherrschst du schon lange zur Genüge. Geh einfach hin und wende dein Wissen und Können an.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //Teď už jsi velmi dobře zvládl techniku. Tak pojď a vyzkoušej své znalosti a umění.

			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};
//---------------------------------------------------------------
//	 					 DEX
//---------------------------------------------------------------
instance ORG_855_Wolf_Teach(C_INFO)
{
	npc = ORG_855_Wolf;
	nr = 100;
	condition = ORG_855_Wolf_Teach_Condition;
	information = ORG_855_Wolf_Teach_Info;
	permanent = 1;
//	description = "Can you teach me something?";
//	description = "Kannst du mir was beibringen?";
	description = "Můžeš mě něco naučit?";
};

func int ORG_855_Wolf_Teach_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_Teach_Info()
{
//	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //Can you teach me something?
//	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //Kannst du mir was beibringen?
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //Můžeš mě něco naučit?
//	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //Your dexterity determines the success of your hunt.
//	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //Deine Geschicklichkeit bestimmt den Jagderfolg.
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //Tvá zručnost předurčuje úspěch při lovu.

	if (log_wolftrain == FALSE)
	{
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
//	B_LogEntry(GE_TeacherNC,"Wolf, the bandit, can show me how to improve my DEXTERITY.");
//	B_LogEntry(GE_TeacherNC,"Wolf der Bandit, kann mir zeigen, wie ich mein GESCHICK verbessere.");
	B_LogEntry(GE_TeacherNC,"Bandita Wolf mi může ukázat, jak si zlepšit OBRATNOST.");
	log_wolftrain = TRUE;
	};

	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK ,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_BACK()
{
	Info_ClearChoices(ORG_855_Wolf_Teach);
};
func void ORG_855_Wolf_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK ,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK ,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info GOOD
//---------------------------------------------------------------------
instance Info_Wolf_GOOD(C_INFO)
{
	npc = Org_855_Wolf;
	condition = Info_Wolf_GOOD_Condition;
	information = Info_Wolf_GOOD_Info;
	important = 0;
	permanent = 0;
//	description = "Gorn said you wanted to talk to me urgently?";
//	description = "Gorn sagt, du wolltest dringend mit mir sprechen?";
	description = "Gorn říkal, že mi potřebuješ něco naléhavého sdělit?";
};

func int Info_Wolf_GOOD_Condition()
{
	if Gorn_GotoWolf
	{
		return TRUE;
	};
};

func void Info_Wolf_GOOD_Info()
{
//	AI_Output(hero,self,"Info_Wolf_GOOD_15_01"); //Gorn said you wanted to talk to me urgently...
//	AI_Output(hero,self,"Info_Wolf_GOOD_15_01"); //Gorn sagt, du wolltest dringend mit mir sprechen?
	AI_Output(hero,self,"Info_Wolf_GOOD_15_01"); //Gorn říkal, že mi potřebuješ něco naléhavého sdělit?
//	AI_Output(self,hero,"Info_Wolf_GOOD_09_02"); //I'm glad you dropped by before you left!
//	AI_Output(self,hero,"Info_Wolf_GOOD_09_02"); //Gut, dass du vorher noch vorbeikommst!
	AI_Output(self,hero,"Info_Wolf_GOOD_09_02"); //Jsem rád, že ses před odchodem ještě zastavil!
	if (!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
//		AI_Output(hero,self,"Info_Wolf_GOOD_15_03"); //Before I go where?
//		AI_Output(hero,self,"Info_Wolf_GOOD_15_03"); //Vor was?
		AI_Output(hero,self,"Info_Wolf_GOOD_15_03"); //Před čím?
//		AI_Output(self,hero,"Info_Wolf_GOOD_09_04"); //Before you go to visit the Not-So-Free Mine.
//		AI_Output(self,hero,"Info_Wolf_GOOD_09_04"); //Vor eurem Besuch in der nicht mehr ganz so Freien Mine.
		AI_Output(self,hero,"Info_Wolf_GOOD_09_04"); //Před tím, než odejdeš navštívit ten 'Nepříliš Svobodný důl'.
	};
};

//---------------------------------------------------------------------
//	Info SPEAK
//---------------------------------------------------------------------
instance Info_Wolf_SPEAK(C_INFO)
{
	npc = Org_855_Wolf;
	condition = Info_Wolf_SPEAK_Condition;
	information = Info_Wolf_SPEAK_Info;
	important = 0;
	permanent = 0;
//	description = "What's up?";
//	description = "Worum geht es?";
	description = "Co se děje?";
};

func int Info_Wolf_SPEAK_Condition()
{
	if Npc_KnowsInfo(hero,Info_Wolf_GOOD)
	{
		return TRUE;
	};
};

func void Info_Wolf_SPEAK_Info()
{
//	AI_Output(hero,self,"Info_Wolf_SPEAK_15_01"); //What's up?
//	AI_Output(hero,self,"Info_Wolf_SPEAK_15_01"); //Worum geht es?
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_01"); //Co se děje?
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_02"); //I've had an idea how to produce a completely new armor.
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_02"); //Ich hatte neulich eine Idee, wie wir völlig neue Rüstungen herstellen können.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_02"); //Dostal jsem nápad jak vyrobit úplně novou zbroj.
//	AI_Output(hero,self,"Info_Wolf_SPEAK_15_03"); //Oh, and how's that?
//	AI_Output(hero,self,"Info_Wolf_SPEAK_15_03"); //Aha, und wie?
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_03"); //Och, a jak?
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_04"); //The minecrawlers' armor plates are the hardest material I know.
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_04"); //Das härteste Material, dass ich kenne, sind die Panzerplatten der Minecrawler.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_04"); //Pancéřové krunýře důlních červů jsou z nejpevnějšího materiálu, který znám.
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_05"); //I don't mean the small, harmless specimens found in Gomez' buried mine...
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_05"); //Nicht etwa die der kleinen, harmlosen Exemplare aus der jetzt verschütteten Mine von Gomez ...
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_05"); //Nemyslím ty malé nepoškozené vzorky, které se našly v Gomezově zakopaném dole...
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_06"); //... NOOO. Not them. There is a far more dangerous kind in our mine.
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_06"); //...NEEEEIN. Die nicht. In unserer Mine lebt eine wesentlich gefährlichere Unterart.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_06"); //...NEEE. Ty ne. V našem dole je daleko nebezpečnější typ.
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_07"); //The armor of these beasts is nearly impenetrable!
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_07"); //Der Panzer dieser Biester ist fast nicht zu durchdringen!
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_07"); //Brnění těch bestií je téměř neprorazitelné.
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_08"); //If you could bring me some of these armor plates, I could try to make armor from them.
//	AI_Output(self,hero,"Info_Wolf_SPEAK_09_08"); //Wenn du mir einige dieser Panzerplatten bringen könntest, würde ich versuchen, daraus eine Rüstung herzustellen.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_08"); //Když mi přineseš pár těch ochranných plátů, pokusím se z nich vyrobit zbroj...
};

//---------------------------------------------------------------------
//	Info SKIN
//---------------------------------------------------------------------
instance Info_Wolf_SKIN(C_INFO)
{
	npc = Org_855_Wolf;
	condition = Info_Wolf_SKIN_Condition;
	information = Info_Wolf_SKIN_Info;
	important = 0;
	permanent = 0;
//	description = "How can I remove the plates from those beasts?";
//	description = "Wie bekomme ich diese Platten von den Biestern ab?";
	description = "Jak dostanu krunýř z těch bestií?";
};

func int Info_Wolf_SKIN_Condition()
{
	if Npc_KnowsInfo(hero,Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func void Info_Wolf_SKIN_Info()
{
//	AI_Output(hero,self,"Info_Wolf_SKIN_15_01"); //How can I remove the plates from those beasts?
//	AI_Output(hero,self,"Info_Wolf_SKIN_15_01"); //Wie bekomme ich diese Platten von den Biestern ab?
	AI_Output(hero,self,"Info_Wolf_SKIN_15_01"); //Jak ty pláty z těch bestií dostanu?
//	AI_Output(self,hero,"Info_Wolf_SKIN_09_02"); //That's quite easy. The back plates are only joined to the body around the edges.
//	AI_Output(self,hero,"Info_Wolf_SKIN_09_02"); //Das ist relativ einfach. Die Rückenplatten sind nur an deren Rändern mit dem Körper verwachsen.
	AI_Output(self,hero,"Info_Wolf_SKIN_09_02"); //To je celkem snadné. Zadní pláty jsou připevněné k tělu jenom podél okrajů.
//	AI_Output(self,hero,"Info_Wolf_SKIN_09_03"); //Just take a razor blade and 'cut along the dotted line'.
//	AI_Output(self,hero,"Info_Wolf_SKIN_09_03"); //Nimm einfach ein Rasiermesser und schneide halbschräg an den Rändern entlang.
	AI_Output(self,hero,"Info_Wolf_SKIN_09_03"); //Vezmi břitvu a odřízni je podél tečkované čáry.
//	AI_Output(hero,self,"Info_Wolf_SKIN_15_04"); //Okay, I get it! I'll see if I can find those armor plates.
//	AI_Output(hero,self,"Info_Wolf_SKIN_15_04"); //Okay, kapiert! Mal sehen, ob ich solche Panzerplatten finden kann.
	AI_Output(hero,self,"Info_Wolf_SKIN_15_04"); //Dobře, mám to! Podívám se, jestli takové ochranné pláty nenajdu.

	Knows_GetMCPlates = TRUE;
//	PrintScreen("Learn: Cutting out armor plates", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
//	PrintScreen("Lerne: Panzerplatten herausschneiden", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	PrintScreen("Naučit se: Odříznout ochranné pláty", -1,-1,"FONT_OLD_20_WHITE.TGA",3);

	Log_CreateTopic(CH4_MCPlateArmor,LOG_MISSION);
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_RUNNING);
//	B_LogEntry(CH4_MCPlateArmor,"The rogue Wolf from the New Camp offered to make an armor from the armor plates of the minecrawlers. He showed me how to remove armor plates from dead crawlers.");
//	B_LogEntry(CH4_MCPlateArmor,"Der Bandit Wolf aus dem neuen Lager bot mir an, aus den Panzerplatten von Minecrawlern eine Rüstung anzufertigen. Er zeigte mir, wie man die Panzerplatten von toten Crawlern entfernt.");
	B_LogEntry(CH4_MCPlateArmor,"Bandita Wolf z Nového tábora mi nabídl, že mi zhotoví brnění z ochranných krunýřů důlních červů. Ukázal mi, jak se z mrtvého důlního červa odřezávají.");

	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
//	B_LogEntry(GE_AnimalTrophies,"Knowledge on the removal of plates - minecrawler - warriors");
//	B_LogEntry(GE_AnimalTrophies,"Wissen über Platten entfernen - Minecrawler - Krieger");
	B_LogEntry(GE_AnimalTrophies,"Znalost odstranění krunýřů - důlní červ - bojovník");

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info PROFIT
//---------------------------------------------------------------------
instance Info_Wolf_PROFIT(C_INFO)
{
	npc = Org_855_Wolf;
	condition = Info_Wolf_PROFIT_Condition;
	information = Info_Wolf_PROFIT_Info;
	important = 0;
	permanent = 0;
//	description = "And you're telling me without wanting anything for yourself?";
//	description = "Und diese Information gibst du mir völlig uneigennützig?";
	description = "A říkáš mi to jen tak, aniž bys za to něco chtěl?";
};

func int Info_Wolf_PROFIT_Condition()
{
	if Npc_KnowsInfo(hero,Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func void Info_Wolf_PROFIT_Info()
{
//	AI_Output(hero,self,"Info_Wolf_PROFIT_15_01"); //And you're telling me without wanting anything for yourself?
//	AI_Output(hero,self,"Info_Wolf_PROFIT_15_01"); //Und diese Information gibst du mir völlig uneigennützig?
	AI_Output(hero,self,"Info_Wolf_PROFIT_15_01"); //A říkáš mi to jen tak, aniž bys za to něco chtěl?
//	AI_Output(self,hero,"Info_Wolf_PROFIT_09_02"); //Not exactly... If I manage to make good armor from these plates, I will... very quickly ... very much ... oh, forget it!
//	AI_Output(self,hero,"Info_Wolf_PROFIT_09_02"); //Nicht ganz ... Wenn es mir gelingt, aus solchen Platten eine gute Rüstung zu zimmern, werde ich sehr schnell  ... sehr viel  ... Ach, lassen wird das!
	AI_Output(self,hero,"Info_Wolf_PROFIT_09_02"); //Ne tak docela...Pokud se mi z těch plátů podaří vyrobit dobrou zbroj, budu.. hodně brzy... hodně moc... och, zapomeň na to!
};

//---------------------------------------------------------------------
//	Info MCPLATESFEW
//---------------------------------------------------------------------
instance Info_Wolf_MCPLATESFEW(C_INFO)
{
	npc = Org_855_Wolf;
	condition = Info_Wolf_MCPLATESFEW_Condition;
	information = Info_Wolf_MCPLATESFEW_Info;
	important = 0;
	permanent = 0;
//	description = "I've gathered some of those minecrawler armor plates!";
//	description = "Ich habe einige der Minecrawler-Panzerplatten eingesammelt!";
	description = "Nasbíral jsem nějaké ty krunýře  důlních červů!";
};

func int Info_Wolf_MCPLATESFEW_Condition()
{
	if (Knows_GetMCPlates)
	&& (Npc_HasItems(hero,ItAt_Crawler_02) > 0)
	&& (Npc_HasItems(hero,ItAt_Crawler_02) < 15)
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESFEW_Info()
{
//	AI_Output(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //I've gathered some of those minecrawler armor plates!
//	AI_Output(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //Ich habe einige der Minecrawler-Panzerplatten eingesammelt!
	AI_Output(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //Nasbíral jsem nějaké ty ochranné pláty z důlních červů!
//	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //Not enough! That's not enough for a whole armor!
//	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //Zu wenig! Das reicht nicht für eine ganze Rüstung!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //To nestačí! To nestačí na celou zbroj.
//	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //Bring me more of these plates!
//	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //Bring mir mehr von diesen Platten!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //Přines ještě další pláty!
};

//---------------------------------------------------------------------
//	Info MCPLATESENOUGH
//---------------------------------------------------------------------
instance Info_Wolf_MCPLATESENOUGH(C_INFO)
{
	npc = Org_855_Wolf;
	condition = Info_Wolf_MCPLATESENOUGH_Condition;
	information = Info_Wolf_MCPLATESENOUGH_Info;
	important = 0;
	permanent = 0;
//	description = "I've gathered lots of minecrawlers' armor plates!";
//	description = "Ich habe jede Menge dieser Minecrawler-Panzerplatten eingesammelt!";
	description = "Už jsem nasbíral dost krunýřů důlních červů!";
};

func int Info_Wolf_MCPLATESENOUGH_Condition()
{
	if (Knows_GetMCPlates)
	&& (Npc_HasItems(hero,ItAt_Crawler_02) >= 15)
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESENOUGH_Info()
{
//	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //I've gathered lots of minecrawlers' armor plates!
//	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //Ich habe jede Menge dieser Minecrawler-Panzerplatten eingesammelt!
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //Už jsem nasbíral dost ochranných plátů z důlních červů!
//	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Fantastic!!! I'll get to work immediately!
//	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Fantastisch!!! Ich werde mich gleich an die Arbeit machen!
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Vynikající!!! Můžu se ihned pustit do práce!
//	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //How long will it take?
//	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //Wie lange wirst du dafür brauchen?
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //Jak dlouho to bude trvat?
//	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //I haven't the faintest idea. This is a completely new development, man!
//	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //Ich habe nicht die geringste Ahnung. Das ist eine komplette Neuentwicklung, Mann!
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //Nemám nejmenší představu. Je to úplně nový postup, člověče!
//	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //Just drop by now and then when you're in the area!
//	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //Schau einfach ab und zu bei mir rein, wenn du in der Nähe bist!
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //Prostě se tu občas zastav, když budeš někde blízko!

	MCPlatesDelivered = TRUE;

//	B_LogEntry(CH4_MCPlateArmor,"Wolf has received 15 of these minecrawler plates from me. He needs some time, I'm supposed to come back later.");
//	B_LogEntry(CH4_MCPlateArmor,"Wolf hat 15 dieser Minecralwerplatten von mir erhalten. Er benötigt etwas Zeit und bat mich später wiederzukommen.");
	B_LogEntry(CH4_MCPlateArmor,"Wolf ode mě dostal patnáct takovýchto krunýřů důlních červů. Mám se vrátit později.");
	B_GiveXP(XP_DeliveredMCPlates);

	B_GiveInvItems(hero,self,ItAt_Crawler_02, 15);
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info ARMORINWORK
//---------------------------------------------------------------------
instance Info_Wolf_ARMORINWORK(C_INFO)
{
	npc = Org_855_Wolf;
	condition = Info_Wolf_ARMORINWORK_Condition;
	information = Info_Wolf_ARMORINWORK_Info;
	important = 0;
	permanent = 1;
//	description = "How far have you got with the armor?";
//	description = "Wie weit bist du mit der Rüstung?";
	description = "Jak jsi daleko s tou zbrojí?";
};

func int Info_Wolf_ARMORINWORK_Condition()
{
	if (MCPlatesDelivered == TRUE)
	&& (FreemineOrc_LookingUlumulu != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORINWORK_Info()
{
//	AI_Output(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //How far have you got with the armor?
//	AI_Output(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //Wie weit bist du mit der Rüstung?
	AI_Output(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //Jak jsi daleko s tou zbrojí?
//	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //It's gonna take some time, man! Those plates are really heavy stuff. I still haven't found a way yet to fix them together!
//	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //Dauert noch, Mann! Diese Platten sind verdammt harter Tobak. Ich habe noch keinen Weg gefunden, sie aneinander zu befestigen!
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //Bude to asi chvilku trvat, člověče! Tyhle pláty jsou opravdu těžký materiál. Ještě jsem pořád nepřišel na způsob, jak je spojit dohromady!
//	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //Gimme some more time, I'll get there!
//	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //Gib mir noch etwas Zeit, ich bekomme das schon hin!
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //Dej mi ještě čas, přijdu na to!
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info ARMORFINISHED
//---------------------------------------------------------------------
instance Info_Wolf_ARMORFINISHED(C_INFO)
{
	npc = Org_855_Wolf;
	condition = Info_Wolf_ARMORFINISHED_Condition;
	information = Info_Wolf_ARMORFINISHED_Info;
	important = 0;
	permanent = 0;
//	description = "How far have you got with the armor?";
//	description = "Wie weit bist du mit der Rüstung? ";
	description = "Jak jsi daleko s tou zbrojí?";
};

func int Info_Wolf_ARMORFINISHED_Condition()
{
	if (MCPlatesDelivered == TRUE)
	&& (FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORFINISHED_Info()
{
//	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //How far did you get with the armor?
//	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //Wie weit bist du mit der Rüstung?
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //Jak daleko ses dostal s tou zbrojí?
//	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //I've finally found a way to fix those armor plates to each other!
//	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //Ich habe endlich einen Weg gefunden, diese üblen Panzerplatten aneinander zu befestigen!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //Nakonec jsem přišel na to, jak ty ochranné pláty spojit dohromady!
//	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //Does that mean that the armor is finished?
//	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //Das heißt, die Rüstung ist fertig?
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //Znamená to, že je zbroj hotova?
//	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Yeah, man. Here it is. Really seems to be harder than  any other armor in our camp.
//	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Ja, Mann. Hier ist sie. Scheint tatsächlich noch härter zu sein als alles, was in unserem Lager so getragen wird.
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Ano, člověče. Tady je. Vypadá doopravdy silnější než jakákoliv jiná zbroj tady v táboře.
//	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //Thanks, I owe you something!
//	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //Danke, du hast was gut bei mir!
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //Díky, něco ti dlužím!
//	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //That's alright! I always find ways of covering my expenses!
//	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //Ach, ist schon in Ordnung! Ich komme schon auf meine Kosten!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //To je v pořádku! Už jsem přišel na to, jak pokrýt svoje výdaje!

//	B_LogEntry(CH4_MCPlateArmor,"The armor has been finished. A brilliant piece of work, the best fighting protection I have seen so far.");
//	B_LogEntry(CH4_MCPlateArmor,"Die Rüstung ist fertig. Ein ausgezeichnetes Stück Arbeit und der beste Rüstungsschutz, den ich bisher gesehen habe.");
	B_LogEntry(CH4_MCPlateArmor,"Zbroj je dokončena. Brilantní práce, nejlepší bojová ochrana, jakou jsem kdy viděl.");
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_SUCCESS);

	B_GiveXP(XP_GorMCPlateArmor);

	CreateInvItem(self,CRW_ARMOR_H);
	B_GiveInvItems(self,hero,CRW_ARMOR_H,1);
};

/*------------------------------------------------------------------------
						BOGEN KAUFEN
------------------------------------------------------------------------*/

instance Org_855_Wolf_SELLBOW(C_INFO)
{
	npc = Org_855_Wolf;
	condition = Org_855_Wolf_SELLBOW_Condition;
	information = Org_855_Wolf_SELLBOW_Info;
	important = 0;
	permanent = 0;
//	description = "Where can I get a bow here?";
//	description = "Wo kann ich denn hier einen Bogen bekommen?";
	description = "Kde tady dostanu luk?";
};

func int Org_855_Wolf_SELLBOW_Condition()
{
	return TRUE;
};
func void Org_855_Wolf_SELLBOW_Info()
{
//	AI_Output(other,self,"Org_855_Wolf_SELLBOW_Info_15_01"); //Where can I get a bow here?
//	AI_Output(other,self,"Org_855_Wolf_SELLBOW_Info_15_01"); //Wo kann ich denn hier einen Bogen bekommen?
	AI_Output(other,self,"Org_855_Wolf_SELLBOW_Info_15_01"); //Kde tady dostanu luk?
//	AI_Output(self,other,"Org_855_Wolf_SELLBOW_Info_09_02"); //You've come to the right address for that. I offer good value for good ore.
//	AI_Output(self,other,"Org_855_Wolf_SELLBOW_Info_09_02"); //Da bist du bei mir genau richtig. Für gutes Erz bekommst du gute Ware.
	AI_Output(self,other,"Org_855_Wolf_SELLBOW_Info_09_02"); //To jsi na správné adrese. Za dobrou rudu nabízím kvalitu.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
//	B_LogEntry(GE_TraderNC,"Wolf, the rogue, trades BOWS.");
//	B_LogEntry(GE_TraderNC,"Wolf, der Bandit, handelt mit BÖGEN.");
	B_LogEntry(GE_TraderNC,"Bandita Wolf obchoduje s LUKY.");

};

