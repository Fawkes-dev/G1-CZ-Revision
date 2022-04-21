// ******************************
//				EXIT
// ******************************

instance ORG_801_Lares_Exit(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 999;
	condition = ORG_801_Lares_Exit_Condition;
	information = ORG_801_Lares_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int ORG_801_Lares_Exit_Condition()
{
	return 1;
};

func void ORG_801_Lares_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ******************************
//			Wie hier rein?
// ******************************
	var int Lares_vorbeigemogelt;
// ******************************

instance ORG_801_Lares_YouHere(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 1;
	condition = ORG_801_Lares_YouHere_Condition;
	information = ORG_801_Lares_YouHere_Info;
	permanent = 1;
	important = 1;
};

func int ORG_801_Lares_YouHere_Condition()
{
	var C_NPC Roscoe; Roscoe = Hlp_GetNpc(Org_840_Roscoe);
	if ((Roscoe.aivar[AIV_PASSGATE]==FALSE))
	{
		return 1;
	};
};

func void ORG_801_Lares_YouHere_Info()
{
	var C_NPC Roscoe; Roscoe = Hlp_GetNpc(Org_840_Roscoe);
	if ((Npc_IsInState(Roscoe, ZS_MagicSleep)) || (Npc_GetTempAttitude(Roscoe,other)==ATT_FRIENDLY))
	{
//		AI_Output(self,other,"ORG_801_Lares_YouHere_11_00"); //How did you get in here? What's up with Roscoe?
//		AI_Output(self,other,"ORG_801_Lares_YouHere_11_00"); //Wie kommst du hier rein? Was ist mit Roscoe?
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_00"); //Jak ses sem dostal? Co se stalo s Roscoem?
//		AI_Output(other,self,"ORG_801_Lares_YouHere_15_01"); //He didn't feel like stopping me.
//		AI_Output(other,self,"ORG_801_Lares_YouHere_15_01"); //Er hatte keine Lust, mich aufzuhalten.
		AI_Output(other,self,"ORG_801_Lares_YouHere_15_01"); //Neměl chuť mě zastavit.
//		AI_Output(self,other,"ORG_801_Lares_YouHere_11_02"); //What do you want?
//		AI_Output(self,other,"ORG_801_Lares_YouHere_11_02"); //Was willst du?
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_02"); //Co chceš?
		Roscoe.aivar[AIV_PASSGATE] = TRUE;
		Lares_vorbeigemogelt = TRUE;
		B_GiveXP(XP_CheatedIntoLaresHut);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	};
};

// ******************************
//			Wanna Join
// ******************************

instance ORG_801_Lares_WannaJoin(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 1;
	condition = ORG_801_Lares_WannaJoin_Condition;
	information = ORG_801_Lares_WannaJoin_Info;
	permanent = 0;
//	description = "I want to join your gang.";
//	description = "Ich will mich eurer Bande anschließen.";
	description = "Chci se přidat k tvojí tlupě!";
};

func int ORG_801_Lares_WannaJoin_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	&& (Kapitel < 2)
	{
		return 1;
	};
};

func void ORG_801_Lares_WannaJoin_Info()
{
//	AI_Output(other,self,"ORG_801_Lares_WannaJoin_15_00"); //I want to join your gang.
//	AI_Output(other,self,"ORG_801_Lares_WannaJoin_15_00"); //Ich will mich eurer Bande anschließen.
	AI_Output(other,self,"ORG_801_Lares_WannaJoin_15_00"); //Chci se přidat k tvojí tlupě!
//	AI_Output(self,other,"ORG_801_Lares_WannaJoin_11_01"); //Oh yeah? What have you got to show for yourself then?
//	AI_Output(self,other,"ORG_801_Lares_WannaJoin_11_01"); //So? Was hast du denn vorzuweisen?
	AI_Output(self,other,"ORG_801_Lares_WannaJoin_11_01"); //Cože? Proto ses tady ukázal?
};

// ******************************
//			Bring List
// ******************************
	var int Lares_BringListBack;
// ******************************

instance ORG_801_Lares_BringList(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_BringList_Condition;
	information = ORG_801_Lares_BringList_Info;
	permanent = 0;
//	description = "I have the list of requirements for the Old Mine on me.";
//	description = "Ich habe die Bedarfsliste der Alten Mine bei mir.";
	description = "Mám s sebou seznam požadavků ze Starého dolu.";
};

func int ORG_801_Lares_BringList_Condition()
{
	if ((Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)) && (Npc_HasItems(hero,TheList)))
	{
		return 1;
	};
};

