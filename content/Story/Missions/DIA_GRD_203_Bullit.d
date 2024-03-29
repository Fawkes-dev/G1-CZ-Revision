//******************************************
//					EXIT
//******************************************

instance DIA_Bullit_Exit(C_INFO)
{
	npc = GRD_203_Bullit;
	nr = 999;
	condition = DIA_Bullit_Exit_Condition;
	information = DIA_Bullit_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Bullit_Exit_Condition()
{
	return 1;
};

func void DIA_Bullit_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//******************************************
//					First
//******************************************

instance DIA_Bullit_First(C_INFO)
{
	npc = GRD_203_Bullit;
	nr = 1;
	condition = DIA_Bullit_First_Condition;
	information = DIA_Bullit_First_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Bullit_First_Condition()
{
	return 1;
};

func void DIA_Bullit_First_Info()
{
//	AI_Output(self,other,"DIA_Bullit_First_06_00"); //Who have we here? Ain't you the guy I baptized earlier? What do you want? You come back for more?
//	AI_Output(self,other,"DIA_Bullit_First_06_00"); //Wen haben wir denn da? Du bist doch der Typ, den ich getauft habe? Was willst du? Noch mehr Schläge?
	AI_Output(self,other,"DIA_Bullit_First_06_00"); //Kohopak to tady máme? Není to ten hoch, kterého jsem pokřtil? Co chceš? Další ránu?
};

//******************************************
//				Aufs Maul
//******************************************

instance DIA_Bullit_AufsMAul(C_INFO)
{
	npc = GRD_203_Bullit;
	nr = 1;
	condition = DIA_Bullit_AufsMAul_Condition;
	information = DIA_Bullit_AufsMAul_Info;
	permanent = 0;
//	description = "I've come to stuff your big mouth for you.";
//	description = "Ich bin gekommen, um dir dein großes Maul zu stopfen.";
	description = "Přišel jsem, abych ti zacpal tu tvojí velkou hubu.";
};

func int DIA_Bullit_AufsMAul_Condition()
{
	return 1;
};

func void DIA_Bullit_AufsMAul_Info()
{
//	AI_Output(other,self,"DIA_Bullit_AufsMAul_15_00"); //I've come to stuff your big mouth for you.
//	AI_Output(other,self,"DIA_Bullit_AufsMAul_15_00"); //Ich bin gekommen, um dir dein großes Maul zu stopfen.
	AI_Output(other,self,"DIA_Bullit_AufsMAul_15_00"); //Přišel jsem, abych ti zacpal tu tvojí velkou hubu.
//	AI_Output(self,other,"DIA_Bullit_AufsMAul_06_01"); //Hah, well come here an' give it a try, sonny!
//	AI_Output(self,other,"DIA_Bullit_AufsMAul_06_01"); //Ja, dann komm mal her, Bürschchen!
	AI_Output(self,other,"DIA_Bullit_AufsMAul_06_01"); //Ha, tak pojď a zkus to, chlapečku!

	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);

	AI_StopProcessInfos(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack, 1, "");
};

// *****************************************************
// 				Wartet auf den SC
// *****************************************************

instance DIA_GRD_203_Bullit_Wait4SC(C_INFO)
{
	npc = GRD_203_Bullit;
	condition = DIA_GRD_203_Bullit_Wait4SC_Condition;
	information = DIA_GRD_203_Bullit_Wait4SC_Info;
	important = 1;
	permanent = 0;
};

func int DIA_GRD_203_Bullit_Wait4SC_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD02 ))
	{
		return 1;
	};
};

func void DIA_GRD_203_Bullit_Wait4SC_Info()
{
//	AI_Output(self,other,"DIA_GRD_203_Bullit_Wait4SC_06_01"); //You again?! I should have drowned you in the lake the moment I set eyes on you!
//	AI_Output(self,other,"DIA_GRD_203_Bullit_Wait4SC_06_01"); //Du schon wieder. Ich hätte dich schon am ersten Tag im See versenken sollen!
	AI_Output(self,other,"DIA_GRD_203_Bullit_Wait4SC_06_01"); //Zase ty! Měl jsem tě utopit v jezeře hned, jak jsem tě poprvé uviděl!
//	AI_Output(other,self,"DIA_GRD_203_Bullit_Wait4SC_15_02"); //I didn't stand a chance back then - now the tables are turned.
//	AI_Output(other,self,"DIA_GRD_203_Bullit_Wait4SC_15_02"); //Damals hatte ich keine Chance - jetzt ist genau das Gegenteil der Fall.
	AI_Output(other,self,"DIA_GRD_203_Bullit_Wait4SC_15_02"); //Tehdy jsem neměl šanci - teď se ale karta obrátila.
//	AI_Output(self,other,"DIA_GRD_203_Bullit_Wait4SC_06_03"); //You worm! I only hope you don't make it as easy for me as you did the first time!
//	AI_Output(self,other,"DIA_GRD_203_Bullit_Wait4SC_06_03"); //Du Wurm! Ich hoffe, dass du es mir nicht so einfach machst, wie beim ersten Mal!
	AI_Output(self,other,"DIA_GRD_203_Bullit_Wait4SC_06_03"); //Ty červe! Jenom doufám, že mi to tentokrát tolik neusnadníš jako poprvé!

	AI_StopProcessInfos(self);

	self.guild = GIL_GRD;
	Npc_SetTrueGuild(self,GIL_GRD);

	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack, 1, "");
};
