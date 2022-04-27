// **************************************************
// EXIT
// **************************************************
instance PC_Psionic_Exit(C_INFO)
{
	npc = PC_Psionic;
	nr = 999;
	condition = PC_Psionic_Exit_Condition;
	information = PC_Psionic_Exit_Info;
	important = 0;
	permanent = 1;
//	description = DIALOG_ENDE;
	description = DIALOG_ENDE;
};

func int PC_Psionic_Exit_Condition()
{
	return 1;
};

func void PC_Psionic_Exit_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
//		AI_Output(self,hero,"Info_Lester_EXIT_05_01"); //Let's go!
//		AI_Output(self,hero,"Info_Lester_EXIT_05_01"); //Dem Ziel entgegen!
		AI_Output(self,hero,"Info_Lester_EXIT_05_01"); //Pojďme!
	}
	else
	{
//		AI_Output(self,hero,"Info_Lester_EXIT_05_02"); //May the Sleeper protect you!
//		AI_Output(self,hero,"Info_Lester_EXIT_05_02"); //Der Schläfer möge dich behüten!
		AI_Output(self,hero,"Info_Lester_EXIT_05_02"); //Kéž tě Spáč ochrání!
	};

	AI_StopProcessInfos(self);
};

// **************************************************
// SAKRILEG! Meister angesprochen
// **************************************************
instance DIA_Lester_Sakrileg(C_INFO)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_Sakrileg_Condition;
	information = DIA_Lester_Sakrileg_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Lester_Sakrileg_Condition()
{
	if (BaalNamib_Sakrileg == TRUE)
	{
		return 1;
	};

	return 0;
};

func void DIA_Lester_Sakrileg_Info()
{
//	AI_Output(self,other,"DIA_Lester_Sakrileg_05_00"); //You addressed a Guru! Never do that again! It's sacrilege! If a master wants to talk to you, HE shall address YOU.
//	AI_Output(self,other,"DIA_Lester_Sakrileg_05_00"); //Du hast einen Guru angesprochen!! Tu das nie wieder! Es ist ein Sakrileg! Wenn der Meister es für richtig hält, mit dir zu reden, wird ER dich ansprechen.
	AI_Output(self,other,"DIA_Lester_Sakrileg_05_00"); //Oslovil jsi Guru! Už to nikdy nedělej! Je to svatokrádež! Když bude s tebou chtít mistr mluvit, ON osloví TEBE.
};

// **************************************************
// Hallo
// **************************************************

instance DIA_Lester_Hallo(C_INFO)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_Hallo_Condition;
	information = DIA_Lester_Hallo_Info;
	important = 0;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};

func int DIA_Lester_Hallo_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};

	return 0;
};

func void DIA_Lester_Hallo_Info()
{
//	AI_Output(other,self,"DIA_Lester_Hallo_15_00"); //Who are you?
//	AI_Output(other,self,"DIA_Lester_Hallo_15_00"); //Wer bist du?
	AI_Output(other,self,"DIA_Lester_Hallo_15_00"); //Kdo jsi?
//	AI_Output(self,other,"DIA_Lester_Hallo_05_01"); //I'm Lester. I take care of the strangers who arrive here.
//	AI_Output(self,other,"DIA_Lester_Hallo_05_01"); //Ich bin Lester. Ich kümmere mich um die Fremden, die hier ankommen.
	AI_Output(self,other,"DIA_Lester_Hallo_05_01"); //Jsem Lester. Starám se o cizince, kteří sem přijdou.
	if (BaalNamib_Sakrileg == FALSE)
	{
//		AI_Output(self,other,"DIA_Lester_Hallo_05_02"); //You're lucky that you didn't talk to Baal Namib. No stranger is allowed to talk to the Gurus.
//		AI_Output(self,other,"DIA_Lester_Hallo_05_02"); //Gut, dass du nicht Baal Namib angesprochen hast. Kein Fremder darf die Gurus ansprechen.
		AI_Output(self,other,"DIA_Lester_Hallo_05_02"); //Máš štěstí, že jsi nemluvil s Baalem Namibem. Žádný cizinec nesmí mluvit s Guru.
	};
};

// **************************************************
// Will mit Meister reden
// **************************************************

instance DIA_Lester_WannaTalkToMaster(C_INFO) //E2
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_WannaTalkToMaster_Condition;
	information = DIA_Lester_WannaTalkToMaster_Info;
	important = 0;
	permanent = 0;
//	description = "But I want to talk to your master.";
//	description = "Ich will aber mit deinem Meister reden.";
	description = "Já ale chci mluvit s tvým mistrem.";
};

func int DIA_Lester_WannaTalkToMaster_Condition()
{
	if (((Npc_KnowsInfo(hero,DIA_Lester_Hallo)) || (Npc_KnowsInfo(hero,DIA_Lester_Sakrileg)))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	&& (!Npc_KnowsInfo(hero,DIA_Lester_ShowHallo)))
	{
		return 1;
	};

	return 0;
};

func void DIA_Lester_WannaTalkToMaster_Info()
{
//	AI_Output(other,self,"DIA_Lester_WannaTalkToMaster_15_00"); //But I want to talk to your master.
//	AI_Output(other,self,"DIA_Lester_WannaTalkToMaster_15_00"); //Ich will aber mit deinem Meister reden.
	AI_Output(other,self,"DIA_Lester_WannaTalkToMaster_15_00"); //Já ale chci mluvit s tvým mistrem.
//	AI_Output(self,other,"DIA_Lester_WannaTalkToMaster_05_01"); //Forget it! I'm sure I can help you with any of your problems.
//	AI_Output(self,other,"DIA_Lester_WannaTalkToMaster_05_01"); //Vergiss es! Ich bin sicher, ICH kann dir bei all deinen Problemen weiterhelfen.
	AI_Output(self,other,"DIA_Lester_WannaTalkToMaster_05_01"); //Zapomeň na to! Jsem si jistý, že ti pomoci s jakýmkoliv tvým problémem!
};

// **************************************************
// Lager-Infos
// **************************************************

instance DIA_Lester_CampInfo(C_INFO) //E2
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_CampInfo_Condition;
	information = DIA_Lester_CampInfo_Info;
	important = 0;
	permanent = 1;
//	description = "Tell me something about the Camp.";
//	description = "Erzähl mir was über das Lager.";
	description = "Řekni mi něco o táboře.";
};

func int DIA_Lester_CampInfo_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&& (Kapitel < 3))
	{
		return 1;
	};

	return 0;
};

func void DIA_Lester_CampInfo_Info()
{
//	AI_Output(other,self,"DIA_Lester_CampInfo_15_00"); //Tell me something about the Camp.
//	AI_Output(other,self,"DIA_Lester_CampInfo_15_00"); //Erzähl mir was über das Lager.
	AI_Output(other,self,"DIA_Lester_CampInfo_15_00"); //Řekni mi něco o táboře.
//	AI_Output(self,other,"DIA_Lester_CampInfo_05_01"); //What do you want to know?
//	AI_Output(self,other,"DIA_Lester_CampInfo_05_01"); //Was willst du wissen?
	AI_Output(self,other,"DIA_Lester_CampInfo_05_01"); //Co chceš vědět?
	Info_Clearchoices (DIA_Lester_CampInfo);
//	Info_Addchoice (DIA_Lester_CampInfo,"DIALOG_BACK",DIA_Lester_CampInfo_BACK);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK);
//	Info_Addchoice (DIA_Lester_CampInfo,"Tell me about the guilds.",DIA_Lester_CampInfo_GIL);
//	Info_Addchoice (DIA_Lester_CampInfo,"Erzähl mir was über die Gilden.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Řekni mi o společenství.",DIA_Lester_CampInfo_GIL);
//	Info_Addchoice (DIA_Lester_CampInfo,"What can you tell me about the Sleeper?",DIA_Lester_CampInfo_SLEEPER);
//	Info_Addchoice (DIA_Lester_CampInfo,"Was hat es mit dem Schläfer auf sich?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Co mi můžeš říci o Spáčovi?",DIA_Lester_CampInfo_SLEEPER);
//	Info_Addchoice (DIA_Lester_CampInfo,"What do you know about the weed?",DIA_Lester_CampInfo_HERB);
//	Info_Addchoice (DIA_Lester_CampInfo,"Was weißt du über das Kraut?",DIA_Lester_CampInfo_HERB);
	Info_Addchoice (DIA_Lester_CampInfo,"Co víš o droze z bažin?",DIA_Lester_CampInfo_HERB);
};

func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
//	AI_Output(other,self,"DIA_Lester_CampInfo_GIL_15_00"); //Tell me about the guilds.
//	AI_Output(other,self,"DIA_Lester_CampInfo_GIL_15_00"); //Erzähl mir was über die Gilden.
	AI_Output(other,self,"DIA_Lester_CampInfo_GIL_15_00"); //Řekni mi o společenství.
//	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_01"); //The Gurus form the highest guild. They are the spirit of this camp, for they have great power. The templars use their spiritual power in battle.
//	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_01"); //Die Gurus bilden die oberste Gilde. Sie sind der Geist des Lagers, denn ihre Macht ist groß. Die Templer benutzen ihre geistige Stärke im Kampf.
	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_01"); //Guru tvoří nejvyšší společenství. Jsou duchem tábora a mají velikou moc. Templáři používají svoji duchovní sílu v boji.
//	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_02"); //They have an indomitable willpower. You should NEVER get into trouble with them. As for myself,I am a novice. We pray to the Sleeper and do all the work in the Camp.
//	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_02"); //Sie haben einen unbezwingbaren Willen. Leg dich besser NIE mit ihnen an. Ich selber gehöre zu den Novizen. Wir beten zum Schläfer und verrichten die Arbeiten, die hier im Lager anfallen.
	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_02"); //Mají nezdolatelnou duchovní sílu. NIKDY by ses s nimi neměl dostat do problému. Já osobně patřím k novicům. Modlíme se ke Spáčovi a pracujeme v táboře.
//	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_03"); //Some of the novices are allowed to join the Gurus, but to get that far you need to study for many years.
//	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_03"); //Einige der Novizen werden als Gurus aufgenommen, aber dazu gehört eine viele Jahre lange Ausbildung.
	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_03"); //Někteří novici se smějí přidat ke Guru, ale aby jim to bylo povoleno, musejí dlouhá léta studovat.
};

