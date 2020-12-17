// **************************************************
//						 EXIT 
// **************************************************

instance Stt_311_Fisk_Exit(C_INFO)
{
	npc = Stt_311_Fisk;
	nr = 999;
	condition = Stt_311_Fisk_Exit_Condition;
	information = Stt_311_Fisk_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Stt_311_Fisk_Exit_Condition()
{
	return 1;
};

func void Stt_311_Fisk_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//					First
// **************************************************

instance Stt_311_Fisk_First(C_INFO)
{
	npc = Stt_311_Fisk;
	nr = 1;
	condition = Stt_311_Fisk_First_Condition;
	information = Stt_311_Fisk_First_Info;
	permanent = 0;
	important = 1;
};                       

func int Stt_311_Fisk_First_Condition()
{
		return 1;
};

func void Stt_311_Fisk_First_Info()
{
//	AI_Output(self,other,"Stt_311_Fisk_First_12_00"); //Hey, man! I'm Fisk. I trade goods of all kinds. If you ever need anything - you're in the right place here.
//	AI_Output(self,other,"Stt_311_Fisk_First_12_00"); //Hey, Mann! Ich bin Fisk. Ich handele mit Waren aller Art. Wenn du jemals etwas brauchen solltest - bei mir bist du richtig.
	AI_Output(self,other,"Stt_311_Fisk_First_12_00"); //Hej, člověče. Já jsem Fisk. Obchoduju se zbožím všeho druhu. Jestli budeš kdykoliv a cokoliv potřebovat - u mě jsi na správném místě.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
//	B_LogEntry(GE_TraderOC,"Fisk, the Shadow, trades with all kinds of goods, especially WEAPONS. He's usually at the market."); 
//	B_LogEntry(GE_TraderOC,"Fisk, der Schatten handelt mit Waren aller Art, vor allem WAFFEN. Er hält sich am Marktplatz auf."); 
	B_LogEntry(GE_TraderOC,"Fisk, jeden ze Stínů, obchoduje se vším zbožím, zejména však se ZBRANĚMI. Obvykle se zdržuje na tržišti."); 

};

// **************************************************
//					Handeln
// **************************************************

instance Stt_311_Fisk_Trade(C_INFO)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_Trade_Condition;
	information = Stt_311_Fisk_Trade_Info;
	permanent = 1;
//	description = "Show me your goods.";
//	description = "Zeig mir deine Ware.";
	description = "Ukaž mi svoje zboží.";
	trade = 1;
};                       

func int Stt_311_Fisk_Trade_Condition()
{
	return 1;
};

func void Stt_311_Fisk_Trade_Info()
{
//	AI_Output(other,self,"Stt_311_Fisk_Trade_15_00"); //Show me your goods.
//	AI_Output(other,self,"Stt_311_Fisk_Trade_15_00"); //Zeig mir deine Ware.
	AI_Output(other,self,"Stt_311_Fisk_Trade_15_00"); //Ukaž mi svoje zboží.
};

instance Stt_311_Fisk_WhistlersSword(C_INFO)
{
	npc = Stt_311_Fisk;
	nr = 801;
	condition = Stt_311_Fisk_WhistlersSword_Condition;
	information = Stt_311_Fisk_WhistlersSword_Info;
	permanent = 1;
//	description = "I'd like to buy a sword - I'd like something more ornamental...";
//	description = "Ich will ein Schwert kaufen. Was mit Ornamenten wär schön.";
	description = "Chtěl bych koupit meč. Nějaký s ornamenty by byl hezký.";
};                       

func int Stt_311_Fisk_WhistlersSword_Condition()
{
	if ((Fisk_ForgetSword==FALSE) && (Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SwordSold == FALSE)  )
	{
		return 1;
	};
};

