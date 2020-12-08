// ************************************************************
//	  EXIT 
// ************************************************************

instance Info_Thorus_EXIT(C_INFO)
{
	npc = GRD_200_THORUS;
	nr = 999;
	condition = Info_Thorus_EXIT_Condition;
	information = Info_Thorus_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Info_Thorus_EXIT_Condition()
{
	return 1;
};

func void Info_Thorus_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

// ************************************************************
// Nur Gomez Leute in Burg
// ************************************************************

instance Info_Thorus_EnterCastle(C_INFO) //E2
{
	npc = GRD_200_THORUS;
	nr = 3;
	condition = Info_Thorus_EnterCastle_Condition;
	information = Info_Thorus_EnterCastle_Info;
	permanent = 0;
//	description = "You don't look as though you'd let just anyone get into the castle.";
//	description = "Du siehst nicht so aus, als wenn du jeden in die Burg lassen würdest.";
	description = "Nevypadáš, jako bys každého pustil na hrad.";
};                       

func int Info_Thorus_EnterCastle_Condition()
{ 
	if !C_NpcBelongsToOldCamp (other)
	&& (Diego_GomezAudience == FALSE)
	{
		return 1;
	};
};
func void Info_Thorus_EnterCastle_Info()
{ 
//	AI_Output(other,self,"Info_EnterCastle_15_00"); //You don't look as though you'd let just anyone get into the castle.
//	AI_Output(other,self,"Info_EnterCastle_15_00"); //Du siehst nicht so aus, als wenn du jeden in die Burg lassen würdest.
	AI_Output(other,self,"Info_EnterCastle_15_00"); //Nevypadáš, jako bys každého pustil na hrad.
//	AI_Output(self,other,"Info_EnterCastle_09_01"); //Only Gomez' men are allowed in the castle.
//	AI_Output(self,other,"Info_EnterCastle_09_01"); //Nur Gomez' Leuten ist es erlaubt, die Burg zu betreten.
	AI_Output(self,other,"Info_EnterCastle_09_01"); //Na hrad smějí jenom Gomezovi muži.
};

// ************************************************************
// Ich will für Gomez arbeiten
// ************************************************************

instance Info_Thorus_WorkForGomez(C_INFO) //E2
{
	npc = GRD_200_THORUS;
	nr = 3;
	condition = Info_Thorus_WorkForGomez_Condition;
	information = Info_Thorus_WorkForGomez_Info;
	permanent = 0;
//	description = "I want to work for Gomez.";
//	description = "Ich will für Gomez arbeiten.";
	description = "Chci pro Gomeze pracovat.";
};                       

func int Info_Thorus_WorkForGomez_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) || Npc_KnowsInfo(hero,Info_Thorus_EnterCastle))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void Info_Thorus_WorkForGomez_Info()
{ 
//	AI_Output(other,self,"Info_WorkForGomez_15_00"); //I want to work for Gomez.
//	AI_Output(other,self,"Info_WorkForGomez_15_00"); //Ich will für Gomez arbeiten.
	AI_Output(other,self,"Info_WorkForGomez_15_00"); //Chci pro Gomeze pracovat.
//	AI_Output(self,other,"Info_WorkForGomez_09_01"); //Oh yeah? And what makes you think Gomez'll be interested in having you work for him?
//	AI_Output(self,other,"Info_WorkForGomez_09_01"); //Ach? Und wieso, glaubst du, ist Gomez daran interessiert, dass du für ihn arbeitest?
	AI_Output(self,other,"Info_WorkForGomez_09_01"); //Vážně? A proč si myslíš, že by ti Gomez chtěl dát práci?
};

// ************************************************************
// Diego schickt mich
// ************************************************************

instance Info_Thorus_DiegoSentMe(C_INFO) //E3
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_DiegoSentMe_Condition;
	information = Info_Thorus_DiegoSentMe_Info;
	permanent = 0;
//	description = "Diego says YOU decide who Gomez is interested in.";
//	description = "Diego sagt, DU entscheidest, wer Gomez interessiert.";
	description = "Diego řekl, že ty rozhoduješ, kdo je pro Gomeze zajímavý.";
};                       

func int Info_Thorus_DiegoSentMe_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_WorkForGomez) && Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp))
	{
		return 1;
	};
};

func void Info_Thorus_DiegoSentMe_Info()
{ 
//	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_00"); //Diego says YOU decide who Gomez is interested in.
//	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_00"); //Diego sagt, DU entscheidest, wer Gomez interessiert.
	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_00"); //Diego říká, že TY rozhoduješ, o koho bude mít Gomez zájem.
//	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_01"); //Huh... If Diego thinks you're okay, why doesn't HE take care of you?
//	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_01"); //Hm ... Wenn Diego denkt, du taugst was, kann ER sich auch mit dir rumschlagen.
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_01"); //No... Jestli Diego říká, že jsi v pohodě, proč se o tebe nepostará ON?
//	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_02"); //Look, let me explain: Diego's gonna test you. If HE thinks you're good enough, I'll let you into the castle to see Gomez.
//	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_02"); //Ich werde dir jetzt erklären, wie das läuft: Diego wird dich auf die Probe stellen. Wenn ER denkt, dass du gut genug bist, werde ich dich zu Gomez in die Burg lassen.
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_02"); //Poslouchej, vysvětlím ti to. Diego si tě chce vyzkoušet. Jestli si ON myslí, že jsi dost dobrý, tak tě pustím na hrad, abys mohl navštívit Gomeze.
//	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_03"); //Whatever happens after that is up to you, okay?
//	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_03"); //Was dann passiert, liegt an dir. Kapiert?
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_03"); //Cokoliv se stane, je to na tebe, jasný?
//	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_04"); //I'll talk to Diego.
//	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_04"); //Ich werde mit Diego reden.
	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_04"); //Řeknu to Diegovi.

//	B_LogEntry(CH1_JoinOC,"Thorus told me that I should talk to Diego if I wanted to be admitted to the Old Camp. Diego will test me.");
//	B_LogEntry(CH1_JoinOC,"Thorus sagte mir, ich soll mit Diego reden, wenn ich ins Alte Lager aufgenommen werden will. Diego wird mich auf die Probe stellen");
	B_LogEntry(CH1_JoinOC,"Thorus mi řekl, že jestli chci být přijat do Starého tábora, měl bych si promluvit s Diegem. Diego mě vyzkouší.");
};

// ************************************************************
// Try Me
// ************************************************************

instance Info_Thorus_TryMe(C_INFO) //E3
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_TryMe_Condition;
	information = Info_Thorus_TryMe_Info;
	permanent = 0;
//	description = "Why don't you give me the test?";
//	description = "Warum stellst du mich nicht auf die Probe?";
	description = "Proč mě nevyzkoušíš?";
};                       

func int Info_Thorus_TryMe_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_WorkForGomez))
	{
		return 1;
	};
};

func void Info_Thorus_TryMe_Info()
{ 
//	AI_Output(other,self,"Info_Thorus_TryMe_15_00"); //Why don't you give me the test?
//	AI_Output(other,self,"Info_Thorus_TryMe_15_00"); //Warum stellst du mich nicht auf die Probe?
	AI_Output(other,self,"Info_Thorus_TryMe_15_00"); //Proč mě nevyzkoušíš?
//	AI_Output(self,other,"Info_Thorus_TryMe_09_01"); //It ain't that easy, kid! Any newcomer who wants to get anywhere needs a patron.
//	AI_Output(self,other,"Info_Thorus_TryMe_09_01"); //So läuft das hier nicht, Kleiner! Jeder Neue, der sich hier beweisen will, braucht einen Fürsprecher.
	AI_Output(self,other,"Info_Thorus_TryMe_09_01"); //To není tak jednoduché, chlapče! Každý nováček, který se chce kamkoliv dostat, musí mít ochránce.
//	AI_Output(self,other,"Info_Thorus_TryMe_09_02"); //That patron has to be one of Gomez' people. He'll test you.
//	AI_Output(self,other,"Info_Thorus_TryMe_09_02"); //Der Fürsprecher muss einer von Gomez' Leuten sein. Er wird dich auf die Probe stellen.
	AI_Output(self,other,"Info_Thorus_TryMe_09_02"); //A tím ochráncem musí být někdo z Gomezových lidí. Vyzkouší tě sám.
//	AI_Output(self,other,"Info_Thorus_TryMe_09_03"); //And if you fail, you're his responsibility - that's the law around here.
//	AI_Output(self,other,"Info_Thorus_TryMe_09_03"); //Und wenn du Mist baust, ist er für dich verantwortlich - so läuft das hier.
	AI_Output(self,other,"Info_Thorus_TryMe_09_03"); //A jestli zklameš, je to na tvoje vlastní riziko - to je zdejší zákon.
};

