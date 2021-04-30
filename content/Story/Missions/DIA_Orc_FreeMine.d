/*
-------------------------------- Die Mission ----------------------------

Die Freemine Mission. 
Der SC metzelt sich durch die FM und findet dort einen Orc, welcher schwer
verletzt ist und einen Orcischen Heiltrank braucht. 
Alls Gegenleistung für den Heiltrank sagt er dir was man alles für Items
für das Ulu-Mulu braucht.
Wenn man ihm die drei Teile bringt bastelt er dir das Ulumulu.

--------------------------------- Die Items -----------------------------
OrcHeiltrank: Orcmedicine -> OrcGegengift 

Teil vom Ulu-Mulu (1) ItAt_Waran_01 -> Flammenzunge
Teil vom Ulu-Mulu (2) ItAt_Shadow_02 -> Horn eines Shadowbeast
Teil vom Ulu-Mulu (3) ItAt_Swampshark_02 -> Zähne des Sumpfhais
Teil vom Ulu-Mulu (4)   ItAt_Troll_02 -> Hauer eines Trolls

Ulu-Mulu Ulumulu -> Das Ulumulu

----------------------------------- ToDo ---------------------------------
-> Monsterhinweise müssen noch rein
-> Missionlogs basteln
-> Sprache überarbeiten
*/

//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance Info_FreemineOrc_EXIT(C_INFO)
{
	npc = FreemineOrc;
	nr = 999;
	condition = Info_FreemineOrc_EXIT_Condition;
	information = Info_FreemineOrc_EXIT_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Info_FreemineOrc_EXIT_Condition()
{
	return 1;
};

func void Info_FreemineOrc_EXIT_Info()
{
	if (!Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu)) 
	{
//		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_01"); //I need to move on!
//		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_01"); //Ich muss weiter!
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_01"); //Musím jít dál!
//		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_02"); //Stranger come again!
//		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_02"); //Fremder kommen wieder!
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_02"); //Cizinec zase příjde!
	}                                                              
	else                                                           
	{
//		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03"); //Thank you. I'll be on my way now.
//		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03"); //Ich danke dir. Ich werde mich jetzt wieder auf den Weg machen.
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03"); //Děkuji. Půjdu si svou cestou.
//		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_04"); //Stranger have good journey!
//		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_04"); //Fremder haben gute Reise!
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_04"); //Cizinec mít dobrá cesta!
	};
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info INTRO
//---------------------------------------------------------------------
instance Info_FreemineOrc_INTRO(C_INFO)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_INTRO_Condition;
	information = Info_FreemineOrc_INTRO_Info;
	important = 1;
	permanent = 0;
};

func int Info_FreemineOrc_INTRO_Condition()
{
	return TRUE;
};

func void Info_FreemineOrc_INTRO_Info()
{
//	AI_Output(self,hero,"Info_FreemineOrc_INTRO_17_01"); //Tarrok need help! Tarrok hurt!
//	AI_Output(self,hero,"Info_FreemineOrc_INTRO_17_01"); //Tarrok brauchen Hilfe! Tarrok verletzt!
	AI_Output(self,hero,"Info_FreemineOrc_INTRO_17_01"); //Tarrok potřebovat pomoc! Tarrok být raněn.
};

//---------------------------------------------------------------------
//	Info WASPASSIERT
//---------------------------------------------------------------------
instance Info_FreemineOrc_WASPASSIERT(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_WASPASSIERT_Condition;
	information = Info_FreemineOrc_WASPASSIERT_Info;
	important = 0; 
	permanent = 0;
//	description = "What happened here?";
//	description = "Was ist geschehen?";
	description = "Co se tu stalo?";
};                       

func int Info_FreemineOrc_WASPASSIERT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{ 
		return TRUE;
	};
};

func void Info_FreemineOrc_WASPASSIERT_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_WASPASSIERT_15_01"); //What happened here?
//	AI_Output(hero,self,"Info_FreemineOrc_WASPASSIERT_15_01"); //Was ist geschehen?
	AI_Output(hero,self,"Info_FreemineOrc_WASPASSIERT_15_01"); //Co se tu stalo?
