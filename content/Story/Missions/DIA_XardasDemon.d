// ************************ EXIT **************************

instance Info_XardasDemon_EXIT(C_INFO)
{
	npc = XardasDemon;
	nr = 999;
	condition = Info_XardasDemon_EXIT_Condition;
	information = Info_XardasDemon_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_XardasDemon_EXIT_Condition()
{
	return 1;
};

func void Info_XardasDemon_EXIT_Info()
{
//	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
//	AI_Output(hero,self,"Info_Saturas_EXIT_15_01"); //... Mortal?... who, me?... Okay, I'm on my way!
//	AI_Output(hero,self,"Info_Saturas_EXIT_15_01"); //... Sterblicher? ...  Wer, ich? ... Ich geh ja schon!
	AI_Output(hero,self,"Info_Saturas_EXIT_15_01"); //...Smrtelník? ...kdo, já? ...Dobrá, já si jdu po svých!

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info INTRO
//***************************************************************************

instance Info_XardasDemon_INTRO(C_INFO)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_INTRO_Condition;
	information = Info_XardasDemon_INTRO_Info;
	important = 1;
	permanent = 0;
};

func int Info_XardasDemon_INTRO_Condition()
{
	if (FindXardas)
	{
		return 1;
	};

	return 0;
};

func void Info_XardasDemon_INTRO_Info()
{
	AI_TurnAway(hero,self);
//	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_01"); //Hold on... Who.... Who's talking to me?
//	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_01"); //Moment... Wer... Wer spricht hier.
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_01"); //Zadrž... Kdo... Kdo to na mě mluví?
	AI_WhirlAround(hero,self); //KEIN B_Whirlaround()!!!
//	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_02"); //YOU are talking to me??? How did you get into my head?
//	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_02"); //DUUUU sprichst zu mir ??? Wie ... wie kommst du in meinen Kopf?
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_02"); //TY na mě mluvíš??? Jak... Jak ses dostal do mojí hlavy?
//	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
//	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_03"); //You are what?... The servant of your master?
//	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_03"); //Du bist was? ... der Diener deines Herren?
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_03"); //Co jsi zač?... Služebník svého pána?
//	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_04"); //You seem to be a creature from hell!
//	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_04"); //Du erscheinst mir eher wie eine Kreatur der Hölle!
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_04"); //Vypadáš jako stvůra z pekla!
//	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
//	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_05"); //You want me to be silent?
//	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_05"); //Ich soll schweigen?
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_05"); //Chceš, abych byl zticha?
};

//***************************************************************************
//	Info MASTERWHO
//***************************************************************************

instance Info_XardasDemon_MASTERWHO(C_INFO)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_MASTERWHO_Condition;
	information = Info_XardasDemon_MASTERWHO_Info;
	important = 0;
	permanent = 0;
//	description = "Is your master's name perhaps Xardas?";
//	description = "Heißt Dein Herr und Meister zufällig Xardas?";
	description = "Nejmenuje se tvůj pán náhodou Xardas?";
};

func int Info_XardasDemon_MASTERWHO_Condition()
{
	if (Npc_KnowsInfo(hero,Info_XardasDemon_INTRO))
	{
		return 1;
	};

	return 0;
};

func void Info_XardasDemon_MASTERWHO_Info()
{
//	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_01"); //Is your master's name perhaps Xardas?
//	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_01"); //Heißt dein Herr und Meister zufällig Xardas?
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_01"); //Nejmenuje se tvůj pán náhodou Xardas?
//	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
//	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_02"); //Oh, right... So names are not important... Okay.
//	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_02"); //Aha ... Namen sind also unwichtig ... Okay.
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_02"); //Och, jistě... Jména nejsou důležitá... Dobře.
//	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_03"); //I'll just assume that this here is the tower of Xardas.
//	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_03"); //Ich gehe einfach mal davon aus, dass das hier der Turm von Xardas ist.
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_03"); //Budu předpokládat, že toto je Xardasova věž.
};

//***************************************************************************
//	Info MASTERHOW
//***************************************************************************

instance Info_XardasDemon_MASTERHOW(C_INFO)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_MASTERHOW_Condition;
	information = Info_XardasDemon_MASTERHOW_Info;
	important = 0;
	permanent = 0;
//	description = "I have to talk to your master!";
//	description = "Ich muss mit deinem Meister sprechen!";
	description = "Musím mluvit s tvým pánem!";
};

func int Info_XardasDemon_MASTERHOW_Condition()
{
	if (Npc_KnowsInfo(hero,Info_XardasDemon_INTRO))
	{
		return 1;
	};

	return 0;
};

