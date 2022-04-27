var int Diego_After_Gamestart;

// ************************************************************
// GAMESTART
// ************************************************************

instance Info_Diego_Gamestart(C_INFO)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_Gamestart_Condition;
	information = Info_Diego_Gamestart_Info;
	important = 1;
	permanent = 0;
	//description = " [important - no description required]";
};

func int Info_Diego_Gamestart_Condition()
{
	if (Kapitel < 2)
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_Gamestart_Info()
{
//	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //I'm Diego.
//	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Ich bin Diego.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Jsem Diego.
//	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //I'm...
//	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Ich bin...
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Já jsem...
//	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //I'm not interested in who you are. You've just arrived. I look after the new arrivals. That's all for now.
//	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Mich interessiert nicht, wer du bist. Du bist neu hier. Ich kümmere mich um die Neuen. Belassen wir es vorerst dabei.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Nezajímá mě, kdo jsi. Právě jsi přišel. Dohlížím na nové příchozí. To je zatím všechno.
//	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //If you plan to stay alive for a while, you should talk to me. But of course I won't keep you from choosing your own destruction. Well, what do you think?
//	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Wenn du vorhast, länger zu leben, solltest du dich ein bißchen mit mir unterhalten. Ich werde dich allerdings nicht daran hindern, in dein Verderben zu rennen. Also, wie sieht's aus?
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Jestli máš v úmyslu zůstat na živu, měl by ses bavit se mnou. Samozřejmě ti ale nebudu bránit, když se budeš chtít zničit. Tak co si myslíš?

	B_Kapitelwechsel(1); //WICHTIG!!!
};

// ************************************************************
// EXIT
// ************************************************************

instance Info_Diego_EXIT_Gamestart(C_INFO)
{
	npc = PC_Thief;
	nr = 999;
	condition = Info_Diego_EXIT_Gamestart_Condition;
	information = Info_Diego_EXIT_Gamestart_Info;
	important = 0;
	permanent = 0;
	description = DIALOG_ENDE;
};

func int Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

func void Info_Diego_EXIT_Gamestart_Info()
{
//	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Thanks for your help.
//	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Danke für die Hilfe.
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Díky za tvou pomoc.

	if (!Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	{
//		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //It's your decision. It's been nice knowing you.
//		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //Wie du willst. War nett, dich gekannt zu haben.
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //Je to tvoje rozhodnutí. Rád jsem tě poznal.
	}
	else
	{
//		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //We'll meet in the Old Camp.
//		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Wir sehen uns im Alten Lager.
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Sejdeme se ve Starém táboře.
	};

	AI_StopProcessInfos(self);

	if (Kapitel < 2)
	{
		Npc_ExchangeRoutine(self,"Start");
		Diego_After_Gamestart = TRUE;
	};
};

// -------------------------------------------------------------

instance Info_Diego_EXIT_Later(C_INFO)
{
	npc = PC_Thief;
	nr = 999;
	condition = Info_Diego_EXIT_Later_Condition;
	information = Info_Diego_EXIT_Later_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Diego_EXIT_Later_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_EXIT_Gamestart))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_EXIT_Later_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
//		AI_Output(self,hero,"Info_Diego_EXIT_11_01"); //Let's go on.
//		AI_Output(self,hero,"Info_Diego_EXIT_11_01"); //Weiter geht's.
		AI_Output(self,hero,"Info_Diego_EXIT_11_01"); //Tak pojďme.
	}
	else
	{
//	 	AI_Output(hero,self,"Info_Diego_EXIT_15_00"); //Take care.
//	 	AI_Output(hero,self,"Info_Diego_EXIT_15_00"); //Mach's gut.
	 	AI_Output(hero,self,"Info_Diego_EXIT_15_00"); //Opatruj se.
	};

	AI_StopProcessInfos(self);
};

// *************************************************************
//  BRIEF
// *************************************************************

instance Info_Diego_Brief(C_INFO) // E1
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Brief_Condition;
	information = Info_Diego_Brief_Info;
	important = 0;
	permanent = 0;
//	description = "I have a letter for the High Magician of the Circle of Fire.";
//	description = "Ich habe einen Brief für den obersten Feuermagier.";
	description = "Mám dopis pro Velkého mága Kruhu ohně.";
};

func int Info_Diego_Brief_Condition()
{
	if (Kapitel < 2)
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_Brief_Info()
{
//	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //I have a letter for the High Magician of the Circle of Fire.
//	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //Ich habe einen Brief für den obersten Feuermagier.
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //Mám dopis pro Velkého mága Kruhu ohně.
//	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //Really...?
//	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //So...?
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //Opravdu...?
//	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //I was given it by a mage shortly before they threw me in here.
//	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Ein Magier hat ihn mir gegeben, kurz bevor sie mich reingeworfen haben.
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Dal mi ho jeden mág krátce předtím, než mě sem shodili.
//	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //You're lucky I can't afford to show my face around the mages any more. Anyone else would gladly slit your throat for that letter.
//	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Du kannst von Glück sagen, dass ich mich bei den Magiern nicht mehr blicken lassen kann. Jeder andere wird dir mit Freude für diesen Brief die Kehle durchschneiden.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Máš štěstí, že už se před mágy nesmím nikdy ukázat. Kdokoliv jiný by tě kvůli tomu dopisu s chutí podřezal.
//	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //That's because the mages pay their couriers a lot and most people here don't have anything.
//	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //Die Magier belohnen ihre Boten immer sehr gut, und die meisten hier haben gar nichts, verstehst du?
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //To protože mágové své kurýry dobře platí a většina lidí tu nemá nic.
//	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //If I were you I'd shut up until I met one of the mages. Although, in your situation, that's not likely to happen.
//	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Wenn ich du wäre, würde ich die Schnauze halten, bis ich einen der Magier treffe. Obwohl das in deiner Lage nicht allzu wahrscheinlich ist.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Být tebou, byl bych zticha, dokud bych nepotkal některého z mágů. I když to se ti hned tak nepodaří.
//	AI_Output(hero,self,"Info_Diego_Brief_15_06"); //Why not?
//	AI_Output(hero,self,"Info_Diego_Brief_15_06"); //Wieso nicht?
	AI_Output(hero,self,"Info_Diego_Brief_15_06"); //Proč ne?
//	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //The mages are in the castle in the Old Camp. Only Gomez' people are allowed to enter the castle.
//	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Die Magier sind in der Burg im Alten Lager. Nur Gomez' Leuten ist es erlaubt, die Burg zu betreten.
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Mágové jsou na hradě ve Starém táboře. Na hrad smí pouze Gomezovi lidé.
};

// **********************************************************
// SCHUTZ UND LAGER
// **********************************************************

instance Info_Diego_WarumGeholfen(C_INFO) // E1
{
	npc = PC_Thief;
	nr = 5;
	condition = Info_Diego_WarumGeholfen_Condition;
	information = Info_Diego_WarumGeholfen_Info;
	important = 0;
	permanent = 0;
//	description = "Why did you help me?";
//	description = "Warum hast du mir geholfen?";
	description = "Proč jsi mi pomohl?";
};

func int Info_Diego_WarumGeholfen_Condition()
{
	if ((!Diego_After_Gamestart)
	&& (Kapitel < 2))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_WarumGeholfen_Info()
{
//	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Why did you help me?
//	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Warum hast du mir geholfen?
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Proč jsi mi pomohl?
//	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Because you needed help, otherwise Bullit and his boys might have killed you.
//	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Weil du Hilfe gebraucht hast. Bullit und seine Jungs hätten dich vielleicht kaltgemacht.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Protože jsi potřeboval pomoc, jinak by tě Bullit a jeho chlapi mohli zabít.
//	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //And I couldn't just stand by and watch. 'Cos I came all this way to make a suggestion.
//	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //Und das konnte ich nicht mit ansehen. Schließlich bin ich den ganzen weiten Weg gekommen um dir einen Vorschlag zu machen.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //A já bych nemohl stát a přihlížet. Protože jsem přišel až sem, abych ti učinil nabídku.
//	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //A suggestion...
//	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Einen Vorschlag...
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Nabídku?
//	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Yes. After this little incident with Bullit and his guys, you should be aware now that you need protection.
//	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Ja. Deine Begegnung mit Bullit und seinen Jungs hat dir hoffentlich gezeigt, dass du Schutz brauchst.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Ano. Po tom malém incidentu s Bullitem a jeho chlapy by ti mělo být jasné, že potřebuješ ochranu.
//	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Everyone who arrives here has a choice. There are three camps in the colony, and you'll have to join one of them.
//	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Jeder, der hier ankommt, wird vor eine Wahl gestellt. Es gibt drei Lager in der Kolonie, und einem davon wirst du dich anschließen müssen.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Každý, kdo sem přijde, má možnost volby. V kolonii jsou tři tábory a ty se budeš muset k jednomu z nich přidat.
//	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //I'm here to show the new ones that the Old Camp is the best place for them.
//	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Ich bin hier, um Neuen wie dir klarzumachen, dass sie bei uns im alten Lager am besten aufgehoben sind.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Jsem tu proto, abych přesvědčil nováčky, že Starý tábor je pro ně to nejlepší místo.
};

// -------------------------------------------------------------

instance Info_Diego_Bullit(C_INFO) // E2
{
	npc = PC_Thief;
	nr = 5;
	condition = Info_Diego_Bullit_Condition;
	information = Info_Diego_Bullit_Info;
	important = 0;
	permanent = 0;
//	description = "Where's Bullit now?";
//	description = "Wo ist dieser Bullit jetzt?";
	description = "Kde je teď Bullit?";
};

func int Info_Diego_Bullit_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Diego_WarumGeholfen))
	&& (!Diego_After_Gamestart))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_Bullit_Info()
{
//	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //Where's Bullit now?
//	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //Wo ist dieser Bullit jetzt?
	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //Kde je teď Bullit?
//	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //He and the others bring the goods from the outside world into the Camp. You'll find him there.
//	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //Er und die anderen bringen die Waren aus der Außenwelt ins alte Lager. Dort kannst du ihn finden.
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //Přenesl se svými druhy zboží z vnějšího světa do Starého tábora. Tam ho můžeš najít.
//	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //But if you plan to fight him, be careful. He's an experienced warrior.
//	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Aber wenn du vorhast, dich mit ihm anzulegen, sei vorsichtig. Er ist ein erfahrener Kämpfer.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Jestli s ním ale chceš bojovat, buď opatrný. Je to zkušený bojovník.
};

// ************************************************************
// Kolonie
// ************************************************************

instance Info_Diego_Kolonie(C_INFO)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_Kolonie_Condition;
	information = Info_Diego_Kolonie_Info;
	important = 0;
	permanent = 0;
//	description = "Okay, what do I need to know about this place?";
//	description = "Okay, was muss ich über diesen Ort wissen?";
	description = "Dobrá, co bych měl vědět o tomhle místě?";
};

func int Info_Diego_Kolonie_Condition()
{
	if (Kapitel < 2)
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_Kolonie_Info()
{
//	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Okay, what do I need to know about this place?
//	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Okay, was muss ich über diesen Ort wissen?
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Dobrá, co bych měl vědět vědět o tomhle místě?
//	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //We call it the colony. You'll know already that we produce ore for the King.
//	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Wir nennen es die Kolonie. Du wirst sicher schon gehört haben, dass wir hier Erz für den König fördern.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Říkáme mu Kolonie. Určitě už jsi slyšel, že tu těžíme rudu pro krále.
//	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Well, at least we do - in the Old Camp.
//	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Nun - zumindest wir vom alten Lager.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Dobře, to děláme my - ve Starém táboře.
//	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //There are three camps within the Barrier. The Old Camp is the biggest, and it was the first.
//	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //Es gibt drei Lager innerhalb der Barriere. Das alte Lager ist das größte von ihnen. Es war auch das erste.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //Uvnitř Bariéry jsou tři tábory. Starý tábor je největší a také tu byl první.
};

// -----------------------------------------------------------------------

instance Info_Diego_Barriere(C_INFO) // E2
{
	npc = PC_Thief;
	nr = 3;
	condition = Info_Diego_Barriere_Condition;
	information = Info_Diego_Barriere_Info;
	important = 0;
	permanent = 0;
//	description = "Tell me more about the Barrier.";
//	description = "Erzähl mir was über die Barriere.";
	description = "Řekni mi něco o Bariéře.";
};

func int Info_Diego_Barriere_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	&& (Diego_After_Gamestart == TRUE))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_Barriere_Info()
{
//	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //Tell me more about the Barrier.
//	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //Erzähl mir was über die Barriere.
	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //Řekni mi něco o Bariéře.
//	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //There isn't much to tell. It's impenetrable.
//	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Da gibt es nicht viel zu erzählen. Sie ist undurchdringlich.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Není toho moc. Je neproniknutelná.
//	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //What happens if I just walk out of here?
//	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //Was passiert, wenn ich hier einfach wieder rausspaziere?
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //Co by se stalo, kdybych odtud jednoduše odešel pryč?
//	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //The last one who tried that reached the other side a dead man. This damned Barrier let's you in, but you'll never get out of here.
//	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //Der Letzte, der das versucht hat, ist tot auf der anderen Seite angekommen. Diese verdammte Barriere lässt dich zwar rein, aber raus kommst du hier nicht mehr.
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //Poslední, kdo se o to pokusil dorazil na druhou stranu mrtvý. Ta proklatá Bariéra tě nechá vstoupit dovnitř, ale nikdy už tě nepustí ven.
//	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //If there's a way out, I'll find it.
//	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Wenn es einen Weg hier raus gibt, werde ich ihn finden.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Jestli existuje nějaká cesta ven, najdu ji.
//	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //You're already in a rush to get out of here? But you've only just arrived!
//	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Hast du's SO eilig, hier wieder rauszukommen? Du bist ja gerade mal da!
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Jsi opravdu rozhodnutý jít odtud pryč? Ale právě jsi přišel!
};

