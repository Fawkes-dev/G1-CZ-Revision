instance GUR_1212_MadCorKalom_Talk2SC(C_INFO)
{
	npc = GUR_1212_MadCorKalom;
	condition = GUR_1212_MadCorKalom_Talk2SC_Condition;
	information = GUR_1212_MadCorKalom_Talk2SC_Info;
	important = 1;
	permanent = 0;
};

func int GUR_1212_MadCorKalom_Talk2SC_Condition()
{
	return 1;
};

func void GUR_1212_MadCorKalom_Talk2SC_Info()
{
	AI_SetWalkMode(self, NPC_WALK);
	AI_GotoNpc(self, hero);

//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //At last we meet again!
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Schließlich sehen wir uns also wieder!
	AI_Output(self, hero, "GUR_1212_MadCorKalom_Talk2SC_10_01"); //Konečně se znovu setkáváme!
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //My master has already told me of your arrival!
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //Mein Meister hat mir bereits von deiner Ankunft berichtet!
	AI_Output(self, hero, "GUR_1212_MadCorKalom_Talk2SC_10_02"); //Můj mistr mi už vyprávěl o tvém příchodu!
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //He can sense that you're near.
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //Er kann deine Nähe spüren.
	AI_Output(self, hero, "GUR_1212_MadCorKalom_Talk2SC_10_03"); //Dokáže vycítit tvoji přítomnost.
//	AI_Output(hero,self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //I'll soon be nearer to him than he would like me to be!
//	AI_Output(hero,self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //Schon bald werde ich ihm näher sein, als ihm lieb ist!
	AI_Output(hero, self, "GUR_1212_MadCorKalom_Talk2SC_15_04"); //Brzy mu budu blíž, než se mu bude líbit.
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //We will not let you foil our plans.
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Wir werden nicht zulassen, dass du unsere Pläne durchkreuzt.
	AI_Output(self, hero, "GUR_1212_MadCorKalom_Talk2SC_10_05"); //Nenecháme tě zmařit naše plány.
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //The world is about to witness the awakening of the Redeemer, and nobody can stop him.
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //Die Welt steht kurz vor dem Erwachen des Erlösers und keiner kann ihn aufhalten.
	AI_Output(self, hero, "GUR_1212_MadCorKalom_Talk2SC_10_06"); //Svět se stane svědkem probuzení spasitele a nikdo ho nedokáže zastavit.
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //All the infidels out there will pay the price.
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //All die Ungläubigen da draußen werden ihren Preis bezahlen .
	AI_Output(self, hero, "GUR_1212_MadCorKalom_Talk2SC_10_07"); //Všichni bezvěrci, tam venku, splatí svůj dluh.
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //And you shall have the honor of being the first to pay.
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //Und du hast die Ehre, der Erste zu sein, der diesen Preis bezahlen darf .
	AI_Output(self, hero, "GUR_1212_MadCorKalom_Talk2SC_10_08"); //A tobě se dostane té cti zaplatit jako první.
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //SSSLLLLLLEEEEEEEEEEEPPPEEEEEERRRR AAWWWAAAAAAAAAAAKKKEEEEEENN!!!!!!!!!
//	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //SCHLÄÄÄÄÄÄÄÄÄÄFEEEEEEEEEEEER ERWAAAAAAAAAAAACHEEEEEEEEEEEEE !!!!!!!!!
	AI_Output(self, hero, "GUR_1212_MadCorKalom_Talk2SC_10_09"); //SSSPÁÁÁÁÁČČČIIII, PRROOBUUUĎĎĎ SSEEE!!!!!!!!

	AI_StopProcessInfos(self);

	Npc_SetAttitude(self, ATT_HOSTILE);
	Npc_SetTempAttitude(self, ATT_HOSTILE);

	AI_Wait(self, 2);
	Npc_SetTarget(self, hero);
	AI_StartState(self, ZS_Attack, 0, "");
};
