//-------------------- Intro ---------------------------

instance DIA_SLD_761_Soeldner_INTRO(C_INFO)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_INTRO_CONDITION;
	information = DIA_SLD_761_Soeldner_INTRO_INFO;
	important = 1;
	permanent = 0;
};

func int DIA_SLD_761_Soeldner_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc(self,hero ) < 300)
	//&& (Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_INTRO_INFO()
{
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_INTRO_INFO_03_01"); //What are you doing at the mine here?
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_INTRO_INFO_03_01"); //Was machst du hier an der Mine?
	AI_Output(self,other,"DIA_SLD_761_Soeldner_INTRO_INFO_03_01"); //Co tady děláš v tom dole?
};

//-------------------- Exit 1 -----------------------------

instance DIA_SLD_761_Soeldner_EXIT_1(C_INFO)
{
	nr = 999;
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_EXIT_1_CONDITION;
	information = DIA_SLD_761_Soeldner_EXIT_1_INFO;
	important = 0;
	permanent = 0;
//	description = "I've still got some business to do.";
//	description = "Ich hab' noch was zu erledigen.";
	description = "Mám tu přád nějkaou práci.";
};

func int DIA_SLD_761_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_EXIT_1_INFO()
{
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01"); //I've still got some business to do.
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01"); //Ich hab' noch was zu erledigen.
	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01"); //Mám tu přád nějkaou práci.
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");//That's what I think as well.
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");//Das denke ich auch.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");//Taky si to myslím.
	AI_StopProcessInfos(self);
};

//-------------------- Exit 2 -----------------------------

instance DIA_SLD_761_Soeldner_EXIT_2(C_INFO)
{
	nr = 999;
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_EXIT_2_CONDITION;
	information = DIA_SLD_761_Soeldner_EXIT_2_INFO;
	important = 0;
	permanent = 1;
//	description = "I'd best be going.";
//	description = "Ich geh dann mal.";
	description = "Raději půjdu!";
};

func int DIA_SLD_761_Soeldner_EXIT_2_CONDITION()
{
	if (Npc_KnowsInfo(hero,DIA_SLD_761_Soeldner_EXIT_1))
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_EXIT_2_INFO()
{
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01"); //I'd best be going.
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01"); //Ich geh' dann mal.
	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01"); //Raději půjdu!
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");//Okay.
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");//Okay.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");//Dobrá.
	AI_StopProcessInfos(self);
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_761_Soeldner_UMSEHEN(C_INFO)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_UMSEHEN_CONDITION;
	information = DIA_SLD_761_Soeldner_UMSEHEN_INFO;
	important = 0;
	permanent = 0;
//	description = "I just wanted to have a look around the Camp.";
//	description = "Ich wollte mir nur mal das Camp ansehen.";
	description = "Jen jsem se chtěl porozhlédnout po táboře.";
};

func int DIA_SLD_761_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_UMSEHEN_INFO()
{  
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01"); //I just wanted to have a look around the Camp.
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01"); //Ich wollte mir nur mal das Camp ansehen.
	AI_Output(other,self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01"); //Jen jsem se chtěl porozhlédnout po táboře.
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");//Then you've come to the wrong place, because this is the mine entrance and you're not admitted here.
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");//Dann bist du hier wohl falsch, hier ist der Mineneingang, und der ist tabu für dich.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");//Pak jsi přišel na nesprávné místo, protože tohle je vchod do dolu, a tam tě nepustíme.
};

//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_761_Soeldner_INMINE(C_INFO)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_INMINE_CONDITION;
	information = DIA_SLD_761_Soeldner_INMINE_INFO;
	important = 0;
	permanent = 0;
//	description = "I just wanted to see the mine.";
//	description = "Ich wollte mir nur mal die Mine ansehen.";
	description = "Jen jsem si chtěl ten důl.";
};

func int DIA_SLD_761_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_INMINE_INFO()
{
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");//I just wanted to see the mine.
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");//Ich wollte mir nur mal die Mine ansehen.
	AI_Output(other,self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");//Jen jsem si chtěl ten důl.
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");//Suppose you can see that the mine is locked, so there's absolutely nothing for you to see.
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");//Du siehst doch, dass die Mine abgeschlossen ist, also hier gibt´s nichts zu sehen.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");//Snad vidíš, že důl je zamčený, takže tu není vůbec nic k vidění.

};

//----------------------- Bestechen --------------------------------

instance DIA_SLD_761_Soeldner_Bribe(C_INFO)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_Bribe_CONDITION;
	information = DIA_SLD_761_Soeldner_Bribe_INFO;
	important = 0;
	permanent = 0;
//	description = "Is there nothing we can do about it?";
//	description = "Kann man da gar nichts machen?";
	description = "Nemohlo by se s tím něco udělat?";
};

func int DIA_SLD_761_Soeldner_Bribe_CONDITION()
{ 
	if (Npc_KnowsInfo(hero,DIA_SLD_761_Soeldner_INMINE))
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_Bribe_INFO()
{  
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");//Is there nothing we can do about it?
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");//Kann man da gar nichts machen?
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");//Nemohlo by se s tím něco udělat?
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");//What should there be to do about it?
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");//Was sollte man da machen können?
	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");//Co bychom s tím měli udělat?
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");//One moment, if you're trying to bribe me, you have the wrong man here.
//	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");//Moment mal, wenn du versucht, mich zu bestechen, dann bist du hier an der falschen Adresse.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");//Okamžik, jestli se mě pokoušíš podplatit, tak to jsi narazil na toho nesprávného.
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");//No, I wasn't trying to bribe anybody, I just thought that...
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");//Nein, ich wollte niemanden bestechen, ich dachte nur..
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");//Ne, nepokoušel jsem se nikoho podplatit, jen jsem myslel...
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");//I guess I'd best be going.
//	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");//Ich glaub', ich geh' dann besser.
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");//Já myslím, že bys měl raději jít pryč.
	AI_StopProcessInfos(self); 
};