//	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_02"); //Tarrok here captured by blue soldiers. Suddenly red soldiers everywhere.
//	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_02"); //Tarrok hier gefangen von blauen Soldaten. Plötzlich überall rote Soldaten.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_02"); //Tarrok být tady zajat modrými vojáky. Rudí vojáci najednou všude.
//	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_03"); //Red soldiers kill everything.
//	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_03"); //Rote Soldaten töten alles.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_03"); //Rudí vojáci zabíjet každého.
//	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_04"); //Tarrok flee here. Red soldiers no go here. Red soldiers fear GACH LUG.
//	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_04"); //Tarrok hierhin geflohen. Rote Soldaten nicht gehen hierhin. Rote Soldaten fürchten GACH LUG.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_04"); //Tarrok utekl. Rudí vojáci sem nejít. Rudí vojáci se bát GACH LUGA.
//	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_05"); //Please help, Tarrok hurt.
//	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_05"); //Bitte helfen, Tarrok verletzt.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_05"); //Prosím pomoc, Tarrok být raněn.
};

//---------------------------------------------------------------------
//	Info WASTUN
//---------------------------------------------------------------------
instance Info_FreemineOrc_WASTUN(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_WASTUN_Condition;
	information = Info_FreemineOrc_WASTUN_Info;
	important = 0; 
	permanent = 0;
//	description = "What can I do for you?";
//	description = "Was kann ich für dich tun?";
	description = "Co pro tebe můžu udělat?";
};                       

func int Info_FreemineOrc_WASTUN_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{ 
		return TRUE;
	};
};

func void Info_FreemineOrc_WASTUN_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_01"); //What can I do for you?
//	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_01"); //Was kann ich für dich tun?
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_01"); //Co pro tebe můžu udělat?
//	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_02"); //Tarrok need strong medicine. Tarrok else die.
//	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_02"); //Tarrok brauchen starke Medizin. Tarrok sonst sterben.
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_02"); //Tarrok potřebovat silný lék. Tarrok jinak brzy zemřít.
//	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_03"); //What kind of medicine?
//	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_03"); //Was für Medizin?
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_03"); //Jaký lék?
//	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_04"); //GACH LUG poison Tarrok. Tarrok need medicine!
//	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_04"); //GACH LUG mich vergiftet. Tarrok brauchen Medizin!
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_04"); //GACH LUG otrávit Tarroka. Tarrok potřebovat lék.
//	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_05"); //Tarrok have medicine, but Tarrok lost. Tarrok no find!
//	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_05"); //Tarrok haben Medizin, aber Tarrok verlieren. Tarrok nicht finden!
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_05"); //Tarrok mít lék, ale Tarrok ztratit. Tarrok ho nenajít!
};

//---------------------------------------------------------------------
//	Info OFFER
//---------------------------------------------------------------------
instance Info_FreemineOrc_OFFER(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_OFFER_Condition;
	information = Info_FreemineOrc_OFFER_Info;
	important = 0; 
	permanent = 0;
//	description = "I'll get your medicine back!";
//	description = "Ich werde die Medizin wiederfinden!";
	description = "Přinesu ti ten lék zpátky!";
};                       

func int Info_FreemineOrc_OFFER_Condition()
{
	if Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN)
	&& !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION)
	&& !Npc_HasItems(hero,Orcmedicine) 
	{ 
		return TRUE;
	};
};

func void Info_FreemineOrc_OFFER_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01"); //I'll get your medicine back!
//	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01"); //Ich werde die Medizin wiederfinden!
	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01"); //Přinesu ti ten lék zpátky!
//	AI_Output(self,hero,"Info_FreemineOrc_OFFER_17_02"); //Tarrok very weak. Stranger hurry, else Tarrok die!
//	AI_Output(self,hero,"Info_FreemineOrc_OFFER_17_02"); //Tarrok sehr schwach. Fremder beeilen, sonst Tarrok sterben!
	AI_Output(self,hero,"Info_FreemineOrc_OFFER_17_02"); //Tarrok být velmi slabý. Cizinec pospíchat, jinak Tarrok zemřít!
	AI_StopProcessInfos(self);

	B_Story_FoundOrcSlave();
};

//---------------------------------------------------------------------
//	Info CRAWLER
//---------------------------------------------------------------------
instance Info_FreemineOrc_CRAWLER(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_CRAWLER_Condition;
	information = Info_FreemineOrc_CRAWLER_Info;
	important = 0; 
	permanent = 0;
//	description = "What does GACH LUG mean?";
//	description = "Was bedeutet GACH LUG?";
	description = "Co to znamená GACH LUG?";
};                       

