// *********************** ERPRESSER ***********************

instance Info_Erpresser(C_INFO)
{
	npc = Org_888_Erpresser;
	nr = 1;
	condition = Info_Erpresser_Condition;
	information = Info_Erpresser_Info;
	important = 1;
	permanent = 1;
};

func int Info_Erpresser_Condition()
{
	if ((Npc_GetAttitude(self,other) != ATT_FRIENDLY)
	&& (self.aivar[AIV_HAS_ERPRESSED] == FALSE)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void Info_Erpresser_Info()
{
//	AI_Output(self,other,"Info_Erpresser_Info_13_01"); //Hey, boy, if you want to pass, you have to pay 10 ore or you'll be whacked, got it?
//	AI_Output(self,other,"Info_Erpresser_Info_13_01"); //Hey, Junge, wenn du hier vorbei willst, mußt du 10 Erz zahlen, oder du bekommst aufs Maul, kapiert?
	AI_Output(self,other,"Info_Erpresser_Info_13_01"); //Hej, hochu, jestli chceš dál, musíš zaplatit 10 nugetů, jinak poletíš, jasný?

	Info_ClearChoices(Info_Erpresser);
//	Info_AddChoice(Info_Erpresser,"Then why don't you come here and get your ore!", Info_Erpresser_Choice_AufsMaul);
//	Info_AddChoice(Info_Erpresser,"Dann komm doch her und hol dir dein Erz!", Info_Erpresser_Choice_AufsMaul);
	Info_AddChoice(Info_Erpresser,"Tak pojď dál a dej svoji rudu!", Info_Erpresser_Choice_AufsMaul);
//	Info_AddChoice(Info_Erpresser,"Three ore? That's not much. Here you go ...", Info_Erpresser_Choice_Zahlen);
//	Info_AddChoice(Info_Erpresser,"Drei Erz? Das ist nicht viel. Hier nimm...", Info_Erpresser_Choice_Zahlen);
	Info_AddChoice(Info_Erpresser,"Tři nugety? To není moc. Tady, vezmi si...", Info_Erpresser_Choice_Zahlen);
};

func void Info_Erpresser_Choice_AufsMaul()
{
//	AI_Output(other,self,"Info_Erpresser_Choice_AufsMaul_15_01"); //Then why don't you come here and get your ore!
//	AI_Output(other,self,"Info_Erpresser_Choice_AufsMaul_15_01"); //Dann komm doch her und hol dir dein Erz!
	AI_Output(other,self,"Info_Erpresser_Choice_AufsMaul_15_01"); //Tak pojď dál a dej svoji rudu!
//	AI_Output(self,other,"Info_Erpresser_Choice_AufsMaul_13_02"); //Thanks, man. You just made my day.
//	AI_Output(self,other,"Info_Erpresser_Choice_AufsMaul_13_02"); //Danke, Mann. Du rettest mir den Tag.
	AI_Output(self,other,"Info_Erpresser_Choice_AufsMaul_13_02"); //Díky, člověče. Právě jsi mi udělal hezkej den!

	self.aivar[AIV_HAS_ERPRESSED] = 2;

	AI_StopProcessInfos(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack, 1,"");
};

func void Info_Erpresser_Choice_Zahlen()
{
	if (Npc_HasItems(other,ITMINUGGET) >= 3)
	{
//		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_01"); //Here, 10 ore.
//		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_01"); //Hier, 10 Erz.
		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_01"); //Tady je 10 nugetů.
//		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_02"); //A shame.
//		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_02"); //Schade.
		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_02"); //Hanba.

		self.aivar[AIV_HAS_ERPRESSED] = 1;
	}
	else // SC hat keine 3 Erz
	{
//		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_03"); //Umm... I just don't have 10 ore right now...
//		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_03"); //Ähm... hab' gerade keine 10 Erz...
		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_03"); //Hmmm... Teď právě nemám 10 nugetů...
//		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_04"); //That's a shame...
//		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_04"); //Das ist aber schade...
		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_04"); //To je škoda...

		self.aivar[AIV_HAS_ERPRESSED] = 2;

		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack, 1,"");
	};

	AI_StopProcessInfos(self);
};

// ****************** für HAS_ERPRESSED == 1 (gezahlt) *********************

instance Info_BereitsErpresst(C_INFO)
{
	npc = Org_888_Erpresser;
	nr = 1;
	condition = Info_BereitsErpresst_Condition;
	information = Info_BereitsErpresst_Info;
	important = 1;
	permanent = 1;
};

func int Info_BereitsErpresst_Condition()
{
	if ((self.aivar[AIV_HAS_ERPRESSED] == 1) && (Npc_IsInState(self,ZS_Talk)))
	{
		return 1;
	};

	return 0;
};

func void Info_BereitsErpresst_Info()
{
//	AI_Output(self,other,"Info_BereitsErpresst_Info_13_02"); //You've paid. You may pass. Now go before I change my mind.
//	AI_Output(self,other,"Info_BereitsErpresst_Info_13_02"); //Du hast bezahlt. Du kannst vorbei. Geh jetzt, bevor ich's mir anders überlege.
	AI_Output(self,other,"Info_BereitsErpresst_Info_13_02"); //Zaplatil jsi. Můžeš dál. Jdi, než si to rozmyslím.
};

// ****************** für HAS_ERPRESSED == 2 (Aufs Maul) *********************

instance Info_BereitsAufsMaul(C_INFO)
{
	npc = Org_888_Erpresser;
	nr = 1;
	condition = Info_BereitsAufsMaul_Condition;
	information = Info_BereitsAufsMaul_Info;
	important = 1;
	permanent = 1;
};

func int Info_BereitsAufsMaul_Condition()
{
	if ((self.aivar[AIV_HAS_ERPRESSED] == 2)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE)
	&& (Npc_IsInState(self,ZS_Talk)))
	{
		return 1;
	};

	return 0;
};

func void Info_BereitsAufsMaul_Info()
{
//	AI_Output(self,other,"Info_BereitsAufsMaul_Info_13_02"); //Get lost, before I wipe that dumb look off your face for you!
//	AI_Output(self,other,"Info_BereitsAufsMaul_Info_13_02"); //Mach, dass du wegkommst, oder ich hau dir noch eins aufs Maul!
	AI_Output(self,other,"Info_BereitsAufsMaul_Info_13_02"); //Ztrať se, než ti ten přihlouplej ciferník rozmáznu!
};

// ************************ EXIT **************************

instance Info_Exit(C_INFO)
{
	npc = Org_888_Erpresser;
	nr = 999;
	condition = Info_Exit_Condition;
	information = Info_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Exit_Condition()
{
	return 1;
};

func void Info_Exit_Info()
{
	AI_StopProcessInfos(self);
};
