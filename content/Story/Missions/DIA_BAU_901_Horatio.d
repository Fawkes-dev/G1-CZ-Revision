// ************************************************************
// 			  				   EXIT
// ************************************************************

instance DIA_Horatio_EXIT(C_INFO)
{
	npc = Bau_901_Horatio;
	nr = 999;
	condition = DIA_Horatio_EXIT_Condition;
	information = DIA_Horatio_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Horatio_EXIT_Condition()
{
	return 1;
};

func void DIA_Horatio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Wasser
// ************************************************************

instance Info_Horatio_Wasser(C_INFO)
{
	npc = Bau_901_Horatio;
	nr = 800;
	condition = Info_Horatio_Wasser_Condition;
	information = Info_Horatio_Wasser_Info;
	important = 0;
	permanent = 1;
//	description = "Lefty sent me. I've brought you some water.";
//	description = "Lefty schickt mich. Ich hab' Wasser für dich.";
	description = "Lefty mě poslal. Přinesl jsem ti trochu vody.";
};

func int Info_Horatio_Wasser_Condition()
{
	if (((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01)))
	&& (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};

	return 0;
};

func void Info_Horatio_Wasser_Info()
{
//	AI_Output(other,self,"Info_Horatio_Wasser_15_00"); //Lefty sent me. I've brought you some water.
//	AI_Output(other,self,"Info_Horatio_Wasser_15_00"); //Lefty schickt mich. Ich hab' Wasser für dich.
	AI_Output(other,self,"Info_Horatio_Wasser_15_00"); //Poslal mě Lefty. Přinesl jsem trochu vody.
	if (Npc_HasItems(other,ItFo_Potion_Water_01)>=1)
	{
//		AI_Output(self,other,"Info_Horatio_Wasser_09_01"); //Thanks, man! I was just about to start drinking the mud.
//		AI_Output(self,other,"Info_Horatio_Wasser_09_01"); //Danke, Mann! Ich war schon kurz davor, den Schlamm zu saufen.
		AI_Output(self,other,"Info_Horatio_Wasser_09_01"); //Díky, chlape! Ještě chvíli a začal bych pít bahno!
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if (C_BodystateContains(self,BS_SIT))
		{
			AI_StandUp(self);
			AI_TurnToNpc(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
//		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00"); //You've run out. I'll get some from the others.
//		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00"); //Du hast nichts mehr. Ich hol mir von den anderen was.
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00"); //Už žádnou nemáš. Vezmu si trochu od ostatních.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************
	var int horatio_trouble;
// ************************************************************

instance DIA_Horatio_Hello(C_INFO)
{
	npc = Bau_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_Hello_Condition;
	information = DIA_Horatio_Hello_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Horatio_Hello_Condition()
{
	return 1;
};

func void DIA_Horatio_Hello_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"DIA_Horatio_Hello_09_00"); //What are you doing here? You looking for trouble?
//	AI_Output(self,other,"DIA_Horatio_Hello_09_00"); //Was machst du hier? Willst du Ärger haben?
	AI_Output(self,other,"DIA_Horatio_Hello_09_00"); //Co tady děláš? Chceš mít problémy?

	Info_ClearChoices(DIA_Horatio_Hello);
//	Info_AddChoice(DIA_Horatio_Hello,"Trouble? Who with? A peasant?",DIA_Horatio_Hello_PissOff);
//	Info_AddChoice(DIA_Horatio_Hello,"Ärger? Von wem? Von einem Bauern?",DIA_Horatio_Hello_PissOff);
	Info_AddChoice(DIA_Horatio_Hello,"Problémy? S kým? S nějakým rolníkem?",DIA_Horatio_Hello_PissOff);
//	Info_AddChoice(DIA_Horatio_Hello,"Hey, relax! I'm a newcomer.",DIA_Horatio_Hello_BeCool);
//	Info_AddChoice(DIA_Horatio_Hello,"Entspann dich! Ich bin neu hier.",DIA_Horatio_Hello_BeCool);
	Info_AddChoice(DIA_Horatio_Hello,"Klídek! Jsem tady nový.",DIA_Horatio_Hello_BeCool);
};

func void DIA_Horatio_Hello_BeCool()
{
//	AI_Output(other,self,"DIA_Horatio_Hello_BeCool_15_00"); //Hey, relax! I'm a newcomer.
//	AI_Output(other,self,"DIA_Horatio_Hello_BeCool_15_00"); //Entspann dich! Ich bin neu hier.
	AI_Output(other,self,"DIA_Horatio_Hello_BeCool_15_00"); //Klídek! Jsem tady nový.
//	AI_Output(self,other,"DIA_Horatio_Hello_BeCool_09_01"); //Huh... You look okay though. You never know. You get new guys come along thinking they're it every day.
//	AI_Output(self,other,"DIA_Horatio_Hello_BeCool_09_01"); //Hm ... siehst mir ganz in Ordnung aus - hier weiß man nie. Da kommt jeden Tag ein neuer Mistkerl, der's wissen will.
	AI_Output(self,other,"DIA_Horatio_Hello_BeCool_09_01"); //Hm... připadá mi, že jsi v pohodě... Jeden nikdy neví. Pořád přicházejí noví chlapi.
	Info_ClearChoices(DIA_Horatio_Hello);
};

func void DIA_Horatio_Hello_PissOff()
{
//	AI_Output(other,self,"DIA_Horatio_Hello_PissOff_15_00"); //Trouble? Who with? A peasant?
//	AI_Output(other,self,"DIA_Horatio_Hello_PissOff_15_00"); //Ärger? Von wem? Von einem Bauern?
	AI_Output(other,self,"DIA_Horatio_Hello_PissOff_15_00"); //Problémy? S kým? S nějakým rolníkem?
//	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_01"); //Just because I work in the fields, doesn't mean I can't defend myself against guys like you.
//	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_01"); //Nur weil ich auf den Feldern arbeite, heißt das nicht, dass ich mich nicht gegen Typen wie dich wehren kann.
	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_01"); //To, že pracuji na polích ještě neznamená, že se nedokážu ubránit takovým chlapíkům, jako jsi ty.
//	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_02"); //So come here if you want trouble!
//	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_02"); //Also komm nur her, wenn du Ärger willst!
	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_02"); //Tak pojď, jestli chceš mít problémy!
	horatio_trouble = TRUE;

	Info_ClearChoices(DIA_Horatio_Hello);
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						SORRY (PERM)
// ************************************************************

instance DIA_Horatio_SORRY(C_INFO)
{
	npc = Bau_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_SORRY_Condition;
	information = DIA_Horatio_SORRY_Info;
	important = 0;
	permanent = 1;
//	description = "I'm sorry I said what I did about the peasants.";
//	description = "Tut mir leid, der Spruch mit dem Bauern.";
	description = "Je mi líto toho, co jsem řekl o rolnících.";
};

func int DIA_Horatio_SORRY_Condition()
{
	if (horatio_trouble == TRUE)
	{
		return 1;
	};

	return 0;
};

//#NEEDS_ATTENTION hmmmm viem, ze sme hovorili revizia cestiny :) ale co tak upravit aj logiku niektorych dialogov?
//Napriklad tento dialog je permanentny --> chceme ho nechat permanentny? (nestaci nam takyto dialog iba raz?)
//Tu by sme mohli nastavit horatio_trouble zase na false, Horatio uz nebude 'nastvany' a dialog nebude zbytocne dostupny.
func void DIA_Horatio_SORRY_Info()
{
//	AI_Output(other,self,"DIA_Horatio_SORRY_15_00"); //I'm sorry I said what I did about the peasants.
//	AI_Output(other,self,"DIA_Horatio_SORRY_15_00"); //Tut mir Leid, der Spruch mit dem Bauern.
	AI_Output(other,self,"DIA_Horatio_SORRY_15_00"); //Je mi líto toho, co jsem řekl o rolnících.
//	AI_Output(self,other,"DIA_Horatio_SORRY_09_01"); //You should have thought of that before, boy!
//	AI_Output(self,other,"DIA_Horatio_SORRY_09_01"); //Das hättest du dir eher überlegen sollen, Junge!
	AI_Output(self,other,"DIA_Horatio_SORRY_09_01"); //Měl sis to napřed promyslet, hochu!
};

// ************************************************************
// 					Horatios Story
// ************************************************************

instance DIA_Horatio_Story(C_INFO)
{
	npc = Bau_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_Story_Condition;
	information = DIA_Horatio_Story_Info;
	important = 0;
	permanent = 0;
//	description = "What's a man like you doing with the peasants?";
//	description = "Was macht ein Kerl wie du bei den Bauern?";
	description = "Co dělá chlap jako ty mezi rolníky?";
};

func int DIA_Horatio_Story_Condition()
{
	if ((horatio_trouble == FALSE) && (Npc_KnowsInfo(hero,DIA_Horatio_Hello)))
	{
		return 1;
	};

	return 0;
};

func void DIA_Horatio_Story_Info()
{
//	AI_Output(other,self,"DIA_Horatio_Story_15_00"); //What's a man like you doing with the peasants?
//	AI_Output(other,self,"DIA_Horatio_Story_15_00"); //Was macht ein Kerl wie du bei den Bauern?
	AI_Output(other,self,"DIA_Horatio_Story_15_00"); //Co dělá chlap jako ty mezi rolníky?
//	AI_Output(self,other,"DIA_Horatio_Story_09_01"); //Lee asked me that. I don't fight any more - except to defend myself.
//	AI_Output(self,other,"DIA_Horatio_Story_09_01"); //Das hat Lee mich auch gefragt, aber ich kämpfe nicht mehr - außer um mich zu verteidigen.
	AI_Output(self,other,"DIA_Horatio_Story_09_01"); //Lee se mě také už ptal. Ale už se neperu - s výjimkou sebeobrany.
//	AI_Output(self,other,"DIA_Horatio_Story_09_02"); //I killed a guy once, and that was once too many. That's why they chucked me in this goddamn colony - it was justice.
//	AI_Output(self,other,"DIA_Horatio_Story_09_02"); //Ich habe einmal getötet, das war einmal zu viel. Deswegen haben sie mich in diese gottverdammte Kolonie geworfen - und das war nur gerecht.
	AI_Output(self,other,"DIA_Horatio_Story_09_02"); //Jednou jsem zabil jednoho chlapíka, a to jednou bylo až moc. To je důvod, proč mě poslali do téhle zpropadené Kolonie - a to bylo spravedlivé.
//	AI_Output(other,self,"DIA_Horatio_Story_15_03"); //How did it happen?
//	AI_Output(other,self,"DIA_Horatio_Story_15_03"); //Was ist passiert?
	AI_Output(other,self,"DIA_Horatio_Story_15_03"); //Jak se to stalo?
//	AI_Output(self,other,"DIA_Horatio_Story_09_04"); //It was just an ordinary bar fight. I didn't mean to kill the guy, I just must have hit him too hard.
//	AI_Output(self,other,"DIA_Horatio_Story_09_04"); //Es war ein einfacher Streit in einer Kneipe. Ich wollte den Mann nicht töten, aber ich habe zu stark zugeschlagen.
	AI_Output(self,other,"DIA_Horatio_Story_09_04"); //Byla to obyčejná hospodská rvačka. Nechtěl jsem toho chlapa zabít, jenom jsem ho praštil moc silně.
//	AI_Output(self,other,"DIA_Horatio_Story_09_05"); //I was a blacksmith at the time. I didn't know my own strength...
//	AI_Output(self,other,"DIA_Horatio_Story_09_05"); //Ich habe damals als Schmied gearbeitet. Ich konnte meine Kraft nicht kontrollieren ...
	AI_Output(self,other,"DIA_Horatio_Story_09_05"); //Byl jsem tehdy kovář. Neuměl jsem ovládat svou sílu...
};

// ************************************************************
// 						Warum hier?
// ************************************************************

instance DIA_Horatio_WhyHere(C_INFO)
{
	npc = Bau_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_WhyHere_Condition;
	information = DIA_Horatio_WhyHere_Info;
	important = 0;
	permanent = 0;
//	description = "Why did you join THIS camp?";
//	description = "Warum bist du ausgerechnet in DIESES Lager gegangen?";
	description = "Proč ses dal k TOMUHLE táboru?";
};

func int DIA_Horatio_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};

	return 0;
};

func void DIA_Horatio_WhyHere_Info()
{
//	AI_Output(other,self,"DIA_Horatio_WhyHere_15_00"); //Why did you join THIS camp?
//	AI_Output(other,self,"DIA_Horatio_WhyHere_15_00"); //Warum bist du ausgerechnet in DIESES Lager gegangen?
	AI_Output(other,self,"DIA_Horatio_WhyHere_15_00"); //Proč ses dal k TOMUHLE táboru?
//	AI_Output(self,other,"DIA_Horatio_WhyHere_09_01"); //I'll tell you: My only option was to join those sect loonies, and I didn't wanna let those Gurus of theirs mess about with my brain.
//	AI_Output(self,other,"DIA_Horatio_WhyHere_09_01"); //Das will ich dir sagen: Die einzig andere Wahl wären die Sektenspinner gewesen, aber ich habe keine Lust, mir von den Gurus den Kopf waschen zu lassen.
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_01"); //Jedno ti řeknu. Jediná další možnost byla dát se k těm sektářským bláznům. Ale já nemám nejmenší chuť nechat si od jejich Guru vymýt mozek.
//	AI_Output(self,other,"DIA_Horatio_WhyHere_09_02"); //In the Old Camp, I'd have had too much trouble with the guards, but the mercenaries and rogues do have some respect.
//	AI_Output(self,other,"DIA_Horatio_WhyHere_09_02"); //Im Alten Lager hätte ich keine Ruhe vor den Gardisten gehabt, aber die Söldner und Banditen haben Respekt.
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_02"); //Ve Starém táboře jsem neměl od stráží klid, ale žoldáci a banditi mají alespoň nějaký respekt.
//	AI_Output(other,self,"DIA_Horatio_WhyHere_15_03"); //They're afraid of you...
//	AI_Output(other,self,"DIA_Horatio_WhyHere_15_03"); //Sie fürchten dich ...
	AI_Output(other,self,"DIA_Horatio_WhyHere_15_03"); //Bojí se tě...
//	AI_Output(self,other,"DIA_Horatio_WhyHere_09_04"); //Maybe. Anyway, I've found peace here, and you should try the same.
//	AI_Output(self,other,"DIA_Horatio_WhyHere_09_04"); //Kann schon sein. Immerhin habe ICH hier meinen Frieden gefunden. Und das solltest du auch versuchen.
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_04"); //Možná. Ale každopádně jsem našel svůj klid tady a to bys měl také zkusit.
};

// ************************************************************
// 						Bitte STR
// ************************************************************
	var int horatio_StrFree;
// ************************************************************

instance DIA_Horatio_PleaseTeachSTR(C_INFO)
{
	npc = Bau_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_PleaseTeachSTR_Condition;
	information = DIA_Horatio_PleaseTeachSTR_Info;
	important = 0;
	permanent = 0;
//	description = "Can you teach me to be as strong as you are?";
//	description = "Kannst du mir beibringen, auch so stark zuzuschlagen?";
	description = "Naučíš mě, jak se stát tak silným jako jsi ty?"; //#Needs_Attention Tady by mělo být: "Můžeš mě naučit uděřit také tak silně uděřit?" ale asi to nezní tak dobže
};

func int DIA_Horatio_PleaseTeachSTR_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};

	return 0;
};

func void DIA_Horatio_PleaseTeachSTR_Info()
{
//	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_15_00"); //Can you teach me to be as strong as you are?
//	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_15_00"); //Kannst du mir beibringen, auch so stark zuzuschlagen?
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_15_00"); //Naučíš mě, jak se stát tak silným jako jsi ty?
//	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_09_01"); //Even if I could - WHAT would you use your strength for?
//	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_09_01"); //Selbst wenn - zu WAS würde jemand wie du seine Stärke einsetzen?
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_09_01"); //I kdybych mohl - k ČEMU bys pak svoji sílu využil?
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
//		Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"So I can wipe out the Rice Lord and his thugs!",DIA_Horatio_PleaseTeachSTR_Ricelord);
//		Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Damit ich Reislord und seine Schläger fertigmachen kann!",DIA_Horatio_PleaseTeachSTR_Ricelord);
		Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Abych mohl vyřídit Rýžového Lorda a jeho tlupu!",DIA_Horatio_PleaseTeachSTR_Ricelord);
	}
	else
	{
//		Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Good question. I'll think about it...",DIA_Horatio_PleaseTeachSTR_BACK);
//		Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Gute Frage. Ich werde darüber nachdenken...",DIA_Horatio_PleaseTeachSTR_BACK);
		Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Dobrá otázka. Budu o tom přemýšlet...",DIA_Horatio_PleaseTeachSTR_BACK);
	};
//	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Self defense!",DIA_Horatio_PleaseTeachSTR_Defend);
//	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Zur Selbstverteidigung!",DIA_Horatio_PleaseTeachSTR_Defend);
	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Sebeobrana!",DIA_Horatio_PleaseTeachSTR_Defend);
//	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"To teach these bastards how to talk to me properly!",DIA_Horatio_PleaseTeachSTR_Attack);
//	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Um den Mistkerlen hier zu zeigen, wie man mit mir zu sprechen hat!",DIA_Horatio_PleaseTeachSTR_Attack);
	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Naučil bych ty bastardy, jak se mnou mají správně mluvit!",DIA_Horatio_PleaseTeachSTR_Attack);

	Log_CreateTopic(CH1_HoratiosTeachings,LOG_MISSION);
	Log_SetTopicStatus(CH1_HoratiosTeachings,LOG_RUNNING);
//	B_LogEntry(CH1_HoratiosTeachings,"Horatio, a farmer on the rice fields of the New Camp, can teach me how to strike harder. But somehow I haven't found the right answer to his question WHY yet.");
//	B_LogEntry(CH1_HoratiosTeachings,"Horatio, ein Bauer auf den Reisfeldern des Neuen Lagers will mir beibringen, stärker zuzuschalgen. Doch irgendwie habe ich noch nicht die richtige Antwort auf seine Frage WOZU gefunden.");
	B_LogEntry(CH1_HoratiosTeachings,"Horatio, rolník z rýžových polí Nového tábora, mě může naučit, jak silněji udeřit. Nějak však nemůžu najít správnou odpověď na jeho otázku PROČ.");
};

