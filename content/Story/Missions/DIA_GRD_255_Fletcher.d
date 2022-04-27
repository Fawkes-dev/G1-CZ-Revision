// ************************************************************
// 			  				   EXIT
// ************************************************************

instance DIA_Fletcher_EXIT(C_INFO)
{
	npc = Grd_255_Fletcher;
	nr = 999;
	condition = DIA_Fletcher_EXIT_Condition;
	information = DIA_Fletcher_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

func void DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
//						FIRST NACHT
// ************************************************************

instance DIA_Fletcher_First(C_INFO)
{
	npc = Grd_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_First_Condition;
	information = DIA_Fletcher_First_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Fletcher_First_Condition()
{
	if (Wld_IsTime(00,00,06,00))
	{
		return 1;
	};

	return 0;
};

func void DIA_Fletcher_First_Info()
{
//	AI_Output(self,other,"DIA_Fletcher_First_06_00"); //Hey, you!
//	AI_Output(self,other,"DIA_Fletcher_First_06_00"); //Hey, du!
	AI_Output(self,other,"DIA_Fletcher_First_06_00"); //Hej, ty!
//	AI_Output(other,self,"DIA_Fletcher_First_15_01"); //Who? Me?
//	AI_Output(other,self,"DIA_Fletcher_First_15_01"); //Wer? Ich?
	AI_Output(other,self,"DIA_Fletcher_First_15_01"); //Kdo? Já?
//	AI_Output(self,other,"DIA_Fletcher_First_06_02"); //You know who I mean, sonny!
//	AI_Output(self,other,"DIA_Fletcher_First_06_02"); //Du weißt genau, mit wem ich rede, Bürschchen!
	AI_Output(self,other,"DIA_Fletcher_First_06_02"); //Však ty víš, s kým mluvím, zlatíčko!
//	AI_Output(self,other,"DIA_Fletcher_First_06_03"); //Let me tell you something: This is MY district. And I don't want any trouble!
//	AI_Output(self,other,"DIA_Fletcher_First_06_03"); //Ich will dir mal was sagen: Das hier ist MEIN Viertel. Und ich will hier keinen Ärger!
	AI_Output(self,other,"DIA_Fletcher_First_06_03"); //Musím ti něco říci. Tohle je MŮJ obvod a nechci tu žádné problémy!
//	AI_Output(self,other,"DIA_Fletcher_First_06_04"); //But new guys like you are always trouble. Especially when they sneak around the place at night.
//	AI_Output(self,other,"DIA_Fletcher_First_06_04"); //Aber neue Typen wie du bedeuten immer Ärger. Vor allem, wenn sie hier mitten in der Nacht rumlaufen.
	AI_Output(self,other,"DIA_Fletcher_First_06_04"); //Nováčci jako ty mívají vždycky problémy. Obzvlášť, když se tu motají v noci.
//	AI_Output(self,other,"DIA_Fletcher_First_06_05"); //So why don't you go home and make sure I don't see you here again? There's an empty hut opposite the arena, the one with the canopy. Get some sleep.
//	AI_Output(self,other,"DIA_Fletcher_First_06_05"); //Also, warum sorgst du nicht dafür, dass ich dich hier nicht mehr sehe. Die Hütte gegenüber der Arena mit dem Vordach ist frei. Leg dich 'ne Runde ins Bett.
	AI_Output(self,other,"DIA_Fletcher_First_06_05"); //Tak raději běž, a ať už tě tu nevidím! Naproti aréně je prázdná chatrč s přístřeškem. Trochu se vyspi.
//	AI_Output(self,other,"DIA_Fletcher_First_06_06"); //And if I catch you in one of the other huts, I shall personally see to it that you live to regret it.
//	AI_Output(self,other,"DIA_Fletcher_First_06_06"); //Wenn ich dich in einer der anderen Hütten erwische, zieh ich dir das Fell über die Ohren.
	AI_Output(self,other,"DIA_Fletcher_First_06_06"); //A jestli tě chytím v nějaké jiné chatrči, osobně dohlídnu na to, abys toho litoval.

	AI_StopProcessInfos(self);
};

// ************************************************************
//							Hallo
// ************************************************************
	var int fletcher_whytalk;
// ************************************************************

instance DIA_Fletcher_Hello(C_INFO)
{
	npc = Grd_255_Fletcher;
	nr = 2;
	condition = DIA_Fletcher_Hello_Condition;
	information = DIA_Fletcher_Hello_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Fletcher_Hello_Condition()
{
	if (Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};

	return 0;
};

func void DIA_Fletcher_Hello_Info()
{
//	AI_Output(other,self,"DIA_Fletcher_Hello_15_00"); //Hey, you!
//	AI_Output(other,self,"DIA_Fletcher_Hello_15_00"); //Hey, du!
	AI_Output(other,self,"DIA_Fletcher_Hello_15_00"); //Hej, ty!
//	AI_Output(self,other,"DIA_Fletcher_Hello_06_01"); //If you want to get rid of your protection money - you've picked the wrong day.
//	AI_Output(self,other,"DIA_Fletcher_Hello_06_01"); //Wenn du dein Schutzgeld loswerden willst - heute ist nicht der Tag.
	AI_Output(self,other,"DIA_Fletcher_Hello_06_01"); //Pokud se chceš zbavit svých peněz za ochranu - pak sis zvolil špatný den.
//	AI_Output(other,self,"DIA_Fletcher_Hello_15_02"); //Yeah? Why's that?
//	AI_Output(other,self,"DIA_Fletcher_Hello_15_02"); //So? Und warum nicht?
	AI_Output(other,self,"DIA_Fletcher_Hello_15_02"); //Hm? A pročpak?
//	AI_Output(self,other,"DIA_Fletcher_Hello_06_03"); //Cos I'm not here.
//	AI_Output(self,other,"DIA_Fletcher_Hello_06_03"); //Weil ich gar nicht da bin.
	AI_Output(self,other,"DIA_Fletcher_Hello_06_03"); //Protože už tady nejsem.

	Info_ClearChoices(DIA_Fletcher_Hello);
//	Info_AddChoice(DIA_Fletcher_Hello,"I see.",DIA_Fletcher_Hello_ISee);
//	Info_AddChoice(DIA_Fletcher_Hello,"Verstehe.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice(DIA_Fletcher_Hello,"Aha...",DIA_Fletcher_Hello_ISee);
//	Info_AddChoice(DIA_Fletcher_Hello,"Then how come I'm talking to you?",DIA_Fletcher_Hello_WhyTalk);
//	Info_AddChoice(DIA_Fletcher_Hello,"Wie kommt es dann, dass wir beide uns unterhalten?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice(DIA_Fletcher_Hello,"Tak jak to, že tady s tebou mluvím?",DIA_Fletcher_Hello_WhyTalk);
//	Info_AddChoice(DIA_Fletcher_Hello,"Oh, where are you then?",DIA_Fletcher_Hello_WhereElse);
//	Info_AddChoice(DIA_Fletcher_Hello,"Wo bist du denn?",DIA_Fletcher_Hello_WhereElse);
	Info_AddChoice(DIA_Fletcher_Hello,"Och, a kde teda potom jsi?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
//	AI_Output(other,self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Oh, where are you then?
//	AI_Output(other,self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Wo bist du denn?
	AI_Output(other,self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Och, a kde teda potom jsi?
//	AI_Output(self,other,"DIA_Fletcher_Hello_WhereElse_06_01"); //I'm actually at the castle, sitting by the big camp fire, drinking a mug of beer.
//	AI_Output(self,other,"DIA_Fletcher_Hello_WhereElse_06_01"); //Eigentlich bin ich in der Burg, am großen Lagerfeuer, und trinke ein Bier.
	AI_Output(self,other,"DIA_Fletcher_Hello_WhereElse_06_01"); //Momentálně jsem na hradě, sedím u velkého táborového ohně a piju pivo.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
//	AI_Output(other,self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Then how come I'm talking to you?
//	AI_Output(other,self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Wie kommt es dann, dass wir beide uns unterhalten?
	AI_Output(other,self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Tak jak to, že tady s tebou mluvím?
//	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Nek's vanished. This district is usually his responsibility.
//	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Nek ist verschwunden. Er ist normalerweise für dieses Viertel verantwortlich.
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Zmizel Nek. Za tenhle obvod obvykle zodpovídá on.
//	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //And until he reappears, Thorus has ordered ME to guard it.
//	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //Bis er wieder da ist, hat Thorus MICH hier eingesetzt.
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //A dokud se znovu neobjeví, Thorus přikázal MĚ, abych tu dělal stráž.
	fletcher_whytalk = TRUE;
	Info_ClearChoices(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
//	AI_Output(other,self,"DIA_Fletcher_Hello_ISee_15_00"); //I see.
//	AI_Output(other,self,"DIA_Fletcher_Hello_ISee_15_00"); //Verstehe.
	AI_Output(other,self,"DIA_Fletcher_Hello_ISee_15_00"); //Aha.
	Info_ClearChoices(DIA_Fletcher_Hello);
};

// ************************************************************
//						Wo Nek
// ************************************************************

instance DIA_Fletcher_WoNek(C_INFO)
{
	npc = Grd_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_WoNek_Condition;
	information = DIA_Fletcher_WoNek_Info;
	important = 0;
	permanent = 0;
//	description = "D'you know where Nek's got to?";
//	description = "Weißt du, wo Nek geblieben ist?";
	description = "Víš, kam zmizel Nek?";
};

func int DIA_Fletcher_WoNek_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_STT_315_LostNek))
	|| (fletcher_whytalk == TRUE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Fletcher_WoNek_Info()
{
//	AI_Output(other,self,"DIA_Fletcher_WoNek_15_00"); //D'you know where Nek's got to?
//	AI_Output(other,self,"DIA_Fletcher_WoNek_15_00"); //Weißt du, wo Nek geblieben ist?
	AI_Output(other,self,"DIA_Fletcher_WoNek_15_00"); //Víš, kam zmizel Nek?
//	AI_Output(self,other,"DIA_Fletcher_WoNek_06_01"); //No, and I'm not likely to find out.
//	AI_Output(self,other,"DIA_Fletcher_WoNek_06_01"); //Nein, und ich werde es auch nicht rausfinden.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_01"); //Ne, a ani ho nebudu hledat.
//	AI_Output(self,other,"DIA_Fletcher_WoNek_06_02"); //If anything, the diggers in this district might know something. But diggers don't talk to guards.
//	AI_Output(self,other,"DIA_Fletcher_WoNek_06_02"); //Wenn einer was weiß, dann die Buddler aus diesem Viertel. Aber die Buddler reden nicht mit Gardisten.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_02"); //Pokud by o tom mohl v téhle čtvrti někdo něco vědět, pak jsou to kopáči. Ti ale se strážemi nemluví.
//	AI_Output(self,other,"DIA_Fletcher_WoNek_06_03"); //Especially not now they know I hate this filthy work. I bet they're laughing behind my back!
//	AI_Output(self,other,"DIA_Fletcher_WoNek_06_03"); //Vor allem nicht jetzt, denn sie wissen, dass ich diese Drecksarbeit hier verabscheue, und insgeheim lachen sie sich über mich tot!
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_03"); //Obzvlášť ne teď, když vědí, jak já tuhle špinavou práci nenávidím. Vsadím se, že se mi vysmívají za zádama.

	Log_CreateTopic(CH1_LostNek,LOG_MISSION);
	Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
//	B_LogEntry(CH1_LostNek,"Maybe the diggers in the arena district know where Nek disappeared to.");
//	B_LogEntry(CH1_LostNek,"Die Buddler im Arenaviertel wissen vielleicht, wohin Nek verschwunden ist.");
	B_LogEntry(CH1_LostNek,"Možná budou kopáči kolem arény vědět, kam zmizel Nek.");
};

// ************************************************************
//						Trotzdem Schutzgeld
// ************************************************************

instance DIA_Fletcher_TroSchu(C_INFO)
{
	npc = Grd_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_TroSchu_Condition;
	information = DIA_Fletcher_TroSchu_Info;
	important = 0;
	permanent = 0;
//	description = "Why don't you just collect some more protection money?";
//	description = "Warum sammelst du nicht trotzdem Schutzgeld?";
	description = "Proč přesto nevybereš nějaké peníze za ochranu?";
};

func int DIA_Fletcher_TroSchu_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fletcher_Hello))
	{
		return 1;
	};

	return 0;
};

func void DIA_Fletcher_TroSchu_Info()
{
//	AI_Output(other,self,"DIA_Fletcher_TroSchu_15_00"); //Why don't you just collect some more protection money?
//	AI_Output(other,self,"DIA_Fletcher_TroSchu_15_00"); //Warum sammelst du nicht trotzdem Schutzgeld?
	AI_Output(other,self,"DIA_Fletcher_TroSchu_15_00"); //Proč přesto nevybereš nějaké peníze za ochranu?
//	AI_Output(self,other,"DIA_Fletcher_TroSchu_06_01"); //Nek did his rounds before he disappeared. There's not much left to collect now.
//	AI_Output(self,other,"DIA_Fletcher_TroSchu_06_01"); //Kurz bevor er verschwunden ist, hat Nek noch einmal alle kräftig zur Kasse gebeten. Da ist nicht mehr viel zu holen.
	AI_Output(self,other,"DIA_Fletcher_TroSchu_06_01"); //Nek už je vybral krátce před tím, než zmizel. Už tu není co vybírat.
};

// ************************************************************
//						Wegen Nek
// ************************************************************
	var int fletcher_foundNek;
// ************************************************************

instance DIA_Fletcher_WegenNek(C_INFO)
{
	npc = Grd_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_WegenNek_Condition;
	information = DIA_Fletcher_WegenNek_Info;
	important = 0;
	permanent = 1;
//	description = "It's about Nek...";
//	description = "Wegen Nek...";
	description = "Co se týče Neka...";
};

func int DIA_Fletcher_WegenNek_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Fletcher_WoNek))
	&& (fletcher_foundNek == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Fletcher_WegenNek_Info()
{
//	AI_Output(other,self,"DIA_Fletcher_WegenNek_15_00"); //It's about Nek...
//	AI_Output(other,self,"DIA_Fletcher_WegenNek_15_00"); //Wegen Nek ...
	AI_Output(other,self,"DIA_Fletcher_WegenNek_15_00"); //Co se týče Neka...
//	AI_Output(self,other,"DIA_Fletcher_WegenNek_06_01"); //Yeah?
//	AI_Output(self,other,"DIA_Fletcher_WegenNek_06_01"); //Ja?
	AI_Output(self,other,"DIA_Fletcher_WegenNek_06_01"); //Ano?

	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);

	if ((Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)))
	{
//		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_02"); //I think I've found him.
//		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_02"); //Ich glaub', ich hab' ihn gefunden.
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_02"); //Myslím, že vím, kde je.
//		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_03"); //What? Where is he?
//		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_03"); //Was? Wo ist er?
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_03"); //Cože? A kde je?
//		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_04"); //Feeding the rats...
//		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_04"); //Er ist Futter für die Ratten.
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_04"); //Je z něj žrádlo pro krysy...
//		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_05"); //Oh no! Damn it! That means I have to run the show here now. I was hoping he'd be coming back.
//		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_05"); //Nein! Verdammt! Dann muss ICH jetzt den Laden hier schmeißen. Ich hatte gehofft, er kommt wieder.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_05"); //Ne! Sakra! To znamená, že se tu teď o to musím starat JÁ. Doufal jsem, že se vrátí zpátky.
//		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_06"); //Now I have a problem.
//		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_06"); //Jetzt hab' ich ein Problem ...
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_06"); //Teď mám problém...
		fletcher_foundNek = TRUE;
	}
	else
	{
//		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_07"); //No news.
//		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_07"); //Noch nichts Neues.
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_07"); //Žádné zprávy.
//		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_08"); //Keep me posted.
//		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_08"); //Halt mich auf dem Laufenden.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_08"); //Pořád mě informuj.
	};
};