// ************************************************************
// TryMeAgain
// ************************************************************

instance Info_Thorus_TryMeAgain(C_INFO) //E4
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_TryMeAgain_Condition;
	information = Info_Thorus_TryMeAgain_Info;
	permanent = 0;
//	description = "There must be something you want done.";
//	description = "Es muss doch eine Aufgabe geben, die du erledigt haben willst.";
	description = "Je tu určitě něco, co chceš udělat.";
};                       

func int Info_Thorus_TryMeAgain_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_TryMe))
	{
		return 1;
	};
};

func void Info_Thorus_TryMeAgain_Info()
{ 
//	AI_Output(other,self,"Info_Thorus_TryMeAgain_15_00"); //There must be something you want done.
//	AI_Output(other,self,"Info_Thorus_TryMeAgain_15_00"); //Es muss doch eine Aufgabe geben, die du erledigt haben willst.
	AI_Output(other,self,"Info_Thorus_TryMeAgain_15_00"); //Je tu určitě něco, co chceš udělat.
//	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_01"); //No. The things we guards deal with are a bit above you, kid.
//	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_01"); //Nein. Die Dinge, um die wir Gardisten uns kümmern, sind 'ne Nummer zu groß für dich, Kleiner.
	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_01"); //Ne. Věci se mají tak, že my, strážci, jsme trochu víc než ty, hochu.
//	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_02"); //You just stick to the tasks your patron sets for you.
//	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_02"); //Halt dich lieber an die Prüfungen, die dein Fürsprecher dir stellen wird.
	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_02"); //Ty akorát provedeš úkoly, které pro tebe tvůj ochránce přichystal.
};

// ************************************************************
// TryMeICanDoIt
// ************************************************************

instance Info_Thorus_TryMeICanDoIt(C_INFO) //E5
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_TryMeICanDoIt_Condition;
	information = Info_Thorus_TryMeICanDoIt_Info;
	permanent = 0;
//	description = "I'm quite capable of doing anything you tell me to.";
//	description = "Ich kann alles schaffen, was du mir aufträgst.";
	description = "Jsem schopný udělat cokoliv, co mi přikážeš.";
};                       

func int Info_Thorus_TryMeICanDoIt_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_TryMeAgain))
	{
		return 1;
	};
};

func void Info_Thorus_TryMeICanDoIt_Info()
{ 
//	AI_Output(other,self,"Info_Thorus_TryMeICanDoIt_15_00"); //I'm quite capable of doing anything you tell me to.
//	AI_Output(other,self,"Info_Thorus_TryMeICanDoIt_15_00"); //Ich kann alles schaffen, was du mir aufträgst.
	AI_Output(other,self,"Info_Thorus_TryMeICanDoIt_15_00"); //Jsem schopný udělat cokoliv, co mi přikážeš.
//	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_01"); //Oh? So you're intent on failing, eh... There is one thing that only someone who's not with Gomez can see to.
//	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_01"); //So? Du willst also unbedingt versagen ... Es gibt eine Sache, die nur von jemandem erledigt werden kann, der keiner von Gomez' Leuten ist.
	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_01"); //Eh? Vypadá to, že jsi odhodlaný, eh... Je tady jedna věc, kterou může vědět jen někdo, kdo není s Gomezem.
//	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_02"); //But I'm warning you: You blow this, and you'll be in mighty big trouble.
//	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_02"); //Aber ich warne dich. Wenn du das Ding vermasselst, bekommst du mächtigen Ärger.
	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_02"); //Ale varuju tě: jestli to vyzradíš, můžeš se dostat do pěkného maléru!
};

// **************************************************************************
// MISSION MORDRAG KO
// **************************************************************************
VAR INT Thorus_MordragKo;
// **************************************************************************
// MISSION MORDRAG KO VERGABE
// **************************************************************************

instance Info_Thorus_MordragKo_Offer(C_INFO) //E6
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_MordragKo_Offer_Condition;
	information = Info_Thorus_MordragKo_Offer_Info;
	permanent = 0;
//	description = "I'm ready for your task.";
//	description = "Ich bin bereit für deine Aufgabe.";
	description = "Jsem připraven vykonat tvůj úkol.";
};                       

func int Info_Thorus_MordragKo_Offer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_TryMeICanDoIt))
	{
		return 1;
	};
};