func void DIA_Horatio_PleaseTeachSTR_Attack()
{
//	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00"); //To teach these bastards how to talk to me properly!
//	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00"); //Um den Mistkerlen hier zu zeigen, wie man mit mir zu sprechen hat!
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00"); //Naučil bych ty bastardy, jak se mnou mají správně mluvit!
//	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01"); //And before you knew it, you'd become another of those bastards yourself... No, sir, I'm not training you for that.
//	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01"); //Und bevor du dich versiehst, bist du nur ein weiterer Mistkerl mehr ... Nein! Dafür werde ich dir nichts beibringen.
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01"); //A předtím, než se naděješ, jsi jedním z těch bastardů... Ne! Na to tě připravovat nebudu.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
};

func void DIA_Horatio_PleaseTeachSTR_Defend()
{
//	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00"); //Self defense!
//	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00"); //Zur Selbstverteidigung!
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00"); //Sebeobrana!
//	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01"); //That takes speed, not strength. D'you think cracking skulls is better than finding peace?
//	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01"); //Dazu musst du nur schnell sein und nicht stark. Glaubst du, dass Schädel spalten besser ist als seinen Frieden zu finden?
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01"); //To chce rychlost, ne sílu. Myslíš, že rozbít někomu lebku, je lepší, než sjednat mír?
};