// ************************************************************
//						Problem
// ************************************************************

instance DIA_Fletcher_Problem(C_INFO)
{
	npc = Grd_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_Problem_Condition;
	information = DIA_Fletcher_Problem_Info;
	important = 0;
	permanent = 0;
//	description = "What's the problem?";
//	description = "Was ist dein Problem?";
	description = "Co je to za problém?";
};

func int DIA_Fletcher_Problem_Condition()
{
	if (fletcher_foundNek == TRUE)
	{
		return 1;
	};

	return 0;
};

func void DIA_Fletcher_Problem_Info()
{
//	AI_Output(other,self,"DIA_Fletcher_Problem_15_00"); //What's the problem?
//	AI_Output(other,self,"DIA_Fletcher_Problem_15_00"); //Was ist dein Problem?
	AI_Output(other,self,"DIA_Fletcher_Problem_15_00"); //Co je to za problém?
//	AI_Output(self,other,"DIA_Fletcher_Problem_06_01"); //I'm in debt to Scatty, right up to my neck. Now he knows I'm doing Nek's job, he'll be coming round every day...
//	AI_Output(self,other,"DIA_Fletcher_Problem_06_01"); //Ich habe Schulden bei Scatty. 'Ne Menge Schulden. Jetzt, wo er weiß, dass ich Neks Job mache, wird er jeden Tag bei mir auf der Matte stehen ...
	AI_Output(self,other,"DIA_Fletcher_Problem_06_01"); //Jsem dlužný Scattymu, a to pořádně. Teď se dozví, že dělám Nekovu práci a bude sem chodit každý den...
};