func void ORG_801_Lares_BringList_Info()
{
//	AI_Output(other,self,"ORG_801_Lares_BringList_15_00"); //I have the list of requirements for the Old Mine on me.
//	AI_Output(other,self,"ORG_801_Lares_BringList_15_00"); //Ich habe die Bedarfsliste der Alten Mine bei mir.
	AI_Output(other,self,"ORG_801_Lares_BringList_15_00"); //Mám s sebou seznam požadavků ze Starého dolu.
//	AI_Output(self,other,"ORG_801_Lares_BringList_11_01"); //No! I don't believe it! I must say you do seem to have a nerve.
//	AI_Output(self,other,"ORG_801_Lares_BringList_11_01"); //Nein! Das glaub' ich nicht! Du bist mir schon einer, das muss ich ja sagen.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_01"); //Ne! Tomu nevěřím! Musím ale říci, že máš pevné nervy!
//	AI_Output(self,other,"ORG_801_Lares_BringList_11_02"); //Show me!
//	AI_Output(self,other,"ORG_801_Lares_BringList_11_02"); //Zeig her!
	AI_Output(self,other,"ORG_801_Lares_BringList_11_02"); //Ukaž mi to!
//	AI_Output(other,self,"ORG_801_Lares_BringList_15_03"); //Here it is...
//	AI_Output(other,self,"ORG_801_Lares_BringList_15_03"); //Hier ist sie ...
	AI_Output(other,self,"ORG_801_Lares_BringList_15_03"); //Tady je...
	B_UseFakeScroll();
//	AI_Output(self,other,"ORG_801_Lares_BringList_11_04"); //Indeed! D'you know what we're going to do with it? We'll add to it and you'll take the list back to the Old Camp!
//	AI_Output(self,other,"ORG_801_Lares_BringList_11_04"); //Tatsächlich! Weißt du, was wir jetzt damit machen? Wir schreiben noch ein bisschen was drauf und du bringst die Liste zurück ins Alte Lager!
	AI_Output(self,other,"ORG_801_Lares_BringList_11_04"); //Opravdu! Víš, co s tím uděláme? Ještě tam něco připíšeme a pošleme ten seznam zpátky do Starého tábora!
//	AI_Output(self,other,"ORG_801_Lares_BringList_11_05"); //Then, when they deliver the stuff to the mine, we'll mug 'em and take the lot! It won't take a minute... Hah! Here's the list. You know what to do.
//	AI_Output(self,other,"ORG_801_Lares_BringList_11_05"); //Wenn sie den Krempel dann an die Mine liefern, überfallen wir sie und sacken uns alles ein! Das haben wir gleich ... So! Hier ist die Liste. Du weißt, was du zu tun hast.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_05"); //Potom, až ty věci přinesou do dolu, přepadneme je a všechno si nacpeme do pytlů! Nebude to trvat ani minutku... Ha! Tady je ten seznam. Víš, co máš dělat.
	//AI_Output(self,other,"ORG_801_Lares_BringList_11_06"); //Das haben wir gleich ... So! Hier ist die Liste. Du weißt, was du zu tun hast.

	Points_NC = Points_NC + 10;

	Lares_BringListBack = LOG_RUNNING;
	Npc_RemoveInvItem(hero,TheList);
	CreateInvItem(hero,TheListNC);

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
	};
//	B_LogEntry(CH1_JoinNC,"Lares, the leader of the rogues, was very surprised when he saw the list of requirements. He extended it and now I'm to take it to Diego.");
//	B_LogEntry(CH1_JoinNC,"Lares, der Anführer der Banditen war sehr erstaunt, die Bedarfsliste zu sehen. Er hat sie erweitert und ich soll sie Diego bringen.");
	B_LogEntry(CH1_JoinNC,"Lares, vůdce banditů, byl velmi překvapen, když uviděl seznam požadavků. Připsal další položky a já jej teď nesu Diegovi.");
	B_GiveXP(XP_GiveListToLares);
};

// ******************************
//		List an Diego!
// ******************************

instance ORG_801_Lares_BringListBack(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_BringListBack_Condition;
	information = ORG_801_Lares_BringListBack_Info;
	permanent = 0;
//	description = "I've given the list to Diego.";
//	description = "Ich habe Diego die Liste übergeben.";
	description = "Přinesl jsem Diegovi seznam.";
};

func int ORG_801_Lares_BringListBack_Condition()
{
	if ((Lares_BringListBack==LOG_RUNNING) && (Diego_BringList==LOG_SUCCESS))
	{
		return 1;
	};
};

