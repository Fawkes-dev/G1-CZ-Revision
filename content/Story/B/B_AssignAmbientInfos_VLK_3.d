// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Vlk_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_3 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Vlk_3_EXIT_Condition;
	information = Info_Vlk_3_EXIT_Info;
	permanent = 1;
	description = "END";
};

func int Info_Vlk_3_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Vlk_3_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Vlk_3_EinerVonEuchWerden_Condition;
	information = Info_Vlk_3_EinerVonEuchWerden_Info;
	permanent = 1;
//	description = "How can I join this camp?";
//	description = "Wie kann ich mich diesem Lager anschliessen?";
	description = "Jak se můžu přidat k táboru?";
};

func int Info_Vlk_3_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Vlk_3_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00"); //How can I join this camp?
//	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00"); //Wie kann ich mich diesem Lager anschließen?
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00"); //Jak se můžu přidat k táboru?
//	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01"); //I'm just a digger. I don't have no say in the matter. You should talk to the guards or the Shadows.
//	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01"); //Ich bin nur ein Buddler. Wir haben hier gar nichts zu sagen. Du solltest mit den Gardisten oder mit den Schatten reden.
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01"); //Já jsem akorát kopáč, takže ti k tomu nemám co říct. Měl by sis promluvit se strážemi nebo se Stíny.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Vlk_3_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Vlk_3_WichtigePersonen_Condition;
	information = Info_Vlk_3_WichtigePersonen_Info;
	permanent = 1;
//	description = "Who's the boss around here?";
//	description = "Wer ist hier der Boss?";
	description = "Kdo je tady šéf?";
};

func int Info_Vlk_3_WichtigePersonen_Condition()
{
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
func void Info_Vlk_3_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00"); //Who's the boss around here?
//	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00"); //Wer ist hier der Boss?
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00"); //Kdo je tady šéf?
//	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01"); //Gomez. He lives in the castle. But we diggers have enough to worry about with the guards.
//	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01"); //Gomez. Er lebt in der Burg. Aber wir Buddler haben immer nur mit seinen Gardisten zu tun.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01"); //Gomez. Žije na hradě. Ale my kopáči se máme pořádně na pozoru před strážemi.
//	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02"); //It's best if you just keep out of their way. If you don't, you have a problem.
//	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02"); //Am besten ist es, wenn sie dich gar nicht bemerken. Sobald du hier auffällst, hast du ein Problem.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02"); //Nejlepší je, jít jim z cesty. Pokud tak neuděláš, máš malér.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Vlk_3_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Vlk_3_DasLager_Condition;
	information = Info_Vlk_3_DasLager_Info;
	permanent = 1;
//	description = "What are the most important places here?";
//	description = "Was gibt es hier für wichtige Orte?";
	description = "Jaký jsou tady nejdůležitější místa?";
};

func int Info_Vlk_3_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_3_DasLager_Info()
{
//	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00"); //What are the most important places here?
//	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00"); //Was gibt es hier für wichtige Orte?
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00"); //Jaký jsou tady nejdůležitější místa?
//	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01"); //Well, if you like to gamble, you have to go to the arena in the evenings. If you want to buy things, go to the market place.
//	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01"); //Nun, wenn du wetten willst, geh abends in die Arena. Wenn du Sachen kaufen willst, gehst du am besten zum Marktplatz.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01"); //Jestli rád sázíš, musíš zajít večer do arény. Jestli si chceš něco koupit, zajdi na tržiště.
//	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02"); //They sell practically everything there. Except maps. You want maps, you'd better go and see Graham. His hut's the one just opposite the castle gate.
//	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02"); //Da kriegt du fast alles. Außer Karten. Wenn du Karten kaufen willst, geh zu Graham. Seine Hütte ist schräg gegenüber dem Burgtor.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02"); //Prodávají tam prakticky všechno. Jestli chceš mapy, zajdi ke Grahamovi. Jeho chatrč je přímo naproti hradní bráně.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Vlk_3_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Vlk_3_DieLage_Condition;
	information = Info_Vlk_3_DieLage_Info;
	permanent = 1;
//	description = "What's up?";
//	description = "Wie steht's?";
	description = "Co se děje?";
};

func int Info_Vlk_3_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_3_DieLage_Info()
{
//	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00"); //What's up?
//	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00"); //Wie steht's?
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00"); //Co se děje?
//	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01"); //You'll learn soon enough. Be on your guard at all times. Especially at night.
//	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01"); //Du wirst es auch noch lernen. Immer wachsam bleiben. Selbst nachts.
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01"); //Brzy se dozvíš víc. Měj se pořád na pozoru. Hlavně v noci.
//	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02"); //I haven't slept properly for days. And if you don't sleep in this colony, then you're doing double time!
//	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02"); //Ich habe schon seit Tagen nicht mehr richtig geschlafen. Und wer hier in der Kolonie nicht schläft, sitzt die doppelte Zeit ab!
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02"); //Už jsem se celé dny pořádně nevyspal. Jestli nemůžeš spát v kolonii, pak budeš mít dvakrát víc času!
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Vlk_3(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);

	Info_Vlk_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DieLage.npc = Hlp_GetInstanceID(slf);
};
