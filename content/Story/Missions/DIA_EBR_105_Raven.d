// **************************************
//					EXIT
// **************************************

instance DIA_Raven_Exit(C_INFO)
{
	npc = Ebr_105_Raven;
	nr = 999;
	condition = DIA_Raven_Exit_Condition;
	information = DIA_Raven_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Raven_Exit_Condition()
{
	return 1;
};

func void DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Raven_FirstIn(C_INFO)
{
	npc = Ebr_105_Raven;
	nr = 1;
	condition = DIA_Raven_FirstIn_Condition;
	information = DIA_Raven_FirstIn_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Raven_FirstIn_Condition()
{
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if (wache218.aivar[AIV_PASSGATE]==TRUE)
	{
		return 1;
	};
};

func void DIA_Raven_FirstIn_Info()
{
//	AI_Output(self,other,"DIA_Raven_FirstIn_10_00"); //What can I do for you?
//	AI_Output(self,other,"DIA_Raven_FirstIn_10_00"); //Was kann ich für dich tun?
	AI_Output(self,other,"DIA_Raven_FirstIn_10_00"); //Co pro tebe můžu udělat?
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who(C_INFO)
{
	npc = Ebr_105_Raven;
	nr = 1;
	condition = DIA_Raven_Who_Condition;
	information = DIA_Raven_Who_Info;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};

func int DIA_Raven_Who_Condition()
{
	return 1;
};

func void DIA_Raven_Who_Info()
{
//	AI_Output(other,self,"DIA_Raven_Who_15_00"); //Who are you?
//	AI_Output(other,self,"DIA_Raven_Who_15_00"); //Wer bist du?
	AI_Output(other,self,"DIA_Raven_Who_15_00"); //Kdo jsi?
//	AI_Output(self,other,"DIA_Raven_Who_10_01"); //I'm Raven. Gomez' right hand man. Anyone who wants to see Gomez has to talk to ME first.
//	AI_Output(self,other,"DIA_Raven_Who_10_01"); //Ich bin Raven. Gomez' rechte Hand. Jeder, der hier ist, um mit Gomez zu reden, redet vorher mit MIR.
	AI_Output(self,other,"DIA_Raven_Who_10_01"); //Jsem Raven, Gomezova pravá ruka. Každý, kdo chce mluvit s Gomezem, musí mluvit nejdříve se MNOU.
};

// **************************************
//			Krautbote
// **************************************

instance DIA_Raven_Krautbote(C_INFO)
{
	npc = Ebr_105_Raven;
	nr = 1;
	condition = DIA_Raven_Krautbote_Condition;
	information = DIA_Raven_Krautbote_Info;
	permanent = 0;
//	description = "I have some weed for Gomez from Cor Kalom.";
//	description = "Ich habe eine Ladung Kraut für Gomez von Cor Kalom.";
	//#NEEDS_ATTENTION dodávku alebo donášku?
	description = "Mám pro Gomeze dodávku drogy z bažin od Cor Kaloma.";
};

func int DIA_Raven_Krautbote_Condition()
{
	if (KALOM_KRAUTBOTE == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_Krautbote_Info()
{
//	AI_Output(other,self,"DIA_Raven_Krautbote_15_00"); //I have some weed for Gomez from Cor Kalom.
//	AI_Output(other,self,"DIA_Raven_Krautbote_15_00"); //Ich habe eine Ladung Kraut für Gomez von Cor Kalom.
	AI_Output(other,self,"DIA_Raven_Krautbote_15_00"); //Mám pro Gomeze dodávku drogy z bažin od Cor Kaloma.
//	AI_Output(self,other,"DIA_Raven_Krautbote_10_01"); //Bartholo deals with that kind of thing. Gomez isn't bothered with gofers.
//	AI_Output(self,other,"DIA_Raven_Krautbote_10_01"); //Bartholo kümmert sich um diese Sachen, Gomez selbst gibt sich nicht mit Boten ab.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_01"); //O tyhle věci se stará Bartholo. Gomez se poslíčky nezabývá.
//	AI_Output(self,other,"DIA_Raven_Krautbote_10_02"); //You'll find him in the room on the right, behind the entrance, or in the kitchen in the big tower.
//	AI_Output(self,other,"DIA_Raven_Krautbote_10_02"); //Du findest ihn in der Kammer hier rechts hinter dem Eingang oder in der Küche im großen Turm.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_02"); //Najdeš ho v komnatě hned vpravo za vchodem. Nebo v kuchyni ve velké věži.
//	AI_Output(self,other,"DIA_Raven_Krautbote_10_03"); //Course he sleeps at night. I wouldn't disturb him then, if I were you.
//	AI_Output(self,other,"DIA_Raven_Krautbote_10_03"); //Nachts schläft er natürlich. Da würd' ich es nicht wagen, ihn zu stören.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_03"); //V noci samozřejmě spí. Být tebou, tak bych ho nevyrušoval.

//	B_LogEntry(CH1_KrautBote,"The weed supply for Gomez must be dropped off at Bartholo's. I'll find him in the house of the Ore Barons.");
//	B_LogEntry(CH1_KrautBote,"Die Krautlieferung für Gomez muss bei Bartholo abgegeben werden. Ich finde ihn im Haus der Erzbarone.");
	B_LogEntry(CH1_KrautBote,"Dodávka drogy pro Gomeze se musí odevzdat u Barthola. Najdu ho v domě Rudobaronů.");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_Aufnahme(C_INFO)
{
	npc = Ebr_105_Raven;
	nr = 1;
	condition = DIA_Raven_Aufnahme_Condition;
	information = DIA_Raven_Aufnahme_Info;
	permanent = 0;
//	description = "I want to see Gomez. Thorus says I'm to be taken on as a Shadow.";
//	description = "Ich will zu Gomez. Thorus sagt, ich soll als Schatten aufgenommen werden.";
	description = "Chci ke Gomezovi. Thorus říká, že bych měl být přijat ke Stínům.";
};

func int DIA_Raven_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	&& (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

func void DIA_Raven_Aufnahme_Info()
{
//	AI_Output(other,self,"DIA_Raven_Aufnahme_15_00"); //I want to see Gomez. Thorus says I'm to be taken on as a Shadow.
//	AI_Output(other,self,"DIA_Raven_Aufnahme_15_00"); //Ich will zu Gomez. Thorus sagt, ich soll als Schatten aufgenommen werden.
	AI_Output(other,self,"DIA_Raven_Aufnahme_15_00"); //Chci ke Gomezovi. Thorus říká, že bych měl být přijat ke Stínům.
//	AI_Output(self,other,"DIA_Raven_Aufnahme_10_01"); //We're always on the lookout for good men. You seem to have your wits about you. You might be okay.
//	AI_Output(self,other,"DIA_Raven_Aufnahme_10_01"); //Wir sind immer auf der Suche nach guten Leuten. Du scheinst mir nicht auf den Kopf gefallen zu sein. Du könntest es hier zu was bringen.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_01"); //Pořád hledáme nové lidi. Něpřipadá mi, že bys byl padlý na hlavu. Můžeš nám být užitečný. #Needs_Attention
//	AI_Output(self,other,"DIA_Raven_Aufnahme_10_02"); //I'll take you to Gomez. Follow me. And don't touch anything!
//	AI_Output(self,other,"DIA_Raven_Aufnahme_10_02"); //Ich werde dich zu Gomez führen. Folge mir. Und fass nichts an!
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_02"); //Zavedu tě ke Gomezovi. Pojď za mnou. A na nic nesahej!

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************
//		In Halle angekommen
// **************************************

instance DIA_Raven_There(C_INFO)
{
	npc = Ebr_105_Raven;
	nr = 1;
	condition = DIA_Raven_There_Condition;
	information = DIA_Raven_There_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Raven_There_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT"))
	{
		return 1;
	};
};

func void DIA_Raven_There_Info()
{
//	AI_Output(self,other,"DIA_Raven_There_10_01"); //Gomez is over there. If you don't show him some respect, I'll take pleasure in teaching it to you personally, have you got that?
//	AI_Output(self,other,"DIA_Raven_There_10_01"); //Dort hinten ist Gomez. Wenn du ihm keinen Respekt zeigst, werde ich dir persönlich welchen beibringen, ist das klar?
	AI_Output(self,other,"DIA_Raven_There_10_01"); //Gomez je támhle vzadu. Jestli se k němu nebudeš chovat uctivě, tak tě to osobně naučím, je to jasné?
	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self,"START");
};

// **************************************
//				PERM
// **************************************

instance DIA_Raven_PERM(C_INFO)
{
	npc = Ebr_105_Raven;
	nr = 8;
	condition = DIA_Raven_PERM_Condition;
	information = DIA_Raven_PERM_Info;
	permanent = 1;
//	description = "How's the ore trade going?";
//	description = "Wie steht der Erzhandel?";
	description = "Jak jde obchod s rudou?";
};

func int DIA_Raven_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

func void DIA_Raven_PERM_Info()
{
//	AI_Output(other,self,"DIA_Raven_PERM_15_00"); //How's the ore trade going?
//	AI_Output(other,self,"DIA_Raven_PERM_15_00"); //Wie steht der Erzhandel?
	AI_Output(other,self,"DIA_Raven_PERM_15_00"); //Jak jde obchod s rudou?
//	AI_Output(self,other,"DIA_Raven_PERM_10_01"); //The Old Mine's doing well. The last load of supplies from the outside world was massive.
//	AI_Output(self,other,"DIA_Raven_PERM_10_01"); //Die Alte Mine spuckt genug aus. Die letzte Lieferung aus der Außenwelt war ziemlich fett.
	AI_Output(self,other,"DIA_Raven_PERM_10_01"); //Ve Starém dolu to jde dobře. Poslední dodávka zásob z vnějšího světa byla skutečně obrovská.
};

// **************************************
//			Bin dabei
// **************************************

instance DIA_Raven_BinDabei(C_INFO)
{
	npc = Ebr_105_Raven;
	nr = 8;
	condition = DIA_Raven_BinDabei_Condition;
	information = DIA_Raven_BinDabei_Info;
	permanent = 0;
//	description = "Gomez says I'm in.";
//	description = "Gomez sagt, ich bin dabei.";
	description = "Gomez říká, že jsem v pořádku.";
};

func int DIA_Raven_BinDabei_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

func void DIA_Raven_BinDabei_Info()
{
	CreateInvItem(hero,STT_ARMOR_M);

	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);

//	AI_Output(other,self,"DIA_Raven_BinDabei_15_00"); //Gomez says I'm in.
//	AI_Output(other,self,"DIA_Raven_BinDabei_15_00"); //Gomez sagt, ich bin dabei.
	AI_Output(other,self,"DIA_Raven_BinDabei_15_00"); //Gomez říká, že jsem v pořádku.
//	AI_Output(self,other,"DIA_Raven_BinDabei_10_01"); //Great! In that case, you can prove your worth with a first task.
//	AI_Output(self,other,"DIA_Raven_BinDabei_10_01"); //Gut! Du kannst dich gleich bei deinem ersten Auftrag bewähren.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_01"); //Výborně! V tom případě to můžeš dokázat svým prvním úkolem.
//	AI_Output(self,other,"DIA_Raven_BinDabei_10_02"); //It shouldn't be too difficult for you, provided your connections are as good as you say.
//	AI_Output(self,other,"DIA_Raven_BinDabei_10_02"); //Wenn deine Verbindungen wirklich so gut sind, wie du sagst, solltest du keine Probleme damit haben.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_02"); //Pokud jsou tvé kontakty tak dobré, jak říkáš, neměl bys s tím mít žádný problém.

	AI_EquipBestArmor(hero);
};

// *********************************************
// 				Sekten-Auftrag
// *********************************************
	var int Raven_SpySect;
// *********************************************

instance DIA_Raven_SpySect(C_INFO)
{
	npc = Ebr_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpySect_Condition;
	information = DIA_Raven_SpySect_Info;
	permanent = 0;
//	description = "What d'you want me to do?";
//	description = "Was soll ich für dich erledigen?";
	description = "Co mám pro tebe zařídit?";
};

func int DIA_Raven_SpySect_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

func void DIA_Raven_SpySect_Info()
{
//	AI_Output(other,self,"DIA_Raven_SpySect_15_00"); //What d'you want me to do?
//	AI_Output(other,self,"DIA_Raven_SpySect_15_00"); //Was soll ich für dich erledigen?
	AI_Output(other,self,"DIA_Raven_SpySect_15_00"); //Co mám pro tebe zařídit?
//	AI_Output(self,other,"DIA_Raven_SpySect_10_01"); //We do a lot of trade with the Brotherhood. That doesn't mean to say we trust 'em.
//	AI_Output(self,other,"DIA_Raven_SpySect_10_01"); //Wir stehen mit der Bruderschaft in Handelskontakt. Das bedeutet nicht, das wir ihnen unbedingt vertrauen.
	AI_Output(self,other,"DIA_Raven_SpySect_10_01"); //Hodně obchodujeme s lidmi z Bratrstva. To ale neznamená, že jim bezmezně věříme.
//	AI_Output(self,other,"DIA_Raven_SpySect_10_02"); //Go to the swamp.
//	AI_Output(self,other,"DIA_Raven_SpySect_10_02"); //Mach dich auf den Weg in den Sumpf.
	AI_Output(self,other,"DIA_Raven_SpySect_10_02"); //Jdi do močálů.
//	AI_Output(self,other,"DIA_Raven_SpySect_10_03"); //When you get to the Camp, keep your ears open. Anything you pick up might be useful for us.
//	AI_Output(self,other,"DIA_Raven_SpySect_10_03"); //Wenn du dort im Lager bist, halte die Ohren auf. Alles was du erfährst, kann für uns nützlich sein.
	AI_Output(self,other,"DIA_Raven_SpySect_10_03"); //Až dorazíš do tábora, měj uši nastražené. Vše, co se dozvíš, se nám může hodit.
//	AI_Output(self,other,"DIA_Raven_SpySect_10_04"); //The more you find out, the better. It'll take a bit of tact, if you know what I mean.
//	AI_Output(self,other,"DIA_Raven_SpySect_10_04"); //Und je mehr du erfährst, desto besser. Das Ganze erfordert ein gewisses Feingefühl. Du weißt, was ich meine?
	//#NEEDS_ATTENTION takt, alebo cit?
	AI_Output(self,other,"DIA_Raven_SpySect_10_04"); //Čím víc toho zjistíš, tím lépe. Celá akce vyžaduje určitý takt, jestli víš, co tím myslím.
//	AI_Output(other,self,"DIA_Raven_SpySect_15_05"); //Keep cool, I'm not going to get them angry.
//	AI_Output(other,self,"DIA_Raven_SpySect_15_05"); //Bleib ruhig, ich werde ihren Zorn nicht heraufbeschwören.
	AI_Output(other,self,"DIA_Raven_SpySect_15_05"); //Buď v klidu, nemám v úmyslu je naštvat.
//	AI_Output(self,other,"DIA_Raven_SpySect_10_06"); //I knew you'd understand.
//	AI_Output(self,other,"DIA_Raven_SpySect_10_06"); //Ich wusste, dass du mich verstehen würdest.
	AI_Output(self,other,"DIA_Raven_SpySect_10_06"); //Věděl jsem, že mi budeš rozumět.

	Raven_SpySect = LOG_RUNNING;

	Log_CreateTopic(CH1_GoToPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_GoToPsi,LOG_RUNNING);
//	B_LogEntry(CH1_GoToPsi,"Raven has sent me to the Brotherhood in the swamp on behalf of the Old Camp. I'm to have a look around there and keep my ears open. Maybe I'll get some useful information for the Ore Barons there.");
//	B_LogEntry(CH1_GoToPsi,"Raven hat mich im Auftrag des Alten Lagers zur Bruderschaft im Sumpf geschickt. Ich soll mich dort umsehen und -hören. Vielleicht gibt es ein paar nützliche Informationen für die Erzbarone");
	B_LogEntry(CH1_GoToPsi,"Raven mě vyslal jako zástupce Starého tábora k Bratrstvu do bažin. Musím se tam porozhlédnout a mít nastražené uši. Možná se mi tam podaří získat nějaké užitečné informace pro Rudobarony.");
};

// *********************************************
// 				Ausrüstung
// *********************************************

instance DIA_Raven_Equipment(C_INFO)
{
	npc = Ebr_105_Raven;
	nr = 1;
	condition = DIA_Raven_Equipment_Condition;
	information = DIA_Raven_Equipment_Info;
	permanent = 0;
//	description = "Where can I get better equipment?";
//	description = "Wo bekomme ich bessere Ausrüstung her?";
	description = "Kde tu dostanu lepší výbavu?";
};

func int DIA_Raven_Equipment_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_Equipment_Info()
{
//	AI_Output(other,self,"DIA_Raven_Equipment_15_00"); //Where can I get better equipment?
//	AI_Output(other,self,"DIA_Raven_Equipment_15_00"); //Wo bekomme ich bessere Ausrüstung her?
	AI_Output(other,self,"DIA_Raven_Equipment_15_00"); //Kde tu dostanu lepší výbavu?
//	AI_Output(self,other,"DIA_Raven_Equipment_10_01"); //Go and see Diego, he'll give you some armor. It'll stop you from getting killed and it'll serve as an ID at the same time.
//	AI_Output(self,other,"DIA_Raven_Equipment_10_01"); //Geh zu Diego, er wird dir 'ne Rüstung geben. Damit wirst du nicht so schnell umgebracht und sie dient auch gleichzeitig als Ausweis.
	AI_Output(self,other,"DIA_Raven_Equipment_10_01"); //Jdi za Diegem, dá ti nějakou zbroj. S ní tě jen tak něco nezabije a zároveň ti poslouží jako průkaz.
//	AI_Output(self,other,"DIA_Raven_Equipment_10_02"); //Your armor should give you access to all the places you need to go.
//	AI_Output(self,other,"DIA_Raven_Equipment_10_02"); //Mit deiner neuen Rüstung solltest du hier überall hinkommen, wo du hin musst.
	AI_Output(self,other,"DIA_Raven_Equipment_10_02"); //Tvoje zbroj ti umožní přístup do všech míst, kam se budeš potřebovat dostat.
//	AI_Output(self,other,"DIA_Raven_Equipment_10_03"); //If you need any weapons, go and talk to Skip. You'll find him in the big shed right at the back, left of the castle courtyard.
//	AI_Output(self,other,"DIA_Raven_Equipment_10_03"); //Und wenn du Waffen brauchst, geh zu Skip, er ist in der großen Scheune hinten links auf den Burgplatz.
	AI_Output(self,other,"DIA_Raven_Equipment_10_03"); //Jestli budeš potřebovat zbraně, zajdi za Skipem. Najdeš ho v té velké dílně vzadu, nalevo na hradním nádvoří.

	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
//	B_LogEntry(GE_TraderOC,"Diego has better ARMORS for Gomez' shadows. He's at the entry of the castle.");
//	B_LogEntry(GE_TraderOC,"Diego verteilt bessere RÜSTUNGEN für Gomez' Schatten. Er hängt vor dem Eingang zur Burg herum.");
	B_LogEntry(GE_TraderOC,"Diego nabízí lepší ZBROJE pro Gomezovy Stíny. Najdu ho před branou do hradu.");
	if !Npc_KnowsInfo(hero,DIA_Skip_First)
	{
//		B_LogEntry(GE_TraderOC,"The guard Skip in the rear courtyard sells WEAPONS. But only to Gomez' men.");
//		B_LogEntry(GE_TraderOC,"Der Gardist Skip auf dem hinteren Burginnenhof verkauft WAFFEN. Aber nur an Gomez' Leute.");
		B_LogEntry(GE_TraderOC,"Strážce Skip prodává v zadní části nádvoří ZBRANĚ. Avšak jen Gomezovým mužům.");
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////	Kapitel 2    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// *********************************************
// 				Spy Zwischenbericht
// *********************************************

instance DIA_Raven_SpyBericht(C_INFO)
{
	npc = Ebr_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpyBericht_Condition;
	information = DIA_Raven_SpyBericht_Info;
	permanent = 1;
//	description = "I just thought I'd report in.";
//	description = "Ich will einen Zwischenbericht abgeben.";
	description = "Chci ti podat hlášení.";
};

func int DIA_Raven_SpyBericht_Condition()
{
	if ( Raven_SpySect==LOG_RUNNING )
	{
		return 1;
	};
};

func void DIA_Raven_SpyBericht_Info()
{
//	AI_Output(other,self,"DIA_Raven_SpyBericht_15_00"); //I just thought I'd report in.
//	AI_Output(other,self,"DIA_Raven_SpyBericht_15_00"); //Ich will einen Zwischenbericht abgeben.
	AI_Output(other,self,"DIA_Raven_SpyBericht_15_00"); //Chci podat hlášení.
//	AI_Output(self,other,"DIA_Raven_SpyBericht_10_01"); //Good. I like being kept up to date.
//	AI_Output(self,other,"DIA_Raven_SpyBericht_10_01"); //Gut. Ich bin gerne gut informiert.
	AI_Output(self,other,"DIA_Raven_SpyBericht_10_01"); //Dobře. Rád dostávám ty nejnovější informace.
	if (Npc_HasItems(other,itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
//			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04"); //The great invocation has taken place.
//			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04"); //Die große Beschwörung hat stattgefunden.
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04"); //Došlo k velkému vzývání.
//			AI_Output(self,other,"DIA_Raven_SpyBericht_10_04"); //You have done well.
//			AI_Output(self,other,"DIA_Raven_SpyBericht_10_04"); //Du hast deine Sache gut gemacht.
			//#NEEDS_ATTENTION original bolo jednoduche Dobrá práce. Nie je toto trochu prebasnene?
			AI_Output(self,other,"DIA_Raven_SpyBericht_10_04"); //Dobře jsi splnil svůj úkol.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP(XP_ReportToRaven);
			Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
//			B_LogEntry(CH1_GoToPsi,"Raven has fobbed me off with some cheap words! That's not the kind of attitude I had expected! From now on I'll do my own thing.");
//			B_LogEntry(CH1_GoToPsi,"Raven hat mich mit billigen Worten abgespeist! Das ist nicht die Art der großzügigen Dankbarkeit, die ich erwartet habe! Von nun an gehe ich meinen eigenen Plänen nach.");
			B_LogEntry(CH1_GoToPsi,"Raven mě nakrmil lacinými řečičkami. Takovéhle způsoby jsem neočekával. Od teďka si půjdu svojí vlastní cestou.");
		}
		else
		{
//			AI_Output(other,self,"DIA_Raven_SpyBericht_15_02"); //They now want a minecrawler queen's eggs, so they can brew a potion that will enable them to contact the Sleeper. I have the eggs with me.
//			AI_Output(other,self,"DIA_Raven_SpyBericht_15_02"); //Sie wollen die Eier einer Minecrawler-Königin, um daraus ein Elixier herzustellen, durch das sie Kontakt zum Schläfer aufnehmen können. Ich habe die Eier bei mir.
			AI_Output(other,self,"DIA_Raven_SpyBericht_15_02"); //Chtějí vajíčka královny důlních červů. Vaří z nich lektvar, kterým jim umožní spojit se se Spáčem. Mám ta vajíčka sebou.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
//				AI_Output(self,other,"DIA_Raven_SpyBericht_10_03"); //Very interesting. I wonder if it will work. Bring the eggs to the temple.
//				AI_Output(self,other,"DIA_Raven_SpyBericht_10_03"); //Interessant. Bin gespannt, ob die Sache funktioniert. Bring die Eier in den Tempel.
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_03"); //Zajímavé. Jsem zvědavý, jestli to bude fungovat. Dones ta vajíčka do chrámu.
			}
			else
			{
//				AI_Output(self,other,"DIA_Raven_SpyBericht_10_04"); //You have done well.
//				AI_Output(self,other,"DIA_Raven_SpyBericht_10_04"); //Du hast deine Sache gut gemacht.
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_04"); //Dobrá práce.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP(XP_ReportToRaven);
				Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
//				B_LogEntry(CH1_GoToPsi,"Raven has fobbed me off with some cheap words! That's not the kind of attitude I had expected! From now on I'll do my own thing.");
//				B_LogEntry(CH1_GoToPsi,"Raven hat mich mit billigen Worten abgespeist! Das ist nicht die Art der großzügigen Dankbarkeit, die ich erwartet habe! Von nun an gehe ich meinen eigenen Plänen nach.");
				B_LogEntry(CH1_GoToPsi,"Raven mě nakrmil lacinými řečičkami. Takovéhle způsoby jsem neočekával. Od teďka si půjdu svojí vlastní cestou.");
			};
		};
	}
	else
	{
//		AI_Output(other,self,"DIA_Raven_SpyBericht_15_05"); //I don't really know what they're planning yet.
//		AI_Output(other,self,"DIA_Raven_SpyBericht_15_05"); //Ich weiß noch nicht GENAU was sie vorhaben.
		AI_Output(other,self,"DIA_Raven_SpyBericht_15_05"); //Vlastně ve skutečnosti PŘESNĚ nevím, co plánují.
//		AI_Output(self,other,"DIA_Raven_SpyBericht_10_06"); //Then why are you bothering me?
//		AI_Output(self,other,"DIA_Raven_SpyBericht_10_06"); //Was belästigst du mich dann?
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_06"); //Tak proč mě obtěžuješ?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////	Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