func void Info_XardasDemon_MASTERHOW_Info()
{
//	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_01"); //I have to talk to your master!
//	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_01"); //Ich muss mit deinem Meister sprechen!
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_01"); //Musím mluvit s tvým pánem!
//	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
//	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_02"); //... Me?... Unworthy??... What kind of test???
//	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_02"); //... Ich? ... unwürdig?? ... Was für ein Test???
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_02"); //...Já?... Nejsem hoden? ...Jakou zkoušku???
//	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
//	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_03"); //... Aaahhhh... I understand... Whoever wants to talk to your master must prove worthy first!
//	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_03"); //... Aaahhhh ... Ich verstehe ... wer deinen Meister sprechen will, muss sich würdig erweisen!
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_03"); //...Aaahhhh... Rozumím... Kdokoliv chce mluvit s tvým pánem, musí nejdříve prokázat, že je hoden!
//	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_04"); //... Hold on, what was that?... The proof?... Victory over what?... Victory over the elements?
//	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_04"); //... Moment, wie war das? ... Der Beweis? ... Sieg über was? ... Sieg über die Elemente?
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_04"); //...Zadrž, cože? ... Důkaz?... Vítězství nad čím?... Vítězství nad živly?...
//	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_05"); //... Stone?... Ice?... Fire?
//	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_05"); //... Stein? ... Eis? ... Feuer?
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_05"); //...Kámen? ...Led? ...Oheň?

	FindGolemHearts = 1; // Auftrag vergeben

//	B_LogEntry(CH4_FindXardas,"In Xardas' tower, I meet a demon that talked to me in my thoughts. It wants three proofs of the victory over the elements of fire, ice and stone before granting me access to its master.");
//	B_LogEntry(CH4_FindXardas,"Im Inneren von Xardas' Turm begegnete ich einem Dämon, der in meinen Gedanken zu mir sprach. Er will drei Beweise für den Sieg über die Elemente Feuer, Eis und Stein, bevor er mich zu seinem Meister vorläßt.");
	B_LogEntry(CH4_FindXardas,"V Xardasově věži jsem se setkal s démonem, který se mnou promlouval v mé mysli. Požaduje tři důkazy o vítězství nad živly ohně, ledu a kamene předtím, než mi umožní přístup ke svému pánovi.");
};

//***************************************************************************
//	Info NOHEART
//***************************************************************************

instance Info_XardasDemon_NOHEART(C_INFO)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_NOHEART_Condition;
	information = Info_XardasDemon_NOHEART_Info;
	important = 0;
	permanent = 1;
//	description = "You're speaking in riddles!";
//	description = "Du sprichst in Rätseln!";
	description = "Mluvíš v hádankách!";
};

func int Info_XardasDemon_NOHEART_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW))
	&& (FindGolemHearts < 4))
	{
		if ((!Npc_HasItems(hero,ItAt_StoneGolem_01))
		&& (!Npc_HasItems(hero,ItAt_IceGolem_01))
		&& (!Npc_HasItems(hero,ItAt_FireGolem_01)))
		{
			return 1;
		};
	};

	return 0;
};

func void Info_XardasDemon_NOHEART_Info()
{
//	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_01"); //You're speaking in riddles!
//	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_01"); //Du sprichst in Rätseln!
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_01"); //Mluvíš v hádankách!
//	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
//	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_02"); //... You said that before, you're repeating yourself!
//	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_02"); //... Das hast du schon mal gesagt, du wiederholst dich!
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_02"); //...To jsi říkal předtím, opakuješ se!
//	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_03"); //... You want evidence for the victory over the elements fire, ice and stone?
//	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_03"); //... Du willst Beweise für den Sieg über die Elemente Feuer, Eis und Stein!
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_03"); //...Chceš důkaz o vítězství nad živly ohně, ledu a kamene!
};

//***************************************************************************
//	Ein Herz abliefern
//***************************************************************************