func void Info_Thorus_MordragKo_Offer_Info()
{
//	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_00"); //I'm ready for your task.
//	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_00"); //Ich bin bereit für deine Aufgabe.
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_00"); //Jsem připraven vykonat tvůj úkol.
//	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_01"); //What I'm about to tell you is between you and me, and nobody else must ever hear about it, understood?
//	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_01"); //Was ich dir jetzt sage, bleibt unter uns, und niemand außer uns beiden wird je von dieser Sache erfahren, verstanden?
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_01"); //To, co ti teď povím, zůstane jenom mezi náma dvěma a nikdo jiný se o tom nesmí dozvědět, jasný?
//	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_02"); //Sure.
//	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_02"); //Ja.
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_02"); //Jasný.
//	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_03"); //We have a problem with a guy from the New Camp. His name's Mordrag. He's been stealing from the Ore Barons.
//	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_03"); //Wir haben Ärger mit einem Typen aus dem Neuen Lager. Mordrag ist sein Name. Er hat Eigentum der Erzbarone gestohlen.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_03"); //Mám potíže s jedním chlapíkem z Nového tábora. Jmenuje se Mordrag. Kradl u Rudobaronů.
//	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_04"); //Of course that applies to a lot of the rogues in the New Camp, but this guy has the nerve to come to OUR camp and sell OUR stolen goods to OUR boys!
//	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_04"); //Es gibt viele Banditen im Neuen Lager, auf die das zutrifft, aber dieser Junge kommt in UNSER Lager und verkauft UNSERE gestohlene Ware an UNSERE Jungs zurück!
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_04"); //Samozřejmě máme v Novém táboře hromadu zabijáků, ale ten chlapík měl takové nervy, že přišel do NAŠEHO tábora a prodával NAŠE zboží NAŠIM lidem!
//	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_05"); //He's gone too far. But he knows I can't do anything about it.
//	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_05"); //Damit ist er eindeutig zu weit gegangen. Aber er weiß ganz genau, dass ich nichts machen kann.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_05"); //Zašel moc daleko. Dobře ale ví, že s tím nemůžu nic udělat.
//	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_06"); //Why?
//	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_06"); //Warum?
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_06"); //Jak to?
//	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_07"); //Because he's under the protection of the Mages.
//	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_07"); //Weil er unter dem Schutz der Magier steht.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_07"); //Protože je pod ochranou mágů.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
//	Info_AddChoice(Info_Thorus_MordragKo_Offer,"I'll take care of it.",Info_Thorus_MordragKo_OFFER_BACK);
//	Info_AddChoice(Info_Thorus_MordragKo_Offer," "Ich kümmere mich drum." 							",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Postarám se o to.",Info_Thorus_MordragKo_OFFER_BACK);
//	Info_AddChoice(Info_Thorus_MordragKo_Offer,"D'you want me to kill the guy?",Info_Thorus_MordragKo_KillHim);
//	Info_AddChoice(Info_Thorus_MordragKo_Offer," "Soll ich den Kerl umbringen?" 						",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Chceš po mně, abych toho chlapíka zabil?",Info_Thorus_MordragKo_KillHim);
//	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Where can I find Mordrag?",Info_Thorus_MordragKo_Where);
//	Info_AddChoice(Info_Thorus_MordragKo_Offer," "Wo finde ich Mordrag?" 								",Info_Thorus_MordragKo_Where);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Kde Mordraga najdu?",Info_Thorus_MordragKo_Where);
//	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Why do the mages protect that Mordrag?",Info_Thorus_MordragKo_MagesProtect);
//	Info_AddChoice(Info_Thorus_MordragKo_Offer," "Wieso beschützen die Magier diesen Mordrag?"		",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Proč ho mágové ochraňují?",Info_Thorus_MordragKo_MagesProtect);
//	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Sounds to me like the mages are your problem...",Info_Thorus_MordragKo_MageProblem);
//	Info_AddChoice(Info_Thorus_MordragKo_Offer," "Klingt eher als wären die Magier dein Problem..."	",Info_Thorus_MordragKo_MageProblem);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Zdá se, že ti mágové jsou pro tebe problém...",Info_Thorus_MordragKo_MageProblem);

	Thorus_MordragKo = LOG_RUNNING;

	Log_CreateTopic(CH1_MordragKO,LOG_MISSION);
//	B_LogEntry(CH1_MordragKO,"Thorus asked me to remove a rogue called Mordrag from the Camp. It's up to me how I do it. But nobody must find out that Thorus is involved.");
//	B_LogEntry(CH1_MordragKO,"Thorus hat mich damit beauftragt, einen Banditen namens Mordrag aus dem Lager zu vertreiben. Wie ich das anstelle hat er mir überlassen. Außerdem darf niemand erfahren, dass Thorus dahintersteckt.");
	B_LogEntry(CH1_MordragKO,"Thorus mě požádal, abych z tábora vyhnal lumpa jménem Mordrag. Jak to udělám, je prý má věc. Nikdo však nesmí vědět, že za tím stojí Thorus.");
	Log_SetTopicStatus(CH1_MordragKO,LOG_RUNNING);

	var C_Npc Mordrag; 
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

func void Info_Thorus_MordragKo_OFFER_BACK()
{
//	AI_Output(other,self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //I'll take care of it.
//	AI_Output(other,self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Ich kümmere mich darum.
	AI_Output(other,self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Postarám se o to.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

func void Info_Thorus_MordragKo_KillHim()
{
//	AI_Output(other,self,"Info_Thorus_MordragKo_KillHim_15_00"); //D'you want me to kill the guy?
//	AI_Output(other,self,"Info_Thorus_MordragKo_KillHim_15_00"); //Soll ich den Kerl umbringen?
	AI_Output(other,self,"Info_Thorus_MordragKo_KillHim_15_00"); //Chceš po mně, abych toho chlapíka zabil?
//	AI_Output(self,other,"Info_Thorus_MordragKo_KillHim_09_01"); //I want you to make sure I never see his face around here again. I don't care how you do it.
//	AI_Output(self,other,"Info_Thorus_MordragKo_KillHim_09_01"); //Du sollst dafür sorgen, dass ich ihn hier nie wieder sehen muss. Wie du das anstellst, ist deine Sache.
	AI_Output(self,other,"Info_Thorus_MordragKo_KillHim_09_01"); //Chci, abys zařídil, abych se už na něj nikdy nemusel podívat. Je mi jedno, jak to uděláš.
};

func void Info_Thorus_MordragKo_Where()
{
//	AI_Output(other,self,"Info_Thorus_MordragKo_Where_15_00"); //Where can I find Mordrag?
//	AI_Output(other,self,"Info_Thorus_MordragKo_Where_15_00"); //Wo finde ich Mordrag?
	AI_Output(other,self,"Info_Thorus_MordragKo_Where_15_00"); //Kde Mordraga najdu?
//	AI_Output(self,other,"Info_Thorus_MordragKo_Where_09_01"); //You'll find him at the south gate on the other side of the castle, just beyond the entrance. The bastard wouldn't dare come any further into the Camp.
//	AI_Output(self,other,"Info_Thorus_MordragKo_Where_09_01"); //Du findest ihn am Südtor, auf der anderen Seite der Burg, direkt hinter dem Eingang. Weiter traut sich dieser Halunke nicht ins Lager.
	AI_Output(self,other,"Info_Thorus_MordragKo_Where_09_01"); //Najdeš ho u jižní brány na druhé straně hradu, přímo za vstupem. Ten bastard by se už nikdy neměl odvážit přijít do tábora.
//	B_LogEntry(CH1_MordragKO,"Mordrag is at the south gate at the back of the castle.");
//	B_LogEntry(CH1_MordragKO,"Mordrag hält sich am Südtor auf der Rückseite der Burg auf.");
	B_LogEntry(CH1_MordragKO,"Mordrag je u jižní brány za hradem.");
};

func void Info_Thorus_MordragKo_MagesProtect()
{
//	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Why do the mages protect that Mordrag?
//	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Wieso beschützen die Magier diesen Mordrag?
	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Proč ho mágové ochraňují?
//	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Because they use him as a gofer. Our local mages are in contact with the mages over in the New Camp. They often send gofers back and forth.
//	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Weil er als Bote für sie arbeitet. Unsere Magier stehen mit den Magiern des Neuen Lagers in Kontakt. Sie schicken regelmäßig Boten hin und her.
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Protože jim slouží jako poslíček. Naši kouzelníci jsou v kontaktu s mágy v Novém táboře. Často posílají poslíčky tam a zpátky.
//	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //They're likely to become VERY unpleasant if I throw one of their gofers out of the Camp or have him killed.
//	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Wenn ich einen ihrer Boten aus dem Lager werfe oder umlegen lasse, könnten sie SEHR unangenehm werden.
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Byli by nejspíš HODNĚ rozzlobení, kdybych některého z jejich poslíčků vyhodil z tábora, nebo ho zabil.
//	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //What about ME? What do you think the mages will do to ME?
//	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //Was ist mit MIR? Was glaubst du machen die Magier mit MIR?
	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //A co JÁ? Co myslíš, že udělají MNĚ?
//	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //You're new here. You'll be okay. But I'm responsible for what my boys do. That's why it's vital that you keep your mouth shut.
//	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Du bist neu. Dir passiert gar nichts. ICH dagegen bin für das verantwortlich, was meine Jungs tun. Deswegen ist es ja so wichtig, dass du die Klappe hältst.
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Jsi tu nový, můžeš být v klidu. Já ale zodpovídám za to, co dělají moji chlapi. Proto je nesmírně důležité, abys držel jazyk za zuby.
	Thorus_MordragMageMessenger = TRUE;
};

func void Info_Thorus_MordragKo_MageProblem()
{
//	AI_Output(other,self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Sounds to me like the mages are your problem...
//	AI_Output(other,self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Klingt eher, als wären die Magier dein Problem ...
	AI_Output(other,self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Zdá se, že ti mágové jsou tvůj problém...
//	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Yeah, but they're a problem that's hard to solve. A few years back one of the Shadows tried to stab the High Magician of the Circle of Fire while he was sleeping.
//	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Ja, aber eines, das sich schwer lösen lässt. Vor ein paar Jahren hat mal einer der Schatten versucht, den Obersten Magier des Feuers im Schlaf zu erdolchen.
	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Jistě, ale jsou takovým problémem, který se těžce řeší. Před pár lety se jeden ze Stínů pokusil ve spánku probodnout Velkého mága Ohnivého kruhu.
//	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_02"); //They found him later in the Outer Ring - in fact, he was scattered ALL OVER the Outer Ring.
//	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Er wurde später im Außenring gefunden - an VERSCHIEDENEN Stellen im Außenring.
	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Potom ho našli na Vnějším okruhu - po pravdě řečeno, sbírali ho po CELÉM  Vnějším okruhu.
};

// **************************************************************************
// ANALYZE
// **************************************************************************

instance Info_Thorus_MordragKo_Analyze(C_INFO)
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_MordragKo_Analyze_Condition;
	information = Info_Thorus_MordragKo_Analyze_Info;
	permanent = 1;
//	description = "About Mordrag...";
//	description = "Wegen Mordrag...";
	description = "O Mordragovi...";
};                       

func int Info_Thorus_MordragKo_Analyze_Condition()
{ 
	if ((Thorus_MordragKo == LOG_RUNNING) && (MordragKO_PlayerChoseThorus != TRUE))
	{
		return 1;
	};
};

func void Info_Thorus_MordragKo_Analyze_Info()
{
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
//	Info_AddChoice(Info_Thorus_MordragKo_Analyze,"I'll take care of it.",Info_Thorus_MordragKo_ANALYZE_BACK);
//	Info_AddChoice(Info_Thorus_MordragKo_Analyze," "Ich kümmere mich drum." 	",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Postarám se o to.",Info_Thorus_MordragKo_ANALYZE_BACK);
//	Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Where can I find Mordrag?",Info_Thorus_MordragKo_Where); //SIEHE OBEN
//	Info_AddChoice(Info_Thorus_MordragKo_Analyze," "Wo finde ich Mordrag?" 	",Info_Thorus_MordragKo_Where); //SIEHE OBEN
	Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Kde Mordraga najdu?",Info_Thorus_MordragKo_Where); //SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
//		Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Mordrag will never steal anything from anyone ever again!",Info_Thorus_MordragKo_MordragDead);
//		Info_AddChoice(Info_Thorus_MordragKo_Analyze," "Mordrag wird nie wieder irgendwen bestehlen!" ",Info_Thorus_MordragKo_MordragDead);
		Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Mordrag už nikdy nikomu nic neukradne!",Info_Thorus_MordragKo_MordragDead);
	}
	else if ((MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE))
	{ 
//		Info_AddChoice(Info_Thorus_MordragKo_Analyze,"He's never gonna show his face around here again!",Info_Thorus_MordragKo_MordragGone);
//		Info_AddChoice(Info_Thorus_MordragKo_Analyze," "Der Typ wird sich hier nie wieder blicken lassen!" ",Info_Thorus_MordragKo_MordragGone);
		Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Už se tu nikdy víc neukáže!",Info_Thorus_MordragKo_MordragGone);
	};

};

func void Info_Thorus_MordragKo_ANALYZE_BACK()
{
//	AI_Output(other,self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //I'll take care of it.
//	AI_Output(other,self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Ich kümmere mich drum.
	AI_Output(other,self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Postarám se o to.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

func void Info_Thorus_MordragKo_MordragDead()
{
//	AI_Output(other,self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag will never steal anything from anyone ever again!
//	AI_Output(other,self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag wird nie wieder irgendwen bestehlen!
	AI_Output(other,self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag už nikdy nikomu nic neukradne!
//	AI_Output(self,other,"Info_Thorus_MordragKo_MordragDead_09_01"); //You mean you defeated him? That's not bad, kid.
//	AI_Output(self,other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Du hast ihn geschafft? Nicht schlecht, Kleiner.
	AI_Output(self,other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Myslíš tím, žes ho porazil? To není špatné, hochu.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO,LOG_SUCCESS); 
//	B_LogEntry(CH1_MordragKO,"Thorus was impressed that I got Mordrag out of the way. A clear bonus for me.");
//	B_LogEntry(CH1_MordragKO,"Thorus war beeindruckt, dass ich Mordrag beseitigt habe. Ein klarer Pluspunkt für mich.");
	B_LogEntry(CH1_MordragKO,"Thorus byl potěšen, že mu Mordrag zmizel z cesty. Výhoda pro mě.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

func void Info_Thorus_MordragKo_MordragGone()
{
//	AI_Output(other,self,"Info_Thorus_MordragKo_MordragGone_15_00"); //He's never gonna show his face around here again!
//	AI_Output(other,self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Der Typ wird sich hier nie wieder blicken lassen!
	AI_Output(other,self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Už se tu nikdy víc neukáže!
//	AI_Output(self,other,"Info_Thorus_MordragKo_MordragGone_09_01"); //I'd have felt happier if you'd killed him.
//	AI_Output(self,other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Lieber wär' mir gewesen, du hättest ihn umgelegt.
	AI_Output(self,other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Byl bych radši, kdybys ho zabil.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO,LOG_SUCCESS);
//	B_LogEntry(CH1_MordragKO,"Thorus is happy that Mordrag is not in the Camp any longer.");
//	B_LogEntry(CH1_MordragKO,"Thorus ist zufrieden, dass Mordrag nicht mehr hier im Lager ist.");
	B_LogEntry(CH1_MordragKO,"Thorus je rád, že už Mordrag není v táboře.");
	B_GiveXP(XP_Thorusmordragko);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

// ************************************************************
// Mordrag verplappert 
// ************************************************************

instance Info_Thorus_MordragFailed(C_INFO)
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_MordragFailed_Condition;
	information = Info_Thorus_MordragFailed_Info;
	permanent = 0;
	important = 1;
};                       

func int Info_Thorus_MordragFailed_Condition()
{ 
	if (MordragKO_PlayerChoseThorus == TRUE)
	{
		return 1;
	};
};

func void Info_Thorus_MordragFailed_Info()
{
//	AI_Output(self,other,"Info_Thorus_MordragFailed_09_00"); //You failed! I told you NOT TO MENTION MY NAME!!!
//	AI_Output(self,other,"Info_Thorus_MordragFailed_09_00"); //Du Versager! Ich sagte doch: NENN MEINEN NAMEN NICHT!!!
	AI_Output(self,other,"Info_Thorus_MordragFailed_09_00"); //Špatně! Říkal jsem ti NEVYSLOVUJ MOJE JMÉNO!!!
//	AI_Output(self,other,"Info_Thorus_MordragFailed_09_01"); //You've blown it! Just forget the whole thing! Don't you dare try to have anything else to do with the matter!
//	AI_Output(self,other,"Info_Thorus_MordragFailed_09_01"); //Du hast es vermasselt! Die Sache kannst du vergessen! Versuche ja nicht, noch weiter daran rumzupfuschen!
	AI_Output(self,other,"Info_Thorus_MordragFailed_09_01"); //Vyzradil jsi to! Na všechno jsi zapomněl! Neopovažuj se už nijak do té záležitosti znovu pouštět!

	Thorus_MordragKo = LOG_FAILED;

	Log_SetTopicStatus(CH1_MordragKO,LOG_FAILED);
//	B_LogEntry(CH1_MordragKO,"Thorus didn't like the fact that I told Mordrag his name. I don't think I need to turn up at his place for a while.");
//	B_LogEntry(CH1_MordragKO,"Dass ich Mordrag seinen Namen gesagt habe, hat Thorus gar nicht gefallen. Bei ihm brauche ich mich erstmal nicht mehr sehen lassen.");
	B_LogEntry(CH1_MordragKO,"Thorusovi se nelíbilo, že jsem Mordragovi řekl jeho jméno. Myslím, že bych mu chvíli neměl chodit na oči.");
	AI_StopProcessInfos(self);
};

// ************************************************************
// Bribe Thorus 
// ************************************************************

instance Info_Thorus_BribeGuard(C_INFO)
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_BribeGuard_Condition;
	information = Info_Thorus_BribeGuard_Info;
	permanent = 0;
//	description = "If I gave you a certain amount of ore, would you let me in the castle?";
//	description = "Würdest du mich für eine entsprechende Menge Erz in die Burg lassen?";
	description = "Kdybych ti dal určité množství rudy, pustil bys mě na hrad?";
};                       

func int Info_Thorus_BribeGuard_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_GetTrueGuild(other)!=GIL_STT) && (Npc_GetTrueGuild(other)!=GIL_GRD))
	{
		return 1;
	};
};

func void Info_Thorus_BribeGuard_Info()
{
//	AI_Output(other,self,"Info_Thorus_BribeGuard_15_00"); //If I gave you a certain amount of ore, would you let me in the castle?
//	AI_Output(other,self,"Info_Thorus_BribeGuard_15_00"); //Würdest du mich für eine entsprechende Menge Erz in die Burg lassen?
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_00"); //Kdybych ti dal určité množství rudy, pustil bys mě na hrad?
//	AI_Output(self,other,"Info_Thorus_BribeGuard_09_01"); //For a certain amount...
//	AI_Output(self,other,"Info_Thorus_BribeGuard_09_01"); //Für eine entsprechende Menge ... 
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_01"); //Za určité množství...
//	AI_Output(other,self,"Info_Thorus_BribeGuard_15_02"); //How much?
//	AI_Output(other,self,"Info_Thorus_BribeGuard_15_02"); //Wie viel?
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_02"); //Jak velké?
//	AI_Output(self,other,"Info_Thorus_BribeGuard_09_02"); //Well - it'd have to take a while to count the ore. Long enough to make sure me and my boys are busy counting while you slip by.
//	AI_Output(self,other,"Info_Thorus_BribeGuard_09_02"); //Nun - es müsste 'ne Weile dauern, das Erz zu zählen. So lange würden die Jungs am Tor und ich dann wegsehen.
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_02"); //Dobrá - musí být takové, aby se muselo chvíli počítat. Dost dlouho na to, aby bylo jisté, že já i mí chlapi budeme zaměstnaní jeho počítáním, zatímco ty vklouzneš dovnitř.
//	AI_Output(other,self,"Info_Thorus_BribeGuard_15_03"); //So tell me, how much?
//	AI_Output(other,self,"Info_Thorus_BribeGuard_15_03"); //Sag schon, wie viel?
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_03"); //Tak řekni kolik?
//	AI_Output(self,other,"Info_Thorus_BribeGuard_09_03"); //1000 nuggets should be enough.
//	AI_Output(self,other,"Info_Thorus_BribeGuard_09_03"); //1000 Brocken dürften genügen.
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_03"); //1000 nugetů by mělo stačit.
//	AI_Output(other,self,"Info_Thorus_BribeGuard_15_04"); //1000 nuggets?
//	AI_Output(other,self,"Info_Thorus_BribeGuard_15_04"); //1000 Brocken?
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_04"); //1000 nugetů?
//	AI_Output(self,other,"Info_Thorus_BribeGuard_09_04"); //Well, you could join up with Gomez, that'd get you in the castle for free.
//	AI_Output(self,other,"Info_Thorus_BribeGuard_09_04"); //Nun, du könntest dich Gomez' Leuten anschließen, dann kommst du auch in die Burg - ganz umsonst.
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_04"); //Dobře, tak se přidej ke Gomezovi, a budeš mít vstup na hrad zdarma.
};

// ************************************************************
// Give1000Ore 
// ************************************************************

instance Info_Thorus_Give1000Ore(C_INFO)
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_Give1000Ore_Condition;
	information = Info_Thorus_Give1000Ore_Info;
	permanent = 1;
//	description = "I have the 1000 nuggets of ore. Now let me go in!";
//	description = "Ich hab' die 1000 Brocken Erz. Lass mich in die Burg!";
	description = "Mám 1000 magických nugetů. Teď mě pusť dovnitř!";
};                       

func int Info_Thorus_Give1000Ore_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_Thorus_BribeGuard))
	{
		return 1;
	};
};