func void DIA_Lester_CampInfo_SLEEPER()
{
//	AI_Output(other,self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //What can you tell me about the Sleeper?
//	AI_Output(other,self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Was hat es mit dem Schläfer auf sich?
	AI_Output(other,self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Co mi můžeš říci o Spáčovi?
//	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //The Sleeper's a divine creature. He causes visions - at least to the Gurus.
//	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Der Schläfer ist ein göttliches Wesen. Er schenkt uns Visionen - zumindest den Gurus.
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Spáč je božská bytost. Vytváří vize - aspoň pro Guru.
//	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //We pray to him, for he will give us freedom.
//	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Wir beten zu ihm, denn er wird uns allen die Freiheit schenken.
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Modlíme se k němu, protože on nás osvobodí.
//	AI_Output(other,self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //And you believe that?
//	AI_Output(other,self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //Und daran glaubst du?
	AI_Output(other,self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //A věříte tomu?
//	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Hey, I've been inside the Barrier for two years. Do you know how long TWO YEARS can be?
//	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Hey, ich bin seit zwei Jahren in der Barriere. Weißt du überhaupt wie lange ZWEI JAHRE sein können?
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Hej, jsem v Bariéře už dva roky. Dokážeš si představit, jak dlouhé můžou DVA ROKY být?
//	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //You can't imagine what I'm willing to believe and do, just to get out of here again!
//	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Du kannst dir nicht vorstellen, was ich alles bereit bin zu glauben und zu machen, damit ich hier wieder raus komme!
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Nedokážeš si představit, v co jsem ochotný věřit a co udělat, jen abych se odtud dostal pryč!
};

func void DIA_Lester_CampInfo_HERB()
{
//	AI_Output(other,self,"DIA_Lester_CampInfo_HERB_15_00"); //What do you know about the weed?
//	AI_Output(other,self,"DIA_Lester_CampInfo_HERB_15_00"); //Was weißt du über das Kraut?
	AI_Output(other,self,"DIA_Lester_CampInfo_HERB_15_00"); //Co víš o droze z bažin?
//	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_01"); //Well, the weed's grown in the swamp. Of course it has to be processed before it can be smoked. That's what we novices do.
//	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_01"); //Nun, das Kraut wächst im Sumpf. Es muss natürlich noch verarbeitet werden, damit man es rauchen kann. Das machen wir Novizen.
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_01"); //No, tahle droga roste v bažinách. Před tím, než se může kouřit, se samozřejmě musí zpracovat. To děláme my novicové.
//	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_02"); //The weeds have a tranquilizing and relaxing effect. They help you concentrate on the essentials and increase your awareness.
//	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_02"); //Das Kraut hat eine beruhigende und entspannende Wirkung. Es hilft dir, dich auf das Wesentliche zu konzentrieren und dein Bewusstsein zu öffnen.
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_02"); //Droga má uklidňující a osvěžující účinek. Pomáhá při koncentraci a umocňuje vědomí.
//	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_03"); //We trade them for goods from the Old Camp and we use them to recruit new people as well.
//	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_03"); //Wir tauschen es gegen Waren aus den anderen Lagern und benutzen es, um neue Leute anzuwerben.
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_03"); //Vyměňujeme ji za zboží ze Starého tábora a také ji používáme pro získávání nových lidí.
//	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_04"); //The result is, of course, that some people only join us for the weed. Well, at least they help us with the work in the Camp.
//	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_04"); //Das führt natürlich dazu, dass viele Leute nur wegen des Krauts zu uns kommen. Na ja, immerhin helfen sie bei den anfallenden Arbeiten.
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_04"); //Přirozeně se k nám někteří lidé přidávají jen kvůli té droze. Ale i tak nám alespoň pomáhají s prací v táboře.
};

// **************************************************
// Wanna Join
// **************************************************

instance DIA_Lester_WannaJoin(C_INFO) //E2
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_WannaJoin_Condition;
	information = DIA_Lester_WannaJoin_Info;
	important = 0;
	permanent = 0;
//	description = "I want to become a member of the Brotherhood!";
//	description = "Ich will mich der Bruderschaft anschließen!";
	description = "Chci se stát členem Bratrstva!";
};

func int DIA_Lester_WannaJoin_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Lester_WannaJoin_Info()
{
//	AI_Output(other,self,"DIA_Lester_WannaJoin_15_00"); //I want to become a member of the Brotherhood!
//	AI_Output(other,self,"DIA_Lester_WannaJoin_15_00"); //Ich will mich der Bruderschaft anschließen!
	AI_Output(other,self,"DIA_Lester_WannaJoin_15_00"); //Chci se stát členem Bratrstva!
//	AI_Output(self,other,"DIA_Lester_WannaJoin_05_01"); //Cor Kalom decides whether you're ready to join the Brotherhood.
//	AI_Output(self,other,"DIA_Lester_WannaJoin_05_01"); //Cor Kalom entscheidet, ob du bereit bist, in die Bruderschaft einzutreten.
	AI_Output(self,other,"DIA_Lester_WannaJoin_05_01"); //Cor Kalom rozhodne, jestli jsi připraven vstoupit do Bratrstva.
//	AI_Output(self,other,"DIA_Lester_WannaJoin_05_02"); //But he relies on the advice of other Gurus. Baal Namib, over there, is one of them.
//	AI_Output(self,other,"DIA_Lester_WannaJoin_05_02"); //Aber er verlässt sich auf den Rat der anderen Gurus. Baal Namib hier ist einer von ihnen.
	AI_Output(self,other,"DIA_Lester_WannaJoin_05_02"); //Spoléhá se ale na radu Guru. Baal Namib, támhle ten, je jedním z nich.
//	AI_Output(self,other,"DIA_Lester_WannaJoin_05_03"); //First you'll have to prove that you're worthy and then one of the Gurus will send you to Cor Kalom.
//	AI_Output(self,other,"DIA_Lester_WannaJoin_05_03"); //Du wirst dich erst als würdig erweisen müssen, dann wird dich einer der Gurus zu Cor Kalom schicken.
	AI_Output(self,other,"DIA_Lester_WannaJoin_05_03"); //Nejprve musíš dokázat, že jsi toho hoden a pak tě jeden z Guru pošle za Corem Kalomem.
};

// **************************************************
// Lager-Infos
// **************************************************

instance DIA_Lester_HowProofWorthy(C_INFO) //E2
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_HowProofWorthy_Condition;
	information = DIA_Lester_HowProofWorthy_Info;
	important = 0;
	permanent = 0;
//	description = "How's that supposed to work if none of the Gurus will talk to me?";
//	description = "Wie soll das funktionieren, wenn keiner der Gurus mit mir redet?";
	description = "A jak to funguje, když na mě ani jeden z Guru nepromluví?";
};

func int DIA_Lester_HowProofWorthy_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Lester_WannaJoin))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Lester_HowProofWorthy_Info()
{
//	AI_Output(other,self,"DIA_Lester_HowProofWorthy_15_00"); //How's that supposed to work if none of the Gurus will talk to me?
//	AI_Output(other,self,"DIA_Lester_HowProofWorthy_15_00"); //Wie soll das funktionieren, wenn keiner der Gurus mit mir redet?
	AI_Output(other,self,"DIA_Lester_HowProofWorthy_15_00"); //A jak to funguje, když na mě ani jeden z Guru nepromluví??
//	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_01"); //It might not look like it, but the Gurus observe everything you do here in the Camp.
//	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_01"); //Es hat vielleicht nicht den Anschein, aber die Gurus beobachten genau, was du hier im Lager tust.
	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_01"); //Možná to tak nevypadá, ale Guru sledují všechno, co tady v táboře děláš.
//	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_02"); //If they think that you deserve to become a member of the community, they'll talk to you.
//	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_02"); //Wenn sie der Meinung sind, dass du dich um unsere Gemeinschaft verdient gemacht hast, werden sie dich ansprechen.
	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_02"); //Pokud si myslí, že jsi toho pro Bratrstvo udělal dost, pak na tebe promluví.
//	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_03"); //You're bound to have opportunities in the Camp to prove that you're worthy.
//	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_03"); //Hier im Lager werden sich sicher Gelegenheiten bieten, dich als würdig zu erweisen.
	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_03"); //V táboře máš spoustu možností, jak dokázat, že jsi toho hoden.

	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
//	B_LogEntry(CH1_JoinPsi,"If I want to join the Brotherhood in the swamp camp, I need to impress the Gurus. Unfortunately, they don't speak to new people. Lester, the novice, told me that they observe me nevertheless, and that I need to prove myself worthy to them. I don't have the slightest clue of how to do that! I'd better have a good look around the swamp camp.");
//	B_LogEntry(CH1_JoinPsi,"Wenn ich mich der Bruderschaft im Sumpflager anschließen möchte, muss ich die Gurus beeindrucken. Dummerweise reden sie nicht mit Neuen. Lester der Novize erzählte mir, dass sie mich trotzdem genau beobachten und ich mich in ihrer Nähe würdig erweisen müsse. Ich habe nicht die geringste Ahnung, wie ich das machen soll! Am besten sehe ich mich erst mal im Sumpflager genau um.");
	B_LogEntry(CH1_JoinPsi,"Pokud se budu chtít přidat k Bratrstvu v táboře v bažinách, budu muset udělat dojem na guru. Ti však bohužel nemluví s novými příchozími. Novic Lester mi řekl, že mě přesto pozorují, a že budu potřebovat nějak ukázat, jak bych jim mohl být užitečný. Nemám nejmenší představu o tom, jak to udělat! Raději bych se měl po Táboře v bažinách dobře porozhlédnout.");

};

// **************************************************
// WEIT WEG von BaalNamib
// **************************************************
	var int Lester_Show;
// **************************************************

instance DIA_Lester_WeitWeg(C_INFO) //E2
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_WeitWeg_Condition;
	information = DIA_Lester_WeitWeg_Info;
	important = 0;
	permanent = 0;
//	description = "How can I get your master to talk to me?";
//	description = "Wie bringe ich deinen Meister dazu, mit mir zu reden?";
	description = "Jak přiměju tvého mistra, aby se mnou promluvil?";
};

