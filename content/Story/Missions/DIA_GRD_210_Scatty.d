// **************************************************
//  EXIT 
// **************************************************

instance DIA_Scatty_Exit(C_INFO)
{
	npc = Grd_210_Scatty;
	nr = 999;
	condition = DIA_Scatty_Exit_Condition;
	information = DIA_Scatty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Scatty_Exit_Condition()
{
	return 1;
};

func void DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//  Was machst du hier 
// **************************************************

instance DIA_Scatty_WhatDoYouDo(C_INFO)
{
	npc = Grd_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WhatDoYouDo_Condition;
	information = DIA_Scatty_WhatDoYouDo_Info;
	permanent = 0;
//	description = "What's your job here?";
//	description = "Was machst du hier?";
	description = "Co je tvá práce?";
};                       

func int DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

func void DIA_Scatty_WhatDoYouDo_Info()
{
//	AI_Output(other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //What's your job here?
//	AI_Output(other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Was machst du hier?
	AI_Output(other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Co tady máš na práci?
//	AI_Output(self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //I'm in charge of the arena. I organize the bets, hire new fighters... You know.
//	AI_Output(self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Ich kümmere mich um die Arena. Organisiere die Wetten, heuere neue Kämpfer an und so weiter ...
	AI_Output(self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Střežím arénu. Organizuju vsázení, najímám nové bojovníky... Však víš.
};

// **************************************************
//  Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

instance DIA_Scatty_JoinOC(C_INFO)
{
	npc = Grd_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_JoinOC_Condition;
	information = DIA_Scatty_JoinOC_Info;
	permanent = 0;
//	description = "I want to join the Camp. Can you help me?";
//	description = "Ich will mich dem Lager anschließen. Kannst du mir dabei helfen?";
	description = "Chci se přidat k táboru. Pomůžeš mi?";
};                       

func int DIA_Scatty_JoinOC_Condition()
{ 
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
func void DIA_Scatty_JoinOC_Info()
{
//	AI_Output(other,self,"DIA_Scatty_JoinOC_15_00"); //I want to join the Camp. Can you help me?
//	AI_Output(other,self,"DIA_Scatty_JoinOC_15_00"); //Ich will mich dem Lager anschließen. Kannst du mir dabei helfen?
	AI_Output(other,self,"DIA_Scatty_JoinOC_15_00"); //Chci se přidat k táboru. Pomůžeš mi?
//	AI_Output(self,other,"DIA_Scatty_JoinOC_01_01"); //I might be able to, if you manage to impress me.
//	AI_Output(self,other,"DIA_Scatty_JoinOC_01_01"); //Wenn du es schaffst, mich zu beeindrucken - vielleicht.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_01"); //Možná bych mohl, musel bys mě ale nějak přesvědčit.
//	AI_Output(self,other,"DIA_Scatty_JoinOC_01_02"); //Some of the best fighters from all three camps come here to compete against each other.
//	AI_Output(self,other,"DIA_Scatty_JoinOC_01_02"); //Einige der besten Kämpfer aller drei Lager kommen hier her um sich zu messen.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_02"); //Několik nejlepších bojovníků ze všech tří táborů sem chodí, aby si zde navzájem poměřilo síly.
//	AI_Output(self,other,"DIA_Scatty_JoinOC_01_03"); //Challenge one of them to a fight. I'll watch you, and if you're good maybe I'll think about it.
//	AI_Output(self,other,"DIA_Scatty_JoinOC_01_03"); //Fordere einen von ihnen heraus und kämpfe gegen ihn. Je nachdem, wie gut du dich schlägst, wird mein Urteil über dich ausfallen.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_03"); //Vyzvi někoho z nich na souboj. Budu tě sledovat a když budeš dobrý, zamyslím se nad tím.

	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; Kirgo = Hlp_GetNpc(Grd_251_Kirgo); Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE; Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim; Kharim = Hlp_GetNpc(Sld_729_Kharim); Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE; Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis; GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis); GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE; GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;

//	B_LogEntry(CH1_JoinOC,"Scatty, the master of the arena, will be impressed if I challenge one of the fighters.");
//	B_LogEntry(CH1_JoinOC,"Scatty der Arenameister wird von mir beeindruckt sein, wenn ich einen der Kämpfer fordere.");
	B_LogEntry(CH1_JoinOC,"Scatty, mistr arény, ocení, když vyzvu jednoho z bojovníků.");
};

// **************************************************
//  KIRGO SUCCESS
// **************************************************

instance DIA_Scatty_KirgoSuccess(C_INFO)
{
	npc = Grd_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KirgoSuccess_Condition;
	information = DIA_Scatty_KirgoSuccess_Info;
	permanent = 0;
//	description = "I fought Kirgo!";
//	description = "Ich habe gegen Kirgo gekämpft!";
	description = "Bojoval jsem s Kirgem!";
};                       

func int DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; Kirgo = Hlp_GetNpc(Grd_251_Kirgo); 

	if ((Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ((Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; Kirgo = Hlp_GetNpc(Grd_251_Kirgo); 

//	AI_Output(other,self,"DIA_Scatty_KirgoSuccess_15_00"); //I fought Kirgo!
//	AI_Output(other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Ich habe gegen Kirgo gekämpft!
	AI_Output(other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Bojoval jsem s Kirgem!
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
//		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Yeah, and you lost!
//		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Und du hast dich besiegen lassen!
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Jistě, a prohrál jsi.
//		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Surely you don't expect me to be impressed by that...
//		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Du erwartest hoffentlich nicht, dass ich durch dein Versagen beeindruckt bin ...
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Určitě si nemyslíš, že mě tímhle přesvědčíš...
		Scatty_ChargeKirgo = LOG_FAILED;

//		B_LogEntry(CH1_JoinOC,"The fact that Kirgo has defeated me didn't impress Scatty at all.");
//		B_LogEntry(CH1_JoinOC,"Meinem Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.");
		B_LogEntry(CH1_JoinOC,"Skutečnost, že mě Kirgo porazil, už na Scattyho takový dojem neudělala.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
//		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_03"); //And you defeated him! That's not bad for a beginner like you! I'm impressed!
//		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_03"); //Und du hast ihn geschafft! Nicht schlecht für einen Anfänger wie dich! Ich bin beeindruckt!
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_03"); //A porazil jsi ho! To není na začátečníka, jako jsi ty, špatné! Přesvědčil jsi mě!
		Scatty_ChargeKirgo = LOG_SUCCESS;

//		B_LogEntry(CH1_JoinOC,"Scatty was impressed by my fight against Kirgo.");
//		B_LogEntry(CH1_JoinOC,"Scatty ist beeindruckt von meinem Kampf gegen Kirgo.");
		B_LogEntry(CH1_JoinOC,"Scatty byl zaujat mým bojem proti Kirgovi.");
		B_GiveXP(XP_kirgovictory);
	};
};

// **************************************************
//  KHARIM SUCCESS
// **************************************************

instance DIA_Scatty_KHARIMSuccess(C_INFO)
{
	npc = Grd_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KHARIMSuccess_Condition;
	information = DIA_Scatty_KHARIMSuccess_Info;
	permanent = 0;
//	description = "I challenged Kharim!";
//	description = "Ich bin gegen Kharim angetreten!";
	description = "Vyzval jsem  Kharima!";
};                       

func int DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; KHARIM = Hlp_GetNpc(Sld_729_Kharim); 

	if ((Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ((KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; KHARIM = Hlp_GetNpc(Sld_729_Kharim); 

//	AI_Output(other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //I challenged Kharim!
//	AI_Output(other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Ich bin gegen Kharim angetreten!
	AI_Output(other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Vyzval jsem  Kharima!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
//		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //And boy, did he whack you!
//		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //Er hat dir ganz schön in den Arsch getreten.
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //A ten tě zmlátil, hochu!
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
//			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Still, you chose the right opponent! I just can't stand those bastards from the New Camp.
//			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Trotzdem hast du dir den richtigen Gegner gewählt! Ich kann diese Bastarde aus dem Neuen Lager nicht ausstehen.
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Vybral sis vhodného protivníka! Ty bastardy z Nového tábora nemůžu vystát.
//			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Seems like you feel the same way - you're just the kind of guy we need!
//			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Scheint dir ja genauso zu gehen - so jemanden können wir hier brauchen!
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Vypadá to, že to vidíš podobně - jsi přesně ten typ chlapa, jaký potřebujeme!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
//		B_LogEntry(CH1_JoinOC,"I've been beaten by Kharim! Scatty liked my courage, but not my fighting.");
//		B_LogEntry(CH1_JoinOC,"Ich bin Kharim unterlegen! Mein Mut hat Scatty gefallen, aber meine Kampffähigkeiten nicht.");
		B_LogEntry(CH1_JoinOC,"Kharim mě zbil! Scattymu se líbila moje odvaha, ne však můj boj.");

	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
//		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //And you knocked him down! I have to admit that wasn't bad going. He's always been known as one of the toughest fighters.
//		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //Und du hast ihn umgehauen! Ich muss schon sagen, nicht schlecht. Er war immer einer der besten Kämpfer hier.
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //A srazil jsi ho! Musím uznat, že to nebylo špatné. Vždycky byl jedním z nejpovažovanějších bojovníků.
//		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //I'm deeply impressed!
//		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Du hast mich schwer beeindruckt!
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Tohle na mě opravdu udělalo dojem!
		Scatty_ChargeKHARIM = LOG_SUCCESS;

//		B_LogEntry(CH1_JoinOC,"I've given it to Kharim! Scatty was impressed.");
//		B_LogEntry(CH1_JoinOC,"Ich habe es Kharim gezeigt! Scatty hat gestaunt.");
		B_LogEntry(CH1_JoinOC,"Nandal jsem to Kharimovi! Scatty byl dojatý.");
		B_GiveXP(XP_kharimvictory);
	};
};

// **************************************************
//  Warum andere Lager Kämpfer
// **************************************************

instance DIA_Scatty_OtherCamps(C_INFO)
{
	npc = Grd_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_OtherCamps_Condition;
	information = DIA_Scatty_OtherCamps_Info;
	permanent = 0;
//	description = "Why do you let the people from the other camps fight here?";
//	description = "Wieso lasst ihr die Leute aus den anderen Lagern hier kämpfen?";
	description = "Proč necháváš lidi z jiných táborů, aby se tady bili?";
};                       

func int DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

func void DIA_Scatty_OtherCamps_Info()
{
//	AI_Output(other,self,"DIA_Scatty_OtherCamps_15_00"); //I thought that the Old Camp and the New Camp didn't get on - so why d'you let their people fight here?
//	AI_Output(other,self,"DIA_Scatty_OtherCamps_15_00"); //Ich dachte, das Alte und das Neue Lager verstehen sich nicht besonders gut - wieso lasst ihr ihre Leute hier kämpfen?
	AI_Output(other,self,"DIA_Scatty_OtherCamps_15_00"); //Myslel jsem, že Starý a Nový tábor spolu nevycházejí dobře - tak proč tady necháváš jejich lidi bojovat?
//	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_01"); //It's simple: There's fights here once a week, and the diggers always like to see one of the rogues from the New Camp get flattened.
//	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_01"); //Ganz einfach: Wenn es hier einmal die Woche einen Kampf gibt, sehen es die Buddler am liebsten, wenn einer der Banditen aus dem Neuen Lager was aufs Maul bekommt.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_01"); //To je jednoduché - odehrávají se tady jednou týdně souboje a kopáči pokaždé rádi vidí, když je některý z hrdlořezů z Nového tábora rozdrcen.
//	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_02"); //If one of them fights, there's more bets - and that's good for business!
//	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_02"); //Wenn einer von denen kämpft, wird mehr gewettet - das ist gut!
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_02"); //Pokud bojuje jeden z nich, pak se uzavře více sázek - a to je skvělé pro obchod!
//	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_03"); //Personally, I can't stand the swines from the New Camp - but business is business...
//	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_03"); //Ich persönlich kann die Schweine aus dem Neuen Lager ja nicht ausstehen - aber Geschäft ist nun mal Geschäft ...
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_03"); //Mezi námi, já ty grázly z Nového tábora nemůžu vystát - ale obchod je obchod.
};

// **************************************************
// Will Wetten
// **************************************************

instance DIA_Scatty_WannaBet(C_INFO)
{
	npc = Grd_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaBet_Condition;
	information = DIA_Scatty_WannaBet_Info;
	permanent = 1;
//	description = "I want to place a bet.";
//	description = "Ich will wetten!";
	description = "Chci uzavřít sázku.";
};                       

func int DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

func void DIA_Scatty_WannaBet_Info()
{
//	AI_Output(other,self,"DIA_Scatty_WannaBet_15_00"); //I want to place a bet.
//	AI_Output(other,self,"DIA_Scatty_WannaBet_15_00"); //Ich will wetten.
	AI_Output(other,self,"DIA_Scatty_WannaBet_15_00"); //Chci uzavřít sázku.
//	AI_Output(self,other,"DIA_Scatty_WannaBet_01_01"); //But there's no fight on.
//	AI_Output(self,other,"DIA_Scatty_WannaBet_01_01"); //Aber im Moment findet kein Kampf statt.
	AI_Output(self,other,"DIA_Scatty_WannaBet_01_01"); //Teď ale není žádný souboj.
//	AI_Output(self,other,"DIA_Scatty_WannaBet_01_02"); //The next fight's due in a couple of days. There'll be an announcement.
//	AI_Output(self,other,"DIA_Scatty_WannaBet_01_02"); //Der nächste Kampf ist in ein paar Tagen - er wird vorher angekündigt.
	AI_Output(self,other,"DIA_Scatty_WannaBet_01_02"); //Příští boje budou za několik dní. Bude to vyhlášeno.

};

// **************************************************
// Will Kämpfen
// **************************************************

instance DIA_Scatty_WannaFight(C_INFO)
{
	npc = Grd_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaFight_Condition;
	information = DIA_Scatty_WannaFight_Info;
	permanent = 1;
//	description = "I want to fight in the arena!";
//	description = "Ich will in der Arena kämpfen!";
	description = "Chci bojovat v aréně!";
};                       

func int DIA_Scatty_WannaFight_Condition()
{
// if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
// {
// return 1;
// };
};

func void DIA_Scatty_WannaFight_Info()
{
//	AI_Output(other,self,"DIA_Scatty_WannaFight_15_00"); //I want to fight in the arena!
//	AI_Output(other,self,"DIA_Scatty_WannaFight_15_00"); //Ich will in der Arena kämpfen!
	AI_Output(other,self,"DIA_Scatty_WannaFight_15_00"); //Chci bojovat v aréně!
//	AI_Output(self,other,"DIA_Scatty_WannaFight_01_01"); //I can't let you fight until you've joined one of the camps!
//	AI_Output(self,other,"DIA_Scatty_WannaFight_01_01"); //Bevor du nicht einem der Lager angehörst, werde ich dich nicht kämpfen lassen!
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_01"); //Nemůžu tě nechat bojovat, dokud se nepřipojíš k jednomu z táborů!
//	AI_Output(self,other,"DIA_Scatty_WannaFight_01_02"); //Nobody wants to see an independent fighter!
//	AI_Output(self,other,"DIA_Scatty_WannaFight_01_02"); //Einen unabhängigen Kämpfer will hier keiner sehen!
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_02"); //Nikoho nezajímají nezávislí bojovníci!
};

// **************************************************
// TRAIN
// **************************************************

instance DIA_Scatty_TRAIN(C_INFO)
{
	npc = Grd_210_Scatty;
	nr = 10;
	condition = DIA_Scatty_TRAIN_Condition;
	information = DIA_Scatty_TRAIN_Info;
	permanent = 1;
//	description = "Do you train fighters at all?";
//	description = "Trainierst du auch Kämpfer?";
	description = "Cvičíš vůbec bojovníky?";
};                       

func int DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

func void DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
//	B_LogEntry(GE_TeacherOC,"Scatty, the master of the arena, can teach me to fight with ONE-HANDED WEAPONS.");
//	B_LogEntry(GE_TeacherOC,"Scatty der Arenameister kann mich im Kampf mit EINHÄNDERN ausbilden.");
	B_LogEntry(GE_TeacherOC,"Scatty, mistr arény, mě může naučit bojovat s JEDNORUČNÍMI ZBRANĚMI.");
	log_scattytrain = TRUE;
	};
//	AI_Output(other,self,"DIA_Scatty_TRAIN_15_00"); //Do you train fighters at all?
//	AI_Output(other,self,"DIA_Scatty_TRAIN_15_00"); //Trainierst du auch Kämpfer?
	AI_Output(other,self,"DIA_Scatty_TRAIN_15_00"); //Cvičíš vůbec bojovníky?
//	AI_Output(self,other,"DIA_Scatty_TRAIN_01_01"); //Yeah, but not just for fun. If you want me to train you, you'll have to pay for it.
//	AI_Output(self,other,"DIA_Scatty_TRAIN_01_01"); //Schon, aber nicht zum Spaß. Wenn ich dich trainieren soll, musst du dafür zahlen.
	AI_Output(self,other,"DIA_Scatty_TRAIN_01_01"); //Jistě, ale ne pro zábavu. Jestli chceš, abych tě cvičil, musíš mi za to zaplatit.

	Info_ClearChoices(DIA_Scatty_TRAIN);
//	Info_AddChoice(DIA_Scatty_TRAIN,"DIALOG_BACK		",DIA_Scatty_TRAIN_BACK);
	Info_AddChoice(DIA_Scatty_TRAIN,DIALOG_BACK ,DIA_Scatty_TRAIN_BACK);
	if (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1) 
	{
//		Info_AddChoice(DIA_Scatty_TRAIN,"B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150)	",DIA_Scatty_TRAIN_2h);
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150),DIA_Scatty_TRAIN_2h);
	};
	if (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0) 
	{
//		Info_AddChoice(DIA_Scatty_TRAIN,"B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50)	",DIA_Scatty_TRAIN_1h);
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50),DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices(DIA_Scatty_TRAIN);
};

func void DIA_Scatty_TRAIN_1h()
{
//	AI_Output(other,self,"DIA_Scatty_TRAIN_1h_15_00"); //I want to improve my handling of one-handed weapons.
//	AI_Output(other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Ich will besser mit Einhandwaffen umgehen können.
	AI_Output(other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Chci se zlepšit v ovládání jednoručního meče.

	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other,NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_01"); //That's a good decision! Before you can improve your technique, you'll have to learn how to hold the weapon right.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_01"); //Gute Entscheidung! Um deine Technik zu verbessern, musst du erst einmal lernen, deine Waffe richtig zu halten.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_01"); //To je dobré rozhodnutí! Ještě než se začneš učit techniku, musíš se naučit správně držet zbraň.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Beginners often tend to hold one-handed weapons with both hands. Now, don't even start getting into that habit, it'll do you no good.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Anfänger neigen dazu, Einhandwaffen mit beiden Händen zu halten. Mit so was fängst du am besten gar nicht erst an, das behindert dich nur.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Začátečníci obyčejně mívají snahu držet jednoruční meč oběma rukama. Tímto způsobem rozhodně nezačínej, to není dobré.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Hold the weapon with one hand, blade up, and keep swinging it.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Halt die Waffe mit einer Hand, Klinge nach oben, und dann immer schön schwingen lassen.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Drž zbraň v jedné ruce, čepelí vzhůru a šermuj s ní.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_04"); //You have to learn to harmonize your weapon's swing with your own movements. That'll make you faster in the attack.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Du musst lernen, den Schwung deiner Waffe mit deinen Bewegungen in Einklang zu bringen, dann kannst du schneller zuschlagen.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Musíš se naučit sladit pohyb zbraně s pohybem svého těla. Tak budeš při útoku rychlejší.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_05"); //If you keep in mind what I've taught you, your fights will be more elegant and a lot faster in future.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Wenn du dich an meine Anweisungen hältst, wirst du in Zukunft eleganter und vor allem schneller kämpfen.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Když si zapamatuješ, co jsem tě naučil, tak bude tvůj boj v budoucnu elegantnější a rychlejší.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Oh yeah, one more thing: Some hits cause more damage than others! As a beginner, you don't stand much of a chance of making critical hits.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Ach und noch was: Manche Treffer richten mehr Schaden an als andere! Als Anfänger hast du nur eine geringe Chance, solche kritischen Treffer zu landen.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Ovšem, ještě jednu věc: Některé údery způsobí větší škodu než ostatní. Jako začátečníkovi se ti nebude často dostávat šance rozhodujících úderů.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_07"); //But the further you progress, the better you get.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Aber je weiter du fortschreitest, desto besser wird diese Fähigkeit.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Ale časem budeš dělat pokroky a zlepšíš se.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
//		AI_Output(self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //You don't have enough ore!
//		AI_Output(self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Du hast nicht genug Erz!
		AI_Output(self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nemáš dost rudy!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
//	AI_Output(other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Teach me how to handle one-handed weapons more skillfully.
//	AI_Output(other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Bring mir bei, noch besser mit Einhandwaffen umzugehen.
	AI_Output(other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Nauč mě ještě lépe ovládat jednoruční meč.

	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other,NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
//			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Okay, you know the basics. Holding the weapon lower down will let you put more force into your first strike.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Na gut, die Grundkenntnisse hast du ja schon. Wenn du die Waffe gesenkt hältst, dann kannst du direkt mehr Wucht in deinen ersten Schlag legen.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Dobrá, základy znáš. Když podržíš zbraň níž, umožní ti to mnohem silněji vést první švih.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Use the swing, remember? Okay, now you need to use your body more. When you've struck twice, spin around. That'll confuse the opponent and put you in an excellent position.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Nutze den Schwung, weißt du noch? Gut, der nächste Schritt ist, du musst deinen Körper mehr einsetzen. Wenn du zweimal geschlagen hast, drehe dich um die eigene Achse, damit überraschst du den Gegner und bist in einer optimalen Position.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Musíš se hýbat, pamatuješ? Dobře, teď musíš ještě víc pracovat tělem. Po druhém úderu se otoč. To protivníka zmate a tobě to umožní zaujmout optimální pozici.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Then bring your blade across from right to left once more.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Dann ziehst du deine Klinge noch einmal quer von rechts nach links.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Ještě jednou veď čepel zprava doleva.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //And back to the front. Don't forget: practice makes perfect. So, get going and master the art of one-handed fighting.
//			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //Und wieder von vorne. Vergiss nicht, Übung macht den Meister. Also, geh jetzt und werde ein wahrer Meister des einhändigen Kampfes.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //A znovu kupředu. Nezapomeň: cvičením k dokonalosti. Takže vzhůru do toho, aby ses stal mistrem jednoručního meče.
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
//		AI_Output(self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Come back when you have enough ore!
//		AI_Output(self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Komm wieder, wenn du genug Erz hast!
		AI_Output(self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Vrať se, až budeš mít dost rudy!
	};
};
