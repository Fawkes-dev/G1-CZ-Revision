// **************************************************
//						 EXIT 
// **************************************************

instance Org_819_Drax_Exit(C_INFO)
{
	npc = Org_819_Drax;
	nr = 999;
	condition = Org_819_Drax_Exit_Condition;
	information = Org_819_Drax_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Org_819_Drax_Exit_Condition()
{
	return 1;
};

func void Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance Org_819_Drax_HuntHere(C_INFO)
{
	npc = Org_819_Drax;
	nr = 1;
	condition = Org_819_Drax_HuntHere_Condition;
	information = Org_819_Drax_HuntHere_Info;
	permanent = 0;
//	description = "You're hunting, aren't you?";
//	description = "Ihr jagt hier - richtig?";
	description = "Ty tady lovíš, že jo?";
};                       

func int Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

func void Org_819_Drax_HuntHere_Info()
{
//	AI_Output(other,self,"Org_819_Drax_HuntHere_15_00"); //You're hunting, aren't you?
//	AI_Output(other,self,"Org_819_Drax_HuntHere_15_00"); //Ihr jagt hier - richtig?
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_00"); //Ty tady lovíš, že jo?
//	AI_Output(self,other,"Org_819_Drax_HuntHere_06_01"); //Looks like it... what do you want?
//	AI_Output(self,other,"Org_819_Drax_HuntHere_06_01"); //Sieht so aus... was willst du?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_01"); //Vypadá to tak... co chceš?
//	AI_Output(other,self,"Org_819_Drax_HuntHere_15_02"); //Do you have some hints for the hunt?
//	AI_Output(other,self,"Org_819_Drax_HuntHere_15_02"); //Hast du ein paar Tipps für die Jagd?
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_02"); //Můžeš mi dát nějaké rady pro lov?
//	AI_Output(self,other,"Org_819_Drax_HuntHere_06_03"); //I could teach you a few things - but everything has its price.
//	AI_Output(self,other,"Org_819_Drax_HuntHere_06_03"); //Ich könnte dir schon was beibringen - aber alles hat seinen Preis.
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_03"); //Můžu tě naučit pár věcí - ale všechno má svoji cenu.
//	AI_Output(other,self,"Org_819_Drax_HuntHere_15_04"); //Which would be how much?
//	AI_Output(other,self,"Org_819_Drax_HuntHere_15_04"); //Und der wäre?
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_04"); //Kolik by to stálo?
//	AI_Output(self,other,"Org_819_Drax_HuntHere_06_05"); //A good gulp of beer will do to start with - then we'll see.
//	AI_Output(self,other,"Org_819_Drax_HuntHere_06_05"); //Für den Anfang reicht ein ordentlicher Schluck Bier - danach sehen wir weiter.
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_05"); //Pořádný doušek piva by pro začátek mohl stačit - pak se uvidí.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance Org_819_Drax_Scavenger(C_INFO)
{
	npc = Org_819_Drax;
	nr = 1;
	condition = Org_819_Drax_Scavenger_Condition;
	information = Org_819_Drax_Scavenger_Info;
	permanent = 1;
//	description = "Here you are, take a beer and tell me about hunting.";
//	description = "Hier, nimm ein Bier und erzähl mir was über's Jagen.";
	description = "Tady je, vezmi si pivo a vyprávěj mi o lovu.";
};                       

func int Org_819_Drax_Scavenger_Condition()
{
	if (Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE))
	{
		return 1;
	};
};

func void Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems(other,self,itfobeer,1);

//		AI_Output(other,self,"Org_819_Drax_Scavenger_15_00"); //Here you are, take a beer and tell me about hunting.
//		AI_Output(other,self,"Org_819_Drax_Scavenger_15_00"); //Hier, nimm ein Bier und erzähl mir was übers Jagen.
		AI_Output(other,self,"Org_819_Drax_Scavenger_15_00"); //Tady je, vezmi si pivo a vyprávěj mi o lovu.
		if (C_BodystateContains(self,BS_SIT))
		{
			AI_StandUp(self);
			AI_TurnToNpc(self,hero);
		};
		AI_UseItem(self,ItFobeer);
//		AI_Output(self,other,"Org_819_Drax_Scavenger_06_01"); //Scavengers, that's what we call the big birds, should be attacked one after the other. It's easy to lure single scavengers from the pack.
//		AI_Output(self,other,"Org_819_Drax_Scavenger_06_01"); //Scavenger, so nennen wir die großen Vögel, greift man am besten einzeln an. Du kannst einzelne Scavenger leicht aus dem Rudel locken.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_01"); //Mrchožrouty, tak říkáme těm velkým ptákům, je nejlepší lovit jednoho po druhém. Vylákat jednoho mrchožrouta z hejna je snadné.
//		AI_Output(self,other,"Org_819_Drax_Scavenger_06_02"); //If you come too close, they'll become irritated. After a while they'll storm in your direction. At this point, you should be waiting for them with a raised weapon.
//		AI_Output(self,other,"Org_819_Drax_Scavenger_06_02"); //Wenn du ihnen zu nahe kommst, reagieren sie gereizt. Nach einer Weile stürmen sie dann auf dich los. Du solltest zu diesem Zeitpunkt schon mit erhobener Waffe warten.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_02"); //Když přijdeš moc blízko, jsou podráždění. Za chvilku vyrazí tvým směrem. V tom okamžiku bys na ně měl čekat s připravenou zbraní.
//		AI_Output(self,other,"Org_819_Drax_Scavenger_06_03"); //If you manage to strike the beast before it hits you, you have to keep fighting, then you'll be able to defeat the creature without being hurt yourself.
//		AI_Output(self,other,"Org_819_Drax_Scavenger_06_03"); //Wenn du gut bist, und ihn triffst, bevor er dich trifft, heißt es dranbleiben, dann kannst du das Vieh besiegen, ohne einen Kratzer abzubekommen.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_03"); //Když se ti tu potvoru podaří srazit, ještě než na tebe zaútočí, musíš být pořád ve střehu, abys ji pak mohl dorazit, a sám se přitom nezranil.
//		AI_Output(self,other,"Org_819_Drax_Scavenger_06_04"); //If it hits YOU first - well - just don't let them.
//		AI_Output(self,other,"Org_819_Drax_Scavenger_06_04"); //Wenn es DICH zuerst trifft - nun ja - pass einfach auf, dass es dich nicht zuerst trifft.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_04"); //Pokud udeříš první TY - výborně - ale nenech to udělat je.
		drax_bierbekommen = TRUE;
	}
	else
	{
//		AI_Output(other,self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //I don't have any beer.
//		AI_Output(other,self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Ich hab' kein Bier.
		AI_Output(other,self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Nemám žádné pivo.
//		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //Then go and fetch some. That'll be the best free hint you'll get in a long time. And as you're going anyway, bring some ore with you as well!
//		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //Dann geh und hol eins, so billig kommst du nie wieder an einen guten Rat. Und wenn du schon mal dabei bist - bring gleich noch etwas Erz mit!
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //Tak běž a nějaké sežeň. Takhle lacino už nikdy k žádné dobré radě nepřijdeš. A až přijdeš příště, přines také nějakou rudu!
//		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //I can give you some information about animals, but it'll cost you!
//		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Ich kann dir einiges über Tiere beibringen, aber das kostet dich was!
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Můžu ti dát pár informací o zvěři, ale bude tě to něco stát!
	}; 
	drax_Lehrer_frei = TRUE;

	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
//	B_LogEntry(GE_TeacherOW,"The rogue Drax offered to teach me about the gutting of animals if I can pay his prices. He hunts on the way from the trading square to the Old Camp.");
//	B_LogEntry(GE_TeacherOW,"Der Bandit Drax bot an, mir viel über das Ausnehmen von Tieren hier beizubringen, wenn ich seine Preise bezahlen kann. Er jagt am Weg vom Austauschplatz zum Alten Lager.");
	B_LogEntry(GE_TeacherOW,"Bandita Drax mi nabídl, že mě naučí kuchat zvěř, když mu zaplatím, oč požádá. Většinou loví na cestě z tržiště do Starého tábora.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance Org_819_Drax_Creatures(C_INFO)
{
	npc = Org_819_Drax;
	nr = 1;
	condition = Org_819_Drax_Creatures_Condition;
	information = Org_819_Drax_Creatures_Info;
	permanent = 1;
//	description = "What else can you tell me about hunting?";
//	description = "Was kannst du mir noch über die Jagd beibringen?";
	description = "Co mi ještě můžeš říci o lovu?";
};                       

func int Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ((Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE))
	{
		return 1;
	};
};

func void Org_819_Drax_Creatures_Info()
{
//	AI_Output(other,self,"Org_819_Drax_Creatures_15_00"); //What else can you tell me about hunting?
//	AI_Output(other,self,"Org_819_Drax_Creatures_15_00"); //Was kannst du mir noch über die Jagd beibringen?
	AI_Output(other,self,"Org_819_Drax_Creatures_15_00"); //Co mi ještě můžeš říci o lovu?

	if ((Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE))
	{
//		AI_Output(self,other,"Org_819_Drax_Creatures_06_01"); //A lot - but it'll cost you more than a beer.
//		AI_Output(self,other,"Org_819_Drax_Creatures_06_01"); //Ne ganze Menge - aber das wird dich mehr kosten als nur ein Bier.
		AI_Output(self,other,"Org_819_Drax_Creatures_06_01"); //Spoustu - ale bude tě to stát mnohem víc než pivo.
//		AI_Output(self,other,"Org_819_Drax_Creatures_06_02"); //If you know how, you can take the creatures' teeth, claws and skin. It's hard to get them but they are valuable.
//		AI_Output(self,other,"Org_819_Drax_Creatures_06_02"); //Wenn du weißt wie, kannst du den Viechern Zähne, Haut oder Krallen abziehen. An die Sachen ist schwer ranzukommen, also sind sie wertvoll.
		AI_Output(self,other,"Org_819_Drax_Creatures_06_02"); //Když víš jak, můžeš si z těch příšer vzít zuby, drápy a kůži. Je těžké je získat, ale mají velkou cenu.
//		AI_Output(self,other,"Org_819_Drax_Creatures_06_03"); //At least every merchant will trade those things with you.
//		AI_Output(self,other,"Org_819_Drax_Creatures_06_03"); //Zumindest wird jeder Händler diese Dinge mit dir tauschen.
		AI_Output(self,other,"Org_819_Drax_Creatures_06_03"); //Každý obchodník ty věci s tebou vymění.

		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice(Org_819_Drax_Creatures, DIALOG_BACK ,Org_819_Drax_Creatures_BACK);
//		Info_AddChoice(Org_819_Drax_Creatures,"You're demanding a lot for your advice.",Org_819_Drax_Creatures_PrettyMuch);
//		Info_AddChoice(Org_819_Drax_Creatures,"Du verlangst verdammt viel für dein Wissen.",Org_819_Drax_Creatures_PrettyMuch);
		Info_AddChoice(Org_819_Drax_Creatures,"Požaduješ toho za své rady moc.",Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
//			Info_AddChoice(Org_819_Drax_Creatures,"Remove teeth (cost: 1 skill point, 50 ore)",Org_819_Drax_Creatures_Zahn);
//			Info_AddChoice(Org_819_Drax_Creatures,"Zähne entfernen (Kosten: 1 Lernpunkt, 50 Erz)",Org_819_Drax_Creatures_Zahn);
			Info_AddChoice(Org_819_Drax_Creatures,"Vyjmout zuby (cena: 1 dovednostní bod, 50 nugetů)",Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
//			Info_AddChoice(Org_819_Drax_Creatures,"Remove fur (cost: 1 skill point, 100 ore)",Org_819_Drax_Creatures_Fell);
//			Info_AddChoice(Org_819_Drax_Creatures,"Fell abziehen (Kosten: 1 Lernpunkt, 100 Erz)",Org_819_Drax_Creatures_Fell);
			Info_AddChoice(Org_819_Drax_Creatures,"Stáhnout kožešinu (cena: 1 dovednostní bod, 100 nugetů)",Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
//			Info_AddChoice(Org_819_Drax_Creatures,"Remove claws (cost: 1 skill point, 50 ore)",Org_819_Drax_Creatures_Kralle);
//			Info_AddChoice(Org_819_Drax_Creatures,"Krallen abzuziehen (Kosten: 1 Lernpunkt, 50 Erz)",Org_819_Drax_Creatures_Kralle);
			Info_AddChoice(Org_819_Drax_Creatures,"Vyjmout drápy (cena: 1 dovednostní bod, 50 nugetů)",Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
//			Info_AddChoice(Org_819_Drax_Creatures,"Skin reptiles (cost: 1 skill point, 100 ore)",Org_819_Drax_Creatures_Haut);
//			Info_AddChoice(Org_819_Drax_Creatures,"Häuten von Reptilien (Kosten: 1 Lernpunkt, 100 Erz)",Org_819_Drax_Creatures_Haut);
			Info_AddChoice(Org_819_Drax_Creatures,"Stáhnout plaza (cena: 1 dovednostní bod, 100 nugetů)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
//		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //I've told you everything I know.
//		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Ich habe dir alles beigebracht, was ich weiß.
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Řekl jsem ti všechno, co vím.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
//	AI_Output(other,self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //You're demanding a lot for your advice.
//	AI_Output(other,self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Du verlangst verdammt viel für dein Wissen.
	AI_Output(other,self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Požaduješ toho za své rady moc.
//	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Possibly, but you can earn a lot of ore with this knowledge.
//	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Mag sein, aber du kannst 'ne Menge Erz damit verdienen.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Možná, ale ty na nich můžeš vydělat daleko víc.
//	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //All the animals you kill without knowing how to cut them up will just rot away.
//	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Alle Tiere, die du tötest, ohne zu wissen, wie man sie vernünftig ausschlachtet, werden einfach verwesen.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Všechna ta zvěř, kterou zabiješ, ti shnije, když nebudeš vědět, jak ji rozřezat.
//	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //That's a wasted opportunity of skinning them and selling the fur at a high price.
//	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //Das ist eine verschwendete Gelegenheit, ihnen das Fell abzuziehen und teuer zu verkaufen.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //Tím ztratíš možnost stáhnout ji z kůže a za vysokou cenu prodat kožešinu.
//	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //If I were you, I'd try to gain this knowledge as soon as possible.
//	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Wenn ich du wäre, würde ich mir dieses Wissen so schnell wie möglich aneignen.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Já být tebou, pokusil bych si doplnit vědomosti, jak nejvíce to půjde.
};

func void Org_819_Drax_Creatures_Zahn()
{
//	AI_Output(other,self,"Org_819_Drax_Creatures_Zahn_15_00"); //How do I get the teeth?
//	AI_Output(other,self,"Org_819_Drax_Creatures_Zahn_15_00"); //Wie komme ich an die Zähne?
	AI_Output(other,self,"Org_819_Drax_Creatures_Zahn_15_00"); //Jak dostanu zuby?

	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			B_GiveInvItems(other,self,itminugget,50);

//			PrintScreen("Learn: Extracting teeth", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Lerne: Zähne nehmen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Naučit se: vytahovat zuby", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

//			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_01"); //The most important thing is to make sure the teeth don't splinter. To avoid that, put your knife near the center of the tooth and lever it out carefully.
//			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_01"); //Du mußt vor allem darauf achten, dass die Zähne nicht splittern. Um das zu verhindern, mußt du dein Messer in der Mitte des Zahns ansetzen und vorsichtig hebeln.
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_01"); //Nejdůležitější je zajistit, aby se zuby netříštily. Tomu se vyhneš tak, že vložíš nůž blízko středu zubu a opatrně ho vypáčíš.
//			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_02"); //You can take the teeth of wolves, shadowbeasts and snappers.
//			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_02"); //Zähne kannst du von Wölfen, Schattenläufern oder Snappern nehmen.
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_02"); //Tak si můžeš vzít zuby vlků, stínových příšer a kousavců.

			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
//			B_LogEntry(GE_AnimalTrophies,"Knowledge on the removal of teeth - wolf, Orc dog, snapper, biter, blood hound, shadowbeast.");
//			B_LogEntry(GE_AnimalTrophies,"Wissen über Zähne entfernen - Wolf, Orchund, Snapper, Beisser, Bluthund, Schattenläufer.");
			B_LogEntry(GE_AnimalTrophies,"Znalost vytahování zubů - vlk, skřetí pes, chňapavec, kousavec, lovecký pes, stínová šelma");
		}
		else
		{
//			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //You have to gain more experience otherwise my knowledge won't be of any use to you.
//			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Musíš ještě získat zkušenosti, jinak ti mé rady nebudou k ničemu.
//			PrintScreen("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
//		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //I want to see some ore first. Like I said: Everything has its price!
//		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
//	AI_Output(other,self,"Org_819_Drax_Creatures_Fell_15_00"); //How can I skin these creatures?
//	AI_Output(other,self,"Org_819_Drax_Creatures_Fell_15_00"); //Wie kann ich den Viechern das Fell abziehen?
	AI_Output(other,self,"Org_819_Drax_Creatures_Fell_15_00"); //Jak dostanu kůži těch příšer?

	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			B_GiveInvItems(other,self,itminugget,100);

//			PrintScreen("Learn: Taking off the fur", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Lerne: Fell abziehen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Naučit se: stahovat kožešinu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

//			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_01"); //It's very important to skin them from the back to the front. Once you get the hang of it, it'll be easy. Furs are very valuable!
//			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_01"); //Wichtig ist vor allem: Immer von vorne nach hinten. Wenn du den Bogen einmal raushast, ist es kein Problem. Felle sind sehr wertvoll!
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_01"); //Důležité je kůži stahovat zezadu dopředu. Jakmile se ti napne, už je to snadné. Kožešiny se velmi cení!
//			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_02"); //The furs of wolves and shadowbeasts can be used to make clothes. When you examine the fur of a killed animal, you'll soon notice if it can be used or not. 
//			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_02"); //Das Fell von Wölfen oder Schattenläufern eignet sich zum Herstellen von Kleidung. Du wirst merken, ob ein erlegtes Tier ein brauchbares Fell hat, wenn du es untersuchst.
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_02"); //Kůže vlků a stínových příšer se můžou použít na oděv. Když prohlídneš kožešinu zabitého zvířete, hned poznáš, jestli ji půjde použít, nebo ne.

			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
//			B_LogEntry(GE_AnimalTrophies,"Knowledge on the removal of fur - wolf, Orc dog, shadowbeast, troll");
//			B_LogEntry(GE_AnimalTrophies,"Wissen über Fell abziehen - Wolf, Orkhund, Schattenläufer, Troll");
			B_LogEntry(GE_AnimalTrophies,"Znalost stahování kožešiny - vlk, skřetí pes, chňapavec, kousavec, lovecký pes, stínová šelma, trol");
		}
		else
		{
//			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //You need more experience, otherwise my knowledge won't be of any use to you.
//			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Potřebuješ víc zkušeností, jinak ti mé vědomosti nebudou k ničemu.
//			PrintScreen("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
//		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //I want to see some ore first. Like I said: Everything has its price!
//		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			B_GiveInvItems(other,self,itminugget,50);

//			PrintScreen("Learn: Taking off the claws", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Lerne: Krallen abziehen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Naučit se: vytahovat drápy", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

//			AI_Output(other,self,"Org_819_Drax_Creatures_Kralle_15_00"); //Show me how to take off the claws!
//			AI_Output(other,self,"Org_819_Drax_Creatures_Kralle_15_00"); //Bring mir bei, Krallen abzuziehen!
			AI_Output(other,self,"Org_819_Drax_Creatures_Kralle_15_00"); //Ukaž mi, jak dostanu drápy!
//			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_01"); //Actually it's quite simple if you know what to do. Bend the claws forward - never backwards - and you MUSTN'T pull them out either!
//			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_01"); //Ist im Grunde ganz einfach, wenn du weißt, wie's geht. Du mußt die Krallen nach vorne wegknicken, auf keinen Fall nach hinten und NICHT ziehen!
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_01"); //Je to v podstatě velmi jednoduché, pokud víš jak na to. Ohneš drápy dopředu - nikdy ne dozadu - ale NESMÍŠ je vytahovat!
//			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_02"); //Claws can be taken especially from lizards. From now on, you'll know which creature's claws to take.
//			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_02"); //Krallen kannst du vor allem von Echsen nehmen. Du wirst ab jetzt erkennen, von welchem erlegten Biest du die Krallen nehmen kannst.
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_02"); //Drápy můžeš dostat hlavně z ještěrek. Teď už víš, z kterých příšer drápy brát.

			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
//			B_LogEntry(GE_AnimalTrophies,"Knowledge on the removal of claws - lizard, snapper, lurker, biter, razor");
//			B_LogEntry(GE_AnimalTrophies,"Wissen über Krallen abziehen - Warane, Snapper, Lurker, Beisser, Razor");
			B_LogEntry(GE_AnimalTrophies,"Znalost vytahování drápů - ještěrka, chňapavec, číhavec, kousavec, břitvoun");
		}
		else
		{
//			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //You need more experience, otherwise my knowledge won't be of any use to you.
//			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Potřebuješ víc zkušeností, jinak ti mé vědomosti nebudou k ničemu.
//			PrintScreen("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
//		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //I want to see some ore first. Like I said: Everything has its price!
//		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			B_GiveInvItems(other,self,itminugget,100);

//			PrintScreen("Learn: Skin lizards", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Lerne: Echsen häuten", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Naučit se: stahovat plazí kůži", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

//			AI_Output(other,self,"Org_819_Drax_Creatures_Haut_15_00"); //What do I have to observe while skinning reptiles?
//			AI_Output(other,self,"Org_819_Drax_Creatures_Haut_15_00"); //Worauf muss ich beim Häuten von Reptilien achten?
			AI_Output(other,self,"Org_819_Drax_Creatures_Haut_15_00"); //Na co musím dávat pozor, když stahuji plazí kůži?
//			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_01"); //The only reptiles suited for this purpose are lurkers and swampsharks.
//			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_01"); //Die einzigen Reptilien, die dafür geeignet sind, sind der Lurker und der Sumpfhai.
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_01"); //Jediní plazi, kteří jsou k tomuhle účelu vhodní, jsou číhavci a močáloví žraloci.
//			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_02"); //If you slit the skin at the sides, it'll peel off by itself. From now on you should be able to skin reptiles.
//			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_02"); //Wenn du die Haut an den Seiten anschneidest, löst sie sich wie von selbst. Du solltest ab jetzt kein Problem mehr haben, Echsen zu häuten.
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_02"); //Když nařízneš kůži po stranách, sloupne se sama. Teď už bys měl umět stahovat plazy.

			Knows_GetHide = TRUE;

			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
//			B_LogEntry(GE_AnimalTrophies,"Knowledge on skinning - lurker, swampshark");
//			B_LogEntry(GE_AnimalTrophies,"Wissen über Häuten - Lurker, Sumpfhai");
			B_LogEntry(GE_AnimalTrophies,"Znalost stahování plazů - číhavec, močálový žralok");
		}
		else
		{
//			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //You need more experience, otherwise my knowledge won't be of any use to you.
//			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Potřebuješ víc zkušeností, jinak ti mé vědomosti nebudou k ničemu.
//			PrintScreen("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//			PrintScreen("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			PrintScreen("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
//		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //I want to see some ore first. Like I said: Everything has its price!
//		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Erst will ich mein Erz sehen - wie gesagt: Alles hat seinen Preis!
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};