func void Stt_311_Fisk_WhistlersSword_Info()
{
//	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_15_00"); //I'd like to buy a sword. But not just a simple one. I'd like something more ornamental.
//	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_15_00"); //Ich will ein Schwert kaufen. Aber nicht so ein einfaches Ding. Was mit Ornamenten wär schön.
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_15_00"); //Chtěl bych koupit meč. Nějaký s ornamenty by byl hezký.
//	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_01"); //I have one you'll like. The Shadow who wanted to collect it won't be coming any more.
//	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_01"); //Ich hab' da eins, das dir gefallen könnte. Der Schatten, der es abholen sollte, kommt nicht mehr .
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_01"); //Mám tu jeden, který by se ti mohl líbit. Stín, který si ho měl vyzvednout, už nikdy nepříjde.
//	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_02"); //That'll be 110 ore. Interested?
//	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_02"); //Kostet 110 Erz. Interessiert?
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_02"); //Stojí 110 nugetů, máš zájem?
	Fisk_SCknows110 = TRUE;

	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
//	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Maybe later.",Stt_311_Fisk_WhistlersSword_BACK);
//	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Vielleicht später.",Stt_311_Fisk_WhistlersSword_BACK);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Možná později.",Stt_311_Fisk_WhistlersSword_BACK);
//	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"You wanted to sell it to Whistler for a hundred...",Stt_311_Fisk_WhistlersSword_Fault);
//	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Whistler wolltest du es für 100 verkaufen...",Stt_311_Fisk_WhistlersSword_Fault);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Whistlerovi jsi ho chtěl prodat za sto...",Stt_311_Fisk_WhistlersSword_Fault);
//	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Yes, I'll take it.",Stt_311_Fisk_WhistlersSword_TakeIt);
//	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Ja, ich nehme es.",Stt_311_Fisk_WhistlersSword_TakeIt);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Ano, vezmu si ho.",Stt_311_Fisk_WhistlersSword_TakeIt);
};

func void Stt_311_Fisk_WhistlersSword_BACK()
{
//	AI_Output(other,self,"Org_826_Mordrag_WhistlersSword_BACK_15_00"); //Maybe later.
//	AI_Output(other,self,"Org_826_Mordrag_WhistlersSword_BACK_15_00"); //Vielleicht später.
	AI_Output(other,self,"Org_826_Mordrag_WhistlersSword_BACK_15_00"); //Možná později.
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_Fault()
{
//	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_00"); //You wanted to sell it to Whistler for a hundred...
//	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_00"); //Whistler wolltest du es für hundert verkaufen...
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_00"); //Whistlerovi jsi ho chtěl prodat za sto...
//	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_01"); //Ah! Just wait... that's right, I nearly charged you too little! Of course I meant 500.
//	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_01"); //Ah! Warte mal ... Stimmt, da hätte ich dir ja fast zu wenig abgeknöpft! Ich meinte natürlich fünfhundert.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_01"); //Ach! Počkej... Pravda, málem jsem ti řekl moc málo! Myslel jsem samozřejmě 500.
//	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_02"); //Five hundred?
//	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_02"); //Fünfhundert?
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_02"); //Pět set?
//	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_03"); //Too little? You prefer 1000? Fine by me. Well, now that I think about it - I'd rather keep it!
//	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_03"); //Zu wenig? Tausend sind dir lieber? Auch gut. Ach, wenn ich's mir so recht überlege - ich glaube, ich behalte es einfach!
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_03"); //Příliš málo? Raději bys za 1000? Tím líp pro mě. Dobře, popřemýšlím o tom - raději si ho nechám!

	Fisk_ForgetSword = TRUE;
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_TakeIt()
{
//	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00"); //Yes, I'll take it.
//	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00"); //Ja, ich nehme es.
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00"); //Ano, vezmu si ho.

	if (Npc_HasItems(other,itminugget) >= 110)
	{
//		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01"); //You got a good deal here!
//		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01"); //Du hast ein gutes Geschäft gemacht!
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01"); //Udělal jsi dobrý obchod!
		B_GiveInvItems(other,self,itminugget,110);
		CreateInvItem(self,Whistlers_Schwert);
		B_GiveInvItems(self,other,Whistlers_Schwert,1);
		Info_ClearChoices(Stt_311_Fisk_WhistlersSword);

		Fisk_SwordSold = TRUE;
	}
	else
	{
//		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02"); //I fear you don't have enough ore. I'll hold the sword back for some time, but don't wait too long!
//		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02"); //Ich fürchte, du hast nicht genug Erz. Ich werde das Schwert noch 'ne Weile für dich zurückhalten, aber nimm dir nicht zu viel Zeit!
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02"); //Mám obavy, že nemáš dost rudy. Budu ti ten meč ještě nějaký čas držet, ale nebudu čekat moc dlouho!
	};
};

// **************************************************
//					Forget Sword
// **************************************************

instance Stt_311_Fisk_ForgetSword(C_INFO)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_ForgetSword_Condition;
	information = Stt_311_Fisk_ForgetSword_Info;
	permanent = 1;
//	description = "About Whistler's sword...";
//	description = "Wegen Whistlers Schwert...";
	description = "O Whistlerově meči...";
};                       

func int Stt_311_Fisk_ForgetSword_Condition()
{
	if (Fisk_ForgetSword==TRUE)
	{
		return 1;
	};
};

func void Stt_311_Fisk_ForgetSword_Info()
{
//	AI_Output(other,self,"Stt_311_Fisk_ForgetSword_15_00"); //Let's talk about Whistler's sword again.
//	AI_Output(other,self,"Stt_311_Fisk_ForgetSword_15_00"); //Lass uns noch mal über Whistlers Schwert reden.
	AI_Output(other,self,"Stt_311_Fisk_ForgetSword_15_00"); //Pojďme si ještě promluvit o tom Whistlerově meči.
//	AI_Output(self,other,"Stt_311_Fisk_ForgetSword_12_01"); //You can tell him that he'll never get his sword.
//	AI_Output(self,other,"Stt_311_Fisk_ForgetSword_12_01"); //Du kannst ihm sagen, er wird sein Schwert nie kriegen.
	AI_Output(self,other,"Stt_311_Fisk_ForgetSword_12_01"); //Můžeš mu říci, že svůj meč nikdy nedostane.
};

// **************************************************
//					MordragKO
// **************************************************
	var int Fisk_GetNewHehler;
// **************************************************

instance Stt_311_Fisk_MordragKO(C_INFO)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_MordragKO_Condition;
	information = Stt_311_Fisk_MordragKO_Info;
	permanent = 0;
	important = 1;
};                       