func int Info_FreemineOrc_CRAWLER_Condition()
{
	if Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT)
	{ 
		return TRUE;
	};
};

func void Info_FreemineOrc_CRAWLER_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_01"); //What does GACH LUG mean?
//	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_01"); //Was bedeutet GACH LUG?
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_01"); //Co to znamená GACH LUG?
//	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_02"); //Be big animals, walk on many legs.
//	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_02"); //Seien große Tiere auf vielen Beinen.
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_02"); //Být velké zvíře, kráčet na mnoha nohách.
//	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_03"); //GACH LUG dangerous! Eat Orcs and humans!
//	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_03"); //GACH LUG gefährlich! Orks und Menschen fressen!
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_03"); //GACH LUG být nebezpečný! Jíst skřety a lidi!
//	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_04"); //You must mean the minecrawlers down here!
//	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_04"); //Du meinst wohl die Minecrawler hier unten!
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_04"); //Máš určitě na mysli důlní červy tady zezdola!
};

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance Info_FreemineOrc_TONGUE(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_TONGUE_Condition;
	information = Info_FreemineOrc_TONGUE_Info;
	important = 0; 
	permanent = 0;
//	description = "You speak our language?";
//	description = "Du sprichst unsere Sprache?";
	description = "Ty mluvíš naším jazykem?";
};                       

func int Info_FreemineOrc_TONGUE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{ 
		return TRUE;
	};
};

func void Info_FreemineOrc_TONGUE_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_TONGUE_15_01"); //You speak our language?
//	AI_Output(hero,self,"Info_FreemineOrc_TONGUE_15_01"); //Du sprichst unsere Sprache?
	AI_Output(hero,self,"Info_FreemineOrc_TONGUE_15_01"); //Ty mluvíš naším jazykem?
//	AI_Output(self,hero,"Info_FreemineOrc_TONGUE_17_02"); //Tarrok slave of humans long time. Tarrok listen good.
//	AI_Output(self,hero,"Info_FreemineOrc_TONGUE_17_02"); //Tarrok schon lange Sklave von Menschen. Tarrok gut zuhören!
	AI_Output(self,hero,"Info_FreemineOrc_TONGUE_17_02"); //Tarrok být dlouho otrokem u lidí. Tarrok dobře poslouchat.
};

//---------------------------------------------------------------------
//	Info SEARCHPOTION - Medizin noch nicht gefunden
//---------------------------------------------------------------------
instance Info_FreemineOrc_SEARCHPOTION(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_SEARCHPOTION_Condition;
	information = Info_FreemineOrc_SEARCHPOTION_Info;
	important = 0; 
	permanent = 1;
//	description = "I can't find the medicine!";
//	description = "Ich kann die Medizin nicht finden!";
	description = "Nemůžu ten lék najít!";
};                       

func int Info_FreemineOrc_SEARCHPOTION_Condition()
{
	if  Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER) 
	&& !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION)
	&& !Npc_HasItems(hero,Orcmedicine) 
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SearchPotion_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_SEARCHPOTION_15_01"); //I can't find the medicine!
//	AI_Output(hero,self,"Info_FreemineOrc_SEARCHPOTION_15_01"); //Ich kann die Medizin nicht finden!
	AI_Output(hero,self,"Info_FreemineOrc_SEARCHPOTION_15_01"); //Nemůžu ten lék najít!
//	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_02"); //Stranger seek more! Medicine be here!
//	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_02"); //Fremder suchen weiter! Medizin hier unten sein!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_02"); //Cizinec ještě hledat! Lék být tady.
//	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_03"); //Tarrok flee GACH LUG! Tarrok hide when flee!
//	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_03"); //Torrok fliehen vor GACH LUG! Tarrok sich bei Flucht verstecken!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_03"); //Tarrok utekl před GACH LUG! Tarrok se schovat na útěku.
//	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_04"); //Stranger search niches too!
//	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_04"); //Fremder auch suchen in Nischen!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_04"); //Cizinec také hledat ve výklenku.

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info SUCHEULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_SUCHEULUMULU(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_SUCHEULUMULU_Condition;
	information = Info_FreemineOrc_SUCHEULUMULU_Info;
	important = 0; 
	permanent = 0;
//	description = "Are you a friend of Ur-Shak, the shaman?";
//	description = "Bist du ein Freund von Ur-Shak, dem Schamanen?";
	description = "Jsi přítel Ur-Shaka, toho šamana?";
};                       