func void ORG_801_Lares_BringListBack_Info()
{
//	AI_Output(other,self,"ORG_801_Lares_BringListBack_15_00"); //I've given the list to Diego.
//	AI_Output(other,self,"ORG_801_Lares_BringListBack_15_00"); //Ich habe Diego die Liste übergeben.
	AI_Output(other,self,"ORG_801_Lares_BringListBack_15_00"); //Přinesl jsem Diegovi seznam.
//	AI_Output(self,other,"ORG_801_Lares_BringListBack_11_01"); //Good! I positioned some men on the path to the Old Mine. Thorus' guards are lying dead in the forest even as we speak.
//	AI_Output(self,other,"ORG_801_Lares_BringListBack_11_01"); //Gut! Ich habe bereits Leute auf dem Weg zur Alten Mine postiert. In diesem Moment liegen Thorus' Gardisten schon tot im Wald.
	AI_Output(self,other,"ORG_801_Lares_BringListBack_11_01"); //Dobře! Rozmístil jsem pár mužů po cestě ke Starému dolu. Thorusovi strážci už teď leží mrtví v lese.

	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_SUCCESS;

//	B_LogEntry(CH1_JoinNC,"Lares has already robbed the convoy of the Old Camp. Apparently he didn't want to wait until ... or rather IN CASE I came back.");
//	B_LogEntry(CH1_JoinNC,"Lares hat den Konvoy des Alten Lagers bereits überfallen. Offensichtlich wollte er nicht abwarten, bis... oder vielmehr OB ich zurückkomme.");
	B_LogEntry(CH1_JoinNC,"Lares již přepadl konvoje Starého tábora. Zřejmě se mu nechtělo čekat, dokud... nebo spíše POKUD se vrátím. ");

	B_GiveXP(XP_ReportListDeliveryToLares);
};

// ******************************
//		Anteil wegen BringList
// ******************************

instance ORG_801_Lares_BringListAnteil(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_BringListAnteil_Condition;
	information = ORG_801_Lares_BringListAnteil_Info;
	permanent = 0;
//	description = "They've already mugged the convoy? Where's my share?";
//	description = "Sie haben den Konvoi schon überfallen? Was ist mein Anteil bei der Sache?";
	description = "Už přepadli konvoj? Kde je můj podíl?";
};

func int ORG_801_Lares_BringListAnteil_Condition()
{
	if ((Npc_KnowsInfo(hero,ORG_801_Lares_BringListBack)))
	{
		return 1;
	};
};

func void ORG_801_Lares_BringListAnteil_Info()
{
//	AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_00"); //They've already mugged the convoy? Where's my share?
//	AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_00"); //Sie haben den Konvoi schon überfallen? Was ist mein Anteil bei der Sache?
	AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_00"); //Už přepadli konvoj? Kde je můj podíl?
//	AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_01"); //Go to see Gorn. He'll give you something.
//	AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_01"); //Geh zu Gorn. Er wird dir etwas geben.
	AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_01"); //Běž za Gornem. Něco ti dá...
	var C_NPC gorn; gorn = Hlp_GetNpc(PC_Fighter);
	if (gorn.aivar[AIV_FINDABLE]==TRUE)
	{
//		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_02"); //I know Gorn. He's no member of the gang. He's a mercenary who works for the mages.
//		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_02"); //Ich kenne Gorn. Er ist kein Mitglied der Bande. Er ist ein Söldner der Magier.
		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_02"); //Znám Gorna. Není členem tlupy. Je to žoldák, co pracuje pro mágy!
//		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_03"); //Yeah, that's right.
//		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_03"); //Ja, das ist richtig.
		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_03"); //Jo, to je pravda!
//		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_04"); //Was he involved in this business?
//		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_04"); //War er an der Sache beteiligt?
		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_04"); //Je do tohohle podniku zapojený?
//		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_05"); //Knowing too much isn't good for you. Just go to see him and collect your share.
//		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_05"); //Es ist nicht gut für dich, wenn du zu viel weißt. Geh einfach zu ihm und hol dir deinen Anteil ab.
		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_05"); //Kdo moc ví, není pro nás dobrý. Běž za ním a vyber si svůj podíl.
	};
//	B_LogEntry(CH1_JoinNC,"Gorn, the mercenary, participated in the raid on the convoy in a mysterious way. I'll get my share from him.");
//	B_LogEntry(CH1_JoinNC,"Gorn der Söldner war auf mysteriöse Art und Weise in den Überfall auf den Konvoi beteiligt. Von ihm kann ich mir meinen Anteil abholen.");
	B_LogEntry(CH1_JoinNC,"Žoldák Gorn se tajně účastnil útoku na konvoj. Dostanu od něj svůj podíl.");
	gorn.aivar[AIV_FINDABLE]==TRUE;
};

// ******************************
//		Mordrag schickt mich
// ******************************

instance ORG_801_Lares_MordragSentMe(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_MordragSentMe_Condition;
	information = ORG_801_Lares_MordragSentMe_Info;
	permanent = 0;
//	description = "Mordrag sent me. He gave me a ring for you.";
//	description = "Mordrag schickt mich. Er hat mir einen Ring für dich gegeben.";
	description = "Poslal mě Mordrag. Dal mi pro tebe prsten.";
};

func int ORG_801_Lares_MordragSentMe_Condition()
{
	if Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)
	&& Npc_HasItems(hero,MordragsRing)
	&& (Kapitel < 2)
	{
		return 1;
	};
};

