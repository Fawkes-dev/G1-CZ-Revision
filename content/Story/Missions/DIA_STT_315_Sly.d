// **************************************************
// 						 EXIT
// **************************************************

instance DIA_STT_315_Sly_Exit(C_INFO)
{
	npc = STT_315_Sly;
	nr = 999;
	condition = DIA_STT_315_Sly_Exit_Condition;
	information = DIA_STT_315_Sly_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_STT_315_Sly_Exit_Condition()
{
	return 1;
};

func void DIA_STT_315_Sly_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 					Erste Begrüssung
// **************************************************

instance DIA_STT_315_Sly(C_INFO)
{
	npc = STT_315_Sly;
	nr = 1;
	condition = DIA_STT_315_Sly_Condition;
	information = DIA_STT_315_Sly_Info;
	important = 1;
	permanent = 0;
};

func int DIA_STT_315_Sly_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_Info()
{
	AI_SetWalkmode(self,NPC_WALK);
	AI_GotoNpc(self,other);
//	AI_Output(self,other,"DIA_STT_315_Sly_10_01"); //New here, are you? I don't know your face.
//	AI_Output(self,other,"DIA_STT_315_Sly_10_01"); //Neu hier, was? Dein Gesicht kenne ich nicht.
	AI_Output(self,other,"DIA_STT_315_Sly_10_01"); //Jsi tady nový, že? Ještě jsem tě tu neviděl.
//	AI_Output(self,other,"DIA_STT_315_Sly_10_02"); //I'm Sly. I have a job on offer for a newcomer.
//	AI_Output(self,other,"DIA_STT_315_Sly_10_02"); //Ich bin Sly. Ich hätte was zu tun für einen Neuen.
	AI_Output(self,other,"DIA_STT_315_Sly_10_02"); //Jsem Sly. Měl bych něco na práci, pro nováčka.
};

// **************************************************
// 					Erste Begrüssung
// **************************************************
	var int Sly_LostNek;
// **************************************************

instance DIA_STT_315_LostNek(C_INFO)
{
	npc = STT_315_Sly;
	nr = 1;
	condition = DIA_STT_315_LostNek_Condition;
	information = DIA_STT_315_LostNek_Info;
	important = 0;
	permanent = 0;
//	description = "You have a job for me? What is it?";
//	description = "Du hast was zu tun für mich? Um was geht's?";
	description = "Máš pro mě práci? O co jde?";
};

func int DIA_STT_315_LostNek_Condition()
{
	//TODO: this dialogue should be available only after DIA_STT_315_Sly was told
	return 1;
};

func void DIA_STT_315_LostNek_Info()
{
//	AI_Output(other,self,"DIA_STT_315_LostNek_15_00"); //You have a job for me? What is it?
//	AI_Output(other,self,"DIA_STT_315_LostNek_15_00"); //Du hast was zu tun für mich? Um was geht's?
	AI_Output(other,self,"DIA_STT_315_LostNek_15_00"); //Máš pro mě práci? O co jde?
//	AI_Output(self,other,"DIA_STT_315_LostNek_10_01"); //One of our guards has disappeared! He's called Nek. He might have gone over to the New Camp.
//	AI_Output(self,other,"DIA_STT_315_LostNek_10_01"); //Einer unserer Gardisten ist verschwunden! Er heißt Nek. Er könnte ins Neue Lager übergelaufen sein.
	AI_Output(self,other,"DIA_STT_315_LostNek_10_01"); //Jeden z našich strážců zmizel! Jmenuje se Nek. Možná odešel do Nového tábora.
//	AI_Output(self,other,"DIA_STT_315_LostNek_10_02"); //You're new here and you'll get around quite a lot. So keep your eyes peeled.
//	AI_Output(self,other,"DIA_STT_315_LostNek_10_02"); //Du bist neu hier und kommst viel rum. Also halt die Augen offen.
	AI_Output(self,other,"DIA_STT_315_LostNek_10_02"); //Jsi tady nový a hodně se tu potuluješ. Takže měj oči na stopkách.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
//	AI_Output(self,other,"DIA_STT_315_LostNek_10_03"); //If you find him, I'll speak up for you in the Camp.
//	AI_Output(self,other,"DIA_STT_315_LostNek_10_03"); //Wenn du ihn findest, leg' ich ein gutes Wort für dich hier im Lager ein.
	AI_Output(self,other,"DIA_STT_315_LostNek_10_03"); //Až ho najdeš, přimluvím se za tebe v táboře.
	};
	Info_ClearChoices(DIA_STT_315_LostNek);
//	Info_AddChoice(DIA_STT_315_LostNek,"I'll see if I can find him.",DIA_STT_315_LostNek_DoIt);
//	Info_AddChoice(DIA_STT_315_LostNek,"Ich werd sehen, ob ich ihn finde.",DIA_STT_315_LostNek_DoIt);
	Info_AddChoice(DIA_STT_315_LostNek,"Uvidím, jestli ho dokážu najít.",DIA_STT_315_LostNek_DoIt);

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
//		Info_AddChoice(DIA_STT_315_LostNek,"What good will your speaking up for me do?",DIA_STT_315_LostNek_Why);
//		Info_AddChoice(DIA_STT_315_LostNek,"Was kann ein gutes Wort von dir denn bewirken?",DIA_STT_315_LostNek_Why);
		Info_AddChoice(DIA_STT_315_LostNek,"K čemu mi bude, že se za mě přimluvíš?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
//	AI_Output(other,self,"DIA_STT_315_LostNek_Why_15_00"); //What good will your speaking up for me do?
//	AI_Output(other,self,"DIA_STT_315_LostNek_Why_15_00"); //Was kann ein gutes Wort von dir bewirken?
	AI_Output(other,self,"DIA_STT_315_LostNek_Why_15_00"); //K čemu mi bude, že se za mě přimluvíš?
//	AI_Output(self,other,"DIA_STT_315_LostNek_Why_10_01"); //If you wannna join the Camp, you need people to speak up for you.
//	AI_Output(self,other,"DIA_STT_315_LostNek_Why_10_01"); //Wenn du hier im Lager aufgenommen werden willst, brauchst du Leute, die für dich sprechen.
	AI_Output(self,other,"DIA_STT_315_LostNek_Why_10_01"); //Jestli se chceš přidat do tábora, budeš potřebovat lidi, kteří se za tebe přimluví.
//	AI_Output(self,other,"DIA_STT_315_LostNek_Why_10_02"); //If I speak up for you with Diego, that'd be a great help for you.
//	AI_Output(self,other,"DIA_STT_315_LostNek_Why_10_02"); //Ein gutes Wort von mir über dich bei Diego kann da schon einiges helfen.
	AI_Output(self,other,"DIA_STT_315_LostNek_Why_10_02"); //Když se za tebe u Diega přimluvím, velice ti to pomůže.
};

func void DIA_STT_315_LostNek_DoIt()
{
//	AI_Output(other,self,"DIA_STT_315_LostNek_DoIt_15_00"); //I'll see if I can find him.
//	AI_Output(other,self,"DIA_STT_315_LostNek_DoIt_15_00"); //Ich werd sehen, ob ich ihn finde.
	AI_Output(other,self,"DIA_STT_315_LostNek_DoIt_15_00"); //Uvidím, jestli ho dokážu najít.
//	AI_Output(self,other,"DIA_STT_315_LostNek_DoIt_10_01"); //If you meet Fletcher, ask him about Nek. He's taken over his distric' since Nek disappeared.
//	AI_Output(self,other,"DIA_STT_315_LostNek_DoIt_10_01"); //Wenn du Fletcher triffst, frag ihn über Nek. Er hat sein Viertel übernommen, seit Nek verschwunden ist.
	AI_Output(self,other,"DIA_STT_315_LostNek_DoIt_10_01"); //Až potkáš Fletchera, zeptej se ho na Neka. Dohlíží na jeho obvod od doby, co zmizel.
//	AI_Output(other,self,"DIA_STT_315_LostNek_DoIt_15_02"); //Where will I find him?
//	AI_Output(other,self,"DIA_STT_315_LostNek_DoIt_15_02"); //Wo finde ich ihn?
	AI_Output(other,self,"DIA_STT_315_LostNek_DoIt_15_02"); //Kde ho najdu?
//	AI_Output(self,other,"DIA_STT_315_LostNek_DoIt_10_03"); //His district is the district of the arena.
//	AI_Output(self,other,"DIA_STT_315_LostNek_DoIt_10_03"); //Sein Viertel ist das Arenaviertel.
	AI_Output(self,other,"DIA_STT_315_LostNek_DoIt_10_03"); //Jeho obvod je kolem arény.
	Sly_LostNek = LOG_RUNNING;

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_LostNek,LOG_MISSION);
		Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
//		B_LogEntry(CH1_LostNek,"Sly, the Shadow, has promised to speak to Diego for me if I find Nek. The guard might have joined the New Camp. I should ask Fletcher from the arena district about Nek.");
//		B_LogEntry(CH1_LostNek,"Der Schatten Sly hat mir versprochen, ein gutes Wort bei Diego für mich einzulegen, wenn ich Nek finde. Der Gardist könnte zum Neuen Lager übergelaufen sein. Fletcher aus dem Arenaviertel sollte ich nach Nek fragen.");
		B_LogEntry(CH1_LostNek,"Sly, jeden ze Stínů, slíbil, že jestli najdu Neka, tak se za mě přimluví u Diega. Tento strážce mohl přeběhnout k Novému táboru. Zeptám se na Neka Fletchera z obvodu kolem arény.");
	}
	else
	{
		Log_CreateTopic(CH1_LostNek,LOG_MISSION);
		Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
//		B_LogEntry(CH1_LostNek,"Sly, the Shadow, has asked me to find the vanished guard Nek. The guard might have joined the New Camp. I should ask Fletcher from the arena district about Nek.");
//		B_LogEntry(CH1_LostNek,"Der Schatten Sly hat mich beauftragt, den verschwundenen Gardisten Nek zu finden.Der Gardist könnte zum Neuen Lager übergelaufen sein. Fletcher aus dem Arenaviertel sollte ich nach Nek fragen.");
		B_LogEntry(CH1_LostNek,"Sly, jeden ze Stínů, slíbil, že jestli najdu Neka, tak se za mě přimluví u Diega. Tento strážce mohl přeběhnout k Novému táboru. Zeptám se na Neka Fletchera z obvodu kolem arény.");
	};
	Info_ClearChoices(DIA_STT_315_LostNek);
	AI_StopProcessInfos(self);
};