func int Info_FreemineOrc_SUCHEULUMULU_Condition()
{
	if Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO)
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SUCHEULUMULU_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_01"); //Are you a friend of Ur-Shak, the shaman?
//	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_01"); //Bist du ein Freund von Ur-Shak, dem Schamanen?
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_01"); //Jsi přítel Ur-Shaka, toho šamana?
//	AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_02"); //Ur-Shak be slave, like Tarrok. Ur-Shak run away! Be gone many winters ago!
//	AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_02"); //Ur-Shak waren Sklave wie Tarrok. Ur-Shak gelaufen weg! Seien viele Winter her!
	AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_02"); //Ur-Shak být otrok, jako Tarrok. Ur-Shak utéct! Být pryč už mnoho zim.
//	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_03"); //Your friend said you could make an Ulu-Mulu for me!
//	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_03"); //Dein Freund sagte, du könntest mir ein Ulu-Mulu machen!
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_03"); //Tvůj přítel říkal, že bys mi mohl vyrobit Ulu-Mulu!
	if (FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
//		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_04"); //You help me, so I help you!
//		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_04"); //Du mir geholfen, also ich dir helfen!
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_04"); //Ty pomoc mně, já pomoc tobě!
	}
	else
	{
//		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_05"); //Tarrok very weak. No medicine, Tarrok die.
//		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_05"); //Tarrok sehr schwach. Tarrok ohne Medizin sterben.
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_05"); //Tarrok být velmi slabý. Když nebýt lék, Tarrok zemřít.
//		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_06"); //Stranger bring medicine, then Tarrok help!
//		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_06"); //Fremder bringen Medizin, dann Tarrok helfen!
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_06"); //Cizinec přinést lék, pak Tarrok pomoc!
	};
};

//---------------------------------------------------------------------
//	Info GIVEPOTION
//---------------------------------------------------------------------
instance Info_FreemineOrc_GIVEPOTION(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_GIVEPOTION_Condition;
	information = Info_FreemineOrc_GIVEPOTION_Info;
	important = 0; 
	permanent = 0;
//	description = "Here, I've found your medicine!";
//	description = "Hier, ich habe deine Medizin gefunden!";
	description = "Tady, našel jsem tvůj lék!";
};                       

func int Info_FreemineOrc_GIVEPOTION_Condition()
{
	if Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN) 
	&& Npc_HasItems(hero,Orcmedicine)
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_GIVEPOTION_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_01"); //Here, I've found your medicine!
//	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_01"); //Hier, ich habe deine Medizin gefunden!
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_01"); //Tady, našel jsem tvůj lék!

	B_GiveInvItems(hero,self,Orcmedicine,1); 
	EquipItem(self,Orcmedicine);
	if (C_BodystateContains(self,BS_SIT))
	{
		AI_StandUp(self);
		AI_TurnToNpc(self,hero);
	};
	AI_UseItemToState (self,Orcmedicine,1);
	AI_UseItemToState (self,Orcmedicine, -1);

//	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_02"); //Stranger no bad like other people! Stranger good!
//	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_02"); //Fremder nicht böse wie andere Menschen! Fremder gut!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_02"); //Cizinec nebýt zlý jako ostatní lidé! Cizinec být dobrý!
//	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_03"); //Tarrok owe thanks!
//	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_03"); //Tarrok schulden Dank!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_03"); //Tarrok dlužit díky!
//	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_04"); //Can you give me an Ulu-Mulu now?
//	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_04"); //Kannst du mir jetzt ein Ulu-Mulu geben?
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_04"); //Můžeš mi teď dát ten Ulu-Mulu?
//	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_05"); //Stranger help Tarrok, so Tarrok help stranger too!
//	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_05"); //Fremder helfen Tarrok, also Tarrok auch helfen Fremder!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_05"); //Cizinec pomoc Tarrokovi, Tarrok pomoc cizincovi také.
//	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_06"); //Stranger need KROTAHK, KHAZ-TAK, DWACHKARR and ORTH-ANTAK.
//	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_06"); //Fremder brauchen KROTAHK, KHAZ-TAK, DWACHKARR und ORTH-ANTAK.
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_06"); //Cizinec potřebovat KROTAHK, KHAZ-TAK, DWACHKARR a ORTH-ANTAK.
//	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_07"); //Stranger bring, then Tarrok make Ulu-Mulu!
//	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_07"); //Fremder bringen, dann Tarrok machen Ulu-Mulu!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_07"); //Cizinec to přinést, Tarrok pak udělat Ulu-Mulu!

	if !Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER)
	{
		B_Story_FoundOrcSlave();
	};

	B_Story_CuredOrc();
};