// -----------------------------------------------------------------------

instance Info_Diego_OtherCamps(C_INFO) // E2
{
	npc = PC_Thief;
	nr = 2;
	condition = Info_Diego_OtherCamps_Condition;
	information = Info_Diego_OtherCamps_Info;
	important = 0;
	permanent = 0;
//	description = "What about the two other camps?";
//	description = "Was ist mit den beiden anderen Lagern?";
	description = "A co ty dva ostatní tábory?";
};

func int Info_Diego_OtherCamps_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	&& (Diego_After_Gamestart == TRUE)
	&& (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OtherCamps_Info()
{
//	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //What about the two other camps?
//	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //Was ist mit den beiden anderen Lagern?
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //A co ty dva ostatní tábory?
//	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //The two other camps split up to pursue their crazy escape plans.
//	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Die beiden anderen Lager haben sich abgespalten, um ihren schwachsinnigen Ausbruchsplänen nachzugehen.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Ostatní dva tábory se oddělily, aby mohly následovat své šílené plány na únik.
//	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //There's the New Camp in the west of the colony, where the mages think they can just detonate the Barrier as soon as they've scraped enough ore together.
//	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //Es gibt das neue Lager im Westen der Kolonie. Die Magier dort meinen, wenn sie genug Erz zusammengekratzt haben, können sie die Barriere einfach sprengen.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //Nový tábor je na západě kolonie a jeho mágové si myslí, že můžou prolomit Bariéru, jakmile se jim podaří nashromáždit dostatečné množství magické rudy.
//	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //And then there's the sect loonies in the east. Their camp is in the middle of the swamp, and they're praying to their idol to set them free.
//	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //Dann gibt's im Osten die Sektenspinner. Sie haben ihr Lager im Sumpf und beten zu ihrem Götzen, er möge ihnen die Freiheit schenken.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //A potom jsou tu na východě sektářští blázni. Jejich tábor leží uprostřed bažin, kde se modlí ke svému idolu, aby je osvobodil.
//	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //He hasn't responded so far.
//	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Bis jetzt hat er sich noch nicht gemeldet.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Zatím jim neodpovděl.
//	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //If I were you, I wouldn't waste my time on those madcaps.
//	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Wenn ich du wäre, würde ich meine Zeit nicht mit den Spinnern verschwenden.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Být tebou, tak bych se těmi vyšinutými mozky nezabýval.
};

// -----------------------------------------------------------------------

instance Info_Diego_OldCamp(C_INFO) // E2
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_OldCamp_Condition;
	information = Info_Diego_OldCamp_Info;
	important = 0;
	permanent = 0;
//	description = "Tell me something about the Old Camp.";
//	description = "Erzähl mir was über das alte Lager.";
	description = "Řekni mi něco o Starém táboře.";
};

func int Info_Diego_OldCamp_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	&& (Diego_After_Gamestart == TRUE))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OldCamp_Info()
{
//	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //Tell me something about the Old Camp.
//	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //Erzähl mir was über das alte Lager.
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //Řekni mi něco o Starém táboře.
//	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //It's the biggest and most powerful of the three camps. Gomez and his guys control the Camp and thereby the whole ore trade.
//	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //Es ist das größte und mächtigste der drei Lager. Gomez und seine Jungs kontrollieren das Lager und damit den ganzen Erzaustausch.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //Je to největší a nejmocnější ze všech tří táborů. Gomez a jeho chlapi mají tábor pod kontrolou, a s tím i celý obchod s rudou.
//	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Once a month, the King sends us everything we need. We've got the old guy in our grip, you understand?
//	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Einmal im Monat schickt der König uns alles, was wir fordern. Wir haben den alten Sack in der Hand, verstehst du? Er ist auf das Erz angewiesen.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Jednou za měsíc nám král pošle všechno, co potřebujeme. Máme toho starého páprdu v hrsti, chápeš?
//	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //He sends us wine, bread, meat, weapons... everything.
//	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Er schickt uns Wein, Brot, Fleisch, Waffen, einfach alles.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Posílá nám víno, chleba, maso, zbraně... prostě všechno.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
//		AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //You can also get some of it. All you have to do is join Gomez' people.
//		AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Du kannst auch deinen Teil davon bekommen. Alles, was du tun mußt, ist dich Gomez' Leuten anzuschließen.
		AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Také z toho můžeš něco dostat. Jediné, co musíš udělat je přidat ke Gomezovi.
	};
};

// ************************************************************
// Gomez Leute
// ************************************************************

instance Info_Diego_WhosGomez(C_INFO) // E2/E3
{
	npc = PC_Thief;
	nr = 3;
	condition = Info_Diego_WhosGomez_Condition;
	information = Info_Diego_WhosGomez_Info;
	important = 0;
	permanent = 0;
//	description = "Who's Gomez?";
//	description = "Wer ist Gomez?";
	description = "Kdo je Gomez?";
};

func int Info_Diego_WhosGomez_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Diego_OldCamp))
	|| (Npc_KnowsInfo(hero,Info_Diego_Brief)))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_WhosGomez_Info()
{
//	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //Who's Gomez?
//	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //Wer ist Gomez?
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //Kdo je Gomez?
//	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gomez is the most powerful Ore Baron. He's the boss of the Old Camp - the most powerful man in the colony.
//	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gomez ist der oberste Erzbaron. Der Boss des Alten Lagers. Der mächtigste Mann in der Kolonie.
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gomez je nejmocnější Rudobaron. Je to šéf Starého tábora - nejmocnější muž v Kolonii.
};

// ************************************************************
// JOIN OC
// ************************************************************

instance Info_Diego_JoinOldcamp(C_INFO) // E2/E3
{
	npc = PC_Thief;
	nr = 4;
	condition = Info_Diego_JoinOldcamp_Condition;
	information = Info_Diego_JoinOldcamp_Info;
	important = 0;
	permanent = 0;
//	description = "Let's assume I want to join his people, what do I need to do?";
//	description = "Wie kann ich mich Gomez' Leuten anschliessen?";
	description = "Předpokládejme, že bych se chtěl přidat k jeho lidem, co pro to musím udělat?";
};

func int Info_Diego_JoinOldcamp_Condition()
{
	if (((Npc_KnowsInfo(hero,Info_Diego_OldCamp)) || (Npc_KnowsInfo(hero,Info_Diego_Brief)))
	&& (!C_NpcBelongsToOldCamp(hero))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_JoinOldcamp_Info()
{
//	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Let's assume I want to join his people, what do I need to do?
//	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Mal angenommen, ich wollte mich seinen Leuten anschließen, was müßte ich tun.
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Předpokládejme, že bych se chtěl přidat k jeho lidem, co pro to musím udělat?
//	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //At the gate of the castle you'll find a man called Thorus. Tell him Diego sent you.
//	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //Am Eingang zur Burg findest du einen Mann, der Thorus heißt. Sag ihm Diego schickt dich.
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //U hradní brány najdeš člověka jménem Thorus. Řekni mu, že tě posílá Diego.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE] = TRUE;

	Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC,LOG_RUNNING);
//	B_LogEntry(CH1_JoinOC,"To be allowed to join Gomez' people in the Old Camp, I need to see Thorus.");
//	B_LogEntry(CH1_JoinOC,"Um bei Gomez Leuten im Alten Lager aufgenommen zu werden, soll ich mich bei Thorus melden.");
	B_LogEntry(CH1_JoinOC,"Měl bych se hlásit u Thoruse, abych se mohl přidat ke Gomezovým lidem ve Starém táboře.");
};

// ************************************************************
// Weg zum Alten Lager
// ************************************************************

instance Info_Diego_WayToOldcamp(C_INFO) // E2/E3
{
	npc = PC_Thief;
	nr = 4;
	condition = Info_Diego_WayToOldcamp_Condition;
	information = Info_Diego_WayToOldcamp_Info;
	important = 0;
	permanent = 0;
//	description = "How do I get to the Old Camp?";
//	description = "Wie komme ich zum alten Lager?";
	description = "Jak se dostanu do Starého tábora?";
};

func int Info_Diego_WayToOldcamp_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	&& (!Diego_After_Gamestart))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_WayToOldcamp_Info()
{
//	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //How do I get to the Old Camp?
//	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Wie komme ich zum alten Lager?
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Jak se dostanu do Starého tábora?
//	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //You just follow this path. The Old Camp is the next reasonably safe-looking place you'll come across.
//	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Du mußt nur dem Weg hier folgen. Das Alte Lager ist der nächste halbwegs sichere Ort von hier aus gesehen.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Musíš jít po téhle cestě. Starý tábor je nejbližší bezpečně vyhlížející místo, na které můžeš narazit.
//	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //There are a lot of wild beasts between the camps. You'd  be mad to walk around without a weapon.
//	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Es treiben sich jede Menge wilder Bestien zwischen den Lagern herum. Ohne Waffe zu gehen ist Wahnsinn.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Mezi tábory se potuluje spousta nebezpečných zvířat. Byl bys blázen, kdyby ses tudy vydal beze zbraně.
};

// ************************************************************
// Wo Waffe
// ************************************************************

instance Info_Diego_WoWaffe(C_INFO) // E2/E3
{
	npc = PC_Thief;
	nr = 4;
	condition = Info_Diego_WoWaffe_Condition;
	information = Info_Diego_WoWaffe_Info;
	important = 0;
	permanent = 0;
//	description = "Where do I get a weapon?";
//	description = "Wo kriege ich eine Waffe her?";
	description = "Kde bych mohl sehnat nějakou zbraň?";
};

func int Info_Diego_WoWaffe_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp))
	&& (!Diego_After_Gamestart))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_WoWaffe_Info()
{
//	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //Where do I get a weapon?
//	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //Wo kriege ich eine Waffe her?
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //Kde bych mohl sehnat nějakou zbraň?
//	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //When you get to the Old Mine, have a look around. I'm sure you'll find something useful.
//	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Wenn du an der verlassenen Mine vorbeikommst, sieh dich mal ein bißchen um. Du findest bestimmt was Brauchbares.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Až dorazíš k opuštěnému dolu, porozhlédni se kolem. Určitě najdeš něco užitečného.
//	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //The mine is easy to find, it's just a few meters along the canyon.
//	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //Die Mine ist leicht zu finden, nur ein paar Meter die Schlucht entlang.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //Ten důl najdeš snadno, je to jenom pár metrů od kaňonu.
};

// ************************************************************
// Mit Thorus geredet
// ************************************************************

instance Info_Diego_ThorusSays(C_INFO) // E2/E3
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_ThorusSays_Condition;
	information = Info_Diego_ThorusSays_Info;
	important = 0;
	permanent = 0;
//	description = "I've talked to Thorus.";
//	description = "Ich habe mit Thorus geredet.";
	description = "Mluvil jsem s Thorusem.";
};

func int Info_Diego_ThorusSays_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_ThorusSays_Info()
{
//	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //I've talked to Thorus.
//	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //Ich habe mit Thorus geredet.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //Mluvil jsem s Thorusem.
//	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //And what did he say?
//	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //Und was sagt er?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //A co říkal?
//	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //He says that I can join the Old Camp if YOU think that I'm good enough.
//	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //Er will mich im Lager aufnehmen, wenn DU denkst, dass ich gut genug bin.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //Říká, že se můžu přidat ke Starému táboru, pokud TY uznáš, že na to mám.
//	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Looks like I have myself a new job.
//	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Sieht so aus, als hätte ich einen neuen Job.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Vypadá to, že mám novou práci.
//	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Do we start right now?
//	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Fangen wir direkt an?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Můžeme rovnou začít?
//	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //First there are a few things you should know.
//	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Vorher solltest du ein paar Sachen wissen.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Nejdříve by ses měl dovědět pár věcí.
};

// ************************************************************
// Aufnahme - Regeln
// ************************************************************

instance Info_Diego_Rules(C_INFO) // E2/E3
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Rules_Condition;
	information = Info_Diego_Rules_Info;
	important = 0;
	permanent = 0;
