// ************************ EXIT **************************

instance Nov_1300_Talas_Exit(C_INFO)
{
	npc = Nov_1300_Talas;
	nr = 999;
	condition = Nov_1300_Talas_Exit_Condition;
	information = Nov_1300_Talas_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Nov_1300_Talas_Exit_Condition()
{
	return 1;
};

func void Nov_1300_Talas_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ***************************** INFOS ****************************************//

instance Nov_1300_Talas_UR(C_INFO)
{
	npc = Nov_1300_Talas;
	condition = Nov_1300_Talas_UR_Condition;
	information = Nov_1300_Talas_UR_Info;
	important = 0;
	permanent = 0;
//	description = "You're Talas, the one who was mugged.";
//	description = "Du bist Talas, der überfallen wurde";
	description = "Ty jsi Talas, ten co ho přepadli.";
};

func int Nov_1300_Talas_UR_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_CorKalom_BringBook))
	&& (CorKalom_BringBook != LOG_SUCCESS))
	{
		return 1;
	};

	return 0;
};

func void Nov_1300_Talas_UR_Info()
{
//	AI_Output(other,self,"Nov_1300_Talas_UR_Info_15_01"); //You're Talas, the one who was mugged.
//	AI_Output(other,self,"Nov_1300_Talas_UR_Info_15_01"); //Du bist Talas, der überfallen wurde.
	AI_Output(other, self, "Nov_1300_Talas_UR_Info_15_01"); //Ty jsi Talas, ten co ho přepadli.
//	AI_Output(self,other,"Nov_1300_Talas_UR_Info_02_02"); //Leave me alone, I don't want to talk about it!
//	AI_Output(self,other,"Nov_1300_Talas_UR_Info_02_02"); //Lass mich in Ruhe, ich will nicht darüber reden!
	AI_Output(self, other, "Nov_1300_Talas_UR_Info_02_02"); //Nech mě na pokoji, nechci o tom mluvit!
};

// ***************************** INFOS ****************************************//

instance Nov_1300_Talas_HELP(C_INFO)
{
	npc = Nov_1300_Talas;
	condition = Nov_1300_Talas_HELP_Condition;
	information = Nov_1300_Talas_HELP_Info;
	important = 0;
	permanent = 0;
//	description = "I can help you to bring the almanac back.";
//	description = "Ich kann dir helfen, den Almanach zurückbringen.";
	description = "Pomůžu ti přinést zpátky ten almanach.";
};

func int Nov_1300_Talas_HELP_Condition()
{
	if ((Npc_KnowsInfo(hero, Nov_1300_Talas_UR))
	&& (CorKalom_BringBook != LOG_SUCCESS))
	{
		return 1;
	};

	return 0;
};

func void Nov_1300_Talas_HELP_Info()
{
//	AI_Output(other,self,"Nov_1300_Talas_HELP_Info_15_01"); //I can help you to bring the almanac back.
//	AI_Output(other,self,"Nov_1300_Talas_HELP_Info_15_01"); //Ich kann dir helfen, den Almanach zurückbringen.
	AI_Output(other, self, "Nov_1300_Talas_HELP_Info_15_01"); //Pomůžu ti přinést zpátky ten almanach.
//	AI_Output(self,other,"Nov_1300_Talas_HELP_Info_02_02"); //Really? I was mugged by goblins! And now I'm supposed to go there and get the book back!
//	AI_Output(self,other,"Nov_1300_Talas_HELP_Info_02_02"); //Wirklich? Goblins haben mich überfallen! Und jetzt soll ich wieder zu ihnen gehen und das Buch zurückbringen!
	AI_Output(self, other, "Nov_1300_Talas_HELP_Info_02_02"); //Opravdu? Přepadli mě goblini! A teď se po mně chce, abych za nimi šel a přinesl tu knihu zpátky!
//	AI_Output(self,other,"Nov_1300_Talas_HELP_Info_02_03"); //I have a suggestion to make: I'll show you the way to the almanac, so you can get it back.
//	AI_Output(self,other,"Nov_1300_Talas_HELP_Info_02_03"); //Ich mache dir einen Vorschlag. Ich zeige dir den Weg zum Almanach und du holst ihn zurück.
	AI_Output(self, other, "Nov_1300_Talas_HELP_Info_02_03"); //Mám pro tebe návrh. Ukážu ti cestu k almanachu, abys ho mohl dostat nazpět.

	Info_ClearChoices(Nov_1300_Talas_HELP);
//	Info_AddChoice(Nov_1300_Talas_HELP,"Agreed.",Nov_1300_Talas_HELP_OK);
//	Info_AddChoice(Nov_1300_Talas_HELP,"Einverstanden",Nov_1300_Talas_HELP_OK);
	Info_AddChoice(Nov_1300_Talas_HELP, "Souhlasím.", Nov_1300_Talas_HELP_OK);
//	Info_AddChoice(Nov_1300_Talas_HELP,"That'll cost you 30 ore.",Nov_1300_Talas_HELP_BRING);
//	Info_AddChoice(Nov_1300_Talas_HELP,"Das kostet dich 30 Erz",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice(Nov_1300_Talas_HELP, "Bude tě to stát 30 nugetů.", Nov_1300_Talas_HELP_BRING);
//	Info_AddChoice(Nov_1300_Talas_HELP,"Give me 50 ore and I'm in.",Nov_1300_Talas_HELP_MORE);
//	Info_AddChoice(Nov_1300_Talas_HELP,"Gib mir 50 Erz und ich bin dabei",Nov_1300_Talas_HELP_MORE);
	Info_AddChoice(Nov_1300_Talas_HELP, "Dej mi 50 nugetů a já budu přitom.", Nov_1300_Talas_HELP_MORE);
};