//---------------------------------------------------------------------
//	Info FIREWARAN
//---------------------------------------------------------------------
instance Info_FreemineOrc_FIREWARAN(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_FIREWARAN_Condition;
	information = Info_FreemineOrc_FIREWARAN_Info;
	important = 0; 
	permanent = 0;
//	description = "What is a KROTAHK?";
//	description = "Was ist ein KROTAHK?";
	description = "Co je to KROTAHK?";
};                       

func int Info_FreemineOrc_FIREWARAN_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN_15_01"); //What is a KROTAHK?
//	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN_15_01"); //Was ist ein KROTAHK?
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN_15_01"); //Co je to KROTAHK?
//	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN_17_02"); //Be tongue of fire! Be tongue of fire lizard!
//	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN_17_02"); //Seien Flammenzunge! Seien Zunge von Feuerechse!
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN_17_02"); //Být ohnivý jazyk. Být jazyk ohnivé ještěrky!

};

//---------------------------------------------------------------------
//	Info FIREWARAN2
//---------------------------------------------------------------------
instance Info_FreemineOrc_FIREWARAN2(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_FIREWARAN2_Condition;
	information = Info_FreemineOrc_FIREWARAN2_Info;
	important = 0; 
	permanent = 0;
//	description = "Where can I find a fire lizard?";
//	description = "Wo finde ich eine Feuerechse?";
	description = "Kde najdu ohnivou ještěrku?";
};                       

func int Info_FreemineOrc_FIREWARAN2_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN)
	&& !Npc_HasItems(hero,ItAt_Waran_01)
	&& !Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN2_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN2_15_01"); //Where can I find a fire lizard?
//	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN2_15_01"); //Wo finde ich eine Feuerechse?
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN2_15_01"); //Kde najdu ohnivou ještěrku?
//	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_02"); //Fire lizard live home. Home of Tarrok. Stranger need search!
//	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_02"); //Feuerechsen in Heimat leben. Heimat von Tarrok. Fremder suchen müssen!
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_02"); //Ohnivá ještěrka žít doma. Doma u Tarroka. Cizinec muset hledat!
//	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_03"); //Also find fire lizard on sand near sea.
//	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_03"); //Auch können finden Feuerechse auf Sand bei Meer.
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_03"); //Také najít ohnivou ještěrku na písku u moře.

//	B_LogEntry(CH4_UluMulu,"Tarrok needs the tongue of a fire lizard for the Ulu-Mulu. They mainly live in the Orc area and on sandy beaches. Wasn't there a shipwreck full of lizards?");
//	B_LogEntry(CH4_UluMulu,"Tarrok benötigt für das Ulu-Mulu die Zunge eines Feuerwarans. Sie leben vor allem im Orkgebiet und an sandigen Stränden. Gab es da nicht dieses Schiffswrack, bei dem es vor Waranen nur so wimmelte?");
	B_LogEntry(CH4_UluMulu,"Tarrok potřebuje k výrobě ULU-MULU jazyk ohnivé ještěrky. Tyto ještěrky žijí hlavně v skřetích oblastech a na písčitém pobřeží. Nebyl tam lodní vrak plný ještěrek?");
};

//---------------------------------------------------------------------
//	Info SHADOWBEAST
//---------------------------------------------------------------------
instance Info_FreemineOrc_SHADOWBEAST(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_SHADOWBEAST_Condition;
	information = Info_FreemineOrc_SHADOWBEAST_Info;
	important = 0; 
	permanent = 0;
//	description = "What does KHAZ-TAK mean?";
//	description = "Was bedeutet KHAZ-TAK?";
	description = "Co je to KHAZ-TAK?";
};                       

func int Info_FreemineOrc_SHADOWBEAST_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01"); //What does KHAZ-TAK mean?
//	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01"); //Was bedeutet KHAZ-TAK?
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01"); //Co je to KHAZ-TAK?
//	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02"); //Be horn of shadowbeast. Horn sharp as knife and hard as stone.
//	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02"); //Seien Horn von Schattenläufer. Horn spitz wie Dolch und hart wie Stein.
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02"); //Být roh stínové obludy. Roh ostrý jako nůž a tvrdý jako kámen.
};