func int DIA_Lester_WeitWeg_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ((Npc_GetDistToNpc(other,namib) > 1000)
	&& (BaalNamib_Ansprechbar == FALSE)
	&& (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Lester_WeitWeg_Info()
{
//	AI_Output(other,self,"DIA_Lester_WeitWeg_15_00"); //How can I get your master to talk to me?
//	AI_Output(other,self,"DIA_Lester_WeitWeg_15_00"); //Wie bringe ich deinen Meister dazu, mit mir zu reden?
	AI_Output(other,self,"DIA_Lester_WeitWeg_15_00"); //Jak přiměju tvého mistra, aby se mnou promluvil?
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_01"); //You have to know what he wants to hear.
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_01"); //Du musst wissen, was er hören will.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_01"); //Musíš vědět, co chce slyšet.
//	AI_Output(other,self,"DIA_Lester_WeitWeg_15_02"); //And that is?
//	AI_Output(other,self,"DIA_Lester_WeitWeg_15_02"); //Nämlich?
	AI_Output(other,self,"DIA_Lester_WeitWeg_15_02"); //A to je?
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_03"); //Listen: When we're with him the next time, you'll address me and we'll have a little talk.
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_03"); //Pass auf: Wenn wir beide das nächste Mal bei ihm sind, sprichst du mich an, und wir unterhalten uns ein bisschen.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_03"); //Poslouchej: Až u něho příště budeme, oslovíš mě a povedeme spolu krátký rozhovor.
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib is worried because many of the novices don't only pray to the Sleeper, but also to their former gods.
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib macht sich zurzeit große Sorgen, weil viele Novizen nicht nur zum Schläfer beten, sondern auch noch zu ihren alten Göttern.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib má obavy z toho, že se mnozí novici nemodlí jen ke Spáčovi, ale také ke svým dřívějším bohům.
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_05"); //You'll tell me that you've renounced the old gods and that, in future, you'll pray only to the Sleeper.
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_05"); //Du erzählst mir, dass du den alten Göttern abgeschworen hast, und jetzt nur noch den Schläfer anrufst.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_05"); //Ty mi řekneš, že jsi se svých starých bohů zřekl a že se už nadále modlíš výhradně ke Spáčovi.
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_06"); //Then I'll ask you why you made this decision and you'll say that you had a vision in which the Sleeper summoned you.
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_06"); //Daraufhin werde ich dich fragen, was dich dazu bewogen hat, und du sagst, du hattest eine Vision, in der der Schläfer dich zu sich gerufen hat.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_06"); //Pak se tě zeptám, proč jsi se takhle rozhodl a ty řekneš, že jsi měl vizi, ve které tě k tomu Spáč vyzval.
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_07"); //He'll be interested then. Do you think you'll manage that?
//	AI_Output(self,other,"DIA_Lester_WeitWeg_05_07"); //Das sollte sein Interesse wecken. Denkst du, du kriegst das hin?
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_07"); //Pak projeví zájem. Myslíš, že to zvládneš?
//	AI_Output(other,self,"DIA_Lester_WeitWeg_15_08"); //No problem.
//	AI_Output(other,self,"DIA_Lester_WeitWeg_15_08"); //Kein Problem.
	AI_Output(other,self,"DIA_Lester_WeitWeg_15_08"); //Bez problémů.

//	B_LogEntry(CH1_JoinPsi,"To impress Baal Namib, I should address Lester near the Guru and speak about old gods and the Sleeper.");
//	B_LogEntry(CH1_JoinPsi,"Um Baal Namib zu beeindrucken, soll ich Lester in der Nähe des Gurus ansprechen und über alte Götter und den Schläfer reden.");
	B_LogEntry(CH1_JoinPsi,"Abych udělal dojem na Baala Namiba, měl bych v blízkosti tohoto guru oslovit Lestera a vyprávět mu o starých bozích a Spáčovi.");

	Lester_Show = TRUE;
};

// **************************************************
// SHOW - Hallo
// **************************************************

instance DIA_Lester_ShowHallo(C_INFO) //E2
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_ShowHallo_Condition;
	information = DIA_Lester_ShowHallo_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Lester_ShowHallo_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ((Npc_GetDistToNpc(other,namib) < 500)
	&& (BaalNamib_Ansprechbar == FALSE)
	&& (Lester_Show == TRUE)
	&& (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Lester_ShowHallo_Info()
{
//	AI_Output(self,other,"DIA_Lester_ShowHallo_05_00"); //AH! IT'S GOOD TO SEE YOU AGAIN. HOW HAVE YOU BEEN DOING?
//	AI_Output(self,other,"DIA_Lester_ShowHallo_05_00"); //AH! GUT, DICH WIEDER ZU TREFFEN. WIE IST ES DIR ERGANGEN?
	AI_Output(self,other,"DIA_Lester_ShowHallo_05_00"); //AAH! RÁD TĚ ZASE VIDÍM. JAK SE TI VEDE?
};

// **************************************************
// SHOW
// **************************************************

instance DIA_Lester_Show(C_INFO) //E2
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_Show_Condition;
	information = DIA_Lester_Show_Info;
	important = 0;
	permanent = 0;
//	description = "I have renounced the old gods.";
//	description = "Ich habe den alten Göttern abgeschworen.";
	description = "Zřekl jsem se starých bohů.";
};

func int DIA_Lester_Show_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ((Npc_GetDistToNpc(other,namib) < 500)
	&& (BaalNamib_Ansprechbar == FALSE)
	&& (Lester_Show == TRUE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Lester_Show_Info()
{
//	AI_Output(other,self,"DIA_Lester_Show_15_00"); //I HAVE RENOUNCED THE OLD GODS.
//	AI_Output(other,self,"DIA_Lester_Show_15_00"); //ICH HABE DEN ALTEN GÖTTERN ABGESCHWOREN.
	AI_Output(other,self,"DIA_Lester_Show_15_00"); //ZŘEKL JSEM SE STARÝCH BOHŮ.
//	AI_Output(self,other,"DIA_Lester_Show_05_01"); //REALLY? WHAT MADE YOU DO THAT?
//	AI_Output(self,other,"DIA_Lester_Show_05_01"); //EHRLICH? WIE KOMMST DU ZU DIESR ENTSCHEIDUNG?
	AI_Output(self,other,"DIA_Lester_Show_05_01"); //OPRAVDU? CO TĚ K TOMU PŘIMĚLO?
//	AI_Output(other,self,"DIA_Lester_Show_15_02"); //I HAD A VISION: THE SLEEPER TALKED TO ME.
//	AI_Output(other,self,"DIA_Lester_Show_15_02"); //ICH HATTE EINE VISION. DER SCHLÄFER HAT ZU MIR GESPROCHEN.
	AI_Output(other,self,"DIA_Lester_Show_15_02"); //MĚL JSEM VIZI. PROMLUVIL KE MNĚ SPÁČ.
//	AI_Output(self,other,"DIA_Lester_Show_05_03"); //WHAT DID HE SAY?
//	AI_Output(self,other,"DIA_Lester_Show_05_03"); //WAS HAT ER GESAGT?
	AI_Output(self,other,"DIA_Lester_Show_05_03"); //CO TI ŘÍKAL?
//	AI_Output(other,self,"DIA_Lester_Show_15_04"); //HE SAID: GO TO THE CAMP IN THE SWAMP AND JOIN THE BROOTHERHOOD.
//	AI_Output(other,self,"DIA_Lester_Show_15_04"); //ER SAGTE, GEH IN DAS LAGER IM SUMPF UND SCHLIESS DICH DER BRUDERSCHAFT AN.
	AI_Output(other,self,"DIA_Lester_Show_15_04"); //ŘEKL: JDI DO TÁBORA V BAŽINÁCH A PŘIDEJ SE K BRATRSTVU.
//	AI_Output(self,other,"DIA_Lester_Show_05_05"); //YOU'RE A VERY RICH MAN, STRANGER: THE SLEEPER DOESN'T REWARD MANY PEOPLE LIKE THAT.
//	AI_Output(self,other,"DIA_Lester_Show_05_05"); //DU BIST EIN SEHR REICHER MANN, FREMDER, DER SCHLÄFER BELOHNT NICHT VIELE AUF DIESE WEISE.
	AI_Output(self,other,"DIA_Lester_Show_05_05"); //JSI VELMI ŠŤASTNÝ MUŽ, CIZINČE. SPÁČ TAKTO NEPROMLOUVÁ K MNOHA LIDEM.

	BaalNamib_Ansprechbar = TRUE;

	AI_StopProcessInfos(self);
};

// **************************************************
// GUIDE Offer
// **************************************************

instance DIA_Lester_GuideOffer(C_INFO) //E3
{
	npc = PC_Psionic;
	nr = 5;
	condition = DIA_Lester_GuideOffer_Condition;
	information = DIA_Lester_GuideOffer_Info;
	important = 0;
	permanent = 0;
//	description = "How can I find my way around here in the Camp?";
//	description = "Wie kann ich mich hier im Lager zurechtfinden?";
	description = "Jak se mám tady v táboře vyznat?";
};

func int DIA_Lester_GuideOffer_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&& (Kapitel < 3))
	{
		return 1;
	};

	return 0;
};

func void DIA_Lester_GuideOffer_Info()
{
//	AI_Output(other,self,"DIA_Lester_GuideOffer_15_00"); //How can I find my way around here in the Camp?
//	AI_Output(other,self,"DIA_Lester_GuideOffer_15_00"); //Wie kann ich mich hier im Lager zurechtfinden?
	AI_Output(other,self,"DIA_Lester_GuideOffer_15_00"); //Jak se mám tady v táboře vyznat?
//	AI_Output(self,other,"DIA_Lester_GuideOffer_05_01"); //I can show you the most important places.
//	AI_Output(self,other,"DIA_Lester_GuideOffer_05_01"); //Ich kann dir die wichtigen Orte zeigen.
	AI_Output(self,other,"DIA_Lester_GuideOffer_05_01"); //Můžu ti ukázat nejdůležitější místa.
};

// **************************************************
// FÜHRUNG DURCHS PSI-CAMP
// **************************************************

// -----------UNTERWEGS--------------------
instance PC_Psionic_SOON(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_SOON_Condition;
	information = PC_Psionic_SOON_Info;
	important = 0;
	permanent = 1;
//	description = "Are we nearly there yet?";
//	description = "Sind wir gleich da?";
	description = "Už tam budeme?";
};

func int PC_Psionic_SOON_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Lester_GuideOffer))
	&& (Kapitel < 3)
	&& (LesterGuide >= 1))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_SOON_Info()
{
//	AI_Output(other,self,"PC_Psionic_SOON_Info_15_01"); //Are we nearly there yet?
//	AI_Output(other,self,"PC_Psionic_SOON_Info_15_01"); //Sind wir gleich da?
	AI_Output(other,self,"PC_Psionic_SOON_Info_15_01"); //Už tam budeme?
//	AI_Output(self,other,"PC_Psionic_SOON_Info_05_02"); //If you stopped asking me, we'd get there much faster.
//	AI_Output(self,other,"PC_Psionic_SOON_Info_05_02"); //Wenn du aufhörst, mich zu fragen, geht es schneller.
	AI_Output(self,other,"PC_Psionic_SOON_Info_05_02"); //Když se mě přestaneš ptát, půjde to rychleji.
	AI_StopProcessInfos(self);
};

