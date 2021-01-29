// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance DIA_Rufus_EXIT(C_INFO)
{
	npc = Bau_903_Rufus;
	nr = 999;
	condition = DIA_Rufus_EXIT_Condition;
	information = DIA_Rufus_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Rufus_EXIT_Condition()
{
	return 1;
};

func void DIA_Rufus_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

instance Info_Rufus_Wasser(C_INFO) // E1
{
	npc = Bau_903_Rufus;
	nr = 800;
	condition = Info_Rufus_Wasser_Condition;
	information = Info_Rufus_Wasser_Info;
	permanent = 1;
//	description = "Lefty sent me. I've brought you some water.";
//	description = "Lefty schickt mich. Ich hab' Wasser für dich.";
	description = "Poslal mě Lefty. Přinesl jsem ti trochu vody.";
};                       

func int Info_Rufus_Wasser_Condition()
{
	if ((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01)))
	&& (self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

func void Info_Rufus_Wasser_Info()
{
//	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Lefty sent me. I've brought you some water.
//	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Lefty schickt mich. Ich hab' Wasser für dich.
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Poslal mě Lefty. Přinesl jsem trochu vody.
	if (Npc_HasItems(other,ItFo_Potion_Water_01)>=1)
	{
//		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Thanks, man. My mouth's like a desert!
//		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Danke, Mann. Ich sterbe vor Durst.
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Díky, příteli! Umírám žízní.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if (C_BodystateContains(self,BS_SIT))
		{
			AI_StandUp(self);
			AI_TurnToNpc(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
//		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Water! Hey, man! There's none left! Don't tell me everyone got some except me, again?
//		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Wasser! Hey, Mann! Du hast nichts mehr! Haben wieder alle was gekriegt bis auf mich?
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Vodu! Hej, chlape! Už žádnou nemáš! Zase ji dostali všichni kromě mě?
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

instance DIA_Rufus_Hello(C_INFO)
{
	npc = Bau_903_Rufus;
	nr = 1;
	condition = DIA_Rufus_Hello_Condition;
	information = DIA_Rufus_Hello_Info;
	permanent = 0;
//	description = "Hi! I'm new here. I just wanted to know what goes on around here.";
//	description = "Hi! Ich bin neu hier. Wollte mal fragen, was hier so läuft.";
	description = "Zdar! Jsem tady nový. Jen jsem chtěl vědět, co se tu děje.";
};                       

func int DIA_Rufus_Hello_Condition()
{
	return 1;
};

func void DIA_Rufus_Hello_Info()
{ 
//	AI_Output(other,self,"DIA_Rufus_Hello_15_00"); //Hi! I'm new here. I just wanted to know what goes on around here.
//	AI_Output(other,self,"DIA_Rufus_Hello_15_00"); //Hi! Ich bin neu hier. Wollte mal fragen, was hier so läuft.
	AI_Output(other,self,"DIA_Rufus_Hello_15_00"); //Zdar! Jsem tady nový. Jen jsem chtěl vědět, co se tu děje.
//	AI_Output(self,other,"DIA_Rufus_Hello_02_01"); //Ask someone else, will ya. I do nothin' but work out here in the fields, I don't know nothin'.
//	AI_Output(self,other,"DIA_Rufus_Hello_02_01"); //Frag jemand anderen. Ich arbeite den ganzen Tag auf den Feldern und krieg nichts von dem mit, was hier läuft.
	AI_Output(self,other,"DIA_Rufus_Hello_02_01"); //Zeptej se někoho jiného. Celý den pracuji na polích a nestarám se o to, co se tu děje.
//	AI_Output(self,other,"DIA_Rufus_Hello_02_02"); //Man, I'd love to tell the Rice Lord to do his own damn dirty work!
//	AI_Output(self,other,"DIA_Rufus_Hello_02_02"); //Mann, wie gerne würd' ich zum Reislord gehen und ihm sagen, er soll seinen Scheiß alleine machen!
	AI_Output(self,other,"DIA_Rufus_Hello_02_02"); //Člověče, nejraději bych šel za Rýžovým Lordem a řekl mu, aby si tu svoji špinavou práci dělal sám!
};

// ************************************************************
// 						Warum arbeitest du
// ************************************************************

instance DIA_Rufus_Why(C_INFO)
{
	npc = Bau_903_Rufus;
	nr = 1;
	condition = DIA_Rufus_Why_Condition;
	information = DIA_Rufus_Why_Info;
	permanent = 0;
//	description = "If you don't like it, why are you working here?";
//	description = "Wenn's dir nicht gefällt, warum arbeitest du dann hier? ";
	description = "Když se ti to nelíbí, tak proč tu pracuješ?";
};                       

func int DIA_Rufus_Why_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void DIA_Rufus_Why_Info()
{ 
//	AI_Output(other,self,"DIA_Rufus_Why_15_00"); //If you don't like it, why are you working here?
//	AI_Output(other,self,"DIA_Rufus_Why_15_00"); //Wenn's dir nicht gefällt, warum arbeitest du dann hier?
	AI_Output(other,self,"DIA_Rufus_Why_15_00"); //Když se ti to nelíbí, tak proč tu pracuješ?
//	AI_Output(self,other,"DIA_Rufus_Why_02_01"); //It happened the first day I got here. Lefty, one of the thugs that works for the Rice Lord, came up to me and asked if I could lend a hand in the rice fields.
//	AI_Output(self,other,"DIA_Rufus_Why_02_01"); //Es war am ersten Tag als ich hier war. Lefty, einer der Schläger, die für den Reislord arbeiten, kam zu mir und fragte mich, ob ich mal kurz auf den Reisfeldern helfen könnte.
	AI_Output(self,other,"DIA_Rufus_Why_02_01"); //Stalo se to první den, když jsem sem přišel. Přišel ke mně Lefty, jeden z hrdlořezů, co dělají pro Rýžového Lorda, a zeptal se mě, jestli nechci na chvilku pomoci s prací na rýžových polích.
//	AI_Output(self,other,"DIA_Rufus_Why_02_02"); //Sure, I said. I was new here and I wanted to make myself useful.
//	AI_Output(self,other,"DIA_Rufus_Why_02_02"); //Klar, hab' ich gesagt. Ich war neu und wollte mich nützlich machen.
	AI_Output(self,other,"DIA_Rufus_Why_02_02"); //Jasně, řekl jsem. Byl jsem tu nový a chtěl jsem být užitečný.
//	AI_Output(self,other,"DIA_Rufus_Why_02_03"); //The next day, when I was taking a short rest, the guy turned up again.
//	AI_Output(self,other,"DIA_Rufus_Why_02_03"); //Als ich mich am nächsten Tag von der Arbeit ausruhte, steht der Typ schon wieder vor mir.
	AI_Output(self,other,"DIA_Rufus_Why_02_03"); //Když jsem příští den odpočíval, stál ten chlápek zase přede mnou.
//	AI_Output(self,other,"DIA_Rufus_Why_02_04"); //You don't wanna let your colleagues do all their work by themselves, do you?' he asked.
//	AI_Output(self,other,"DIA_Rufus_Why_02_04"); //Du willst doch nicht deine Kollegen ganz alleine schuften lassen?', hat er gesagt.
	AI_Output(self,other,"DIA_Rufus_Why_02_04"); //'Nechceš snad nechávat své kolegy, aby pracovali sami, že ne?' zeptal se.
//	AI_Output(self,other,"DIA_Rufus_Why_02_05"); //I told him I was exhausted from the previous day's work, that I needed a rest and all that. But he never listened.
//	AI_Output(self,other,"DIA_Rufus_Why_02_05"); //Ich hab' ihm erklärt, dass ich kaputt bin vom Tag vorher, dass ich mich ausruhen muss und so. Aber er hat mir nicht zugehört.
	AI_Output(self,other,"DIA_Rufus_Why_02_05"); //Vysvětlil jsem mu, že jsem vyčerpaný z předešlého dne a že si potřebuji jen trochu odpočinout. Vůbec mě neposlouchal.
//	AI_Output(self,other,"DIA_Rufus_Why_02_06"); //He grabbed me by the collar and dragged me back to the field.
//	AI_Output(self,other,"DIA_Rufus_Why_02_06"); //Er hat mich am Kragen gepackt und auf die Felder geschleift.
	AI_Output(self,other,"DIA_Rufus_Why_02_06"); //Chytil mě za límec a odvlekl zpátky na pole.
//	AI_Output(self,other,"DIA_Rufus_Why_02_07"); //From that day on, he stood outside my doorstep every day - until I got used to going on my own. I didn't want any trouble with those guys.
//	AI_Output(self,other,"DIA_Rufus_Why_02_07"); //Seit dem Tag stand er jeden Morgen vor meiner Tür - irgendwann bin ich dann von alleine gekommen - ich wollte keinen Ärger mit den Typen.
	AI_Output(self,other,"DIA_Rufus_Why_02_07"); //Od toho dne stával pokaždé před mými dveřmi, dokud jsem si nezvykl chodit sám. Nechtěl jsem mít s těmi chlapíky žádné problémy.
//	AI_Output(self,other,"DIA_Rufus_Why_02_08"); //They're real cut-throats, you'd better steer clear of them.
//	AI_Output(self,other,"DIA_Rufus_Why_02_08"); //Das sind richtige Halsabschneider, mit denen legst du dich besser nicht an.
	AI_Output(self,other,"DIA_Rufus_Why_02_08"); //Jsou to opravdoví hrdlořezové, uděláš nejlíp, když s nimi budeš zadobře.
	var C_NPC Ricelord; Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE; 
};

// ************************************************************
// 						Wer ist Ricelord?
// ************************************************************

instance DIA_Rufus_Ricelord(C_INFO)
{
	npc = Bau_903_Rufus;
	nr = 2;
	condition = DIA_Rufus_Ricelord_Condition;
	information = DIA_Rufus_Ricelord_Info;
	permanent = 1;
//	description = "Who is the Rice Lord?";
//	description = "Wer ist der Reislord?";
	description = "Kdo je Rýžový Lord?";
};                       

func int DIA_Rufus_Ricelord_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void DIA_Rufus_Ricelord_Info()
{ 
//	AI_Output(other,self,"DIA_Rufus_Ricelord_15_00"); //Who is the Rice Lord?
//	AI_Output(other,self,"DIA_Rufus_Ricelord_15_00"); //Wer ist der Reislord?
	AI_Output(other,self,"DIA_Rufus_Ricelord_15_00"); //Kdo je Rýžový Lord?
//	AI_Output(self,other,"DIA_Rufus_Ricelord_02_01"); //He was one of the first to arrive here. He helped found the Camp and start up the rice fields.
//	AI_Output(self,other,"DIA_Rufus_Ricelord_02_01"); //Er war einer der Ersten hier. Hat das Lager mit gegründet und die Reisfelder angelegt.
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_01"); //Byl jedním z prvních, kteří sem přišli. Pomáhal založit tábor a vybudovat rýžová pole.
//	AI_Output(self,other,"DIA_Rufus_Ricelord_02_02"); //These days he just hangs out at the warehouse stretching his stomach, the fat pig!
//	AI_Output(self,other,"DIA_Rufus_Ricelord_02_02"); //Heute steht er nur noch vor seinem Lagerhaus und streckt seine Wampe raus, der alte Fettsack!
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_02"); //Dnes už jen postává před skladištěm a cpe si břicho, to tlustý prase!
	var C_NPC Ricelord; Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE; 
};