func void ORG_801_Lares_MordragSentMe_Info()
{
	B_GiveInvItems(other,self,MordragsRing,1);

//	AI_Output(other,self,"ORG_801_Lares_MordragSentMe_15_00"); //Mordrag sent me. He gave me a ring for you.
//	AI_Output(other,self,"ORG_801_Lares_MordragSentMe_15_00"); //Mordrag schickt mich. Er hat mir einen Ring für dich gegeben.
	AI_Output(other,self,"ORG_801_Lares_MordragSentMe_15_00"); //Poslal mě Mordrag. Dal mi pro tebe prsten.
//	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_01"); //A precious piece! It's part of normal procedure here to share your booty with your gang leader.
//	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_01"); //Ein wertvolles Stück! Es ist bei uns üblich, einen Teil der Beute mit dem Anführer zu teilen.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_01"); //Nádherný kousek! To je část zdejšího obvyklého postupu, že díl kořisti připadne vůdci tlupy.
//	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_02"); //But the fact that he gave YOU the ring proves that he must think a lot of you.
//	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_02"); //Aber dass er DIR den Ring gegeben hat, zeigt, dass er einiges von dir hält.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_02"); //Ale to, že on dal prsten TOBĚ, svědčí o tom, že má o tobě dobré mínění.
//	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_03"); //I want you to go to him and tell him something from me.
//	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_03"); //Ich will, dass du zu ihm gehst und ihm etwas ausrichtest.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_03"); //Chci, abys za ním zašel a něco mu vyřídil.
//	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_04"); //Tell him I want somebody in the Sect Camp. The Brotherhood is planning something big - I want to know exactly what's going on there.
//	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_04"); //Sag ihm, ich will jemanden im Sektenlager haben. Die Bruderschaft plant irgendwas Großes - ich will genau wissen, was da abläuft.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_04"); //Řekni mu, že chci mít někoho v Sektovním táboře. Bratrstvo plánuje něco velkého - a já chci vědět přesně, co to bude.

	Lares_InformMordrag = LOG_RUNNING;

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
	};
//	B_LogEntry(CH1_JoinNC,"Lares sent me to Mordrag. He wants me to tell him that a spy will be sent to the Sect Camp in order to find out what the Brotherhood is planning.");
//	B_LogEntry(CH1_JoinNC,"Lares, hat mich zu Mordrag geschickt. Ich soll ihm sagen, dass ein Spion in das Sektenlager geschickt werden soll, der herausfindet, was die Bruderschaft vorbereitet.");
	B_LogEntry(CH1_JoinNC,"Lares mě vyslal za Mordragem. Chce, abych mu řekl, že do Sektářského tábora bude vyslán zvěd, aby zjistil, co chystá Bratrstvo.");
	B_GiveXP(XP_GiveRingToLares);

	Points_NC = Points_NC + 10;
};

// ******************************
//		Immerhin vorbeigemogelt
// ******************************

instance ORG_801_Lares_Vorbeigemogelt(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_Vorbeigemogelt_Condition;
	information = ORG_801_Lares_Vorbeigemogelt_Info;
	permanent = 0;
//	description = "I did manage to get past your guards.";
//	description = "Ich bin immerhin an deinen Wachen vorbeigekommen.";
	description = "Podařilo se mi dostat přes tvoje stráže.";
};

func int ORG_801_Lares_Vorbeigemogelt_Condition()
{
	if ((Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)) && (Lares_vorbeigemogelt == TRUE))
	{
		return 1;
	};
};

func void ORG_801_Lares_Vorbeigemogelt_Info()
{
//	AI_Output(other,self,"ORG_801_Lares_Vorbeigemogelt_15_00"); //I did manage to get past your guards.
//	AI_Output(other,self,"ORG_801_Lares_Vorbeigemogelt_15_00"); //Ich bin immerhin an deinen Wachen vorbeigekommen.
	AI_Output(other,self,"ORG_801_Lares_Vorbeigemogelt_15_00"); //Podařilo se mi dostat přes tvoje stráže.
//	AI_Output(self,other,"ORG_801_Lares_Vorbeigemogelt_11_01"); //That's right. But that alone won't be enough.
//	AI_Output(self,other,"ORG_801_Lares_Vorbeigemogelt_11_01"); //Das ist richtig. Aber das alleine wird noch nicht reichen.
	AI_Output(self,other,"ORG_801_Lares_Vorbeigemogelt_11_01"); //To je v pořádku. To ale samo o sobě nestačí.

	Points_NC = Points_NC + 10;
};

// ******************************
//		Baal Isidro - Get Kraut
// ******************************
	var int Lares_Get400Ore;
// ******************************

instance ORG_801_Lares_GetKraut(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 10;
	condition = ORG_801_Lares_GetKraut_Condition;
	information = ORG_801_Lares_GetKraut_Info;
	permanent = 0;
//	description = "What else can I do?";
//	description = "Was kann ich noch machen?";
	description = "Co mám ještě udělat?";
};

func int ORG_801_Lares_GetKraut_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_BringList) || Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_Vorbeigemogelt))
	{
		return 1;
	};
};