func void Info_Thorus_Give1000Ore_Info()
{
//	AI_Output(other,self,"Info_Thorus_Give1000Ore_15_00"); //I have the 1000 nuggets of ore. Now let me go in!
//	AI_Output(other,self,"Info_Thorus_Give1000Ore_15_00"); //Ich hab' die 1000 Brocken Erz. Lass mich in die Burg!
	AI_Output(other,self,"Info_Thorus_Give1000Ore_15_00"); //Mám 1000 magických nugetů. Teď mě pusť dovnitř!

	if (Npc_HasItems(other,ItMiNugget)>=1000)
	{
		B_GiveInvItems(other,self,ItMiNugget,1000); 
//		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_01"); //Alright, go ahead. You can go in the castle, but don't do anything stupid, okay?
//		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_01"); //Gut, wegen mir. Du kommst in die Burg, aber mach keine Dummheiten, klar!
		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_01"); //Dobrá, běž přímo rovně. Můžeš jít do hradu, ale žádné hlouposti, jasný?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
//		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_02"); //Don't try'n trick me, kid. You don't have 1000 nuggets of ore!
//		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_02"); //Verarsch mich nicht, Kleiner, du hast keine 1000 Brocken Erz!
		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_02"); //Nezkoušej na mě žádné triky, chlapče. Ty nemáš žádných 1000 magických nugetů!
	};
};

