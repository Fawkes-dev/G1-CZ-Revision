// ************************ EXIT **************************

instance GRD_271_ULBERT_Exit(C_INFO)
{
	npc = GRD_271_ULBERT;
	nr = 999;
	condition = GRD_271_ULBERT_Exit_Condition;
	information = GRD_271_ULBERT_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int GRD_271_ULBERT_Exit_Condition()
{
	return 1;
};

func void GRD_271_ULBERT_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ***************** Infos *****************************
instance GRD_271_ULBERT_KEY(C_INFO)
{
	npc = GRD_271_ULBERT;
	condition = GRD_271_ULBERT_KEY_Condition;
	information = GRD_271_ULBERT_KEY_Info;
	important = 0;
	permanent = 0;
//	description = "What's in the storeroom?";
//	description = "Was ist in dem Lagerschuppen?";
	description = "Co je v tom skladišti?";
};

func int GRD_271_ULBERT_KEY_Condition()
{
	return 1;
};

func void GRD_271_ULBERT_KEY_Info()
{
//	AI_Output(other,self,"GRD_271_ULBERT_KEY_Info_15_01"); //What's in the storeroom?
//	AI_Output(other,self,"GRD_271_ULBERT_KEY_Info_15_01"); //Was ist in dem Lagerschuppen?
	AI_Output(other, self, "GRD_271_ULBERT_KEY_Info_15_01"); //Co je v tom skladišti?
//	AI_Output(self,other,"GRD_271_ULBERT_KEY_Info_07_02"); //That's none of your business.
//	AI_Output(self,other,"GRD_271_ULBERT_KEY_Info_07_02"); //Das geht dich nichts an.
	AI_Output(self, other, "GRD_271_ULBERT_KEY_Info_07_02"); //Do toho ti nic není.
};

// ***************** Infos *****************************

instance GRD_271_ULBERT_TRICK(C_INFO)
{
	npc = GRD_271_ULBERT;
	condition = GRD_271_ULBERT_TRICK_Condition;
	information = GRD_271_ULBERT_TRICK_Info;
	important = 0;
	permanent = 0;
//	description = "Standing around for so long must make you thirsty.";
//	description = "So lange herumstehen macht bestimmt durstig";
	description = "Když tady jsi tak dlouho, musíš mít z toho žízeň.";
};

func int GRD_271_ULBERT_TRICK_Condition()
{
	if (Npc_KnowsInfo(hero, GRD_271_ULBERT_KEY))
	{
		return 1;
	};

	return 0;
};

func void GRD_271_ULBERT_TRICK_Info()
{
//	AI_Output(other,self,"GRD_271_ULBERT_TRICK_Info_15_01"); //Standing around for so long must make you thirsty.
//	AI_Output(other,self,"GRD_271_ULBERT_TRICK_Info_15_01"); //So lange herumstehen macht bestimmt durstig.
	AI_Output(other, self, "GRD_271_ULBERT_TRICK_Info_15_01"); //Když tady jsi tak dlouho, musíš mít z toho žízeň.
//	AI_Output(self,other,"GRD_271_ULBERT_TRICK_Info_07_02"); //You bet! Man, I could use a good swig now. Got anything on you?
//	AI_Output(self,other,"GRD_271_ULBERT_TRICK_Info_07_02"); //Und wie! Mann, ich könnte wohl den ein oder anderen Schluck vertragen. Hast du was dabei?
	AI_Output(self, other, "GRD_271_ULBERT_TRICK_Info_07_02"); //A jakou! Chlape, doušek nebo dva by přišly vhod! Máš něco u sebe?

	Log_CreateTopic(CH2_StorageShed, LOG_MISSION);
	Log_SetTopicStatus(CH2_StorageShed, LOG_RUNNING);
//	B_LogEntry(CH2_StorageShed,"The guard Ulbert is protecting the store shed in the Old Mine. I should get him something to drink!");
//	B_LogEntry(CH2_StorageShed,"Der Gardist Ulbert hält Wache vor dem Lagerschuppen der Alten Mine. Ich sollte ihm was zu trinken besorgen!");
	B_LogEntry(CH2_StorageShed, "Strážce Ulbert hlídá skladiště ve Starém dole. Měl bych mu obstarat něco k pití!");
};

// ***************** Infos *****************************

instance GRD_271_ULBERT_DRINK(C_INFO)
{
	npc = GRD_271_ULBERT;
	condition = GRD_271_ULBERT_DRINK_Condition;
	information = GRD_271_ULBERT_DRINK_Info;
	important = 0;
	permanent = 0;
//	description = "(give a drink)";
//	description = "(Einen ausgeben)";
	description = "(podej nápoj)";
};

func int GRD_271_ULBERT_DRINK_Condition()
{
	if ((Npc_KnowsInfo(hero, GRD_271_ULBERT_TRICK))
	&& ((Npc_HasItems(hero, ItFobeer)) || (Npc_HasItems(hero, ItFoWine)) || (Npc_HasItems(hero, ItFoBooze))))
	{
		return 1;
	};

	return 0;
};

func void GRD_271_ULBERT_DRINK_Info()
{
//	AI_Output(other,self,"GRD_271_ULBERT_DRINK_Info_15_01"); //Here you go, have one on me as well!
//	AI_Output(other,self,"GRD_271_ULBERT_DRINK_Info_15_01"); //Hier, trink einen auf mein Wohl!
	AI_Output(other, self, "GRD_271_ULBERT_DRINK_Info_15_01"); //Tady máš, dej si pořádně na mě!
//	AI_Output(self,other,"GRD_271_ULBERT_DRINK_Info_07_02"); //Thanks.
//	AI_Output(self,other,"GRD_271_ULBERT_DRINK_Info_07_02"); //Danke.
	AI_Output(self, other, "GRD_271_ULBERT_DRINK_Info_07_02"); //Díky.

	//TODO: add options for drink selection
	if (Npc_HasItems(hero, ItFobeer))
	{
		B_GiveInvItems(hero, self, ItFobeer, 1);
		if (C_BodystateContains(self, BS_SIT))
		{
			AI_StandUp(self);
			AI_TurnToNpc(self, hero);
		};

		AI_UseItem(self, ItFobeer);
	}
	else if (Npc_HasItems(hero, ItFowine))
	{
		B_GiveInvItems(hero, self, ItFowine, 1);
		if (C_BodystateContains(self, BS_SIT))
		{
			AI_StandUp(self);
			AI_TurnToNpc(self, hero);
		};

		AI_UseItem(self, ItFoWine);
	}
	else if (Npc_HasItems(hero, ItFoBooze))
	{
		B_GiveInvItems(hero, self, ItFoBooze, 1);
		if (C_BodystateContains(self, BS_SIT))
		{
			AI_StandUp(self);
			AI_TurnToNpc(self, hero);
		};

		AI_UseItem(self, ItFoBooze);
	};
};

// ***************** Infos *****************************
instance GRD_271_ULBERT_DRUNK(C_INFO)
{
	npc = GRD_271_ULBERT;
	condition = GRD_271_ULBERT_DRUNK_Condition;
	information = GRD_271_ULBERT_DRUNK_Info;
	important = 0;
	permanent = 0;
//	description = "Is there anything special in the storeroom NOW?";
//	description = "Gibt es denn JETZT in dem Schuppen etwas besonderes?";
	description = "Je TEĎ v tom skladišti něco zajímavého?";
};

func int GRD_271_ULBERT_DRUNK_Condition()
{
	if (Npc_KnowsInfo(hero, GRD_271_ULBERT_DRINK))
	{
		return 1;
	};

	return 0;
};

func void GRD_271_ULBERT_DRUNK_Info()
{
//	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_01"); //Is there anything special in the storeroom NOW?
//	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_01"); //Gibt's denn JETZT in dem Schuppen was Besonderes?
	AI_Output(other, self, "GRD_271_ULBERT_DRUNK_Info_15_01"); //Je TEĎ v tom skladišti něco zajímavého?
//	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_02"); //Some chests that we store supplies in. The key has disappeared though.
//	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_02"); //Ein paar Truhen, in denen wir Vorräte lagern. Allerdings ist der Schlüssel verschwunden.
	AI_Output(self, other, "GRD_271_ULBERT_DRUNK_Info_07_02"); //Nějaké truhly, ve kterých skladujeme zásoby. Ztratil se ale klíč.
//	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_03"); //Disappeared?
//	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_03"); //Verschwunden?
	AI_Output(other, self, "GRD_271_ULBERT_DRUNK_Info_15_03"); //Ztratil?
//	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_04"); //I bet Aleph was involved. That guy can't be trusted.
//	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_04"); //Ich wette, Aleph hat da seine Finger im Spiel. Dem Kerl kann man nicht trauen.
	AI_Output(self, other, "GRD_271_ULBERT_DRUNK_Info_07_04"); //Vsadím se, že v tom má prsty Aleph. Tomu chlapovi se nedá věřit.

//	B_LogEntry(CH2_StorageShed,"After I got Ulbert something to drink, he told me that he's missing the key for the chests. Allegedly Aleph the digger is somehow involved!");
//	B_LogEntry(CH2_StorageShed,"Nachdem ich Ulbert was zu trinken  gegeben habe, erzählte er mir, dass er den Schlüssel für die Truhen vermißt. Angeblich soll Aleph der Buddler seine Finger im Spiel haben!");
	B_LogEntry(CH2_StorageShed, "Když jsem dal Ulbertovi napít, řekl mi, že ztratil klíč od truhlic. Údajně v tom má prsty kopáč Aleph!");
};

// ***************** Infos *****************************
instance GRD_271_ULBERT_LOCK(C_INFO)
{
	npc = GRD_271_ULBERT;
	condition = GRD_271_ULBERT_LOCK_Condition;
	information = GRD_271_ULBERT_LOCK_Info;
	important = 0;
	permanent = 0;
//	description = "(lure Ulbert away)";
//	description = "(Ulbert weglocken)";
	description = "(odlákej Ulberta)";
};

func int GRD_271_ULBERT_LOCK_Condition()
{
	if (Npc_KnowsInfo(hero, GRD_271_ULBERT_DRUNK))
	{
		return 1;
	};

	return 0;
};

func void GRD_271_ULBERT_LOCK_Info()
{
//	AI_Output(other,self,"GRD_271_ULBERT_LOCK_Info_15_01"); //Listen, Ian and the others are sitting at the bottom having grilled meat.
//	AI_Output(other,self,"GRD_271_ULBERT_LOCK_Info_15_01"); //Hör zu, Ian und die anderen sitzen unten und lassen sich gebratenes Fleisch schmecken.
	AI_Output(other, self, "GRD_271_ULBERT_LOCK_Info_15_01"); //Poslyš, Ian sedí s ostatními dole a opékají si tam maso.
//	AI_Output(self,other,"GRD_271_ULBERT_LOCK_Info_07_02"); //What? Without me? Well, I'll collect my share!
//	AI_Output(self,other,"GRD_271_ULBERT_LOCK_Info_07_02"); //Was? Ohne mich? Na, ich werde mir meinen Anteil schon holen!
	AI_Output(self, other, "GRD_271_ULBERT_LOCK_Info_07_02"); //Cože? Beze mě? Dobře, vezmu si svůj podíl.

//	B_LogEntry(CH2_StorageShed,"It was an easy game to get Ulbert away from the store shed. He doesn't seem to be exactly bright!");
//	B_LogEntry(CH2_StorageShed,"Ulbert ließ sich sehr leicht vom Lagerschuppen weglocken. Er scheint nicht gerade der Hellste zu sein!");
	B_LogEntry(CH2_StorageShed, "Dostat Ulberta ze skladiště bylo velice snadné. Nepůsobí příliš bystrým dojmem!");

	Npc_ExchangeRoutine(self, "away");
	AI_StopProcessInfos(self);
};

// ***************** Ulbert ist sauer *****************************
instance GRD_271_ULBERT_ANGRY(C_INFO)
{
	npc = GRD_271_ULBERT;
	condition = GRD_271_ULBERT_ANGRY_Condition;
	information = GRD_271_ULBERT_ANGRY_Info;
	important = 1;
	permanent = 0;
};

func int GRD_271_ULBERT_ANGRY_Condition()
{
	if ((Npc_KnowsInfo(hero, GRD_271_ULBERT_LOCK))
	&& (Npc_GetDistToWP(hero, "OM_CAVE1_49") < 600))
	{
		return 1;
	};

	return 0;
};

func void GRD_271_ULBERT_ANGRY_Info()
{
//	AI_Output(self,other,"GRD_271_ULBERT_ANGRY_Info_07_01"); //Hey you, there was no grilled meat at all!
//	AI_Output(self,other,"GRD_271_ULBERT_ANGRY_Info_07_01"); //Hey du, es gab gar kein gebratenes Fleisch!
	AI_Output(self, other, "GRD_271_ULBERT_ANGRY_Info_07_01"); //Hej, ty, tam se vůbec žádné maso neopéká!
//	AI_Output(other,self,"GRD_271_ULBERT_ANGRY_Info_15_02"); //Oh... uh...... I guess I must have been mistaken! Have a good day!
//	AI_Output(other,self,"GRD_271_ULBERT_ANGRY_Info_15_02"); //Oh ... äh ... ... da muss ich mich wohl geirrt haben! Schönen Tag noch!
	AI_Output(other, self, "GRD_271_ULBERT_ANGRY_Info_15_02"); //Och... ech... To jsem se musel splést! Pěknej den!

	B_GiveXP(XP_LureUlbertAway);

//	B_LogEntry(CH2_StorageShed,"I've met Ulbert again. Oh man, he didn't even understand that I'd taken him for a ride. That boy is so naive!");
//	B_LogEntry(CH2_StorageShed,"Habe Ulbert wiedergetroffen. Oh Mann, er hat nicht mal jetzt kapiert, dass ich ihn reingelegt habe. Wirklich naiv der Junge!");
	B_LogEntry(CH2_StorageShed, "Znovu jsem potkal Ulberta. Člověče, ten vůbec nepochopil, že jsem ho odlákal. Vskutku naivní chlap!");
	Log_SetTopicStatus(CH2_StorageShed, LOG_SUCCESS);

	Npc_ExchangeRoutine(self, "start");
	AI_StopProcessInfos(self);
};
