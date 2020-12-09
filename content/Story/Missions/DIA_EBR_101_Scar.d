// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance DIA_SCAR_EXIT(C_INFO)
{
	npc = Ebr_101_Scar;
	nr = 999;
	condition = DIA_SCAR_EXIT_Condition;
	information = DIA_SCAR_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_SCAR_EXIT_Condition()
{
	return 1;
};

func void DIA_SCAR_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

instance DIA_SCAR_Hello(C_INFO)
{
	npc = Ebr_101_Scar;
	nr = 3;
	condition = DIA_SCAR_Hello_Condition;
	information = DIA_SCAR_Hello_Info;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};                       

func int DIA_SCAR_Hello_Condition()
{
	return 1;
};

func void DIA_SCAR_Hello_Info()
{ 
//	AI_Output(other,self,"DIA_SCAR_Hello_15_00"); //Who are you?
//	AI_Output(other,self,"DIA_SCAR_Hello_15_00"); //Wer bist du?
	AI_Output(other,self,"DIA_SCAR_Hello_15_00"); //Kdo jsi?
//	AI_Output(self,other,"DIA_SCAR_Hello_08_01"); //They call me Scar.
//	AI_Output(self,other,"DIA_SCAR_Hello_08_01"); //Sie nennen mich Scar.
	AI_Output(self,other,"DIA_SCAR_Hello_08_01"); //Říkají mi Scar.
};

// ************************************************************
// 							What
// ************************************************************

instance DIA_SCAR_What(C_INFO)
{
	npc = Ebr_101_Scar;
	nr = 3;
	condition = DIA_SCAR_What_Condition;
	information = DIA_SCAR_What_Info;
	permanent = 0;
//	description = "What's your job?";
//	description = "Was ist deine Aufgabe hier?";
	description = "Co je tvá práce?";
};                       

func int DIA_SCAR_What_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

func void DIA_SCAR_What_Info()
{ 
//	AI_Output(other,self,"DIA_SCAR_What_15_00"); //What's your job?
//	AI_Output(other,self,"DIA_SCAR_What_15_00"); //Was ist deine Aufgabe hier?
	AI_Output(other,self,"DIA_SCAR_What_15_00"); //Co je tvá práce?
//	AI_Output(self,other,"DIA_SCAR_What_08_01"); //Me and Arto make sure nobody gets to see Gomez unless they're invited.
//	AI_Output(self,other,"DIA_SCAR_What_08_01"); //Ich und Arto passen auf, dass Gomez niemand zu nahe kommt, der hier nicht eingeladen wurde,
	AI_Output(self,other,"DIA_SCAR_What_08_01"); //Spolu s Artem dáváme pozor, aby se nikdo nedostal ke Gomezovi bez pozvání.
//	AI_Output(self,other,"DIA_SCAR_What_08_02"); //And I make sure the women don't get restless.
//	AI_Output(self,other,"DIA_SCAR_What_08_02"); //Außerdem kümmere ich mich darum, dass die Frauen hier nicht zu kurz kommen .
	AI_Output(self,other,"DIA_SCAR_What_08_02"); //A já dávám pozor na ženy, aby je nikdo nerušil.
};

// ************************************************************
// 							Frau
// ************************************************************

instance DIA_SCAR_Frau(C_INFO)
{
	npc = Ebr_101_Scar;
	nr = 3;
	condition = DIA_SCAR_Frau_Condition;
	information = DIA_SCAR_Frau_Info;
	permanent = 0;
//	description = "When they threw me in here, I saw a woman being brought down...";
//	description = "Als sie mich reingeworfen haben, habe ich eine Frau gesehen.";
	description = "Když mě sem uvrhli, viděl jsem jednu ženu, jak ji posílají dolů se zbožím.";
};                       

func int DIA_SCAR_Frau_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_SCAR_What))
	{
		return 1;
	};
};