//	description = "What do I have to know to be accepted in the Old Camp?";
//	description = "Was muss ich wissen, um im Alten Lager aufgenommen zu werden?";
	description = "Co musím znát, abych byl přijat do Starého tábora?";
};

func int Info_Diego_Rules_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_ThorusSays))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_Rules_Info()
{
//	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //What do I have to know to be accepted in the Old Camp?
//	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //Was muss ich wissen, um im Alten Lager aufgenommen zu werden?
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //Co musím znát, abych byl přijat do Starého tábora?
//	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //If you want to join the Camp you'll have to earn some brownie points.
//	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Wenn du aufgenommen werden willst, mußt du Pluspunkte sammeln.
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Jestli se chceš přidat do tábora, budeš muset získat pár kladných bodů.
//	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //There're a few influential people in the Outer Ring. Most of them are Shadows. If you manage to impress them, it'll earn you a few brownie points.
//	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //Es gibt einige einflussreiche Leute hier im Außenring. Die meisten davon sind Schatten. Wenn du es schaffst, sie zu beeindrucken, bringt dir das Pluspunkte ein.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //Ve Vnějším kruhu je několik vlivných lidí. Většina z nich jsou Stínové. Pokud se ti podaří udělat na ně dojem, získáš pár kladných bodů.
//	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //Then you'll have to stand the test of faith.
//	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //Dann mußt du eine Prüfung des Vertrauens ablegen.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //Pak budeš mtaké muset složit zkoušku oddanosti.
//	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Besides there are a lot of skills every new arrival has to learn. The more you learn, the more valuable you'll be for us.
//	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Außerdem gibt es für einen Neuen wie dich jede Menge neuer Talente zu lernen. Je mehr du lernst, desto wertvoller bist du für uns.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Mimo jiné je tu ještě řada dovedností, které se musí každý nováček naučit. Čím víc se toho naučíš, tím větší cenu pro nás budeš mít.

//	B_LogEntry(CH1_JoinOC,"To be allowed to join, I need to impress important people in the Outer Ring and to absolve a test of faith with Diego.");
//	B_LogEntry(CH1_JoinOC,"Um aufgenommen zu werden, muss ich wichtige Leute im Aussenring beeindrucken und eine Prüfung des Vertrauens bei Diego ablegen.");
	B_LogEntry(CH1_JoinOC,"Abych se mohl přidat, musím udělat dojem na lidi z Vnějšího okruhu a složit Diegovu zkoušku poctivosti.");
};

// ************************************************************
// Wo wichtige Leute
// ************************************************************

instance Info_Diego_Celebs(C_INFO) // E2/E3
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Celebs_Condition;
	information = Info_Diego_Celebs_Info;
	important = 0;
	permanent = 0;
//	description = "Where do I find the important people?";
//	description = "Wo finde ich die wichtigen Leute?";
	description = "Kde najdu ty důležité lidi?";
};

func int Info_Diego_Celebs_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_Celebs_Info()
{
//	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Where do I find the important people?
//	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Wo finde ich die wichtigen Leute?
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Kde najdu ty důležité lidi?
//	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Well, you're looking at one of them. Then there's Thorus... you already know him.
//	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Nun, einer steht hier direkt vor dir, dann wäre da noch Thorus, den kennst du ja schon.
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Dobrá, právě se díváš na jednoho z nich. Pak je tu Thorus... toho už znáš.
//	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //As for the others... you'll have to find that out by yourself. If you don't manage to do that, you don't belong here anyway.
//	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Was die anderen betrifft, das wirst du selbst rausfinden müssen. Wenn du dazu nicht in der Lage bist, hast du hier im Lager sowieso nichts verloren.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Co se týče ostatních... budeš si je muset najít sám. Jestli se ti to nepodaří, nebudeš tady moci zůstat.
//	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Just go through the Outer Ring and talk to people, then you'll find out who's important.
//	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Geh einfach durch den Außenring und rede mit den Leuten. Du findest dann schon raus, an wen du dich halten mußt.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Běž přes Vnější okruh a mluv s lidmi. Tak zjistíš, kdo je důležitý.
};

// ************************************************************
// Wo Lehrer
// ************************************************************

instance Info_Diego_Teachers(C_INFO) // E2/E3
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Teachers_Condition;
	information = Info_Diego_Teachers_Info;
	important = 0;
	permanent = 0;
//	description = "Who can teach me?";
//	description = "Bei wem kann ich was lernen?";
	description = "Kdo mě může učit?";
};

func int Info_Diego_Teachers_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_Teachers_Info()
{
//	AI_Output(hero,self,"Info_Diego_Teachers_15_00"); //Who can teach me?
//	AI_Output(hero,self,"Info_Diego_Teachers_15_00"); //Bei wem kann ich was lernen?
	AI_Output(hero,self,"Info_Diego_Teachers_15_00"); //Kdo mě může učit?
//	AI_Output(self,hero,"Info_Diego_Teachers_11_01"); //Start with Fingers. He's the most skillful among us.
//	AI_Output(self,hero,"Info_Diego_Teachers_11_01"); //Für den Anfang solltest du dich an Fingers halten. Er ist der Geschickteste von uns.
	AI_Output(self,hero,"Info_Diego_Teachers_11_01"); //Začni s Fingersem. Ten je z nás nejzručnější.
//	AI_Output(self,hero,"Info_Diego_Teachers_11_02"); //If you keep your eyes peeled, you'll find other people who can teach you.
//	AI_Output(self,hero,"Info_Diego_Teachers_11_02"); //Wenn du die Augen aufhältst, wirst du noch andere Leute finden, die dir etwas beibringen können.
	AI_Output(self,hero,"Info_Diego_Teachers_11_02"); //Když budeš mít oči na stopkách, najdeš další lidi, kteří tě budou moci nečemu naučit.
//	AI_Output(hero,self,"Info_Diego_Teachers_15_03"); //Where can I find Fingers?
//	AI_Output(hero,self,"Info_Diego_Teachers_15_03"); //Wo finde ich diesen Fingers?
	AI_Output(hero,self,"Info_Diego_Teachers_15_03"); //Kde najdu Fingerse?
//	AI_Output(self,hero,"Info_Diego_Teachers_11_04"); //His hut's kind of hidden. It's next to the castle wall. Just start out here and go towards the arena.
//	AI_Output(self,hero,"Info_Diego_Teachers_11_04"); //Seine Hütte liegt etwas zurück, direkt an der Burgmauer, wenn du von hier zur Arena gehst.
	AI_Output(self,hero,"Info_Diego_Teachers_11_04"); //Jeho chatrč je trošku schovaná. Stojí přímo vedle hradní zdi, když půjdeš odsud směrem k aréně.
//	AI_Output(self,hero,"Info_Diego_Teachers_11_05"); //When you're at the castle gate, go down to the left and you'll be heading for the arena.
//	AI_Output(self,hero,"Info_Diego_Teachers_11_05"); //Wenn du vorm Burgtor stehst, geh links runter, da geht's Richtung Arena.
	AI_Output(self,hero,"Info_Diego_Teachers_11_05"); //Když budeš u hradní brány, pokračuj doleva, až dojdeš k aréně.

	if (Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
//		B_LogEntry(GE_TeacherOC,"Fingers can teach PICKPOCKETING and how to OPEN LOCKS. He lives in a hut near the arena, slightly secluded, by the castle walls.");
//		B_LogEntry(GE_TeacherOC,"Fingers kann mir TASCHENDIEBSTAHL und SCHLÖSSER ÖFFNEN beibringen, er wohnt in einer Hütte nahe der Arena, etwas zurükliegend an der Burgmauer.");
		B_LogEntry(GE_TeacherOC,"Fingers mě může naučit VYBÍRÁNÍ KAPES a OTEVÍRÁNÍ ZÁMKŮ. Žije nedaleko arény, poněkud stranou u hradních zdí.");
	};
};

// ************************************************************
// DIEGO = Lehrer
// ************************************************************
	var int Diego_Merke_STR;
	var int Diego_Merke_DEX;
// ************************************************************

instance Info_Diego_Teach(C_INFO)
{
	npc = PC_Thief;
	nr = 100;
	condition = Info_Diego_Teach_Condition;
	information = Info_Diego_Teach_Info;
	important = 0;
	permanent = 1;
//	description = "Can you teach me something?";
//	description = "Kannst du mir was beibringen?";
	description = "Můžeš mě něco naučit?";
};

func int Info_Diego_Teach_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_Teach_Info()
{
	if (log_diegotrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
//		B_LogEntry(GE_TeacherOC,"Diego can help me to become STRONGER and more DEXTEROUS.");
//		B_LogEntry(GE_TeacherOC,"Diego kann mir helfen STÄRKER und GESCHICKTER zu werden.");
		B_LogEntry(GE_TeacherOC,"Diego mi může pomoci stát se SILNĚJŠÍM a OBRATNĚJŠÍM.");
		log_diegotrain = TRUE;
	};
//	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //Can you teach me something?
//	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //Kannst du mir was beibringen?
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //Můžeš mě něco naučit?
//	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Yes. I can teach you to improve your dexterity or your strength.
//	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Ja. Bei mir kannst du lernen, deine Geschicklichkeit zu verbessern oder deine Kampfkraft zu steigern.
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Ano. Můžu tě naučit, jak zlepšit obratnost nebo sílu.

	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];

	Info_ClearChoices(Info_Diego_Teach);
//	Info_AddChoice(Info_Diego_Teach,"DIALOG_BACK ",Info_Diego_Teach_BACK);
	Info_AddChoice(Info_Diego_Teach,DIALOG_BACK ,Info_Diego_Teach_BACK);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);

};