// **************************************************
// 						SUCCESS
// **************************************************

instance DIA_STT_315_LostNekSuccess(C_INFO)
{
	npc = STT_315_Sly;
	nr = 1;
	condition = DIA_STT_315_LostNekSuccess_Condition;
	information = DIA_STT_315_LostNekSuccess_Info;
	important = 0;
	permanent = 1;
//	description = "I've found Nek.";
//	description = "Ich hab' Nek gefunden.";
	description = "Našel jsem Neka.";
};

func int DIA_STT_315_LostNekSuccess_Condition()
{
	if ((Sly_LostNek == LOG_RUNNING) && (Npc_HasItems(other,Neks_Amulett) > 0))
	{
		return 1;
	};
};

func void DIA_STT_315_LostNekSuccess_Info()
{
//	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_15_00"); //I've found Nek.
//	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_15_00"); //Ich hab' Nek gefunden.
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_15_00"); //Našel jsem Neka.
//	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_10_01"); //Good! Have you got any evidence for that?
//	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_10_01"); //Gut! Hast du dafür Beweise?
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_10_01"); //Dobře! Máš pro to nějaké důkazy?

	Info_ClearChoices(DIA_STT_315_LostNekSuccess);
//	Info_AddChoice(DIA_STT_315_LostNekSuccess,"No - I'm afraid not.",DIA_STT_315_LostNekSuccess_NoProof);
//	Info_AddChoice(DIA_STT_315_LostNekSuccess,"Nein - ich befürchte nicht.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice(DIA_STT_315_LostNekSuccess,"Obávám se, že ne.",DIA_STT_315_LostNekSuccess_NoProof);
//	Info_AddChoice(DIA_STT_315_LostNekSuccess,"I've found this amulet on him - here you go.",DIA_STT_315_LostNekSuccess_Proof);
//	Info_AddChoice(DIA_STT_315_LostNekSuccess,"Ich hab' ein Amulett bei ihm gefunden - hier.",DIA_STT_315_LostNekSuccess_Proof);
	Info_AddChoice(DIA_STT_315_LostNekSuccess,"Našel jsem u něj amulet - tady.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
//	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //I've found this amulet on him - here you go.
//	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Ich hab' ein Amulett bei ihm gefunden - hier.
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Našel jsem u něj amulet - tady.
//	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //It was actually the amulet the whole thing was about. You're a clever guy.
//	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //Genau um dieses Amulett ging es mir. Du bist ein schlauer Junge.
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //Právě o tento amulet mi šlo. Jsi šikovný chlapík.
//	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //You might have had the idea to keep the amulet yourself,but you've made the right decision.
//	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Du hättest auf die Idee kommen können, das Amulett zu behalten, aber du hast die richtige Entscheidung getroffen.
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Možná sis mohl pomyslet, že by sis ten amulet nechal, ale rozhodl ses správně.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
//		AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //If Diego asks me about you, I'll vote in your favor.
//		AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Wenn Diego mich nach dir fragt, werd' ich dir meine Stimme geben.
		AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Jestli se mě Diego na tebe zeptá, dám ti svůj hlas.
	};
	Sly_LostNek = LOG_SUCCESS;

	B_GiveInvItems(other,self,Neks_Amulett,1);

	Log_SetTopicStatus(CH1_LostNek,LOG_SUCCESS);
//	B_LogEntry(CH1_LostNek,"I've given Nek's amulet to Sly. He was amazed at my honesty.");
//	B_LogEntry(CH1_LostNek,"Ich habe Sly das Amulett von Nek gegeben. Er war überrascht von meiner Ehrlichkeit.");
	B_LogEntry(CH1_LostNek,"Dal jsem Slyovi Nekův amulet. Byl překvapen mojí poctivostí.");

	B_GiveXP(XP_Slysearchfornek);
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinOC,LOG_RUNNING);
//		B_LogEntry(CH1_JoinOC,"I've given Sly Nek's amulet. He'll talk to Diego and speak in my favor.");
//		B_LogEntry(CH1_JoinOC,"Ich habe Sly das Amulett von Nek gegeben. Er wird mit Diego sprechen und ein gutes Wort für mich einlegen.");
		B_LogEntry(CH1_JoinOC,"Dal jsem Slyovi Nekův amulet. Promluví si z Diegem a přimluví se za mě.");
	}
	else
	{
		Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinOC,LOG_FAILED);