func void ORG_801_Lares_GetKraut_Info()
{
//	AI_Output(other,self,"ORG_801_Lares_GetKraut_15_00"); //What else can I do?
//	AI_Output(other,self,"ORG_801_Lares_GetKraut_15_00"); //Was kann ich noch machen?
	AI_Output(other,self,"ORG_801_Lares_GetKraut_15_00"); //Co mám ještě udělat?
//	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_01"); //Baal Isidro from the Sect Camp has weed worth at least 400 ore on him. I want you to get it from him. I don't care how you do it.
//	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_01"); //Baal Isidro aus dem Sektenlager hat Kraut im Wert von mindestens 400 Erz bei sich. Ich will, dass du es ihm abnimmst. Egal, wie.
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_01"); //Baal Isidro ze Sektovního tábora má u sebe drogu v ceně aspoň 400 nugetů. Chci ji od něj mít. Je mi jedno, jak to provedeš.

	if ((BaalIsidro_DealerJob==LOG_RUNNING) || (BaalIsidro_DealerJob==LOG_SUCCESS))
	{
//		AI_Output(other,self,"ORG_801_Lares_GetKraut_15_02"); //If you mean the massive heap of weed, I've already got it.
//		AI_Output(other,self,"ORG_801_Lares_GetKraut_15_02"); //Wenn du den Riesenhaufen Kraut meinst, den hab' ich mir schon unter den Nagel gerissen
		AI_Output(other,self,"ORG_801_Lares_GetKraut_15_02"); //Jestli myslíš tu velkou hromadu drogy, tak tu už mám.
//		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_03"); //Looks like you've been real smart!
//		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_03"); //Du scheinst mir einer von der schnellen Sorte zu sein!
		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_03"); //Vypadá to, že jsi skutečně čiperný!
	};

//	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_04"); //If you have the weed, sell it. Bring me the 400 ore.
//	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_04"); //Wenn du das Kraut hast, verkauf es. Die 400 Erz bringst du zu mir.
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_04"); //Jestli tu drogu máš, prodej ji. Přines mi 400 nugetů.
//	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_05"); //Then we'll talk again to see if you'll be admitted to the gang.
//	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_05"); //Dann unterhalten wir uns noch mal darüber, ob du in die Bande aufgenommen wirst.
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_05"); //Pak si znovu promluvíme o tvém přijetí do tlupy.
	Lares_Get400Ore = LOG_RUNNING;

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
	};
//	B_LogEntry(CH1_JoinNC,"I'm told to get Baal Isidro's weed and to sell it for 400 ore. Lares wants to get the profit.");
//	B_LogEntry(CH1_JoinNC,"Ich soll Baal Isidro sein Kraut abnehmen und für 400 Erz verhökern. Den Erlös will Lares haben.");
	B_LogEntry(CH1_JoinNC,"Mám převzít drogu Baala Isidra a prodat ji za 400 nugetů.Výtěžek dostane Lares.");
};

// ******************************
//			400 Ore
// ******************************

instance ORG_801_Lares_400Ore(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_400Ore_Condition;
	information = ORG_801_Lares_400Ore_Info;
	permanent = 1;
//	description = "I have the 400 ore.";
//	description = "Ich hab' die 400 Erz.";
	description = "Mám těch 400 nugetů.";
};

func int ORG_801_Lares_400Ore_Condition()
{
	if ((Lares_Get400Ore == LOG_RUNNING) && ((BaalIsidro_DealerJob==LOG_RUNNING)||(BaalIsidro_DealerJob==LOG_SUCCESS)))
	{
		return 1;
	};
};

func void ORG_801_Lares_400Ore_Info()
{
//	AI_Output(other,self,"ORG_801_Lares_400Ore_15_00"); //I have the 400 ore.
//	AI_Output(other,self,"ORG_801_Lares_400Ore_15_00"); //Ich hab' die 400 Erz.
	AI_Output(other,self,"ORG_801_Lares_400Ore_15_00"); //Mám těch 400 nugetů.
	if (Npc_HasItems(other,itminugget)>=400)
	{
//		AI_Output(self,other,"ORG_801_Lares_400Ore_11_01"); //Good! Very good. I believe that should be sufficient now.
//		AI_Output(self,other,"ORG_801_Lares_400Ore_11_01"); //Gut! Sehr gut. Ich denke, das reicht jetzt.
		AI_Output(self,other,"ORG_801_Lares_400Ore_11_01"); //Výborně! Velmi dobře! Myslím, že to by mělo stačit.
		Lares_Get400Ore = LOG_SUCCESS;
		Points_NC = Points_NC + 10;

		B_GiveInvItems(other,self,ItMiNugget, 400);
//		B_LogEntry(CH1_JoinNC,"Lares was clearly satisfied when I gave him the 400 ore I got by selling Baal Isidro's weed.");
//		B_LogEntry(CH1_JoinNC,"Lares zeigte sich sichtlich zufrieden, als ich ihm die 400 Erz aus dem Verkaufserlös von Baal Isidros Krautstengel übergab.");
		B_LogEntry(CH1_JoinNC,"Lares byl zjevně spokojený, když jsem mu předal těch 400 nugetů, které jsem utržil prodejem drogy Baala Isidra.");
		B_GiveXP(XP_BaalIsidroPayLares);
	}
	else
	{
//		AI_Output(self,other,"ORG_801_Lares_400Ore_NOORE_11_00"); //Count again. I hope you haven't spent half of it on booze.
//		AI_Output(self,other,"ORG_801_Lares_400Ore_NOORE_11_00"); //Zähl noch mal nach. Ich hoffe, du hast nicht schon die Hälfte versoffen.
		AI_Output(self,other,"ORG_801_Lares_400Ore_NOORE_11_00"); //Počítej znovu. Doufám, že jsi neutratil polovinu za chlast.
	};
};