func void DIA_SCAR_Frau_Info()
{ 
//	AI_Output(other,self,"DIA_SCAR_Frau_15_00"); //When they threw me in here, I saw a woman being brought down with the goods.
//	AI_Output(other,self,"DIA_SCAR_Frau_15_00"); //Als sie mich reingeworfen haben, habe ich gesehen, wie eine Frau zusammen mit den Waren heruntergefahren wurde.
	AI_Output(other,self,"DIA_SCAR_Frau_15_00"); //Když mě sem uvrhli, viděl jsem jednu ženu, jak ji posílají dolů se zbožím.
//	AI_Output(self,other,"DIA_SCAR_Frau_08_01"); //So what?
//	AI_Output(self,other,"DIA_SCAR_Frau_08_01"); //Und?
	AI_Output(self,other,"DIA_SCAR_Frau_08_01"); //A co?
//	AI_Output(other,self,"DIA_SCAR_Frau_15_02"); //Is she here?
//	AI_Output(other,self,"DIA_SCAR_Frau_15_02"); //Ist sie hier?
	AI_Output(other,self,"DIA_SCAR_Frau_15_02"); //Je tady?
//	AI_Output(self,other,"DIA_SCAR_Frau_08_03"); //Look, in case you're interested in her, let me give you some advice: Forget her.
//	AI_Output(self,other,"DIA_SCAR_Frau_08_03"); //Wenn du dich für sie interessierst, geb' ich dir einen guten Rat: Vergiss sie.
	AI_Output(self,other,"DIA_SCAR_Frau_08_03"); //Poslyš, jestli se ti líbí, dám ti jednu radu. Zapomeň na ni.
//	AI_Output(self,other,"DIA_SCAR_Frau_08_04"); //She's only just got here and Gomez has her locked in his room.
//	AI_Output(self,other,"DIA_SCAR_Frau_08_04"); //Sie ist gerade angekommen und Gomez hat sie bei sich auf dem Zimmer eingesperrt.
	AI_Output(self,other,"DIA_SCAR_Frau_08_04"); //Jenom sem přišla a Gomez ji zamkl v místnosti.
//	AI_Output(self,other,"DIA_SCAR_Frau_08_05"); //When he's done with her, he might just send her down. But for now, she's HIS - so you'd better take your mind off her.
//	AI_Output(self,other,"DIA_SCAR_Frau_08_05"); //Wenn er sie 'ne Zeit lang gehabt hat, schickt er sie vielleicht runter. Aber jetzt gehört sie IHM - also verschwende besser keinen Gedanken an sie.
	AI_Output(self,other,"DIA_SCAR_Frau_08_05"); //Až s ní bude hotový, mohl by ji poslat dolu. Ale teď je JEHO - takže bude lepší, když na ni zapomeneš.
};

// ************************************************************
// 							PERM
// ************************************************************

instance DIA_SCAR_PERM(C_INFO)
{
	npc = Ebr_101_Scar;
	nr = 3;
	condition = DIA_SCAR_PERM_Condition;
	information = DIA_SCAR_PERM_Info;
	permanent = 1;
//	description = "Is there anything you can tell me about Gomez?";
//	description = "Kannst du mir etwas über Gomez erzählen?";
	description = "Můžeš mi něco říci o Gomezovi?";
};                       

func int DIA_SCAR_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

func void DIA_SCAR_PERM_Info()
{ 
//	AI_Output(other,self,"DIA_SCAR_PERM_15_00"); //Is there anything you can tell me about Gomez?
//	AI_Output(other,self,"DIA_SCAR_PERM_15_00"); //Kannst du mir etwas über Gomez erzählen?
	AI_Output(other,self,"DIA_SCAR_PERM_15_00"); //Můžeš mi něco říci o Gomezovi?
//	AI_Output(self,other,"DIA_SCAR_PERM_08_01"); //All you need to know is that he's the most powerful man in the colony.
//	AI_Output(self,other,"DIA_SCAR_PERM_08_01"); //Über ihn musst du nur wissen, dass er der mächtigste Mann der Kolonie ist.
	AI_Output(self,other,"DIA_SCAR_PERM_08_01"); //Všechno, co potřebuješ vědět je to, že je to nejmocnější muž v kolonii.
//	AI_Output(self,other,"DIA_SCAR_PERM_08_02"); //He gets what he wants, but all he really wants is power.
//	AI_Output(self,other,"DIA_SCAR_PERM_08_02"); //Er kann alles haben, was er will, aber das einzige, was ihn WIRKLICH interessiert, ist Einfluss.
	AI_Output(self,other,"DIA_SCAR_PERM_08_02"); //Dostane, co chce, ale to, co chce nejvíc, je moc.
};