//------ UNTERWEGS IM SUMPFLAGER UND ROUTE ÄNDERN ----------------
instance PC_Psionic_CHANGE(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_CHANGE_Condition;
	information = PC_Psionic_CHANGE_Info;
	important = 0;
	permanent = 1;
//	description = "I've changed my mind.";
//	description = "Ich habe es mir anders überlegt";
	description = "Rozmyslel jsem se.";
};

func int PC_Psionic_CHANGE_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Lester_GuideOffer)
	&& (Kapitel < 3)
	&& (LesterGuide >= 1))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_CHANGE_Info()
{
//	AI_Output(other,self,"PC_Psionic_CHANGE_Info_15_01"); //I've changed my mind.
//	AI_Output(other,self,"PC_Psionic_CHANGE_Info_15_01"); //Ich habe es mir anders überlegt.
	AI_Output(other,self,"PC_Psionic_CHANGE_Info_15_01"); //Rozmyslel jsem se.
//	AI_Output(self,other,"PC_Psionic_CHANGE_Info_05_02"); //Suppose you know where to find me.
//	AI_Output(self,other,"PC_Psionic_CHANGE_Info_05_02"); //Du weißt ja, wo du mich finden kannst.
	AI_Output(self,other,"PC_Psionic_CHANGE_Info_05_02"); //Doufám, že víš, kde mě najdeš.
	AI_StopProcessInfos(self);
	LesterGuide = 0;
	Npc_ExchangeRoutine(self,"START");
};

//------------------FÜHRUNG DURCH DAS LAGER
instance PC_Psionic_GUIDEFIRST(C_INFO)
{
	npc = PC_Psionic;
	nr = 5;
	condition = PC_Psionic_GUIDEFIRST_Condition;
	information = PC_Psionic_GUIDEFIRST_Info;
	important = 0;
	permanent = 1;
//	description = "Show me the way...";
//	description = "Zeig mir den Weg...";
	description = "Ukaž mi cestu...";
};

func int PC_Psionic_GUIDEFIRST_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_LESTER_GuideOffer)
	&& (Kapitel < 3)
	&& (LesterGuide == 0))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_GUIDEFIRST_Info()
{
//	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Show me the way...
//	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Zeig mir den Weg ...
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Ukaž mi cestu...
// AI_Output(self,other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?

	Info_ClearChoices(PC_Psionic_GUIDEFIRST);

	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
//	Info_Addchoice (PC_Psionic_GUIDEFIRST,"back to the main gate",PC_Psionic_GUIDEFIRST_MAINGATE);
//	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zurück zum Hauptor",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zpátky k hlavní bráně.",PC_Psionic_GUIDEFIRST_MAINGATE);
//	Info_Addchoice (PC_Psionic_GUIDEFIRST,"to the smithy",PC_Psionic_GUIDEFIRST_SMITH);
//	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zur Schmiede",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"do kovárny.",PC_Psionic_GUIDEFIRST_SMITH);
//	Info_Addchoice (PC_Psionic_GUIDEFIRST,"to the temple",PC_Psionic_GUIDEFIRST_TEMPEL);
//	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zum Tempel",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"k chrámu.",PC_Psionic_GUIDEFIRST_TEMPEL);
//	Info_Addchoice (PC_Psionic_GUIDEFIRST,"to the tutors",PC_Psionic_GUIDEFIRST_TRAIN);
//	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zu den Lehrern",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"k učitelům.",PC_Psionic_GUIDEFIRST_TRAIN);
//	Info_Addchoice (PC_Psionic_GUIDEFIRST,"to the alchemy lab",PC_Psionic_GUIDEFIRST_HERB);
//	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zum Alchemielabor",PC_Psionic_GUIDEFIRST_HERB);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"do alchymistické dílny.",PC_Psionic_GUIDEFIRST_HERB);
};