func void DIA_Horatio_PleaseTeachSTR_BACK()
{
//	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00"); //Good question. I'll think about it...
//	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00"); //Gute Frage. Ich werde drüber nachdenken ...
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00"); //Dobrá otázka. Budu o tom přemýšlet...
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
};

func void DIA_Horatio_PleaseTeachSTR_Ricelord()
{
//	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00"); //So I can wipe out the Rice Lord and his thugs!
//	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00"); //Damit ich den Reislord und seine Schläger fertig machen kann!
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00"); //Mohl bych pak vyřídit Rýžového Lorda a jeho tlupu!
//	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01"); //Hmm... You wouldn't be the first to try that.
//	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01"); //Hmm ... Du bist nicht der Erste, der das versucht.
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01"); //Hmm... Nebyl bys první, kdo se o to pokusil.
	horatio_StrFree = TRUE;
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
};

// ************************************************************
// 						Nachgedacht (STR)
// ************************************************************

instance DIA_Horatio_ThoughtSTR(C_INFO)
{
	npc = Bau_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_ThoughtSTR_Condition;
	information = DIA_Horatio_ThoughtSTR_Info;
	important = 0;
	permanent = 1;
//	description = "I've been thinking the whole thing over...";
//	description = "Ich hab' nochmal über die Sache nachgedacht...";
	description = "Celé jsem si to znovu promyslel...";
};