// ************************************************************
// Brief für Magier
// ************************************************************

instance Info_Thorus_LetterForMages(C_INFO)
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_LetterForMages_Condition;
	information = Info_Thorus_LetterForMages_Info;
	permanent = 1;
//	description = "I need to get into the castle! I have a letter here for the High Mage.";
//	description = "Ich muss in die Burg! Ich habe einen Brief für den obersten Feuermagier.";
	description = "Potřebuju se dostat do hradu! Nesu dopis pro nejvyššího Mága Ohně.";
};                       

func int Info_Thorus_LetterForMages_Condition()
{ 
	if Npc_KnowsInfo(hero,Info_Thorus_EnterCastle)
	&& (Npc_HasItems(hero,ItWr_Fire_Letter_01) || Npc_HasItems(hero,ItWr_Fire_Letter_02))
	{
		return 1;
	};
};

func void Info_Thorus_LetterForMages_Info()
{
//	AI_Output(other,self,"Info_Thorus_LetterForMages_15_00"); //I need to get into the castle! I have a letter here for the High Fire Mage.
//	AI_Output(other,self,"Info_Thorus_LetterForMages_15_00"); //Ich muss in die Burg! Ich habe einen Brief für den obersten Feuermagier.
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_00"); //Potřebuju se dostat do hradu! Nesu dopis pro nejvyššího Mága Ohně.
//	AI_Output(self,other,"Info_Thorus_LetterForMages_09_01"); //And you expect me to let you stroll inside the castle to hand it over and collect your reward?
//	AI_Output(self,other,"Info_Thorus_LetterForMages_09_01"); //Und ich soll dich jetzt in die Burg spazieren lassen, damit du ihn abgeben und deine Belohnung kassieren kannst?
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_01"); //A ty si myslíš, že tě pustím do hradu, abys ho předal a shrábl odměnu?
//	AI_Output(other,self,"Info_Thorus_LetterForMages_15_02"); //Yeah.
//	AI_Output(other,self,"Info_Thorus_LetterForMages_15_02"); //Ja.
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_02"); //Tak.
//	AI_Output(self,other,"Info_Thorus_LetterForMages_09_03"); //Okay, show me the letter.
//	AI_Output(self,other,"Info_Thorus_LetterForMages_09_03"); //Na gut, zeig her den Brief.
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_03"); //Dobrá, ukaž mi tu zprávu.
//	AI_Output(other,self,"Info_Thorus_LetterForMages_15_04"); //I'm not letting YOU handle it - forget it!
//	AI_Output(other,self,"Info_Thorus_LetterForMages_15_04"); //Den geb' ich nicht aus der Hand - vergiss es!
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_04"); //Nemůžu ji ukázat TOBĚ - zapomeň na to!
//	AI_Output(self,other,"Info_Thorus_LetterForMages_09_05"); //Okay, I've forgotten.
//	AI_Output(self,other,"Info_Thorus_LetterForMages_09_05"); //Schon vergessen.
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_05"); //Dobře, zapomněl jsem.
};

// ************************************************************
// Bereit für Gomez !!!
// ************************************************************

instance Info_Thorus_ReadyForGomez(C_INFO)
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_ReadyForGomez_Condition;
	information = Info_Thorus_ReadyForGomez_Info;
	permanent = 0;//1
//	description = "Diego says I'm ready to see Gomez!";
//	description = "Diego sagt, ich bin bereit für Gomez!";
	description = "Diego říká, že můžu vidět Gomeze!";
};                       