//---------------------------------------------------------------------
//	Info SHADOWBEAST2
//---------------------------------------------------------------------
instance Info_FreemineOrc_SHADOWBEAST2(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_SHADOWBEAST2_Condition;
	information = Info_FreemineOrc_SHADOWBEAST2_Info;
	important = 0; 
	permanent = 0;
//	description = "Where can I find shadowbeasts?";
//	description = "Wo findet man Schattenläufer?";
	description = "Kde najdu stínovou obludu?";
};                       

func int Info_FreemineOrc_SHADOWBEAST2_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST)
	&& !Npc_HasItems(hero,ItAt_Shadow_02)
	&& !Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST2_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01"); //Where can I find shadowbeasts?
//	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01"); //Wo findet man Schattenläufer?
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01"); //Kde najdu stínovou obludu?
//	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02"); //Live in forest or cave. No like light.
//	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02"); //Leben in Wald oder in Höhle. Nicht mögen Licht.
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02"); //Žít v lese nebo v jeskyni. Nemít ráda světlo.
//	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03"); //Be very dangerous. Stranger watch out!
//	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03"); //Seien sehr gefährlich. Fremder aufpassen!
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03"); //Být moc nebezpečná. Cizinec být opatrný!

//	B_LogEntry(CH4_UluMulu,"Tarrok needs the horn of a shadowbeast for the Ulu-Mulu. They mainly live in dark forests and caves. The biggest forest of the colony is between the Old Camp and the swamp camp as far as I know.");
//	B_LogEntry(CH4_UluMulu,"Tarrok benötigt für das Ulu-Mulu das Horns eines Schattenläufers. Sie leben vor allem in dunklen Wäldern und Höhlen. Soviel ich weiß, liegt der größte Wald in der Kolonie zwischen Altem Lager und Sumpflager.");
	B_LogEntry(CH4_UluMulu,"Tarrok potřebuje k výrobě ULU-MULU roh stínové šelmy. Tyto šelmy žijí hlavně v tmavých lesích a jeskyních. Pokud vím, tak největší les kolonie je mezi Starým táborem a Táborem v bažinách.");
};

//---------------------------------------------------------------------
//	Info SWAMPSHARK
//---------------------------------------------------------------------
instance Info_FreemineOrc_SWAMPSHARK(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_SWAMPSHARK_Condition;
	information = Info_FreemineOrc_SWAMPSHARK_Info;
	important = 0; 
	permanent = 0;
//	description = "DWACHKARR? What is that?";
//	description = "DWACHKARR? Was ist das denn?";
	description = "DWACHKARR? Co to je?";
};                       

func int Info_FreemineOrc_SWAMPSHARK_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK_15_01"); //DWACHKARR? What is that?
//	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK_15_01"); //DWACHKARR? Was ist das denn?
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK_15_01"); //DWACHKARR? Co to je?
//	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK_17_02"); //Be teeth of swampshark. If teeth bite, victim never escape.
//	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK_17_02"); //Seien Zähne von Sumpfhai. Wenn Zähne beißen Opfer, dann nie wieder loslassen.
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK_17_02"); //Být zub močálového žraloka. Když zub zakousnout, oběť už nikdy ne utéct.
};

//---------------------------------------------------------------------
//	Info SWAMPSHARK2
//---------------------------------------------------------------------
instance Info_FreemineOrc_SWAMPSHARK2(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_SWAMPSHARK2_Condition;
	information = Info_FreemineOrc_SWAMPSHARK2_Info;
	important = 0; 
	permanent = 0;
//	description = "Where can I find swampsharks?";
//	description = "Wo finde ich Sumpfhaie?";
	description = "Kde najdu močálového žraloka?";
};                       

func int Info_FreemineOrc_SWAMPSHARK2_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK)
	&& !Npc_HasItems(hero,ItAt_Swampshark_02)
	&& !Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK2_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK2_15_01"); //Where can I find swampsharks?
//	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK2_15_01"); //Wo finde ich Sumpfhaie?
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK2_15_01"); //Kde najdu močálového žraloka?
//	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK2_17_02"); //Many swampsharks in camp of humans. Camp in swamp, of course!
//	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK2_17_02"); //Viele Sumpfhaie bei Lager von Menschen. Lager in Sumpf natürlich!
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK2_17_02"); //Mnoho močálových žraloků být v táboře lidí. V táboře v bažinách, tak!