// ******************************
//		Reicht das jetzt???
// ******************************

instance ORG_801_Lares_Reicht(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 5;
	condition = ORG_801_Lares_Reicht_Condition;
	information = ORG_801_Lares_Reicht_Info;
	permanent = 1;
//	description = "Is that enough for me to join you?";
//	description = "Reicht das, um bei euch aufgenommen zu werden?";
	description = "Stačí to, abych se mohl přidat?";
};

func int ORG_801_Lares_Reicht_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)
	&& (Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_BringList))
	&& (Npc_GetTrueGuild(other)==GIL_NONE) && (Kapitel <2))

	{
		return 1;
	};
};

func void ORG_801_Lares_Reicht_Info()
{
//	AI_Output(other,self,"ORG_801_Lares_Reicht_15_00"); //Is that enough for me to join you?
//	AI_Output(other,self,"ORG_801_Lares_Reicht_15_00"); //Reicht das, um bei euch aufgenommen zu werden?
	AI_Output(other,self,"ORG_801_Lares_Reicht_15_00"); //Stačí to, abych se mohl přidat?

	if ((Points_NC >= 30) && (hero.level >= 5))
	{
//		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_00"); //I should say so!
//		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_00"); //Das will ich meinen!
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_00"); //To bych řekl!
//		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_01"); //And I've even got a present for you. A better armor. It's not much, but you've earned it.
//		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_01"); //Und ich habe sogar ein Geschenk für dich. Eine bessere Rüstung. Nicht viel, aber du hast sie dir verdient.
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_01"); //A mám pro tebe dárek. Lepší zbroj. Není to moc, ale vydělal sis na ni.

		hero.guild = GIL_ORG;
		Npc_SetTrueGuild(hero,GIL_ORG);
		CreateInvItem(hero,ORG_ARMOR_L);

		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);

		AI_EquipBestArmor(hero);
		B_GiveXP(XP_BecomeBandit);

//		B_LogEntry(CH1_JoinNC,"Lares made me a member of his gang. Now the New Camp is my home!");
//		B_LogEntry(CH1_JoinNC,"Lares hat mich in seine Bande aufgenommen. Ab jetzt ist das Neue Lager meine neue Heimat!");
		B_LogEntry(CH1_JoinNC,"Lares mě přijal za člena své tlupy. Teď je Nový tábor mým domovem!");
		Log_SetTopicStatus(CH1_JoinNC,LOG_SUCCESS);

		// Canceln der anderen Aufnahmen
		Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinOC,LOG_FAILED);
//		B_LogEntry(CH1_JoinOC,"A member of Lares' gang can't join the Old Camp, that's impossible.");
//		B_LogEntry(CH1_JoinOC,"Als Mitglied von Lares Bande ist eine Aufnahme im Alten Lager unmöglich geworden.");
		B_LogEntry(CH1_JoinOC,"Člen Laresovy tlupy se nemůže přidat ke Starému táboru. To je nemožné.");

		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_FAILED);
//		B_LogEntry(CH1_JoinPsi,"The Brotherhood will have to cope without me since the New Camp is my home from now on.");
//		B_LogEntry(CH1_JoinPsi,"Die Bruderschaft muss nun wohl doch ohne mich auskommen, denn das Neue Lager ist nun mein neues Zuhause.");
		B_LogEntry(CH1_JoinPsi,"Bratrstvo se bude muset beze mě obejít, protože jsem nyní doma v Novém táboře.");

		Log_SetTopicStatus(CH1_LostNek,LOG_FAILED);
		Log_SetTopicStatus(CH1_FiskNewDealer,LOG_FAILED);
		Log_SetTopicStatus(CH1_KalomsRecipe,LOG_FAILED);
		Log_SetTopicStatus(CH1_BringList,LOG_FAILED);
		Log_SetTopicStatus(CH1_MordragKO,LOG_FAILED);
	}
	else
	{
		if (Npc_KnowsInfo(Hero, ORG_801_Lares_MordragSentMe))
		{
//			AI_Output(self,other,"ORG_801_Lares_Reicht_11_02"); //Mordrag has spoken up for you.
//			AI_Output(self,other,"ORG_801_Lares_Reicht_11_02"); //Mordrag hat sich für dich eingesetzt.
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_02"); //Mordrag se za tebe přimluvil.
		};
		if (Npc_KnowsInfo(Hero, ORG_801_Lares_BringList))
		{
//			AI_Output(self,other,"ORG_801_Lares_Reicht_11_03"); //You've become quite popular since you brought the list here.
//			AI_Output(self,other,"ORG_801_Lares_Reicht_11_03"); //Die Liste hier hinzubringen, hat dir einiges Ansehen gebracht.
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_03"); //Stal jsi se oblíbeným od okamžiku, kdy jsi sem donesl ten seznam.
		};
//		AI_Output(self,other,"ORG_801_Lares_Reicht_11_04"); //But you're not ready yet. Do your tasks.
//		AI_Output(self,other,"ORG_801_Lares_Reicht_11_04"); //Aber du bist noch nicht bereit. Erledige deine Aufgaben.
		AI_Output(self,other,"ORG_801_Lares_Reicht_11_04"); //Nejsi ale ještě připravený. Proveď své úkoly.

		B_PrintGuildCondition(5);
	};
};

