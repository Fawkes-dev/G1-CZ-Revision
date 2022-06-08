// **************************************************
//						EXIT
// **************************************************

instance DIA_Shrat_Exit(C_INFO)
{
	npc = Nov_1356_Shrat;
	nr = 999;
	condition = DIA_Shrat_Exit_Condition;
	information = DIA_Shrat_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Shrat_Exit_Condition()
{
	return 1;
};

func void DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance DIA_Shrat_WhyHere(C_INFO)
{
	npc = Nov_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_WhyHere_Condition;
	information = DIA_Shrat_WhyHere_Info;
	important = 0;
	permanent = 0;
//	description = "What are you doing here?";
//	description = "Was machst du denn hier?";
	description = "Co tady děláš?";
};

func int DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

func void DIA_Shrat_WhyHere_Info()
{
//	AI_Output(other,self,"DIA_Shrat_WhyHere_15_00"); //What are you doing here?
//	AI_Output(other,self,"DIA_Shrat_WhyHere_15_00"); //Was machst du denn hier?
	AI_Output(other, self, "DIA_Shrat_WhyHere_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_Shrat_WhyHere_02_01"); //Did I give you permission to speak to me?
//	AI_Output(self,other,"DIA_Shrat_WhyHere_02_01"); //Habe ich dir erlaubt, mich anzusprechen?
	AI_Output(self, other, "DIA_Shrat_WhyHere_02_01"); //Dovolil jsem ti na mě mluvit?
//	AI_Output(self,other,"DIA_Shrat_WhyHere_02_02"); //Only joking! Those damned loonies are getting on my nerves, that's why I'm here!
//	AI_Output(self,other,"DIA_Shrat_WhyHere_02_02"); //War nur'n Witz! Diese verdammten Spinner gehen mir gehörig auf den Sack, deswegen bin ich hier!
	AI_Output(self, other, "DIA_Shrat_WhyHere_02_02"); //Jen žertuju! Ti zatracení cvoci mi lezou na nervy, proto jsem tady!
//	AI_Output(self,other,"DIA_Shrat_WhyHere_02_03"); //Don't speak to me!' - 'Pray for forgiveness by the Sleeper!' - 'Your mission is of extraordinary importance!'
//	AI_Output(self,other,"DIA_Shrat_WhyHere_02_03"); //Sprich mich nicht an!' - 'Bitte den Schläfer um Vergebung!' - 'Deine Mission ist von äußerster Dringlichkeit!'
	AI_Output(self, other, "DIA_Shrat_WhyHere_02_03"); //Nemluv na mě!' - 'Modli se ke Spáčovi za odpuštění!' - 'Tvůj úkol je nesmírně důležitý!'
//	AI_Output(self,other,"DIA_Shrat_WhyHere_02_04"); //It's enough to drive a man out of his mind - no wonder they're all crazed round here.
//	AI_Output(self,other,"DIA_Shrat_WhyHere_02_04"); //Das hält man ja im Kopf nicht aus - kein Wunder, dass die hier alle gaga sind.
	AI_Output(self, other, "DIA_Shrat_WhyHere_02_04"); //Nejde to pustit z hlavy - není divu, že se z toho všichni tady pominuli.
//	AI_Output(self,other,"DIA_Shrat_WhyHere_02_05"); //I'm Shrat, novice of the first rank - and that's who I'll always remain!
//	AI_Output(self,other,"DIA_Shrat_WhyHere_02_05"); //Ich bin Shrat. Novize ersten Ranges - und das werde ich auch bleiben!
	AI_Output(self, other, "DIA_Shrat_WhyHere_02_05"); //Jsem Shrat, novic první třídy - a tím také navždy zůstanu!
};

// **************************************************
//				Hilfe bei Join PSI ??
// **************************************************

instance DIA_Shrat_JoinPSI(C_INFO)
{
	npc = Nov_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_JoinPSI_Condition;
	information = DIA_Shrat_JoinPSI_Info;
	important = 0;
	permanent = 0;
//	description = "I want to join the Brotherhood - can you help me?";
//	description = "Ich will der Bruderschaft beitreten - kannst du mir helfen?";
	description = "Chci se přidat k Bratrstvu - můžeš mi pomoci?";
};

func int DIA_Shrat_JoinPSI_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Shrat_WhyHere))
	{
		return 1;
	};

	return 0;
};

