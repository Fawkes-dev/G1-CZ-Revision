// ************************ EXIT **************************

instance Grd_263_Asghan_Exit(C_INFO)
{
	npc = Grd_263_Asghan;
	nr = 999;
	condition = Grd_263_Asghan_Exit_Condition;
	information = Grd_263_Asghan_Exit_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Grd_263_Asghan_Exit_Condition()
{
	return 1;
};

func void Grd_263_Asghan_Exit_Info()
{
	AI_StopProcessInfos(self);
};
// ***************** Infos *****************************

instance Grd_263_Asghan_NEST(C_INFO)
{
	npc = Grd_263_Asghan;
	condition = Grd_263_Asghan_NEST_Condition;
	information = Grd_263_Asghan_NEST_Info;
	important = 0;
	permanent = 0;
//	description = "There must be a nest of minecrawlers here somewhere."; 
//	description = "Es muss hier irgendwo ein Nest der Minecrawler geben"; 
	description = "Tady někde musí být hnízdo důlních červů."; 
};

func int Grd_263_Asghan_NEST_Condition()
{ 
	if (CorKalom_BringMCQBalls == LOG_RUNNING) 
	{
		return 1;
	};

};
func void Grd_263_Asghan_NEST_Info()
{
//	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_01"); //There must be a nest of minecrawlers here somewhere.
//	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_01"); //Es muss hier irgendwo ein Nest der Minecrawler geben.
	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_01"); //Tady někde musí být hnízdo důlních červů.
//	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_02"); //The whole bloody mountain is just one big crawler nest!
//	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_02"); //Dieser ganze verdammte Berg ist ein einziges Nest.
	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_02"); //Celá tahle zpropadená hora je hnízdo červů!
//	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_03"); //Why have you closed this shaft?
//	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_03"); //Warum ist dieser Schacht versperrt?
	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_03"); //Proč je ta šachta zavřená?
//	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_04"); //It didn't matter how many crawlers we killed, more and more just kept coming out.
//	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_04"); //Egal wie viele Crawler wir getötet haben, von dort kamen immer wieder mehr.
	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_04"); //Nemám představu, kolik červů jsme zabili, ale pořád se objevují další a další.
//	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_05"); //Sounds like there must be a nest somewhere near. Let me open the gate!
//	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_05"); //Dann wird dort irgendwo ein Nest sein. Lass mich das Tor öffnen!
	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_05"); //Vypadá to, že tady někde musí být hnízdo. Nech mě otevřít ty vrata!
//	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_06"); //No! This gate can only be opened with Ian's permission! Nothing will be done before.
//	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_06"); //Nein! Erst wenn Ian die Erlaubnis gibt, wird dieses Tor geöffnet! Vorher geht gar nichts. 
	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_06"); //Ne! Tyhle vrata se smí otevírat jen s Ianovým svolením! Bez něj se nic nesmí udělat!

//	B_LogEntry(CH2_MCEggs,"Asghan, the boss of the mine guards, won't open the gate. He wants Ian's permission.");
//	B_LogEntry(CH2_MCEggs,"Asghan, der Chef der Minengardisten weigert sich das Tor zu öffnen. Er will erst die Erlaubnis von Ian haben.");
	B_LogEntry(CH2_MCEggs,"Asghan, velitel důlní stráže, nechce otevřít bránu. Chce vidět Ianovo povolení.");

};
/*------------------------------------------------------------------------
							ERLAUBNIS VON IAN GEHOLT 
------------------------------------------------------------------------*/

instance Grd_263_Asghan_OPEN(C_INFO)
{
	npc = Grd_263_Asghan;
	condition = Grd_263_Asghan_OPEN_Condition;
	information = Grd_263_Asghan_OPEN_Info;
	important = 0;
	permanent = 0;
//	description = "Hey Asghan, you may open the gate now!"; 
//	description = "Hey Asghan, du kannst das Tor öffnen"; 
	description = "Hej, Asghane, máš otevřít ty vrata!"; 
};

func int Grd_263_Asghan_OPEN_Condition()
{
	if Npc_KnowsInfo(hero,Grd_263_Asghan_NEST)
	&& Npc_KnowsInfo(hero,STT_301_IAN_GEAR_SUC)
	{
		return TRUE;
	};
};

func void Grd_263_Asghan_OPEN_Info()
{
//	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hey Asghan, you may open the gate now!
//	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hey Asghan, du kannst das Tor öffnen!
	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hej, Asghane, máš otevřít ty vrata!
//	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_02"); //I've already told you: only if Ian...
//	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_02"); //Ich habe dir schon einmal gesagt, nur wenn Ian...
	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_02"); //Už jsem ti jednou řekl, jen s Ianovým...
//	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghan... Everything's going to be fine... and best regards from Ian.
//	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghan...Alles wird gut... und einen schönen Gruß von Ian.
	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghane... Všechno jde dobře... a Ian tě pozdravuje.
//	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_04"); //Well then, if Ian is responsible for this... but only under one condition!
//	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_04"); //Na gut, wenn Ian die Verantwortung übernimmt... aber nur unter einer Bedingung!
	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_04"); //Jestli je Ian za to zodpovědný.. ale pod jednou podmínkou!
//	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_05"); //What condition is that?
//	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_05"); //Spuck's aus, was für eine Bedingung?
	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_05"); //Jakou podmínkou?
//	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_06"); //Just get me two or three templars for support, I don't want to be here on my own when the crawlers come out of the shaft!
//	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_06"); //Besorge erst mal zwei bis drei Templer zur Verstärkung, ich will nicht alleine hier stehen, falls die Crawler aus dem Schacht kommen!
	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_06"); //Dáš mi dva nebo tři templáře na pomoc, protože tady nechci být sám, až ze šachty vylezou červi!

//	B_LogEntry(CH2_MCEggs,"Although Ian has given me permission, Asghan won't open the gate until I've united some templars as reinforcements in front of the gate.");
//	B_LogEntry(CH2_MCEggs,"Trotz Ian's Einwilligung will Asghan das Tor erst öffnen, wenn ich einige Templer als Verstärkung vor dem Tor versammelt habe.");
	B_LogEntry(CH2_MCEggs,"Třebaže mi Ian dal povolení, Asghan nechce otevřít bránu, dokud nepřivedu nějaké templáře jako posilu před vchod.");

	AI_StopProcessInfos(self);
};  

// ***************** Infos *****************************
instance Grd_263_Asghan_OPEN_NOW(C_INFO)
{
	npc = Grd_263_Asghan;
	condition = Grd_263_Asghan_OPEN_NOW_Condition;
	information = Grd_263_Asghan_OPEN_NOW_Info;
	important = 0;
	permanent = 0;
//	description = "All preparations have been made. The gate can now be opened!"; 
//	description = "Alle Vorbereitungen sind getroffen. Das Tor kann geöffnet werden!"; 
	description = "Všechny přípravy jsou hotovy. Vrata se teď můžou otevřít!"; 
};

func int Grd_263_Asghan_OPEN_NOW_Condition()
{ 
	if (Npc_KnowsInfo(hero,Tpl_1400_GorNaBar_SUGGEST )) && (Npc_KnowsInfo(hero,Tpl_1401_GorNaKosh_SUGGEST))
	|| (Npc_KnowsInfo(hero,Tpl_1401_GorNaKosh_SUGGEST)) && (Npc_KnowsInfo(hero,Tpl_1433_GorNaVid_HEALTH_SUC ))
	|| (Npc_KnowsInfo(hero,Tpl_1433_GorNaVid_HEALTH_SUC)) && (Npc_KnowsInfo(hero,Tpl_1400_GorNaBar_SUGGEST ))   
	{
		return TRUE;
	};

};
func void Grd_263_Asghan_OPEN_NOW_Info()
{
//	AI_Output(other,self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //All preparations have been made. The gate can now be opened!
//	AI_Output(other,self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Alle Vorbereitungen sind getroffen. Das Tor kann geöffnet werden!
	AI_Output(other,self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Všechny přípravy jsou hotovy. Vrata se teď můžou otevřít!
//	AI_Output(self,other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Okay then, open the shaft now. Let the show begin.
//	AI_Output(self,other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //In Ordnung, dann öffne du den Schacht. Der Tanz kann beginnen.
	AI_Output(self,other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Tak dobrá, otevřeme je. Ať to teda začne.

	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"opengate");

	B_GiveXP(XP_OpenAsghansGate);
//	B_LogEntry(CH2_MCEggs,"I managed to unite sufficient templars in front of Asghan's gate. What will be awaiting us in the darkness behind the gate?");
//	B_LogEntry(CH2_MCEggs,"Ich habe genug Templer vor Asghans Tor versammeln können. Was uns wohl in der Dunkelheit hinter dem Tor erwartet?");
	B_LogEntry(CH2_MCEggs,"Podařilo se mi před Asghanovu bránu přivést dostatečný počet templářů. Co nás čeká v temnotách za branou?");

	AI_StopProcessInfos(self);
};    

// ***************** Nest gefunden *****************************
instance Grd_263_Asghan_LAIRFOUND(C_INFO)
{
	npc = Grd_263_Asghan;
	condition = Grd_263_Asghan_LAIRFOUND_Condition;
	information = Grd_263_Asghan_LAIRFOUND_Info;
	important = 0;
	permanent = 0;
//	description = "The minecrawlers shouldn't be a threat anymore!"; 
//	description = "Die Bedrohung durch die Minecrawler dürfte beendet sein!"; 
	description = "Důlní červi nebudou už nikdy hrozbou!"; 
};

func int Grd_263_Asghan_LAIRFOUND_Condition()
{ 
	if (Npc_HasItems(hero,ItAt_Crawlerqueen)>=3)   
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};

};
func void Grd_263_Asghan_LAIRFOUND_Info()
{
//	AI_Output(other,self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //The minecrawlers shouldn't be a threat anymore!
//	AI_Output(other,self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //Die Bedrohung durch die Minecrawler dürfte beendet sein!
	AI_Output(other,self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //Důlní červi nebudou už nikdy hrozbou!
//	AI_Output(self,other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //That's good news. I'll just send a messenger to Thorus!
//	AI_Output(self,other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //Das ist eine gute Nachricht. Werde gleich einen Boten zu Thorus schicken!
	AI_Output(self,other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //Dobré zprávy. Pošlu k Thorusovi posla!

	AI_StopProcessInfos(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz läuft noch nicht 
------------------------------------------------------------------------*/

instance Grd_263_Asghan_SMALLTALK(C_INFO)
{
	npc = Grd_263_Asghan;
	condition = Grd_263_Asghan_SMALLTALK_Condition;
	information = Grd_263_Asghan_SMALLTALK_Info;
	important = 0;
	permanent = 0;
//	description = "How are you doing?"; 
//	description = "Wie siehts aus?"; 
	description = "Jak to jde?"; 
};

func int Grd_263_Asghan_SMALLTALK_Condition()
{ 
	if (CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Grd_263_Asghan_SMALLTALK_Info()
{
//	AI_Output(other,self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Hey, how are you doing?
//	AI_Output(other,self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Hey, wie siehts aus?
	AI_Output(other,self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Hej, jak se máš?
//	AI_Output(self,other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Okay... so long as nobody don't get the idea of opening this gate, I don't need to hurt anybody, either.
//	AI_Output(self,other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Noch gut... Solange Niemand auf die Idee kommt, dieses Tor öffnen zu wollen, muss ich auch niemandem wehtun.
	AI_Output(self,other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Dobrý... dokud nikdo nedostane nápad otevřít ty vrata, nebudu mít potřebu někomu něco udělat.
//	AI_Output(other,self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //What's so special about this gate?
//	AI_Output(other,self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //Was ist denn so besonderes hinter dem Tor?
	AI_Output(other,self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //Co je na těch vratech tak zvláštního?
//	AI_Output(self,other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Minecrawlers. Big, bad minecrawlers. Lots and lots and lots of them.
//	AI_Output(self,other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Minecrawler. Große böse Minecrawler. Und zwar sehr...sehr...sehr viele.
	AI_Output(self,other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Důlní červi. Velcí zlí červi. Hromady, hromady a hromady červů.
};  