func void Nov_1300_Talas_HELP_OK()
{
//	AI_Output(other,self,"Nov_1300_Talas_HELP_OK_15_01"); //Agreed.
//	AI_Output(other,self,"Nov_1300_Talas_HELP_OK_15_01"); //Einverstanden.
	AI_Output(other, self, "Nov_1300_Talas_HELP_OK_15_01"); //Souhlasím.
//	AI_Output(self,other,"Nov_1300_Talas_HELP_OK_02_02"); //Okay, we can leave as soon as you're ready.
//	AI_Output(self,other,"Nov_1300_Talas_HELP_OK_02_02"); //In Ordnung, wir können losgehen, sobald du bereit bist.
	AI_Output(self, other, "Nov_1300_Talas_HELP_OK_02_02"); //Dobře, až budeš připraven, můžeme vyrazit.
	Info_ClearChoices(Nov_1300_Talas_HELP);
};

func void Nov_1300_Talas_HELP_BRING()
{
//	AI_Output(other,self,"Nov_1300_Talas_HELP_BRING_15_01"); //That'll cost you 30 ore.
//	AI_Output(other,self,"Nov_1300_Talas_HELP_BRING_15_01"); //Das kostet dich 30 Erz.
	AI_Output(other, self, "Nov_1300_Talas_HELP_BRING_15_01"); //Bude tě to stát 30 nugetů.
//	AI_Output(self,other,"Nov_1300_Talas_HELP_BRING_02_02"); //Okay, we can leave as soon as you're ready.
//	AI_Output(self,other,"Nov_1300_Talas_HELP_BRING_02_02"); //In Ordnung, wir können losgehen, sobald du bereit bist.
	AI_Output(self, other, "Nov_1300_Talas_HELP_BRING_02_02"); //Dobře, až budeš připraven, můžeme vyrazit.
	CreateInvItems(self, ItMiNugget, 30);
	B_GiveInvItems(self, hero, ItMiNugget, 30);
	Info_ClearChoices(Nov_1300_Talas_HELP);
};

func void Nov_1300_Talas_HELP_MORE()
{
//	AI_Output(other,self,"Nov_1300_Talas_HELP_MORE_15_01"); //Give me 50 ore and I'm in.
//	AI_Output(other,self,"Nov_1300_Talas_HELP_MORE_15_01"); //Gib mir 50 Erz und ich bin dabei.
	AI_Output(other, self, "Nov_1300_Talas_HELP_MORE_15_01"); //Dej mi 50 nugetů a já budu přitom.
//	AI_Output(self,other,"Nov_1300_Talas_HELP_MORE_02_02"); //What? That's robbery! Alright then, tell me when you're ready.
//	AI_Output(self,other,"Nov_1300_Talas_HELP_MORE_02_02"); //Was? Du beraubst mich. Nun gut, sag mir Bescheid, wenn du so weit bist.
	AI_Output(self, other, "Nov_1300_Talas_HELP_MORE_02_02"); //Cože? To je krádež! Dobrá teda, řekni mi, až budeš připraven.
	CreateInvItems(self, ItMiNugget, 50);
	B_GiveInvItems(self, hero, ItMiNugget, 50);
	Info_ClearChoices(Nov_1300_Talas_HELP);
};