func void DIA_Shrat_JoinPSI_Info()
{
//	AI_Output(other,self,"DIA_Shrat_JoinPSI_15_00"); //I want to join the Brotherhood - can you help me?
//	AI_Output(other,self,"DIA_Shrat_JoinPSI_15_00"); //Ich will der Bruderschaft beitreten - kannst du mir helfen?
	AI_Output(other, self, "DIA_Shrat_JoinPSI_15_00"); //Chci se přidat k Bratrstvu - můžeš mi pomoci?
//	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_01"); //You want to join this place? I'm actually just thinking about how to get away from here.
//	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_01"); //Du willst bei dem Laden hier mitmachen? Ich überleg gerade, wie ich hier wegkomme.
	AI_Output(self, other, "DIA_Shrat_JoinPSI_02_01"); //Chceš se k nám přidat? Já už vážně přemýšlím o tom, jak se odsud dostat.
//	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_02"); //We could roam the colony. Relieve a few numskulls of their money, collect some ore - what do you think?
//	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_02"); //Wir könnten ein bisschen durch die Kolonie ziehen. Ein paar Einfaltspinsel ausplündern, ein bisschen Erz sammeln - was denkst du?
	AI_Output(self, other, "DIA_Shrat_JoinPSI_02_02"); //Mohli bychom se potulovat po kolonii. Ulehčit pár mamlasům o jejich peníze, nasbírat nějakou rudu - co myslíš?
};

// **************************************************
//					Komm mit
// **************************************************

instance DIA_Shrat_ComeWithMe(C_INFO)
{
	npc = Nov_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_ComeWithMe_Condition;
	information = DIA_Shrat_ComeWithMe_Info;
	important = 0;
	permanent = 1;
//	description = "Let's move around together! Come with me!";
//	description = "Lass uns zusammen losziehen! Komm mit!";
	description = "Můžeme se toulat společně! Pojď se mnou!";
};

func int DIA_Shrat_ComeWithMe_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_Shrat_JoinPSI))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Shrat_ComeWithMe_Info()
{
//	AI_Output(other,self,"DIA_Shrat_ComeWithMe_15_00"); //Let's move around together! Come with me!
//	AI_Output(other,self,"DIA_Shrat_ComeWithMe_15_00"); //Lass uns zusammen losziehen! Komm mit!
	AI_Output(other, self, "DIA_Shrat_ComeWithMe_15_00"); //Můžeme se toulat společně! Pojď se mnou!
//	AI_Output(self,other,"DIA_Shrat_ComeWithMe_02_01"); //Now that's what I like to hear! Let's go!
//	AI_Output(self,other,"DIA_Shrat_ComeWithMe_02_01"); //Das ist doch mal ein Wort! Auf geht's!
	AI_Output(self, other, "DIA_Shrat_ComeWithMe_02_01"); //Tohle rád slyším! Pojďme!

	Npc_ExchangeRoutine(self, "FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// **************************************************
//					Verlassen
// **************************************************

instance DIA_Shrat_LeaveMe(C_INFO)
{
	npc = Nov_1356_Shrat;
	nr = 700;
	condition = DIA_Shrat_LeaveMe_Condition;
	information = DIA_Shrat_LeaveMe_Info;
	important = 0;
	permanent = 1;
//	description = "Our paths separate here - I'll go on on my own.";
//	description = "Hier trennen sich unsere Wege - ich werde von hier aus alleine weiterziehen.";
	description = "Naše cesty se rozcházejí - půjdu si po svých.";
};

func int DIA_Shrat_LeaveMe_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return 1;
	};

	return 0;
};

func void DIA_Shrat_LeaveMe_Info()
{
//	AI_Output(other,self,"DIA_Shrat_LeaveMe_15_00"); //Our paths separate here - I'll go on on my own.
//	AI_Output(other,self,"DIA_Shrat_LeaveMe_15_00"); //Hier trennen sich unsere Wege - ich werde von hier aus alleine weiterziehen.
	AI_Output(other, self, "DIA_Shrat_LeaveMe_15_00"); //Naše cesty se rozcházejí - půjdu si po svých.
//	AI_Output(self,other,"DIA_Shrat_LeaveMe_02_01"); //Okay. I'll get back to my hiding place in the swamp. Take care of yourself!
//	AI_Output(self,other,"DIA_Shrat_LeaveMe_02_01"); //Na gut. Ich werd' zurück in mein Versteck im Sumpf gehen. Pass gut auf dich auf!
	AI_Output(self, other, "DIA_Shrat_LeaveMe_02_01"); //Dobře. Já se vrátím do svého úkrytu v bažinách. Dávej na sebe pozor!

	Npc_ExchangeRoutine(self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};