// ******************************
//			Goto Kalom
// ******************************

instance ORG_801_Lares_GotoKalom(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 10;
	condition = ORG_801_Lares_GotoKalom_Condition;
	information = ORG_801_Lares_GotoKalom_Info;
	permanent = 0;
//	description = "And what am I supposed to do now?";
//	description = "Und was soll ich jetzt machen?";
	description = "A co se očekává, že mám udělat?";
};

func int ORG_801_Lares_GotoKalom_Condition()
{
	if (Npc_GetTrueGuild(other)==GIL_ORG )
	{
		return 1;
	};
};

func void ORG_801_Lares_GotoKalom_Info()
{
//	AI_Output(other,self,"ORG_801_Lares_GotoKalom_15_00"); //And what am I supposed to do now?
//	AI_Output(other,self,"ORG_801_Lares_GotoKalom_15_00"); //Und was soll ich jetzt machen?
	AI_Output(other,self,"ORG_801_Lares_GotoKalom_15_00"); //A co se očekává, že mám udělat?
//	AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_01"); //You're now a member of our gang. You're free to do what you want.
//	AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_01"); //Du bist jetzt ein Mitglied unserer Bande. Es steht dir frei zu tun, was du willst.
	AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_01"); //Jsi teď členem naší tlupy. Můžeš si dělat, co chceš.

	Log_CreateTopic(CH1_GotoPsiCamp,LOG_MISSION);
	Log_SetTopicStatus(CH1_GotoPsiCamp,LOG_RUNNING);
//	B_LogEntry(CH1_GotoPsiCamp,"The Brotherhood in the swamp camp is planning something big. Lares, the leader of the rogues, wants to know what it is.");
//	B_LogEntry(CH1_GotoPsiCamp,"Die Bruderschaft im Sumpflager bereitet irgendetwas großes vor. Lares der Anführer der Banditen will wissen was das ist.");
	B_LogEntry(CH1_GotoPsiCamp,"Bratrstvo z tábora v bažinách plánuje něco velkého. Lares, vůdce banditů, chce vědět, co to je.");

	if (Lares_InformMordrag == LOG_RUNNING)
	{
//		AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_02"); //If you want to make yourself useful, go to Mordrag and help him with the sect business.
//		AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_02"); //Wenn du dich nützlich machen willst, geh zu Mordrag und unterstütz ihn bei der Sektensache.
		AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_02"); //Jestli chceš být užitečný, jdi za Mordragem a pomoz mu s tou akcí se sektáři.
//		B_LogEntry(CH1_GotoPsiCamp,"I'm to help Mordrag to find out what's going on there!");
//		B_LogEntry(CH1_GotoPsiCamp,"Ich soll Mordrag dabei unterstützen, herauszufinden was dort vor sich geht!");
		B_LogEntry(CH1_GotoPsiCamp,"Pomůžu Mordragovi zjistit, o co tam jde.");
	}
	else
	{
		var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
		if (Npc_IsDead(Mordrag))
		{
//			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_03"); //Mordrag, one of our people in the Old Camp, has been killed. Before he died, he sent us a message. It said that something big's going on in the Sect Camp.
//			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_03"); //Mordrag, einer unserer Leute vom Alten Lager, wurde umgebracht. Bevor er starb, hat er uns die Nachricht übermittelt, dass im Lager der Sekte eine große Sache läuft.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_03"); //Mordrag, jeden z našich lidí, byl ve Starém táboře zabit. Než zemřel, poslal nám zprávu. Říká, že se v Sektovním táboře chystá něco obrovského.
//			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_04"); //Go to the Brotherhood's camp and find out what's going on.
//			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_04"); //Geh zum Lager der Bruderschaft und finde heraus, was los ist.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_04"); //Jdi tábora Bratrstva a zjisti, co se tam děje.
//			B_LogEntry(CH1_GotoPsiCamp,"He sent me directly to the camp of the Brotherhood.");
//			B_LogEntry(CH1_GotoPsiCamp,"Er hat mich direkt ins Lager der Bruderschaft geschickt.");
			B_LogEntry(CH1_GotoPsiCamp,"Poslal mě přímo do tábora Bratrstva.");
		}
		else
		{
//			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_05"); //Mordrag, one of our people in the Old Camp, has come back.
//			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_05"); //Mordrag, einer unserer Leute aus dem Alten Lager, ist zurückgekehrt.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_05"); //Mordrag, jeden z našich lidí, se vrátil zpátky ze Starého tábora.
//			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_06"); //Go to see him. Tell him I want somebody in that Sect Camp. The Brotherhood is planning something big - I want to know exactly what's going on.
//			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_06"); //Geh zu ihm. Sag ihm, ich will jemanden im Sektenlager haben. Die Bruderschaft plant irgendwas Großes - ich will genau wissen, was da abläuft.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_06"); //Běž za ním. Řekni mu, že chci mít někoho v Sektovním táboře. Bratrstvo plánuje něco velkého - a já chci přesně vědět co.
//			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_07"); //Help him.
//			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_07"); //Hilf ihm bei der Sache.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_07"); //Pomoz mu.
//			B_LogEntry(CH1_GotoPsiCamp,"A rogue by the name of Mordrag is supposed to take care of the thing, I can find him in the bar on the lake of the New Camp.");
//			B_LogEntry(CH1_GotoPsiCamp,"Ein Bandit namens Mordrag soll sich um diese Sache kümmern, ich kann ihn in der Kneipe auf dem See des Neuen Lagers finden.");
			B_LogEntry(CH1_GotoPsiCamp,"Bandita jménem Mordrag má tu věc na starosti a já ho najdu v baru na jezeře Nového tábora.");

			B_ExchangeRoutine(Org_826_Mordrag,"START");
			Lares_InformMordrag = LOG_RUNNING;
		};
	};
};

