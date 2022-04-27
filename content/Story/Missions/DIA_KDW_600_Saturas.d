// ************************ EXIT **************************

instance Info_Saturas_EXIT(C_INFO)
{
	npc = KDW_600_Saturas;
	nr = 999;
	condition = Info_Saturas_EXIT_Condition;
	information = Info_Saturas_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Saturas_EXIT_Condition()
{
	return 1;
};

func void Info_Saturas_EXIT_Info()
{
//	AI_Output(self,other,"Info_Saturas_EXIT_14_01"); //May you return in one piece!
//	AI_Output(self,other,"Info_Saturas_EXIT_14_01"); //Mögest du in einem Stück zurückkehren!
	AI_Output(self,other,"Info_Saturas_EXIT_14_01"); //Kéž by ses vrátil celý!

	AI_StopProcessInfos(self);
};

// ************************ Intruder **************************

instance Info_Saturas_Intruder(C_INFO)
{
	npc = KDW_600_Saturas;
	nr = 1;
	condition = Info_Saturas_Intruder_Condition;
	information = Info_Saturas_Intruder_Info;
	important = 1;
	permanent = 1;
};

func int Info_Saturas_Intruder_Condition()
{
	if ((Npc_IsInState(self,ZS_Talk)) && (Kapitel < 3))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_Intruder_Info()
{
//	AI_Output(self,other,"Info_Saturas_Intruder_14_00"); //What are you doing here? You've no business here! Scram!
//	AI_Output(self,other,"Info_Saturas_Intruder_14_00"); //Was machst du hier? Du hast hier nichts zu suchen! Verschwinde!
	AI_Output(self,other,"Info_Saturas_Intruder_14_00"); //Co tady děláš? Tady nemáš co pohledávat! Zmiz!

	AI_StopProcessInfos(self);
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
//***************************************************************************
instance Info_Saturas_NEWS(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_NEWS_Condition;
	information = Info_Saturas_NEWS_Info;
	IMPORTANT = 0;
	permanent = 0;
//	description = "I have important news from the Brotherhood's camp!";
//	description = "Ich habe wichtige Neuigkeiten aus dem Lager der Bruderschaft!";
	description = "Mám důležité zprávy z tábora Bratrstva!";
};

func int Info_Saturas_NEWS_Condition()
{
	if ((CorAngar_SendToNC == TRUE)
	&& (Npc_KnowsInfo(hero,Info_Cronos_SLEEPER)))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_NEWS_Info()
{
//	AI_Output(other,self,"Info_Saturas_NEWS_15_01"); //I have important news from the Brotherhood's camp!
//	AI_Output(other,self,"Info_Saturas_NEWS_15_01"); //Ich habe wichtige Neuigkeiten aus dem Lager der Bruderschaft!
	AI_Output(other,self,"Info_Saturas_NEWS_15_01"); //Mám důležité zprávy z tábora Bratrstva!
//	AI_Output(self,other,"Info_Saturas_NEWS_14_02"); //If Cronos gave you permission to visit me, it must be important news indeed!
//	AI_Output(self,other,"Info_Saturas_NEWS_14_02"); //Wenn dir Cronos die Erlaubnis gab, mich aufzusuchen, müssen es in der Tat wichtige Nachrichten sein!
	AI_Output(self,other,"Info_Saturas_NEWS_14_02"); //Musí být opravdu důležitá zpráva, jestliže ti Cronos povolil mě navštívit!
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Saturas_YBERION(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_YBERION_Condition;
	information = Info_Saturas_YBERION_Info;
	IMPORTANT = 0;
	permanent = 0;
//	description = "Y'Berion is dead!";
//	description = "Y'Berion ist tot";
	description = "Y´Berion je mrtev!";
};

func int Info_Saturas_YBERION_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_NEWS))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_YBERION_Info()
{
//	AI_Output(other,self,"Info_Saturas_YBERION_15_01"); //Y'Berion is dead! He died during the ritual invocation of the Sleeper.
//	AI_Output(other,self,"Info_Saturas_YBERION_15_01"); //Y'Berion ist tot! Er starb bei einer großen rituellen Anrufung des Schläfers.
	AI_Output(other,self,"Info_Saturas_YBERION_15_01"); //Y´Berion je mrtev! Zemřel během rituálního vzývání Spáče.
//	AI_Output(self,other,"Info_Saturas_YBERION_14_02"); //Y'Berion dead? That's bad news, very bad news indeed!
//	AI_Output(self,other,"Info_Saturas_YBERION_14_02"); //Y'Berion tot? Das sind schlechte Nachrichten, sehr schlechte Nachrichten!
	AI_Output(self,other,"Info_Saturas_YBERION_14_02"); //Y´Berion je mrtev´? To je špatná zpráva, vskutku špatná!
//	AI_Output(self,other,"Info_Saturas_YBERION_14_03"); //Who's leading the Brotherhood now? That power-hungry and deceitful Cor Kalom?
//	AI_Output(self,other,"Info_Saturas_YBERION_14_03"); //Wer hat die Führung der Bruderschaft übernommen? Dieser machtgierige, verschlagene Cor Kalom?
	AI_Output(self,other,"Info_Saturas_YBERION_14_03"); //Kdo teď vede Bratrstvo? Ten mocichtivý a zabedněný Cor Kalom?
//	AI_Output(other,self,"Info_Saturas_YBERION_15_04"); //No! Kalom has turned his back on the Brotherhood. He's taken some templars with him. Nobody knows where they've gone.
//	AI_Output(other,self,"Info_Saturas_YBERION_15_04"); //Nein! Kalom hat der Bruderschaft den Rücken gekehrt. Er hat einige Templer mitgenommen. Niemand weiß, wohin sie aufgebrochen sind.
	AI_Output(other,self,"Info_Saturas_YBERION_15_04"); //Ne! Kalom se od Bratrstva odvrátil. Vzal sebou pár templářů. Nikdo neví, kam odešli.
//	AI_Output(self,other,"Info_Saturas_YBERION_14_05"); //Why is that? He was in second place after Y'Berion!
//	AI_Output(self,other,"Info_Saturas_YBERION_14_05"); //Warum das? Er war doch der zweite Mann nach Y'Berion!
	AI_Output(self,other,"Info_Saturas_YBERION_14_05"); //Proč to všechno? Byl na druhém místě za Y´Berionem!
//	AI_Output(other,self,"Info_Saturas_YBERION_15_06"); //Certain events have convinced the Gurus that their way is the wrong one. Their god seems to be an evil arch demon.
//	AI_Output(other,self,"Info_Saturas_YBERION_15_06"); //Gewisse Ereignisse haben die Gurus davon überzeugt, dass der Weg ihres Gottes der falsche ist. Er scheint ein Erzdämon zu sein, der nur Böses im Schilde führt.
	AI_Output(other,self,"Info_Saturas_YBERION_15_06"); //Jisté události přesvědčily Guru, že jsou na špatné cestě. Z jejich boha se vyklubal zlý arcidémon.
//	AI_Output(other,self,"Info_Saturas_YBERION_15_07"); //One of the Gurus nearly killed me under the influence of the Sleeper, although I had saved his life just briefly beforehand.
//	AI_Output(other,self,"Info_Saturas_YBERION_15_07"); //Einer der Gurus hat mich unter dem Einfluss des Schläfers fast umgebracht, obwohl ich eben diesem Mann kurz zuvor das Leben gerettet hatte.
	AI_Output(other,self,"Info_Saturas_YBERION_15_07"); //Jeden z Guru mě pod vlivem Spáče málem zabil, přestože jsem mu krátce předtím zachránil život.
//	AI_Output(other,self,"Info_Saturas_YBERION_15_08"); //Cor Kalom was the only Guru who didn't want to admit the true nature of the hellish creature, that's why he's left the camp in the swamp.
//	AI_Output(other,self,"Info_Saturas_YBERION_15_08"); //Cor Kalom war der einzige Guru, der die wahre Natur der Höllenkreatur nicht sehen wollte und hat daher das Lager im Sumpf verlassen.
	AI_Output(other,self,"Info_Saturas_YBERION_15_08"); //Cor Kalom je jediný Guru, který nechce uznat pravou podstatu té pekelné stvůry, a proto opustil tábor v bažinách.
//	AI_Output(self,other,"Info_Saturas_YBERION_14_09"); //I see! Well, at least we are lucky in this regard. Cor Angar is a good man. He's tough, but honest.
//	AI_Output(self,other,"Info_Saturas_YBERION_14_09"); //Ich verstehe! Nun, das ist Glück im Unglück, denn Cor Angar ist ein guter Mann. Hart, aber ehrlich.
	AI_Output(self,other,"Info_Saturas_YBERION_14_09"); //Aha! Dobře, aspoň v tomto směru máme štěstí. Cor Angar je dobrý muž. Je drsný, ale přesto poctivý.
//	AI_Output(self,other,"Info_Saturas_YBERION_14_10"); //If anybody could prevent the Brotherhood from falling apart after this spiritual catastrophe, he can.
//	AI_Output(self,other,"Info_Saturas_YBERION_14_10"); //Wenn jemand den Zerfall der Bruderschaft nach dieser spirituellen Katastrophe verhindern kann, ist er es.
	AI_Output(self,other,"Info_Saturas_YBERION_14_10"); //Jestliže někdo může Bratrstvo ochránit od úpadku po té duchovní katastrofě, pak je to právě on.

//	B_LogEntry(CH3_EscapePlanNC,"I've told Saturas about the incidents in the swamp camp. He was happy that Cor Angar had taken over the leadership of the Brotherhood.");
//	B_LogEntry(CH3_EscapePlanNC,"Ich habe Saturas von den Ereignissen im Sumpflager berichtet. Er zeigte sich froh, dass Cor Angar die Führung der Bruderschaft übernommen hat.");
	B_LogEntry(CH3_EscapePlanNC,"Řekl jsem Saturasovi o incidentech v táboře v bažinách. Byl rád, že Cor Angar převzal v Bratrstvu velení.");
};

//***************************************************************************
//	Info BOOK
//***************************************************************************
instance Info_Saturas_BOOK(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_BOOK_Condition;
	information = Info_Saturas_BOOK_Info;
	IMPORTANT = 0;
	permanent = 0;
//	description = "I have this almanac...";
//	description = "Ich habe diesen Almanach hier";
	description = "Mám tento almanach...";
};

func int Info_Saturas_BOOK_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Saturas_YBERION))
	&& (Npc_HasItems(hero,ItWrFokusbuch)))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_BOOK_Info()
{
//	AI_Output(other,self,"Info_Saturas_BOOK_15_01"); //I have this almanac...
//	AI_Output(other,self,"Info_Saturas_BOOK_15_01"); //Ich habe diesen Almanach hier ...
	AI_Output(other,self,"Info_Saturas_BOOK_15_01"); //Mám tento almanach...
//	AI_Output(other,self,"Info_Saturas_BOOK_15_02"); //Y'Berion used it to charge the focus.
//	AI_Output(other,self,"Info_Saturas_BOOK_15_02"); //Y'Berion hatte ihn benutzt, um den Fokus aufzuladen.
	AI_Output(other,self,"Info_Saturas_BOOK_15_02"); //Y´Berion ho používal k práci s tím ohniskem.
//	AI_Output(self,other,"Info_Saturas_BOOK_14_03"); //Very good. We need the knowledge contained in this book to charge the five original focus stones.
//	AI_Output(self,other,"Info_Saturas_BOOK_14_03"); //Sehr gut. Wir benötigen das Wissen aus diesem Buch, um alle fünf der ursprünglichen Fokussteine aufzuladen.
	AI_Output(self,other,"Info_Saturas_BOOK_14_03"); //Velmi dobře. Potřebujeme vědomosti uložené v té knize, abysme uměli zacházet s pěti původními ohniskovými kameny.
//	AI_Output(self,other,"Info_Saturas_BOOK_14_04"); //I'll take the almanac!
//	AI_Output(self,other,"Info_Saturas_BOOK_14_04"); //Ich werde den Almanach an mich nehmen!
	AI_Output(self,other,"Info_Saturas_BOOK_14_04"); //Vezmu si ten almanach!

	B_GiveInvItems(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem(self,ItWrFokusbuch);
	B_GiveXP(XP_DeliverBookToSaturas);
};

//***************************************************************************
//	Info FOCUS
//***************************************************************************
instance Info_Saturas_FOCUS(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_FOCUS_Condition;
	information = Info_Saturas_FOCUS_Info;
	important = 0;
	permanent = 0;
//	description = "I have this focus...";
//	description = "Ich habe diesen Fokus hier";
	description = "Mám toto ohnisko...";
};

func int Info_Saturas_FOCUS_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Saturas_YBERION))
	&& (Npc_HasItems(hero,Focus_1)))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_FOCUS_Info()
{
//	AI_Output(other,self,"Info_Saturas_FOCUS_15_01"); //I have this focus...
//	AI_Output(other,self,"Info_Saturas_FOCUS_15_01"); //Ich habe diesen Fokus hier ...
	AI_Output(other,self,"Info_Saturas_FOCUS_15_01"); //Mám toto ohnisko...
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_02"); //You're holding the key that can unlock all our bonds.
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_02"); //Du hältst einen der Schlüssel für die Zerstörung unser aller Fesseln in Händen.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_02"); //Držíš klíč, který uvolní všechna pouta.
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_03"); //It is one of the five focus stones which were used to create the Magic Barrier.
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_03"); //Es handelt sich um einen der fünf Fokussteine, mit deren Hilfe die magische Barriere erschaffen wurde.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_03"); //To je jeden z těch kamenů, které byly použity k vytvoření magické Bariéry.
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_04"); //And with the help of the very same focusing power of these stones, we will tear down the great wall of energy.
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_04"); //Und mit der fokussierenden Kraft genau dieser Steine werden wir die Mauern aus Energie auch wieder niederreißen.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_04"); //A pomocí ohniskové síly těchto kamenů strhneme tu obrovskou energetickou stěnu.
//	AI_Output(other,self,"Info_Saturas_FOCUS_15_05"); //But won't that use up an awful lot of power?
//	AI_Output(other,self,"Info_Saturas_FOCUS_15_05"); //Aber kostet das nicht unglaublich viel magische Energie?
	AI_Output(other,self,"Info_Saturas_FOCUS_15_05"); //Nespotřebuje to ale obrovské množství síly?
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_06"); //True, but in all these years we have untiringly collected ore instead of trading it for luxuries with our jailers.
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_06"); //Richtig, doch wir haben über all die Jahre unermüdlich Erz gesammelt, anstatt es mit unseren Kerkermeistern gegen Annehmlichkeiten zu tauschen.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_06"); //To jistě, ale po celé ty roky jsme neúnavně shromažďovali rudu, namísto toho, abychom ji vyměňovali za luxusní zboží s našimi vězniteli.
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_07"); //As you must know, each ore nugget contains a certain amount of magic power. With the aid of the energy thus amassed in the ore mound, we'll be able to destroy the Magic Barrier.
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_07"); //Wie du sicher schon weißt, enthält jeder Erzbrocken etwas magische Energie. Mit Hilfe dieser Energie, die in unserem großen Erzhaufen schlummert, können wir die magische Barriere in Fetzen sprengen.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_07"); //Jak jistě víš, každý nuget obsahuje určité množství magické síly. S pomocí energie, která je nahromaděná v rudné haldě, budeme schopni zničit magickou Bariéru.
//	AI_Output(other,self,"Info_Saturas_FOCUS_15_08"); //Sounds dangerous.
//	AI_Output(other,self,"Info_Saturas_FOCUS_15_08"); //Das hört sich gefährlich an.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_08"); //Vypadá to nebezpečně.
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_09"); //The explosion will be merely of a magical nature, it will only destroy everything that's been modified by the magic inside the Barrier. There is no danger to us human beings.
//	AI_Output(self,other,"Info_Saturas_FOCUS_14_09"); //Die Explosion wird rein magischer Natur sein und wird ausschließlich alles magisch Veränderte innerhalb der Barriere zerstören. Für uns Menschen besteht keine Gefahr.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_09"); //Exploze bude spíše magické povahy a zničí pouze to, co bylo pomocí kouzel upraveno uvnitř Bariéry. Lidským bytostem nehrozí žádné nebezpečí.
//	AI_Output(other,self,"Info_Saturas_FOCUS_15_10"); //Here, take the focus. I hope it really will be of some use to your plans with the ore mound!
//	AI_Output(other,self,"Info_Saturas_FOCUS_15_10"); //Hier, nimm den Fokus. Hoffentlich hilft er dem Plan mit dem Erzhaufen auch wirklich!
	AI_Output(other,self,"Info_Saturas_FOCUS_15_10"); //Tady je to ohnisko. Doufejme, že vám doopravdy pomůže ve vašich plánech s rudnou hromadou.

	B_GiveInvItems(hero,self,Focus_1,1);
	Npc_RemoveInvItem(self,Focus_1);
	B_GiveXP(XP_DeliverFocusToSaturas);
};

