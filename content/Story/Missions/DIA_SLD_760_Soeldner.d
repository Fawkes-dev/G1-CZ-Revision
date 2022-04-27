//-------------------- Intro ---------------------------

instance DIA_SLD_760_Soeldner_INTRO(C_INFO)
{
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_INTRO_CONDITION;
	information = DIA_SLD_760_Soeldner_INTRO_INFO;
	important = 1;
	permanent = 0;
};

func int DIA_SLD_760_Soeldner_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc(self,hero ) < 200)
	//&& (Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
	{
		return 1;
	};

	return 0;
};

func void DIA_SLD_760_Soeldner_INTRO_INFO()
{
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INTRO_INFO_13_01"); //What are you hanging about here for? I just tell you one thing: Keep your hands off the door.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INTRO_INFO_13_01"); //Was scharwenzelst du hier rum? Ich sag dir eins: Finger weg von der Tür.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INTRO_INFO_13_01"); //Co se tu potloukáš? Řeknu ti jedno. Drž se dál od mých dveří!
};

//-------------------- Exit 1 -----------------------------

instance DIA_SLD_760_Soeldner_EXIT_1(C_INFO)
{
	npc = SLD_760_Soeldner;
	nr = 999;
	condition = DIA_SLD_760_Soeldner_EXIT_1_CONDITION;
	information = DIA_SLD_760_Soeldner_EXIT_1_INFO;
	important = 0;
	permanent = 0;
//	description = "I'd best be going.";
//	description = "Ich geh dann mal.";
	description = "Raději půjdu! (KONEC)";
};

func int DIA_SLD_760_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_EXIT_1_INFO()
{
//	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_1_INFO_15_01"); //I'd best be going.
//	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_1_INFO_15_01"); //Ich geh' dann mal.
	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_1_INFO_15_01"); //Raději půjdu!
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_1_INFO_13_02");//I hope we understand each other.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_1_INFO_13_02");//Ich hoffe, wir verstehen uns.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_1_INFO_13_02");//Doufám, že si rozumíme.
	AI_StopProcessInfos(self);
};

//-------------------- Exit 2 -----------------------------

instance DIA_SLD_760_Soeldner_EXIT_2(C_INFO)
{
	npc = SLD_760_Soeldner;
	nr = 999;
	condition = DIA_SLD_760_Soeldner_EXIT_2_CONDITION;
	information = DIA_SLD_760_Soeldner_EXIT_2_INFO;
	important = 0;
	permanent = 1;
//	description = "I need to go on.";
//	description = "Ich muss weiter.";
	description = "Musím jít. (KONEC)";
};

func int DIA_SLD_760_Soeldner_EXIT_2_CONDITION()
{
	if (Npc_KnowsInfo(hero,DIA_SLD_760_Soeldner_EXIT_1))
	{
		return 1;
	};

	return 0;
};

func void DIA_SLD_760_Soeldner_EXIT_2_INFO()
{
//	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_2_INFO_15_01"); //I need to go on.
//	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_2_INFO_15_01"); //Ich muss weiter.
	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_2_INFO_15_01"); //Potřebuju jít dál.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_2_INFO_13_02");//Just go then.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_2_INFO_13_02");//Dann geh mal.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_2_INFO_13_02");//Tak běž.
	AI_StopProcessInfos(self);
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_760_Soeldner_UMSEHEN(C_INFO)
{
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_UMSEHEN_CONDITION;
	information = DIA_SLD_760_Soeldner_UMSEHEN_INFO;
	important = 0;
	permanent = 0;
//	description = "I'd just like to have a look around here.";
//	description = "Ich will mich hier nur mal umsehen.";
	description = "Chtěl bych se tu porozhlédnout.";
};

func int DIA_SLD_760_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_UMSEHEN_INFO()
{
//	AI_Output(other,self,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_15_01"); //I'd just like to have a look around here.
//	AI_Output(other,self,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_15_01"); //Ich will mich hier nur mal umsehen.
	AI_Output(other,self,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_15_01"); //Chtěl bych se tu porozhlédnout.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_13_02");//Then leave your fingers in your pockets or I'll chop them off.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_13_02");//Dann lass deine Finger bei dir, sonst werde ich sie dir anschneiden.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_13_02");//Tak si drž prsty pěkně u těla, nebo ti je useknu.
};

//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_760_Soeldner_INMINE(C_INFO)
{
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_INMINE_CONDITION;
	information = DIA_SLD_760_Soeldner_INMINE_INFO;
	important = 0;
	permanent = 0;
//	description = "I want to go into the mine.";
//	description = "Ich will in die Mine.";
	description = "Chci jít do dolu.";
};

func int DIA_SLD_760_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_INMINE_INFO()
{
//	AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_01"); //I want to go into the mine.
//	AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_01"); //Ich will in die Mine.
	AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_01"); //Chci jít do dolu.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_02");//Into the mine? I won't let anybody in here without express permission from Okyl.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_02");//In die Mine? Ich lass' hier gar keinen rein ohne die ausdrückliche Erlaubnis von Okyl.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_02");//Do dolu? Bez Okylova povolení nikoho dovnitř nepustím.

	if (!Npc_KnowsInfo(hero,DIA_SLD_752_OKYL_WERBISTDU))
	{
//		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_03");//Who is this Okyl?
//		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_03");//Wer ist dieser Okyl?
		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_03");//Kdo je Okyl?
	}
	else
	{
//		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_08");//Okyl, isn't that the guy with the big axe and the heavy armor?
//		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_08");//Okyl, ist das nicht dieser Typ mit der dicken Axt und der schweren Rüstung?
		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_08");//Okyl, není to ten chlapík s velkou sekyrou a těžkou zbrojí?
	};
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_04");//Watch what you're saying and how you speak about our boss.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_04");//Pass auf, was du sagst und wie du von unserem Anführer sprichst.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_04");//Dávej pozor na to, co říkáš a jak mluvíš o našem šéfovi.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_05");//I'm gonna tell you something about Okyl, he's the toughest guy in the whole Camp. He once even sneaked into the castle in the Old Camp and stole a load of ore from the Ore Barons.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_05");//Ich werde dir mal was über Okyl erzählen, er ist der härteste Hund, den wir hier haben. Er ist soger mal in die Burg des Alten Lagers geschlichen und hat den Erzbaronen eine Ladung Erz unterm Hintern weggeklaut.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_05");//Řeknu ti něco o Okylovi, je to nejtvrdší chlap co tu máme. Jednou se dokonce vplížil na hrad ve Starém táboře a ukradl tam Rudobaronům hromadu rudy přímo pod nosem.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_06");//So show a bit more respect, please.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_06");//Also ein wenig mehr Respekt, wenn ich bitten darf.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_06");//Tak zachovej trochu úcty, prosím.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_07");//I don't know where he is, but if you meet him you should have that story in the back of your mind.
//	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_07");//Ich weiß zwar nicht, wo er gerade ist, aber wenn du ihm begegnest. solltest du das immer im Hinterkopf haben.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_07");//Zrovna nevím kde je, ale jestli ho potkáš, měl bys mít tuhle věc stále na paměti.
};