func int Info_Thorus_ReadyForGomez_Condition()
{ 
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

func void Info_Thorus_ReadyForGomez_Info()
{
//	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_00"); //Diego says I'm ready to see Gomez!
//	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_00"); //Diego sagt, ich bin bereit für Gomez!
	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_00"); //Diego říká, že můžu vidět Gomeze!
//	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_01"); //That's my decision!
//	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_01"); //Das entscheide immer noch ich!
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_01"); //O tom rozhoduju já!
//	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_02"); //And what do you decide?
//	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_02"); //Und wie lautet deine Entscheidung?
	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_02"); //A jak ses rozhodl?
//	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm ...
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm...
//	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_04"); //I must admit you seem to have done most things okay.
//	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_04"); //Du hast wohl die meisten Sachen gut gemacht, so viel muss man sagen.
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_04"); //Musím připustit, že svoji práci děláš opravdu dobře.
//	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_05"); //Okay! You can see Gomez. He alone will decide whether you get to join us or not.
//	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_05"); //Gut! Du kannst zu Gomez gehen. Er allein bestimmt, wer aufgenommen wird und wer nicht.
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_05"); //Dobrá! Můžeš za Gomezem. Sám rozhodne, jestli se k nám přidáš, nebo ne.
//	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_06"); //From now on, you're on your own, kid.
//	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_06"); //Ab jetzt bist du auf dich allein gestellt, Kleiner.
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_06"); //Od teďka jsi jedním z nás, hochu.

	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
};

// ************************************************************
// KRAUTBOTE von Kalom
// ************************************************************

instance Info_Thorus_Krautbote(C_INFO)
{
	npc = GRD_200_THORUS;
	nr = 4;
	condition = Info_Thorus_Krautbote_Condition;
	information = Info_Thorus_Krautbote_Info;
	permanent = 0;
//	description = "I have a consignment of weed for Gomez from Cor Kalom.";
//	description = "Ich habe ne Ladung Kraut von Cor Kalom für Gomez.";
	description = "Mám tady od Cora Kaloma zásilku drogy z bažin pro Gomeze.";
};                       

func int Info_Thorus_Krautbote_Condition()
{ 
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

func void Info_Thorus_Krautbote_Info()
{
//	AI_Output(other,self,"Info_Thorus_Krautbote_15_00"); //I have a consignment of weed for Gomez from Cor Kalom.
//	AI_Output(other,self,"Info_Thorus_Krautbote_15_00"); //Ich habe 'ne Ladung Kraut von Cor Kalom für Gomez.
	AI_Output(other,self,"Info_Thorus_Krautbote_15_00"); //Mám tady od Cora Kaloma pro Gomeze zásilku drogy z bažin.
//	AI_Output(self,other,"Info_Thorus_Krautbote_09_01"); //Show me!
//	AI_Output(self,other,"Info_Thorus_Krautbote_09_01"); //Zeig her!
	AI_Output(self,other,"Info_Thorus_Krautbote_09_01"); //Ukaž mi ji!

	if (Npc_HasItems(other,itmijoint_3) >= 30)
	{
//		AI_Output(self,other,"Info_Thorus_Krautbote_09_02"); //Hmmmmmmm...
//		AI_Output(self,other,"Info_Thorus_Krautbote_09_02"); //Hmmmmmmm ...
		AI_Output(self,other,"Info_Thorus_Krautbote_09_02"); //Hmmm...
//		AI_Output(self,other,"Info_Thorus_Krautbote_09_03"); //Alright! You can go through. Go straight to the Ore Barons' house. Bartholo will meet you there.
//		AI_Output(self,other,"Info_Thorus_Krautbote_09_03"); //Gut! Du kannst durch. Geh direkt zum Haus der Erzbarone. Bartholo wird dich empfangen.
		AI_Output(self,other,"Info_Thorus_Krautbote_09_03"); //Dobrá! Můžeš dál. Jdi přímo do Rudobaronova domu. Bartholo tě tam bude čekat.

		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
//		AI_Output(self,other,"Info_Thorus_Krautbote_09_04"); //You don't have enough weed to be a gofer! I hope for your sake that you haven't sold the stuff elsewhere! Come back when you have the right amount!
//		AI_Output(self,other,"Info_Thorus_Krautbote_09_04"); //Du hast zu wenig Kraut für einen Boten! Ich will für dich nicht hoffen, dass du das Zeug verscherbelt hast! Komm wieder, wenn du die richtige Menge dabei hast!
		AI_Output(self,other,"Info_Thorus_Krautbote_09_04"); //Na poslíčka té drogy moc nemáš! Doufám, žes tu zásilku už nerozprodal někde jinde! Vrať se, až budeš mít to správné množství!
	};
};

// ************************************************************
// SIEGEL der KdW
// ************************************************************
	var int thorus_Amulettgezeigt;
// ************************************************************

instance Info_Thorus_KdWSiegel(C_INFO)
{
	npc = GRD_200_THORUS;
	nr = 4;
	condition = Info_Thorus_KdWSiegel_Condition;
	information = Info_Thorus_KdWSiegel_Info;
	permanent = 1;
//	description = "I'm on an errand for the water mages. I need to get into the castle!";
//	description = "Ich bin Bote der Wassermagier. Ich muss in die Burg!";
	description = "Jsem posel mágů Vody. Potřebuju se dostat na hrad!";
};                       

func int Info_Thorus_KdWSiegel_Condition()
{ 
	if (((Npc_KnowsInfo(hero,Org_826_Mordrag_Courier))||(Npc_HasItems(other,KdW_Amulett)>=1))
		&& (thorus_Amulettgezeigt == FALSE) 
		)
	{
		return 1;
	};
};

func void Info_Thorus_KdWSiegel_Info()
{
//	AI_Output(other,self,"Info_Thorus_KdWSiegel_15_00"); //I'm on an errand for the water mages. I need to get into the castle!
//	AI_Output(other,self,"Info_Thorus_KdWSiegel_15_00"); //Ich bin Bote der Wassermagier. Ich muss in die Burg!
	AI_Output(other,self,"Info_Thorus_KdWSiegel_15_00"); //Jsem posel mágů Vody. Potřebuju se dostat na hrad!
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
//		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_01"); //You have a messenger's amulet with you. That'll get you past the guards.
//		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_01"); //Du hast das Amulett eines Boten bei dir. Damit kommst du an den Wachen vorbei.
		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_01"); //Máš sebou amulet kurýra. S tím projdeš skrze stáže.
//		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_02"); //I want nothing to do with the mages. So stop bothering me, will you?
//		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_02"); //Mit den Magiern will ich nichts zu tun haben. Also belästige mich nicht weiter mit der Sache!
		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_02"); //S mágy nechci mít nic společného. Přestaň mě obtěžovat, jo?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;

		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
//		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_03"); //Sure you are. I guess you must have mislaid your amulet, eh?
//		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_03"); //Natürlich bist du das. Und dein Amulett hast du verlegt, was?
		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_03"); //To jistě jsi. Ale asi jsi musel někde zapomenout amulet kurýra, viď?
	};
};

// ************************************************************
// Habs GESCHAFFT
// ************************************************************

instance Info_Thorus_SttGeschafft(C_INFO)
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_SttGeschafft_Condition;
	information = Info_Thorus_SttGeschafft_Info;
	permanent = 0;
//	description = "I've done it. At last I belong to the Camp!";
//	description = "Ich hab's geschafft. Jetzt bin ich Mitglied des Lagers!";
	description = "Vyřízeno. Teď jsem členem tábora.";
};                       