func void Info_Diego_Teach_BACK()
{
	if (Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
//		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Your strength has increased a lot.
//		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Deine Kampfkraft ist um einiges gestiegen.
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Tvoje síla se dost zlepšila.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
//		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Your skills in using the bow and the crossbow have improved.
//		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Dein Geschick im Umgang mit Bögen und Armbrüsten ist schon besser geworden.
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Tvoje dovednost zacházení s lukem a samostřílem se zlepšila.
	};
//	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Come back soon - there are many things you need to learn!
//	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Komm bald wieder - es gibt viel zu lernen!
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Brzy se vrať - ještě se toho musíš hodně naučit!
	Info_ClearChoices(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	B_BuyAttributePoints(hero,ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Info_Diego_Teach);
//	Info_AddChoice(Info_Diego_Teach,"DIALOG_BACK ",Info_Diego_Teach_BACK);
	Info_AddChoice(Info_Diego_Teach,DIALOG_BACK ,Info_Diego_Teach_BACK);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_STR_5()
{
	B_BuyAttributePoints(hero,ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Info_Diego_Teach);
//	Info_AddChoice(Info_Diego_Teach,"DIALOG_BACK ",Info_Diego_Teach_BACK);
	Info_AddChoice(Info_Diego_Teach,DIALOG_BACK ,Info_Diego_Teach_BACK);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_1()
{
	B_BuyAttributePoints(hero,ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Info_Diego_Teach);
//	Info_AddChoice(Info_Diego_Teach,"DIALOG_BACK ",Info_Diego_Teach_BACK);
	Info_AddChoice(Info_Diego_Teach,DIALOG_BACK ,Info_Diego_Teach_BACK);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_5()
{
	B_BuyAttributePoints(hero,ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Info_Diego_Teach);
//	Info_AddChoice(Info_Diego_Teach,"DIALOG_BACK ",Info_Diego_Teach_BACK);
	Info_AddChoice(Info_Diego_Teach,DIALOG_BACK ,Info_Diego_Teach_BACK);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
//	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

// ************************************************************
// BRING LIST
// ************************************************************

var int Diego_BringList; //MISSIONSVARIABLE

// ----------------------------- OFFER -------------------------------------

instance Info_Diego_BringList_Offer(C_INFO)
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_BringList_Offer_Condition;
	information = Info_Diego_BringList_Offer_Info;
	important = 0;
	permanent = 0;
//	description = "What's the test of faith?";
//	description = "Was ist die Prüfung des Vertrauens?";
	description = "Co je to test oddanosti?";
};

func int Info_Diego_BringList_Offer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_BringList_Offer_Info()
{
//	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_00"); //What's the test of faith?
//	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_00"); //Was ist die Prüfung des Vertrauens?
	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_00"); //Co je to test oddanosti?
//	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_01"); //You have to go to the Old Mine. There you'll meet a guy called Ian. He'll give you a list.
//	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_01"); //Du sollst für mich zur alten Mine gehen. Dort triffst du einen Kerl namens Ian. Er wird dir eine Liste geben.
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_01"); //Musíš jít do Starého dolu. Tam najdeš chlapíka jménem Ian. Ten ti dá seznam.
//	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_02"); //This list is important. It contains all the items the guys in the mine need from us.
//	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_02"); //Diese Liste ist wichtig. Da steht drauf, was die Jungs in der Mine von uns brauchen.
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_02"); //Ten seznam je důležitý. Obsahuje všechny věci, které od nás chlapi v dole potřebují.
//	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_03"); //They'll get the stuff with the next convoy!
//	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_03"); //Das schicken wir ihnen dann mit dem nächsten Convoy!
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_03"); //Dostanou zásoby z příštího konvoje.
//	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_04"); //No problem!
//	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_04"); //Kein Problem!
	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_04"); //To není problém!
//	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_05"); //Yes, there is a problem! The New Camp must not get that list!
//	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_05"); //Oh, doch! Das ist ein Problem. Das Neue Lager darf auf keinen Fall die Liste in die Finger bekommen!
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_05"); //Jeden problém by tady byl! Ten seznam se nesmí dostat do rukou Nového tábora!
//	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_06"); //Like I said: The list is important. If you do it right, you'll get much further.
//	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_06"); //Wie ich schon sagte, die Liste ist wichtig. Wenn du die Sache gut machst, bringt dich das einen großen Schritt weiter.
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_06"); //Jak jsem řekl: ten seznam je důležitý. Když to provedeš dobře, pokročíš dál.

	Diego_BringList = LOG_RUNNING;

	Log_CreateTopic(CH1_BringList,LOG_MISSION);
	Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
//	B_LogEntry(CH1_BringList,"Diego has sent me to the Old Mine. I'm supposed to get a list from a guy called Ian. The list must on no account fall into the hands of the New Camp.");
//	B_LogEntry(CH1_BringList,"Diego hat mich zur Alten Mine geschickt. Dort soll ich von einem Mann namens Ian eine Liste bekommen. Die Liste darf auf keinen Fall dem Neuen Lager in die Finger fallen.");
	B_LogEntry(CH1_BringList,"Diego mě poslal do Starého dolu. Mám získat od chlapíka jménem Ian seznam. Tento seznam se nesmí dostat do rukou nikomu z Nového tábora.");

	VAR C_NPC Ian; Ian = Hlp_GetNpc(STT_301_IAN);
	CreateInvItem(STT_301_IAN, TheList);
};

// -------------------------------------------------------------------------------

instance Info_Diego_IanPassword(C_INFO)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_IanPassword_Condition;
	information = Info_Diego_IanPassword_Info;
	important = 0;
	permanent = 0;
//	description = "If the list is so important, why should Ian give it to me?";
//	description = "Wenn die Liste so vichtig ist, wieso sollte Ian sie mir geben?";
	description = "Když je ten seznam tak důležitý, tak proč by ho měl Ian dávat právě MNĚ?";
};

func int Info_Diego_IanPassword_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_IanPassword_Info()
{
//	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_01"); //If the list is so important, why should Ian give it to ME?
//	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_01"); //Wenn die Liste so wichtig ist, wieso sollte Ian sie dann ausgerechnet MIR geben?
	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_01"); //Když je ten seznam tak důležitý, tak proč by ho měl Ian dávat právě MNĚ?
//	AI_Output(self,hero,"Info_Diego_IanPassword_Info_11_02"); //Because you're going to tell him Diego sent you.
//	AI_Output(self,hero,"Info_Diego_IanPassword_Info_11_02"); //Weil du ihm sagst, Diego schickt dich.
	AI_Output(self,hero,"Info_Diego_IanPassword_Info_11_02"); //Protože mu řekneš, že tě poslal Diego.
//	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_03"); //I'll tell him.
//	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_03"); //Werd's ihm ausrichten.
	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_03"); //Řeknu mu to.

//	B_LogEntry(CH1_BringList,"Ian will give me the list if I tell him that Diego sent me.");
//	B_LogEntry(CH1_BringList,"Ian wird mir die Liste geben, wenn ich ihm sage, dass Diego mich schickt.");
	B_LogEntry(CH1_BringList,"Ian mi předá seznam, když mu řeknu, že mě posílá Diego.");
};

// ----------------------------------------------------------------------------------

instance Info_Diego_MapToOldMine(C_INFO)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_MapToOldMine_Condition;
	information = Info_Diego_MapToOldMine_Info;
	important = 0;
	permanent = 0;
//	description = "Where can I find the Old Mine?";
//	description = "Wo finde ich die Alte Mine?";
	description = "Kde najdu Starý důl?";
};

func int Info_Diego_MapToOldMine_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_MapToOldMine_Info()
{
//	AI_Output(hero,self,"Info_Diego_MapToOldMine_Info_15_00"); //Where can I find the Old Mine?
//	AI_Output(hero,self,"Info_Diego_MapToOldMine_Info_15_00"); //Wo finde ich die Alte Mine?
	AI_Output(hero,self,"Info_Diego_MapToOldMine_Info_15_00"); //Kde najdu Starý důl?
//	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_01"); //Go to Graham. He's a cartographer. Tell him that I sent you and that you need a map. It'll show you the way to the mine.
//	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_01"); //Geh zu Graham. Er zeichnet Karten. Sag ihm, du kommst von mir. Er soll dir 'ne Karte geben. Auf der wirst du die Mine finden.
	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_01"); //Jdi za Grahamem. To je kartograf. Řekni mu, že jsem tě poslal a že potřebuješ mapu. Z té se dozvíš cestu do dolu.
//	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_02"); //He lives to the left of the north gate.
//	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_02"); //Er wohnt drüben links neben dem Nordtor.
	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_02"); //Bydlí vlevo od severní brány.

//	B_LogEntry(CH1_BringList,"Graham will give me a map. I can find him to the left of the north gate.");
//	B_LogEntry(CH1_BringList,"Graham wird mir eine Karte geben, ich finde ihn links neben dem Nordtor.");
	B_LogEntry(CH1_BringList,"Graham mi dá mapu. Najdu ho nalevo od severní brány.");
};

// ------------------------------ SUCCESS ----------------------------------

instance Info_Diego_BringList_Success(C_INFO)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_BringList_Success_Condition;
	information = Info_Diego_BringList_Success_Info;
	important = 0;
	permanent = 0;
//	description = "I have the list from Ian.";
//	description = "Ich hab' die Liste von Ian.";
	description = "Mám seznam od Iana.";
};

func int Info_Diego_BringList_Success_Condition()
{
	if ((Diego_BringList == LOG_RUNNING)
	&& ((Npc_HasItems(hero,TheList)) || (Npc_HasItems(hero,TheListNC))))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_BringList_Success_Info()
{
//	AI_Output(hero,self,"Info_Diego_BringList_Success_15_00"); //I have the list from Ian.
//	AI_Output(hero,self,"Info_Diego_BringList_Success_15_00"); //Ich hab' die Liste von Ian.
	AI_Output(hero,self,"Info_Diego_BringList_Success_15_00"); //Mám seznam od Iana.

	if (Npc_HasItems(hero,TheList))
	{
		B_GiveInvItems(hero,self,TheList,1);
//		B_LogEntry(CH1_BringList,"Diego was very happy when I gave him Ian's list.");
//		B_LogEntry(CH1_BringList,"Diego war sehr zufrieden als ich ihm Ian's Liste überreichte.");
		B_LogEntry(CH1_BringList,"Diego měl velkou radost, když jsem mu předal seznam, který jsem dostal od Iana.");
	}
	else if (Npc_HasItems(hero,TheListNC))
	{
		B_GiveInvItems(hero,self,TheListNC,1);
//		B_LogEntry(CH1_BringList,"Diego was very content when I gave him Ian's list. Looks like he didn't notice that Lares forged it, or did I just see a sparkle in his eyes?");
//		B_LogEntry(CH1_BringList,"Diego war sehr zufrieden als ich ihm Ian's Liste überreichte. Er scheint Lares' Fälschung nicht durchschaut zu haben, oder habe ich gerade ein Funkeln in seinen Augen gesehen?");
		B_LogEntry(CH1_BringList,"Diego byl velmi spokojený, když jsem mu předal Ianův seznam. Nevšiml si, že jej padělal Lares, nebo jsem v jeho očích zahlédl jiskřičky?");
	};
	B_UseFakeScroll();

//	AI_Output(self,hero,"Info_Diego_BringList_Success_11_01"); //Well done! That'll get you a few brownie points!
//	AI_Output(self,hero,"Info_Diego_BringList_Success_11_01"); //Gut gemacht! Das bringt dir einige Pluspunkte ein!
	AI_Output(self,hero,"Info_Diego_BringList_Success_11_01"); //Dobrá práce! Tak dostaneš pár kladných bodů!

	Diego_BringList = LOG_SUCCESS;
	B_GiveXP(XP_DiegoBringlist);

	Log_SetTopicStatus(CH1_BringList,LOG_SUCCESS);

	Points_OC = Points_OC + 5;
};

// ************************************************************
// Punktewertung
// ************************************************************
	var int Diego_GomezAudience;
// ************************************************************

instance Info_Diego_JoinAnalyze(C_INFO)
{
	npc = PC_Thief;
	nr = 800;
	condition = Info_Diego_JoinAnalyze_Condition;
	information = Info_Diego_JoinAnalyze_Info;
	important = 0;
	permanent = 1;
//	description = "What about my esteem within the Camp?";
//	description = "Wie steht's mit meinem Ansehen im Lager?";
	description = "A co má vážnost v táboře?";
};

func int Info_Diego_JoinAnalyze_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Diego_Rules))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	&& (oldHeroGuild == 0))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_JoinAnalyze_Info()
{
//	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_00"); //What about my esteem within the Camp?
//	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_00"); //Wie steht's mit meinem Ansehen im Lager?
	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_00"); //A co má vážnost v táboře?
//	AI_Output(self,hero,"Info_Diego_JoinAnalyze_11_01"); //I've talked to a few people...
//	AI_Output(self,hero,"Info_Diego_JoinAnalyze_11_01"); //Ich hab' mal mit ein paar Leuten geredet...
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_11_01"); //Mluvil jsem s několika lidmi...
//	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_02"); //And?
//	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_02"); //Und?
	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_02"); //A?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty told me you defeated Kirgo.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty hat mir gesagt, du hast Kirgo besiegt.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty mi řekl, že jsi porazil Kirga.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty told me you let Kirgo beat you. He didn't seem to be very enthusiastic.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty hat mir gesagt, du hast gegen Kirgo verloren. Er hat sich nicht seher begeistert angehört.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty mi řekl, že tě Kirgo porazil. Nevypadal moc nadšeně.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty has told me he's anxious to see how you come off against Kirgo.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty hat mir gesagt, er wäre gespannt, wie du gegen Kirgo abschneidest.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty mi řekl, že už se nemůže dočkat, až tě uvidí nastoupit proti Kirgovi.
	};

	if (Scatty_ChargeKharim == LOG_FAILED)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //But he was impressed by you having the courage to fight against Kharim, even though you've been defeated.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Aber dass du den Mumm gehabt hast, gegen Kharim anzutreten hat ihm imponiert, obwohl du verloren hast.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Ale udělalo na něj dojem, že jsi se postavil Kharimovi - ikdyž jsi byl poražen.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //But he was greatly impressed that you defeated Kharim - he wouldn't stop talking about you at all.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Aber dass du gegen Kharim gewonnen hast, hat ihn total von den Socken gehauen - er hat gar nicht mehr aufgehört, von dir zu reden.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Udělalo na něj ale velký dojem to, že jsi porazil Kharima - nepřestával o tobě vůbec mluvit.
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //And he's anxious to see if you'll challenge Kharim.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //Und er war sehr gespannt, ob du Kharim herausfordern wirst.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //Nemůže se dočkat, jestli vyzveš Kharima.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Whistler told me the story about Fisk... Well, if I was you I would have taken the ore and cleared off. But anyway - he thinks a great deal of you.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Whistler hat mir von der Sache mit Fisk erzählt... Also ich an deiner Stelle wäre ja mit dem Erz durchgebrannt. Aber egal - er hält jedenfalls große Stücke auf dich.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Whistler mi vyprávěl příběh o Fiskovi... No, být tebou, vzal bych tu rudu a zmizel. Mluvil o tobě velice kladně.
		Points_OC = Points_OC + 3;
	}
	else if ((Whistler_BuyMySword == LOG_FAILED) || ((Whistler_BuyMySword == LOG_RUNNING) && (Whistler_BuyMySword_Day <= (Wld_GetDay() - 2))))
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //I've talked to Whistler. You took his ore, you clever bastard! I must admit, you're quite brave!
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //Ich hab' mit Whistler geredet. Du bist mit seinem Erz durchgebrannt, du gerissener Hund! Ich muss schon sagen, Mut hast du ja!
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //Mluvil jsem s Whistlerem. Sebral jsi jeho rudu, ty prohnanej bastarde! Musím uznat, že máš odvahu!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Whistler is waiting for his sword. You should make up your mind whether to bring it to him or not, otherwise he'll think that you've cleared off with his ore!
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Whistler wartet auf sein Schwert. Du solltest dich entscheiden, ob du's ihm bringen willst, sonst denkt er noch, du brennst mit seinem Erz durch!
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Whistler čeká na svůj meč. Měl by sis rozmyslet, jestli mu ho přineseš nebo ne. Jestli ne, bude si myslet, že jsi mu sebral jeho rudu!

	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Sly told me that you've found Nek. He seemed to be really content.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Sly hat mir erzählt, du hast Nek gefunden. Er wirkte sehr zufrieden.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Sly mi řekl, že jsi našel Neka. Myslím, že byl opravdu spokojený.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //I think Sly's wrong about Nek. He was a real pain, that's true, but I don't think he went to the New Camp.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Ich denke, bei der Sache mit Nek liegt Sly falsch. Er hat zwar immer viel gemeckert, aber ins Neue Lager ist er sicher nicht gegangen.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Mám pocit že se Sly v Nekovi spletl. Byl to opravdu otrapa, to je pravda, ale nemyslím si, že šel do Nového tábora.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //I've already sent you to Fingers - he could really teach you something!
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //Zu Fingers hab' ich dich ja schon geschickt - du solltest ruhig etwas von ihm lernen.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //Už jsem tě poslal k Fingersovi - mohl by tě doopravdy něco naučit!
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //Fingers told me that you've already learned a bit, but he thinks you can still improve your skills.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //Fingers sagt, du hättest was gelernt. Er denkt, du wirst noch um einiges besser werden.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //Fingers mi řekl, že ses už něco naučil, ale myslí si, že se máš pořád ještě v čem zlepšovat.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //I really need to talk to Dexter. He's using you for his own business.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Mit Dexter muss ich noch ein ernstes Wörtchen reden. Er benutzt dich für seine eigenen Geschäfte.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Musím si promluvit s Dexterem. Využívá tě ve svůj vlastní prospěch.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //But there aren't any rules for the test. If you manage THAT you'll be making a big step.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Aber es gibt keine Regeln für die Probe. Wenn du DAS schaffst, bist du einen großen Schritt weiter.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Pro zkoušku ale neexistují žádná pravidla. Pokud se ti TO podaří, bude to velký krok kupředu.

	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //You've really managed to get the recipe from Kalom. Dexter is very impressed, and so am I.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Du hast es tatsächlich geschafft, Kalom das Rezept abzuluchsen. Ich bin mindestens genauso beeindruckt wie Dexter.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Opravdu se ti podařilo získat recept od Kaloma. Na Dextera to udělalo velký dojem a na mě taky.
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //The business with Mordrag is really quite a job. He's not bad as a warrior. You should exercise if you really want to defeat him.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //Bei der Mordrag-Sache hast du 'nen ganz schönen Brocken als Auftrag angenommen. Er ist kein schlechter Kämpfer. Du solltest einigermaßen trainiert sein, wenn du ihn schaffen willst.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //Úkol s Mordragem je docela dobrá práce. Jako bojovník není špatný. Jestli ho chceš porazit, měl bys hodně cvičit.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus says we could make use of someone like you - that's very good for you.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus sagt, so einen wie dich können wir brauchen - das allein ist schon verdammt viel Wert für dich.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus říká, že bychom mohli potřebovat někoho, jako jsi ty - to je pro tebe velmi dobré.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Thorus's head nearly burst because he was raging mad - how dare you screw up the job LIKE THIS?
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Thorus ist fast der Kopf geplatzt, so hat er geschrien - was hast du dir dabei gedacht, gerade diese Sache SO zu vermasseln?
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Thorusovi nejspíš praskne hlava vzteky - jak ses mohl opovážit pokazit TAKOVÝ úkol?
		Points_OC = Points_OC - 5;
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk told me you surprised him. In any case he'll be on your side.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk hat mir gesagt, du hättst ihn überascht. Er ist auf jeden Fall auf deiner Seite.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk mi řekl, že jsi ho překvapil. V každém případě bude na tvojí straně.
		Points_OC = Points_OC + 5;
	}
	else if ((MordragKO_HauAb == TRUE) || (MordragKO_StayAtNC == TRUE))
	{
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk is really pissed off with you. If I were you I'd look for someone to replace Mordrag.
//		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk ist echt sauer auf dich, Mann. Wenn ich du wäre würd ich mich um Ersatz für Mordrag kümmern.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk je na tebe opravdu naštvaný. Být tebou, hledal bych někoho namísto Mordraga.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
//		AI_Output(self,hero,"Info_Diego_Points_11_00"); //You've found enough people to speak in your favor.
//		AI_Output(self,hero,"Info_Diego_Points_11_00"); //Du hast genug Leute gefunden, die für dich sprechen.
		AI_Output(self,hero,"Info_Diego_Points_11_00"); //Našel jsi dost lidí, kteří budou mluvit v tvůj prospěch.

		if (hero.level >= 5)
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
//				AI_Output(self,hero,"Info_Diego_Points_11_01"); //You also passed the test of faith. Go to Thorus. I've already told him everything. He'll let you go to see Gomez.
//				AI_Output(self,hero,"Info_Diego_Points_11_01"); //Und die Prüfung des Vertrauens hast du auch bestanden. Geh zu Thorus. Ich habe ihm schon alles erzählt. Er wird dich zu Gomez lassen.
				AI_Output(self,hero,"Info_Diego_Points_11_01"); //Také jsi složil zkoušku poctivosti. Jdi za Thorusem. Už jsem mu všechno řekl. Nechá tě navštívit Gomeze.
				Diego_GomezAudience = TRUE;

				Log_SetTopicStatus(CH1_JoinOC,LOG_SUCCESS);
//				B_LogEntry(CH1_JoinOC,"Diego got me an audience with Gomez. Now I can become one of Gomez' people and enter the castle, I only need to see Thorus first.");
//				B_LogEntry(CH1_JoinOC, "Diego hat mir eine Audienz bei Gomez verschafft. Jetzt kann ich einer von Gomez Leuten werden und die Burg betreten, ich muss nur noch zu Thorus gehen.");
				B_LogEntry(CH1_JoinOC,"Diego mi zařídil slyšení u Gomeze. Nyní jsem jedním z Gomezových lidí a mám přístup na hrad, jen musím nejdříve navštívit Thoruse.");
			}
			else
			{
//				AI_Output(self,hero,"Info_Diego_Points_11_02"); //But you still have to pass the test of faith.
//				AI_Output(self,hero,"Info_Diego_Points_11_02"); //Aber die Prüfung des Vertrauens liegt noch vor dir.
				AI_Output(self,hero,"Info_Diego_Points_11_02"); //Ještě ale musíš složit zkoušku poctivosti.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
//		AI_Output(self,hero,"Info_Diego_Points_11_10"); //All things considered, that's not too bad for a newcomer.
//		AI_Output(self,hero,"Info_Diego_Points_11_10"); //Alles in allem schon nicht so schlecht für eine Neuen.
		AI_Output(self,hero,"Info_Diego_Points_11_10"); //Konec konců to nebylo zlé, na nováčka.
	}
	else if (points_oc >= 0)
	{
//		AI_Output(self,hero,"Info_Diego_Points_11_20"); //Get on with it! There are still many things to do if you wanna get anywhere here in the Camp.
//		AI_Output(self,hero,"Info_Diego_Points_11_20"); //Halt dich ran, es gibt noch viel zu tun, wenn du es hier im Lager zu was bringen willst.
		AI_Output(self,hero,"Info_Diego_Points_11_20"); //Počkej s tím! Zbývá ještě udělat spousta věcí, jestli se chceš někam v táboře dostat.
	};
	/*else
	{
		AI_Output(self,hero,"Info_Diego_Points_11_30"); //Machst du Witze, Kleiner? Kein Schwein kennt dich hier!
	};*/
};

