/*------------------------------------------------------------------------
							Sitzender Ork
------------------------------------------------------------------------*/

instance Grd_277_Gardist_SITTINGORK(C_INFO)
{
	npc = Grd_277_Gardist;
	condition = Grd_277_Gardist_SITTINGORK_Condition;
	information = Grd_277_Gardist_SITTINGORK_Info;
	important = 0;
	permanent = 0;
//	description = "What's with that Orc?";
//	description = "Was ist mit dem Ork da?";
	description = "Co je s tím skřetem?";
};

func int Grd_277_Gardist_SITTINGORK_Condition()
{
	if (Ian_gearwheel != LOG_SUCCESS)
	{
		return 1;
	};

	return 0;
};

func void Grd_277_Gardist_SITTINGORK_Info()
{
//	AI_Output(other,self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //What's with that Orc?
//	AI_Output(other,self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //Was ist mit dem Ork da?
	AI_Output(other,self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //Co je s tím skřetem?
//	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //He's our prisoner. He's lucky that the gearwheel of the masher has broken. That's why this son of a bitch is being allowed to have a break.
//	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //Unser Gefangener. Sein Glück, dass das Zahnrad des Stampfers gebrochen ist. So kann dieser Hundesohn ausruhen.
	//#Needs_Attention: zkurvysyn hmmm :) nieje to moc drsne vs original?
	//Je to náš vězeň. Má štěstí, že ozubené kolo drtičky je rozbité. Proto si ten čubčí syn může dopřávat přestávku.
	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //Je to náš zajatec. Má štěstí, že ozubené kolo drtičky je rozbité. Proto tu teď ten zkurvysyn může odpočívat.
//	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //As soon as the masher is repaired, it's back to work for him. He's not here to laze around all the time!
//	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Wenn der Stampfer repariert ist, wird er wieder arbeiten. Schließlich ist er nicht zum Faulenzen hier!
	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Jakmile bude drtička opravená, bude zase pracovat! Ostatně, není tu od toho, aby se povaloval!
};
/*------------------------------------------------------------------------
							WORKINGORK
------------------------------------------------------------------------*/

instance Grd_277_Gardist_WORKINGORK(C_INFO)
{
	npc = Grd_277_Gardist;
	condition = Grd_277_Gardist_WORKINGORK_Condition;
	information = Grd_277_Gardist_WORKINGORK_Info;
	important = 0;
	permanent = 0;
//	description = "I see the masher has already been repaired.";
//	description = "Ich sehe, der Stampfer ist schon repariert.";
	description = "Vidím, že drtička je už opravená.";
};

func int Grd_277_Gardist_WORKINGORK_Condition()
{
	if (Ian_gearwheel == LOG_SUCCESS)
	{
		return 1;
	};

	return 0;
};

func void Grd_277_Gardist_WORKINGORK_Info()
{
//	AI_Output(other,self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //I see the masher has already been repaired.
//	AI_Output(other,self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //Ich sehe, der Stampfer ist schon repariert.
	AI_Output(other,self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //Vidím, že drtička je už opravená.
//	AI_Output(self,other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Yeah, we're fast when it comes to making people work.
//	AI_Output(self,other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Ja, wenn es darum geht, die Leute zum Arbeiten zu bringen, sind wir ziemlich schnell.
	AI_Output(self,other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Ano, když mají lidi pracovat, tak jsme rychlí.
};
