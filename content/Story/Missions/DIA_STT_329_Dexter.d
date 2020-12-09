// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_Dexter_Exit(C_INFO)
{
	npc = STT_329_Dexter;
	nr = 999;
	condition = DIA_Dexter_Exit_Condition;
	information = DIA_Dexter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Dexter_Exit_Condition()
{
	return 1;
};

func void DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 					Erste Begrüssung
// **************************************************

instance DIA_Dexter_First(C_INFO)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_First_Condition;
	information = DIA_Dexter_First_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_Dexter_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Dexter_First_Info()
{
//	AI_Output(self,other,"DIA_Dexter_IAmNew_10_00"); //Hey, you! I trade in swampweed and potions from the Sect Camp. Do you want something?
//	AI_Output(self,other,"DIA_Dexter_IAmNew_10_00"); //Hey, du! Ich handele mit Sumpfkraut und Tränken aus dem Sektenlager. Willst du was?
	AI_Output(self,other,"DIA_Dexter_IAmNew_10_00"); //Hej, ty! Obchoduju s drogou z bažiny a lektvary ze Sektovního tábora. Chceš něco?
};

// **************************************************
// 					Kraut
// **************************************************

instance DIA_Dexter_Kraut(C_INFO)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_Kraut_Condition;
	information = DIA_Dexter_Kraut_Info;
	permanent = 0;
//	description = "What is swampweed?";
//	description = "Was ist Sumpfkraut?";
	description = "Co je to droga z bažiny?";
};                       

func int DIA_Dexter_Kraut_Condition()
{
	return 1;
};

func void DIA_Dexter_Kraut_Info()
{
//	AI_Output(other,self,"DIA_Dexter_Kraut_15_00"); //What is swampweed?
//	AI_Output(other,self,"DIA_Dexter_Kraut_15_00"); //Was ist Sumpfkraut?
	AI_Output(other,self,"DIA_Dexter_Kraut_15_00"); //Co je to droga z bažiny?
//	AI_Output(self,other,"DIA_Dexter_Kraut_10_01"); //New here, are you? You can smoke it. Very relaxing for most of us.
//	AI_Output(self,other,"DIA_Dexter_Kraut_10_01"); //Neu hier, was? Man kann es rauchen. Wirkt auf die meisten sehr entspannend.
	AI_Output(self,other,"DIA_Dexter_Kraut_10_01"); //Jsi tady nový, viď? Můžeš ji kouřit. Pro většinu z nás je to velmi uvolňující.
};

// **************************************************
// 					TRADE
// **************************************************

// **************************************************

instance DIA_Dexter_Trade(C_INFO)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_Trade_Condition;
	information = DIA_Dexter_Trade_Info;
	permanent = 1;
//	description = "Show me your goods.";
//	description = "Zeig mir deine Ware.";
	description = "Ukaž mi svoje zboží.";
	Trade = 1;
};                       

func int DIA_Dexter_Trade_Condition()
{
	return 1;
};

func void DIA_Dexter_Trade_Info()
{
//	AI_Output(other,self,"DIA_Dexter_Trade_15_00"); //Show me your goods.
//	AI_Output(other,self,"DIA_Dexter_Trade_15_00"); //Zeig mir deine Ware.
	AI_Output(other,self,"DIA_Dexter_Trade_15_00"); //Ukaž mi svoje zboží.
//	AI_Output(self,other,"DIA_Dexter_Trade_10_01"); //I've got the best stuff here...
//	AI_Output(self,other,"DIA_Dexter_Trade_10_01"); //Ich habe hier nur den besten Stoff ...
	AI_Output(self,other,"DIA_Dexter_Trade_10_01"); //Mám tu nejlepší zboží...

	if (Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
//		B_LogEntry(GE_TraderOC,"Dexter, the Shadow, trades in swampweed and POTIONS from the Sect Camp.");
//		B_LogEntry(GE_TraderOC,"Der Schatten Dexter am Marktplatz handelt mit Sumpfkraut und TRÄNKEN aus dem Sektenlager.");
		B_LogEntry(GE_TraderOC,"Dexter, jeden ze Stínů, obchoduje s drogou z bažin a LEKTVARY ze Sektářského tábora.");

		Dexter_Traded = TRUE;
	};
};

