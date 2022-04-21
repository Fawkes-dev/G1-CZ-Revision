// **************************************************
// 					Pre - EXIT
// **************************************************

instance DIA_BaalTondral_MuteExit(C_INFO)
{
	npc = Gur_1203_BaalTondral;
	nr = 999;
	condition = DIA_BaalTondral_MuteExit_Condition;
	information = DIA_BaalTondral_MuteExit_Info;
	permanent = 0;
	description = "(Nic neříkat)";
};

func int DIA_BaalTondral_MuteExit_Condition()
{
	if (!Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

func void DIA_BaalTondral_MuteExit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 EXIT
// **************************************************

instance DIA_BaalTondral_Exit(C_INFO)
{
	npc = Gur_1203_BaalTondral;
	nr = 999;
	condition = DIA_BaalTondral_Exit_Condition;
	information = DIA_BaalTondral_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_BaalTondral_Exit_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_MuteExit) || Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

func void DIA_BaalTondral_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 					Fanatic Teacher
// **************************************************

instance DIA_BaalTondral_FanaticTeacher(C_INFO)
{
	npc = Gur_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_FanaticTeacher_Condition;
	information = DIA_BaalTondral_FanaticTeacher_Info;
	permanent = 0;
	important = 1;
};

func int DIA_BaalTondral_FanaticTeacher_Condition()
{
	return 1;
};

func void DIA_BaalTondral_FanaticTeacher_Info()
{
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_00"); //You don't look like one who's submitted to slavery under the Ore Barons.
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Du siehst nicht aus wie einer, der sein Leben bereits unter die Knechtschaft der Erzbarone gestellt hat.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Nevypadáš na někoho, kdo se podrobil otroctví Rudobaronů.
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_01"); //You look more like a seeker - someone who's searching for the true faith. D'you not feel a fire inside your body which keeps you from sleeping at night?
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Du siehst aus wie ein Suchender. Du siehst aus wie einer, der den wahren Glauben sucht. Spürst du nicht das Feuer in dir, das dir nachts den Schlaf raubt?
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Vypadáš spíše jako někdo, kdo hledá pravou víru. Necítíš ve svém těle oheň, který ti v noci nedá spát?
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_02"); //I see, you doubt that what the Ore Barons' slaves try to tell you is really true and just. You know why you doubt them, too. They're lying!
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Ich sehe, dass du an dem zweifelst, was dir die Knechte der Erzbarone als wahr und gerecht verkaufen wollen. Du weißt auch warum. Weil es Lügen sind!
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Vidím, že pochybuješ, zda to, co se ti poskoci Rudobaronů pokoušejí říci, je pravdivé a odůvodněné. Také víš, proč o tom pochybuješ. Protože lžou!
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_03"); //With those lies they try to control weak spirits. But your spirit is stronger than their lies!
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Es sind Lügen, mit denen sie den Geist derer beherrschen, die schwach sind. Dein Glaube ist stärker als ihre Lügen!
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Jsou to lži, kterými ovládají slabé duše. Tvoje duše je ale silnější než jejich lži!
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Don't you feel a longing for freedom every single day? Don't you feel it growing stronger? It guides your spirit. Let it happen!
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Fühlst du nicht jeden Tag den Wunsch nach Freiheit? Fühlst du wie er jeden Tag wächst? Er lenkt deinen Geist. Lass es geschehen!
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Nepociťuješ každodenně touhu po svobodě? Cítíš, jak každým dnem roste? Vede tvou duši. Nech ji působit!
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Do you know what you're doing when you try to suppress it? You're denying your soul, denying yourself! Don't let your fears dominate your life.
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Weißt du, was du tust, wenn du ihn beherrscht? Du verleugnest deine Seele. Du verleugnest dich selbst! Hör auf, im Schatten deiner Ängste zu leben.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Víš, co děláš, když se ji snažíš zapudit? Popíráš svojí duši, popíráš sebe sama! Nedopusť, abys žil ve strachu!
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Free yourself. You need to understand! The Sleeper WILL awaken. He will set you free and wash away all these disbelieving infidels.
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Mach dich frei. Verstehe! Der Schläfer WIRD erwachen, er wird dir die Freiheit bringen, und das ganze ungläubige Pack wegschwemmen.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Osvoboď se. Pochop! Spáč PROCITNE, přinese ti svobodu a všechny bezvěrce smete.
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Like dross that is washed away by the rain, they will vanish from this world. They will moan, whine and repent, but it will be too late.
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Wie Unrat, der vom Regen weggespült wird, werden sie vom Antlitz dieser Welt verschwinden und sie werden klagen und jammern und bereuen, aber dann ist es zu spät.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Jako smetí, které spláchne déšť, zmizí z tohoto světa. Budou bědovat, naříkat a kát se, ale bude už příliš pozdě.
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Then they will pay the price. They will pay with their blood. And with their lives.
//	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Dann werden sie zahlen. Mit ihrem Blut. Und ihrem Leben.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Pak zaplatí svůj dluh. Zaplatí vlastní krví. A svými životy.
};

// **************************************************
// 				Du hast mich angesprochen
// **************************************************

instance DIA_BaalTondral_YouTalked(C_INFO)
{
	npc = Gur_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_YouTalked_Condition;
	information = DIA_BaalTondral_YouTalked_Info;
	permanent = 0;
//	description = "Hey! You've spoken to me. Does that mean I may talk to you now?";
//	description = "Hey! Du hast mich angesprochen. Heißt das, ich kann jetzt mit dir reden?";
	description = "Hej! Teď jsi mě oslovil. Znamená to, že teď s tebou smím mluvit?";
};

func int DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

func void DIA_BaalTondral_YouTalked_Info()
{
//	AI_Output(other,self,"DIA_BaalTondral_YouTalked_15_00"); //Hey! You've spoken to me. Does that mean I may talk to you now?
//	AI_Output(other,self,"DIA_BaalTondral_YouTalked_15_00"); //Hey! Du hast mich angesprochen. Heißt das, ich kann jetzt mit dir reden?
	AI_Output(other,self,"DIA_BaalTondral_YouTalked_15_00"); //Hej! Teď jsi mě oslovil. Znamená to, že teď s tebou smím mluvit?
//	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_01"); //I see you've become familiar with our rules. That's good.
//	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_01"); //Ich sehe, du hast dich mit unseren Regeln vertraut gemacht. Das ist gut.
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_01"); //Vidím, že ses již sžil s naším řádem. To je dobře.
//	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_02"); //I can feel your great spiritual strength! Soon you'll be allowed to join our community.
//	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_02"); //Ich spüre große geistige Kraft in dir! Du kannst schon bald ein Mitglied unserer Gemeinschaft sein.
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_02"); //Cítím tvou velkou duchovní sílu! Brzy se budeš moci připojit k naší komunitě.
//	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_03"); //I have spoken to you because I wanted to give you a chance to prove your loyalty.
//	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_03"); //Ich habe dich angesprochen weil ich dir Gelegenheit geben will, uns deine Loyalität zu beweisen.
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_03"); //Oslovil jsem tě, protože ti chci dát příležitost, abys dokázal svou oddanost.
};

// **************************************************
// 				Loyalität beweisen
// **************************************************
	var int BaalTondral_GetNewGuy;
// **************************************************

instance DIA_BaalTondral_Loyality(C_INFO)
{
	npc = Gur_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_Loyality_Condition;
	information = DIA_BaalTondral_Loyality_Info;
	permanent = 0;
//	description = "How can I prove my loyalty?";
//	description = "Wie kann ich dir meine Loyalität beweisen?";
	description = "Jak můžu dokázat svou oddanost?";
};

func int DIA_BaalTondral_Loyality_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

func void DIA_BaalTondral_Loyality_Info()
{
//	AI_Output(other,self,"DIA_BaalTondral_Loyality_15_00"); //How can I prove my loyalty?
//	AI_Output(other,self,"DIA_BaalTondral_Loyality_15_00"); //Wie kann ich dir meine Loyalität beweisen?
	AI_Output(other,self,"DIA_BaalTondral_Loyality_15_00"); //Jak můžu dokázat svou oddanost?
//	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_01"); //Most of all, we need new souls to join our community.
//	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_01"); //Was wir am dringendsten brauchen, sind neue Seelen, die sich unserer Gemeinschaft anschließen.
	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_01"); //Především potřebujeme nové duše, které by se přidaly k naší komunitě.
//	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_02"); //By recruiting one more man to our camp, you will prove that you're willing to do good service to our community.
//	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_02"); //Wenn du dafür sorgst, dass ein weiterer Mann unserem Lager beitritt, hast du deinen Willen, unsere Gemeinschaft zu bereichern, unter Beweis gestellt.
	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_02"); //Tím, že do našeho tábora přivedeš jednoho nebo více mužů, dokážeš, že jsi ochoten naší komunitě prokazovat dobré služby.

	Log_CreateTopic(CH1_RecruitDusty,LOG_MISSION);
	Log_SetTopicStatus(CH1_RecruitDusty,LOG_RUNNING);
//	B_LogEntry(CH1_RecruitDusty,"Baal Tondral has sent me into the Old Camp to recruit a new man for the Brotherhood. I suppose that's a good chance to win his favor!");
//	B_LogEntry(CH1_RecruitDusty,"Baal Tondral schickt mich ins Alte Lager um einen neuen Mann für die Bruderschaft anzuwerben. Ich schätze das ist eine gute Gelegenheit, seine Gunst zu gewinnen!");
	B_LogEntry(CH1_RecruitDusty,"Baal Tondral mě vyslal do Starého tábora, abych naverboval pro Bratrstvo nové lidi. Doufám, že to bude dobrá příležitost, jak si získat jeho přízeň!");

	BaalTondral_GetNewGuy = LOG_RUNNING;
};

// **************************************************
// 				Wo finde ich neuen Mann
// **************************************************

instance DIA_BaalTondral_NewMember(C_INFO)
{
	npc = Gur_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_NewMember_Condition;
	information = DIA_BaalTondral_NewMember_Info;
	permanent = 1;
//	description = "Where can I recruit new members for the Brotherhood?";
//	description = "Wo kann ich neue Leute für die Bruderschaft anwerben?";
	description = "Kde mám hledat nové členy do Bratrstva?";
};

func int DIA_BaalTondral_NewMember_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_BaalTondral_NewMember_Info()
{
//	AI_Output(other,self,"DIA_BaalTondral_NewMember_15_00"); //Where can I recruit new members for the Brotherhood?
//	AI_Output(other,self,"DIA_BaalTondral_NewMember_15_00"); //Wo kann ich neue Leute für die Bruderschaft anwerben?
	AI_Output(other,self,"DIA_BaalTondral_NewMember_15_00"); //Kde mám hledat nové členy do Bratrstva?
//	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_01"); //The Old Camp is a good place to try, since a lot of the people there are fed up with fear and lies. They just need some kind of support.
//	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_01"); //Das alte Lager ist ein guter Ort dafür. Denn viele, die dort leben, sind der Angst und der Lügen überdrüssig, sie müssen nur ein wenig unterstützt werden.
	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_01"); //Starý tábor je dobrým místem. Lidé tam jsou již přesyceni strachem a lžemi. Potřebují nějakým způsobem pomoci.
//	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_02"); //I guess you won't be very successful in the New Camp. The men living there are barbarians.
//	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_02"); //Im Neuen Lager wirst du wahrscheinlich weniger Glück haben. Die Männer, die dort leben sind Barbaren.
	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_02"); //V Novém táboře bys nejspíš úspěšný nebyl. Muži, kteří tam žijí, jsou barbaři.
};

// **************************************************
// 			Wieso braucht ihr so dringend Neue
// **************************************************

instance DIA_BaalTondral_NewMember2(C_INFO)
{
	npc = Gur_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_NewMember2_Condition;
	information = DIA_BaalTondral_NewMember2_Info;
	permanent = 0;
//	description = "Why are you so desperate for new members?";
//	description = "Wieso braucht ihr so dringend neue Leute?";
	description = "Proč tak moc potřebujete nové členy?";
};

func int DIA_BaalTondral_NewMember2_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_BaalTondral_NewMember2_Info()
{
//	AI_Output(other,self,"DIA_BaalTondral_NewMember2_15_00"); //Why are you so desperate for new members?
//	AI_Output(other,self,"DIA_BaalTondral_NewMember2_15_00"); //Wieso braucht ihr so dringend neue Leute?
	AI_Output(other,self,"DIA_BaalTondral_NewMember2_15_00"); //Proč tak moc potřebuješ nové členy?
//	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_01"); //The Sleeper has spoken to our master, revealing that he has an important message for us.
//	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_01"); //Der Schläfer hat unserem Meister offenbart, dass er eine wichtige Nachricht für uns hat.
	//#Needs_Attention - neprebasnime, pride mi to take kostrbate
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_01"); //Spáč našemu mistrovi prozradil, že má pro nás důležitou zprávu.
//	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_02"); //However, he has not gathered full strength yet. That's why he needs OUR strength to contact us.
//	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_02"); //Aber er ist noch nicht zu seiner vollen Stärke erwacht, und so braucht er UNSERE Kraft, um mit uns in Kontakt treten zu können.
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_02"); //Ale ještě neprocitl do své plné síly a potřebuje NAŠÍ sílu, abychom se s ním dokázali spojit.
//	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_03"); //Therefore we are preparing a great invocation, and the more men participate, the likelier we are to be successful.
//	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_03"); //Deswegen bereiten wir eine große Anrufung vor und je mehr Männer daran teilnehmen, umso eher werden wir Erfolg haben.
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_03"); //Proto připravujeme velké vzývání, čím více mužů budeme mít, tím větší šanci na úspěch máme.
//	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_04"); //If you want to know more about it, go to the large court in front of the temple hill. But don't disturb our master in his meditations!
//	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_04"); //Wenn du mehr darüber erfahren willst, geh zum großen Platz vor dem Tempelberg. Aber störe nicht den Meister bei der Meditation!
	//#Needs_Attention - neprebasnime, pride mi to take kostrbate 'velký dvůr před chrámovou horou'
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_04"); //Jestli se o tom chceš dozvědět víc, jdi na velký dvůr před chrámovou horou. Neruš ale našeho mistra při meditacích!
};

// **************************************************
// 					DUSTY SUCCESS
// **************************************************

instance DIA_BaalTondral_DustySuccess(C_INFO)
{
	npc = Gur_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_DustySuccess_Condition;
	information = DIA_BaalTondral_DustySuccess_Info;
	permanent = 0;
//	description = "Here's somebody who would like to make your acquaintance, Master!";
//	description = "Ich habe hier jemanden, der dich kennen lernen möchte, Meister!";
	description = "Je tady někdo, mistře, kdo by se s vámi chtěl seznámit.";
};

func int DIA_BaalTondral_DustySuccess_Condition()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if ((BaalTondral_GetNewGuy == LOG_RUNNING) && (Npc_GetDistToNpc(self,dusty)<1000))
	{
		return 1;
	};
};

func void DIA_BaalTondral_DustySuccess_Info()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);