//***************************************************************************
//	Info WHATNOW
//***************************************************************************
instance Info_Saturas_WHATNOW(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_WHATNOW_Condition;
	information = Info_Saturas_WHATNOW_Info;
	important = 0;
	permanent = 0;
//	description = "What are you going to do with the focus and the almanac now?";
//	description = "Was machst du jetzt mit Fokus und Almanach?";
	description = "Co teď budeš dělat s tím ohniskem a almanachem?";
};

func int Info_Saturas_WHATNOW_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Saturas_FOCUS))
	&& (Npc_KnowsInfo(hero,Info_Saturas_BOOK)))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_WHATNOW_Info()
{
//	AI_Output(other,self,"Info_Saturas_WHATNOW_15_01"); //What are you going to do with the focus and the almanac now?
//	AI_Output(other,self,"Info_Saturas_WHATNOW_15_01"); //Was machst du jetzt mit Fokus und Almanach?
	AI_Output(other,self,"Info_Saturas_WHATNOW_15_01"); //Co teď budeš dělat s tím ohniskem a almanachem?
//	AI_Output(self,other,"Info_Saturas_WHATNOW_14_03"); //Nothing. We need the four remaining focus stones first!
//	AI_Output(self,other,"Info_Saturas_WHATNOW_14_03"); //Nichts. Wir benötigen vorher die vier restlichen Fokussteine!
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_03"); //Nic. Nejprve potřebujeme zbývající čtyři ohniskové kameny!
//	AI_Output(self,other,"Info_Saturas_WHATNOW_14_04"); //Unfortunately we don't have any of these four magic stones.
//	AI_Output(self,other,"Info_Saturas_WHATNOW_14_04"); //Dummerweise befindet sich kein einziger dieser vier magischen Steine in unserem Besitz.
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_04"); //Bohužel ale nemáme ani jeden z těch čtyř magických kamenů.
};

//***************************************************************************
//	Info OFFER
//***************************************************************************
instance Info_Saturas_OFFER(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_OFFER_Condition;
	information = Info_Saturas_OFFER_Info;
	important = 0;
	permanent = 0;
//	description = "I'm willing to find the four remaining focus stones for you!";
//	description = "Ich bin bereit diese vier Foki für euch zu suchen!";
	description = "Jsem ochoten pro vás ty zbývající čtyři ohniskové kameny najít!";
};

func int Info_Saturas_OFFER_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_WHATNOW))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_OFFER_Info()
{
//	AI_Output(other,self,"Info_Saturas_OFFER_15_01"); //I'm willing to find the four remaining focus stones for you!
//	AI_Output(other,self,"Info_Saturas_OFFER_15_01"); //Ich bin bereit diese vier Foki für euch zu suchen!
	AI_Output(other,self,"Info_Saturas_OFFER_15_01"); //Jsem ochoten pro vás ty zbývající čtyři ohniskové kameny najít!
//	AI_Output(other,self,"Info_Saturas_OFFER_15_02"); //After all, I'm quite keen on getting out of here sometime myself.
//	AI_Output(other,self,"Info_Saturas_OFFER_15_02"); //Schließlich will ich auch hier irgendwann wieder raus.
	AI_Output(other,self,"Info_Saturas_OFFER_15_02"); //Především mám sám docela zájem se odtud dostat.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_03"); //I must warn you. Searching for them will prove as difficult as it will be dangerous.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_03"); //Ich muss dich warnen. Die Suche wird gleichermaßen schwierig und gefährlich.
	AI_Output(self,other,"Info_Saturas_OFFER_14_03"); //Musím tě varovat. Jejich hledání bude stejně obtížné, jako nebezpečné.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_04"); //Since conflict with the Old Camp is getting worse every day, I cannot give you any mercenary either.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_04"); //Da die Spannungen mit dem Alten Lager immer stärker werden, kann ich hier auch keinen der Söldner entbehren.
	AI_Output(self,other,"Info_Saturas_OFFER_14_04"); //Protože se konflikt se Starým táborem den ze dne horší, nemůžu ti sebou dát žádné žoldáky.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_05"); //You'll be totally on your own.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_05"); //Du wärest ganz auf dich alleine gestellt.
	AI_Output(self,other,"Info_Saturas_OFFER_14_05"); //Budeš si muset vystačit úplně sám.
//	AI_Output(other,self,"Info_Saturas_OFFER_15_06"); //Well... That's nothing unusual for me! I'll find a way to organize these things.
//	AI_Output(other,self,"Info_Saturas_OFFER_15_06"); //Na ja ... Das ist nun wirklich nichts Neues! Ich werde diese Dinger schon irgendwo auftreiben.
	AI_Output(other,self,"Info_Saturas_OFFER_15_06"); //Dobrá... To pro mě není nic nezvyklého! Najdu způsob, jak ty věci zařídit.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_07"); //Your confidence does you credit, but you'll need some items to assist you.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_07"); //Deine Zuversicht ehrt dich, aber du wirst einige Gegenstände benötigen.
	AI_Output(self,other,"Info_Saturas_OFFER_14_07"); //Tvá víra je ti ke cti, budeš ale potřebovat pár věcí, které ti pomůžou!
//	AI_Output(self,other,"Info_Saturas_OFFER_14_08"); //Take this map here. It's old, but on it you'll see the original locations of the focus stones when the Barrier was created.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_08"); //Nimm diese Karte hier. Sie ist alt, aber auf ihr sind die ursprünglichen Standorte der Fokussteine während der Erschaffung der Barriere verzeichnet.
	AI_Output(self,other,"Info_Saturas_OFFER_14_08"); //Vezmi si tuhle mapu. Je stará, ale jsou na ní vyznačeny všechny původní pozice ohniskových kamenů z doby, kdy se vytvářela Bariéra.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_09"); //Also, this spell scroll will enable you to travel back to our camp faster.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_09"); //Darüber hinaus sollte diese Spruchrolle dir eine schnellere Reise zurück in unser Lager ermöglichen.
	AI_Output(self,other,"Info_Saturas_OFFER_14_09"); //Tyhle kouzelné svitky ti umožní rychlejší návrat do tábora.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_10"); //Finally, you need to speak to Riordian. He brews the potions for the Camp.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_10"); //Zu guter Letzt sprich mit Riordian. Er braut die Tränke für das Lager.
	AI_Output(self,other,"Info_Saturas_OFFER_14_10"); //A konečně si budeš také muset promluvit s Riordianem. Vaří pro tábor lektvary.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_11"); //You'll find him in his hut, here, on the upper level.
//	AI_Output(self,other,"Info_Saturas_OFFER_14_11"); //Du findest ihn in seiner Hütte hier auf der obersten Ebene.
	AI_Output(self,other,"Info_Saturas_OFFER_14_11"); //Najdeš ho v jeho chatrči, tady v horní vrstvě.

	B_Story_BringFoci();
};

//***************************************************************************
//	B_DeliverFocus
//***************************************************************************
func void B_DeliverFocus()
{
	//-------- 2. Fokus abliefern --------
	if (Saturas_BringFoci == 1)
	{
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_01"); //Hm, that's a start. You're doing well.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_01"); //Hm, das ist ein Anfang. Du schlägst dich gut.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_01"); //Hm, tak to je začátek. Děláš to dobře.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_02"); //There are still three focus stones missing to accomplish our plan.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_02"); //Es fehlen noch drei Fokussteine, um unseren großen Plan durchzuführen.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_02"); //K uskutečnění našeho plánu ještě chybí tři ohniskové kameny.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_03"); //Now go and look out for the remaining focus stones.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_03"); //Gehe nun und suche die restlichen Fokussteine.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_03"); //Teď jdi a porozhlédni se po zbývajících ohniskových kamenech.
		Saturas_BringFoci = 2;
		B_GiveXP(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if (Saturas_BringFoci == 2)
	{
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_04"); //Good, that's the second focus stone you've brought us.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_04"); //Gut, das ist schon der zweite Fokusstein, den du uns bringst.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_04"); //Výborně, to je druhý ohniskový kámen, který jsi nám donesl.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_05"); //We're getting closer and closer to our target.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_05"); //Wir kommen unserem großen Ziel immer näher.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_05"); //Blížíme se krok po kroku k našemu cíli.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_06"); //Be brave and fetch the two remaining focus stones.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_06"); //Schlag dich tapfer und suche nun die restlichen zwei Fokussteine.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_06"); //Seber odvahu a přines ty dva zbývající ohniskové kameny.
		Saturas_BringFoci = 3;
		B_GiveXP(XP_DeliverThirdFocus);
	}

	//-------- 4. Fokus abliefern --------
	else if (Saturas_BringFoci == 3)
	{
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_07"); //Unbelievable, now we have four focus stones altogether.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_07"); //Unglaublich, nun haben wir schon insgesamt vier Fokussteine.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_07"); //Neuvěřitelné, už mám pohromadě čtyři ohniskové kameny.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_08"); //There's only one more missing, then we'll have them all.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_08"); //Nur noch ein Einziger fehlt uns, dann haben wir alle ursprünglichen Steine in unserem Besitz.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_08"); //Už nám chybí jen jediný, pak je budeme mít všechny.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_09"); //You have already done our community a great service. Get the last focus stone, and we'll soon be able to free ourselves.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_09"); //Du hast unserer Gemeinschaft schon jetzt sehr viel Ehre erwiesen. Finde den letzten Fokusstein und unsere Befreiung steht kurz bevor.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_09"); //Udělal jsi pro naší komunitu opět obrovskou službu. Najdi nám poslední ohniskový kámen a brzy budeme všichni volní.
		Saturas_BringFoci = 4;
		B_GiveXP(XP_DeliverFourthFocus);
	}

	//-------- 5. Fokus abliefern --------
	else if (Saturas_BringFoci == 4)
	{
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_10"); //Brilliant, now we have all five focus stones.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_10"); //Fantastisch, nun haben wir alle fünf Fokussteine in unserem Besitz.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_10"); //Výborně, teď máme všech pět ohniskových kamenů.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_11"); //Your deeds are invaluable to our camp. Be assured of my eternal gratitude.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_11"); //Deine Taten sind von unschätzbarem Wert für unser Lager. Sei dir meines ewigen Dankes gewiss.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_11"); //Tvé činy jsou pro náš tábor nedocenitelné. Máš mou věčnou úctu.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_12"); //Go to Riordian now. He'll give you something for your immense efforts.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_12"); //Gehe nun zu Riordian. Er wird dir einen Ausgleich für deine unermesslichen Mühen geben.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_12"); //Jdi teď k Riordianovi. Dá ti odměnu za tvé nesmírné úsilí.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_13"); //Speak to Cronos, the keeper of the ore, as well. He will give you another gift from our community.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_13"); //Sprich auch mit Cronos, dem Hüter des Erzes. Auch er wird dir ein Geschenk unserer Gemeinschaft überreichen.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_13"); //Řekni si také Cronosovi, strážci rudy. Dá ti od naší komunity další dar.

		Saturas_BringFoci = 5;
		B_GiveXP(XP_DeliverFifthFocus);

