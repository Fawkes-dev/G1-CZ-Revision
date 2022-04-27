//-------------------- Intro ---------------------------

instance DIA_SLD_752_OKYL_INTRO(C_INFO)
{
	npc = SLD_752_OKYL;
	condition = DIA_SLD_752_OKYL_INTRO_CONDITION;
	information = DIA_SLD_752_OKYL_INTRO_INFO;
	important = 1;
	permanent = 0;
};

func int DIA_SLD_752_OKYL_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc(self,hero ) < 250)
	{
		return 1;
	};

	return 0;
};

func void DIA_SLD_752_OKYL_INTRO_INFO()
{
//	AI_Output(self,other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01"); //Hey, you! You're not one of my men. What are you doing here?
//	AI_Output(self,other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01"); //Hey, du! Du gehörst nicht zu meinen Jungs. Was machst du hier?
	AI_Output(self,other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01"); //Hej, ty! Ty nepatříš k mým mužům. Co tady děláš?
};

//-------------------- Exit -----------------------------

instance DIA_SLD_752_OKYL_EXIT(C_INFO)
{
	npc = SLD_752_OKYL;
	nr = 999;
	condition = DIA_SLD_752_OKYL_EXIT_CONDITION;
	information = DIA_SLD_752_OKYL_EXIT_INFO;
	important = 0;
	permanent = 1;
//	description = "I need to go on!";
//	description = "Ich muss weiter!";
	description = "Musím jít dál.";
};

func int DIA_SLD_752_OKYL_EXIT_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_EXIT_INFO()
{
//	AI_Output(other,self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01"); //I need to go on!
//	AI_Output(other,self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01"); //Ich muss weiter!
	AI_Output(other,self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01"); //Musím jít dál.
//	AI_Output(self,other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");//Then leave me alone.
//	AI_Output(self,other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");//Dann lass mich in Ruhe.
	AI_Output(self,other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");//Nech mě být.
	AI_StopProcessInfos(self);
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_752_OKYL_UMSEHEN(C_INFO)
{
	npc = SLD_752_OKYL;
	condition = DIA_SLD_752_OKYL_UMSEHEN_CONDITION;
	information = DIA_SLD_752_OKYL_UMSEHEN_INFO;
	important = 0;
	permanent = 0;
//	description = "I'll just have a look around here.";
//	description = "Ich seh mich hier nur mal um.";
	description = "Jen se tu porozhlédnu.";
};

func int DIA_SLD_752_OKYL_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_UMSEHEN_INFO()
{
//	AI_Output(other,self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01"); //I'll just have a look around here.
//	AI_Output(other,self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01"); //Ich seh' mich hier nur mal um.
	AI_Output(other,self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01"); //Jen se tu porozhlédnu.
//	AI_Output(self,other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");//Then just watch out that you don't mess up here in the Hollow, else you'll be in your grave faster than you'd like to think.
//	AI_Output(self,other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");//Dann pass bloß auf, dass du hier im Kessel keinen Mist baust, sonst bist du schneller im Grab, als dir lieb ist.
	AI_Output(self,other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");//Dávej dobrý pozor, aby ses tady v Kotlině nedostal do žádného maléru, jinak se dostaneš do hrobu rychleji, než by ses nadál.
};

//--------------------- Wer bist Du -----------------------------

instance DIA_SLD_752_OKYL_WERBISTDU(C_INFO)
{
	npc = SLD_752_OKYL;
	condition = DIA_SLD_752_OKYL_WERBISTDU_CONDITION;
	information = DIA_SLD_752_OKYL_WERBISTDU_INFO;
	important = 0;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};

func int DIA_SLD_752_OKYL_WERBISTDU_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_WERBISTDU_INFO()
{
//	AI_Output(other,self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01"); //Who are you?
//	AI_Output(other,self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01"); //Wer bist du?
	AI_Output(other,self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01"); //Kdo jsi?
//	AI_Output(self,other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");//I'm Okyl. I'm the boss of the Hollow.
//	AI_Output(self,other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");//Ich bin Okyl. Ich hab' das Kommando über den Kessel.
	AI_Output(self,other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");//Jsem Okyl. Jsem šéf Kotliny.
};

//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_752_OKYL_INMINE(C_INFO)
{
	npc = SLD_752_OKYL;
	condition = DIA_SLD_752_OKYL_INMINE_CONDITION;
	information = DIA_SLD_752_OKYL_INMINE_INFO;
	important = 0;
	permanent = 0;
//	description = "I just wanted to have a glance into the mine.";
//	description = "Ich wollte nur mal in die Mine.";
	description = "Chtěl jsem se jednom podívat do dolu.";
};

func int DIA_SLD_752_OKYL_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_INMINE_INFO()
{
//	AI_Output(other,self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01"); //I just wanted to have a glance into the mine.
//	AI_Output(other,self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01"); //Ich wollte nur mal in die Mine.
	AI_Output(other,self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01"); //Chtěl jsem se jednom podívat do dolu.
//	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");//Oh, you just wanted to stroll into the mine.
//	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");//Ach so, du wolltest nur mal kurz in die Mine.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");//Ach tak, tak ty ses chtěl jen se tak procházet po dole.
//	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");//Suppose you don't have a clue what's going on here. Nobody sets a foot in the mine without my permission.
//	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");//Ich glaube, du weisst nicht, wie das hier läuft. Keiner kommt in die Mine ohne meine Erlaubnis.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");//Vidím, že nemáš vůbec ponětí o tom, jak to tady chodí. Bez mého svolení do dolu nevkročí ani noha.
//	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");//Always remember: Whoever goes into the mine or the gatehouse without my permission is a dead man!
//	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");//Schreib dir das hinter die Ohren. Wer ohne meine Erlaubnis die Mine oder das Torhaus betritt, ist ein toter Mann!
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");//Dobře si zapiš za uši. Každý, kdo vstoupí do dolu nebo do strážnice bez mého svolení, je mrtvý muž!
};

//----------------------- Erlaubniss kriegen -------------------------

instance DIA_SLD_752_OKYL_PERMIT(C_INFO)
{
	npc = SLD_752_OKYL;
	condition = DIA_SLD_752_OKYL_PERMIT_CONDITION;
	information = DIA_SLD_752_OKYL_PERMIT_INFO;
	important = 0;
	permanent = 0;
//	description = "Will I be allowed to go in?";
//	description = "Krieg ich die Erlaubnis?";
	description = "Dostanu povolení jít dovnitř?";
};

func int DIA_SLD_752_OKYL_PERMIT_CONDITION()
{
	if (Npc_KnowsInfo(hero,DIA_SLD_752_OKYL_INMINE))
	{
		return 1;
	};

	return 0;
};

func void DIA_SLD_752_OKYL_PERMIT_INFO()
{
//	AI_Output(other,self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");//Will I be allowed to go in?
//	AI_Output(other,self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");//Krieg ich die Erlaubnis?
	AI_Output(other,self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");//Dostanu povolení jít dovnitř?
//	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");//I don't even know you. Why should I let you go into the mine?
//	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");//Ich kenn' dich nicht einmal. Wieso sollte ich dir erlauben in die Mine zu gehen.
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");//Ještě tě ani neznám. Proč bych tě měl do dolu vůbec pouštět?
//	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");//Now scram, I have things to see to.
//	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");//Jetzt verschwinde, ich hab' zu tun.
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");//Teď zmiz, mám důležitější věci na práci.
	AI_StopProcessInfos(self);
};