func int Stt_311_Fisk_MordragKO_Condition()
{
	if (MordragKO_HauAb == TRUE)  
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void Stt_311_Fisk_MordragKO_Info()
{
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_00"); //Hey, you!
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_00"); //Hey, du!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_00"); //Hej, ty!
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_01"); //Mordrag was one of my most important suppliers, you idiot!
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_01"); //Mordrag war einer meiner wichtigsten Lieferanten, du Schwachkopf!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_01"); //Mordrag byl jeden z mých nejdůležitějších dodavatelů, ty idiote!
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_02"); //If you want to join this camp it'll be very hard for you to get MY vote!
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_02"); //Wenn du hier im Lager aufgenommen werden willst, kriegst du MEINE Stimme jedenfalls nicht!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_02"); //Jestli se chceš přidat k našemu táboru, bude pro tebe velmi obtížné získat MŮJ hlas!

	Info_ClearChoices(Stt_311_Fisk_MordragKO);
//	Info_AddChoice(Stt_311_Fisk_MordragKO,"You're trading the Ore Barons' belongings! Thorus will be interested...",Stt_311_Fisk_MordragKO_Petze);
//	Info_AddChoice(Stt_311_Fisk_MordragKO,"Deine Ware gehört den Erzbaronen. Das wird Thorus sicher interessieren...",Stt_311_Fisk_MordragKO_Petze);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Obchoduješ s majetkem Rudobaronů! Thoruse to bude určitě zajímat...",Stt_311_Fisk_MordragKO_Petze);
//	Info_AddChoice(Stt_311_Fisk_MordragKO,"Relax! Maybe I can make up for it, can't I?",Stt_311_Fisk_MordragKO_Relax);
//	Info_AddChoice(Stt_311_Fisk_MordragKO,"Entspann dich! Die Sache läßt sich sicher wieder geradebiegen, oder?",Stt_311_Fisk_MordragKO_Relax);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Klid! Možná to můžu nějak napravit, ne?",Stt_311_Fisk_MordragKO_Relax);
//	Info_AddChoice(Stt_311_Fisk_MordragKO,"Then just kiss my ass!",Stt_311_Fisk_MordragKO_FuckOff);
//	Info_AddChoice(Stt_311_Fisk_MordragKO,"Dann leck mich doch einfach!",Stt_311_Fisk_MordragKO_FuckOff);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Pak mi polib zadek!",Stt_311_Fisk_MordragKO_FuckOff);
};

func void Stt_311_Fisk_MordragKO_Relax()
{
//	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_00"); //Relax! Maybe I can make up for it, can't I?
//	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_00"); //Entspann dich! Die Sache lässt sich sicher wieder geradebiegen, oder?
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_00"); //Klid! Možná to můžu nějak napravit, ne?
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_01"); //I wouldn't know how you're gonna do that. Unless you get me a new fence from the New Camp!
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_01"); //Ich wüsste nicht, wie du das wieder gutmachen kannst. Es sei denn, du schaffst mir einen neuen Hehler aus dem Neuen Lager ran!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_01"); //Nevím ale, jak bys to chtěl udělat. Ledaže bys mi našel nového překupníka z Nového tábora!
//	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_02"); //How am I supposed to find somebody like that?
//	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_02"); //Wie soll ich so jemanden finden?
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_02"); //Jak mám někoho takového najít?
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_03"); //I just told you, I don't believe that you'll ever be on good terms with me.
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_03"); //Ich sagte ja, ich glaube kaum, dass du bei mir noch mal gute Karten hast.
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_03"); //Jak jsem řekl, nevěřím, že bys to měl u mě někdy dobrý.

	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_RUNNING);