func void PC_Psionic_GUIDEFIRST_MAINGATE()
{
	Npc_ClearAIQueue (self);
	Info_ClearChoices(PC_Psionic_GUIDEFIRST);
	LesterGuide = 0;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void PC_Psionic_GUIDEFIRST_SMITH()
{
//	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //... to the blacksmith shop.
//	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //... zur Schmiede.
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //...do kovárny.
//	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //Follow me!
//	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //folge mir!
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //Pojď za mnou!
	LesterGuide = 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
//	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //... to the temple.
//	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //... zum Tempel.
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //...k chrámu.
//	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //Follow me!
//	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //folge mir!
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //Pojď za mnou!
	LesterGuide = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
//	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //... to the tutors.
//	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //... zu den Lehrern.
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //...k učitelům.
//	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //Follow me!
//	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //folge mir!
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //Pojď za mnou!
	LesterGuide = 3;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
//	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //... to the alchemy lab!
//	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //... zum Alchemielabor!
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //...do alchymistické dílny.
//	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //Follow me!
//	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //folge mir!
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //Pojď za mnou!
	LesterGuide = 4;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void PC_Psionic_GUIDEFIRST_BACK()
{
	Info_ClearChoices(PC_Psionic_GUIDEFIRST);
};

// ***************************** Am Platz der Lehrer ****************************************//

instance PC_Psionic_TRAIN(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_TRAIN_Condition;
	information = PC_Psionic_TRAIN_Info;
	important = 1;
	permanent = 1;
};
func int PC_Psionic_TRAIN_Condition()
{
	if ((Npc_GetDistToWP(self,"PSI_PATH_9_4") < 500)
	&& (LesterGuide == 3))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_TRAIN_Info()
{
//	AI_Output(self,other,"PC_Psionic_TRAIN_Info_05_01"); //Down there you'll find Baal Cadar. He teaches the novices.
//	AI_Output(self,other,"PC_Psionic_TRAIN_Info_05_01"); //Hier unten findest du Baal Cadar. Er unterrichtet die Novizen.
	AI_Output(self,other,"PC_Psionic_TRAIN_Info_05_01"); //Dole najdeš Baala Cadara. Vyučuje novice.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
//	AI_Output(self,other,"PC_Psionic_TRAIN_Info_05_02"); //Climbing up this ladder will take you to the templars' training ground. I'll wait for you right here. If you fall behind, I'll be with Baal Namib again, at the entrance to the Camp.
//	AI_Output(self,other,"PC_Psionic_TRAIN_Info_05_02"); //Die Leiter rauf kommst du zum Übungsplatz der Templer. Ich warte hier auf dich. Wenn du trödelst, dann triffst du mich wieder bei Baal Namib am Eingang des Lagers.
	AI_Output(self,other,"PC_Psionic_TRAIN_Info_05_02"); //Tento žebřík vede na templářské cvičiště. Budu tady na tebe čekat. Kdyby ses zpozdil, budu zase u Baala Namiba u vchodu do tábora.

	LesterGuide = 0;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay     (00,00,00,55,"PSI_PATH_9_4");
	TA_EndOverlay (self);
};

// ***************************** Am Tempelplatz ****************************************//
instance PC_Psionic_TEMPEL(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_TEMPEL_Condition;
	information = PC_Psionic_TEMPEL_Info;
	important = 1;
	permanent = 0;
};

func int PC_Psionic_TEMPEL_Condition()
{
	if ((Npc_GetDistToWP(self,"PSI_TEMPLE_NOVIZE_PR") < 600)
	&& (LesterGuide == 2))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_TEMPEL_Info()
{
//	AI_Output(self,other,"PC_Psionic_TEMPEL_Info_05_01"); //That's the temple! I'll wait for you, but if you take too long, I'll go back to Baal Namib.
//	AI_Output(self,other,"PC_Psionic_TEMPEL_Info_05_01"); //Hier ist der Tempel! Ich werde auf dich warten, aber wenn du dir zu viel Zeit lässt, dann gehe ich zurück zu Baal Namib.
	AI_Output(self,other,"PC_Psionic_TEMPEL_Info_05_01"); //Tohle je chrám! Počkám na tebe, ale když ti to bude moc dlouho trvat, půjdu zpátky k Baalu Namibovi.

	LesterGuide = 0;

	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_TEMPLE_NOVIZE_PR");
	TA_EndOverlay (self);
};

// ***************************** An der Schmiede ****************************************//
instance PC_Psionic_SMITH(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_SMITH_Condition;
	information = PC_Psionic_SMITH_Info;
	important = 1;
	permanent = 0;
};

func int PC_Psionic_SMITH_Condition()
{
	if ((Npc_GetDistToWP(self,"PSI_SMITH_IN") < 900)
	&& (LesterGuide == 1))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_SMITH_Info()
{
//	AI_Output(self,other,"PC_Psionic_SMITH_Info_05_01"); //"That's the smithy! Have a look around; I'll wait here for about an hour, then I'll leave."
//	AI_Output(self,other,"PC_Psionic_SMITH_Info_05_01"); //Hier ist die Schmiede! Schau dich um, ich warte etwa eine Stunde, dann haue ich wieder ab.
	AI_Output(self,other,"PC_Psionic_SMITH_Info_05_01"); //Tohle je kovárna. Rozhlédni se tu. Počkám na tebe asi hodinu, pak půjdu pryč.
	LesterGuide = 0;

	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_SMITH_IN");
	TA_EndOverlay (self);
};

// ***************************** Beim Krauthändler ****************************************//
instance PC_Psionic_HERB(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_HERB_Condition;
	information = PC_Psionic_HERB_Info;
	important = 1;
	permanent = 0;
};

func int PC_Psionic_HERB_Condition()
{
	if ((Npc_GetDistToWP(self,"PSI_WALK_06") < 800)
	&& (LesterGuide == 4))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_HERB_Info()
{
//	AI_Output(self,other,"PC_Psionic_HERB_Info_05_01"); //If you climb up this ladder you'll meet Kalom, the alchemist. Down here is Fortuno, the weed merchant.
//	AI_Output(self,other,"PC_Psionic_HERB_Info_05_01"); //Wenn du die Leiter raufsteigst, dann kommst du zu Kalom, dem Alchemisten. Hier unten steht Fortuno, der Krauthändler.
	AI_Output(self,other,"PC_Psionic_HERB_Info_05_01"); //Když vylezeš po tomhle žebříku, dostaneš se k alchymistovi Corovi Kalomovi. Tady dole stojí Fortuno, obchodník s drogou.
//	AI_Output(self,other,"PC_Psionic_HERB_Info_05_02"); //I'll wait for you right here. But don't take too long, otherwise I'll go back.
//	AI_Output(self,other,"PC_Psionic_HERB_Info_05_02"); //Ich warte hier auf dich, aber lass dir nicht zu viel Zeit, sonst gehe ich wieder zurück.
	AI_Output(self,other,"PC_Psionic_HERB_Info_05_02"); //Počkám tu na tebe. Nebuď tam ale moc dlouho, jinak se vrátím zpátky.

	LesterGuide = 0;

	Npc_ExchangeRoutine(self,"START");

	AI_StopProcessInfos(self);

	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_32_HUT_EX");
	TA_EndOverlay (self);
};

//#####################################################################
//##
//##
//## KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
// Info SEND
//---------------------------------------------------------------------
instance PC_Psionic_SEND(C_INFO)// PC muss im ersten Kapitel schon mal mit Lester geredet haben
{
	npc = PC_Psionic;
	condition = PC_Psionic_SEND_Condition;
	information = PC_Psionic_SEND_Info;
	important = 1;
	permanent = 0;
};

func int PC_Psionic_SEND_Condition()
{
	//SN: NICHT auf Kapitel 2 abfragen, Kapitelwechel geschieht erst unten zentral für alle SC-Gilden!!!
	if ((Npc_GetTrueGuild(hero) != GIL_NONE)
	&& (YBerion_BringFocus != LOG_RUNNING)
	&& (YBerion_BringFocus != LOG_SUCCESS))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_SEND_Info()
{
	AI_GotoNpc(self,hero);
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	{
//		AI_Output(self,other,"PC_Psionic_SEND_Info_05_00"); //I'm glad you're here. I have news for you.
//		AI_Output(self,other,"PC_Psionic_SEND_Info_05_00"); //Gut, dass du da bist. Ich habe Neuigkeiten.
		AI_Output(self,other,"PC_Psionic_SEND_Info_05_00"); //Jsem rád, že jsi tady. Mám pro tebe noviny.
//		AI_Output(other,self,"PC_Psionic_SEND_Info_15_01"); //Good news, I hope.
//		AI_Output(other,self,"PC_Psionic_SEND_Info_15_01"); //Ich hoffe, gute Neuigkeiten.
		AI_Output(other,self,"PC_Psionic_SEND_Info_15_01"); //Doufám, že dobré.
	};
//	AI_Output(self,other,"PC_Psionic_SEND_Info_05_02"); //Our Brotherhood's planning a really big thing.
//	AI_Output(self,other,"PC_Psionic_SEND_Info_05_02"); //Unsere Bruderschaft plant etwas ganz Großes.
	AI_Output(self,other,"PC_Psionic_SEND_Info_05_02"); //Naše Bratrstvo plánuje něco skutečně velkého.
//	AI_Output(other,self,"PC_Psionic_SEND_Info_15_03"); //What are you planning? To break out?
//	AI_Output(other,self,"PC_Psionic_SEND_Info_15_03"); //Was plant ihr denn? Den Ausbruch?
	AI_Output(other,self,"PC_Psionic_SEND_Info_15_03"); //Co plánujete? Únik?
//	AI_Output(self,other,"PC_Psionic_SEND_Info_05_04"); //The Gurus are trying to contact the Sleeper. But they need something to unite their powers.
//	AI_Output(self,other,"PC_Psionic_SEND_Info_05_04"); //Die Gurus versuchen, Kontakt zum Schläfer herzustellen. Aber sie brauchen etwas, um ihre Kräfte zu bündeln.
	AI_Output(self,other,"PC_Psionic_SEND_Info_05_04"); //Guru se pokoušejí navázat spojení se Spáčem. Potřebují ale nějak sjednotit své síly.
//	AI_Output(other,self,"PC_Psionic_SEND_Info_15_05"); //Oh, and?
//	AI_Output(other,self,"PC_Psionic_SEND_Info_15_05"); //Ja, und?
	AI_Output(other,self,"PC_Psionic_SEND_Info_15_05"); //No a?
//	AI_Output(self,other,"PC_Psionic_SEND_Info_05_06"); //They need a magical object, a focus.
//	AI_Output(self,other,"PC_Psionic_SEND_Info_05_06"); //Sie brauchen einen magischen Gegenstand, einen Fokus.
	AI_Output(self,other,"PC_Psionic_SEND_Info_05_06"); //Potřebují magický předmět, ohnisko.

	B_Kapitelwechsel (2);
};

//---------------------------------------------------------------------
// Info BROTHERHOOD_TODO
//---------------------------------------------------------------------
instance PC_Psionic_BROTHERHOOD_TODO(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_BROTHERHOOD_TODO_Condition;
	information = PC_Psionic_BROTHERHOOD_TODO_Info;
	important = 0;
	permanent = 0;
//	description = "What's that got to do with me?";
//	description = "Was kann ich dabei tun?";
	description = "A co já s tím mám dělat?";
};

func int PC_Psionic_BROTHERHOOD_TODO_Condition()
{
	if (Npc_KnowsInfo(hero,PC_Psionic_SEND))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_BROTHERHOOD_TODO_Info()
{
//	AI_Output(other,self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //What's that got to do with me?
//	AI_Output(other,self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //Was kann ich dabei tun?
	AI_Output(other,self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //A co já s tím mám dělat?
//	AI_Output(self,other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Talk to Y'Berion. He's the most powerful man around here. This is the opportunity to attain his favor.
//	AI_Output(self,other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Sprich mit Y'Berion. Er ist der mächtigste Mann hier. Dies ist die Gelegenheit, seine Gunst zu erringen.
	AI_Output(self,other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Promluv s Y´Berionem. Je tady nejmocnější muž. Je to možnost, jak u něj dosáhnout obliby.
//	AI_Output(other,self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Where do I find him?
//	AI_Output(other,self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Wo finde ich ihn?
	AI_Output(other,self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Kde ho najdu?
//	AI_Output(self,other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Go to the temple. He rarely leaves it. Probably he feels closer to the Sleeper in those cold ruins.
//	AI_Output(self,other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Geh zum Tempel. Er kommt selten dort heraus. Wahrscheinlich fühlt er sich in diesem kalten Gemäuer dem Schläfer näher.
	AI_Output(self,other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Jdi do chrámu. Zřídkakdy ho opouští. Zřejmě se v těch chladných zdech cítí být blíž Spáčovi.

	Log_CreateTopic(CH2_Focus,LOG_MISSION);
	Log_SetTopicStatus(CH2_Focus,LOG_RUNNING);
//	B_LogEntry(CH2_Focus,"Lester, the novice, told me that Y'Berion is looking for a magic focus stone. The Guru is inside the temple mountain.");
//	B_LogEntry(CH2_Focus,"Der Novize Lester erzählte, dass Y'Berion einen magischen Fokus sucht. Der Guru hält sich im Inneren des Tempelbergs auf.");
	B_LogEntry(CH2_Focus,"Novic Lester mi řekl, že se Y´Berion shání po kouzelném ohniskovém kameni. Guru se zdržuje uvnitř chrámové hory.");

	var C_NPC YBerion;
	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};

//---------------------------------------

//#####################################################################
//##
//##
//## KAPITEL 3
//##
//##
//#####################################################################

// Suche Nach Dem Fokus In Der Bergfestung

//---------------------------------------------------------------------
// Info FOLLOWME
//---------------------------------------------------------------------
instance PC_Psionic_FOLLOWME(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_FOLLOWME_Condition;
	information = PC_Psionic_FOLLOWME_Info;
	important = 1;
	permanent = 0;
};

func int PC_Psionic_FOLLOWME_Condition()
{
	if ((Npc_GetDistToWp (hero,"LOCATION_19_01") < 400)
	&& (Npc_GetDistToNpc(hero,PC_PSIONIC) < 400))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_FOLLOWME_Info()
{
	AI_GotoNpc(self,hero);
//	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_01"); //Hey, what are you doing here?
//	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_01"); //Hey, was machst du denn hier?
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_01"); //Hej, co tady děláš?
//	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_02"); //I came here by order of the Magicians of Water. I'm looking for magical artefacts, so-called focus stones.
//	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_02"); //Ich bin im Auftrag der Wassermagier unterwegs. Ich suche magische Artefakte, sogenannte Fokussteine.
	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_02"); //Přišel jsem na rozkaz mágů Vody. Hledám kouzelné artefakty, takzvané ohniskové kameny.
//	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_03"); //You're looking for the focus stones? You're really brave.
//	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_03"); //Du bist auf der Suche nach den Fokussteinen? Das ist verdammt mutig.
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_03"); //Ty hledáš ohniskové kameny? Jsi opravdu smělý.
//	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas and the other magicians from the New Camp want to use it to detonate the Barrier in order to free us from this imprisonment.
//	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas und die anderen Magier aus dem Neuen Lager wollen damit die Barriere sprengen, die uns alle gefangen hält.
	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas a ostatní mágové z Nového tábora je chtějí použít k rozboření Bariéry, která nás zde vězní.
//	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_05"); //I'll believe that when I see it with my own eyes.
//	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_05"); //Das glaube ich erst, wenn ich es gesehen habe.
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_05"); //Tomu uvěřím, jedině až to uvidím na vlastní oči.
//	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_06"); //I feel the same. But tell me, why did you come here?
//	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_06"); //Das geht mir ähnlich, aber erzähl, was führt dich her?
	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_06"); //Taky to tak cítím. Ale řekni mi, proč jsi sem přišel?
//	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_07"); //I'm weighing up if it's worthwhile paying a visit to the mountain fort.
//	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_07"); //Ich wäge gerade ab, ob es sich lohnt, der Festung einen Besuch abzustatten.
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_07"); //Zvažuju, jestli má cenu se vydat na návštěvu horské pevnosti.
//	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_08"); //You know,... there is a document I'd like to get. On the other hand it's quite risky to go in there.
//	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_08"); //Es gibt nämlich eine alte Urkunde, die ich gerne in meiner Tasche hätte. Andererseits ist es nicht ganz ungefährlich, dort hineinzugehen.
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_08"); //Víš... existuje jeden dokument, který bych rád získal. Na druhou stranu je to dost nebezpečné, tam chodit.
};

// ***************************** INFOS ****************************************//
instance PC_Psionic_GOLEM(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_GOLEM_Condition;
	information = PC_Psionic_GOLEM_Info;
	important = 0;
	permanent = 0;
//	description = "How did you manage to get past that living mountain?";
//	description = "Wie bist du eigentlich an dem wandelnden Steinhaufen vorbeigekommen?";
	description = "Jak se ti podařilo dostat se přes tu chodící hromadu kamení?";
};

func int PC_Psionic_GOLEM_Condition()
{
	if ((Npc_KnowsInfo(hero,PC_Psionic_FOLLOWME))
	&& (!Npc_KnowsInfo(hero,PC_Psionic_FINISH)))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_GOLEM_Info()
{
//	AI_Output(other,self,"PC_Psionic_NORMAL_Info_15_01"); //How did you manage to get past that living mountain?
//	AI_Output(other,self,"PC_Psionic_NORMAL_Info_15_01"); //Wie bist du eigentlich an dem wandelnden Steinhaufen vorbeigekommen?
	AI_Output(other,self,"PC_Psionic_NORMAL_Info_15_01"); //Jak se ti podařilo dostat se přes tu chodící hromadu kamení?
//	AI_Output(self,other,"PC_Psionic_NORMAL_Info_05_02"); //I've learned a lot from the Gurus. Their magic can be really helpful.
//	AI_Output(self,other,"PC_Psionic_NORMAL_Info_05_02"); //Ich habe einiges von den Gurus gelernt. Vor allem ihre Magie erweist sich immer wieder als sehr hilfreich.
	AI_Output(self,other,"PC_Psionic_NORMAL_Info_05_02"); //Hodně jsem se toho naučil od Guru. Jejich kouzla mohou být opravdu užitečná.
};

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------

instance PC_Psionic_STORY(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_STORY_Condition;
	information = PC_Psionic_STORY_Info;
	important = 0;
	permanent = 0;
//	description = "This document you're looking for... what is it?";
//	description = "Was ist das für eine Urkunde, die du suchst?";
	description = "Co je to za dokument, který hledáš?";
};

func int PC_Psionic_STORY_Condition()
{
	if (Npc_KnowsInfo(hero,PC_Psionic_FOLLOWME))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_STORY_Info()
{
//	AI_Output(other,self,"PC_Psionic_STORY_Info_15_01"); //This document you're looking for... what is it?
//	AI_Output(other,self,"PC_Psionic_STORY_Info_15_01"); //Was ist das für eine Urkunde, die du suchst?
	AI_Output(other,self,"PC_Psionic_STORY_Info_15_01"); //Co je to za dokument, který hledáš?
//	AI_Output(self,other,"PC_Psionic_STORY_Info_05_02"); //Many years ago, the lord of this area lived in this mountain fort. He controlIed the land and the mines.
//	AI_Output(self,other,"PC_Psionic_STORY_Info_05_02"); //In dieser Bergfestung lebte vor vielen Jahren der Lehnsherr dieses Landstriches. Ihm unterstanden das Land und die Minen.
	AI_Output(self,other,"PC_Psionic_STORY_Info_05_02"); //Před mnoha lety žil v té horské pevnosti pán této oblasti. Měl pod kontrolou zem i doly.
//	AI_Output(self,other,"PC_Psionic_STORY_Info_05_03"); //Like any other aristocrat, he had, of course, a document to verify his tenure. And I'll get this document.
//	AI_Output(self,other,"PC_Psionic_STORY_Info_05_03"); //Er hatte natürlich, wie jeder Adelige, eine Urkunde über den Besitz. Und die werde ich mir holen.
	AI_Output(self,other,"PC_Psionic_STORY_Info_05_03"); //Tak jako ostatní šlechtici i on samozřejmě měl doklad, který potvrzoval jeho lenní majetek. A právě tento dokument chci získat.
//	AI_Output(other,self,"PC_Psionic_STORY_Info_15_04"); //But as long as we are being kept in here by the Barrier, it won't be worth anything.
//	AI_Output(other,self,"PC_Psionic_STORY_Info_15_04"); //Aber solange die Barriere uns gefangen hält, nützt sie dir gar nichts.
	AI_Output(other,self,"PC_Psionic_STORY_Info_15_04"); //Ale dokud nás tu Bariéra drží, nemůžeš jej stejně použít.
//	AI_Output(self,other,"PC_Psionic_STORY_Info_05_05"); //That's right. But if the water mages manage to destroy the Barrier, the document might become quite valuable again.
//	AI_Output(self,other,"PC_Psionic_STORY_Info_05_05"); //Das stimmt. Aber wenn die Wassermagier es doch schaffen, die Barriere zu zerstören, dann könnte die Urkunde wieder einiges wert sein.
	AI_Output(self,other,"PC_Psionic_STORY_Info_05_05"); //To je pravda. Pokud se ale mágům Vody podaří zničit Bariéru, dokument znovu nabude značné hodnoty.
};

// ***************************** INFOS ****************************************//

instance PC_Psionic_COMEWITHME(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_COMEWITHME_Condition;
	information = PC_Psionic_COMEWITHME_Info;
	important = 0;
	permanent = 0;
//	description = "We could have a look around the fort together!";
//	description = "Wir könnten die Festung gemeinsam erkunden!";
	description = "Mohli bychom se podívat na tu pevnost společně.";
};

func int PC_Psionic_COMEWITHME_Condition()
{
	if ((Npc_KnowsInfo(hero,PC_Psionic_STORY))
	&& (Npc_KnowsInfo(hero,PC_Psionic_GOLEM)))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_COMEWITHME_Info()
{
//	AI_Output(other,self,"PC_Psionic_COMEWITHME_Info_15_01"); //We could have a look around the fort together!
//	AI_Output(other,self,"PC_Psionic_COMEWITHME_Info_15_01"); //Wir könnten die Festung gemeinsam erkunden!
	AI_Output(other,self,"PC_Psionic_COMEWITHME_Info_15_01"); //Mohli bysme se podívat na tu pevnost společně.
//	AI_Output(self,other,"PC_Psionic_COMEWITHME_Info_05_02"); //That's a good idea. You go first, I'll stay near you.
//	AI_Output(self,other,"PC_Psionic_COMEWITHME_Info_05_02"); //Ein guter Vorschlag. Geh du voraus, ich bleibe in deiner Nähe.
	AI_Output(self,other,"PC_Psionic_COMEWITHME_Info_05_02"); //To je dobrý nápad. Jdi první, zůstanu blízko tebe.

	Log_CreateTopic(CH3_Fortress,LOG_MISSION);
	Log_SetTopicStatus(CH3_Fortress,LOG_RUNNING);
//	B_LogEntry(CH3_Fortress,"I met the novice Lester from the swamp camp in front of a massive fortress, which was built into the mountain. He's looking for a document in the building, and joined me in my search for the focus.");
//	B_LogEntry(CH3_Fortress,"Vor einer riesenhaften Festung, die in ein Bergmassiv hineingabaut wurde, traf ich den Novizen Lester aus dem Sumpflager. Er selbst will eine Urkunde in diesen Gemäuern finden und hat sich mir auf meiner Fokussuche angeschlossen.");
	B_LogEntry(CH3_Fortress,"Před mohutnou pevností, která byla vybudována v horách, jsem se setkal s novicem Lesterem z Tábora v bažinách. Sám se chce v jejích zdech porozhlédnout po nějaké listině a přidal se ke mně při hledání ohniska.");

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FORTRESSFOLLOW");
	AI_StopProcessInfos(self);
};

//--------------------SPIELER KOMMT MIT LESTER ZUM FOKUSPLATZ-------------------

instance PC_Psionic_FOKUSPLACE(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_FOKUSPLACE_Condition;
	information = PC_Psionic_FOKUSPLACE_Info;
	important = 1;
	permanent = 0;
};

func int PC_Psionic_FOKUSPLACE_Condition()
{
	if (Npc_GetDistToWp (hero,"LOCATION_19_03_PATH_RUIN7") < 400)
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_FOKUSPLACE_Info()
{
	AI_GotoNpc(self,hero);
	//AI_PointAt(FOKUSWP)
//	AI_Output(self,other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Look, looks like the focus you're looking for is up there.
//	AI_Output(self,other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Sieh mal, dort oben scheint der Fokus zu sein, den du suchst.
	AI_Output(self,other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Podívej, tohle vypadá jako to ohnisko, které hledáš.
//	AI_Output(other,self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Right, looks like a focus platform, hm... It's not that easy to reach it...
//	AI_Output(other,self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Ja, sieht aus wie ein Fokusplatz, hm ... so einfach komme ich da nicht dran ...
	AI_Output(other,self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Ano, vypadá to jako ohniskový podstavec, hmm... Není snadné se tam dostat...
	AI_StopProcessInfos(self);

//	B_LogEntry(CH3_Fortress,"The focus I'm looking for is on a pedestal. It's too high to climb to, though. I need to find another way of getting to the artifact.");
//	B_LogEntry(CH3_Fortress,"Der Fokus den ich suche befindet sich auf einem Podest. Es ist zu hoch um zu klettern. Ich muss einen anderen Weg finden, an das Artefakt heranzukommen.");
	B_LogEntry(CH3_Fortress,"Ohnisko, které hledám, stojí na podstavci. Je však příliš vysoko, než abych pro něj mohl vylézt. Musím najít nějaký způsob, jak tento artefakt získat.");

	Wld_InsertNpc (Harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc (Harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc (Harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

// ---------SPIELER WILL ÜBER DIE BRÜCKE OHNE DEN AUFTRAG ERFÜLLT ZU HABEN--------

instance PC_Psionic_COMEBACK(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_COMEBACK_Condition;
	information = PC_Psionic_COMEBACK_Info;
	important = 1;
	permanent = 0;
};

func int PC_Psionic_COMEBACK_Condition()
{
	if ((Npc_GetDistToWp (hero,"PATH_TO_PLATEAU04_BRIDGE2") < 600)
	&& (Npc_KnowsInfo(hero,PC_Psionic_FOLLOWME))
	&& (!Npc_HasItems(hero,Focus_3)))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_COMEBACK_Info()
{
	AI_GotoNpc(self,hero);
//	AI_Output(self,other,"PC_Psionic_COMEBACK_Info_05_01"); //Where are you going? We're not finished here yet!
//	AI_Output(self,other,"PC_Psionic_COMEBACK_Info_05_01"); //Wo willst du hin? Wir sind hier noch nicht fertig!
	AI_Output(self,other,"PC_Psionic_COMEBACK_Info_05_01"); //Kam chceš jít? Ještě jsme tady neskončili!

  	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};

// -----SPIELER IST VERLETZT UND FRAGT NACH HILFE-------------------

instance PC_Psionic_IAMHURT(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_IAMHURT_Condition;
	information = PC_Psionic_IAMHURT_Info;
	important = 0;
	permanent = 0;
//	description = "I'm injured. Can you help me?";
//	description = "Ich bin verletzt, kannst du mir helfen?";
	description = "Jsem zraněný, můžeš mi pomoci?";
};

func int PC_Psionic_IAMHURT_Condition()
{
	if ((Npc_KnowsInfo(hero,PC_Psionic_FOLLOWME))
	&& (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]/2)))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_IAMHURT_Info()
{
//	AI_Output(other,self,"PC_Psionic_IAMHURT_Info_15_01"); //I'm injured. Can you help me?
//	AI_Output(other,self,"PC_Psionic_IAMHURT_Info_15_01"); //Ich bin verletzt, kannst du mir helfen?
	AI_Output(other,self,"PC_Psionic_IAMHURT_Info_15_01"); //Jsem zraněný, můžeš mi pomoci?
//	AI_Output(self,other,"PC_Psionic_IAMHURT_Info_05_02"); //Take this healing potion.
//	AI_Output(self,other,"PC_Psionic_IAMHURT_Info_05_02"); //Hier, nimm diesen Heiltrank.
	AI_Output(self,other,"PC_Psionic_IAMHURT_Info_05_02"); //Tady, vezmi si tento hojivý lektvar.

	CreateInvItem(self,ItFo_Potion_Health_02);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_02,1);
};

//------------- SPIELER HAT DIE URKUNDE FÜR LESTER GEFUNDEN-----------------------
instance PC_Psionic_URKUNDE(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_URKUNDE_Condition;
	information = PC_Psionic_URKUNDE_Info;
	important = 0;
	permanent = 0;
//	description = "I've found the document.";
//	description = "Ich habe die Urkunde gefunden";
	description = "Našel jsem ten dokument.";
};

func int PC_Psionic_URKUNDE_Condition()
{
	if ((Npc_KnowsInfo(hero,PC_Psionic_STORY))
	&& (Npc_HasItems(hero,ItWr_Urkunde_01)))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_URKUNDE_Info()
{
//	AI_Output(other,self,"PC_Psionic_URKUNDE_Info_15_01"); //I've found the document.
//	AI_Output(other,self,"PC_Psionic_URKUNDE_Info_15_01"); //Ich habe die Urkunde gefunden.
	AI_Output(other,self,"PC_Psionic_URKUNDE_Info_15_01"); //Našel jsem ten dokument.
//	AI_Output(self,other,"PC_Psionic_URKUNDE_Info_05_02"); //Hey, well done. Take these magic scrolls as a reward. With them you'll be able to reach the focus.
//	AI_Output(self,other,"PC_Psionic_URKUNDE_Info_05_02"); //Hey, gut gemacht. Dafür gebe ich dir diese Spruchrollen. Damit sollte es kein Problem sein, den Fokus zu erreichen.
	AI_Output(self,other,"PC_Psionic_URKUNDE_Info_05_02"); //Hej, dobrá práce. Vezmi si za odměnu tyto kouzelné svitky. S nimi nebude problém dosáhnout na ohnisko.
//	AI_Output(self,other,"PC_Psionic_URKUNDE_Info_05_03"); //I'll wait for you down by the focus platform.
//	AI_Output(self,other,"PC_Psionic_URKUNDE_Info_05_03"); //Ich werde unten vor der Fokusplattform auf dich warten.
	AI_Output(self,other,"PC_Psionic_URKUNDE_Info_05_03"); //Počkám na tebe dole před ohniskovou platformou.

//	B_LogEntry(CH3_Fortress,"The title deed Lester was looking for was in a chest. In exchange he gave me four spell scrolls of Telekinesis, which I can use to reach the focus.");
//	B_LogEntry(CH3_Fortress,"Die Landbesitz-Urkunde, die Lester suchte, befand sich in einer Kiste. Er übergab mir im Tausch vier Telekinese-Spruchrollen, mit deren Hilfe ich den unerreichbaren Fokus nun bergen kann.");
	B_LogEntry(CH3_Fortress,"Listina, kterou hledal Lester, byla v jedné truhlici. Výměnou mi dal čtyři kouzelné svitky telekineze, s jejichž pomocí dostanu to ohnisko.");

	CreateInvItems(self,ItArScrollTelekinesis,4);
	B_GiveInvItems(self,hero,ItArScrollTelekinesis,4);
	B_GiveInvItems(hero,self,ItWr_Urkunde_01,1);

	Npc_ExchangeRoutine(self,"WaitAtFocus");
	AI_StopProcessInfos(self);
};

//-------------
instance PC_Psionic_TIP(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_TIP_Condition;
	information = PC_Psionic_TIP_Info;
	important = 0;
	permanent = 0;
//	description = "How can I reach the focus?";
//	description = "Wie soll ich den Fokus erreichen?";
	description = "Jak se dostanu k tomu ohnisku?";
};

func int PC_Psionic_TIP_Condition()
{
	if ((Npc_KnowsInfo(hero,PC_Psionic_URKUNDE))
	&& (!Npc_HasItems(hero,Focus_3)))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_TIP_Info()
{
//	AI_Output(other,self,"PC_Psionic_TIP_Info_15_01"); //How can I reach the focus?
//	AI_Output(other,self,"PC_Psionic_TIP_Info_15_01"); //Wie soll ich den Fokus erreichen?
	AI_Output(other,self,"PC_Psionic_TIP_Info_15_01"); //Jak se dostanu k tomu ohnisku?
//	AI_Output(self,other,"PC_Psionic_TIP_Info_05_02"); //Master Y'Berion used to say: A student tries to move things with his hands and feet, the master moves them with his spiritual powers.
//	AI_Output(self,other,"PC_Psionic_TIP_Info_05_02"); //Meister Y'Berion sagte immer: Der Schüler versucht die Dinge mit Händen und Füßen zu bewegen, der Meister bewegt die Dinge mit der Kraft seiner Gedanken.
	AI_Output(self,other,"PC_Psionic_TIP_Info_05_02"); //Mistr Y´Berion obvykle říká: žák zkouší věcmi pohybovat pomocí rukou a nohou, mistr jimi pohybuje silou svých myšlenek.
// AI_Output(self,other,"PC_Psionic_TIP_Info_05_03"); //Hier ist ein guter Ort, um die Kraft des Geistes zu nutzen!
};

// ---ALLES IN DER BERGFESTUNG ERLEDIGT ABER LESTER DIE URKUNDE NICHT GEGEBEN

instance PC_Psionic_LEAVE(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_LEAVE_Condition;
	information = PC_Psionic_LEAVE_Info;
	important = 1;
	permanent = 0;
};

func int PC_Psionic_LEAVE_Condition()
{
	if ((!Npc_HasItems(hero,Focus_3))
	&& (!Npc_HasItems(self,ItWr_Urkunde_01))
	&& (Npc_GetDistToWp (hero,"PATH_TO_PLATEAU04_BRIDGE2") < 900))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_LEAVE_Info()
{
	AI_GotoNpc(self,hero);
//	AI_Output(self,other,"PC_Psionic_LEAVE_Info_05_01"); //I'll stay here to find the document.
//	AI_Output(self,other,"PC_Psionic_LEAVE_Info_05_01"); //Ich bleibe noch hier und suche die Urkunde.
	AI_Output(self,other,"PC_Psionic_LEAVE_Info_05_01"); //Zůstanu tady, a budu hledat ten dokument.

  	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine(self,"BOOK");
	AI_StopProcessInfos(self);
};

// --- Lester geht nach oben!-------------------------------
instance PC_Psionic_BALKON(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_BALKON_Condition;
	information = PC_Psionic_BALKON_Info;
	important = 1;
	permanent = 0;
};

func int PC_Psionic_BALKON_Condition()
{
	if ((!Npc_HasItems(self,ItWr_Urkunde_01))
	&& (Npc_GetDistToWp (hero,"LOCATION_19_03_PEMTAGRAM2") < 1000))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_BALKON_Info()
{
	AI_GotoNpc(self,hero);
//	AI_Output(self,other,"PC_Psionic_BALKON_Info_05_01"); //I'll go and have a look up there.
//	AI_Output(self,other,"PC_Psionic_BALKON_Info_05_01"); //Ich werde mich mal oben umsehen.
	AI_Output(self,other,"PC_Psionic_BALKON_Info_05_01"); //Půjdu se porozhlédnout tam nahoru.

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BALKON");
};

//---------------------------------------------------------------

instance PC_Psionic_FINISH(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_FINISH_Condition;
	information = PC_Psionic_FINISH_Info;
	important = 1;
	permanent = 0;
};

func int PC_Psionic_FINISH_Condition()
{
	if ((Npc_KnowsInfo(hero,PC_Psionic_URKUNDE))
	&& (Npc_HasItems(hero,Focus_3)))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_FINISH_Info()
{
//	AI_Output(self,other,"PC_Psionic_FINISH_Info_05_01"); //Now both of us have what we wanted. I'll stay here to read the old books.
//	AI_Output(self,other,"PC_Psionic_FINISH_Info_05_01"); //Nun haben wir beide, was wir wollten. Ich werde noch etwas bleiben, um die alten Bücher zu studieren.
	AI_Output(self,other,"PC_Psionic_FINISH_Info_05_01"); //Ještě nemáme oba to, co jsme chtěli. Já zůstanu tady, abych mohl studovat staré knihy.
//	AI_Output(other,self,"PC_Psionic_FINISH_Info_15_02"); //We'll meet again.
//	AI_Output(other,self,"PC_Psionic_FINISH_Info_15_02"); //Wir sehen uns wieder.
	AI_Output(other,self,"PC_Psionic_FINISH_Info_15_02"); //Dobře, ještě se sejdeme.

//	B_LogEntry(CH3_Fortress,"I've recovered the focus. Lester still wants to have a look around the library of the fortress. I wonder when I'll see him again.");
//	B_LogEntry(CH3_Fortress,"Ich habe den Fokus erfolgreich geborgen. Lester will noch eine Weile in der Biblithek der Festung herumstöbern. Ich frage mich, wann ich ihn wiedersehen werden.");
	B_LogEntry(CH3_Fortress,"Získal jsem ohnisko. Lester se chce ještě porozhlédnout po knihovně v pevnosti. Zajímalo by mě, zda se s ním ještě někdy setkám.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"BOOK");
	AI_StopProcessInfos(self);
};

/*---------------------------------BALKON DER BERGFESTUNG
------------------------------------------------------------------------*/

instance PC_Psionic_CHESTCLOSED(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_CHESTCLOSED_Condition;
	information = PC_Psionic_CHESTCLOSED_Info;
	important = 0;
	permanent = 0;
//	description = "Have you found anything?";
//	description = "Hast du schon was gefunden?";
	description = "Už jsi něco našel?";
};

func int PC_Psionic_CHESTCLOSED_Condition()
{
	if ((!Npc_HasItems(hero,Focus_3))
	&& (!Npc_HasItems(self,ItWr_Urkunde_01))
	&& (Npc_GetDistToWp(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_CHESTCLOSED_Info()
{
//	AI_Output(other,self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Have you found anything?
//	AI_Output(other,self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Hast du schon was gefunden?
	AI_Output(other,self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Už jsi něco našel?
//	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //The chest over there is locked. Maybe we can find the key somewhere in this fort.
//	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Die Truhe da vorne ist verschlossen. Vielleicht gibt es irgendwo in dieser Festung einen Schlüssel.
	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Támhleta truhla je zamčená. Možná k ní najdeme klíč někde v pevnosti.
//	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Have you found the document yet?
//	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Gibt es irgendwelche Hinweise auf die Urkunde?
	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Už jsi našel ten dokument?
//	AI_Output(other,self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //No, not yet...
//	AI_Output(other,self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Nein, bisher noch nicht ...
	AI_Output(other,self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Ne, ještě ne.
//	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Did you have a look around the library?
//	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Hast du schon in der Bibliothek nachgesehen?
	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Už jsi hledal v knihovně?
	AI_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
							COME WITH ME AGAIN
------------------------------------------------------------------------*/

instance PC_Psionic_COMEAGAIN(C_INFO)
{
	npc = PC_Psionic;
	condition = PC_Psionic_COMEAGAIN_Condition;
	information = PC_Psionic_COMEAGAIN_Info;
	important = 0;
	permanent = 0;
//	description = "Let's sound out the fort together.";
//	description = "Lass uns zusammen die Festung erkunden";
	description = "Prozkoumáme pevnost společně.";
};

func int PC_Psionic_COMEAGAIN_Condition()
{
	if ((Npc_KnowsInfo(hero,PC_Psionic_LEAVE))
	&& (!Npc_HasItems(hero,Focus_3)))
	{
		return 1;
	};

	return 0;
};

func void PC_Psionic_COMEAGAIN_Info()
{
//	AI_Output(other,self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Let's sound out the fort together.
//	AI_Output(other,self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Lass uns zusammen die Festung erkunden.
	AI_Output(other,self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Prozkoumáme pevnost společně.
//	AI_Output(self,other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Alright, you go first!
//	AI_Output(self,other,"PC_Psionic_COMEAGAIN_Info_05_02"); //In Ordnung, du gehst vor!
	AI_Output(self,other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Dobře, jdi první!

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FORTRESSFOLLOW");

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info DIEGOMILTEN      ******Björn****** Patch2
//---------------------------------------------------------------------
instance Info_Lester_DIEGOMILTEN(C_INFO)
{
	npc = PC_Psionic;
	condition = Info_Lester_DIEGOMILTEN_Condition;
	information = Info_Lester_DIEGOMILTEN_Info;
	important = 0;
	permanent = 0;
//	description = "I met Diego and Milten in front of the Old Camp!";
//	description = "Ich habe Diego und Milten vor dem Alten Lager getroffen!";
	description = "Potkal jsem před Starým táborem Diega a Miltena!";
};

func int Info_Lester_DIEGOMILTEN_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_OCFAVOR))
	{
		return 1;
	};

	return 0;
};

func void Info_Lester_DIEGOMILTEN_Info()
{
//	AI_Output(hero,self,"Info_SFB_1_DieLage_15_00"); //How are you doing?
//	AI_Output(hero,self,"Info_SFB_1_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(hero,self,"Info_SFB_1_DieLage_15_00"); //Jak se máš?
//	AI_Output(self,hero,"PC_Psionic_FOLLOWME_Info_05_01"); //Hey, what are you doing here?
//	AI_Output(self,hero,"PC_Psionic_FOLLOWME_Info_05_01"); //Hey, was machst du denn hier?
	AI_Output(self,hero,"PC_Psionic_FOLLOWME_Info_05_01"); //Hej, co tady děláš?
//	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01"); //The Old Mine collapsed after water seeped in!
//	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01"); //Die Alte Mine wurde nach einem Wassereinbruch verschüttet!
	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01"); //Starý důl se zhroutil potom, co ho zatopila voda!
//	AI_Output(self,hero,"DIA_Fingers_BecomeShadow_05_01"); //So?
//	AI_Output(self,hero,"DIA_Fingers_BecomeShadow_05_01"); //Und?
	AI_Output(self,hero,"DIA_Fingers_BecomeShadow_05_01"); //No a?
//	AI_Output(hero,self,"Info_Xardas_KDW_15_01"); //All the Magicians of Fire are dead!
//	AI_Output(hero,self,"Info_Xardas_KDW_15_01"); //Die Feuermagier sind alle tot!
	AI_Output(hero,self,"Info_Xardas_KDW_15_01"); //Všichni mágové Ohně jsou mrtví!
//	AI_Output(hero,self,"Info_Xardas_KDW_15_02"); //Gomez had them assassinated.
//	AI_Output(hero,self,"Info_Xardas_KDW_15_02"); //Gomez hat sie ermorden lassen.
	AI_Output(hero,self,"Info_Xardas_KDW_15_02"); //Gomez je nechal povraždit.
//	AI_Output(self,hero,"SVM_5_GetThingsRight"); //It won't be easy to straighten that out!
//	AI_Output(self,hero,"SVM_5_GetThingsRight"); //Das wieder hinzubiegen wird nicht einfach!
	AI_Output(self,hero,"SVM_5_GetThingsRight"); //To nebude snadné napravit!
//	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //I met Diego and Milten in front of the Old Camp!
//	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Ich habe Diego und Milten vor dem Alten Lager getroffen!
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Potkal jsem před Starým táborem Diega a Miltena!
//	AI_Output(hero,self,"Info_lester_DIEGOMILTEN_15_01"); //They want to meet you. At your usual rendezvous.
//	AI_Output(hero,self,"Info_lester_DIEGOMILTEN_15_01"); //Sie wollen sich mit dir treffen. An eurem üblichen Treffpunkt.
	AI_Output(hero,self,"Info_lester_DIEGOMILTEN_15_01"); //Chtěli se s tebou setkat. Na obvyklém místě.
//	AI_Output(self,hero,"SVM_5_YeahWellDone"); //It was about time!
//	AI_Output(self,hero,"SVM_5_YeahWellDone"); //Wurde aber auch Zeit!
	AI_Output(self,hero,"SVM_5_YeahWellDone"); //Už bylo na čase!
//	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01"); //What happens now?
//	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01"); //Wie geht es nun weiter?
	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01"); //Co se děje?
//	AI_Output(self,hero,"Info_lester_DIEGOMILTEN_05_02"); //I'll stay here to read the old books.
//	AI_Output(self,hero,"Info_lester_DIEGOMILTEN_05_02"); //Ich werde noch etwas bleiben, um die alten Bücher zu studieren.
	AI_Output(self,hero,"Info_lester_DIEGOMILTEN_05_02"); //Ještě nemáme oba to, co jsme chtěli. Já zůstanu tady, abych mohl studovat staré knihy.
//	AI_Output(hero,self,"KDW_600_Saturas_OATH_Info_15_06"); //Uhh... I don't understand...
//	AI_Output(hero,self,"KDW_600_Saturas_OATH_Info_15_06"); //Ähh ... Ich verstehe nicht ...
	AI_Output(hero,self,"KDW_600_Saturas_OATH_Info_15_06"); //Uch... Nerozumím...
//	AI_Output(self,hero,"PC_Psionic_TIP_Info_05_02"); //Master Y'Berion used to say: A student tries to move things with his hands and feet, the master moves them with his spiritual powers.
//	AI_Output(self,hero,"PC_Psionic_TIP_Info_05_02"); //Meister Y'Berion sagte immer: Der Schüler versucht die Dinge mit Händen und Füßen zu bewegen, der Meister bewegt die Dinge mit der Kraft seiner Gedanken.
	AI_Output(self,hero,"PC_Psionic_TIP_Info_05_02"); //Mistr Y´Berion obvykle říká: žák zkouší věcmi pohybovat pomocí rukou a nohou, mistr jimi pohybuje silou svých myšlenek.
//	AI_Output(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); //Okay, okay, I get the point.
//	AI_Output(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); //Schon gut, ich hab's verstanden.
	AI_Output(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); //Dobře, dobře. Dám si pozor.
//	AI_Output(self,hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Take care.
//	AI_Output(self,hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Also pass auf dich auf.
	AI_Output(self,hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Opatruj se.
//	AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03"); //Thank you. I'll be on my way now.
//	AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03"); //Ich danke dir. Ich werde mich jetzt wieder auf den Weg machen.
	AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03"); //Děkuju. Půjdu si svou cestou.
//	AI_Output(self,hero,"Info_Lester_EXIT_05_02"); //May the Sleeper protect you!
//	AI_Output(self,hero,"Info_Lester_EXIT_05_02"); //Der Schläfer möge dich behüten!
	AI_Output(self,hero,"Info_Lester_EXIT_05_02"); //Kéž tě Spáč ochrání!

	B_GiveXP(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE;
	}
	else
	{
//		B_LogEntry(CH4_4Friends, "I informed Lester and Gorn about the meeting with their friends. Now, this isn't my affair any longer. They'll know what do do next...");
//		B_LogEntry(CH4_4Friends, "Ich habe Lester und Gorn nun darüber informiert sich mit den anderen beiden Freunden zu treffen. Ab jetzt ist dies nicht mehr meine Angelegenheit. Sie werden schon wissen, was zu tun ist.");
		B_LogEntry(CH4_4Friends, "Informoval jsem Gorna a Lestera o setkání s jejich přáteli. Teď už to není moje věc. Oni už vědí, co dělat...");
		Log_SetTopicStatus(CH4_4Friends,LOG_SUCCESS);
	};

	AI_StopProcessInfos(self);
};