func int Info_Thorus_SttGeschafft_Condition()
{ 
	if (Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

func void Info_Thorus_SttGeschafft_Info()
{
//	AI_Output(other,self,"Info_Thorus_SttGeschafft_15_00"); //I've done it. At last I belong to the Camp!
//	AI_Output(other,self,"Info_Thorus_SttGeschafft_15_00"); //Ich hab's geschafft. Jetzt bin ich Mitglied des Lagers!
	AI_Output(other,self,"Info_Thorus_SttGeschafft_15_00"); //Vyřízeno. Teď jsem členem tábora.
//	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_01"); //Congratulations, kid! You'd better stick close to Diego from now on.
//	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_01"); //Herzlichen Glückwunsch, Kleiner! Ab jetzt hältst du dich am besten an Diego.
	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_01"); //Gratuluju, hochu! Ode dneška se raději drž v blízkosti Diega.
//	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_02"); //Only go to Gomez or Raven if you have something REALLY important to say.
//	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_02"); //Zu Gomez oder Raven solltest du nur noch gehen, wenn du was WIRKLICH Wichtiges zu sagen hast.
	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_02"); //Musím jen něco OPRAVDU důležitého říci Gomezovi nebo Ravenovi.
}; 

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////	Kapitel 2    ///////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// ************************************************************
// PERM2
// ************************************************************

instance Info_Thorus_PERM2(C_INFO)
{
	npc = GRD_200_THORUS;
	nr = 1;
	condition = Info_Thorus_PERM2_Condition;
	information = Info_Thorus_PERM2_Info;
	permanent = 0;
//	description = "How are you doing?";
//	description = "Wie sieht's bei dir aus?";
	description = "Jak to jde?";
};                       

func int Info_Thorus_PERM2_Condition()
{ 
	if ((Npc_GetTrueGuild(other) == GIL_STT) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Info_Thorus_PERM2_Info()
{
//	AI_Output(other,self,"Info_Thorus_PERM2_15_00"); //How are you doing?
//	AI_Output(other,self,"Info_Thorus_PERM2_15_00"); //Wie sieht's bei dir aus?
	AI_Output(other,self,"Info_Thorus_PERM2_15_00"); //Jak se máš?
//	AI_Output(self,other,"Info_Thorus_PERM2_09_01"); //We're not having much trouble from the New Camp. I'm more worried about those sect loonies.
//	AI_Output(self,other,"Info_Thorus_PERM2_09_01"); //Wir haben wenig Ärger mit den Typen aus dem Neuen Lager. Mir machen eher die Sektenspinner Sorgen.
	AI_Output(self,other,"Info_Thorus_PERM2_09_01"); //S Novým táborem nemáme tolik starostí. Spíš mám obavy z těch sektářských bláznů.
}; 

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////	Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//-----------------------------------------------------
// GILDENAUFNAHME GARDIST
//-----------------------------------------------------

instance GRD_200_Thorus_GARDIST(C_INFO)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_GARDIST_Condition;
	information = GRD_200_Thorus_GARDIST_Info;
	important = 0;
	permanent = 0;
//	description = "You have something to tell me?"; 
//	description = "Du wolltest mir etwas mitteilen?"; 
	description = "Chceš mi něco říci?"; 
};

func int GRD_200_Thorus_GARDIST_Condition()
{ 
	if ((CorKalom_BringMCQBalls == LOG_SUCCESS)
	|| Npc_KnowsInfo(hero,Grd_214_Torwache_SEETHORUS)
	|| Npc_KnowsInfo(hero,GRD_216_Torwache_SEETHORUS))
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	&& (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE))
	{
		return TRUE;
	};

};
func void GRD_200_Thorus_GARDIST_Info()
{
	var C_Npc KDFWache; 
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = TRUE;
//	AI_Output(other,self,"GRD_200_Thorus_GARDIST_Info_15_01"); //You have something to tell me?
//	AI_Output(other,self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Du wolltest mir etwas mitteilen?
	AI_Output(other,self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Chceš mi něco říci?
//	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Yes. What you did in the mine not only shows some courage, but it also proves your strength and your fighting skills.
//	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Ja. Durch das, was du in der Mine getan hast, hast du nicht nur deine Tapferkeit, sondern auch deine Stärke und deine Fähigkeit im Kampf unter Beweis gestellt.
	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Ano. To, jak sis počínal v dolech, nejen dokázalo určitou odvahu, ale také prokázalo tvoji sílu a umění v boji.
//	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_03"); //I'm ready to accept you into the ranks of the guards.
//	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Ich bin bereit, dich in die Reihen der Gardisten aufzunehmen.
	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Jsem rozhodnutý tě přijmout mezi své stráže.
	if hero.level < 10
	{
//		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_04"); //But you're not quite ready to become a guard yet. You need to gather a little more experience before I can take you on.
//		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Aber du bist noch nicht bereit, Gardist zu werden. Sammle erst noch mehr Erfahrung, dann werde ich dich aufnehmen.
		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Ale nejsi zatím úplně připravený stát se strážcem. Potřebuješ ještě získat trochu zkušeností, než tě budu moci konečně přijmout.
		AI_StopProcessInfos(self);
		B_PrintGuildCondition(10);
	}
	else if hero.level >= 10
	{
//		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_05"); //I'm giving you a chance. What do you say?
//		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Ich gebe dir eine Chance. Wie sieht's aus?
		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Dávám ti šanci. Co na to říkáš?
	};
};
//---------------------------------------------------------------
// GARDIST WERDEN
//---------------------------------------------------------------
instance GRD_200_Thorus_AUFNAHME(C_INFO)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_AUFNAHME_Condition;
	information = GRD_200_Thorus_AUFNAHME_Info;
	permanent = 0;
//	description = "I want to become a guard."; 
//	description = "Ich will Gardist werden"; 
	description = "Chci se stát strážcem."; 
};

func int GRD_200_Thorus_AUFNAHME_Condition()
{ 
	if (Npc_KnowsInfo(hero,GRD_200_Thorus_GARDIST))
	&& (hero.level >=10) 
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};

};
func void GRD_200_Thorus_AUFNAHME_Info()
{
//	AI_Output(other,self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //I want to become a guard.
//	AI_Output(other,self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Ich will Gardist werden.
	AI_Output(other,self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Chci se stát strážcem.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //I'm glad to hear it. But first I must tell you something that I tell all new recruits. Listen carefully, I shall say this only once.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Das freut mich. Doch zunächst: Es gibt da ein paar Dinge, die ich jedem Neuen sage. Pass gut auf, denn ich sage sie nur einmal.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //To rád slyším. Nejprve ti ale musím říci něco, co říkám všem adeptům. Poslouchej dobře, protože to budu říkat jenom jednou.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //So far, you've tried to get by on your own. Those days are over now. My boys stick together. We guards protect the Ore Barons, the ore, the camp and the mine.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Bisher hast du versucht, auf eigene Faust zu überleben. Damit ist nun Schluss. Meine Jungs halten zusammen. Wir Gardisten beschützen die Erzbarone, das Erz, das Lager und die Mine.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Dosud ses jenom pokoušel stát se jedním z nás. Ty dny jsou už pryč. Mí chlapi drží pohromadě. My, strážci, chráníme Rudobarony, tábor a důl.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //The diggers collect the ore, but we make sure that they don't get eaten by crawlers. The Ore Barons negotiate with the King, but we're the ones that protect them.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Die Buddler schürfen das Erz, aber wir sorgen dafür, dass sie nicht von den Crawlern gefressen werden. Die Barone verhandeln mit dem König, aber wir decken ihren Arsch dabei.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Kopáči dobývají rudu a my je za to nenecháme sežrat červům. Rudobaroni vyjednávají s králem, ale my jsme ti, co je chrání.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Day and night, we're in the mine. Day and night, we stand at the gates of the Camp and make sure folks get to sleep peacefully.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Wir stehen Tag und Nacht in der Mine. Wir stehen Tag und Nacht an den Toren des Lagers und passen auf, dass alle ruhig schlafen können.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Ve dne v noci jsme v dole. Ve dne v noci střežíme bránu tábora a staráme se, aby lidi mohli v klidu spát.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //We were a wild bunch when we started out here, but now we're a force to be reckoned with. We've all worked hard to build up this life for ourselves.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Als wir hier angefangen haben, da waren wir Freiwild, aber wir haben uns behauptet. Wir alle haben hart dafür gearbeitet, uns dieses Leben aufzubauen.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Kdysi jsme byli divoká smečka, ale teď jsme síla, se kterou se počítá. Tvrdě pracujeme a dáváme své životy za životy druhých.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //I only expect one thing from my boys: that they stick together. Only by standing together will we be able to hold on to what we have.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Ich erwarte nur eins von meinen Jungs: dass sie zusammenhalten. Denn nur wenn wir zusammen stehen, dann werden wir das alles behalten können.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Od svých chlapů očekávám jednu věc: že budou držet spolu. Jedině spolu dokážeme to, co dokázat musíme.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //And to survive.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //Dann überleben wir.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //Potom přežijeme.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //You'll learn everything else in due course. Be ready and help out wherever help is needed or something needs to be done.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Alles andere wirst du schon mit der Zeit rauskriegen. Halte dich bereit und hilf da, wo gerade Not am Mann ist oder irgendwas zu erledigen ist.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Všechno ostatní se naučíš během výcviku. Buď připravený pomáhat kdekoliv to bude zapotřebí a dělat cokoliv, co bude třeba.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Go and ask Stone to give you some armor and a sword.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Du kannst dir bei Stone deine Rüstung und dein Schwert holen.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Zajdi za Stonem, aby ti dal nějakou zbroj a meč.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //You'll find Stone in the blacksmith's shop in the Inner Ring.
//	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Du findest Stone im inneren Ring, in der Schmiede.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Stonea najdeš v kovářském obchodě na Vnitřním okruhu.

	var C_Npc KDFWache; 
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = FALSE;

	Npc_SetTrueGuild(hero,GIL_GRD);
	hero.guild = GIL_GRD;
};  
//---------------------------------------------------------------
// GARDIST WERDEN TEIL 2
//---------------------------------------------------------------
instance GRD_200_Thorus_NOCHWAS(C_INFO)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_NOCHWAS_Condition;
	information = GRD_200_Thorus_NOCHWAS_Info;
	important = 1;
	permanent = 0;
};

func int GRD_200_Thorus_NOCHWAS_Condition()
{ 
	if (Npc_KnowsInfo(hero,GRD_200_Thorus_AUFNAHME))
	&& (Npc_GetTrueGuild(hero) == GIL_GRD ) 
	{
		return TRUE;
	};
};
func void GRD_200_Thorus_NOCHWAS_Info()
{
//	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //Oh, one more thing...
//	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //Ach, noch eine Sache ...
	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //Jo, a ještě jednu věc...
//	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Welcome to the Guards.
//	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Willkommen bei der Garde.
	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Vítej mezi strážemi.
	AI_StopProcessInfos(self);

	Log_CreateTopic(GE_BecomeGuard,LOG_NOTE);
//	B_LogEntry(GE_BecomeGuard,"Today Thorus has admitted me to the guards. I may go and collect my new armor from the blacksmith Stone, in the castle.");
//	B_LogEntry(GE_BecomeGuard,"Heute hat mich Thorus in die Reihen der Gardisten aufgenommen. Ich kann mir bei dem Schmied Stone in der Burg meine neue Rüstung abholen.");
	B_LogEntry(GE_BecomeGuard,"Dnes mě Thorus přijal mezi stráže. Mám si na hradě u kováře Stonea vyzvednout svoji novou zbroj.");

};

//---------------------------------------------------------------
// ICH WILL MAGIER WERDEN
//---------------------------------------------------------------
instance GRD_200_Thorus_WANNABEMAGE(C_INFO)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_WANNABEMAGE_Condition;
	information = GRD_200_Thorus_WANNABEMAGE_Info;
	permanent = 0;
//	description = "I'm interested in the path of magic."; 
//	description = "Ich interessiere mich für den Weg der Magie!"; 
	description = "Zajímá mě cesta magie."; 
};
//
func int GRD_200_Thorus_WANNABEMAGE_Condition()
{ 
	if (Npc_KnowsInfo(hero,GRD_200_Thorus_GARDIST))
	&& (!Npc_KnowsInfo(hero,GRD_200_Thorus_AUFNAHME))
	{
		return TRUE;
	};

};
func void GRD_200_Thorus_WANNABEMAGE_Info()
{
//	AI_Output(other,self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //I'm interested in the path of magic.
//	AI_Output(other,self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Ich interessiere mich für den Weg der Magie.
	AI_Output(other,self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Zajímá mě cesta magie.
//	AI_Output(self,other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //Well, in that case maybe you should talk to Corristo. He taught Milten. I'm sure there's nothing to stop you.
//	AI_Output(self,other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //Nun, dann solltest du vielleicht mit Corristo sprechen. Er hat auch Milten unterrichtet. Ich bin sicher, dem steht nichts im Wege.
	AI_Output(self,other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //Dobrá, pak by sis měl možná promluvit s Corristem. Vyučoval Miltena. Jsem si jistý, že ti nic nestojí v cestě.

	var C_NPC Corristo;
	Corristo = Hlp_GetNpc(KDF_402_Corristo);
	Npc_ExchangeRoutine(Corristo,"WAITFORSC");
	AI_ContinueRoutine(Corristo);
};  
//---------------------------------------------------------------
//	 STR + DEX
//---------------------------------------------------------------
instance GRD_200_Thorus_Teach(C_INFO)
{
	npc = GRD_200_Thorus;
	nr = 10;
	condition = GRD_200_Thorus_Teach_Condition;
	information = GRD_200_Thorus_Teach_Info;
	permanent = 1;
//	description = "Can you teach me?";
//	description = "Kannst du mich trainieren?";
	description = "Mohl bys mě učit?";
};                       

func int GRD_200_Thorus_Teach_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_Teach_Info()
{
//	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Can you teach me?
//	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Kannst du mich trainieren?
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Mohl bys mě učit?
//	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //I can show you how to improve your skill and strength.
//	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Ich kann dir zeigen, wie du deine Geschicklichkeit und deine Stärke verbesserst.
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Můžu ti ukázat, jak nabýt sílu a zlepšit umění boje.

	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
//		B_LogEntry(GE_TeacherOC,"Thorus will help me improve my STRENGTH and DEXTERITY.");
//		B_LogEntry(GE_TeacherOC,"Bei Thorus kann ich meine STÄRKE und mein GESCHICK verbessern");
		B_LogEntry(GE_TeacherOC,"Thorus mi pomůže zdokonalit mou SÍLU a OBRATNOST.");
		log_thorustrain = TRUE;
	};
	Info_ClearChoices(GRD_200_Thorus_Teach);
//	Info_AddChoice(GRD_200_Thorus_Teach,"DIALOG_BACK									",GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK ,GRD_200_Thorus_Teach_BACK);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		",GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		",GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	",GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	",GRD_200_Thorus_Teach_DEX_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_BACK()
{

	Info_ClearChoices(GRD_200_Thorus_Teach);
};

func void GRD_200_Thorus_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GRD_200_Thorus_Teach);
//	Info_AddChoice(GRD_200_Thorus_Teach,"DIALOG_BACK									",GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK ,GRD_200_Thorus_Teach_BACK);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		",GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		",GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	",GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	",GRD_200_Thorus_Teach_DEX_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GRD_200_Thorus_Teach);
//	Info_AddChoice(GRD_200_Thorus_Teach,"DIALOG_BACK									",GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK ,GRD_200_Thorus_Teach_BACK);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		",GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		",GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	",GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	",GRD_200_Thorus_Teach_DEX_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GRD_200_Thorus_Teach);
//	Info_AddChoice(GRD_200_Thorus_Teach,"DIALOG_BACK									",GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK ,GRD_200_Thorus_Teach_BACK);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		",GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		",GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	",GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	",GRD_200_Thorus_Teach_DEX_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GRD_200_Thorus_Teach);
//	Info_AddChoice(GRD_200_Thorus_Teach,"DIALOG_BACK									",GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK ,GRD_200_Thorus_Teach_BACK);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		",GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		",GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	",GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
//	Info_AddChoice(GRD_200_Thorus_Teach,"B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	",GRD_200_Thorus_Teach_DEX_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};
//-------------------------------------------------------------------------
// ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance GRD_200_Thorus_ZWEIHAND1(C_INFO)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_ZWEIHAND1_Condition;
	information = GRD_200_Thorus_ZWEIHAND1_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
//	description = B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
	description = B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0); 
};

