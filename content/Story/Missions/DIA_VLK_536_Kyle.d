// **************************************************
// 						 EXIT
// **************************************************

instance DIA_Kyle_Exit(C_INFO)
{
	npc = Vlk_536_Kyle;
	nr = 999;
	condition = DIA_Kyle_Exit_Condition;
	information = DIA_Kyle_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Kyle_Exit_Condition()
{
	return 1;
};

func void DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self, 120); //wegen AUTO-Ansprechen
	AI_StopProcessInfos(self);
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

instance DIA_Kyle_HutRage(C_INFO)
{
	npc = Vlk_536_Kyle;
	nr = 2;
	condition = DIA_Kyle_HutRage_Condition;
	information = DIA_Kyle_HutRage_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Kyle_HutRage_Condition()
{
	if ((Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist))
	{
		return 1;
	};
};

func void DIA_Kyle_HutRage_Info()
{
//	AI_Output(self,other,"DIA_Kyle_HutRage_10_00"); //How often have I told you bastards not to run through my hut!
//	AI_Output(self,other,"DIA_Kyle_HutRage_10_00"); //Wie oft hab' ich euch Pennern gesagt, rennt nicht durch meine Hütte.
	AI_Output(self, other, "DIA_Kyle_HutRage_10_00"); //Kolikrát vám budu opakovat, vy parchanti. Nechoďte skrz moji chatrč!
};

// **************************************************
// 				Was ist dein Problem?
// **************************************************

instance DIA_Kyle_Problem(C_INFO)
{
	npc = Vlk_536_Kyle;
	nr = 2;
	condition = DIA_Kyle_Problem_Condition;
	information = DIA_Kyle_Problem_Info;
	important = 0;
	permanent = 1;
//	description = "What's your problem?";
//	description = "Was ist dein Problem?";
	description = "Co máš za problém?";
};

func int DIA_Kyle_Problem_Condition()
{
	//TODO: this dialogue should be available only after DIA_Kyle_HutRage was told
	return 1;
};

func void DIA_Kyle_Problem_Info()
{
//	AI_Output(other,self,"DIA_Kyle_Problem_15_00"); //What's your problem?
//	AI_Output(other,self,"DIA_Kyle_Problem_15_00"); //Was ist dein Problem?
	AI_Output(other, self, "DIA_Kyle_Problem_15_00"); //Co máš za problém?
//	AI_Output(self,other,"DIA_Kyle_Problem_10_01"); //Leave me alone, man! Everyone's a problem with ME!
//	AI_Output(self,other,"DIA_Kyle_Problem_10_01"); //Mann, lass mich bloß in Ruhe! Jeder hier hat ein Problem mit mir!
	AI_Output(self, other, "DIA_Kyle_Problem_10_01"); //Nech mě na pokoji, člověče! Každý tu má se MNOU problémy!
//	AI_Output(self,other,"DIA_Kyle_Problem_10_02"); //It all started when I built my hut.
//	AI_Output(self,other,"DIA_Kyle_Problem_10_02"); //Es fing alles damit an, dass ich meine Hütte gebaut hab'.
	AI_Output(self, other, "DIA_Kyle_Problem_10_02"); //Všechno začalo v okamžiku, když jsem postavil tuhle chatrč.
//	AI_Output(self,other,"DIA_Kyle_Problem_10_03"); //Don't build your hut close to the ditch, they said.
//	AI_Output(self,other,"DIA_Kyle_Problem_10_03"); //Bau deine Hütte nicht an den Graben, haben sie gesagt.
	AI_Output(self, other, "DIA_Kyle_Problem_10_03"); //Říkali: Nestav tu chatrč tak blízko u příkopu.
//	AI_Output(self,other,"DIA_Kyle_Problem_10_04"); //But none of these bastards told me what would happen if I still did it.
//	AI_Output(self,other,"DIA_Kyle_Problem_10_04"); //Aber keiner von den Pennern hat mir gesagt, was passiert, wenn ich es doch tue.
	AI_Output(self, other, "DIA_Kyle_Problem_10_04"); //Nikdo z těch pobudů mi ale neřekl, co se stane, když to udělám.
//	AI_Output(self,other,"DIA_Kyle_Problem_10_05"); //When I came back from the mine a few days ago, I had a second door.
//	AI_Output(self,other,"DIA_Kyle_Problem_10_05"); //Als ich vor ein paar Tagen aus der Mine wiederkam, hatte ich 'ne zweite Tür.
	AI_Output(self, other, "DIA_Kyle_Problem_10_05"); //Když jsem se za pár dní vrátil z dolu, měl jsem tu druhé dveře.
//	AI_Output(self,other,"DIA_Kyle_Problem_10_06"); //Those pigs. I hate them. I can't tell you how much I hate them.
//	AI_Output(self,other,"DIA_Kyle_Problem_10_06"); //Diese Schweine. Ich hasse sie. Ich kann dir gar nicht sagen, wie ich sie hasse!
	AI_Output(self, other, "DIA_Kyle_Problem_10_06"); //Ti hajzlové! Nenávidím je! Ani nedokážu říci, jak strašně je nenávidím!
//	AI_Output(self,other,"DIA_Kyle_Problem_10_07"); //Now everybody runs through my hut. Every idiot.
//	AI_Output(self,other,"DIA_Kyle_Problem_10_07"); //Jetzt rennt jeder durch meine Hütte. Jeder Arsch.
	AI_Output(self, other, "DIA_Kyle_Problem_10_07"); //Každý teď prochází mojí chatrčí. Každý idiot.
};