//#####################################################################
//##
//##
//## KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
//						GARDIST GEWORDEN
// ************************************************************
instance Grd_255_Fletcher_WELCOME(C_INFO)
{
	npc = Grd_255_Fletcher;
	condition = Grd_255_Fletcher_WELCOME_Condition;
	information = Grd_255_Fletcher_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int Grd_255_Fletcher_WELCOME_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return 1;
	};

	return 0;
};

func void Grd_255_Fletcher_WELCOME_Info()
{
//	AI_Output(self,other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //You have got used to our ways pretty fast. Welcome to the Guards!
//	AI_Output(self,other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Du hast ziemlich schnell kapiert, wie es hier läuft. Willkommen bei der Garde!
	AI_Output(self,other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Pochopil jsi rychle, jak to tu chodí. Vítej mezi stráže!
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Fletcher_DIE(C_INFO)
{
	npc = Grd_255_Fletcher;
	condition = Info_Fletcher_DIE_Condition;
	information = Info_Fletcher_DIE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Fletcher_DIE_Condition()
{
	if (Kapitel == 4)
	{
		return 1;
	};

	return 0;
};

func void Info_Fletcher_DIE_Info()
{
	AI_GotoNpc(self,hero);

	if ((oldHeroGuild == GIL_STT)
	|| (oldHeroGuild == GIL_GRD)
	|| (oldHeroGuild == GIL_KDF))
	{
		if (oldHeroGuild == GIL_GRD)
		{
//			AI_Output(self,hero,"Info_Fletcher_DIE_06_01"); //Traitor! To think we let a thing like you join the Guards. BAH!
//			AI_Output(self,hero,"Info_Fletcher_DIE_06_01"); //Du Verräter! Na dich haben wir mal zum Gardisten gemacht. PAH!
			AI_Output(self,hero,"Info_Fletcher_DIE_06_01"); //Zrádce! A to jsme z tebe udělali strážce. PCHE!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
//			AI_Output(self,hero,"Info_Fletcher_DIE_06_02"); //It's one of those traitorous fire mages! BAH!
//			AI_Output(self,hero,"Info_Fletcher_DIE_06_02"); //Da ist noch einer von diesen verräterischen Feuermagiern! PAH!
			AI_Output(self,hero,"Info_Fletcher_DIE_06_02"); //Je to jeden z těch zrádných mágů Ohně! PCHE!
		}
		else
		{
//			AI_Output(self,hero,"Info_Fletcher_DIE_06_03"); //Hi, traitor! The fact that you used to be one of Gomez' Shadows won't help you now!
//			AI_Output(self,hero,"Info_Fletcher_DIE_06_03"); //Hallo Verräter! Auch dein früherer Status als einer von Gomez' Schatten wird dir jetzt nichts mehr helfen!
			AI_Output(self,hero,"Info_Fletcher_DIE_06_03"); //Zdar, zrádce! To, žes byl jedním z Gomezových Stínů, ti teď nepomůže!
		};

//		AI_Output(hero,self,"Info_Fletcher_DIE_15_04"); //Hey, what are you talking about, Fletcher?
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_04"); //Moment. Wovon redest du, Fletcher?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_04"); //Moment. O čem to mluvíš, Fletchere?
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_05"); //You're in with that New Camp scum, aren't you?
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_05"); //Steckst mit diesem abtrünnigen Abschaum aus dem Neuen Lager unter einer Decke, was?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_05"); //Patříš k těm odpadlíkům z Nového tábora, viď?
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_06"); //Hold on...
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_06"); //Warte mal ...
		AI_Output(hero,self,"Info_Fletcher_DIE_15_06"); //Zadrž...
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_07"); //I guess you must've thought we wouldn't figure it out, huh?
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_07"); //Hattest wohl gedacht, wir würden nicht dahinter kommen, wie?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_07"); //Myslel sis, že na to nepřijdeme, co?
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_08"); //Woah... Hold your horses!
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_08"); //Jetzt aber mal halblang ...
		AI_Output(hero,self,"Info_Fletcher_DIE_15_08"); //Zkrať to!
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_09"); //No, YOU hold on - hold on to your head. 'Cos you're going to be missing it soon.
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_09"); //Wir werden DICH halblang machen. Oder genauer gesagt, einen Kopf kürzer.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_09"); //Ne, my to zkrátíme! Přesněji řešeno, budeš o hlavu kratší.
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_10"); //DIE, TRAITOR!!!
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_10"); //STIRB, VERRÄTER!!!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_10"); //SMRT ZRÁDCI!!!

		if (Npc_KnowsInfo(hero,Info_Bloodwyn_DIE))
		{
//			B_LogEntry(CH4_BannedFromOC,"Bloodwyn has entrenched himself at the back gate. He reacted the same way as Fletcher at the main gate. I don't really know why, but it must have something to do with my search for the focus on behalf of the New Camp.");
//			B_LogEntry(CH4_BannedFromOC,"Bloodwyn, hat sich am hinteren Tor verschanzt. Er reagierte ähnlich wie Fletcher am Haupttor. Mir ist nicht klar warum, aber es muss etwas mit meiner Fokussuche für das Neue Lager zu tun haben.");
			B_LogEntry(CH4_BannedFromOC,"Bloodwyn se opevnil u zadní brány. Zachoval se stejně jako Fletcher, který teď střeží hlavní bránu. Nevím sice jak, ale musí to nějak souviset s mým hledáním ohnisek pro Nový tábor.");
		}
		else if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