// **************************************************
// 					JOIN OC
// **************************************************
	var int Dexter_GetKalomsRecipe;
// **************************************************

instance DIA_Dexter_JoinOC(C_INFO)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_JoinOC_Condition;
	information = DIA_Dexter_JoinOC_Info;
	permanent = 0;
//	description = "I want to join the Camp - I want to become a Shadow.";
//	description = "Ich will mich dem Lager anschließen - ich will Schatten werden.";
	description = "Chci se přidat k táboru - chci se stát Stínem.";
};                       

func int DIA_Dexter_JoinOC_Condition()
{ 
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
func void DIA_Dexter_JoinOC_Info()
{
//	AI_Output(other,self,"DIA_Dexter_JoinOC_15_00"); //I want to join the Camp - I want to become a Shadow.
//	AI_Output(other,self,"DIA_Dexter_JoinOC_15_00"); //Ich will mich dem Lager anschließen - ich will Schatten werden.
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_00"); //Chci se přidat k táboru - chci se stát Stínem.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_01"); //Oh? You're looking for a chance to prove your worth?
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_01"); //So? Du suchst eine Möglichkeit, dich zu bewähren?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_01"); //Och? Hledáš příležitost ukázat svoji cenu?
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_02"); //Good - you can do me a favor. If you do it well, I'll speak up for you in front of Diego.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_02"); //Gut - du kannst etwas für mich erledigen. Wenn du die Sache gut machst, leg' ich ein gutes Wort bei Diego für dich ein.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_02"); //Dobře - můžeš mi prokázat laskavost. Když to provedeš dobře, přimluvím se za tebe u Diega.
//	AI_Output(other,self,"DIA_Dexter_JoinOC_15_03"); //What is it?
//	AI_Output(other,self,"DIA_Dexter_JoinOC_15_03"); //Um was geht es?
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_03"); //Co to je?
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_04"); //In the Sect Camp there's a man called Kalom. Quite a big shot - one of the Gurus of the sect.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_04"); //Im Sektenlager gibt es einen Mann, der Kalom heißt. Ist ein ziemlich hohes Tier - einer der Gurus der Sekte.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_04"); //V Sektovním táboře je muž jménem Kalom. Vezmu to zkrátka - je to jeden z Guru té sekty.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom is an alchemist. He has the recipe for an effective healing potion.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom ist Alchimist. Er hat das Rezept für einen ziemlich wirkungsvollen Heiltrank.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom je alchymista. Má recept na účinný hojivý lektvar.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_06"); //I'd like to buy the recipe off him, then I can produce it myself.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_06"); //Ich will ihm das Rezept abkaufen, dann kann ich die Dinger selber herstellen.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_06"); //Chtěl bych od něj ten recept koupit, abych si ho mohl připravovat sám.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_07"); //But nobody can get near Kalom.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_07"); //Aber an Kalom kommt niemand ran.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_07"); //Nikdo se ale ke Kalomovi nedostane.
//	AI_Output(other,self,"DIA_Dexter_JoinOC_15_08"); //And what do you expect me to do?
//	AI_Output(other,self,"DIA_Dexter_JoinOC_15_08"); //Und was soll ich da machen?
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_08"); //A co mám v té věci udělat já?
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_09"); //The sect loonies are looking for new people all the time. You're new here. Just pretend you want to be recruited.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_09"); //Die Sektenspinner sind dauernd auf der Suche nach neuen Leuten. Du bist neu hier. Tu einfach so, als wenn du dich anwerben lassen willst.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_09"); //Ti sektářští blázni hledají v současnosti nové lidi. Jsi tady nový. Předstírej, že se chceš nechat přijmout...
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom is one of the Gurus, that means he checks the new candidates. If you get in touch with him, try to get the recipe.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom ist einer der Gurus, das heißt, er prüft die neuen Anwärter. Wenn du mit ihm in Kontakt kommst. versuch, an das Rezept zu kommen.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom je jedním z Guru, což znamená, že zkouší nové uchazeče. Jestli se s ním dostaneš do styku, pokus se dostat ten recept.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_11"); //Whether you want to pay for it or you don't, I don't care.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_10_11"); //Ob du dafür bezahlst oder nicht, ist mir egal.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_11"); //Jestli za to zaplatíš nebo ne, je mi jedno.

	Info_ClearChoices(DIA_Dexter_JoinOC);