/*
	Scatty: Scatty_ChargeKirgo == LOG_SUCCESS +2
				Scatty_ChargeKirgo == LOG_FAILED -1
				Scatty_ChargeKharim == LOG_SUCCESS +5
				Scatty_ChargeKharim == LOG_FAILED +2

	Whistler: Whistler_BuyMySword = LOG_SUCCESS; +3
				Whistler_BuyMySword = LOG_FAILED; +2

	Sly: Sly_LostNek = LOG_SUCCESS; +4

	Fingers: Fingers_Learnt = LOG_SUCCESS; +3

	Dexter: Dexter_GetKalomsRecipe = LOG_SUCCESS; +5

	Thorus: Thorus_MordragKo = LOG_SUCCESS; +5
				Thorus_MordragKo = LOG_FAILED; -5

				VAR INT MordragKO_PlayerChoseOreBarons;
				VAR INT MordragKO_PlayerChoseThorus;
				VAR INT MordragKO_HauAb;
				var int MordragKO_StayAtNC;

	Fisk: Fisk_GetNewHehler = LOG_SUCCESS; // else if ((MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE))

	//--- EXTRA Bedingung ------

	Diego: Diego_BringList = LOG_SUCCESS;
*/

instance Info_Diego_WhatToSayToGomez(C_INFO)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_WhatToSayToGomez_Condition;
	information = Info_Diego_WhatToSayToGomez_Info;
	important = 0;
	permanent = 0;
//	description = "What do I have to do when I meet Gomez?";
//	description = "Was soll ich machen, wenn ich bei Gomez bin?";
	description = "Co musím udělat, až se setkám s Gomezem?";
};