func int GRD_200_Thorus_ZWEIHAND1_Condition()
{ 
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};

};
func void GRD_200_Thorus_ZWEIHAND1_Info()
{ 
	if (log_thorusfight == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
//		B_LogEntry(GE_TeacherOC,"Thorus can teach me the fight with TWO-HANDED WEAPONS as soon as I've mastered the ONE-HANDED fight.");
//		B_LogEntry(GE_TeacherOC,"Thorus kann mir den Kampf mit ZWEIHÄNDERN beibringen, wenn ich im EINHÄNDIGEN Kampf gemeistert bin.");
		B_LogEntry(GE_TeacherOC,"Thorus mě může naučit bojovat s OBOURUČNÍMI ZBRANĚMI, jen co zvládnu boj s JEDNORUČNÍMI ZBRANĚMI.");
		log_thorusfight = TRUE;
	};
//	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //I want to learn how to handle a two-handed sword.
//	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Ich möchte den Umgang mit dem Zweihänder lernen.
	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Chci se naučit zacházet s obouručním mečem.

	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Okay, let's go through the basics first.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Nun, dann gehen wir zuerst die Grundbegriffe durch.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Dobře, ale nejdřív musíme probrat základy.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Hold the sword in a horizontal position. You'll need more swing to attack your opponent with such a heavy weapon.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Halte das Schwert waagerecht. Um den Gegner mit einer großen Waffe anzugreifen, brauchst du viel Schwung.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Meč musíš držet vodorovně. Potřebuješ silnější rozmach, abys mohl na nepřítele zaútočit takovou těžkou zbraní.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Raise your arm and swing it straight down. That's usually enough to knock the opponent down.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Hole mit der Waffe aus und schlage am besten direkt von oben. Meistens reicht das aus, um Gegner zu Boden zu strecken.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Zvedni ruku a rozmáchni se rovnou dolu. To obvykle stačí na to, abys nepřítele srazil k zemi.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Use the momentum of the weapon to bring it straight back up again.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Nutze den Schwung, wenn die Waffe unten ist, um direkt wieder nach oben zu schlagen.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Toho momentu pak využiješ k novému rozmáchnutí.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Two-handed swords are ideal for coordinating side hits to keep opponents at a distance.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Seitliche Schläge lassen sich ausgezeichnet mit einem Zweihänder koordinieren. Damit hältst du dir die Gegner vom Hals.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Obouruční meče jsou ideální k zasazování bočních úderů, kterými si nepřítele udržíš od těla.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //That should do to begin with. Have a practice.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //Das sollte erst einmal reichen. Übe das.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //To by mohlo pro začátek stačit. Trénuj.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
// ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance GRD_200_Thorus_ZWEIHAND2(C_INFO)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_ZWEIHAND2_Condition;
	information = GRD_200_Thorus_ZWEIHAND2_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
//	description = B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
	description = B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0); 
};

func int GRD_200_Thorus_ZWEIHAND2_Condition()
{ 
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};

};
func void GRD_200_Thorus_ZWEIHAND2_Info()
{
//	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //I want to learn more about fighting with a two-handed sword.
//	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Ich möchte mehr über den zweihändigen Kampf lernen.
	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Chci se dozvědět víc o boji s obouručním mečem.

	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //First of all, you need to change your basic stance. Hold the sword vertically, grasp the hilt firmly in both hands and hold it at the side of your body.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Zunächst ändere deine Grundhaltung. Halte das Schwert aufrecht, fasse den Griff mit beiden Händen und halte es seitlich am Körper.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Ze všeho nejdříve musíš zaujmout základní postoj. Meč musíš držet svisle, stranou od těla a údery vést silně oběma rukama.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Bring it down quickly and swing the blade over your shoulder. Now's your chance to do a quick slash to your right.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Schlage schnell von oben und lass die Klinge über deine Schulter gleiten. Nun hast du die Möglichkeit, einen schnellen Schlag nach rechts zu machen.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Švihnout rychle dolu a ostří vést přes rameno. Pak máš šanci provést rychlý švih napravo.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Your opponent won't have time to come at you.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Damit bietest du dem Gegner keine Chance, an dich ranzukommen.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Tvůj protivník nebude mít šanci se k tobě dostat.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Or bring the sword down from the top left in a forward thrust to drive your opponent back.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Sonst schlage wieder nach vorne von links oben, um so den Gegner zurückzutreiben.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Nebo mečem švihni z levé horní strany směrem dopředu, abys odrazil protivníka dozadu.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Spin around to give your next blow the necessary momentum to strike your opponent down.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Eine schnelle Körperdrehung verleiht deinem nächsten Schlag die nötige Wucht, um den Gegner zu Boden zu zwingen.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Pořád se otáčej, abys následnému švihu vždy dodával potřebnou sílu, která protivníka srazí.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //If it isn't enough, use your remaining swing to wield the sword again.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //Falls das nicht ausreichen sollte, dann nutze den übrigen Schwung, um die Klinge noch einmal tanzen zu lassen.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //Pokud to nebude stačit, zbylý švih využij k novému napřáhnutí meče.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //When you've finished your attack, block your opponent and wait for an opening to strike again.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Geh nach deinem Angriff in den Block und suche eine Lücke, damit du erneut zuschlagen kannst.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Až útok dokončíš, zneškodni protivníka a vyčkej na další souboj.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //The key to success is varying your stances and changing positions.
//		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Abwechslung in den Kampfbewegungen und Positionswechsel sind der Schlüssel zum Sieg.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Klíčem k úspěchu je měnit postoje a polohy.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0;
	};
};  