//	Info_AddChoice(DIA_Dexter_JoinOC,"Okay - I'll see if I can get the thing.",DIA_Dexter_JoinOC_Ok);
//	Info_AddChoice(DIA_Dexter_JoinOC,"Okay - ich werd sehen, ob ich das Ding kriege.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice(DIA_Dexter_JoinOC,"Dobře - uvidím, jestli tu věc budu moci dostat.",DIA_Dexter_JoinOC_Ok);
//	Info_AddChoice(DIA_Dexter_JoinOC,"Sounds like a difficult business - how much is in it for me?",DIA_Dexter_JoinOC_HowMuch);
//	Info_AddChoice(DIA_Dexter_JoinOC,"Hört sich nach ner schwierigen Sache an - wieviel ist für mich drin?",DIA_Dexter_JoinOC_HowMuch);
	Info_AddChoice(DIA_Dexter_JoinOC,"Vypadá to na obtížný úkol - kolik mi to vynese?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
//	AI_Output(other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Okay - I'll see if I can get the thing.
//	AI_Output(other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Okay - ich werd sehen, ob ich das Ding kriege.
	AI_Output(other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Dobře - uvidím, jestli tu věc budu moci dostat.
	Dexter_GetKalomsRecipe = LOG_RUNNING;

	Log_CreateTopic(CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_KalomsRecipe,LOG_RUNNING);
//	B_LogEntry(CH1_KalomsRecipe,"Dexter, the Shadow at the market, told me to go to the Guru Kalom in the Sect Camp to get a recipe for him.");
//	B_LogEntry(CH1_KalomsRecipe,"Der Schatten Dexter am Marktplatz hat mir aufgetragen, für ihn ein Rezept vom Guru Kalom im Sektenlager zu besorgen.");
	B_LogEntry(CH1_KalomsRecipe,"Dexter, jeden ze Stínů od tržiště, mi řekl, abych se vydal ke guru Kalomovi do Sektářského tábora a získal od něj recept.");
//	B_LogEntry(CH1_KalomsRecipe,"Dexter said to get in I should pretend to be a supporter of the Sect Camp.");
//	B_LogEntry(CH1_KalomsRecipe,"Dexter meinte, ich solle mich als Bewerber ins Sektenlager einschleichen.");
	B_LogEntry(CH1_KalomsRecipe,"Dexter říkal, že se mám vydávat za přívržence Sektářského tábora, abych se dostal dovnitř.");

	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch() 
{
//	AI_Output(other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //Sounds like a difficult business - how much is in it for me?
//	AI_Output(other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //Hört sich nach 'ner schwierigen Sache an - wie viel ist für mich drin?
	AI_Output(other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //Vypadá to na obtížný úkol - kolik mi to vynese?
//	AI_Output(self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //At some point Diego will ask me if you're suitable for us. Just guess what my answer will depend on.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //Irgendwann wird Diego mich fragen, ob du für uns geeignet bist. Rate mal, wovon meine Antwort abhängen wird.
	AI_Output(self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //Nějaké body ve chvíli, když se mě Diego zeptá, jestli máš pro nás cenu. A hádej, na čem bude záviset moje odpověď.

//	Info_AddChoice(DIA_Dexter_JoinOC,"Maybe I'll have to pay for the recipe - give me 50 ore in advance.",DIA_Dexter_JoinOC_Advance);
//	Info_AddChoice(DIA_Dexter_JoinOC,"Es kann sein, dass ich das Rezept bezahlen muss - gib mir 50 Erz Vorschuß.",DIA_Dexter_JoinOC_Advance);
	Info_AddChoice(DIA_Dexter_JoinOC,"Možná budu muset za ten recept zaplatit - dej mi 50 nugetů jako zálohu.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
//	AI_Output(other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Maybe I'll have to pay for the recipe - give me 50 ore as an advance payment.
//	AI_Output(other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Es kann sein, dass ich für das Rezept bezahlen muss - gib mir 50 Erz als Vorschuss.
	AI_Output(other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Možná budu muset za ten recept zaplatit - dej mi 50 nugetů jako zálohu.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Forget it.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Vergiss es.
	AI_Output(self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Zapomeň na to!

//	Info_AddChoice(DIA_Dexter_JoinOC,"No ore - no recipe!",DIA_Dexter_JoinOC_Threat);
//	Info_AddChoice(DIA_Dexter_JoinOC,"Kein Erz - kein Rezept!",DIA_Dexter_JoinOC_Threat);
	Info_AddChoice(DIA_Dexter_JoinOC,"Žádná ruda, žádný recept!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
//	AI_Output(other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //No ore - no recipe!
//	AI_Output(other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //Kein Erz - kein Rezept!
	AI_Output(other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //Žádná ruda, žádný recept!
//	AI_Output(self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //Well then! We can talk about the ore as soon as you have the recipe.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //Na schön! Über das Erz können wir reden, wenn du das Rezept hast.
	AI_Output(self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //Dobrá! O rudě se můžeme začít bavit, až budeš mít ten recept.

//	Info_AddChoice(DIA_Dexter_JoinOC,"No! I want to see ore right now or you can get your recipe yourself.",DIA_Dexter_JoinOC_OreNowOrElse);
//	Info_AddChoice(DIA_Dexter_JoinOC,"Ich will jetzt Erz sehen, oder du kannst dein Rezept selber abholen.",DIA_Dexter_JoinOC_OreNowOrElse);
	Info_AddChoice(DIA_Dexter_JoinOC,"Ne! Chci to vidět teď a pak si můžeš ten recept nechat.",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
//	AI_Output(other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //No! I want to see ore right now or you can get your recipe yourself.
//	AI_Output(other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //Nein! Ich will jetzt Erz sehen, oder du kannst dir dein Rezept selber holen.
	AI_Output(other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //Ne! Chci to vidět teď a pak si můžeš ten recept nechat.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //There's enough other newcomers, I think I should give the job to one of them...
//	AI_Output(self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Es gibt noch genug andere Neue, ich denke, ich sollte den Auftrag einem von denen geben ...
	AI_Output(self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Je tady spousta jiných nováčků.Myslím, že bych ten úkol mohl dát někomu z nich...

//	Info_AddChoice(DIA_Dexter_JoinOC,"Okay! Let's just forget about the whole thing.",DIA_Dexter_JoinOC_ForgetIt);
//	Info_AddChoice(DIA_Dexter_JoinOC,"Gut! Vergessen wir die Sache.",DIA_Dexter_JoinOC_ForgetIt);
	Info_AddChoice(DIA_Dexter_JoinOC,"Dobře! Zapomeňme na celou tu věc.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
//	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //Okay! Let's just forget about the whole thing.
//	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //Gut! Vergessen wir die Sache.
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //Dobře! Zapomeňme na celou tu věc.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Not so fast! I just wanted to know how far you'd go... 50 ore is quite a lot for a newcomer, don't you think?
//	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Nicht so schnell! Wollte nur wissen, wie weit du gehst ... 50 Erz ist ziemlich viel für einen Neuen, was denkst du?
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Ne tak rychle! Chtěl jsem jen vědět, jak daleko bys zašel... 50 nugetů je pro nováčka docela dost, nemyslíš?
//	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //That sounds better.
//	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //Klingt schon besser.
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //To zní líp.
//	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //Okay, okay, I've just got 50 ore nuggets spare here. Don't let me down, kid!
//	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //Gut, gut, 50 Erzbrocken kann ich gerade noch entbehren. Enttäusch mich nicht, Kleiner!
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //Dobře, dobře, mám tady 50 nugetů rudy uložených stranou. Ale nepokoušej se mě podvést, mladej!

	Dexter_GetKalomsRecipe = LOG_RUNNING;

	Log_CreateTopic(CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_KalomsRecipe,LOG_RUNNING);
//	B_LogEntry(CH1_KalomsRecipe,"Dexter, the Shadow at the market, told me to go to the Guru Kalom in the Sect Camp to get a recipe for him.");
//	B_LogEntry(CH1_KalomsRecipe,"Der Schatten Dexter am Marktplatz hat mir aufgetragen, für ihn ein Rezept vom Guru Kalom im Sektenlager zu besorgen.");
	B_LogEntry(CH1_KalomsRecipe,"Dexter, jeden ze Stínů od tržiště, mi řekl, abych se vydal ke guru Kalomovi do Sektářského tábora a získal od něj recept.");
//	B_LogEntry(CH1_KalomsRecipe,"Dexter said to get in I should pretend to be a supporter of the Sect Camp.");
//	B_LogEntry(CH1_KalomsRecipe,"Dexter meinte, ich solle mich als Bewerber ins Sektenlager einschleichen.");
	B_LogEntry(CH1_KalomsRecipe,"Dexter říkal, že se mám vydávat za přívržence Sektářského tábora, abych se dostal dovnitř.");

	CreateInvItems(self,itminugget, 50);
	B_GiveInvItems(self,other,itminugget, 50);

	Info_ClearChoices(DIA_Dexter_JoinOC);
};

// **************************************************
// 					Where ST
// **************************************************
var int Dexter_PsiCamp;
// **************************************************

instance DIA_Dexter_WhereST(C_INFO)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_WhereST_Condition;
	information = DIA_Dexter_WhereST_Info;
	permanent = 1;
//	description = "Where is the Sect Camp?";
//	description = "Wo ist das Sektenlager?";
	description = "Kde je Sektovní tábor?";
};                       

func int DIA_Dexter_WhereST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Dexter_WhereST_Info()
{
//	AI_Output(other,self,"DIA_Dexter_WhereST_15_00"); //Where is the Sect Camp?
//	AI_Output(other,self,"DIA_Dexter_WhereST_15_00"); //Wo ist das Sektenlager?
	AI_Output(other,self,"DIA_Dexter_WhereST_15_00"); //Kde je Sektovní tábor?
//	AI_Output(self,other,"DIA_Dexter_WhereST_10_01"); //Leave the Camp through the south exit, then head eastwards. You'd better take a map -
//	AI_Output(self,other,"DIA_Dexter_WhereST_10_01"); //Durch den Südausgang aus dem Lager raus, dann immer östlich halten. Am besten besorgst du dir eine Karte -
	AI_Output(self,other,"DIA_Dexter_WhereST_10_01"); //Vyjdeš z tábora jižním východem, pak se dáš na východ. Měl by sis vzít mapu.

	if (Npc_HasItems(self,ItWrWorldmap) >0) //Björn
		{ //Björn
//			AI_Output(self,other,"DIA_Dexter_WhereST_10_02"); //I've got one here for 50 ore...
//			AI_Output(self,other,"DIA_Dexter_WhereST_10_02"); //Ich hab' eine da für 50 Erz ...
			AI_Output(self,other,"DIA_Dexter_WhereST_10_02"); //Mám tady 50 nugetů...
		}; //Björn

//	AI_Output(other,self,"DIA_Dexter_WhereST_15_02"); //The south exit is the collapsed tower, isn't it?
//	AI_Output(other,self,"DIA_Dexter_WhereST_15_02"); //Der Südausgang ist der umgestürzte Turm, richtig?
	AI_Output(other,self,"DIA_Dexter_WhereST_15_02"); //Jižní východ je ta zhroucená věž, ne?
//	AI_Output(self,other,"DIA_Dexter_WhereST_10_03"); //Exactly.
//	AI_Output(self,other,"DIA_Dexter_WhereST_10_03"); //Stimmt genau.
	AI_Output(self,other,"DIA_Dexter_WhereST_10_03"); //Přesně tak.

	if !Dexter_PsiCamp
	{
//		B_LogEntry(CH1_KalomsRecipe,"The Sect Camp is to the east of the Old Camp");
//		B_LogEntry(CH1_KalomsRecipe,"Das Sektenlager befindet sich östlich vom Alten Lager");
		B_LogEntry(CH1_KalomsRecipe,"Sektářský tábor leží na východ od Starého tábora.");
		Dexter_PsiCamp = TRUE;
	};
};

// **************************************************
// 					SUCCESS
// **************************************************

instance DIA_Dexter_KalomsRecipeSuccess(C_INFO)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_KalomsRecipeSuccess_Condition;
	information = DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent = 1;
//	description = "I have the recipe you wanted!";
//	description = "Ich hab' das Rezept, das du wolltest!";
	description = "Mám ten recept, co jsi chtěl!";
};                       

func int DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if ((Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems(other,KalomsRecipe) > 0))
	{
		return 1;
	};
};

func void DIA_Dexter_KalomsRecipeSuccess_Info()
{
//	AI_Output(other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //I have the recipe you wanted!
//	AI_Output(other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //Ich hab' das Rezept, das du wolltest!
	AI_Output(other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //Mám ten recept, co jsi chtěl!
//	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //Very good! Show it to me!
//	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //Sehr gut! Zeig her!
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //Výborně! Ukaž mi ho!

	B_UseFakeScroll();

//	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Good! Now I can produce the potions myself.
//	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Gut! Jetzt kann ich die Tränke selber herstellen.
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Dobře! Teď si budu moci připravovat lektvar sám.
//	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //You are a good man! I'll tell Diego about it!
//	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //Bist ein guter Mann! Werde Diego von der Sache erzählen!
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //Jsi dobrý chlap! Řeknu to Diegovi!
//	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //Here you go - take that - for your efforts...
//	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //Hier - nimm das - für deine Mühen...
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //Tady - vezmi si - za svoji snahu...

	CreateInvItems(other,itminugget,50);

	B_GiveInvItems(other,self,KalomsRecipe,1);

	Dexter_GetKalomsRecipe = LOG_SUCCESS;

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe,LOG_SUCCESS);
//		B_LogEntry(CH1_KalomsRecipe,"Dexter was impressed. I'm sure he'll speak to Diego in my favor.");
//		B_LogEntry(CH1_KalomsRecipe,"Dexter war beeindruckt. Seine Stimme bei Diego ist mir sicher.");
		B_LogEntry(CH1_KalomsRecipe,"Na Dextera to udělalo dojem. Jsem si jistý, že se za mě u Diega přimluví.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe,LOG_SUCCESS);
//		B_LogEntry(CH1_KalomsRecipe,"Dexter was impressed. But that's useless - I can't become a Shadow any more");
//		B_LogEntry(CH1_KalomsRecipe,"Dexter war beeindruckt. Leider bringt mir das nichts mehr, denn Schatten kann ich nicht mehr werden");
		B_LogEntry(CH1_KalomsRecipe,"Na Dextera to udělalo dojem. Nic z toho však nebudu mít - už se nikdy nebudu moci stát Stínem.");
	};
	B_GiveXP(XP_DexterKalom);
};

