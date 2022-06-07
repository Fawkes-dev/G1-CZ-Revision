// **************************************
//					EXIT
// **************************************

instance DIA_Skip_Exit(C_INFO)
{
	npc = GRD_211_Skip;
	nr = 999;
	condition = DIA_Skip_Exit_Condition;
	information = DIA_Skip_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Skip_Exit_Condition()
{
	return 1;
};

func void DIA_Skip_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************
//				First
// **************************************
	var int Skip_TradeFree;
// **************************************

instance DIA_Skip_First(C_INFO)
{
	npc = GRD_211_Skip;
	nr = 1;
	condition = DIA_Skip_First_Condition;
	information = DIA_Skip_First_Info;
	important = 0;
	permanent = 0;
//	description = "What do you do here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};

func int DIA_Skip_First_Condition()
{
	//#NEEDS_ATTENTION - dialog dostupny pre Magov Ohna? GIL_KDF
	if (!((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF)))
	{
		return 1;
	};

	return 0;
};

func void DIA_Skip_First_Info()
{
//	AI_Output(other,self,"DIA_Skip_First_15_00"); //What do you do here?
//	AI_Output(other,self,"DIA_Skip_First_15_00"); //Was machst du hier?
	AI_Output(other,self,"DIA_Skip_First_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_Skip_First_12_01"); //I take care of the guards' weapons.
//	AI_Output(self,other,"DIA_Skip_First_12_01"); //Ich kümmere mich um die Waffen der Gardisten.
	AI_Output(self,other,"DIA_Skip_First_12_01"); //Starám se o zbraně stráží.
//	AI_Output(other,self,"DIA_Skip_First_15_02"); //D'you sell weapons?
//	AI_Output(other,self,"DIA_Skip_First_15_02"); //Verkaufst du Waffen?
	AI_Output(other,self,"DIA_Skip_First_15_02"); //Prodáváš zbraně?
//	AI_Output(self,other,"DIA_Skip_First_12_03"); //Only to Gomez and his men.
//	AI_Output(self,other,"DIA_Skip_First_12_03"); //Nur an Gomez' Leute.
	AI_Output(self,other,"DIA_Skip_First_12_03"); //Jen Gomezovým mužům.

	if (!Npc_KnowsInfo(hero,DIA_Raven_Equipment))
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
//		B_LogEntry(GE_TraderOC,"The guard Skip at the back courtyard sells WEAPONS. But only to Gomez' men.");
//		B_LogEntry(GE_TraderOC,"Der Gardist Skip auf dem hinteren Burginnenhof verkauft WAFFEN. Aber nur an Gomez' Leute.");
		B_LogEntry(GE_TraderOC,"Strážce Skip prodává v zadní části nádvoří ZBRANĚ. Ale jen Gomezovým mužům.");
	};

	Info_ClearChoices(DIA_Skip_First);
//	Info_Addchoice (DIA_Skip_First,"I get it. I'll see you.",DIA_Skip_First_BACK);
//	Info_Addchoice (DIA_Skip_First,"Verstehe. Wir sehen uns.",DIA_Skip_First_BACK);
	Info_Addchoice (DIA_Skip_First,"Jistě, ještě se uvidíme.",DIA_Skip_First_BACK);
//	Info_Addchoice (DIA_Skip_First,"Thorus sent me. He told me to get myself a weapon.",DIA_Skip_First_Thorus);
//	Info_Addchoice (DIA_Skip_First,"Thorus hat mich zu dir geschickt. Ich soll mir ne Waffe besorgen.",DIA_Skip_First_Thorus);
	Info_Addchoice (DIA_Skip_First,"Poslal mě Thorus. Mám si obstarat zbraň.",DIA_Skip_First_Thorus);
//	Info_Addchoice (DIA_Skip_First,"Gomez sent me. He told me you'd give me some equipment.",DIA_Skip_First_Gomez);
//	Info_Addchoice (DIA_Skip_First,"Gomez hat mich zu dir geschickt. Ich soll mich ausrüsten lassen.",DIA_Skip_First_Gomez);
	Info_Addchoice (DIA_Skip_First,"Gomez mě poslal. Máš mi dát nějakou zbroj.",DIA_Skip_First_Gomez);

};

func void DIA_Skip_First_Gomez()
{
//	AI_Output(other,self,"DIA_Skip_First_Gomez_15_00"); //Gomez sent me. He told me you'd give me some equipment.
//	AI_Output(other,self,"DIA_Skip_First_Gomez_15_00"); //Gomez hat mich zu dir geschickt. Ich soll mich ausrüsten lassen.
	AI_Output(other,self,"DIA_Skip_First_Gomez_15_00"); //Gomez mě poslal. Máš mi dát nějakou zbroj.
//	AI_Output(self,other,"DIA_Skip_First_Gomez_12_01"); //The usual, eh? New armor and the best weapon I have in stock.
//	AI_Output(self,other,"DIA_Skip_First_Gomez_12_01"); //Also das Übliche: 'Ne neue Rüstung und die beste Waffe, die ich da habe.
	AI_Output(self,other,"DIA_Skip_First_Gomez_12_01"); //Jako obvykle, co? Jednu zbroj a nejlepší zbraně, co tu mám.
//	AI_Output(self,other,"DIA_Skip_First_Gomez_12_02"); //Get out of here, before I come after you!
//	AI_Output(self,other,"DIA_Skip_First_Gomez_12_02"); //Mach, dass du wegkommst, oder ich zieh' dir das Fell über die Ohren!
	AI_Output(self,other,"DIA_Skip_First_Gomez_12_02"); //Teď dělej, ať jsi pryč. Nebo ti napráskám!
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_First_Thorus()
{
//	AI_Output(other,self,"DIA_Skip_First_Thorus_15_00"); //Thorus sent me. He told me to get myself a weapon.
//	AI_Output(other,self,"DIA_Skip_First_Thorus_15_00"); //Thorus hat mich zu dir geschickt. Ich soll mir 'ne Waffe besorgen.
	AI_Output(other,self,"DIA_Skip_First_Thorus_15_00"); //Poslal mě Thorus. Mám si obstarat zbraň.
//	AI_Output(self,other,"DIA_Skip_First_Thorus_12_01"); //Oh?
//	AI_Output(self,other,"DIA_Skip_First_Thorus_12_01"); //So?
	AI_Output(self,other,"DIA_Skip_First_Thorus_12_01"); //Opravdu?
	Info_ClearChoices(DIA_Skip_First);
//	Info_Addchoice (DIA_Skip_First,"Why don't you go and ask him?",DIA_Skip_First_Thorus_AskHim);
//	Info_Addchoice (DIA_Skip_First,"Geh und frag ihn.",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice (DIA_Skip_First,"Jdi a zeptej se ho.",DIA_Skip_First_Thorus_AskHim);
//	Info_Addchoice (DIA_Skip_First,"He said to give you a big kick in the butt unless you give me a weapon.",DIA_Skip_First_Thorus_KickAss);
//	Info_Addchoice (DIA_Skip_First,"Wenn du keine Waffe rausrückst, soll ich dir in den Hintern treten.",DIA_Skip_First_Thorus_KickAss);
	Info_Addchoice (DIA_Skip_First,"Říkal, že když mi nedáš zbraň, tak tě mám pořádně nakopat do zadku.",DIA_Skip_First_Thorus_KickAss);
//	Info_Addchoice (DIA_Skip_First,"He wants me to do something for him that none of you can do, you see?",DIA_Skip_First_Thorus_Stranger);
//	Info_Addchoice (DIA_Skip_First,"Ich soll für ihn ne Sache erledigen, die keiner von euch machen kann.",DIA_Skip_First_Thorus_Stranger);
	Info_Addchoice (DIA_Skip_First,"Chce po mně, abych pro něj udělal něco, co nikdo z vás udělat nemůže.",DIA_Skip_First_Thorus_Stranger);
};

func void DIA_Skip_First_BACK()
{
//	AI_Output(other,self,"DIA_Skip_First_BACK_15_00"); //I get it. I'll see you.
//	AI_Output(other,self,"DIA_Skip_First_BACK_15_00"); //Verstehe. Wir sehen uns.
	AI_Output(other,self,"DIA_Skip_First_BACK_15_00"); //Jistě, ještě se uvidíme.
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

//------------------------------------------------------
func void DIA_Skip_First_Thorus_Stranger()
{
//	AI_Output(other,self,"DIA_Skip_First_Thorus_Stranger_15_00"); //He wants me to do something for him that none of you can do, you see?
//	AI_Output(other,self,"DIA_Skip_First_Thorus_Stranger_15_00"); //Ich soll für ihn 'ne Sache erledigen, die keiner von euch machen kann - du verstehst.
	AI_Output(other,self,"DIA_Skip_First_Thorus_Stranger_15_00"); //Chce po mně, abych pro něj udělal něco, co nikdo z vás udělat nemůže.
//	AI_Output(self,other,"DIA_Skip_First_Thorus_Stranger_12_01"); //Yeah? And I suppose he has nothing better to do than send you to me, right?
//	AI_Output(self,other,"DIA_Skip_First_Thorus_Stranger_12_01"); //Ach? Und da hat er nichts Besseres zu tun, als dich zu mir zu schicken?
	AI_Output(self,other,"DIA_Skip_First_Thorus_Stranger_12_01"); //Tak? A předpokládám, že ho nenapadlo nic lepšího, než tě za mnou poslat, že jo?
	Info_ClearChoices(DIA_Skip_First);
//	Info_Addchoice (DIA_Skip_First,"Why don't you go and ask him?",DIA_Skip_First_Thorus_AskHim);
//	Info_Addchoice (DIA_Skip_First,"Geh und frag ihn.",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice (DIA_Skip_First,"Jdi a zeptej se ho.",DIA_Skip_First_Thorus_AskHim);
//	Info_Addchoice (DIA_Skip_First,"He said to give you a big kick in the butt unless you give me a weapon.",DIA_Skip_First_Thorus_KickAssAGAIN);
//	Info_Addchoice (DIA_Skip_First,"Wenn du keine Waffe rausrückst, soll ich dir in den Hintern treten.",DIA_Skip_First_Thorus_KickAssAGAIN);
	Info_Addchoice (DIA_Skip_First,"Říkal, že když mi nedáš zbraň, tak tě mám pořádně nakopat do zadku.",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
//	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAss_15_00"); //He said to give you a mighty big kick in the butt unless you give me a weapon.
//	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAss_15_00"); //Er hat gesagt, wenn du keine Waffe rausrückst, soll ich dir einen kräftigen Tritt in den Hintern geben.
	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAss_15_00"); //Říkal, že když mi nedáš zbraň, tak tě mám pořádně nakopat do zadku.
//	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAss_12_01"); //Oh yeah? The way I see it, unless you get out of here a bit fast, I'll be the one kicking YOUR butt!
//	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAss_12_01"); //Ach? Ich glaube, wenn du hier nicht gleich verschwunden bist, gebe ich DIR einen Tritt in den Hintern!
	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAss_12_01"); //Tak? No a já to vidím tak, že pokud se odtud okamžitě neztratíš, tak nakopu zadek já TOBĚ!
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
//	AI_Output(other,self,"DIA_Skip_First_Thorus_AskHim_15_00"); //Why don't you go and ask him?
//	AI_Output(other,self,"DIA_Skip_First_Thorus_AskHim_15_00"); //Geh und frag ihn.
	AI_Output(other,self,"DIA_Skip_First_Thorus_AskHim_15_00"); //Jdi a zeptej se ho.
//	AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_01"); //You bet I will. But not right now. I bet he'll be interested to hear the stories you're telling about him.
//	AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_01"); //Mach' ich glatt. Aber nicht jetzt. Interessiert ihn bestimmt, was du über ihn erzählst.
	AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_01"); //To si piš, že to udělám. Ale ne teď. Vsadím se, že ho pobaví, až uslyší ty pohádky, cos o něm vyprávěl.
//	AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_02"); //I don't know who let you in here, but you'd better take the shortest way out again!
//	AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_02"); //Ich weiß nicht, wer dich hier reingelassen hat, aber du solltest schleunigst wieder verschwinden!
	AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_02"); //Nevím sice, kdo tě sem vpustil, ale uděláš nejlíp, když se odtud co nejrychleji ztratíš!
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
//	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //He said to give you a mighty big kick in the butt unless you give me a weapon.
//	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //Er hat gesagt, wenn du keine Waffe rausrückst, soll ich dir einen kräftigen Tritt in den Hintern geben.
	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //Říkal, že když mi nedáš zbraň, tak tě mám pořádně nakopat do zadku.
//	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01"); //Okay, man, what do you want?
//	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01"); //Schon gut, Mann, was willst du?
	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01"); //No, dobře chlape. Co potřebuješ?
	Info_ClearChoices(DIA_Skip_First);
	Skip_TradeFree = TRUE;
};

// **************************************
//			VERPATZT
// **************************************

instance DIA_Skip_VERPATZT(C_INFO)
{
	npc = GRD_211_Skip;
	nr = 1;
	condition = DIA_Skip_VERPATZT_Condition;
	information = DIA_Skip_VERPATZT_Info;
	important = 0;
	permanent = 1;
//	description = "I just thought I'd come back and ask about that equipment...";
//	description = "Ich dachte, ich frag' noch mal wegen der Ausrüstung ...";
	description = "Říkal jsem si, že bych se ještě jednou zeptal na tu zbroj...";
};

func int DIA_Skip_VERPATZT_Condition()
{
	//TODO: does it make sense for GIL_KDF?
	if ((!((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF)))
	&& ((Npc_KnowsInfo(hero,DIA_Skip_First)) && (Skip_TradeFree == FALSE)))
	{
		return 1;
	};

	return 0;
};

func void DIA_Skip_VERPATZT_Info()
{
//	AI_Output(other,self,"DIA_Skip_VERPATZT_15_00"); //I just thought I'd come back and ask about that equipment...
//	AI_Output(other,self,"DIA_Skip_VERPATZT_15_00"); //Ich dachte, ich frag' noch mal wegen der Ausrüstung ...
	AI_Output(other,self,"DIA_Skip_VERPATZT_15_00"); //Říkal jsem si, že bych se ještě jednou zeptal na tu zbroj...
//	AI_Output(self,other,"DIA_Skip_VERPATZT_12_01"); //Beat it!
//	AI_Output(self,other,"DIA_Skip_VERPATZT_12_01"); //Zisch ab!
	AI_Output(self,other,"DIA_Skip_VERPATZT_12_01"); //Vypadni!
};

/*------------------------------------------------------------------------
							Waffenhandel
------------------------------------------------------------------------*/

instance GRD_211_Skip_TRADE(C_INFO)
{
	npc = GRD_211_Skip;
	condition = GRD_211_Skip_TRADE_Condition;
	information = GRD_211_Skip_TRADE_Info;
	important = 0;
	permanent = 1;
	trade = 1;
//	description = "I could do with a few things.";
//	description = "Ich könnte ein paar Sachen gebrauchen";
	description = "Potřeboval bych pár věcí.";
};

func int GRD_211_Skip_TRADE_Condition()
{
	if (((Npc_GetTrueGuild(other) == GIL_STT)
	|| (Npc_GetTrueGuild(other) == GIL_GRD)
	|| (Npc_GetTrueGuild(other) == GIL_KDF))
	|| (Skip_TradeFree == TRUE))
	{
		return 1;
	};

	return 0;
};

func void GRD_211_Skip_TRADE_Info()
{
//	AI_Output(other,self,"GRD_211_Skip_TRADE_Info_15_01"); //I could do with a few things.
//	AI_Output(other,self,"GRD_211_Skip_TRADE_Info_15_01"); //Ich könnte ein paar Sachen gebrauchen.
	AI_Output(other,self,"GRD_211_Skip_TRADE_Info_15_01"); //Potřeboval bych pár věcí.
//	AI_Output(self,other,"GRD_211_Skip_TRADE_Info_12_02"); //I could sell you a few things.
//	AI_Output(self,other,"GRD_211_Skip_TRADE_Info_12_02"); //Ich könnte dir ein paar Sachen verkaufen.
	AI_Output(self,other,"GRD_211_Skip_TRADE_Info_12_02"); //Mohl bych ti pár věcí prodat.
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN //
------------------------------------------------------------------------*/
instance GRD_211_Skip_WELCOME(C_INFO)
{
	npc = GRD_211_Skip;
	condition = GRD_211_Skip_WELCOME_Condition;
	information = GRD_211_Skip_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int GRD_211_Skip_WELCOME_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return 1;
	};

	return 0;
};

func void GRD_211_Skip_WELCOME_Info()
{
//	AI_Output(self,other,"GRD_211_Skip_WELCOME_Info_12_01"); //Hey, you've made it pretty far, considering you ain't been here long!
//	AI_Output(self,other,"GRD_211_Skip_WELCOME_Info_12_01"); //Hey, dafür dass du noch nicht so lange hier bist, hast du es ziemlich weit gebracht!
	AI_Output(self,other,"GRD_211_Skip_WELCOME_Info_12_01"); //Poslyš, i když tu nejsi tak dlouho, vypracoval ses celkem rychle!
};