// ******************************
//			Wo lernen?
// ******************************

instance ORG_801_Lares_WhereLearn(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 20;
	condition = ORG_801_Lares_WhereLearn_Condition;
	information = ORG_801_Lares_WhereLearn_Info;
	permanent = 0;
//	description = "Where can I learn something?";
//	description = "Wo kann ich hier was lernen?";
	description = "Kde se můžu něco naučit?";
};

func int ORG_801_Lares_WhereLearn_Condition()
{
	return TRUE;
};

func void ORG_801_Lares_WhereLearn_Info()
{
//	AI_Output(other,self,"ORG_801_Lares_WhereLearn_Info_15_01"); //Where can I learn something?
//	AI_Output(other,self,"ORG_801_Lares_WhereLearn_Info_15_01"); //Wo kann ich hier was lernen?
	AI_Output(other,self,"ORG_801_Lares_WhereLearn_Info_15_01"); //Kde se můžu něco naučit?
//	AI_Output(self,other,"ORG_801_Lares_WhereLearn_Info_11_02"); //With me. I can help you to improve your dexterity and strength.
//	AI_Output(self,other,"ORG_801_Lares_WhereLearn_Info_11_02"); //Bei mir. Ich kann dir beibringen, deine Geschicklichkeit und Stärke zu verbessern.
	AI_Output(self,other,"ORG_801_Lares_WhereLearn_Info_11_02"); //U mě. Můžu ti pomoci procvičit tvou obratnost a sílu.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
//	B_LogEntry(GE_TeacherNC,"Lares can teach me to improve both my SKILL and my STRENGTH.");
//	B_LogEntry(GE_TeacherNC,"Lares kann mir beibringen, mein GESCHICK und meine STÄRKE zu verbessern.");
	B_LogEntry(GE_TeacherNC,"Lares mě může naučit, jak zlepšit svou ZRUČNOST a SÍLU.");

};
// ******************************
// 		STR + DEX LERNEN
// ******************************
instance ORG_801_Lares_Teach(C_INFO)
{
	npc = ORG_801_Lares;
	nr = 20;
	condition = ORG_801_Lares_Teach_Condition;
	information = ORG_801_Lares_Teach_Info;
	permanent = 1;
//	description = "I want to better myself.";
//	description = "Ich will mich verbessern";
	description = "Chci se zlepšit.";
};

func int ORG_801_Lares_Teach_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_WhereLearn))
	{
		return TRUE;
	};
};
func void ORG_801_Lares_Teach_Info()
{
//	AI_Output(other,self,"ORG_801_Lares_Teach_15_00"); //I want to better myself.
//	AI_Output(other,self,"ORG_801_Lares_Teach_15_00"); //Ich will mich verbessern.
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00"); //Chci se zlepšit.

	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK ,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_BACK()
{
	Info_ClearChoices(ORG_801_Lares_Teach);
};

func void ORG_801_Lares_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK ,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK ,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK ,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK ,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};