//	B_LogEntry(CH4_UluMulu,"Tarrok needs the teeth of a swampshark for the Ulu-Mulu. There are loads of the beasts behind the camp of the Brotherhood."); 
//	B_LogEntry(CH4_UluMulu,"Tarrok benötigt für das Ulu-Mulu Zähne eines Sumpfhais. Im Sumpf hinter dem Lager der Bruderschaft gibt es massenhaft Ungetüme dieser Art."); 
	B_LogEntry(CH4_UluMulu,"Tarrok potřebuje k výrobě ULU-MULU zuby močálového žraloka. Spousty těchto bestií žije v močále za táborem Bratrstva."); 
};

//---------------------------------------------------------------------
//	Info TROLL
//---------------------------------------------------------------------
instance Info_FreemineOrc_TROLL(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_TROLL_Condition;
	information = Info_FreemineOrc_TROLL_Info;
	important = 0; 
	permanent = 0;
//	description = "What is an ORTH-ANTAK?";
//	description = "Was ist ein ORTH-ANTAK?";
	description = "Co je to ORTH-ANTAK?";
};                       

func int Info_FreemineOrc_TROLL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_TROLL_15_01"); //What is an ORTH-ANTAK?
//	AI_Output(hero,self,"Info_FreemineOrc_TROLL_15_01"); //Was ist ein ORTH-ANTAK?
	AI_Output(hero,self,"Info_FreemineOrc_TROLL_15_01"); //Co je to ORTH-ANTAK?
//	AI_Output(self,hero,"Info_FreemineOrc_TROLL_17_02"); //Be tooth of big troll! Make big hole in prey!
//	AI_Output(self,hero,"Info_FreemineOrc_TROLL_17_02"); //Hauer von großes Troll! Machen großes Löcher in Beute!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL_17_02"); //Být zub od velký trol! Udělat velkou díru do kořisti!
};

//---------------------------------------------------------------------
//	Info TROLL2
//---------------------------------------------------------------------
instance Info_FreemineOrc_TROLL2(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_TROLL2_Condition;
	information = Info_FreemineOrc_TROLL2_Info;
	important = 0; 
	permanent = 0;
//	description = "Where can I find trolls?";
//	description = "Wo finde ich einen Troll?";
	description = "Kde najdu trola?";
};                       

func int Info_FreemineOrc_TROLL2_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL)
	&& !Npc_HasItems(hero,ItAt_Troll_02)
	&& !Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL2_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_TROLL2_15_01"); //Where can I find trolls?
//	AI_Output(hero,self,"Info_FreemineOrc_TROLL2_15_01"); //Wo finde ich einen Troll?
	AI_Output(hero,self,"Info_FreemineOrc_TROLL2_15_01"); //Kde najdu nějakého trola?
//	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_02"); //Troll live in mountain! Troll love much space!
//	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_02"); //Troll leben in Bergen! Troll lieben viel Platz!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_02"); //Trol žít v horách. Trol milovat hodně prostoru!
//	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_03"); //Stranger go seek in north mountain! But beware of troll fist!
//	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_03"); //Fremder gehen suchen in Nordberge! Aber passen auf auf Faust von Troll!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_03"); //Cizinec muset jít hledat v severních horách! Ale dávat pozor na pěst trola!
//	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_04"); //If fist strike, then stranger fall off mountain!
//	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_04"); //Faust treffen, dann Fremder fallen von Berg runter!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_04"); //Když pěst udeřit, cizinec spadnout z hory!

//	B_LogEntry(CH4_UluMulu,"Tarrok needs the tusks of a troll for the Ulu-Mulu. These monsters live in the northern mountains of the colony. I should search the ravines there.");
//	B_LogEntry(CH4_UluMulu,"Tarrok benötigt für das Ulu-Mulu die Hauer eines Trolls. Solche Monstren leben in den nördlichen Bergen der Kolonie. Ich sollte die Schluchten dort absuchen.");
	B_LogEntry(CH4_UluMulu,"Tarrok potřebuje k výrobě ULU-MULU trolí tesáky. Tyto bestie žijí v horách na severu Kolonie. Měl bych prohledat tamější rokliny.");
};

//---------------------------------------------------------------------
//	Info LOOKINGULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_LOOKINGULUMULU(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_LOOKINGULUMULU_Condition;
	information = Info_FreemineOrc_LOOKINGULUMULU_Info;
	important = 0; 
	permanent = 1;