// ***************************** INFOS ****************************************//

instance Nov_1300_Talas_READY(C_INFO)
{
	npc = Nov_1300_Talas;
	condition = Nov_1300_Talas_READY_Condition;
	information = Nov_1300_Talas_READY_Info;
	important = 0;
	permanent = 0;
//	description = "I'm ready, we can leave now.";
//	description = "Ich bin bereit, wir können losgehen";
	description = "Jsem připraven, můžeme vyrazit.";
};

func int Nov_1300_Talas_READY_Condition()
{
	if ((Npc_KnowsInfo(hero, Nov_1300_Talas_HELP))
	&& (CorKalom_BringBook != LOG_SUCCESS))
	{
		return 1;
	};

	return 0;
};

func void Nov_1300_Talas_READY_Info()
{
//	AI_Output(other,self,"Nov_1300_Talas_READY_Info_15_01"); //I'm ready, we can leave now.
//	AI_Output(other,self,"Nov_1300_Talas_READY_Info_15_01"); //Ich bin bereit, wir können losgehen.
	AI_Output(other, self, "Nov_1300_Talas_READY_Info_15_01"); //Jsem připraven, můžeme vyrazit.
//	AI_Output(self,other,"Nov_1300_Talas_READY_Info_02_02"); //Okay. Follow me.
//	AI_Output(self,other,"Nov_1300_Talas_READY_Info_02_02"); //In Ordnung. Folge mir.
	AI_Output(self, other, "Nov_1300_Talas_READY_Info_02_02"); //Dobře. Pojď za mnou.

//	B_LogEntry(CH2_Book,"I offered Talas to get the almanac back for him. He wants to lead me to the place where the book is.");
//	B_LogEntry(CH2_Book,"Ich habe Talas angeboten, für ihn den Almanach wiederzubeschaffen. Er will mich zum Aufenthaltsort des Buches führen.");
	B_LogEntry(CH2_Book, "Nabídl jsem Talasovi, že pro něj získám zpět rukopis. Chce mě dovést na místo, kde kniha je.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self, "GOBBOCAVE");
	AI_StopProcessInfos(self);
};

// ***************************** AN DER BRÜCKE ****************************************//
instance Nov_1300_Talas_BRIDGE(C_INFO)
{
	npc = Nov_1300_Talas;
	condition = Nov_1300_Talas_BRIDGE_Condition;
	information = Nov_1300_Talas_BRIDGE_Info;
	important = 1;
	permanent = 0;
};

func int Nov_1300_Talas_BRIDGE_Condition()
{
	if ((Npc_KnowsInfo(hero, Nov_1300_Talas_READY))
	&& (Npc_GetDistToWP(self, "LOCATION_29_02") < 1000))
	{
		return 1;
	};

	return 0;
};

func void Nov_1300_Talas_BRIDGE_Info()
{
//	AI_Output(self,other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Those damn little beasts live in a cave behind this bridge! Be careful!
//	AI_Output(self,other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Hinter dieser Brücke ist die Höhle dieser verdammten kleinen Biester! Pass auf dich auf!
	AI_Output(self, other, "Nov_1300_Talas_BRIDGE_Info_02_01"); //Tyhle proklaté malé bestie žijí v jeskyni pod mostem. Buď opatrný!
//	AI_Output(other,self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //You're not coming with me?
//	AI_Output(other,self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //Du kommst nicht mit?
	AI_Output(other, self, "Nov_1300_Talas_BRIDGE_Info_15_02"); //Ty nepůjdeš se mnou?
//	AI_Output(self,other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //I'll wait here and... ahem... cover our retreat.
//	AI_Output(self,other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //Ich werde hier auf dich warten und... ähem... unseren Rückzug decken
	AI_Output(self, other, "Nov_1300_Talas_BRIDGE_Info_02_03"); //Počkám tady a... budu... krýt naši únikovou cestu.

//	B_LogEntry(CH2_Book,"Now we're standing in front of a goblin cave. This coward novice really wants me to go in there on my own.");
//	B_LogEntry(CH2_Book,"Wir stehen nun vor dem Eingang einer Goblinhöhle. Dieser Feigling von Novize will mich doch tatsächlich alleine hinein gehen lassen.");
	B_LogEntry(CH2_Book, "Stojíme před jeskyní goblinů. Ten zbabělý novic vážně chce, abych šel dovnitř sám.");
};

// ***************************** ZURÜCK INS LAGER ****************************************//
instance Nov_1300_Talas_BACK(C_INFO)
{
	npc = Nov_1300_Talas;
	condition = Nov_1300_Talas_BACK_Condition;
	information = Nov_1300_Talas_BACK_Info;
	important = 1;
	permanent = 0;
};

func int Nov_1300_Talas_BACK_Condition()
{
	if ((Npc_KnowsInfo(hero, Nov_1300_Talas_BRIDGE))
	&& (Npc_HasItems(hero, ItWrFokusbuch)))
	{
		return 1;
	};

	return 0;
};

func void Nov_1300_Talas_BACK_Info()
{
//	AI_Output(self,other,"Nov_1300_Talas_BACK_Info_02_01"); //You have the almanac! Well done. Let's go back to the Camp.
//	AI_Output(self,other,"Nov_1300_Talas_BACK_Info_02_01"); //Du hast den Almanach! Gut gemacht. Gehen wir wieder zurück ins Lager.
	AI_Output(self, other, "Nov_1300_Talas_BACK_Info_02_01"); //Máš ten almanach! Výborně! Pojďme zpátky do tábora.

//	B_LogEntry(CH2_Book,"I've found the almanac and will take it to the swamp camp together with Talas.");
//	B_LogEntry(CH2_Book,"Ich habe den Almanach gefunden und werde ihn zusammen mit Talas ins Sumpflager bringen.");
	B_LogEntry(CH2_Book, "Našel jsem rukopis a společně s Talasem jej odneseme do tábora v bažinách.");

	Npc_ExchangeRoutine(self, "RETURNTOCAMP");
	AI_StopProcessInfos(self);
};

// ***************************** Zurück im Lager ****************************************//
instance Nov_1300_Talas_RETURNED(C_INFO)
{
	npc = Nov_1300_Talas;
	condition = Nov_1300_Talas_RETURNED_Condition;
	information = Nov_1300_Talas_RETURNED_Info;
	important = 1;
	permanent = 0;
};

func int Nov_1300_Talas_RETURNED_Condition()
{
	if ((Npc_KnowsInfo(hero, Nov_1300_Talas_BACK))
	&& (Npc_HasItems(hero, ItWrFokusbuch))
	&& (Npc_GetDistToWP(self, "PSI_START") < 1000)
	&& (CorKalom_BringBook != LOG_SUCCESS))
	{
		return 1;
	};

	return 0;
};

func void Nov_1300_Talas_RETURNED_Info()
{
//	AI_Output(self,other,"Info_Talas_RETURNED_02_01"); //We're back. You'd better take the almanac to Cor Kalom right away.
//	AI_Output(self,other,"Info_Talas_RETURNED_02_01"); //Hier sind wir wieder. Am besten du bringst den Almanach gleich zu Cor Kalom.
	AI_Output(self, other, "Info_Talas_RETURNED_02_01"); //Jsme zpátky. Předej ten almanach Corovi Kalomovi raději hned.
//	AI_Output(other,self,"Info_Talas_RETURNED_15_02"); //Just watch out you don't stress yourself out.
//	AI_Output(other,self,"Info_Talas_RETURNED_15_02"); //Pass nur auf, dass du dich nicht überarbeitest.
	AI_Output(other, self, "Info_Talas_RETURNED_15_02"); //Dávej pozor, aby ses nevysílil.
//	AI_Output(self,other,"Info_Talas_RETURNED_02_03"); //Don't worry, I sure won't! There's no need to worry about me.
//	AI_Output(self,other,"Info_Talas_RETURNED_02_03"); //Keine Angst, darauf achte ich sogar sehr! Mach dir um mich keine Sorgen.
	AI_Output(self, other, "Info_Talas_RETURNED_02_03"); //Neměj obavy, nevysílím! Nemusíš si se mnou dělat starosti.

//	B_LogEntry(CH2_Book,"Now we're back in the swamp camp. Talas is the biggest coward I've ever met. I'll take the book to Cor Kalom myself.");
//	B_LogEntry(CH2_Book,"Wir sind wieder im Sumpflager. Talas ist der größte Drückeberger, den ich kenne. Ich werde das Buch selber zu Cor Kalom bringen.");
	B_LogEntry(CH2_Book, "Už jsme zpět v táboře v bažinách. Talas je největší zbabělec, jakého jsem kdy potkal. Předám Cor Kalomovi rukopis sám.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "BackInCamp");
	AI_StopProcessInfos(self);
};

// ***************************** zum OGY ****************************************//

instance Nov_1300_Talas_OGY(C_INFO)
{
	npc = Nov_1300_Talas;
	condition = Nov_1300_Talas_OGY_Condition;
	information = Nov_1300_Talas_OGY_Info;
	important = 0;
	permanent = 0;
//	description = "Cor Angar sent me.";
//	description = "Cor Angar schickt mich.";
	description = "Poslal mě Cor Angar.";
};

func int Nov_1300_Talas_OGY_Condition()
{
	if (Npc_KnowsInfo(hero, GUR_1202_CorAngar_WHERE))
	{
		return 1;
	};

	return 0;
};

func void Nov_1300_Talas_OGY_Info()
{
//	AI_Output(other,self,"Nov_1300_Talas_OGY_15_01"); //Cor Angar sent me. He said you should take me to the Orc cemetery so I can find Baal Lukor and his templars.
//	AI_Output(other,self,"Nov_1300_Talas_OGY_15_01"); //Cor Angar schickt mich. Er sagt, du sollst mich zum Ork-Friedhof bringen, damit ich dort Baal Lukor und seine Templer suchen kann.
	AI_Output(other, self, "Nov_1300_Talas_OGY_15_01"); //Poslal mě Cor Angar. Řekl, že mě máš dovést k skřetímu pohřebišti, abych tam našel Baala Lukora a jeho templáře.
//	AI_Output(self,other,"Nov_1300_Talas_OGY_02_02"); //So I'm the gofer again. Damn!!! I just should never have lost that almanac...
//	AI_Output(self,other,"Nov_1300_Talas_OGY_02_02"); //Schon wieder bin ich der Laufbursche. Verdammt!!! Ich hätte den Almanach einfach nicht verlieren dürfen...
	AI_Output(self, other, "Nov_1300_Talas_OGY_02_02"); //Tak jsem zase poslíček. Proklatě!!! Neměl jsem ten almanach nikdy ztratit...
//	AI_Output(self,other,"Nov_1300_Talas_OGY_02_03"); //Well then, come with me.
//	AI_Output(self,other,"Nov_1300_Talas_OGY_02_03"); //Na gut, komm mit.
	AI_Output(self, other, "Nov_1300_Talas_OGY_02_03"); //Tak dobrá, pojď se mnou.

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "OGY");
};

// ***************************** am OGY ****************************************//

instance Nov_1300_Talas_BACKAGAIN(C_INFO)
{
	npc = Nov_1300_Talas;
	condition = Nov_1300_Talas_BACKAGAIN_Condition;
	information = Nov_1300_Talas_BACKAGAIN_Info;
	important = 1;
	permanent = 0;
};

func int Nov_1300_Talas_BACKAGAIN_Condition()
{
	if (Npc_GetDistToWP(self, "OW_PATH_011") < 1000)
	{
		return 1;
	};

	return 0;
};

func void Nov_1300_Talas_BACKAGAIN_Info()
{
//	AI_Output(self,other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //I'm not taking you across this bridge, I don't want to commit suicide.
//	AI_Output(self,other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //Auch hier werde ich dich nicht über die Brücke begleiten, denn ich bin nicht lebensmüde.
	AI_Output(self, other, "Nov_1300_Talas_BACKAGAIN_Info_02_01"); //Přes ten most tě nepřevedu, nechci spáchat sebevraždu.
//	AI_Output(self,other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //You must be mad to go in there, even Baal Lukor and his templars didn't get out again.
//	AI_Output(self,other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Du musst verrückt sein, dort hinein zu gehen, wenn selbst Baal Lukor und seine Templer nicht wieder herauskamen.
	AI_Output(self, other, "Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Musíš být blázen, když tam jdeš. Ani Baal Lukor se svými templáři se už nevrátil.
//	AI_Output(other,self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //We'll see what happens. Go back to the Camp, I'll be there later.
//	AI_Output(other,self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Das werden wir ja sehen. Geh zurück zum Lager, ich komme nach.
	AI_Output(other, self, "Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Uvidíme, co se přihodí. Vrať se do tábora, já přijdu později.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "ReturnToCampAgain");
};
