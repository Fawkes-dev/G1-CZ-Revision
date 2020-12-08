// **************************************************
//  EXIT 
// **************************************************

instance DIA_Grd_215_Torwache_Exit(C_INFO)
{
	npc = Grd_215_Torwache;
	nr = 999;
	condition = DIA_Grd_215_Torwache_Exit_Condition;
	information = DIA_Grd_215_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Grd_215_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_215_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// Erstes Mal aufkreuzen
// **************************************************

instance DIA_Grd_215_Torwache_First(C_INFO)
{
	npc = Grd_215_Torwache;
	nr = 2;
	condition = DIA_Grd_215_Torwache_First_Condition;
	information = DIA_Grd_215_Torwache_First_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Grd_215_Torwache_First_Condition()
{ 
	if (!Npc_KnowsInfo(hero,DIA_Grd_216_First))  //Wenn der SC nicht durchs Hintertor rein ist.
	&& (Kapitel < 2)
	{
		return 1;
	};
};

func void DIA_Grd_215_Torwache_First_Info()
{
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_00"); //Where d'you think you're going?
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_00"); //Wo soll's denn hingehen?
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_00"); //Kam máš namířeno?
//	AI_Output(other,self,"DIA_Grd_215_Torwache_First_15_01"); //To the Camp.
//	AI_Output(other,self,"DIA_Grd_215_Torwache_First_15_01"); //Ich will ins Lager.
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_15_01"); //Do tábora.
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_02"); //You ain't come to make trouble, have you?
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_02"); //Du bist doch nicht hergekommen, um Ärger zu machen, oder?
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_02"); //Nechceš se dostat do problémů, viď?

	Info_ClearChoices(DIA_Grd_215_Torwache_First);
//	Info_AddChoice(DIA_Grd_215_Torwache_First,"Sure, I plan to take on the whole Camp!",DIA_Grd_215_Torwache_First_Trouble);
//	Info_AddChoice(DIA_Grd_215_Torwache_First,""Klar, ich hatte mir vorgenommen, das ganze Lager auseinanderzunehmen!"		",DIA_Grd_215_Torwache_First_Trouble);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Jistě, mám v úmyslu zabrat celý tábor.",DIA_Grd_215_Torwache_First_Trouble);
//	Info_AddChoice(DIA_Grd_215_Torwache_First,"I just want to take a look around.",DIA_Grd_215_Torwache_First_JustLooking);
//	Info_AddChoice(DIA_Grd_215_Torwache_First,""Ich will mich nur ein bißchen umsehen."		",DIA_Grd_215_Torwache_First_JustLooking);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Chci se tu jenom porozhlédnout.",DIA_Grd_215_Torwache_First_JustLooking);
	if (Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	{
//		Info_AddChoice(DIA_Grd_215_Torwache_First,"Diego says I'm to meet him in the Camp.",DIA_Grd_215_Torwache_First_Diego);
//		Info_AddChoice(DIA_Grd_215_Torwache_First,""Diego hat gesagt, ich soll ihn im Lager treffen."	",DIA_Grd_215_Torwache_First_Diego);
		Info_AddChoice(DIA_Grd_215_Torwache_First,"Diego řekl, že ho mám v táboře navštívit.",DIA_Grd_215_Torwache_First_Diego);
	};
};

func void DIA_Grd_215_Torwache_First_Trouble()
{
//	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Trouble_15_00"); //Sure, I plan to take on the whole Camp!
//	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Trouble_15_00"); //Klar, ich hatte mir vorgenommen, das ganze Lager auseinander zu nehmen!
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Trouble_15_00"); //Jistě, mám v úmyslu zabrat celý tábor.
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Trouble_06_01"); //Hey, this guy's funny... I don't like funny guys.
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Trouble_06_01"); //Ein witziger Kerl ... Ich mag keine witzigen Kerle.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Trouble_06_01"); //No, to je pěknej šprýmař... A já nemám šprýmaře rád .
	Info_ClearChoices(DIA_Grd_215_Torwache_First);

	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack, 1, ""); 
};

func void DIA_Grd_215_Torwache_First_JustLooking()
{
//	AI_Output(other,self,"DIA_Grd_215_Torwache_First_JustLooking_15_00"); //I just want to take a look around.
//	AI_Output(other,self,"DIA_Grd_215_Torwache_First_JustLooking_15_00"); //Ich will mich nur ein bisschen umsehen.
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_JustLooking_15_00"); //Chci se tu jenom porozhlédnout.
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_JustLooking_06_01"); //That'll cost you 10 ore.
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_JustLooking_06_01"); //Umsehen kostet 10 Erz.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_JustLooking_06_01"); //To tě bude stát 10 nugetů.

	Info_ClearChoices(DIA_Grd_215_Torwache_First);
//	Info_AddChoice(DIA_Grd_215_Torwache_First,"Forget it.",DIA_Grd_215_Torwache_First_NoPay);
//	Info_AddChoice(DIA_Grd_215_Torwache_First,""Vergiß es."					",DIA_Grd_215_Torwache_First_NoPay);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Na to zapomeň.",DIA_Grd_215_Torwache_First_NoPay);
//	Info_AddChoice(DIA_Grd_215_Torwache_First,"Okay, here's your 10 ore.",DIA_Grd_215_Torwache_First_Pay);
//	Info_AddChoice(DIA_Grd_215_Torwache_First,""Gut, hier sind deine 10 Erz."	",DIA_Grd_215_Torwache_First_Pay);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Dobrá, tady je tvých 10 nugetů.",DIA_Grd_215_Torwache_First_Pay);
};