//		B_LogEntry(CH3_BringFoci,"I managed to find all four focus stones. Saturas is unbelievably happy. I believe they owe me quite a favor in the New Camp.");
//		B_LogEntry(CH3_BringFoci,"Es ist mir gelungen, alle vier fehlenden Fokussteine zu finden. Saturas ist überglücklich. Ich glaube ich habe jetzt einiges gut im Neuen Lager.");
		B_LogEntry(CH3_BringFoci,"Podařilo se mi najít všechny čtyři ohniskové kameny. Doufám, že mi to v Novém táboře zajistí uznání.");
//		B_LogEntry(CH3_BringFoci,"The Magicians of Water Cronos and Riordian have each promised me a reward for retrieving all the focus stones. I should go round to see them.");
//		B_LogEntry(CH3_BringFoci,"Die Wassermagier Cronos und Riordian halten jeweils eine Belohnung für die Wiederbeschaffung aller vier Fokussteine für mich bereit. Ich sollte mal bei ihnen vorbeischauen.");
		B_LogEntry(CH3_BringFoci,"Mágové Vody, Cronos a Riordian, mi slíbili za ohniskové kameny odměnu. Měl bych se po nich jít podívat.");

		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Aufträge bekam.    ***Björn***

		Log_SetTopicStatus(CH3_MonasteryRuin,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_Stonehenge,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_Fortress,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_TrollCanyon,LOG_SUCCESS);
	};

	//-------- Neuer Teleportzauber ? --------
	if ((!Npc_HasItems(hero,ItArScrollTeleport2)) && (Saturas_BringFoci < 5))
	{
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_14"); //I see you've used up the teleportation scroll. Here, take a new one.
//		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_14"); //Du hast die Teleport-Spruchrolle verbraucht, wie ich sehe. Hier, nimm eine neue.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_14"); //Vidím, že už jsi vyčerpal teleportační svitek. Tady máš nový.
		CreateInvItem(self,ItArScrollTeleport2);
		B_GiveInvItems(self,other,ItArScrollTeleport2,1);
	};
};

//***************************************************************************
//	Info BRINGFOCUS2
//***************************************************************************
instance Info_Saturas_BRINGFOCUS2(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS2_Condition;
	information = Info_Saturas_BRINGFOCUS2_Info;
	important = 0;
	permanent = 0;
//	description = "I've found a focus in the troll canyon!";
//	description = "Ich habe in der Trollschlucht einen Fokus gefunden!";
	description = "Našel jsem ohnisko v Kaňonu trolů!";
};