func int Info_Diego_WhatToSayToGomez_Condition()
{
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_WhatToSayToGomez_Info()
{
//	AI_Output(hero,self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //What do I have to do when I meet Gomez?
//	AI_Output(hero,self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Was soll ich machen, wenn ich bei Gomez bin?
	AI_Output(hero,self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Co musím udělat, až se setkám s Gomezem?
//	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Gomez' decisions are made from gut instinct. He'll look at your mug and then he'll make up his mind if you can join.
//	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Gomez entscheidet aus dem Bauch heraus. Wenn ihm deine Visage passt, bist du dabei.
	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Gomez se rozhoduje pomocí vnitřního instinktu. Podívá se ti na kukuč, a pak se rozhodne, jestli se můžeš přidat, nebo ne.
//	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //From now on you'll have to get by on your own - make the best of it! Good luck.
//	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //Ab jetzt bist du auf dich allein gestellt - Mach das Beste draus! Viel Glück.
	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //Od teďka si budeš muset jít po svých - dělej, jak nejlíp umíš. Hodně štěstí.
};

//#####################################################################
//##
//##
//## KAPITEL 2
//##
//##
//#####################################################################
//***************************************************************************
// Info ARMOR
//***************************************************************************
instance PC_Thief_ARMOR(C_INFO)
{
	npc = PC_Thief;
	condition = PC_Thief_ARMOR_Condition;
	information = PC_Thief_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = B_BuildBuyArmorString(NAME_DiegoHeavyShadows,VALUE_STT_ARMOR_H);
};

func int PC_Thief_ARMOR_Condition()
{
	if ((Npc_GetTrueGuild(hero) == GIL_STT)
	&& (!Npc_HasItems(hero,STT_ARMOR_H)))
	{
		return 1;
	};

	return 0;
};

func void PC_Thief_ARMOR_Info()
{
	if (Npc_HasItems(hero,ItMinugget) >= VALUE_STT_ARMOR_H)
	{
//		AI_Output(hero,self,"PC_Thief_ARMOR_Info_15_01"); //Can I have an armor like yours?
//		AI_Output(hero,self,"PC_Thief_ARMOR_Info_15_01"); //Kann ich eine Rüstung haben, wie du sie trägst?
		AI_Output(hero,self,"PC_Thief_ARMOR_Info_15_01"); //Můžu mít takovou zbroj jako ty?
//		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_02"); //Do you have enough ore?
//		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_02"); //Hast du das nötige Erz in der Tasche?
		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_02"); //Máš dostatek rudy?

		CreateInvItem(hero,STT_ARMOR_H);
		B_GiveInvItems(hero,self,ItMinugget, VALUE_STT_ARMOR_H);

		//hier nur ein Text für die Bildschirmausgabe - čuňárna :D
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	}
	else
	{
//		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_03"); //Get the ore, then you'll get the armor.
//		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_03"); //Besorge dir das Erz, dann bekommst du die Rüstung.
		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_03"); //Obstarej si rudu, pak dostaneš výzbroj.
	};
};

//#####################################################################
//##
//##
//## KAPITEL 3
//##
//##
//#####################################################################

//----------------------------------------------------------------
// Die Troll Situation
//----------------------------------------------------------------

instance PC_Thief_MEETAGAIN(C_INFO)
{
	npc = PC_Thief;
	condition = PC_Thief_MEETAGAIN_Condition;
	information = PC_Thief_MEETAGAIN_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_MEETAGAIN_Condition()
{
	if ((Kapitel == 3)
	&& (Npc_GetDistToWP(self,"OW_PATH_190") < 700))
	{
		return 1;
	};

	return 0;
};

func void PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Hey, I thought you were dead.
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Hey, ich dachte, du wärst tot.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Hej, myslel jsem, že jsi mrtvý!
//	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_01"); //Sometimes I thought so myself.
//	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_01"); //Das ein oder andere Mal hab' ich das auch gedacht.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_01"); //Občas mám taky ten pocit.
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_02"); //A lot of things have happened since we last met. I hear you've contributed a great deal to the final invocation.
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Seit unserem ersten Treffen ist einiges passiert. Ich hörte, du warst nicht ganz unbeteiligt daran, dass die große Beschwörung stattfinden konnte.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Od našeho posledního setkání se stalo hodně věcí. Slyšel jsem, že ses hodně podílel na hlavním vzývání.
//	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_03"); //Obviously you're quite well informed.
//	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_03"); //Du kriegst ja anscheinend eine ganze Menge mit.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_03"); //Jako obvykle jsi dobře informován.
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Better than you think... Now you're looking for the focus?
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Mehr als du denkst... Jetzt bist du auf Fokus Suche?
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Lépe, než si myslíš... Hledáš teď ohnisko?
//	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_05"); //Yes. There must be one somewhere around here.
//	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_05"); //Ja. Hier in der Gegend muss es irgendwo einen geben.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_05"); //Ano. Musí tady někde být.
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_06"); //I know where to find one. There's just one problem.
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Ich weiß, wo einer liegt. Es gibt da nur ein Problem...
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Vím, kde ho najdeš. Je tu ale jeden problém...
//	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_07"); //I see. What do you want?
//	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_07"); //Ich verstehe. Was willst du haben?
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_07"); //Rozumím. Co chceš?
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_08"); //You've really learnt your lesson, but that's not what I meant.
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Du hast tatsächlich gelernt, aber das meine ich nicht.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Opravdu ses toho hodně naučil, ale to není to, co mám na mysli.
//	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_09"); //No? What's the problem then?
//	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_09"); //Nein? Was ist dann dein Problem?
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_09"); //Ne? A v čem je tedy problém?
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_10"); //It's three tons of a problem.
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_10"); //Ein drei Tonnen schweres Problem.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_10"); //Je tu jeden třítunový problémů.
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Let's go. You'll understand in a moment.
//	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Lass uns gehen. Du wirst es gleich verstehen.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Pojďme. Hned to pochopíš.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GuideTroll");

	Log_CreateTopic(CH3_TrollCanyon,LOG_MISSION);
	Log_SetTopicStatus(CH3_TrollCanyon,LOG_RUNNING);
//	B_LogEntry(CH3_TrollCanyon,"When I approached the focus place in the north, I surprisingly bumped into Diego. He warned me of something 'big' awaiting me at the end of the canyon.");
//	B_LogEntry(CH3_TrollCanyon,"Bei der Annäherung zum nördlichsten Fokusort traf ich überraschenderweise Diego wieder. Er warnte mich vor irgendetwas 'Großem' dass am Ende der Schlucht auf mich warten soll.");
	B_LogEntry(CH3_TrollCanyon,"Když jsem se přiblížil k ohniskovému místu na severu, narazil jsem ke svému překvapení na Diega. Varoval mě před čímsi 'velikým', co mě čeká na konci kaňonu.");
//	B_LogEntry(CH3_TrollCanyon,"Somehow he knew about my activities in the swamp camp as well as about my search for the focus. We'll now go on together.");
//	B_LogEntry(CH3_TrollCanyon,"Irgendwoher wußte er sowohl über meine Aktivitäten im Sumpflager als auch von meiner Fokussuche. Wir setzen unseren Weg nun gemeinsam fort.");
	B_LogEntry(CH3_TrollCanyon,"Nějak se dozvěděl o mé činnosti v Táboře v bažinách, stejně jako o tom, že hledám ohnisko. Dále budeme pokračovat společně.");

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info SHOWFOCUS
//---------------------------------------------------------------------
instance PC_Thief_SHOWFOCUS(C_INFO)
{
	npc = PC_Thief;
	condition = PC_Thief_SHOWFOCUS_Condition;
	information = PC_Thief_SHOWFOCUS_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_SHOWFOCUS_Condition()
{
	if ((Npc_KnowsInfo(hero,PC_Thief_MEETAGAIN))
	&& (Npc_GetDistToWP(self,"LOCATION_12_01") < 1000))
	{
		return 1;
	};

	return 0;
};

func void PC_Thief_SHOWFOCUS_Info()
{
	AI_GotoNpc(self,hero);
	//AI_PointAt (self,);
	//AI_StopPointAt (self);

//	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //On the left side of this canyon lies the entrance to a cave that leads to the location of the focus.
//	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //Auf der linken Seite dieser Schlucht gibt es einen Höhlengang, der zum Fokusplatz führt.
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //Na levé straně kaňonu je vchod do jeskyně, která vede až k ohnisku.
//	AI_Output(hero,self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Alright. But first we have to get rid of that monster over there.
//	AI_Output(hero,self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Alles klar. Doch zunächst sollten wir dieses Ungetüm da drüben loswerden.
	AI_Output(hero,self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Dobře. Nejdřív se ale musíme zbavit těch příšer, které se tam kolem potulují.
//	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Try to find a weak point or another possibility to defeat the troll.
//	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Versuche, eine Schwachstelle oder irgendeine Möglichkeit zu finden, wie wir den Troll kleinkriegen können.
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Zkus najít slabinu toho trola. Nebo nějaký jiný způsob, jak ho porazit.
//	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //I'll attract his attention.
//	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Ich lenke seine Aufmerksamkeit auf mich.
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Upoutám jeho pozornost.

//	B_LogEntry(CH3_TrollCanyon,"We've come across a huge troll blocking our way. Diego wants to divert it, while I need to find a way to take it apart.");
//	B_LogEntry(CH3_TrollCanyon,"Wir haben einen riesigen Troll entdeckt, der unseren weiteren Weg versperrt. Diego will ihn ablenken während ich nach einem Weg finden muss, den Troll klein zu kriegen.");
	B_LogEntry(CH3_TrollCanyon,"Narazili jsme na obrovského trola, který nám stojí v cestě. Diego ho zabaví a já zatím musím najít způsob, jak ho porazit.");

	Npc_ExchangeRoutine(self,"WaitAtWheel");

	AI_DrawWeapon (self);
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info AFTERTROLL
//---------------------------------------------------------------------
instance PC_Thief_AFTERTROLL(C_INFO)
{
	npc = PC_Thief;
	condition = PC_Thief_AFTERTROLL_Condition;
	information = PC_Thief_AFTERTROLL_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_AFTERTROLL_Condition()
{
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self,Troll, NOFUNC, -1);

	if (Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS))
	{
		if (((trollFound) && ((Npc_IsDead(other)) || (Npc_IsInState(other,ZS_MagicShrink)))) // Troll besiegt...
		|| ((Npc_GetDistToWP(hero,"LOCATION_12_14_WHEEL")) < 1000)) // ...oder Spieler an der Winde angekommen
		{
			return 1;
		};
	};

	return 0;
};

func void PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc(self,hero);
//	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_01"); //That was fantastic. You're really good. And now, go get the focus.
//	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_01"); //Das war fantastisch. Mann, du hast ja einiges drauf. So, jetzt hol dir den Fokus.
	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_01"); //To bylo fantastické. Chlape, jsi opravdu dobrý. A teď si pojď vzít to ohnisko.
//	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_02"); //I'll make sure that there won't be any other awkward surprises.
//	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Ich passe auf, dass keine weiteren unangenehmen Überraschungen auf uns zu kommen.
	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Ujistím se, že nás tu nečekají žádná nepříjemná překvapení.

//	B_LogEntry(CH3_TrollCanyon,"The troll has been defeated. Now I can see to the winch that moves the grid to the focus platform.");
//	B_LogEntry(CH3_TrollCanyon,"Der Troll ist besiegt. Nun kann ich mich mit der Winde beschäftigen, die das Gitter zur Fokusplattform bewegen kann.");
	B_LogEntry(CH3_TrollCanyon,"Trol byl poražen. Nyní si můžu poradit s navijákem, který spouští mříž na ohniskovou plošinu.");

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info WHEEL
//---------------------------------------------------------------------

instance PC_Thief_WHEEL(C_INFO)
{
	npc = PC_Thief;
	condition = PC_Thief_WHEEL_Condition;
	information = PC_Thief_WHEEL_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_WHEEL_Condition()
{
	if ((Npc_KnowsInfo(hero,PC_Thief_AFTERTROLL))
	&& (Troll_Wheel == 1))
	{
		return 1;
	};

	return 0;
};

func void PC_Thief_WHEEL_Info()
{
//	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_01"); //The winch seems to be jammed.
//	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_01"); //Die Winde scheint zu klemmen.
	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_01"); //Vypadá to, že se ten naviják zasekl.
//	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_02"); //Let me see, maybe I can fix it!
//	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_02"); //Lass mich mal, vielleicht kann ich da was machen!
	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_02"); //Já se na to podívám, třeba se mi ho podaří opravit!

	AI_StopProcessInfos(self);
	AI_GotoWP (self,"LOCATION_12_14_WHEEL");
	AI_AlignToWP (self);
	AI_PlayAni (self,"T_PLUNDER");
};

//---------------------------------------------------------------------
// Info FIXWHEEL
//---------------------------------------------------------------------

instance PC_Thief_FIXWHEEL(C_INFO)
{
	npc = PC_Thief;
	condition = PC_Thief_FIXWHEEL_Condition;
	information = PC_Thief_FIXWHEEL_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_FIXWHEEL_Condition()
{
	if (Npc_KnowsInfo(hero,PC_Thief_WHEEL))
	{
		return 1;
	};

	return 0;
};

func void PC_Thief_FIXWHEEL_Info()
{
//	AI_Output(self,hero,"PC_Thief_FIXWHEEL_Info_11_01"); //Well, it ought to work now.
//	AI_Output(self,hero,"PC_Thief_FIXWHEEL_Info_11_01"); //So, jetzt sollte es eigentlich wieder gehen.
	AI_Output(self,hero,"PC_Thief_FIXWHEEL_Info_11_01"); //Tak, teď už by měl zase fungovat.
	Troll_Wheel = 2; // Winde repariert!

//	B_LogEntry(CH3_TrollCanyon,"Diego has repaired the stuck winch. Now there's nothing in my way any more.");
//	B_LogEntry(CH3_TrollCanyon,"Diego hat die verklemmte Winde repariert. Nun steht mir nichts mehr im Weg.");
	B_LogEntry(CH3_TrollCanyon,"Diego opravil zaseknutý naviják. Teď už mi nic nestojí v cestě.");

	Npc_ExchangeRoutine(self,"WaitAtFocus");

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info WAITATFOCUS
//---------------------------------------------------------------------
instance PC_Thief_WAITATFOCUS(C_INFO)
{
	npc = PC_Thief;
	condition = PC_Thief_WAITATFOCUS_Condition;
	information = PC_Thief_WAITATFOCUS_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_WAITATFOCUS_Condition()
{
	if ((Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL))
	&& (Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000))
	{
		return 1;
	};

	return 0;
};

func void PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //Get the focus and I'll wait for you here!
//	AI_Output(self,hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //Hol dir den Fokus, ich warte hier!
	AI_Output(self,hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //Běž pro to ohnisko, já tu na tebe počkám!

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info GOTIT
//---------------------------------------------------------------------
//-----SPIELER HAT DEN FOKUS GEFUNDEN---------------------

instance PC_Thief_GOTIT(C_INFO)
{
	npc = PC_Thief;
	condition = PC_Thief_GOTIT_Condition;
	information = PC_Thief_GOTIT_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_GOTIT_Condition()
{
	if (Npc_HasItems(hero,Focus_2))
	{
		return 1;
	};

	return 0;
};

func void PC_Thief_GOTIT_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_01"); //Hey, you've found the focus. Very good.
//	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_01"); //Hey, du hast den Fokus also gefunden. Sehr gut.
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_01"); //Hej, našel jsi to ohnisko. Výborně.
//	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_02"); //I think it's time for me to stop by at the Old Camp again. Good luck.
//	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_02"); //Ich werde mal wieder die Lage im Alten Lager prüfen. Viel Glück noch.
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_02"); //Myslím, že je čas zastavit se zase ve Starém táboře. Hodně štěstí.
//	AI_Output(hero,self,"PC_Thief_GOTIT_Info_15_03"); //Make sure you stay alive!
//	AI_Output(hero,self,"PC_Thief_GOTIT_Info_15_03"); //Sieh zu, das du am Leben bleibst.
	AI_Output(hero,self,"PC_Thief_GOTIT_Info_15_03"); //Koukej, abys zůstal naživu!
//	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_04"); //We'll meet again.
//	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_04"); //Wir werden uns wieder sehen.
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_04"); //Ještě se uvidíme.

//	B_LogEntry(CH3_TrollCanyon,"The focus is mine. But I still need to convince some harpies to let me keep it.");
//	B_LogEntry(CH3_TrollCanyon,"Der Fokus ist mein. Ich mußte allerdings noch einige Harpien davon überzeugen, ihn mir zu überlassen.");
	B_LogEntry(CH3_TrollCanyon,"Ohnisko je mé. Musel jsem ale  domluvit několika harpyjím, aby mě jej nechaly sebrat.");
//	B_LogEntry(CH3_TrollCanyon,"Diego's returning to the Old Camp. I'm quite sure we'll meet again.");
//	B_LogEntry(CH3_TrollCanyon,"Diego kehrt zum Alten Lager zurück. Es sollte mich wundern, wenn wir uns nicht irgendwann mal wieder über den Weg laufen sollten.");
	B_LogEntry(CH3_TrollCanyon,"Diego se vrací do Starého tábora. Byl bych překvapený, kdybychom se někdy ještě nepotkali.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine(self,"start");
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
// Info OCWARN
//***************************************************************************

instance Info_Diego_OCWARN(C_INFO)
{
	npc = PC_Thief;
	condition = Info_Diego_OCWARN_Condition;
	information = Info_Diego_OCWARN_Info;
	important = 1;
	permanent = 0;
};

func int Info_Diego_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Diego_OCWARN_11_01"); //Hey... Shhh... Be quiet!
//	AI_Output(self,hero,"Info_Diego_OCWARN_11_01"); //Hey... Pssst.... Sei ganz leise!
	AI_Output(self,hero,"Info_Diego_OCWARN_11_01"); //Hej... Psss... Buď tiše!
	if (Npc_KnowsInfo(hero,Info_Milten_OCWARN))
	{
//		AI_Output(hero,self,"Info_Diego_OCWARN_15_02"); //Hello, Diego, I've already talked to Milten on the other side of the Camp!
//		AI_Output(hero,self,"Info_Diego_OCWARN_15_02"); //Hallo, Diego, ich habe Milten auf der anderen Seite des Lagers schon gesprochen!
		AI_Output(hero,self,"Info_Diego_OCWARN_15_02"); //Ahoj, Diego, už jsem mluvil s Miltenem na druhém konci tábora!
//		AI_Output(self,hero,"Info_Diego_OCWARN_11_03"); //Okay, so you already know what happened.
//		AI_Output(self,hero,"Info_Diego_OCWARN_11_03"); //Gut, dann weißt du ja schon, was passiert ist.
		AI_Output(self,hero,"Info_Diego_OCWARN_11_03"); //Dobře, tak už víš, co se stalo.
//		AI_Output(self,hero,"Info_Diego_OCWARN_11_04"); //But did you also hear about the planned raid on the Free Mine?
//		AI_Output(self,hero,"Info_Diego_OCWARN_11_04"); //Aber weißt du auch von dem geplanten Überfall auf die Freie Mine?
		AI_Output(self,hero,"Info_Diego_OCWARN_11_04"); //Ale víš také o plánovaném útoku na Svobodný důl?
	}
	else
	{
//		AI_Output(hero,self,"Info_Diego_OCWARN_15_05"); //Hello, Diego, what's the meaning of all this hide-and-seek business?
//		AI_Output(hero,self,"Info_Diego_OCWARN_15_05"); //Hallo, Diego, warum dieses Versteckspiel?
		AI_Output(hero,self,"Info_Diego_OCWARN_15_05"); //Ahoj, Diego, co má znamenat ta hra na schovávanou?
//		AI_Output(self,hero,"Info_Diego_OCWARN_11_06"); //Haven't you heard?
//		AI_Output(self,hero,"Info_Diego_OCWARN_11_06"); //Hast du es noch nicht gehört?
		AI_Output(self,hero,"Info_Diego_OCWARN_11_06"); //Tys to ještě neslyšel?
//		AI_Output(hero,self,"Info_Diego_OCWARN_15_07"); //Heard what?
//		AI_Output(hero,self,"Info_Diego_OCWARN_15_07"); //Was gehört?
		AI_Output(hero,self,"Info_Diego_OCWARN_15_07"); //Neslyšel co?
//		AI_Output(self,hero,"Info_Diego_OCWARN_11_08"); //The Old Mine caved in, the fire mages were assassinated and there are plans to raid the Free Mine.
//		AI_Output(self,hero,"Info_Diego_OCWARN_11_08"); //Die eingestürzte Alte Mine, die Ermordung der Feuermagier und die Pläne für den Überfall auf die Freie Mine?
		AI_Output(self,hero,"Info_Diego_OCWARN_11_08"); //Starý důl je zatopený, mágové Ohně byli zavražděni a očekává se útok na Svobodný důl.
//		AI_Output(hero,self,"Info_Diego_OCWARN_15_09"); //WHAAAT???? What are you talking about?
//		AI_Output(hero,self,"Info_Diego_OCWARN_15_09"); //WAAAAS???? Was redest du da?
		AI_Output(hero,self,"Info_Diego_OCWARN_15_09"); //COOŽŽEE???? Co to říkáš?
	};
};

//***************************************************************************
// Info OCMINE
//***************************************************************************
instance Info_Diego_OCMINE(C_INFO)
{
	npc = PC_Thief;
	condition = Info_Diego_OCMINE_Condition;
	information = Info_Diego_OCMINE_Info;
	important = 0;
	permanent = 0;
//	description = "How could the Old Mine cave in?";
//	description = "Wie konnte die Alte Mine einstürzen?";
	description = "Jak mohl být Starý důl zaplaven?";
};

func int Info_Diego_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_OCWARN))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OCMINE_Info()
{
//	AI_Output(hero,self,"Info_Diego_OCMINE_15_01"); //How could the Old Mine cave in?
//	AI_Output(hero,self,"Info_Diego_OCMINE_15_01"); //Wie konnte die Alte Mine einstürzen?
	AI_Output(hero,self,"Info_Diego_OCMINE_15_01"); //Jak mohl být Starý důl zaplaven?
//	AI_Output(self,hero,"Info_Diego_OCMINE_11_02"); //One of the diggers who survived it told us that they were digging, and they hit an underground river on the bottom level.
//	AI_Output(self,hero,"Info_Diego_OCMINE_11_02"); //Einer der Buddler, der sich retten konnte, erzählte davon, dass sie auf der untersten Minenebene einen unterirdischen Fluß angegraben haben.
	AI_Output(self,hero,"Info_Diego_OCMINE_11_02"); //Jeden z kopáčů, který přežil, nám řekl, že když kopali, narazili na dně na podzemní řeku.
//	AI_Output(self,hero,"Info_Diego_OCMINE_11_03"); //When the water gushed into the mine, one of the supports broke and the entire upper section collapsed.
//	AI_Output(self,hero,"Info_Diego_OCMINE_11_03"); //Als das Wasser in die Mine einbrach, wusch es einige Stützpfeiler weg und der gesamte obere Bereich stürzte ein.
	AI_Output(self,hero,"Info_Diego_OCMINE_11_03"); //Když se voda navalila do dolu, jeden z jeho pilířů se zlomil a celá horní sekce se zhroutila.
//	AI_Output(self,hero,"Info_Diego_OCMINE_11_04"); //Only a handful of people managed to escape from the mine.
//	AI_Output(self,hero,"Info_Diego_OCMINE_11_04"); //Nur eine Hand voll Leute haben es aus der Mine lebend herausgeschafft.
	AI_Output(self,hero,"Info_Diego_OCMINE_11_04"); //Jen hrstce lidí se podařilo z dolu uniknout.
};

//***************************************************************************
// Info OCKDF
//***************************************************************************

instance Info_Diego_OCKDF(C_INFO)
{
	npc = PC_Thief;
	condition = Info_Diego_OCKDF_Condition;
	information = Info_Diego_OCKDF_Info;
	important = 0;
	permanent = 0;
//	description = "Why are the fire mages dead?";
//	description = "Wieso sind die Feuermagier tot?";
	description = "Proč zemřeli mágové Ohně?";
};

func int Info_Diego_OCKDF_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Diego_OCWARN))
	&& (!Npc_KnowsInfo(hero,Info_Diego_OCFM)))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OCKDF_Info()
{
//	AI_Output(hero,self,"Info_Diego_OCKDF_15_01"); //Why are the fire mages dead?
//	AI_Output(hero,self,"Info_Diego_OCKDF_15_01"); //Wieso sind die Feuermagier tot?
	AI_Output(hero,self,"Info_Diego_OCKDF_15_01"); //Proč zemřeli mágové Ohně?
//	AI_Output(self,hero,"Info_Diego_OCKDF_11_02"); //That's a long story.
//	AI_Output(self,hero,"Info_Diego_OCKDF_11_02"); //Das ist eine etwas längere Geschichte.
	AI_Output(self,hero,"Info_Diego_OCKDF_11_02"); //To je dlouhý příběh.
};

//***************************************************************************
// Info OCFM
//***************************************************************************

instance Info_Diego_OCFM(C_INFO)
{
	npc = PC_Thief;
	condition = Info_Diego_OCFM_Condition;
	information = Info_Diego_OCFM_Info;
	important = 0;
	permanent = 0;
//	description = "A raid on the Free Mine?";
//	description = "Ein Überfall auf die Freie Mine?";
	description = "Útok na Svobodný důl?";
};

func int Info_Diego_OCFM_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Diego_OCWARN))
	&& (!Npc_KnowsInfo(hero,Info_Diego_OCKDF)))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OCFM_Info()
{
//	AI_Output(hero,self,"Info_Diego_OCFM_15_01"); //A raid on the Free Mine?
//	AI_Output(hero,self,"Info_Diego_OCFM_15_01"); //Ein Überfall auf die Freie Mine?
	AI_Output(hero,self,"Info_Diego_OCFM_15_01"); //Útok na Svobodný důl?
//	AI_Output(self,hero,"Info_Diego_OCFM_11_02"); //That's a long story.
//	AI_Output(self,hero,"Info_Diego_OCFM_11_02"); //Das ist eine etwas längere Geschichte.
	AI_Output(self,hero,"Info_Diego_OCFM_11_02"); //To je dlouhý příběh.
};

//***************************************************************************
// Info OCSTORY
//***************************************************************************

instance Info_Diego_OCSTORY(C_INFO)
{
	npc = PC_Thief;
	condition = Info_Diego_OCSTORY_Condition;
	information = Info_Diego_OCSTORY_Info;
	important = 0;
	permanent = 0;
//	description = "Just tell me!";
//	description = "Nun erzähl schon!";
	description = "Jen mi o tom řekni! ";
};

func int Info_Diego_OCSTORY_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Diego_OCFM))
	|| (Npc_KnowsInfo(hero,Info_Diego_OCKDF)))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OCSTORY_Info()
{
//	AI_Output(hero,self,"Info_Diego_OCSTORY_15_01"); //Just tell me about it! It's not the first long story I've had to listen to!
//	AI_Output(hero,self,"Info_Diego_OCSTORY_15_01"); //Nun erzähl schon! Es ist nicht die erste längere Geschichte, die ich mir anhören muss!
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_01"); //Jen mi o tom řekni! Nebude to první dlouhý příběh, který vyslechnu!
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_02"); //Well then. Luckily, I was in the Ore Barons' house when they got the news that the mine had collapsed.
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_02"); //Nun gut. Ich hatte das Glück, mich beim Eintreffen der Nachricht vom Einsturz der Mine im Haus der Erzbarone aufzuhalten.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_02"); //Dobrá. Měl jsem štěstí, že jsem zrovna byl v sále Rudobaronů, když jsme dostali zprávu o zatopení dolu.
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_03"); //Gomez was hopping mad when he heard about the accident and he was afraid that his position could be at stake.
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_03"); //Gomez war über das Unglück völlig außer sich und sah dadurch sofort seine Machtposition gefährdet.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_03"); //Gomez byl vzteky bez sebe, když se doslechl o tom neštěstí a začal se bát o své postavení.
//	AI_Output(hero,self,"Info_Diego_OCSTORY_15_04"); //Of course. Who controls the ore controls the colony as well!
//	AI_Output(hero,self,"Info_Diego_OCSTORY_15_04"); //Klar. Wer das Erz kontrolliert, kontrolliert die Kolonie!
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_04"); //Samozřejmě. Kdo řídí obchod s rudou, ovládá Kolonii!
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_05"); //That's right. Since he has no source of income any more, the goods from the outside world won't come in any more, either.
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_05"); //Richtig. Nun, da er von seiner einzigen Einnahmequelle abgeschnitten ist, wird auch der Warenfluß von der Außenwelt bald stoppen.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_05"); //To je pravda. Teď, když přišel o jediný zdroj příjmů, nebude mít za co nakupovat zboží z vnějšího světa.
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_06"); //Nobody will work for him if he doesn't get another source of income soon.
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_06"); //Niemand wird mehr für ihn arbeiten wollen, wenn nicht bald eine andere Einnahmequelle aufgetrieben wird.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_06"); //Nikdo už pro něj nebude pracovat, pokud brzy nenajde jiný zdroj příjmů.
//	AI_Output(hero,self,"Info_Diego_OCSTORY_15_07"); //And that's the reason for the raid on the Free Mine?
//	AI_Output(hero,self,"Info_Diego_OCSTORY_15_07"); //Und deshalb ein Überfall auf die Freie Mine?
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_07"); //A to je ten důvod útoku na Svobodný důl?
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_08"); //To be honest, that's Gomez' only chance to maintain his power.
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_08"); //Das ist - neutral betrachtet - die einzige Chance, die Gomez hat, seine Macht zu erhalten.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_08"); //Popravdě řečeno - je to jediná šance, jak si může Gomez zachovat svou moc.
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_09"); //Two hours ago two dozen guards set out for the Free Mine.
//	AI_Output(self,hero,"Info_Diego_OCSTORY_11_09"); //Vor einigen Stunden sind zwei Dutzend Gardisten in Richtung Freie Mine aufgebrochen.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_09"); //Před dvěma hodinami obsadily dva tucty strážců Svobodný důl.

	B_Story_FMTaken();
};