//	description = "I don't have all four items yet.";
//	description = "Ich habe noch nicht alle vier Teile beisammen.";
	description = "Ještě nemám všechny čtyři části!";
};                       

func int Info_FreemineOrc_LOOKINGULUMULU_Condition()
{
	//#Needs_Attention - toto je nespravna podmienka - dialog je dostupny, len ak nema hrac jazyk ohnivej jasterky a ma vsetko ostatne
	if (!Npc_HasItems(hero,ItAt_Waran_01)
	&& Npc_HasItems(hero,ItAt_Shadow_02)
	&& Npc_HasItems(hero,ItAt_Swampshark_02)
	&& Npc_HasItems(hero,ItAt_Troll_02)
	&& Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN2)
	&& Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST2)
	&& Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK2)
	&& Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL2))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_LOOKINGULUMULU_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_LOOKINGULUMULU_15_01"); //I don't have all four items yet.
//	AI_Output(hero,self,"Info_FreemineOrc_LOOKINGULUMULU_15_01"); //Ich habe noch nicht alle vier Teile beisammen.
	AI_Output(hero,self,"Info_FreemineOrc_LOOKINGULUMULU_15_01"); //Ještě nemám všechny čtyři části!
//	AI_Output(self,hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02"); //Stranger seek on. Tarrok wait here!
//	AI_Output(self,hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02"); //Fremder suchen weiter. Tarrok hier warten!
	AI_Output(self,hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02"); //Cizinec pokračovat hledat. Tarrok počkat tady!

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info EVERYULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_EVERYULUMULU(C_INFO)
{
	npc = Freemineorc;
	condition = Info_FreemineOrc_EVERYULUMULU_Condition;
	information = Info_FreemineOrc_EVERYULUMULU_Info;
	important = 0; 
	permanent = 0;
//	description = "I have all four items for the Ulu-Mulu!";
//	description = "Ich habe alle Teile für das Ulu-Mulu zusammen!";
	description = "Už mám všechny čtyři části pro Ulu-Mulu!";
};                       

func int Info_FreemineOrc_EVERYULUMULU_Condition()
{
	if ((FreemineOrc_LookingUlumulu == LOG_RUNNING)
	&& Npc_HasItems(hero,ItAt_Waran_01)
	&& Npc_HasItems(hero,ItAt_Shadow_02)
	&& Npc_HasItems(hero,ItAt_Swampshark_02)
	&& Npc_HasItems(hero,ItAt_Troll_02))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_EVERYULUMULU_Info()
{
//	AI_Output(hero,self,"Info_FreemineOrc_EVERYULUMULU_15_01"); //I have all four items for the Ulu-Mulu!
//	AI_Output(hero,self,"Info_FreemineOrc_EVERYULUMULU_15_01"); //Ich habe alle Teile für das Ulu-Mulu zusammen!
	AI_Output(hero,self,"Info_FreemineOrc_EVERYULUMULU_15_01"); //Už mám všechny čtyři složky pro Ulu-Mulu!
//	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_02"); //Stranger strong warrior be! Give items! Tarrok make ULU-MULU!
//	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_02"); //Fremder seien starker Krieger! Geben Teile! Tarrok machen ULU-MULU!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_02"); //Cizinec být silný bojovník! Dát mi části! Tarrok udělat Ulu-Mulu!
//	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_03"); //Here! Stranger wear ULU-MULU and proud! Tarrok sleep now!
//	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_03"); //Hier! Fremder tragen ULU-MULU mit Stolz! Tarrok jetzt schlafen!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_03"); //Tady! Cizinec nosit ULU-MULU s hrdost! Tarrok teď spát!

	//#Needs_Attention - no fuj, tieto presuny itemov musime prepisat :)
	CreateInvItems(hero,ItAt_Waran_01, 3);
	B_GiveInvItems(hero,self,ItAt_Waran_01, 4); //Notwendig für Ausschrift "4 Gegenstände übergegen", wird sofort ausgeglichen
	Npc_RemoveInvItem(hero,ItAt_Shadow_02);
	Npc_RemoveInvItem(hero,ItAt_Swampshark_02);
	Npc_RemoveInvItem(hero,ItAt_Troll_02);

	Npc_RemoveInvItems(self,ItAt_Waran_01, 4);    

	B_Story_GotUluMulu();

	AI_StopProcessInfos(self);
};