//	B_LogEntry(CH1_FiskNewDealer,"The tradesman Fisk at the market in the Old Camp wants me to find him a new fence, after I've beaten up Mordrag.");
//	B_LogEntry(CH1_FiskNewDealer,"Der Händler Fisk am Marktplatz des Alten Lagers verlangt, dass ich ihm einen neuen Hehler beschaffe, nachdem ich Mordrag vermöbelt habe.");
	B_LogEntry(CH1_FiskNewDealer,"Poté, co jsem vyhnal Mordraga, chce po mě obchodník Fisk z tržiště, abych mu našel nového překupníka.");

	Fisk_GetNewHehler = LOG_RUNNING;
};

func void Stt_311_Fisk_MordragKO_FuckOff()
{
//	AI_Output(other,self,"Stt_311_Fisk_MordragKO_FuckOff_15_00"); //Then just kiss my ass!
//	AI_Output(other,self,"Stt_311_Fisk_MordragKO_FuckOff_15_00"); //Dann leck mich doch einfach!
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_FuckOff_15_00"); //Pak mi polib zadek!
	Info_ClearChoices(Stt_311_Fisk_MordragKO);

	AI_StopProcessInfos(self);
};

func void Stt_311_Fisk_MordragKO_Petze()
{
//	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Petze_15_00"); //You're trading things which belong to the Ore Barons. Thorus will be interested in that...
//	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Petze_15_00"); //Du handelst mit Ware, die den Erzbaronen gehört. Das wird Thorus sicher interessieren ...
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Petze_15_00"); //Obchoduješ s majetkem Rudobaronů! Thoruse to bude určitě zajímat...
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Petze_12_01"); //Don't try it on, pal!
//	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Petze_12_01"); //So nicht, Junge!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Petze_12_01"); //Tak takhle ne, mladíku!
};

// **************************************************
//					New Hehler
// **************************************************

instance Stt_311_Fisk_HehlerSuccess(C_INFO)
{
	npc = Stt_311_Fisk;
	nr = 10;
	condition = Stt_311_Fisk_HehlerSuccess_Condition;
	information = Stt_311_Fisk_HehlerSuccess_Info;
	permanent = 0;
//	description = "I have somebody from the New Camp who wants to get into business...";
//	description = "Ich habe jemanden aus dem Neuen Lager, der mit dir handeln will.";
	description = "Mám někoho z Nového tábora, kdo by s tebou chtěl obchodovat.";
};                       

func int Stt_311_Fisk_HehlerSuccess_Condition()
{
	if ((Fisk_GetNewHehler==LOG_RUNNING) && (Npc_KnowsInfo(hero,Org_843_Sharky_Fisk)))  
	{
		return 1;
	};
};

func void Stt_311_Fisk_HehlerSuccess_Info()
{
//	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_00"); //I have somebody from the New Camp who wants to get into business with you.
//	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_00"); //Ich habe jemanden aus dem Neuen Lager, der mit dir handeln will.
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_00"); //Mám někoho z Nového tábora, kdo by chtěl s tebou obchodovat.
//	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_01"); //No! Who would've thought that. Looks like you're trying to get popular around here...
//	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_01"); //Nein! Wer hätte das gedacht. Du scheinst dich hier ja richtig beliebt machen zu wollen ...
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_01"); //Ne! Kdo by si to byl pomyslel. Vypadá to, že se tu pokoušíš být oblíbený...
//	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_02"); //Seems like you managed it, too! Who is it?
//	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_02"); //Das ist dir auch gelungen! Wer ist es?
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_02"); //A to se ti také povedlo! Kdo to je?
//	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_03"); //His name is Sharky.
//	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_03"); //Sein Name ist Sharky.
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_03"); //Jmenuje se Sharky.
//	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_04"); //Sharky? He's even worse than Mordrag.
//	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_04"); //Sharky?  Der ist ja noch schlimmer, als Mordrag jemals hätte sein können.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_04"); //Sharky? Je ještě horší než Mordrag.
//	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_05"); //About Diego... you don't need to worry any more.
//	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_05"); //Was Diego betrifft, brauchst du dir keine Sorgen mehr zu machen.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_05"); //Co se týče Diega... nemusíš už mít obavy.

	Fisk_GetNewHehler = LOG_SUCCESS;
	B_GiveXP(XP_fiskdealer);

	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_SUCCESS);