func int Info_Saturas_BRINGFOCUS2_Condition()
{
	if ((Npc_HasItems(hero,focus_2))
	&& (Saturas_BringFoci > 0))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_BRINGFOCUS2_Info()
{
//	AI_Output(other,self,"Info_Saturas_BRINGFOCUS2_15_01"); //I've found a focus in the troll canyon!
//	AI_Output(other,self,"Info_Saturas_BRINGFOCUS2_15_01"); //Ich habe in der Trollschlucht einen Fokus gefunden!
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS2_15_01"); //Našel jsem ohnisko v Trolím kaňonu!

//	B_LogEntry(CH3_TrollCanyon,"The focus from the troll canyon is now safe with Saturas.");
//	B_LogEntry(CH3_TrollCanyon,"Der Fokus aus der Trollschlucht liegt nun sicher verwahrt bei Saturas.");
	B_LogEntry(CH3_TrollCanyon,"Ohnisko z Trolího kaňonu je teď v bezpečí u Saturase.");
	Log_SetTopicStatus(CH3_TrollCanyon,LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems(hero,self,focus_2,1);
	Npc_RemoveInvItem(self,focus_2);
	B_DeliverFocus();
};

//***************************************************************************
//	Info BRINGFOCUS3
//***************************************************************************
instance Info_Saturas_BRINGFOCUS3(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS3_Condition;
	information = Info_Saturas_BRINGFOCUS3_Info;
	important = 0;
	permanent = 0;
//	description = "I've found a focus in the mountain fort!";
//	description = "Ich habe in der Bergfestung einen Fokus gefunden!";
	description = "Našel jsem ohnisko v horské pevnosti!";
};

func int Info_Saturas_BRINGFOCUS3_Condition()
{
	if ((Npc_HasItems(hero,focus_3))
	&& (Saturas_BringFoci > 0))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_BRINGFOCUS3_Info()
{
//	AI_Output(other,self,"Info_Saturas_BRINGFOCUS3_15_01"); //I've found a focus in the mountain fort!
//	AI_Output(other,self,"Info_Saturas_BRINGFOCUS3_15_01"); //Ich habe in der Bergfestung einen Fokus gefunden!
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS3_15_01"); //Našel jsem ohnisko v horské pevnosti!

//	B_LogEntry(CH3_Fortress,"Saturas received the focus from the mountain fort from me.");
//	B_LogEntry(CH3_Fortress,"Saturas hat von mir den Fokus aus der Bergfestung erhalten.");
	B_LogEntry(CH3_Fortress,"Saturas ode mě dostal ohnisko z horské pevnosti.");
	Log_SetTopicStatus(CH3_Fortress,LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems(hero,self,focus_3,1);
	Npc_RemoveInvItem(hero,focus_3);
	B_DeliverFocus();
};

//***************************************************************************
//	Info BRINGFOCUS4
//***************************************************************************
instance Info_Saturas_BRINGFOCUS4(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS4_Condition;
	information = Info_Saturas_BRINGFOCUS4_Info;
	important = 0;
	permanent = 0;
//	description = "I've found a focus in the ruined monastery!";
//	description = "Ich habe in der Klosterruine einen Fokus gefunden!";
	description = "Našel jsem ohnisko ve zbořeném klášteře!";
};

func int Info_Saturas_BRINGFOCUS4_Condition()
{
	if ((Npc_HasItems(hero,focus_4))
	&& (Saturas_BringFoci > 0))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_BRINGFOCUS4_Info()
{
//	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_01"); //I've found a focus in the ruined monastery!
//	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_01"); //Ich habe in der Klosterruine einen Fokus gefunden!
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_01"); //Našel jsem ohnisko ve zbořeném klášteře!
//	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_02"); //Gorn the mercenary was there, he gave me a hand in searching.
//	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_02"); //Gorn, der Söldner, war dort und hat mich bei der Suche unterstützt.
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_02"); //Byl tam žoldák Gorn a pomohl mi s hledáním.

//	B_LogEntry(CH3_MonasteryRuin,"At last I could give Saturas the focus from the ruined monastery.");
//	B_LogEntry(CH3_MonasteryRuin,"Endlich konnte ich Saturas den Fokus aus der Klosterruine übergeben.");
	B_LogEntry(CH3_MonasteryRuin,"Konečně jsem mohl Saturasovi dát ohnisko ze zbořeného kláštera.");
	Log_SetTopicStatus(CH3_MonasteryRuin,LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems(hero,self,focus_4,1);
	Npc_RemoveInvItem(hero,focus_4);
	B_DeliverFocus();
};

//***************************************************************************
//	Info BRINGFOCUS5
//***************************************************************************
instance Info_Saturas_BRINGFOCUS5(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS5_Condition;
	information = Info_Saturas_BRINGFOCUS5_Info;
	important = 0;
	permanent = 0;
//	description = "I've found a focus under the ring of stone!";
//	description = "Ich habe unter dem Stonehenge einen Fokus gefunden!";
	description = "Našel jsem ohnisko pod kamenným kruhem!";
};

func int Info_Saturas_BRINGFOCUS5_Condition()
{
	if ((Npc_HasItems(hero,focus_5))
	&& (Saturas_BringFoci > 0))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_BRINGFOCUS5_Info()
{
//	AI_Output(other,self,"Info_Saturas_BRINGFOCUS5_15_01"); //I've found a focus under the ring of stone!
//	AI_Output(other,self,"Info_Saturas_BRINGFOCUS5_15_01"); //Ich habe unter dem Stonehenge einen Fokus gefunden!
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS5_15_01"); //Našel jsem ohnisko pod kamenným kruhem!

//	B_LogEntry(CH3_Stonehenge,"I've given Saturas the focus from the crypt underneath the ring of stone.");
//	B_LogEntry(CH3_Stonehenge,"Ich habe Saturas den Fokus aus der Gruft unter dem Stonehenge überreicht.");
	B_LogEntry(CH3_Stonehenge,"Dal jsem Saturasovi ohnisko z krypty pod kamenným kruhem.");
	Log_SetTopicStatus(CH3_Stonehenge,LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems(hero,self,focus_5,1);
	Npc_RemoveInvItem(hero,focus_5);
	B_DeliverFocus();
};

//***************************************************************************
//	Info ALLFOCI
//***************************************************************************
instance Info_Saturas_ALLFOCI(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_ALLFOCI_Condition;
	information = Info_Saturas_ALLFOCI_Info;
	important = 0;
	permanent = 0;
//	description = "Can you blast the ore mound now?";
//	description = "Kann nun die Sprengung des Erzhaufens beginnen?";
	description = "Můžeš už tu rudnou haldu odpálit?";
};

func int Info_Saturas_ALLFOCI_Condition()
{
	if ((Saturas_BringFoci == 5)
	&& (Kapitel < 4))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_ALLFOCI_Info()
{
//	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_01"); //Can you blast the ore mound now?
//	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_01"); //Kann nun die Sprengung des Erzhaufens beginnen?
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_01"); //Můžeš už tu rudnou haldu odpálit?
//	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_02"); //We now have all the artefacts we need to fulfill our plan.
//	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_02"); //Wir haben jetzt alle Artefakte zusammen, die unser großes Vorhaben benötigt.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_02"); //Teď už máme všechny artefakty, které potřebujeme k provedení našeho plánu.
//	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_03"); //But the Barrier was created by twelve magicians.
//	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_03"); //Doch die Erschaffung der Barriere wurde von zwölf Magiern durchgeführt.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_03"); //Bariéru ale vytvořilo dvanáct mágů.
//	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_04"); //There are not enough magicians in the Circle of Water to control the powerful energies and to guide them onto the right course.
//	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_04"); //Um die gewaltigen Energien zu kontrollieren und in die richtigen Bahnen lenken zu können, sind wir Wassermagier nicht genug.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_04"); //V Kruhu vody není dost mágů, kteří by řídili silovou energii a vedli ji správným směrem.
//	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_05"); //What can we do?
//	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_05"); //Was machen wir dann?
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_05"); //Co můžeme udělat?
//	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_06"); //I am aware that you have already done much for our community, we owe you greatly...
//	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_06"); //Mir ist bewusst, dass du schon sehr viel für unsere Gemeinschaft getan hast und wir stehen tief in deiner Schuld ...
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_06"); //Oceňuji, že jsi toho pro naši komunitu už tolik udělal, jsme ti nesmírně zavázaní...
//	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_07"); //... but in the interest of all the inhabitants of the colony, I need to ask one more favor of you.
//	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_07"); //... Doch im Interesse aller Koloniebewohner muss ich dich noch um einen weiteren Gefallen bitten.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_07"); //...ale v zájmu všech obyvatel kolonie tě musím požádat ještě o jednu službu.
};

//***************************************************************************
//	Info FAVOR
//***************************************************************************
instance Info_Saturas_FAVOR(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_FAVOR_Condition;
	information = Info_Saturas_FAVOR_Info;
	important = 0;
	permanent = 0;
//	description = "One more favor?";
//	description = "Ein weiterer Gefallen?";
	description = "Ještě jednu službu?";
};

func int Info_Saturas_FAVOR_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_FAVOR_Info()
{
//	AI_Output(other,self,"Info_Saturas_FAVOR_15_01"); //One more favor?
//	AI_Output(other,self,"Info_Saturas_FAVOR_15_01"); //Ein weiterer Gefallen?
	AI_Output(other,self,"Info_Saturas_FAVOR_15_01"); //Ještě jednu službu?
//	AI_Output(self,other,"Info_Saturas_FAVOR_14_02"); //Yes. Go to the Old Camp and try to win some of the Magicians of the Circle of Fire for our cause.
//	AI_Output(self,other,"Info_Saturas_FAVOR_14_02"); //Ja. Begib dich ins Alte Lager und versuche, einige der Feuermagier für unsere Sache zu gewinnen.
	AI_Output(self,other,"Info_Saturas_FAVOR_14_02"); //Ano. Jdi do Starého tábora a pokus se získat nějaké mágy Kruhu ohně pro naši věc.
//	AI_Output(other,self,"Info_Saturas_FAVOR_15_03"); //MAGICIANS OF FIRE??? Why should they want to give up their easy life?
//	AI_Output(other,self,"Info_Saturas_FAVOR_15_03"); //DIE FEUERMAGIER??? Warum sollten die Maden den Speck verlassen wollen?
	AI_Output(other,self,"Info_Saturas_FAVOR_15_03"); //MÁGY OHNĚ??? Proč by se měli vzdát svého pohodlného života?
//	AI_Output(other,self,"Info_Saturas_FAVOR_15_04"); //The destruction of the Barrier would rob them of their powerful position!
//	AI_Output(other,self,"Info_Saturas_FAVOR_15_04"); //Ein Zusammenbruch der Barriere würde ihre Machtposition  zunichte machen!
	AI_Output(other,self,"Info_Saturas_FAVOR_15_04"); //Zničení Bariéry ukončí jejich mocenské postavení!
//	AI_Output(self,other,"Info_Saturas_FAVOR_14_05"); //That is the exact reason why YOU must accomplish this mission. You know people from all the camps of the colony.
//	AI_Output(self,other,"Info_Saturas_FAVOR_14_05"); //Genau aus diesem Grunde musst DU dich um diese schwierige Mission kümmern. Du kennst Leute aus allen Lagern der Kolonie.
	AI_Output(self,other,"Info_Saturas_FAVOR_14_05"); //To je ten důvod, proč se musíš o tento úkol pokusit PRÁVĚ TY. Znáš lidi ze všech táborů kolonie.
//	AI_Output(self,other,"Info_Saturas_FAVOR_14_06"); //Remind the Magicians of Fire of the old times, when we studied the arts of magic together.
//	AI_Output(self,other,"Info_Saturas_FAVOR_14_06"); //Erinnere die Feuermagier an die alten Zeiten, als wir noch gemeinsam die magischen Künste studierten.
	AI_Output(self,other,"Info_Saturas_FAVOR_14_06"); //Připomeň mágům Ohně staré časy, kdy jsme společně studovali umění magie.
};

//***************************************************************************
//	Info ACCEPT
//***************************************************************************
instance Info_Saturas_ACCEPT(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_ACCEPT_Condition;
	information = Info_Saturas_ACCEPT_Info;
	important = 0;
	permanent = 0;
//	description = "Alright then, I'll try to convince the Magicians of Fire!";
//	description = "Nun gut, ich werde versuchen, die Feuermagier zu überreden!";
	description = "Dobrá tedy, pokusím se přesvědčit mágy Ohně!";
};

func int Info_Saturas_ACCEPT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_ACCEPT_Info()
{
//	AI_Output(other,self,"Info_Saturas_ACCEPT_15_01"); //Alright then, I'll try to convince the Magicians of Fire!
//	AI_Output(other,self,"Info_Saturas_ACCEPT_15_01"); //Nun gut, ich werde versuchen, die Feuermagier zu überreden!
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_01"); //Dobrá tedy, pokusím se přesvědčit mágy Ohně!
//	AI_Output(other,self,"Info_Saturas_ACCEPT_15_02"); //But I can't promise anything! It seems nearly impossible to me.
//	AI_Output(other,self,"Info_Saturas_ACCEPT_15_02"); //Aber ich kann nichts versprechen! Es scheint mir fast unmöglich.
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_02"); //Nemůžu ale slíbit nic! Zdá se mi to bezmála nemožné!
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_03"); //You must try. If you do not succeed in this, there is only one other...
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_03"); //Du musst es versuchen. Wenn du keinen Erfolg hast, dann gibt es nur noch einen ...
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_03"); //Musíš to zkusit. Když se ti to nepodaří, pak už zbude jen jeden...
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_04"); //Just one...
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_04"); //Einen ...
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_04"); //Právě jeden...
//	AI_Output(other,self,"Info_Saturas_ACCEPT_15_05"); //... one WHAT?
//	AI_Output(other,self,"Info_Saturas_ACCEPT_15_05"); //... Einen WAS?
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_05"); //... jeden CO?
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_06"); //Forget it! You MUST succeed!
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_06"); //Vergiss das! Du MUSST Erfolg haben!
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_06"); //Zapomeň na to! MUSÍ se ti to povést!
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_07"); //Here, take this magic rune. Hand it over to Corristo, the High Magician of the Circle of Fire, as a sign of our trust.
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_07"); //Hier, nimm diese Zauberrune. Überbringe sie Corristo, dem obersten Feuermagier, als Zeichen unseres Vertrauens.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_07"); //Tady je kouzelná runa. Dej ji Corristovi, Velkému mágovi Kruhu ohně jako důkaz naší důvěry.
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_08"); //With this he can teleport into this room without passing the guards anytime he wants.
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_08"); //Damit kann er sich jederzeit vorbei an allen Wachen mitten in diesen Raum teleportieren.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_08"); //S ní se může kdykoliv teleportovat do této místnosti, aniž by se setkal se strážemi.
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_09"); //I hope that'll convince our former friends of our good intentions.
//	AI_Output(self,other,"Info_Saturas_ACCEPT_14_09"); //Ich hoffe, das überzeugt unsere ehemaligen Freunde von unseren guten Absichten.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_09"); //Doufám, že to naše staré přátele přesvědčí o našem dobrém záměru.

	B_KapitelWechsel (4);
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info AMBUSH
//---------------------------------------------------------------------
instance Info_Saturas_AMBUSH(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_AMBUSH_Condition;
	information = Info_Saturas_AMBUSH_Info;
	important = 1;
	permanent = 0;
};

func int Info_Saturas_AMBUSH_Condition()
{
	if ((FMTaken)
	&& (!FindXardas))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_AMBUSH_Info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	AI_TurnToNpc(gorn,hero);

//	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_01"); //I'm glad you returned. Something terrible's happened!
//	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_01"); //Gut, dass du wieder zurück bist. Es ist etwas Schreckliches passiert!
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_01"); //Jsem rád, že ses vrátil. Stalo se něco špatného!
//	AI_Output(hero,self,"Info_Saturas_AMBUSH_15_02"); //Let me guess, the Free Mine has been assaulted by the guards from the Old Camp. Nobody saw them coming...?
//	AI_Output(hero,self,"Info_Saturas_AMBUSH_15_02"); //Lass mich raten, die Freie Mine wurde von Gardisten aus dem Alten Lager überfallen, die niemand kommen sah?
	AI_Output(hero,self,"Info_Saturas_AMBUSH_15_02"); //Nech mě hádat, Svobodný důl byl napaden strážemi Starého tábora. Nikdo je neviděl přicházet...?
//	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_03"); //Hang on... how... but of course... You found out about it in the Old Camp!
//	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_03"); //Moment ... woher ... aber natürlich ... Du hast es im Alten Lager erfahren!
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_03"); //Pokračuj... jak... ale samozřejmě... Ty víš o tom, co se stalo ve Starém táboře!
//	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_04"); //Gorn arrived here just before you did.
//	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_04"); //Gorn kam kurz vor dir hier an.
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_04"); //Chvilku před tebou přišel Gorn.
//	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_05"); //What could have caused Gomez to dare to take such an aggressive step?
//	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_05"); //Was kann Gomez nur veranlasst haben, solch einen aggressiven Schritt zu wagen?
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_05"); //Co přimělo Gomeze, že si troufl k tak agresivnímu činu?
//	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_06"); //He should be aware that such a heinous act can only provoke war.
//	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_06"); //Ihm müsste klar sein, dass dieser hinterhältige Überfall einen Krieg heraufbeschwört.
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_06"); //Musí mu být jasné, že takový hanebný čin jenom vyprovokuje válku.
};

//---------------------------------------------------------------------
//	Info COLLAPSE
//---------------------------------------------------------------------
instance Info_Saturas_COLLAPSE(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_COLLAPSE_Condition;
	information = Info_Saturas_COLLAPSE_Info;
	important = 0;
	permanent = 0;
//	description = "The Old Mine collapsed after water seeped in!";
//	description = "Die Alte Mine wurde nach einem Wassereinbruch verschüttet!";
	description = "Starý důl se zhroutil potom, co ho zatopila voda!";
};

func int Info_Saturas_COLLAPSE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_AMBUSH))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_COLLAPSE_Info()
{
//	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01"); //The Old Mine collapsed after water seeped in!
//	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01"); //Die Alte Mine wurde nach einem Wassereinbruch verschüttet!
	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01"); //Starý důl se zhroutil potom, co ho zatopila voda!
//	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_02"); //... Collapsed... of course... then the whole thing makes sense.
//	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_02"); //... Verschüttet ... natürlich ... dann gibt das Ganze langsam einen Sinn.
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_02"); //...Zhroutil... jistě... pak celá ta věc dává smysl.
//	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez has his back to the wall. He's more dangerous than ever. Now that he doesn't have anything left to lose, he'll do anything!
//	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez steht mit dem Rücken zur Wand. Er ist gefährlicher denn je geworden, denn nun, wo er nichts mehr zu verlieren hat, wird er zu allem fähig sein!
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez stojí zády ke zdi. Je nebezpečnější než kdy jindy. Nemá už co ztratit, je schopný čehokoliv!
};

//---------------------------------------------------------------------
//	Info MURDER
//---------------------------------------------------------------------
instance Info_Saturas_MURDER(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_MURDER_Condition;
	information = Info_Saturas_MURDER_Info;
	important = 0;
	permanent = 0;
//	description = "Gomez has had all the Magicians of Fire killed!";
//	description = "Gomez hat alle Feuermagier töten lassen!";
	description = "Gomez zabil všechny mágy Ohně!";
};

func int Info_Saturas_MURDER_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_AMBUSH))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_MURDER_Info()
{
//	AI_Output(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez has had all the Magicians of Fire killed!
//	AI_Output(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez hat alle Feuermagier töten lassen!
	AI_Output(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez zabil všechny mágy Ohně!
//	AI_Output(self,hero,"Info_Saturas_MURDER_14_02"); //HAD THEM KILLED??? Why in Beliar's name would he do a thing like that?
//	AI_Output(self,hero,"Info_Saturas_MURDER_14_02"); //TÖTEN LASSEN??? Wieso bei Beliar hat er so etwas getan?
	AI_Output(self,hero,"Info_Saturas_MURDER_14_02"); //ZABIL JE??? Jak mohl, při jménu Beliarovu, tohle udělat?
//	AI_Output(hero,self,"Info_Saturas_MURDER_15_03"); //They were against the attack on the Free Mine, and opposed Gomez.
//	AI_Output(hero,self,"Info_Saturas_MURDER_15_03"); //Sie waren gegen den Überfall auf die Freie Mine und stellten sich gegen Gomez.
	AI_Output(hero,self,"Info_Saturas_MURDER_15_03"); //Postavili se proti útoku na Svobodný důl a protivili se Gomezovi.
//	AI_Output(self,hero,"Info_Saturas_MURDER_14_04"); //Then we're all doomed. Without the other six magicians, we'll never be able to control the concentrated power of the massive ore mound.
//	AI_Output(self,hero,"Info_Saturas_MURDER_14_04"); //Dann sind wir alle verloren. Ohne die anderen sechs Magier werden wir die geballte Kraft des großen Erzhaufens nicht kontrollieren können.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_04"); //Pak jsme všichni ztraceni. Bez ostatních šesti mágů nebudeme nikdy schopni usměrnit sílu masivu rudné haldy.
//	AI_Output(self,hero,"Info_Saturas_MURDER_14_05"); //But in spite of that, I thank you for passing this dangerous message on to me.
//	AI_Output(self,hero,"Info_Saturas_MURDER_14_05"); //Ich danke dir trotzdem dafür, dass du diese gefährliche Botschaft an mich überbracht hast.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_05"); //Ale přesto ti děkuju za to, že jsi mi tu hroznou zprávu sdělil.

	B_GiveXP(XP_ReportToSaturas);

//	B_LogEntry(CH4_Firemages,"Saturas was not at all happy when I told him about the incidents in the Old Camp. Whatever happens to their escape plan ... they'll have to make do WITHOUT the Magicians of Fire.");
//	B_LogEntry(CH4_Firemages,"Saturas war garnicht erfreut, als ich ihm über die Ereignisse im Alten Lager berichtet habe. Wie immer es jetzt mit der Sprengung der magischen Barriere weitergeht... es wird auf jeden Fall OHNE die Feuermagier geschehen müssen.");
	B_LogEntry(CH4_Firemages,"Saturas neměl příliš radost, když jsem mu pověděl o incidentech ve Starém táboře. To, co se přihodilo znamená, že svůj plán na únik... budou muset provést BEZ mágů Ohně.");
	Log_SetTopicStatus(CH4_Firemages,LOG_SUCCESS);
};

/*------------------------------------------------------------------------
							GILDENWECHSEL
------------------------------------------------------------------------*/
instance KDW_600_Saturas_NOMOREOC(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = KDW_600_Saturas_NOMOREOC_Condition;
	information = KDW_600_Saturas_NOMOREOC_Info;
	important = 0;
	permanent = 0;
//	description = "I have been exiled from the Old Camp because I have helped you!";
//	description = "Das Alte Lager hat mich verbannt, weil ich euch geholfen habe!";
	description = "Byl jsem vyhoštěn ze Starého tábora, protože jsem vám pomáhal!";
};

func int KDW_600_Saturas_NOMOREOC_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Saturas_MURDER))
	&& ((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF)))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_NOMOREOC_Info()
{
//	AI_Output(other,self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //I have been exiled from the Old Camp because I have helped you!
//	AI_Output(other,self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //Das Alte Lager hat mich verbannt, weil ich euch geholfen habe!
	AI_Output(other,self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //Byl jsem vyhoštěn ze Starého tábora, protože jsem vám pomáhal!
//	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //You don't belong to the Old Camp any longer?
//	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //Du gehörst nicht länger zum Alten Lager?
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //Už teda nepatříš ke Starému táboru?
//	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Then I welcome you to our community.
//	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Dann heiße ich dich in unserer Gemeinschaft willkommen.
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Pak vítej do naší komunity!

	Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
//	B_LogEntry(CH4_BannedFromOC,"After I was banned from the Old Camp, Saturas welcomed me to the New Camp.");
//	B_LogEntry(CH4_BannedFromOC,"Nachdem ich aus dem Alten Lager verbannt wurde hat mich Saturas im Neuen Lager wilkommen geheissen.");
	B_LogEntry(CH4_BannedFromOC,"Když jsem byl vykázán ze Starého tábora, Saturas mě přivítal v Novém táboře.");
};

/*------------------------------------------------------------------------
							VOM GRD ZUM SLD
------------------------------------------------------------------------*/

instance KDW_600_Saturas_GOTOLEE(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = KDW_600_Saturas_GOTOLEE_Condition;
	information = KDW_600_Saturas_GOTOLEE_Info;
	important = 0;
	permanent = 0;
//	description = "Does that mean the mercenaries will take me on?";
//	description = "Heißt das, die Söldner werden mich aufnehmen?";
	description = "Znamená to, že mě přijmou žoldáci?";
};

func int KDW_600_Saturas_GOTOLEE_Condition()
{
	if ((oldHeroGuild == GIL_GRD)
	&& (Npc_KnowsInfo(hero,KDW_600_Saturas_NOMOREOC)))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_GOTOLEE_Info()
{
//	AI_Output(other,self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Does that mean the mercenaries will take me on?
//	AI_Output(other,self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Heißt das, die Söldner werden mich aufnehmen?
	AI_Output(other,self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Znamená to, že mě přijmou žoldáci?
//	AI_Output(self,other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Talk to Lee. He'll see to it. Then come back to me.
//	AI_Output(self,other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Sprich mit Lee. Er wird sich darum kümmern. Danach komm wieder zu mir.
	AI_Output(self,other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Řekni Leeovi, dohlédne na to. Pak se ke mně vrať.

//	B_LogEntry(CH4_BannedFromOC,"Lee, the leader of the mercenaries, wants to speak to me. I'm supposed to see him and return to Saturas after.");
//	B_LogEntry(CH4_BannedFromOC,"Lee, der Anführer der Söldner, will in dieser Angelegenheit mit mir sprechen. Ich soll ihn aufsuchen und anschließend wieder zu Saturas zurückkehren.");
	B_LogEntry(CH4_BannedFromOC,"Lee, velitel žoldáků, se mnou chce mluvit. Mám se k němu dostavit a pak se vrátit k Saturasovi.");
};

/*------------------------------------------------------------------------
							VON KDF ZU KDW
------------------------------------------------------------------------*/

instance KDW_600_Saturas_OATH(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = KDW_600_Saturas_OATH_Condition;
	information = KDW_600_Saturas_OATH_Info;
	important = 0;
	permanent = 0;
//	description = "Does that mean that I now belong to the Magicians of Water?";
//	description = "Heißt das, ich gehöre jetzt in die Gilde der Wassermagier?";
	description = "Znamená to, že teď patřím do spolku mágů Vody?";
};

func int KDW_600_Saturas_OATH_Condition()
{
	if ((oldHeroGuild == GIL_KDF)
	&& (Npc_KnowsInfo(hero,KDW_600_Saturas_NOMOREOC)))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_OATH_Info()
{
//	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01"); //Does that mean that I now belong to the guild of the Magicians of the Water?
//	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01"); //Heißt das, ich gehöre jetzt in die Gilde der Wassermagier?
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01"); //Znamená to, že teď patřím do spolku mágů Vody?
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02"); //Not yet. First you need to take the oath of Water.
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02"); //Noch nicht. Du musst erst den Eid des Wassers ablegen.
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02"); //Ještě ne. Nejdříve musíš složit přísahu Vody.
//	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_03"); //But I've already taken the oath of Fire!
//	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_03"); //Aber ich habe mich bereits dem Feuer verschworen!
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_03"); //Já už jsem ale složil přísahu Ohně!
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm....
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm ....
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm...
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_05"); //It doesn't mean you're breaking your vow!
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_05"); //Du brichst den Schwur ja nicht!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_05"); //To neznamená, že tím svůj slib porušíš!
//	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_06"); //Uhh... I don't understand...
//	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_06"); //Ähh ... Ich verstehe nicht ...
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_06"); //Uch... Nerozumím...
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_07"); //You're extending your vow. That way you'll become a magician of both elements!
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_07"); //Du erweiterst deinen Schwur. Damit wirst du zum Magier der beiden Elemente!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_07"); //Rozšíříš svoji přísahu. Tak se staneš mágem obou živlů!
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_08"); //Then you'll have the force of Fire as well as the wisdom of Water!
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_08"); //Sowohl die Macht des Feuers als auch das Wissen des Wassers stehen dir dann zur Verfügung!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_08"); //Pak budeš mít sílu Ohně, zrovna tak jako moudrost Vody!

//	B_LogEntry(CH4_BannedFromOC,"Saturas will let me join the Circle of Water and I don't need to break the oath of Fire.");
//	B_LogEntry(CH4_BannedFromOC,"Saturas bot mir an, mich in den Kreis der Wassermagier aufzunehmen, ohne dass ich meinen alten Schwur des Feuers brechen muss.");
	B_LogEntry(CH4_BannedFromOC,"Saturas mě nechá přidat se ke Kruhu vody, aniž bych musel zrušit přísahu Ohni.");
};

/*------------------------------------------------------------------------
//							KDWAUFNAHME //
------------------------------------------------------------------------*/
instance KDW_600_Saturas_KDWAUFNAHME(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = KDW_600_Saturas_KDWAUFNAHME_Condition;
	information = KDW_600_Saturas_KDWAUFNAHME_Info;
	important = 0;
	permanent = 0;
//	description = "I'm ready to take the oath.";
//	description = "Ich bin bereit, den Eid abzulegen.";
	description = "Jsem připraven složit přísahu.";
};

func int KDW_600_Saturas_KDWAUFNAHME_Condition()
{
	if (Npc_KnowsInfo(hero,KDW_600_Saturas_OATH))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_KDWAUFNAHME_Info()
{
	AI_GotoNpc(hero,self);
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //I'm ready to take the oath.
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Ich bin bereit, den Eid abzulegen.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jsem připraven složit přísahu.
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Servant of the Fire, you shall now receive the blessing of the Water!
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Diener des Feuers, du wirst nun den Segen des Wassers empfangen!
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Služebníku Ohně, teď dostaneš požehnání Vody!
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Now speak the words of the oath:
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Sprich nun die Worte des Eides:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Nyní prones slova přísahy:
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //I swear by the might of the gods...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Ich schwöre bei den Mächten der Götter...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Přísahám při boží moci...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //I swear by the might of the gods...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Ich schwöre bei den Mächten der Götter...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Přísahám při boží moci...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //... and by the power of the holy Water...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...und bei der Kraft des heiligen Wassers...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...a na sílu svaté Vody...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //... and by the power of the holy Water...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...und bei der Kraft des heiligen Wassers...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...a na sílu svaté Vody...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //... that my knowledge and my deeds from now on and forever shall be one with the Water...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...že mé vědění a skutky budu od tohoto okamžiku a provždy v jednotě s Vodou...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //... that my knowledge and my deeds from now on and forever shall be one with the Water...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...že mé vědění a skutky budu od tohoto okamžiku a provždy v jednotě s Vodou...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //... until my body shall return to the realm of Beliar and the source of my life shall dry out.
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...dokud mé tělo nebude navráceno říši Beliarově a voda mého života nevyschne
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //... until my body shall return to the realm of Beliar and the source of my life shall dry out.
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...dokud mé tělo nebude navráceno říši Beliarově a voda mého života nevyschne

//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //With this oath you unite the power of the Fire and the blessing of the Water within you.
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Mit diesem Schwur einst du die Kraft des Feuers und den Segen des Wassers in dir.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Touto přísahou jsi v sobě sjednotil sílu Ohně a požehnání Vody.
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //You have now bound together what was apart before. May your life be a sign of the unification of the elements.
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Du verbindest das, was vorher getrennt war. Möge dein Leben ein Zeichen des Bundes der Elemente sein.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Máš nyní ve svazku to, co dříve bylo rozděleno. Kéž jde tvůj život ve znamení jednoty těchto živlů.
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Wear this robe as a sign of your bond with the holy Water and with Adanos.
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Trage diese Robe als Zeichen deiner Verbundenheit zum heiligen Wasser und zu Adanos.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Oblékni si toto roucho na znamení svazku se svatou Vodou a Adanosem.

	CreateInvItem(self,KDW_ARMOR_L);
	B_GiveInvItems(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;

//	B_LogEntry(CH4_BannedFromOC,"Now I've joined the Circle of Water. From now on I've got access to both schools of magic.");
//	B_LogEntry(CH4_BannedFromOC,"Er hat mich in den Kreis der Wassermagier aufgenommen. Von nun an habe ich Zugriff auf beide Schulen der Magie.");
	B_LogEntry(CH4_BannedFromOC,"Teď jsem spojencem Kruhu vody. Nyní mám přístup k oběma školám magie.");
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_SUCCESS);

	AI_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
						DIE MAGISCHEN KREISE
------------------------------------------------------------------------*/

instance KDW_600_Saturas_LESSON(C_INFO)
{
	npc = KDW_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_LESSON_Condition;
	information = KDW_600_Saturas_LESSON_Info;
	important = 0;
	permanent = 0;
//	description = "Can you instruct me?";
//	description = "Kannst du mich unterrichten?";
	description = "Můžeš mě cvičit?";
};

func int KDW_600_Saturas_LESSON_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_LESSON_Info()
{
//	AI_Output(other,self,"KDW_600_Saturas_LESSON_Info_15_01"); //Can you instruct me?
//	AI_Output(other,self,"KDW_600_Saturas_LESSON_Info_15_01"); //Kannst du mich unterrichten?
	AI_Output(other,self,"KDW_600_Saturas_LESSON_Info_15_01"); //Můžeš mě cvičit?

	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) <= 3)
	{
//		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_02"); //There's much you need to learn. I shall teach you as soon as you're ready.
//		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_02"); //Es gibt noch viel zu lernen für dich. Wenn du bereit bist, werde ich dich unterrichten.
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_02"); //Je toho hodně, co se musíš naučit. Budu tě cvičit, až na to budeš připraven.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 4)
	{
//		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_03"); //There is one more Circle you don't know yet. I shall teach you as soon as you're ready.
//		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_03"); //Es gibt noch einen weiteren Kreis, den du nicht kennst. Wenn du bereit bist, werde ich dich unterrichten.
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_03"); //Existuje ještě jeden Kruh, který neznáš. Budu tě o něm učit, jakmile budeš na to připraven.
	}
	else
	{
//		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_04"); //You have already mastered the Fifth Circle of Magic! You know all I know.
//		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_04"); //Du beherrscht bereits den fünften Kreis der Magie! Du weißt alles, was ich weiß.
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_04"); //Už jsi zvládl Pátý kouzelný kruh! Víš už to, co já.
//		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_05"); //I can't teach you any more!
//		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_05"); //Ich kann dir nichts mehr beibringen!
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_05"); //Už tě víc učit nedokážu!
	};

	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
//	B_LogEntry(GE_TeacherNC,"Saturas, the leader of the Magicians of Water, teaches the magic CIRCLES. He always stays at the pentagram on the upper level.");
//	B_LogEntry(GE_TeacherNC,"Saturas, der Anführer der Wassermagier lehrt die magischen KREISE. Er hält sich stets am Pentagramm auf der obersten Ebene auf.");
	B_LogEntry(GE_TeacherNC,"Saturas, vůdce mágů Vody, učí magickým KRUHŮM. Stále přebývá u pentagramu v horní rovině.");
};

//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance KDW_600_Saturas_KREIS1(C_INFO)
{
	npc = KDW_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS1_Condition;
	information = KDW_600_Saturas_KREIS1_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0);
//	description = B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0);
	description = B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0);
};

func int KDW_600_Saturas_KREIS1_Condition()
{
	if ((Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_KREIS1_Info()
{
//	AI_Output(other,self,"KDW_600_Saturas_KREIS1_Info_15_01"); //I am ready to enter the First Circle.
//	AI_Output(other,self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Ich bin bereit, in den ersten Kreis aufgenommen zu werden.
	AI_Output(other,self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Jsem připraven vstoupit do Pátého kruhu.

	if (B_GiveSkill(other,NPC_TALENT_MAGE, 1, LPCOST_TALENT_MAGE_1))
	{
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_02"); //To enter the first of the magic Circles means learning to use magic runes.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Den ersten der magischen Kreise zu betreten, bedeutet die Anwendung magischer Runen lernen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Vstoupit do prvního z kouzelných kruhů znamená naučit se používat kouzelné runy.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Each rune contains the structure of a special magic spell.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Jede Rune birgt in sich die Struktur eines speziellen Zaubers.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Každá runa obsahuje strukturu zvláštního kouzelného zaříkávadla.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_04"); //By using your own magic powers, you'll be able to cast the magic of the rune.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_04"); //Durch den Einsatz deiner eigenen magischen Energie, bist du in der Lage, den Zauber der Rune zu wirken.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_04"); //Spolu se svými vlastními kouzelnými silami budeš schopen využívat kouzlo run.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_05"); //But in contrast to the magic scrolls, which are magic formulas as well, the magic power of the rune ensures that the structure of the spell endures.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_05"); //Doch anders als Spruchrollen, die auch eine Zauberformel sind, sorgt die magische Kraft, die der Rune innewohnt, dafür, dass die Struktur des Zaubers erhalten bleibt.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_05"); //Ale narozdíl od kouzelných svitků, které jsou také kouzelnými formulemi, magická síla run zajišťuje, že struktura zaříkávadla přetrvává.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Every rune is a source of magic power which you can fall back on anytime.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Jede Rune ist eine Quelle magischer Kraft, auf die du immer wieder zurückgreifen kannst.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Každá runa je zdrojem magické síly, kterou můžeš kdykoliv zase zrušit.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Your own magic power is used up when you use a rune, just as with a spell scroll.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Deine eigene magische Kraft verbraucht sich beim Benutzen der Rune, wie bei einer Spruchrolle.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Svoji vlastní kouzelnou moc využiješ tehdy, když použiješ runu, podobně jako je tomu s kouzelným svitkem.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_08"); //With every Circle you enter, you learn to use further runes as well.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_08"); //Mit jedem Kreis, den du lernst, lernst du auch die Möglichkeit, weitere Runen zu benutzen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_08"); //Se vstupem do každého dalšího Kruhu se naučíš využívat také další kouzelné runy.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Use the power of the runes to recognize yourself.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Nutze die Kraft der Runen, um dich selber zu erkennen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Využij moc run k poznání sebe sama.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};

//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance KDW_600_Saturas_KREIS2(C_INFO)
{
	npc = KDW_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS2_Condition;
	information = KDW_600_Saturas_KREIS2_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0);
//	description = B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0);
	description = B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0);
};

func int KDW_600_Saturas_KREIS2_Condition()
{
	if ((Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_KREIS2_Info()
{
//	AI_Output(other,self,"KDW_600_Saturas_KREIS2_Info_15_01"); //I am ready to enter the Second Circle.
//	AI_Output(other,self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Ich bin bereit, in den zweiten Kreis aufgenommen zu werden.
	AI_Output(other,self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Jsem připraven vstoupit do Druhého kruhu.

	if (B_GiveSkill(other,NPC_TALENT_MAGE, 2, LPCOST_TALENT_MAGE_2))
	{
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_02"); //You have learned to understand the runes. Now it is time to deepen this understanding.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Du hast das Verständnis der Runen gelernt. Nun ist es an der Zeit, dieses Verständnis zu vertiefen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Naučil ses rozumět kouzelným znakům. Nadešel čas prohloubit toto porozumění.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_03"); //When you join the Second Circle you will learn the foundations of stronger battle spells, and above all the secret of healing.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Mit dem zweiten Kreis lernst du die Grundsätze stärkerer Kampfzauber und vor allem das Geheimnis der Heilung.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Jakmile se přidáš ke Druhému kruhu, naučíš se základům mocnějších bojových zaříkávadel a všem tajům ranhojičství.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_04"); //But you need to learn much if you want to recognize the true secrets of magic.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Doch du musst noch viel lernen, willst du die tatsächlichen Geheimnisse der Magie ergründen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Budeš se ale muset naučit ještě víc, jestli chceš poznat opravdová tajemství magie.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_05"); //You know that you can use every rune as often as you like until you've used up all your own powers.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Du weißt, dass du jede Rune solange einsetzen kannst, bis deine eigene Kraft verbraucht ist.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Víš, že každou runu můžeš používat jak často chceš, dokud nevyčerpáš své vlastní síly.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_06"); //But before you act, think about the point of your actions. You have obtained powers with which you may easily conjure up death and destruction.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Aber frage dich, ob es sinnvoll ist. Du hast Macht verliehen bekommen, mit der es dir ein Leichtes ist, Tod und Verderben zu bringen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Než budeš jednat, rozmysli si cíl svého jednání. Nabyl jsi síly, která tě snadno může dovést k záhubě a zničení.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_07"); //But a true magician only uses magic when it is necessary.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Doch der wahrhafte Magier zaubert nur dann, wenn es angebracht ist.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Opravdový mág ale užívá kouzla jen tehdy, když je to nezbytné.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Understand the situation, then you'll recognize the power of the runes.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Erkenne die Situation, dann wirst du die Macht der Runen erkennen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Pokud porozumíš situaci, pak poznáš moc run.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};
};

//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance KDW_600_Saturas_KREIS3(C_INFO)
{
	npc = KDW_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS3_Condition;
	information = KDW_600_Saturas_KREIS3_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0);
//	description = B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0);
	description = B_BuildLearnString(NAME_LearnMage_3,LPCOST_TALENT_MAGE_3,0);
};

func int KDW_600_Saturas_KREIS3_Condition()
{
	if ((Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 2)
	&& (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_KREIS3_Info()
{
//	AI_Output(other,self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Could you teach me the Third Circle?
//	AI_Output(other,self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Ich bin bereit, den dritten Kreis zu betreten
	AI_Output(other,self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Můžeš mě připravit do Třetího kruhu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE, 3, LPCOST_TALENT_MAGE_3))
	{
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_02"); //The Third Circle of Magic is one of the most important steps in the life of a magician. Once you've reached it, you cease to be a seeker.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_02"); //Der dritte Kreis der Magie ist einer der wichtigsten Schritte im Leben eines Magiers. Nicht länger bist du ein Suchender.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_02"); //Třetí kouzelný kruh je jedním z nejdůležitějších kroků v životě mága. Jakmile ho dosáhneš, přestáváš být hledačem.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_03"); //You have already come far on the path of magic. You have learned to use the runes.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Du bist bereits ein Stück des magischen Weges gegangen. Du hast gelernt die Runen zu nutzen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Došel jsi už po cestě magie opravdu daleko. Naučil ses používat kouzelné runy.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_04"); //This knowledge is the foundation for your further path. Use the runes with deliberation.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Dieses Wissen ist das Fundament für deinen weiteren Weg. Nutze die Runen mit Bedacht.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Tato znalost je východisko pro tvojí další cestu. Používej tyto runy s uvážením.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_05"); //You may use a rune or not. But you must decide on one of these possibilities.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_05"); //Du kannst eine Rune nutzen oder nicht. Aber entscheide dich für eine der Möglichkeiten.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_05"); //Runy můžeš nebo nemusíš používat. Ale musíš se rozhodnout pro jednu z těchto možností.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Do not hesitate to use your powers as soon as you've made your choice.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Zögere nicht, deine Macht einzusetzen, wenn du dich einmal entschieden hast.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Jakmile se rozhodneš, neostýchej se využít svých sil.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Understand your path, then you'll recognize the power of the decision.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Erkenne deinen Weg, dann wirst du die Macht der Entscheidung erkennen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Jakmile porozumíš své cestě, pak poznáš sílu rozhodnutí.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};
};

//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------

instance KDW_600_Saturas_KREIS4(C_INFO)
{
	npc = KDW_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS4_Condition;
	information = KDW_600_Saturas_KREIS4_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0);
//	description = B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0);
	description = B_BuildLearnString(NAME_LearnMage_4,LPCOST_TALENT_MAGE_4,0);
};

func int KDW_600_Saturas_KREIS4_Condition()
{
	if ((Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 3)
	&& (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_KREIS4_Info()
{
//	AI_Output(other,self,"KDW_600_Saturas_KREIS4_Info_15_01"); //I am ready to enter the Fourth Circle.
//	AI_Output(other,self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Ich bin bereit für den vierten der Kreise.
	AI_Output(other,self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Jsem připraven vstoupit do Pátého kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE, 4, LPCOST_TALENT_MAGE_4))
	{
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_02"); //You have completed the first three Circles. Now is the time for you to learn the secrets of magic.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Du hast die ersten drei Kreise durchschritten. Nun ist es an der Zeit, dass du die Geheimnisse der Magie kennen lernst.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Dokončil jsi první tři Kruhy. Nyní nadešel čas naučit se tajemství magie.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_03"); //The magic of the runes is based on the stone. They are magic stones, created out of magic ore.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_03"); //Die Magie der Runen ruht in ihrem Stein. Es sind magische Steine, gewonnen aus magischem Erz.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_03"); //Kouzlo run je založeno na kamenech. Existují kouzelné kameny, vytvořené z kouzelné rudy.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_04"); //It is the same ore which is collected in the mines. This ore is endowed with magic formulas in the temples. There the runes are converted to the instruments of our power.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_04"); //Das gleiche Erz, das hier abgebaut wird. Dieses Erz wird in den Tempeln mit den Formeln der Magie versehen. Dort werden die Runen zu den Instrumenten unserer Macht geformt.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_04"); //Z té samé rudy, která se těží tady v dolech. Tato ruda je obdařena magickými formulemi templářů. Tyto runy jsou upraveny jako nástroje naší moci.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_05"); //With the runes you control now, you have the entire knowledge of the temples of the realm at your fingertips.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_05"); //Mit allen Runen, die du nun beherrschen kannst, steht dir das gesammelte Wissen der Tempel des Reiches zur Verfügung.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_05"); //S těmito runami, které už ovládáš, máš celé vědění chrámové sféry v malíčku.
		//AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Understand the magic, then you'll discover the secret of power.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Erkenne die Magie, dann wirst du das Geheimnis von Macht erkennen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Jakmile porozumíš magii, objevíš tajemství moci.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};

/*------------------------------------------------------------------------
							DER FÜNFTE KREIS
------------------------------------------------------------------------*/

instance KDW_600_Saturas_KREIS5(C_INFO)
{
	npc = KDW_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS5_Condition;
	information = KDW_600_Saturas_KREIS5_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0);
//	description = B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0);
	description = B_BuildLearnString(NAME_LearnMage_5,LPCOST_TALENT_MAGE_5,0);
};

func int KDW_600_Saturas_KREIS5_Condition()
{
	if ((Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 4)
	&& (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_KREIS5_Info()
{
//	AI_Output(other,self,"KDW_600_Saturas_KREIS5_Info_15_01"); //I am ready to enter the Fifth Circle.
//	AI_Output(other,self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Ich bin bereit für den fünften Kreis.
	AI_Output(other,self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Jsem připraven vstoupit do Pátého kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
//		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_02"); //So be it. I shall teach you the power of the Fifth Circle.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_02"); //So soll es geschehen. Ich werde dich die Macht des fünften Kreises lehren.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_02"); //Správně. Budu tě učit o síle Pátého kruhu.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_03"); //The Storm of Fire, the Wave of Ice and the power to destroy the undead are now spells whose runes you can use.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_03"); //Der Sturm des Feuers, die Welle aus Eis und die Macht, Untote zu vernichten, sind wahrhaft mächtige Sprüche, deren Runen dir nun untertan sind.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_03"); //Bouře Ohně a Vody a Síla, která ničí nemrtvé, jsou kouzla, která můžeš těmito runami vyvolávat.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_04"); //But the mightiest spell of the Fifth Circle is the Ripple of Death. If you ever possess this rune, you'll have dangerous powers.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_04"); //Doch der mächtigste Zauber des fünften Kreises ist die Welle des Todes. Solltest du in den Besitz dieser Rune gelangen, dann bist du im Besitz gefährlicher Macht.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_04"); //Nejmocnější zaříkávadlo Pátého kruhu je ale Smrtelné vlnění. Pokud vlastníš jeho runu, pak máš nebezpečnou moc.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Be careful to use this kind of magic as little as possible. It's a gift from the god of darkness.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Hüte dich vor dem Einsatz dieser Magie. Sie ist eine Gabe des dunklen Gottes.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Tento druh kouzla ale používej co nejméně. Je to dar boha temnot.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_06"); //You have now learned everything I can teach you.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Teď znáš všechno, co jsem tě mohl naučit.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Expose your limits, then you'll recognize your true power.
//		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Erkenne deine Grenzen, dann wirst du deine wahre Macht erkennen
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Poznej své možnosti, pak budeš znát svoji opravdovou moc.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};

/*------------------------------------------------------------------------
							SCHWERE ROBE
------------------------------------------------------------------------*/

instance KDW_600_Saturas_HEAVYARMOR(C_INFO)
{
	npc = KDW_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_HEAVYARMOR_Condition;
	information = KDW_600_Saturas_HEAVYARMOR_Info;
	important = 0;
	permanent = 1;
	description = B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H);
};

func int KDW_600_Saturas_HEAVYARMOR_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return 1;
	};

};

func void KDW_600_Saturas_HEAVYARMOR_Info()
{
//	AI_Output(other,self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //I'd like to wear the high robe of Water.
//	AI_Output(other,self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //Ich möchte die hohe Robe des Wassers tragen.
	AI_Output(other,self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //Chtěl bych nosit vznešené roucho Vody.

	if ((Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5))
	{
//		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //It is not yet time for you to wear the high robe.
//		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Es ist noch nicht an der Zeit, dass du die hohe Robe tragen kannst.
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Ještě nenadešel čas, abys nosil vznešené roucho.
	}
	else if (Npc_HasItems(hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
//		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //The little ore that you have won't even cover the manufacturing costs.
//		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //Dein bisschen Erz deckt ja nicht mal die Herstellungskosten.
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //S tímhle množstvím rudy nezaplatíš ani výrobní náklady.
	}
	else
	{
//		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //The time has come. You are worthy of wearing the high robe of Water.
//		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Die Zeit ist gekommen. Du bist würdig, die hohe Robe des Wassers zu tragen.
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Nadešel tvůj čas. Jsi hoden nosit vznešené roucho Vody.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;

		B_GiveInvItems(hero,self,ItMinugget,VALUE_KDW_ARMOR_H);
		CreateInvItem(hero,KDW_ARMOR_H);

		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);

		AI_EquipBestArmor(hero);
	};
};

//---------------------------------------------------------------------
//	Info NOWSLD
//---------------------------------------------------------------------
instance Info_Saturas_NOWSLD(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_NOWSLD_Condition;
	information = Info_Saturas_NOWSLD_Info;
	important = 0;
	permanent = 0;
//	description = "Lee has admitted me to the mercenaries.";
//	description = "Lee hat mich bei den Söldnern aufgenommen.";
	description = "Lee mě přijmul k žoldákům.";
};

func int Info_Saturas_NOWSLD_Condition()
{
	if Npc_KnowsInfo(hero,Sld_700_Lee_CHANGESIDE)
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_NOWSLD_Info()
{
//	AI_Output(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee has admitted me to the mercenaries.
//	AI_Output(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee hat mich bei den Söldnern aufgenommen.
	AI_Output(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee mě přijmul k žoldákům.
//	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_02"); //Good. Very good. Then you are now officially a part of our community.
//	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_02"); //Gut. Sehr gut. Dann gehörst du nun offiziell zu unserer Gemeinschaft.
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_02"); //Dobře. Výborně. Teď patříš oficiálně k naší komunitě.
//	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_03"); //Be welcome!
//	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_03"); //Sei herzlich willkommen!
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_03"); //Buď vítán!

//	B_LogEntry(CH4_BannedFromOC,"Saturas has now officially welcomed me as a mercenary.");
//	B_LogEntry(CH4_BannedFromOC,"Auch Saturas hat mich nun als neuer Söldner offiziell begrüßt.");
	B_LogEntry(CH4_BannedFromOC,"Saturas mě oficiálně uvedl jako žoldáka. ");
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_SUCCESS);
};

//---------------------------------------------------------------------
//	Info XARDAS
//---------------------------------------------------------------------
instance Info_Saturas_XARDAS(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_XARDAS_Condition;
	information = Info_Saturas_XARDAS_Info;
	important = 0;
	permanent = 0;
//	description = "When you sent me to the Magicians of Fire, you mentioned SOMEBODY...";
//	description = "Bei der Sache mit den Feuermagiern, erwähntest du einen weiteren... JEMAND";
	description = "Když jsi mě posílal k mágům Ohně, říkal jsi, že byl... NĚKDO.";
};

func int Info_Saturas_XARDAS_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Saturas_COLLAPSE))
	&& (Npc_KnowsInfo(hero,Info_Saturas_MURDER)))
	{  //***Björn***>

		if ((Npc_GetTrueGuild(hero) != GIL_GRD)
		&& (Npc_GetTrueGuild(hero) != GIL_KDF))
		{
			return 1;
		};

/*
		if (oldHeroGuild==GIL_GRD)
		{
			if (Npc_GetTrueGuild(hero)==GIL_SLD)
			{
				return 1;
			};
		}
		else if (oldHeroGuild==GIL_KDF)
		{
			if (Npc_GetTrueGuild(hero)==GIL_KDW)
			{
				return 1;
			};
		}
		else
		{
			return 1;
		}; <***Björn***
*/
	};

	return 0;
};

func void Info_Saturas_XARDAS_Info()
{
//	AI_Output(hero,self,"Info_Saturas_XARDAS_15_01"); //When you sent me to the Magicians of Fire, you mentioned there was... SOMEBODY.
//	AI_Output(hero,self,"Info_Saturas_XARDAS_15_01"); //Als du mich zu den Feuermagiern schicktest, erwähntest du einen weiteren ... JEMAND
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_01"); //Když jsi mě posílal k mágům Ohně, říkal jsi, že byl... NĚKDO.
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_02"); //Well, I had hoped we could make it without his help, but the way things are developing...
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_02"); //Nun, ich hoffte wir würden ohne seine Hilfe auskommen, aber so wie die Dinge stehen ...
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_02"); //Dobrá, doufal jsem, že to dokážu bez tvojí pomoci, věci se mění...
//	AI_Output(hero,self,"Info_Saturas_XARDAS_15_03"); //Who is HE?
//	AI_Output(hero,self,"Info_Saturas_XARDAS_15_03"); //Wer ist dieser JEMAND?
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_03"); //Kdo je ten ON?
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_04"); //Alright, alright!
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_04"); //Also gut, also gut!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_04"); //Dobře, dobře!
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_05"); //Many, many years ago...
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_05"); //Vor vielen, vielen Jahren ...
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_05"); //Před mnoha mnoha lety...
//	AI_Output(hero,self,"Info_Saturas_XARDAS_15_06"); //Give me the shortened version, please!
//	AI_Output(hero,self,"Info_Saturas_XARDAS_15_06"); //Bitte die Kurzform!
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_06"); //Zkrať to, prosím!
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_07"); //Be patient! Well, when we - the twelve magicians - created the Barrier back then, our magic powers were directed and controlled by a thirteenth magician.
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_07"); //Geduld! Also, als wir - die zwölf Magier - damals die Barriere erschufen, wurden unsere magischen Kräfte von einem 13. Zauberer gelenkt und geleitet.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_07"); //Buď trpělivý! Dobrá, když jsme - nás dvanáct mágů - tvořili tehdy Bariéru, naše magické síly byly směrovány a řízeny třináctým mágem.
//	AI_Output(hero,self,"Info_Saturas_XARDAS_15_08"); //A thirteenth magician? I thought there were only twelve!
//	AI_Output(hero,self,"Info_Saturas_XARDAS_15_08"); //Ein 13. Zauberer? Ich dachte, es hätte nur zwölf gegeben!
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_08"); //Třináctým mágem? Myslel jsem, že jich bylo jen dvanáct!
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_09"); //Most people who did not experience the early days of the colony believe that.
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_09"); //Die meisten, die die ersten Tage der Kolonie nicht miterlebt haben, glauben das.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_09"); //Většina lidí, která nezažila nejstarší období kolonie, tomu věří.
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_10"); //This thirteenth magician was our leader. All this took place before we were divided into the Circles of Fire and Water.
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_10"); //Dieser 13. Zauberer war einst unser Anführer. Das alles war, bevor wir uns in den Feuer- und Wasserkreis zerstritten haben.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_10"); //Ten třináctý mág byl náš vůdce. To všechno se stalo předtím, než jsme byli rozděleni do Kruhů Ohně a Vody.
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_11"); //But he left the Old Camp, which was once the only camp of the colony.
//	AI_Output(self,hero,"Info_Saturas_XARDAS_14_11"); //Doch er verließ das Alte Lager, das damals noch das einzige Lager in der Kolonie war.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_11"); //Opustil ale Starý tábor, který byl tehdy jediným v kolonii.
};

//---------------------------------------------------------------------
//	Info XARDASWHO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHO(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_XARDASWHO_Condition;
	information = Info_Saturas_XARDASWHO_Info;
	important = 0;
	permanent = 0;
//	description = "What is this thirteenth magician called?";
//	description = "Wie heißt dieser 13. Zauberer?";
	description = "Jak se ten třináctý mág jmenoval?";
};

func int Info_Saturas_XARDASWHO_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_XARDASWHO_Info()
{
//	AI_Output(hero,self,"Info_Saturas_XARDASWHO_15_01"); //What is this thirteenth magician called?
//	AI_Output(hero,self,"Info_Saturas_XARDASWHO_15_01"); //Wie heißt dieser 13. Zauberer?
	AI_Output(hero,self,"Info_Saturas_XARDASWHO_15_01"); //Jak se ten třináctý mág jmenoval?
//	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_02"); //His name is Xardas. Hardly anybody remembers the old stories about him!
//	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Sein Name ist Xardas. Kaum einer kennt noch die alten Geschichten über ihn!
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Jmenoval se Xardas. Sotva si někdo vzpomene na tu starou historii!
//	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_03"); //The ones who do just call him the NECROMANCER!
//	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_03"); //Die, die es tun, nennen ihn nur den DÄMONENBESCHWÖRER!
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_03"); //Ti kteří si vzpomenou, ho teď nazývají NEKROMANT!
};

//---------------------------------------------------------------------
//	Info XARDASWHY
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHY(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_XARDASWHY_Condition;
	information = Info_Saturas_XARDASWHY_Info;
	important = 0;
	permanent = 0;
//	description = "Why did he leave the Old Camp?";
//	description = "Warum verließ er das Alte Lager?";
	description = "Proč opustil Starý tábor?";
};

func int Info_Saturas_XARDASWHY_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_XARDASWHY_Info()
{
//	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Why did he leave the Old Camp?
//	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Warum verließ er das Alte Lager?
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Proč opustil Starý tábor?
//	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_02"); //He started to investigate the invocation of undead and magical creatures.
//	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Er begann sich intensiv mit der Beschwörung untoter und magischer Wesen zu beschäftigen.
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Začal zkoumat vyvolávání mrtvých a magických stvůr.
//	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Gomez was not the only one who began to worry. Most of the other magicians opposed him as well and his unholy deeds.
//	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Das beunruhigte nicht nur Gomez. Selbst die meisten der anderen Magier lehnten sich gegen ihn und sein unheiliges Treiben auf.
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Gomez nebyl jediný, kdo ho varoval. Většina mágů se postavila proti němu i proti jeho bezbožným praktikám.
//	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_04"); //What happened then?
//	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_04"); //Was passierte dann?
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_04"); //Co se stalo pak?
//	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_05"); //Unlike Gomez, he was no butcher, so he avoided the conflict and left.
//	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_05"); //Er war - anders als Gomez - kein Schlächter, also ging er dem Konflikt aus dem Weg und verließ die anderen.
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_05"); //Narozdíl od Gomeze to nebyl vrahoun, a tak se mu podařilo vyhnout konfliktu a odejít.
};

//---------------------------------------------------------------------
//	Info XARDASWHERE
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHERE(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_XARDASWHERE_Condition;
	information = Info_Saturas_XARDASWHERE_Info;
	important = 0;
	permanent = 0;
//	description = "Where is this magician today?";
//	description = "Wo kann man diesen Zauberer finden?";
	description = "Kde je ten mág dneska?";
};

func int Info_Saturas_XARDASWHERE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_XARDASWHERE_Info()
{
//	AI_Output(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Where is this magician today?
//	AI_Output(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Wo kann man diesen Zauberer finden?
	AI_Output(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Kde je ten mág dneska?
//	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //He lives in seclusion, in his tower in the middle of the Orc land.
//	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //Er lebt heute zurückgezogen in seinem Turm mitten im Orkgebiet.
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //Žije v odloučení ve věži uprostřed země skřetů.
//	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //That's just about the southernmost point of the colony.
//	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //Das ist so ziemlich der südlichste Ort der Kolonie.
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //To je přibližně u nejjižnějšího cípu kolonie.
};

//---------------------------------------------------------------------
//	Info XARDASHELP
//---------------------------------------------------------------------
instance Info_Saturas_XARDASHELP(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_XARDASHELP_Condition;
	information = Info_Saturas_XARDASHELP_Info;
	important = 0;
	permanent = 0;
//	description = "I'll make my way to Xardas and ask him for help!";
//	description = "Ich werde zu Xardas aufbrechen und ihn um Hilfe bitten!";
	description = "Půjdu za Xardasem a požádám ho o pomoc!";
};

func int Info_Saturas_XARDASHELP_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Saturas_XARDASWHO))
	&& (Npc_KnowsInfo(hero,Info_Saturas_XARDASWHY))
	&& (Npc_KnowsInfo(hero,Info_Saturas_XARDASWHERE)))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_XARDASHELP_Info()
{
//	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_01"); //I'll make my way to Xardas and ask him for help!
//	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_01"); //Ich werde zu Xardas aufbrechen und ihn um Hilfe bitten!
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_01"); //Půjdu za Xardasem a požádám ho o pomoc!
//	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_02"); //He's the only one that can help us now.
//	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_02"); //Er ist der einzige, der uns jetzt noch helfen kann.
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_02"); //Je jediný, kdo nám může pomoci.
//	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_03"); //If he knows no way out or doesn't want to help us...
//	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_03"); //Wenn er keinen Rat weiß oder uns nicht helfen will ...
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_03"); //Pokud si ale nebude vědět rady nebo nám nepomůže...
//	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_04"); //HE WILL!
//	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_04"); //ER WIRD!
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_04"); //BUDE!
//	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_05"); //There is one other problem...
//	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_05"); //Da wäre noch ein Problem ...
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_05"); //Je tu ještě jeden problém...

	B_Story_FindXardas();
};

//---------------------------------------------------------------------
//	Info XARDASPROBLEM
//---------------------------------------------------------------------
instance Info_Saturas_XARDASPROBLEM(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_XARDASPROBLEM_Condition;
	information = Info_Saturas_XARDASPROBLEM_Info;
	important = 0;
	permanent = 0;
//	description = "A problem?";
//	description = "Ein Problem?";
	description = "Problém?";
};

func int Info_Saturas_XARDASPROBLEM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_XARDASHELP))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_XARDASPROBLEM_Info()
{
//	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //A problem?
//	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //Ein Problem?
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //Problém?
//	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Yes. Over the years we have tried to get in touch with Xardas several times.
//	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Ja. Wir haben in den vergangenen Jahren öfters versucht, mit Xardas Kontakt aufzunehmen.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Ano. Během let jsme se několikrát pokoušeli s Xardasem spojit.
//	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //But it looks like he prefers to remain undisturbed.
//	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Doch er scheint wohl lieber ungestört zu bleiben.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Zřejmě však nechtěl být vyrušován.
//	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //What does that mean?
//	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Was bedeutet das?
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Co to znamená?
//	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //None of the messengers ever returned from his tower.
//	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //Keiner der Boten kehrte je von seinem Turm zurück.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //Žádný z kurýrů se od něj z věže nevrátil.
//	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //You'll have to find a way to get past his creatures.
//	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Du wirst einen Weg finden müssen, an seinen Kreaturen vorbeizukommen.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Budeš muset vymyslet způsob, jak projít přes ty stvůry.
//	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Looks like this is going to be interesting!
//	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Es scheint also weiterhin interessant zu bleiben!
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Začíná to být zajímavé!

//	B_LogEntry(CH4_FindXardas,"Saturas warned me of the magic creatures of Xardas, the Necromancer. There are writings about the dangers and weaknesses of these creatures in the library of the Magicians of Water. I should take some time to have a look around there.");
//	B_LogEntry(CH4_FindXardas,"Saturas warnte mich vor den magischen Kreaturen des Dämonenbeschwörers Xardas. In der Bibliothek der Wassermagier gibt es Schriften über die Gefahren und Schwächen solcher Wesen. Ich sollte mir etwas Zeit nehmen, um dort herumzustöbern.");
	B_LogEntry(CH4_FindXardas,"Saturas mě varoval před stvůrami nekromanta Xardase. V knihovně mágů Vody jsou spisy o síle i slabinách těchto netvorů. Měl bych si udělat čas a pročíst si je.");
};

//---------------------------------------------------------------------
//	Info XARDASGO
//---------------------------------------------------------------------

instance Info_Saturas_XARDASGO(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = Info_Saturas_XARDASGO_Condition;
	information = Info_Saturas_XARDASGO_Info;
	important = 0;
	permanent = 0;
//	description = "How will I get past his creatures?";
//	description = "Wie werde ich mit seinen Kreaturen fertig?";
	description = "Jak se dostanu přes ty stvůry?";
};

func int Info_Saturas_XARDASGO_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_XARDASPROBLEM))
	{
		return 1;
	};

	return 0;
};

