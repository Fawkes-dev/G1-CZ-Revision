// ************************ EXIT **************************

instance VLK_584_Snipes_Exit(C_INFO)
{
	npc = VLK_584_Snipes;
	nr = 999;
	condition = VLK_584_Snipes_Exit_Condition;
	information = VLK_584_Snipes_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int VLK_584_Snipes_Exit_Condition()
{
	return 1;
};

func void VLK_584_Snipes_Exit_Info()
{
//	AI_Output(other,self,"Info_Exit_Info_15_001"); //I'll see you later.
//	AI_Output(other,self,"Info_Exit_Info_15_001"); //Wir sehen uns.
	AI_Output(other,self,"Info_Exit_Info_15_001"); //Ještě se uvidíme!
//	AI_Output(self,other,"Info_Exit_Info_07_02"); //Yes, sure!
//	AI_Output(self,other,"Info_Exit_Info_07_02"); //Na, aber sicher doch!
	AI_Output(self,other,"Info_Exit_Info_07_02"); //Ano, jistě!

	AI_StopProcessInfos(self);
};

// ***************** Infos *****************************
instance VLK_584_Snipes_DEAL(C_INFO)
{
	npc = VLK_584_Snipes;
	condition = VLK_584_Snipes_DEAL_Condition;
	information = VLK_584_Snipes_DEAL_Info;
	important = 0;
	permanent = 0;
//	description = "How's things?";
//	description = "Wie siehts aus?";
	description = "Jak to jde?";
};

func int VLK_584_Snipes_DEAL_Condition()
{
	return 1;
};

func void VLK_584_Snipes_DEAL_Info()
{
//	AI_Output(other,self,"VLK_584_Snipes_DEAL_Info_15_01");//How's things?
//	AI_Output(other,self,"VLK_584_Snipes_DEAL_Info_15_01");//Wie sieht's aus?
	AI_Output(other,self,"VLK_584_Snipes_DEAL_Info_15_01"); //Jak to jde?
//	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_02"); //I have a deal to suggest.
//	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_02"); //Ich schlage dir ein Geschäft vor.
	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_02"); //Měl bych pro tebe obchod.
//	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_03"); //If you make Aaron leave the chest alone, I'll give you 10 ore!
//	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_03"); //Wenn du Aaron dazu kriegst, dass er von der Truhe abhaut, dann gebe ich dir 10 Erz!
	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_03"); //Když zařídíš, aby Aaron odešel od truhly, dám ti 10 nugetů.
	Snipes_Deal = LOG_RUNNING;

	Log_CreateTopic(CH2_SnipesDeal,LOG_MISSION);
	Log_SetTopicStatus(CH2_SnipesDeal,LOG_RUNNING);
//	B_LogEntry(CH2_SnipesDeal,"The digger Snipes offered me 10 ore nuggets to lure the guard Aaron away from his chest!");
//	B_LogEntry(CH2_SnipesDeal,"Der Buddler Snipes hat mir 10 Erz angeboten, wenn ich es schaffe, den Gardisten Aaron von seiner Truhe wegzulocken!");
	B_LogEntry(CH2_SnipesDeal,"Kopáč Snipes mi nabídl 10 magických nugetů za to, že odlákám strážce Aarona od jeho truhlice!");
};
// ***************** Infos *****************************
instance VLK_584_Snipes_DEAL_RUN(C_INFO)
{
	npc = VLK_584_Snipes;
	condition = VLK_584_Snipes_DEAL_RUN_Condition;
	information = VLK_584_Snipes_DEAL_RUN_Info;
	important = 0;
	permanent = 0;
//	description = "You owe me 10 ore!";
//	description = "Du schuldest mir 10 Erz";
	description = "Dlužíš mi 10 nugetů!";
};

func int VLK_584_Snipes_DEAL_RUN_Condition()
{
	if (Snipes_deal == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void VLK_584_Snipes_DEAL_RUN_Info()
{
//	AI_Output(other,self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //You owe me 10 ore!
//	AI_Output(other,self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //Du schuldest mir 10 Erz
	AI_Output(other,self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //Dlužíš mi 10 nugetů!
//	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Here, you've already earned the 10 ore.
//	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Hier, die 10 Erz hast du dir verdient.
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Tady, těch 10 nugetů sis opravdu vydělal.
//	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Oh, and one more thing: I have the key to his chest as well. For you... only 30 ore!
//	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Ach noch was, den Schlüssel für seine Truhe hab' ich auch. Für dich nur 30 Erz!
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Och, a ještě něco. Mám taky klíč od jeho truhlice. Pro tebe... jen 30 nugetů.
	CreateInvItems(self,ItMinugget,10);
	B_GiveInvItems(self,other,ItMinugget,10);
	CreateInvItem(self,ItKe_OM_02);

	B_GiveXP(XP_LureAaronAway);

//	B_LogEntry(CH2_SnipesDeal,"For another 30 ore nuggets, Snipes offered me the key to Aaron's chest.");
//	B_LogEntry(CH2_SnipesDeal,"Snipes hat mir für weitere 30 Erz den Schlüssel zu Aarons Truhe angeboten.");
	B_LogEntry(CH2_SnipesDeal,"Snipes mi za dalších 30 nugetů nabídl klíč od Aaronovy truhlice.");
};
// ***************** Infos *****************************
instance VLK_584_Snipes_DEAL_2(C_INFO)
{
	npc = VLK_584_Snipes;
	condition = VLK_584_Snipes_DEAL_2_Condition;
	information = VLK_584_Snipes_DEAL_2_Info;
	important = 0;
	permanent = 1;
//	description = "(buy key)";
//	description = "(Schlüssel kaufen)";
	description = "Dej mi ten klíč. (30 rudy)"; //#COMMENT Zvyšuje Immersion:tm:
};

func int VLK_584_Snipes_DEAL_2_Condition()
{
	if (Npc_KnowsInfo(hero,VLK_584_Snipes_DEAL_RUN))
	&& (Npc_HasItems(self,ItKe_OM_02))
	{
	return 1;
	};
};

func void VLK_584_Snipes_DEAL_2_Info()
{
	if (Npc_HasItems(hero,ItMinugget)  >= 30 )
	{
//		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_01");//Give me the key.
//		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_01");//Gib mir den Schlüssel.
		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_01"); //Dej mi ten klíč.
//		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_02");//You made good business there.
//		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_02");//Du hast ein gutes Geschäft gemacht!
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_02"); //Udělal jsi dobrý obchod!
//		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_03");//I just wonder what you get out of it.
//		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_03");//Ich frage mich, was dein Gewinn an der Sache ist.
		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_03"); //Zajímalo by mě, co z toho máš ty.
//		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_04");//I'm always glad when I can get one over on the guards. And if they found the content of the chest with me, I'd be a dead man.
//		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_04");//Ich freue mich immer, wenn ich den Gardisten eins auswischen kann. Und wenn die den Inhalt der Truhe bei mir finden, bin ich dran!
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_04"); //Vždycky mě těší, když můžu setřít někoho ze strážců. A jestli najdou obsah té truhly u mě, jsem mrtvej muž.

		B_GiveInvItems(hero,self,ItMiNugget,30);
		B_GiveInvItems(self,hero,ItKe_OM_02,1);
		VLK_584_Snipes_DEAL_2.permanent = 0;

//		B_LogEntry(CH2_SnipesDeal,"I bought the key to the chest from Snipes! I wonder what Aaron is going to do when I tell him about it?");
//		B_LogEntry(CH2_SnipesDeal,"Ich habe Snipes den Truhenschlüssel abgekauft! Wie Aaron wohl darauf reagieren wird, wenn ich ihm davon erzähle?");
		B_LogEntry(CH2_SnipesDeal,"Koupil jsem od Snipese klíč od té truhlice! Jak na to asi bude Aaron reagovat, až mu o tom povím?");
	}
	else
	{
//		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //I said 30 ore! Give me the ore and I'll give you the key!
//		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //Ich sagte 30 Erz! Gib mir das Erz und ich gebe dir den Schlüssel!
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //Řekl jsem 30 nugetů! Dej mi rudu a já ti dám klíč!
	};
};