//			B_LogEntry(CH4_BannedFromOC,"Fletcher, who's guarding the main gate of the Old Camp with a group of guards, called me a traitor and a renegade. He wouldn't listen to me and attacked me at once!");
//			B_LogEntry(CH4_BannedFromOC,"Fletcher, der nun mit einer Gruppe Gardisten am Haupttor des Alten Lagers Wache hält, bezeichnete mich als Verräter und Abtrünniger. Er lies sich auf keine Diskussion ein und griff mich sofort an!");
			B_LogEntry(CH4_BannedFromOC,"Fletcher, který se skupinou vojáků střeží hlavní bránu Starého tábora, mě nazval zrádcem a odpadlíkem. Ani mě nevyslechl a zaútočil na mě!");
//			B_LogEntry(CH4_BannedFromOC,"It looks like I've been banished from the Old Camp!");
//			B_LogEntry(CH4_BannedFromOC,"Es sieht so aus, als ob ich nun aus dem alten Lager verbannt wurde!");
			B_LogEntry(CH4_BannedFromOC,"Vypadá to, že jsem vyhoštěn ze Starého tábora.");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
//			AI_Output(self,hero,"Info_Fletcher_DIE_06_11"); //Look at that. It's a guy from the New Camp!
//			AI_Output(self,hero,"Info_Fletcher_DIE_06_11"); //Sieh mal einer an. Einer aus dem Neuen Lager!
			AI_Output(self,hero,"Info_Fletcher_DIE_06_11"); //Podívej se na to. Je to ten chlap z Nového tábora!
		}
		else
		{
//			AI_Output(self,hero,"Info_Fletcher_DIE_06_12"); //Look at that. It's a guy from the swamp camp!
//			AI_Output(self,hero,"Info_Fletcher_DIE_06_12"); //Sieh mal einer an. Einer aus dem Sumpflager!
			AI_Output(self,hero,"Info_Fletcher_DIE_06_12"); //Podívej se na to. Je to ten chlap z tábora v bažinách!
		};