func void Info_Saturas_XARDASGO_Info()
{
//	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_01"); //How will I get past his creatures?
//	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_01"); //Wie werde ich mit seinen Kreaturen fertig?
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_01"); //Jak se dostanu přes ty stvůry?
//	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_02"); //If I knew that, I would tell you!
//	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_02"); //Wenn ich es wüsste, würde ich es dir sagen!
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_02"); //Kdybych věděl, řekl bych ti to!
//	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_03"); //I'd advise you to do some research in our library.
//	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_03"); //Am besten, du betreibst etwas Nachforschung in unserer Bibliothek.
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_03"); //Poradil bych ti, aby ses porozhlédl v naší knihovně.
//	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_04"); //Maybe you'll find something in the old books about the strengths and weaknesses of magically invoked creatures.
//	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_04"); //Vielleicht wissen die alten Bücher etwas über Stärken und Schwächen von magisch beschwörten Kreaturen.
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_04"); //Možná ve starých knihách najdeš něco o síle i slabinách magií vytvořených stvůr.
//	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_05"); //I'll rummage through the library. And don't worry...
//	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_05"); //Ich werde die Bibliothek durchstöbern. Und mach dir keine Sorgen ...
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_05"); //Prohledám knihovnu. A neměj obavy...
//	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_06"); //I'll be back!
//	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_06"); //Ich komme wieder!
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_06"); //Vrátím se!

//	B_LogEntry(CH4_FindXardas,"There are writings about the dangers and weaknesses of these creatures in the library of the Magicians of Water. I should take some time to have a look around there.");
//	B_LogEntry(CH4_FindXardas,"In der Bibliothek der Wassermagier gibt es Schriften über die Gefahren und Schwächen solcher Wesen. Ich sollte mir etwas Zeit nehmen, um dort herumzustöbern.");
	B_LogEntry(CH4_FindXardas,"V knihovně mágů Vody jsou spisy o síle i slabinách těchto netvorů. Měl bych si udělat čas a pročíst si je.");
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schlüsselperson, Saturas ist nicht mehr wichtig
------------------------------------------------------------------------*/

instance KDW_600_Saturas_TIMESUP(C_INFO)
{
	npc = KDW_600_Saturas;
	condition = KDW_600_Saturas_TIMESUP_Condition;
	information = KDW_600_Saturas_TIMESUP_Info;
	important     = 1;
	permanent = 0;
};

func int KDW_600_Saturas_TIMESUP_Condition()
{
	if ((FindOrcShaman == LOG_RUNNING)
	|| (FindOrcShaman == LOG_SUCCESS))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_TIMESUP_Info()
{
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Have you spoken to Xardas?
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Hast du mit Xardas gesprochen?
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Mluvil jsi s Xardasem?
	Info_ClearChoices(KDW_600_Saturas_TIMESUP);
//	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Well...",KDW_600_Saturas_TIMESUP_JA1);
//	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Nun...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Tedy...",KDW_600_Saturas_TIMESUP_JA1);
//	Info_AddChoice(KDW_600_Saturas_TIMESUP,"No...",KDW_600_Saturas_TIMESUP_JA2);
//	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Nein...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Ne...",KDW_600_Saturas_TIMESUP_JA2);
//	Info_AddChoice(KDW_600_Saturas_TIMESUP,"The whole thing's not the way you think...",KDW_600_Saturas_TIMESUP_JA3);
//	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Die ganze Sache ist anders, als du denkst...",KDW_600_Saturas_TIMESUP_JA3);
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Celá ta záležitost není taková, jak si myslíš...",KDW_600_Saturas_TIMESUP_JA3);
};

func void KDW_600_Saturas_TIMESUP_JA1()
{
//	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //Well...
//	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //Nun ...
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //Tedy...
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Well ..? Well what?
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Nun ..? Nun was?
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Tedy...? Co, teda?
	//AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //Äh ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir dürfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};

func void KDW_600_Saturas_TIMESUP_JA2()
{
//	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //No...
//	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //Nein...
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //Ne...
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Why not?
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Warum nicht?
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Proč ne?
//	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //I couldn't get into that area yet...
//	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Ich kam bisher nicht in diese Gegend ...
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Nedokázal jsem se dostat do té oblasti...
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //You need to find him and ask him for advice!
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Du musst ihn finden und um Rat fragen!
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Musíš ho najít a požádat ho o radu!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos(self);
};

func void KDW_600_Saturas_TIMESUP_JA3()
{
//	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //The whole thing's not the way you think...
//	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //Die ganze Sache ist anders, als du denkst ...
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //Celá ta záležitost není taková, jak si myslíš...
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //What do you mean? He needs to find a way how to blow up the ore mound!
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Was heißt anders? Er muss einen Weg finden, wie wir den Erzhaufen sprengen können!
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Co to má znamenat? Musí najít způsob, jak odpálit tu rudnou haldu!
//	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //The ore mound... uh... uhm... It's grown very high!
//	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Der Erzhaufen ... äh ... äh ...  ist mittlerweile sehr groß!
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Ta rudná halda... uch... ehm... Vyrostla pořádně vysoko!
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Find Xardas, he needs to help!
//	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Suche Xardas, er muss uns helfen!
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Najdi Xardase, musí pomoci!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos(self);
};

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////// SLD zu Magier //////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// ****************************************
// 			Aufnahme eines Sld
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHME(C_INFO)
{
	npc = KDW_600_Saturas;
	nr = 10;
	condition = KDW_600_Saturas_HogeAUFNAHME_Condition;
	information = KDW_600_Saturas_HogeAUFNAHME_Info;
	important = 0;
	permanent = 0;
//	description = "Nefarius said I was ready to wear the robe of a Magician of Water.";
//	description = "Nefarius sagte, ich sei bereit die Robe der Wassermagier zu tragen.";
	description = "Nefarius řekl, že už jsem hoden nosit roucho mága Vody.";
};

func int KDW_600_Saturas_HogeAUFNAHME_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Saturas_MURDER))
	&& (Npc_GetTrueGuild(hero)==GIL_SLD))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_HogeAUFNAHME_Info()
{
//	AI_Output(other,self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius said I was ready to wear the robe of a Magician of Water.
//	AI_Output(other,self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius sagte, ich sei bereit die Robe der Wassermagier zu tragen.
	AI_Output(other,self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius řekl, že už jsem hoden nosit roucho mága Vody.

	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */

//	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Then I welcome you to our community.
//	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Dann heiße ich dich in unserer Gemeinschaft willkommen.
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Pak vítej do naší komunity!
//	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01"); //Does that mean that I now belong to the guild of the Magicians of the Water?
//	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01"); //Heißt das, ich gehöre jetzt in die Gilde der Wassermagier?
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01"); //Znamená to, že teď patřím do spolku mágů Vody?
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02"); //Not yet. First you need to take the oath of Water.
//	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02"); //Noch nicht. Du musst erst den Eid des Wassers ablegen.
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02"); //Ještě ne. Nejdříve musíš složit přísahu Vody.
};

// ****************************************
// 			Aufnahme eines Sld - Teil 2
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHMETeil2(C_INFO)
{
	npc = KDW_600_Saturas;
	nr = 10;
	condition = KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information = KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	important = 0;
	permanent = 0;
//	description = "I'm ready to take the oath.";
//	description = "Ich bin bereit, den Eid abzulegen.";
	description = "Jsem připraven složit přísahu.";
};

func int KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{
	if ((Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME))
	&& (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return 1;
	};

	return 0;
};

func void KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc(hero,self);
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //I'm ready to take the oath.
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Ich bin bereit, den Eid abzulegen.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jsem připraven složit přísahu.
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Now speak the words of the oath:
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Sprich nun die Worte des Eides:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Nyní prones slova přísahy:
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //I swear by the might of the gods...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Ich schwöre bei den Mächten der Götter...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Přísahám při boží moci...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //I swear by the might of the gods...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Ich schwöre bei den Mächten der Götter...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Přísahám při boží moci...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //... and by the power of the holy Water...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...und bei der Kraft des heiligen Wassers...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...a na sílu svaté Vody...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //... and by the power of the holy Water...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...und bei der Kraft des heiligen Wassers...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...a na sílu svaté Vody...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //... that my knowledge and my deeds from now on and forever shall be one with the Water...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...že mé vědění a skutky budu od tohoto okamžiku a provždy v jednotě s Vodou...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //... that my knowledge and my deeds from now on and forever shall be one with the Water...
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...že mé vědění a skutky budu od tohoto okamžiku a provždy v jednotě s Vodou...
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //... until my body shall return to the realm of Beliar and the source of my life shall dry out.
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...dokud mé tělo nebude navráceno říši Beliarově a voda mého života nevyschne
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //... until my body shall return to the realm of Beliar and the source of my life shall dry out.
//	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...dokud mé tělo nebude navráceno říši Beliarově a voda mého života nevyschne

//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Wear this robe as a sign of your bond with the holy Water and with Adanos.
//	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Trage diese Robe als Zeichen deiner Verbundenheit zum heiligen Wasser und zu Adanos.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Oblékni si toto roucho na znamení svazku se svatou Vodou a Adanosem.

	CreateInvItem(self,KDW_ARMOR_L);
	B_GiveInvItems(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic(CH4_SldToKdW,LOG_NOTE);
//	B_LogEntry(CH4_SldToKdW,"Saturas has now admitted me to the Circle of Water.");
//	B_LogEntry(CH4_SldToKdW,"Saturas hat mich in den Kreis der Wassermagier aufgenommen.");
	B_LogEntry(CH4_SldToKdW,"Saturas mě přijal do Kruhu vody.");

	AI_StopProcessInfos(self);
};