func int DIA_Horatio_ThoughtSTR_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_PleaseTeachSTR) && (horatio_StrFree == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Horatio_ThoughtSTR_Info()
{
//	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_15_00"); //I've been thinking the whole thing over...
//	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_15_00"); //Ich hab' noch einmal über die Sache nachgedacht ...
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_15_00"); //Celé jsem si to znovu promyslel...
//	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_09_01"); //And? Have you thought of anything better?
//	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_09_01"); //Und? Ist dir was Besseres eingefallen?
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_09_01"); //A? Napadlo tě něco lepšího?

	Info_ClearChoices(DIA_Horatio_ThoughtSTR);
//	Info_AddChoice(DIA_Horatio_ThoughtSTR,"No.",DIA_Horatio_ThoughtSTR_NoIdea);
//	Info_AddChoice(DIA_Horatio_ThoughtSTR,"Nein.",DIA_Horatio_ThoughtSTR_NoIdea);
	Info_AddChoice(DIA_Horatio_ThoughtSTR,"Ne.",DIA_Horatio_ThoughtSTR_NoIdea);

	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
//		Info_AddChoice(DIA_Horatio_ThoughtSTR,"Yes. I want to be able to take on the Rice Lord and his thugs!",DIA_Horatio_ThoughtSTR_Ricelord);
//		Info_AddChoice(DIA_Horatio_ThoughtSTR,"Ja. Ich will es mit Ricelord und seinen Schlägern aufnehmen können!",DIA_Horatio_ThoughtSTR_Ricelord);
		Info_AddChoice(DIA_Horatio_ThoughtSTR,"Ano. Chci být schopen dostat Rýžového Lorda a jeho tlupu!",DIA_Horatio_ThoughtSTR_Ricelord);
	};
};