//		AI_Output(hero,self,"Info_Fletcher_DIE_15_13"); //So what? What business is it of yours?
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_13"); //Ja, und? Was geht dich das an?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_13"); //Ano, a? Co tady pohledáváš?
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_14"); //Your mine's gonna be ours soon.
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_14"); //Bald wird auch eure Mine zu uns gehören.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_14"); //Váš důl bude zanedlouho náš.
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_15"); //Yeah? Well dream on!
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_15"); //Davon träumst du doch nur!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_15"); //Jo? Pěkný sen!
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_16"); //Sorry, but I can't risk you telling anyone about it!
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_16"); //Leider können wir es nicht zulassen, dass du das irgendwo herumerzählst!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_16"); //Promiň, ale nemůžeme riskovat, že to řekneš někomu dalšímu!
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_17"); //Hang on, I don't want any trouble.
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_17"); //Warte mal, ich bin nicht auf Streit aus ...
		AI_Output(hero,self,"Info_Fletcher_DIE_15_17"); //Zadrž, nechci žádné problémy!
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_18"); //You should have thought of that before you showed your face here!
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_18"); //Das hättest du dir überlegen sollen, bevor du hier aufkreuzt!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_18"); //Na to's měl myslet dřív, než ses tu ukázal!
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_19"); //Hey, what the...
//		AI_Output(hero,self,"Info_Fletcher_DIE_15_19"); //He, was soll der Unfug ...
		AI_Output(hero,self,"Info_Fletcher_DIE_15_19"); //Hej, co to je za nesmy...
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_20"); //Go, boys, let's get him!
//		AI_Output(self,hero,"Info_Fletcher_DIE_06_20"); //Auf ihn Jungs, den schnappen wir uns!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_20"); //Pojďte, hoši, chytneme ho!
	};

	Npc_ExchangeRoutine(self,"FMTaken2"); // Verstärkung vor das Haupttor (Anführer)
	B_ExchangeRoutine(GRD_252_Gardist, "FMTaken2"); // Verstärkung vor das Haupttor
	B_ExchangeRoutine(GRD_253_Gardist, "FMTaken2"); // Verstärkung vor das Haupttor
	B_ExchangeRoutine(GRD_244_Gardist, "FMTaken2"); // Verstärkung vor das Haupttor (Fernkämpfer)
	B_ExchangeRoutine(GRD_214_Torwache, "FMTaken2"); // reguläre Wache am Haupttor
	B_ExchangeRoutine(GRD_215_Torwache, "FMTaken2"); // reguläre Wache am Haupttor

	B_SetPermAttitude (GRD_255_Fletcher, ATT_HOSTILE);
	B_SetPermAttitude (GRD_252_Gardist, ATT_HOSTILE);
	B_SetPermAttitude (GRD_253_Gardist, ATT_HOSTILE);
	B_SetPermAttitude (GRD_244_Gardist, ATT_HOSTILE);
	B_SetPermAttitude (GRD_214_Torwache, ATT_HOSTILE);
	B_SetPermAttitude (GRD_215_Torwache, ATT_HOSTILE);

	if (!Npc_KnowsInfo(hero,Info_Bloodwyn_DIE))
	{
//		B_LogEntry(CH4_Firemages,"The gates of the Old Camp are now closed, they're protected by guards. They attack anybody approaching the Camp.");
//		B_LogEntry(CH4_Firemages,"Die Tore des Alten Lagers sind nun verschlossen und werden von Gardisten bewacht. Sie attackieren jeden der dem Lager zu nahe kommt.");
		B_LogEntry(CH4_Firemages,"Brány Starého tábora jsou nyní uzavřeny a hlídány strážemi. Napadají každého, kdo se přiblíží k táboru.");
	};

	AI_StopProcessInfos(self);
};