//	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_00"); //Here's somebody who would like to make your acquaintance, Master!
//	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_00"); //Ich habe hier jemanden, der dich kennen lernen möchte, Meister!
	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_00"); //Je tady někdo, mistře, kdo by se s vámi chtěl seznámit.
//	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_01"); //Who have you brought me? Is he worthy?
//	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_01"); //Wen bringst du zu mir? Ist er würdig?
	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_01"); //Koho jsi přivedl? Je hoden?
//	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_02"); //He will certainly require your spiritual guidance, Master.
//	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_02"); //Er bedarf sicherlich noch eurer geistigen Führung, Meister.
	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_02"); //Určitě bude potřebovat vaše duchovní vedení, mistře.
//	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_03"); //Very well. From now on, he shall be one of my disciples.
//	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_03"); //Gut. Von heute an soll er zu meinen Schülern zählen.
	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_03"); //Velmi dobře. Ode dneška bude jedním z mých žáků.
	//------------------------------------------------------------------
	AI_TurnToNpc(self,dusty);
	AI_TurnToNpc(dusty,other);
//	AI_Output(self,NULL,"DIA_BaalTondral_DustySuccess_13_04"); //You will come to my hut every day to listen to my words. Your soul can still be saved.
//	AI_Output(self,NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Von heute an wirst du dich täglich vor meiner Hütte einfinden und meinen Worten lauschen. Deine Seele ist noch zu retten.
	//#Needs_attention 'každý den do mé chýše' ou prasacinky :)
	AI_Output(self,NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Ode dneška za mnou budeš chodit každý den do mé chýše a naslouchat mým slovům. Tvá duše může být stále zachráněna.

	//AI_Output(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //Heißt das, ich bin dabei - einfach so?
	//AI_TurnToNpc(other,dusty);
	//AI_Output(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC lösen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0; // Immortal löschen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild(dusty, GIL_NOV);
	B_ExchangeRoutine(Vlk_524_Dusty,"PREPARERITUAL");

	BaalTondral_GetNewGuy = LOG_SUCCESS;
//	B_LogEntry(CH1_RecruitDusty,"Dusty is now Baal Tondral's disciple. I've accomplished my task.");
//	B_LogEntry(CH1_RecruitDusty,"Dusty ist jetzt ein Schüler von Baal Tondral. Damit ist meine Aufgabe erledigt.");
	B_LogEntry(CH1_RecruitDusty,"Dusty je teď učněm Baal Tondrala. Splnil jsem svůj úkol.");
	Log_SetTopicStatus(CH1_RecruitDusty,LOG_SUCCESS);
	B_GiveXP(XP_DeliveredDusty);
};