//	B_LogEntry(CH1_FiskNewDealer,"Fisk is content, because Sharky will take over Mordrag's business.");
//	B_LogEntry(CH1_FiskNewDealer,"Fisk is zufrieden ,denn Sharky wird Mordrags Geschäfte übernehmen.");
	B_LogEntry(CH1_FiskNewDealer,"Fisk je spokojený, protože Sharky převzal Mordragovy obchody.");
};
/*------------------------------------------------------------------------
							RÜSTUNG 
------------------------------------------------------------------------*/

instance Stt_311_Fisk_ARMOR(C_INFO)
{
	npc = Stt_311_Fisk;
	condition = Stt_311_Fisk_ARMOR_Condition;
	information = Stt_311_Fisk_ARMOR_Info;
	important = 0;
	permanent = 1;
//	description = "Have you got armor for me as well?"; 
//	description = "Hast du eine Rüstung für mich?"; 
	description = "Máš pro mě nějakou zbroj?"; 
};

func int Stt_311_Fisk_ARMOR_Condition()
{ 
	if (Kapitel < 2)
	&& (Npc_KnowsInfo(hero,Stt_311_Fisk_First))
	{
		return TRUE;
	};

};
func void Stt_311_Fisk_ARMOR_Info()
{
//	AI_Output(other,self,"Stt_311_Fisk_ARMOR_Info_15_01"); //Have you got armor for me as well?
//	AI_Output(other,self,"Stt_311_Fisk_ARMOR_Info_15_01"); //Hast du eine Rüstung für mich?
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_Info_15_01"); //Máš pro mě také zbroj?
//	AI_Output(self,other,"Stt_311_Fisk_ARMOR_Info_12_02"); //Well, I'm sure that I can satisfy you.
//	AI_Output(self,other,"Stt_311_Fisk_ARMOR_Info_12_02"); //Nun, ich bin sicher, dass ich dich zufrieden stellen kann.
	AI_Output(self,other,"Stt_311_Fisk_ARMOR_Info_12_02"); //Ano, určitě budeš spokojený.
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
	Info_Addchoice (Stt_311_Fisk_ARMOR,DIALOG_BACK,Stt_311_Fisk_ARMOR_BACK);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskLightDiggers,VALUE_VLK_ARMOR_L),Stt_311_Fisk_ARMOR_L);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskDiggers,VALUE_VLK_ARMOR_M),Stt_311_Fisk_ARMOR_M);

};  

func void Stt_311_Fisk_ARMOR_BACK()
{
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
};

func void Stt_311_Fisk_ARMOR_L()
{
//	AI_Output(other,self,"Stt_311_Fisk_ARMOR_L_Info_15_01"); //Give me the light digger's trousers.
//	AI_Output(other,self,"Stt_311_Fisk_ARMOR_L_Info_15_01"); //Gib mir die leichte Buddlerhose.
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_L_Info_15_01"); //Dej mi lehké kopáčské kalhoty.

	if (Npc_HasItems(hero,ItMiNugget) <  VALUE_VLK_ARMOR_L)
	{
//		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_02"); //Come back as soon as you have enough ore!
//		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_02"); //Komm wieder, wenn du genug Erz hast!
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_02"); //Vrať se, až budeš mít dost rudy!
	}
	else
	{
//		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_03"); //A good choice!
//		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_03"); //Eine gute Wahl!
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_03"); //Dobrá volba!
		B_GiveInvItems(hero,self,ItMinugget, VALUE_VLK_ARMOR_L);
		CreateInvItem(self,VLK_ARMOR_L);
		B_GiveInvItems(self,hero,VLK_ARMOR_L,1);
	};
};

func void Stt_311_Fisk_ARMOR_M()
{
//	AI_Output(other,self,"Stt_311_Fisk_ARMOR_M_Info_15_01"); //Give me the digger's trousers.
//	AI_Output(other,self,"Stt_311_Fisk_ARMOR_M_Info_15_01"); //Gib mir die Buddlerhose.
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_M_Info_15_01"); //Dej mi kopáčské kalhoty.
	if (Npc_HasItems(hero,ItMiNugget) <  VALUE_VLK_ARMOR_M)
	{
//		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_02"); //Come back as soon as you have enough ore!
//		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_02"); //Komm wieder, wenn du genug Erz hast!
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_02"); //Vrať se, až budeš mít dost rudy!
	}
	else
	{
//		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_03"); //A good choice!
//		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_03"); //Eine gute Wahl!
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_03"); //Dobrá volba!
		B_GiveInvItems(hero,self,ItMinugget, VALUE_VLK_ARMOR_M);
		CreateInvItem(self,VLK_ARMOR_M);
		B_GiveInvItems(self,hero,VLK_ARMOR_M,1);
	};
};