func void DIA_Grd_215_Torwache_First_Diego()
{
//	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Diego_15_00"); //Diego says I'm to meet him in the Camp.
//	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Diego_15_00"); //Diego hat gesagt, ich soll ihn im Lager treffen.
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Diego_15_00"); //Diego řekl, že ho mám v táboře navštívit.
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Diego_06_01"); //Okay - in you go, then.
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Diego_06_01"); //Gut - du kannst reingehen.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Diego_06_01"); //Dobrá, pak tedy pojď dál.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
};

func void DIA_Grd_215_Torwache_First_NoPay()
{
//	AI_Output(other,self,"DIA_Grd_215_Torwache_First_NoPay_15_00"); //Forget it.
//	AI_Output(other,self,"DIA_Grd_215_Torwache_First_NoPay_15_00"); //Vergiss es.
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_NoPay_15_00"); //Na to zapomeň.
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_NoPay_06_01"); //Then beat it.
//	AI_Output(self,other,"DIA_Grd_215_Torwache_First_NoPay_06_01"); //Dann zisch ab.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_NoPay_06_01"); //Pak vypadni.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
};

func void DIA_Grd_215_Torwache_First_Pay()
{
	if (Npc_HasItems(other,itminugget) >= 10)
	{
//		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_15_00"); //Okay, here's your 10 ore.
//		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_15_00"); //Gut, hier sind deine 10 Erz.
		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_15_00"); //Dobrá, tady je tvých 10 nugetů.
//		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_06_01"); //Get along in then.
//		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_06_01"); //Dann mal immer rein mit dir.
		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_06_01"); //Pak pojď dál.
		B_GiveInvItems(other,self,itminugget,10);CreateInvItems(self,itminugget,10);
	}
	else
	{
//		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00"); //I don't have that much with me.
//		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00"); //So viel hab' ich nicht.
		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00"); //Tolik u sebe nemám.
//		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01"); //I'll make an exception, just this once, 'cos you're new here.
//		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01"); //Diesmal mach' ich noch 'ne Ausnahme - weil du neu bist .
		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01"); //Pro tentokrát udělám výjimku, protože jsi tu nový.

	};

	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

// **************************************************
// PERM
// **************************************************

instance DIA_Grd_215_Torwache_PERM(C_INFO)
{
	npc = Grd_215_Torwache;
	nr = 1;
	condition = DIA_Grd_215_Torwache_PERM_Condition;
	information = DIA_Grd_215_Torwache_PERM_Info;
	permanent = 1;
//	description = "Any news?";
//	description = "Irgendwas Neues passiert?";
	description = "Něco nového?";
};                       

func int DIA_Grd_215_Torwache_PERM_Condition()
{
	return 1;
};

func void DIA_Grd_215_Torwache_PERM_Info()
{
//	AI_Output(other,self,"DIA_Grd_215_Torwache_PERM_15_00"); //Any news?
//	AI_Output(other,self,"DIA_Grd_215_Torwache_PERM_15_00"); //Irgendwas Neues passiert?
	AI_Output(other,self,"DIA_Grd_215_Torwache_PERM_15_00"); //Něco nového?
//	AI_Output(self,other,"DIA_Grd_215_Torwache_PERM_06_01"); //Nah. Everything's the same as ever.
//	AI_Output(self,other,"DIA_Grd_215_Torwache_PERM_06_01"); //Nein. Alles wie immer.
	AI_Output(self,other,"DIA_Grd_215_Torwache_PERM_06_01"); //Ne. Všechno při starém.
};
