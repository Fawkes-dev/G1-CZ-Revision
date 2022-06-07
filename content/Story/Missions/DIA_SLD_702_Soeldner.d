// ********************************
// 				EXIT
// ********************************

instance DIA_Sld_702_EXIT(C_INFO)
{
	npc = Sld_702_Soeldner;
	nr = 999;
	condition = DIA_Sld_702_EXIT_Condition;
	information = DIA_Sld_702_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Sld_702_EXIT_Condition()
{
	return 1;
};

func void DIA_Sld_702_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Sld_702_First(C_INFO)
{
	npc = Sld_702_Soeldner;
	nr = 1;
	condition = DIA_Sld_702_First_Condition;
	information = DIA_Sld_702_First_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Sld_702_First_Condition()
{
	if (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};

	return 0;
};

func void DIA_Sld_702_First_Info()
{
//	AI_Output(self,other,"DIA_Sld_702_First_04_00"); //D'you know where you're heading?
//	AI_Output(self,other,"DIA_Sld_702_First_04_00"); //Du weißt, wo du hier hinkommst?
	AI_Output(self,other,"DIA_Sld_702_First_04_00"); //Víš, kam jdeš?
//	AI_Output(other,self,"DIA_Sld_702_First_15_01"); //Where?
//	AI_Output(other,self,"DIA_Sld_702_First_15_01"); //Wohin?
	AI_Output(other,self,"DIA_Sld_702_First_15_01"); //Kam?
//	AI_Output(self,other,"DIA_Sld_702_First_04_02"); //You're heading straight for Lee, our leader.
//	AI_Output(self,other,"DIA_Sld_702_First_04_02"); //Hier geht es zu Lee, unserem Anführer.
	AI_Output(self,other,"DIA_Sld_702_First_04_02"); //Jdeš přímo k Leeovi, našemu vůdci.
};

// ********************************
// 				PERM
// ********************************

instance DIA_Sld_702_PERM(C_INFO)
{
	npc = Sld_702_Soeldner;
	nr = 1;
	condition = DIA_Sld_702_PERM_Condition;
	information = DIA_Sld_702_PERM_Info;
	important = 0;
	permanent = 1;
//	description = "What do I need to do to make you let me see Lee?";
//	description = "Was muss ich machen, damit du mich zu Lee läßt?";
	description = "Co musím udělat, abys mě k Leeovi pustil?";
};

func int DIA_Sld_702_PERM_Condition()
{
	//TODO: this dialogue should be available only after DIA_Sld_702_First was told
	return 1;
};

func void DIA_Sld_702_PERM_Info()
{
//	AI_Output(other,self,"DIA_Sld_702_PERM_15_00"); //What do I need to do to make you let me see Lee?
//	AI_Output(other,self,"DIA_Sld_702_PERM_15_00"); //Was muss ich machen, damit du mich zu Lee läßt?
	AI_Output(other,self,"DIA_Sld_702_PERM_15_00"); //Co musím udělat, abys mě k Leeovi pustil?
//	AI_Output(self,other,"DIA_Sld_702_PERM_04_01"); //Nothing!
//	AI_Output(self,other,"DIA_Sld_702_PERM_04_01"); //Gar nichts!
	AI_Output(self,other,"DIA_Sld_702_PERM_04_01"); //Nic!
//	AI_Output(self,other,"DIA_Sld_702_PERM_04_02"); //This isn't the Old Camp, and Lee isn't Gomez!
//	AI_Output(self,other,"DIA_Sld_702_PERM_04_02"); //Das hier ist nicht das alte Lager und Lee ist nicht Gomez!
	AI_Output(self,other,"DIA_Sld_702_PERM_04_02"); //Tohle není Starý tábor a Lee není Gomez!
//	AI_Output(self,other,"DIA_Sld_702_PERM_04_03"); //He doesn't need an army of henchmen to hide behind. He can defend himself.
//	AI_Output(self,other,"DIA_Sld_702_PERM_04_03"); //Er braucht keine Armee von Schergen, hinter denen er sich verstecken kann. Er kann sich selber verteidigen.
	AI_Output(self,other,"DIA_Sld_702_PERM_04_03"); //Nepotřebuje žádnou armádu lokajů, za které by se mohl schovat. Dokáže se ubránit sám!
//	AI_Output(self,other,"DIA_Sld_702_PERM_04_04"); //WE are only here in case he needs us.
//	AI_Output(self,other,"DIA_Sld_702_PERM_04_04"); //WIR sind nur hier, falls er uns braucht.
	AI_Output(self,other,"DIA_Sld_702_PERM_04_04"); //MY jsme tady jen pro případ, kdyby nás potřeboval.
};