func void DIA_Horatio_ThoughtSTR_NoIdea()
{
//	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00"); //No.
//	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00"); //Nein.
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00"); //Ne.
//	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01"); //I thought so.
//	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01"); //Dachte ich mir.
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01"); //Myslel jsem si to.
	Info_ClearChoices(DIA_Horatio_ThoughtSTR);
};

func void DIA_Horatio_ThoughtSTR_Ricelord()
{
//	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00"); //Yes. I want to be able to take on the Rice Lord and his thugs!
//	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00"); //Ja. Ich will es mit dem Reislord und seinen Schlägern aufnehmen können!
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00"); //Ano. Chci být schopen dostat Rýžového Lorda a jeho tlupu!
//	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01"); //Hmm... You wouldn't be the first to try.
//	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01"); //Hmm ... Du bist nicht der Erste, der das versucht.
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01"); //Hmm... Nebyl bys první, kdo se o to pokusil.
	horatio_StrFree = TRUE;

	Info_ClearChoices(DIA_Horatio_ThoughtSTR);
};

// ************************************************************
//					Will Ricelord köpfen
// ************************************************************

func void DIA_Horatio_HelpSTR_LEARN_NOW()
{
	//#NEEDS_ATENTION toto je v podstate bug, ak ma hrac silu > 100 (napriklad s prstenom/amuletom) tak skript dole hracovi nastavi silu na 100 - a teda efektivne znizi hracovi silu
	if (other.attribute[ATR_STRENGTH]<=(100-5))
	{
		other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 5;
//		PrintScreen("Strength + 5", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//		PrintScreen("Stärke + 5", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		PrintScreen("Síla +5", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		other.attribute[ATR_STRENGTH] = 100;
//		PrintScreen("Strength: 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//		PrintScreen("Stärke: 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		PrintScreen("Síla: 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};

//	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00"); //If you want to hit powerfully, you need to know the right tactics. That's the first thing you learn as a smith.
//	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00"); //Wenn du stark zuschlagen willst, kommt es auf die richtige Technik an. Das ist das Erste, was du beim Schmieden lernst.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00"); //Pokud chceš udeřit plnou silou, musíš znát správnou taktiku. To je první věc, kterou se jako kovář naučíš.
//	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01"); //Learn to push your whole arm through, from the shoulder down to the wrist.
//	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01"); //Lerne jeden Teil deines Arms, von der Schulter bis zum Handgelenk, gleichzeitig nach vorne schnellen zu lassen.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01"); //Nauč se rozmáchnout celou rukou, od ramene po zápěstí.
//	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02"); //The better you get at that, the more powerful the blow. You'll get the hang of it pretty quick.
//	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02"); //Je besser die Technik, umso härter der Schlag. Du wirst es schnell raushaben.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02"); //Čím lepší technika, tím silnější bude rána. Dostaneš se do toho docela rychle.
};

//--------------------------------------------------------------

instance DIA_Horatio_HelpSTR(C_INFO)
{
	npc = Bau_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_HelpSTR_Condition;
	information = DIA_Horatio_HelpSTR_Info;
	important = 0;
	permanent = 0;
//	description = "I WILL defeat the Rice Lord and his thugs - if you help me!";
//	description = "Ich WERDE den Reislord fertig machen - wenn du mir dabei hilfst!";
	description = "PORAZÍM Rýžového Lorda a jeho tlupu - když mi pomůžeš!";
};

func int DIA_Horatio_HelpSTR_Condition()
{
	if (horatio_StrFree == TRUE)
	{
		return 1;
	};

	return 0;
};

func void DIA_Horatio_HelpSTR_Info()
{
//	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_00"); //I WILL defeat the Rice Lord and his thugs - if you help me!
//	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_00"); //Ich WERDE den Reislord und seine Schläger fertig machen - wenn du mir dabei hilfst!
	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_00"); //PORAZÍM Rýžového Lorda a jeho tlupu - když mi pomůžeš!
//	AI_Output(self,other,"DIA_Horatio_HelpSTR_09_01"); //Good! I've sworn I'll never attack anyone again, but I never said I wouldn't teach anyone else to do it.
//	AI_Output(self,other,"DIA_Horatio_HelpSTR_09_01"); //Gut! Ich habe geschworen, nie wieder jemanden anzugreifen, aber NICHT, es niemandem beizubringen.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_09_01"); //Dobře! Přísahal jsem, že už na nikoho nezaútočím, ale nikdy jsem neřekl, že to nenaučím někoho, kdo to udělá!
//	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_02"); //I'm all ears!
//	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_02"); //Ich bin ganz Ohr!
	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_02"); //Jsem jedno ucho!
	DIA_Horatio_HelpSTR_LEARN_NOW();

	Log_SetTopicStatus(CH1_HoratiosTeachings,LOG_SUCCESS);
//	B_LogEntry(CH1_HoratiosTeachings,"Horatio showed me how to use my strength in battle and how to strike harder. A real pure soul, that one.");
//	B_LogEntry(CH1_HoratiosTeachings,"Horatio zeigt mir, wie ich meine Kraft im Kampf besser nutzen und damit stärker zuschlagen kann. Eine wahrhaft geläuterte Seele, dieser Mann.");
	B_LogEntry(CH1_HoratiosTeachings,"Horatio mi ukázal, jak v boji lépe využívat sílu a jak silněji udeřit. Skutečně ryzí duše, tenhle chlapík.");
};

// ************************************************************
// 							Thanks (PERM)
// ************************************************************

instance DIA_Horatio_Thanks(C_INFO)
{
	npc = Bau_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_Thanks_Condition;
	information = DIA_Horatio_Thanks_Info;
	important = 0;
	permanent = 1;
//	description = "Thanks for your help!";
//	description = "Danke für deine Hilfe!";
	description = "Díky za tvou pomoc!";
};

func int DIA_Horatio_Thanks_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR))
	{
		return 1;
	};

	return 0;
};

func void DIA_Horatio_Thanks_Info()
{
//	AI_Output(other,self,"DIA_Horatio_Thanks_15_00"); //Thanks for your help!
//	AI_Output(other,self,"DIA_Horatio_Thanks_15_00"); //Danke für deine Hilfe!
	AI_Output(other,self,"DIA_Horatio_Thanks_15_00"); //Díky za tvou pomoc!
//	AI_Output(self,other,"DIA_Horatio_Thanks_09_01"); //Use your knowledge for a just cause, and for NOTHING ELSE.
//	AI_Output(self,other,"DIA_Horatio_Thanks_09_01"); //Nutze dein Wissen für die gerechte Sache! Und NUR DAFÜR.
	//#NEEDS_ATENTION Tu mi ta dvojita negacia uplne nesedi, nebrebasnime? : Ne pro NIC JINÉHO
	AI_Output(self,other,"DIA_Horatio_Thanks_09_01"); //Použij své umění pro dobrou věc! Ne pro NIC JINÉHO!
};