func void B_XardasDemon_GiveHeart()
{
	if (FindGolemHearts == 1)
	{
//		AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_01"); //... What?... Right!... Worthy proofs!
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_01"); //... Was? ... Aha! ... Ein würdiger Beweis!
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_01"); //...Co? ...Jistě? ...Zkouška hodnosti!
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_02"); //... Missing? Two are still missing?
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_02"); //... Fehlen? ... Zwei fehlen noch?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_02"); //...Chybí? ...Stále dvě chybí?
		FindGolemHearts = 2;
	}
	else if (FindGolemHearts == 2)
	{
//		AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_03"); //... Duality?... The second proof?
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_03"); //... Die Dualität? ... Der zweite Beweis?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_03"); //...Podvojnost? ...Další zkouška?
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_04"); //... One is still remaining?
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_04"); //... Einer bleibt noch?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_04"); //...Jeden ještě zůstává?
		FindGolemHearts = 3;
	}
	else if (FindGolemHearts == 3)
	{
//		AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_05"); //... Perfection?... I'm worthy?
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_05"); //... Vollkommenheit? ... Ich bin würdig?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_05"); //...Dokonalost? ...Jsem hoden?
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_06"); //If that's the case, I'd like to speak to your master now!
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_06"); //Wenn das so ist, dann wünsche ich jetzt, deinen Meister zu sprechen!
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_06"); //Jestli je to tak, chtěl bych teď mluvit s tvým pánem!
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_07"); //... Counterevidence?... What kind of counterevidence?... A rune?... A rune for me?
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_07"); //... Gegenbeweis? ... Was für einen Gegenbeweis? ... Eine Rune? ... Eine Rune für mich?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_07"); //...Protidůkaz? ...Jaký protidůkaz? ...Runa? ...Runa pro mě?
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_08"); //Well, then I'll accept the rune of teleportation as a sign of worthiness!
//		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_08"); //Nun, dann nehme ich die Rune der Teleportation als Zeichen der Würde an mich!
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_08"); //Jistě, potom přijmu teleportační runu jako důkaz toho, že jsem hoden!

		B_Story_AccessToXardas();
	};
};

//***************************************************************************
//	Info STONEHEART
//***************************************************************************

instance Info_XardasDemon_STONEHEART(C_INFO)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_STONEHEART_Condition;
	information = Info_XardasDemon_STONEHEART_Info;
	important = 0;
	permanent = 0;
//	description = "Here's the heart of a stone golem.";
//	description = "Ich habe hier das Herz eines Steingolems!";
	description = "Tady je srdce kamenného Golema.";
};

func int Info_XardasDemon_STONEHEART_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW))
	&& (Npc_HasItems(hero,ItAt_StoneGolem_01)))
	{
		return 1;
	};

	return 0;
};

func void Info_XardasDemon_STONEHEART_Info()
{
//	AI_Output(hero,self,"Info_XardasDemon_STONEHEART_15_01"); //Here's the heart of a stone golem.
//	AI_Output(hero,self,"Info_XardasDemon_STONEHEART_15_01"); //Ich habe hier das Herz eines Steingolems!
	AI_Output(hero,self,"Info_XardasDemon_STONEHEART_15_01"); //Tady je srdce kamenného Golema.

	B_GiveInvItems(hero,self,ItAt_StoneGolem_01,1);
	Npc_RemoveInvItem(self,ItAt_StoneGolem_01);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info ICEHEART
//***************************************************************************

instance Info_XardasDemon_ICEHEART(C_INFO)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_ICEHEART_Condition;
	information = Info_XardasDemon_ICEHEART_Info;
	important = 0;
	permanent = 0;
//	description = "Is this heart of an ice golem the proof?";
//	description = "Ist dieses Herz eines Eisgolems ein Beweis?";
	description = "Je toto srdce ledového Golema důkaz?";
};

func int Info_XardasDemon_ICEHEART_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW))
	&& (Npc_HasItems(hero,ItAt_IceGolem_01)))
	{
		return 1;
	};

	return 0;
};

func void Info_XardasDemon_ICEHEART_Info()
{
//	AI_Output(hero,self,"Info_XardasDemon_ICEHEART_15_01"); //Is this heart of an ice golem the proof?
//	AI_Output(hero,self,"Info_XardasDemon_ICEHEART_15_01"); //Ist dieses Herz eines Eisgolems ein Beweis?
	AI_Output(hero,self,"Info_XardasDemon_ICEHEART_15_01"); //Je toto srdce ledového Golema důkaz?

	B_GiveInvItems(hero,self,ItAt_IceGolem_01,1);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info FIREHEART
//***************************************************************************

instance Info_XardasDemon_FIREHEART(C_INFO)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_FIREHEART_Condition;
	information = Info_XardasDemon_FIREHEART_Info;
	important = 0;
	permanent = 0;
//	description = "What about this heart of a fire golem?";
//	description = "Was ist mit diesem Herz des Feuergolems?";
	description = "A co toto srdce ohnivého Golema?";
};

func int Info_XardasDemon_FIREHEART_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW))
	&& (Npc_HasItems(hero,ItAt_FireGolem_01)))
	{
		return 1;
	};

	return 0;
};

func void Info_XardasDemon_FIREHEART_Info()
{
//	AI_Output(hero,self,"Info_XardasDemon_FIREHEART_15_01"); //What about this heart of a fire golem?
//	AI_Output(hero,self,"Info_XardasDemon_FIREHEART_15_01"); //Was ist mit diesem Herz des Feuergolems?
	AI_Output(hero,self,"Info_XardasDemon_FIREHEART_15_01"); //A co toto srdce ohnivého Golema?

	B_GiveInvItems(hero,self,ItAt_FireGolem_01,1);

	B_XardasDemon_GiveHeart();
};