//		B_LogEntry(CH1_JoinOC,"I've given Sly Nek's amulet. Not that it's going to do me any good - the Old Camp won't let me join any more anyway.");
//		B_LogEntry(CH1_JoinOC,"Ich habe Sly das Amulett von Nek gegeben, allerdings bringt mir das Nichts, denn im Alten Lager werde ich nicht mehr aufgenommen.");
		B_LogEntry(CH1_JoinOC,"Dal jsem Slyovi Nekův amulet. Bohužel však z toho nic mít nebudu. Ke Starému táboru se už nemohu přidat.");
	};
	Info_ClearChoices(DIA_STT_315_LostNekSuccess);
	AI_StopProcessInfos(self);
};

func void DIA_STT_315_LostNekSuccess_NoProof()
{
//	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //No - I'm afraid not.
//	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Nein - ich befürchte nicht.
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Obávám se, že ne.
//	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Oh? You're not hiding anything from me, are you? Nek had an amulet on him.
//	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //So? Du willst mir doch nicht etwas vorenthalten? Nek hat ein Schutzamulett bei sich.
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Och? Přede mnou nic neschováš, jasný? Nek měl u sebe amulet ochrany.
//	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //I don't like people keeping things from me that are mine. If you find the amulet, bring it to me!
//	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Ich mag nicht, wenn man mir etwas vorenthält, was mir gehört. Solltest du das Amulett finden, bring es mir!
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Nemám rád lidi, kteří mi berou, co mi patří. Kdybys ten amulet našel, přines mi ho!
//	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //I'll think of you when I hold the amulet in my hand.
//	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Ich werd an dich denken, wenn ich das Amulett in der Hand halte.
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Budu na tebe myslet, až budu mít ten amulet v ruce.

//	B_LogEntry(CH1_LostNek,"Sly wants to have an amulet of Nek's.");
//	B_LogEntry(CH1_LostNek,"Sly will ein Amulett von Nek haben.");
	B_LogEntry(CH1_LostNek,"Sly chce Nekův amulet.");

	Info_ClearChoices(DIA_STT_315_LostNekSuccess);
	AI_StopProcessInfos(self);
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************

instance DIA_STT_315_Sly_AfterSuccess(C_INFO)
{
	npc = STT_315_Sly;
	nr = 1;
	condition = DIA_STT_315_Sly_AfterSuccess_Condition;
	information = DIA_STT_315_Sly_AfterSuccess_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie läuft's denn so?";
	description = "Jak to jde?";
};

func int DIA_STT_315_Sly_AfterSuccess_Condition()
{
	if ((Kapitel == 1) && (Sly_LostNek == LOG_SUCCESS))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_AfterSuccess_Info()
{
//	AI_Output(other,self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //How's it going?
//	AI_Output(other,self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //Wie läuft's denn so?
	AI_Output(other,self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //Jak to jde?
//	AI_Output(self,other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Good! With me you don't need to worry about Diego any more!
//	AI_Output(self,other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Gut! Bei mir brauchst du dir wegen Diego keine Sorgen mehr zu machen!
	AI_Output(self,other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Dobře! Se mnou si už nemusíš dělat s Diegem žádné starosti.
//	AI_Output(other,self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //You scratch my back, I'll scratch yours, eh?
//	AI_Output(other,self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Eine Hand wäscht die andere, denke ich.
	AI_Output(other,self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Ruka ruku myje, co?
//	AI_Output(self,other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //That's the way it is.
//	AI_Output(self,other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //So ist es.
	AI_Output(self,other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //Tak to je.
};