//***************************************************************************
// Info OCWARNNC
//***************************************************************************

instance Info_Diego_OCWARNNC(C_INFO)
{
	npc = PC_Thief;
	condition = Info_Diego_OCWARNNC_Condition;
	information = Info_Diego_OCWARNNC_Info;
	important = 0;
	permanent = 0;
//	description = "That's mad! I need to warn the New Camp.";
//	description = "Das ist Wahnsinn! Ich muss das Neue Lager warnen.";
	description = "To je šílené! Musím varovat Nový tábor.";
};

func int Info_Diego_OCWARNNC_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OCWARNNC_Info()
{
//	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_01"); //That's mad! I need to warn the New Camp.
//	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_01"); //Das ist Wahnsinn! Ich muss das Neue Lager warnen.
	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_01"); //To je šílené! Musím varovat Nový tábor.
//	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_02"); //Then you must hurry up! They'll have almost reached the Free Mine.
//	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_02"); //Dann solltest du dich beeilen, denn sie dürften die Freie Mine schon fast erreicht haben.
	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_02"); //Pak si musíš pospíšit! Už určitě skoro dorazili ke Svobodnému dolu!
//	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_03"); //But they never get through the fortifications of the New Camp.
//	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_03"); //Aber sie würden niemals an den Befestigungen des Neuen Lagers vorbeikommen.
	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_03"); //Nikdy se ale nedostanou přes opevnění Nového tábora.
//	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_04"); //They don't need to get through them. A few months ago, they found a path that leads over the mountains and right to the Free Mine - and nobody else knows about it.
//	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_04"); //Das ist nicht nötig. Schon vor einigen Monaten haben sie einen Weg über die Berge zur Freien Mine gefunden, den niemand sonst kennt.
	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_04"); //Nepotřebují se přes něj dostat. Před pár měsíci našli cestu přes hory přímo ke Svobodnému dolu, který dosud nikdo jiný neznal.
};