// **************************************************
// 					zu Kalom
// **************************************************

instance DIA_BaalTondral_SendToKalom(C_INFO)
{
	npc = Gur_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_SendToKalom_Condition;
	information = DIA_BaalTondral_SendToKalom_Info;
	permanent = 0;
//	description = "Master! I would like to join the Brotherhood.";
//	description = "Meister! Ich will in die Bruderschaft aufgenommen werden.";
	description = "Mistře! Chtěl bych se přidat k Bratrstvu!";
};

func int DIA_BaalTondral_SendToKalom_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalTondral_SendToKalom_Info()
{
//	AI_Output(other,self,"DIA_BaalTondral_SendToKalom_15_00"); //Master! I would like to join the Brotherhood. I need you to speak in my favor.
//	AI_Output(other,self,"DIA_BaalTondral_SendToKalom_15_00"); //Meister! Ich will in die Bruderschaft aufgenommen werden. Ich brauche eure Stimme.
	AI_Output(other,self,"DIA_BaalTondral_SendToKalom_15_00"); //Mistře! Chtěl bych se přidat k Bratrstvu! Potřebuji tvůj hlas.
	AI_TurnToNpc(self,other);
//	AI_Output(self,other,"DIA_BaalTondral_SendToKalom_13_01"); //You have proven your worth. Go to Cor Kalom and don the robe.
//	AI_Output(self,other,"DIA_BaalTondral_SendToKalom_13_01"); //Du hast dich als würdig erwiesen. Cor Kalom soll dir die Robe geben.
	AI_Output(self,other,"DIA_BaalTondral_SendToKalom_13_01"); //Dokázal jsi, že jsi hoden. Cor Kalom ti předá roucho.

//	B_LogEntry(CH1_JoinPsi,"Baal Tondral considers me worthy of wearing a novice's robe!");
//	B_LogEntry(CH1_JoinPsi,"Baal Tondral hält mich für würdig, die Robe eines Novizen zu tragen!");
	B_LogEntry(CH1_JoinPsi,"Baal Tondral rozhodl, že jsem hoden nosit roucho novice!");
};