//***************************************************************************
// Info OCGUARDS
//***************************************************************************

instance Info_Diego_OCGUARDS(C_INFO)
{
	npc = PC_Thief;
	condition = Info_Diego_OCGUARDS_Condition;
	information = Info_Diego_OCGUARDS_Info;
	important = 0;
	permanent = 0;
//	description = "I've seen the guards in front of the locked gates.";
//	description = "Ich habe Gardisten vor den verschlossenen Toren gesehen.";
	description = "Viděl jsem stráže před zamčenou bránou.";
};

func int Info_Diego_OCGUARDS_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OCGUARDS_Info()
{
//	AI_Output(hero,self,"Info_Diego_OCGUARDS_15_01"); //I've seen the guards in front of the locked gates.
//	AI_Output(hero,self,"Info_Diego_OCGUARDS_15_01"); //Ich habe Gardisten vor den verschlossenen Toren gesehen.
	AI_Output(hero,self,"Info_Diego_OCGUARDS_15_01"); //Viděl jsem stráže před zamčenou bránou.
//	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_02"); //Stay away from them. They'll attack anybody approaching the Camp.
//	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_02"); //Halt dich bloß von ihnen fern. Sie greifen jeden an, der sich dem Lager nähert.
	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_02"); //Drž se odtamtud dál. Napadnou každého, kdo se k táboru přiblíží.
//	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_03"); //They are afraid of somebody avenging the raid on the Free Mine.
//	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_03"); //Sie haben wohl Angst vor den Vergeltungsmaßnahmen nach dem Überfall auf die Freie Mine.
	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_03"); //Mají strach, že se jim někdo pomstí za útok na Svobodný důl.
};

//***************************************************************************
// Info OCMURDER
//***************************************************************************
instance Info_Diego_OCMURDER(C_INFO)
{
	npc = PC_Thief;
	condition = Info_Diego_OCMURDER_Condition;
	information = Info_Diego_OCMURDER_Info;
	important = 0;
	permanent = 0;
//	description = "But what happened to the fire mages?";
//	description = "Aber was passierte mit den Feuermagiern?";
	description = "Co se ale stalo mágům Ohně?";
};

func int Info_Diego_OCMURDER_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OCMURDER_Info()
{
//	AI_Output(hero,self,"Info_Diego_OCMURDER_15_01"); //But what happened to the fire mages?
//	AI_Output(hero,self,"Info_Diego_OCMURDER_15_01"); //Aber was passierte mit den Feuermagiern?
	AI_Output(hero,self,"Info_Diego_OCMURDER_15_01"); //Co se ale stalo mágům Ohně?
//	AI_Output(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo and the other mages were the only people in the Camp to remain rational.
//	AI_Output(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo und die anderen Magier waren die einzigen im Lager, die vernünftig blieben.
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo a ostatní mágové byli jediní lidé v táboře, kteří zůstali při smyslech.
//	AI_Output(self,hero,"Info_Diego_OCMURDER_11_03"); //They forbad the raid and demanded a settlement with the two other camps
//	AI_Output(self,hero,"Info_Diego_OCMURDER_11_03"); //Sie verboten den Überfall und forderten eine Einigung mit den beiden anderen Lagern.
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_03"); //Zakázali útok a požadovali vyrovnání mezi oběma tábory.
//	AI_Output(hero,self,"Info_Diego_OCMURDER_15_04"); //They FORBADE Gomez to raid the Free Mine?
//	AI_Output(hero,self,"Info_Diego_OCMURDER_15_04"); //Sie VERBOTEN Gomez den Überfall auf die Freie Mine?
	AI_Output(hero,self,"Info_Diego_OCMURDER_15_04"); //Oni ZAKÁZALI Gomezovi zaútočit na Svobodný důl?
//	AI_Output(self,hero,"Info_Diego_OCMURDER_11_05"); //Well, yes, Corristo and the others shouldn't have been so self-confident. Gomez didn't trust them any more and had them perfidiously assassinated.
//	AI_Output(self,hero,"Info_Diego_OCMURDER_11_05"); //Tja, Corristo und die anderen hätten wohl weniger forsch auftreten sollen. Gomez verlor das Vertrauen zu ihnen und ließ sie hinterrücks niederstrecken.
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_05"); //Přesně tak. Corristo a ostatní si neměli být tak sebejistí. Gomez jim přestal důvěřovat, a nechal je sprostě zavraždit.
};

//***************************************************************************
// Info OCRETREAT
//***************************************************************************
instance Info_Diego_OCRETREAT(C_INFO)
{
	npc = PC_Thief;
	condition = Info_Diego_OCRETREAT_Condition;
	information = Info_Diego_OCRETREAT_Info;
	important = 0;
	permanent = 0;
//	description = "What are you and Milten going to do now?";
//	description = "Was wollen Milten und du nun machen?";
	description = "Co teď budete s Miltenem dělat?";
};

func int Info_Diego_OCRETREAT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_OCMURDER))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OCRETREAT_Info()
{
//	AI_Output(hero,self,"Info_Diego_OCRETREAT_15_01"); //What are you and Milten going to do now?
//	AI_Output(hero,self,"Info_Diego_OCRETREAT_15_01"); //Was wollen Milten und du nun machen?
	AI_Output(hero,self,"Info_Diego_OCRETREAT_15_01"); //Co teď budete s Miltenem dělat?
//	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_02"); //We'll stay here for a while to warn some more friends so they don't bump straight into the guards.
//	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_02"); //Wir werden hier noch eine Weile ausharren und andere Freunde warnen, bevor sie den fanatischen Gardisten in die Hände laufen.
	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_02"); //Nějaký čas tady zůstaneme a budeme varovat další přátele, aby nevběhli přímo do náručí strážím.
//	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_03"); //But you could do us a favor.
//	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_03"); //Aber du könntest uns noch einen Gefallen tun.
	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_03"); //Mohl bys nám ale prokázat laskavost.
};

//***************************************************************************
// Info OCFAVOR
//***************************************************************************
instance Info_Diego_OCFAVOR(C_INFO)
{
	npc = PC_Thief;
	condition = Info_Diego_OCFAVOR_Condition;
	information = Info_Diego_OCFAVOR_Info;
	important = 0;
	permanent = 0;
//	description = "Consider it done. Tell me what you want!";
//	description = "Ist schon so gut wie erledigt. Sprich!";
	description = "Považuj ji za splněnou. Řekni, co potřebuješ!";
};

func int Info_Diego_OCFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
		return 1;
	};

	return 0;
};

func void Info_Diego_OCFAVOR_Info()
{
//	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_01"); //Consider it done. Tell me what you want!
//	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_01"); //Ist schon so gut wie erledigt. Sprich!
	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_01"); //Považuj ji za splněnou. Řekni, co potřebuješ!
//	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_02"); //Look out for Lester and Gorn. They need to know what happened here.
//	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_02"); //Suche Lester und Gorn. Sie müssen wissen, was hier passiert ist.
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_02"); //Zajdi za Lesterem a Gornem. Musí se dozvědět, co se tu stalo.
//	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_03"); //Tell them that the four of us will meet at the same place as always.
//	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_03"); //Richte ihnen aus, dass wir vier uns wie immer am verabredeten Platz treffen.
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_03"); //Řekni jim, že se všichni čtyři sejdeme na obvyklém místě.
//	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_04"); //If I see them before you do, I'll warn them and send them to your meeting point.
//	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_04"); //Wenn ich sie vor euch treffe, werde ich sie warnen und zu eurem Treffpunkt schicken.
	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_04"); //Jestli je uvidím dřív než vy, budu je varovat a pošlu je na to místo.
//	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_05"); //Thanks, my friend. You really seem to be an alright guy. Go now, we'll meet again later.
//	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_05"); //Danke, mein Freund. Du scheinst wirklich in Ordnung zu sein. Geh nun, wir sehen uns später.
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_05"); //Díky, příteli. Jsi opravdu správnej chlap. Teď běž, sejdeme se později.

	Log_CreateTopic(CH4_4Friends,LOG_MISSION);
	Log_SetTopicStatus(CH4_4Friends,LOG_RUNNING);
//	B_LogEntry(CH4_4Friends, "All Fire Mages are dead an the situation is getting out of control. Diego wanted me to tell Lester and Gorn about a meeting with him and Milten in a secret place. They don't seem to be doing this the first time!");
//	B_LogEntry(CH4_4Friends, "Alle Feuermagier sind tot und die Situation spitzt sich zu. Diego hat mich beauftragt Lester und Gorn davon zu unterrichten, daß er sich mit Ihnen und Milten an einem geheimen Ort treffen will. Das scheinen sie nicht zum ersten gemacht zu haben.");
	B_LogEntry(CH4_4Friends, "Všichni mágové Ohně jsou mrtví a situace se vymkla z rukou. Diego chtěl, abych se s Lesterem a Gornem domluvil na nějakém bezpečném místě setkání s ním a Miltenem. Zdá se, že to nedělají poprvé!");
};

/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?

	Info_ClearChoices(Info_Diego_Gamestart);
	Info_AddChoice(Info_Diego_Gamestart, "Gewitzter Überfall            (+3 Geschicklichkeit)" ,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice(Info_Diego_Gamestart, "Schlägerei mit Folgen         (+3 Stärke)" ,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice(Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)" ,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice(Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)" ,Info_Diego_Gamestart_Choice_All);
};

// -------------------------------------------- CHOICES ----------------------------------------------------

func void Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung für mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart);
};

func void Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des Königs Gardisten. dummerweise hat der König viele Gardisten.
//	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.
	PrintScreen("Stärke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart);
};

func void Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich saß in der Kneipe und habe meine Meinung über König, Krieg und Steuern gesagt.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu spät daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart);
};

func void Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig.
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du Männer die so ziemlich jedes mögliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander.
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst.
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist.
	PrintScreen("Stärke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] +1;
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] +1;
	hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX] +1;
	Info_ClearChoices(Info_Diego_Gamestart);
*/
