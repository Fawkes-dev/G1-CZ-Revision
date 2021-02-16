// ************************ EXIT **************************

instance GRD_262_Aaron_Exit(C_INFO)
{
	npc = GRD_262_Aaron;
	nr = 999;
	condition = GRD_262_Aaron_Exit_Condition;
	information = GRD_262_Aaron_Exit_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int GRD_262_Aaron_Exit_Condition()
{
	return 1;
};

func void GRD_262_Aaron_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//************************ EXIT **************************
instance GRD_262_Aaron_CHEST(C_INFO)
{
	npc = GRD_262_Aaron;
	condition = GRD_262_Aaron_CHEST_Condition;
	information = GRD_262_Aaron_CHEST_Info;
	important = 0; 
	permanent = 1;
//	description = "What are you doing here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};                       

func int GRD_262_Aaron_CHEST_Condition()
{ 
	if ( Npc_GetDistToWp (self,"OM_CAVE1_34") <400 )
	&& (!Npc_KnowsInfo(hero,GRD_262_Aaron_BLUFF))
	{
		return 1;
	};
};
func void GRD_262_Aaron_CHEST_Info()
{
//	AI_Output(other,self,"GRD_262_Aaron_CHEST_Info_15_01"); //What are you doing here?
//	AI_Output(other,self,"GRD_262_Aaron_CHEST_Info_15_01"); //Was machst du hier?
	AI_Output(other,self,"GRD_262_Aaron_CHEST_Info_15_01"); //Co tady děláš?
//	AI_Output(self,other,"GRD_262_Aaron_CHEST_Info_09_02"); //I'm watching diggers like Snipes over there to make sure they keep their hands off my chest.
//	AI_Output(self,other,"GRD_262_Aaron_CHEST_Info_09_02"); //Ich pass auf, dass so Buddler wie Snipes da drüben die Finger von meiner Truhe hier lassen.
	AI_Output(self,other,"GRD_262_Aaron_CHEST_Info_09_02"); //Dávám pozor na kopáče, jako je Snipes, abych se ujistil, že mají ruce daleko od mé truhly.
};

//***************** BLUFF *****************************
instance GRD_262_Aaron_BLUFF(C_INFO)
{
	npc = GRD_262_Aaron;
	condition = GRD_262_Aaron_BLUFF_Condition;
	information = GRD_262_Aaron_BLUFF_Info;
	important = 0;
	permanent = 1;
//	description = "(lure Aaron away)"; 
//	description = "(Aaron weglocken)"; 
	description = "(odlákej Aarona)"; 
};

func int GRD_262_Aaron_BLUFF_Condition()
{ 
	if Npc_KnowsInfo(hero,VLK_584_Snipes_DEAL)
	&& (Aaron_lock != LOG_RUNNING)
	&& (Aaron_lock != LOG_SUCCESS)
	{
		return 1;
	};

};
func void GRD_262_Aaron_BLUFF_Info()
{
	Info_ClearChoices(GRD_262_Aaron_BLUFF);
	Info_AddChoice(GRD_262_Aaron_BLUFF,DIALOG_BACK ,GRD_262_Aaron_BLUFF_BACK);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"Ian sent me. You should go to see him at once!",GRD_262_Aaron_BLUFF_IAN);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"Ian schickt mich. Du sollst sofort zu ihm kommen!",GRD_262_Aaron_BLUFF_IAN);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"Poslal mě Ian. Máš za ním ihned zajít!",GRD_262_Aaron_BLUFF_IAN);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"I've heard that there are gangsters in the mine here.",GRD_262_Aaron_BLUFF_BANDIT);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"Ich hab' gehört, das Banditen in der Mine sind.",GRD_262_Aaron_BLUFF_BANDIT);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"Slyšel jsem, že v dole jsou banditi.",GRD_262_Aaron_BLUFF_BANDIT);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"The diggers have found a massive ore nugget!",GRD_262_Aaron_BLUFF_ORE);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"Die Buddler haben einen riesigen Erzbrocken gefunden!",GRD_262_Aaron_BLUFF_ORE);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"Kopáči našli masivní magický nuget!",GRD_262_Aaron_BLUFF_ORE);
};

func void GRD_262_Aaron_BLUFF_ORE()
{
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_01");//The diggers have found a massive ore nugget!
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_01");//Die Buddler haben einen riesigen Erzbrocken gefunden!
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_01");//Kopáči našli masivní magický nuget!
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_02");//So what?
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_02");//Na und?
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_02");//No a?
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_03");//You have to take a look at it!
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_03");//Den musst du dir unbedingt ansehen!
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_03");//Musíš na to dohlédnout!
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_04");//Forget it.
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_04");//Vergiss es.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_04");//Na to zapomeň!
};  
func void GRD_262_Aaron_BLUFF_BANDIT()
{
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BANDIT_15_01"); //I've heard that there are gangsters in the mine here. They want the ore!
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BANDIT_15_01"); //Ich hab' gehört, dass Banditen in der Mine sind. Sie wollen das Erz!
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BANDIT_15_01"); //Slyšel jsem, že v dole jsou banditi.
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BANDIT_09_02"); //Do you think I'm stupid? They'd never dare to do anything like that!
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BANDIT_09_02"); //Hältst du mich für blöd? Das würden sie niemals wagen!
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BANDIT_09_02"); //Máš mě za hlupáka? Něčeho takového by se nikdy neodvážili!
};
func void GRD_262_Aaron_BLUFF_IAN()
{
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_IAN_15_01"); //Ian sent me. You should go to see him at once!
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_IAN_15_01"); //Ian schickt mich. Du sollst sofort zu ihm kommen!
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_IAN_15_01"); //Poslal mě Ian. Máš za ním ihned zajít!
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_IAN_09_02"); //What does he want?
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_IAN_09_02"); //Was will er denn?
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_IAN_09_02"); //Co chce?

	Info_ClearChoices(GRD_262_Aaron_BLUFF);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"No idea.",GRD_262_Aaron_BLUFF_UGLY);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"Keine Ahnung",GRD_262_Aaron_BLUFF_UGLY);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"Netuším.",GRD_262_Aaron_BLUFF_UGLY);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"He'll kill you.",GRD_262_Aaron_BLUFF_BAD);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"Es gibt Ärger für dich",GRD_262_Aaron_BLUFF_BAD);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"Má s tebou problém.",GRD_262_Aaron_BLUFF_BAD);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"He wants to give you a reward.",GRD_262_Aaron_BLUFF_GOOD);
//	Info_AddChoice(GRD_262_Aaron_BLUFF,"Belohnung für gute Dienste",GRD_262_Aaron_BLUFF_GOOD);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"Chce ti dát odměnu.",GRD_262_Aaron_BLUFF_GOOD);
};  
func void GRD_262_Aaron_BLUFF_GOOD()
{
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_GOOD_15_01"); //He wants to give you a reward for your good work.
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_GOOD_15_01"); //Er will dir eine Belohnung für deine guten Dienste geben.
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_GOOD_15_01"); //Chce ti dát odměnu za dobrou práci.
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_GOOD_09_02"); //Ah, really? I think you'd better go now.
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_GOOD_09_02"); //Ach, tatsächlich? Ich glaube, du gehst jetzt besser.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_GOOD_09_02"); //Opravdu? Měl bys raději jít.
	Npc_SetTempAttitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
};
func void GRD_262_Aaron_BLUFF_BAD()
{
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BAD_15_01"); //He'll kill you 'cos you're so lazy.
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BAD_15_01"); //Er will dir kräftig in den Arsch treten, weil du so faul bist.
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BAD_15_01"); //Chce ti pořádně nakopat zadek, protože jsi strašně línej!
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BAD_09_02"); //Well, that's no news. Scram!
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BAD_09_02"); //Na, das ist doch nichts Neues. Geh weg!
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BAD_09_02"); //To není žádná novinka. Zmiz!
	AI_StopProcessInfos(self);
};
func void GRD_262_Aaron_BLUFF_UGLY()
{
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_UGLY_15_01"); //No idea. Ian will tell you that himself! Do you think he'd tell me something like that?
//	AI_Output(other,self,"GRD_262_Aaron_BLUFF_UGLY_15_01"); //Keine Ahnung. Das wird Ian dir schon selber sagen! Glaubst du, er erzählt mir so was?
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_UGLY_15_01"); //Nevím. To ti řekne sám Ian. Myslíš, že by mi něco takového řekl?
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_UGLY_09_02"); //Then I'll go to see him!
//	AI_Output(self,other,"GRD_262_Aaron_BLUFF_UGLY_09_02"); //Dann werde ich mal zu ihm gehen!
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_UGLY_09_02"); //Pak teda za ním půjdu!

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self,"trick");

	Aaron_lock = LOG_RUNNING;
	Snipes_Deal = LOG_SUCCESS;
	GRD_262_Aaron_BLUFF.permanent = 0;

//	B_LogEntry(CH2_SnipesDeal,"I lured Aaron away from the chest on the pretext that Ian wanted to see him. I hope he'll take it in good humor.");
//	B_LogEntry(CH2_SnipesDeal,"Ich habe Aaron unter dem Vorwand, dass Ian ihn sehen will, von der Truhe weggelockt. Ich hoffe er hat etwas Humor.");
	B_LogEntry(CH2_SnipesDeal,"Odlákal jsem Aarona pryč od truhlice pod záminkou, že ho chce vidět Ian. Doufám, že to vezme jako vtip.");
};

func void GRD_262_Aaron_BLUFF_BACK()
{
	Info_ClearChoices(GRD_262_Aaron_BLUFF);
};

// ***************** Aaron ist angepisst *****************************
instance GRD_262_Aaron_PISSED(C_INFO)
{
	npc = GRD_262_Aaron;
	condition = GRD_262_Aaron_PISSED_Condition;
	information = GRD_262_Aaron_PISSED_Info;
	important = 1; 
	permanent = 0;
};                       

func int GRD_262_Aaron_PISSED_Condition()
{
	if (Aaron_lock == LOG_RUNNING)
	&& (Npc_GetDistToWP(hero,"OM_CAVE1_47") < 1000)
	{
		return TRUE;
	};
};
func void GRD_262_Aaron_PISSED_Info()
{
	AI_DrawWeapon (self);
//	AI_Output(self,other,"Info_Aaron_PISSED_09_01"); //HEY, YOU!!! If you try to make a fool out of me again, you had it, you got that?
//	AI_Output(self,other,"Info_Aaron_PISSED_09_01"); //HEY, DU!!! Wenn du mich noch einmal so verarschst, dann gibt's ne ordentliche Tracht Prügel, verstanden?
	AI_Output(self,other,"Info_Aaron_PISSED_09_01"); //HEJ, TY!!! Jestli se ze mě ještě pokusíš udělat hlupáka, pak si říkáš o pořádnej výprask, jasný?
	AI_RemoveWeapon (self);

	Npc_ExchangeRoutine(self,"start");
	Aaron_lock = LOG_SUCCESS;

//	B_LogEntry(CH2_SnipesDeal,"I've met Aaron again, he actually DIDN'T take it in good humor."); 
//	B_LogEntry(CH2_SnipesDeal,"Ich habe Aaron wiedergetroffen und festgestellt, dass er KEINEN Humor hat."); 
	B_LogEntry(CH2_SnipesDeal,"Znovu jsem potkal Aarona, který to však NEVZAL jako dobrý vtip."); 
};

// ***************** Schlüssel verkaufen *****************************
instance GRD_262_Aaron_SELL(C_INFO)
{
	npc = GRD_262_Aaron;
	condition = GRD_262_Aaron_SELL_Condition;
	information = GRD_262_Aaron_SELL_Info;
	important = 0; 
	permanent = 0;
//	description = "Hey, don't you miss your key?";
//	description = "Hey, vermisst du nicht deinen Schlüssel?";
	description = "Hej, neztratil jsi klíč?";
};                       

func int GRD_262_Aaron_SELL_Condition()
{
	if (Npc_KnowsInfo(hero,VLK_584_Snipes_DEAL_RUN )) 
	{
		return 1;
	};
};

func void GRD_262_Aaron_SELL_Info()
{
//	AI_Output(other,self,"Info_Aaron_SELL_15_01"); //Hey, don't you miss the key to your chest?
//	AI_Output(other,self,"Info_Aaron_SELL_15_01"); //Hey, vermisst du nicht deinen Truhenschlüssel?
	AI_Output(other,self,"Info_Aaron_SELL_15_01"); //Hej, nepostrádáš klíč od truhly?
//	AI_Output(self,other,"Info_Aaron_SELL_09_02"); //Indeed. I don't even want to guess how or why you know about the key.
//	AI_Output(self,other,"Info_Aaron_SELL_09_02"); //Tatsächlich. Ich will gar nicht wissen, woher oder warum du etwas über den Schlüssel weißt.
	AI_Output(self,other,"Info_Aaron_SELL_09_02"); //Jistě. Akorát netuším, jak ani proč víš o tom klíči.
//	AI_Output(self,other,"Info_Aaron_SELL_09_03"); //But I'll give you 20 ore if you get it back for me.
//	AI_Output(self,other,"Info_Aaron_SELL_09_03"); //Aber ich gebe dir 20 Erz, wenn du mir meinen Schlüssel wiederholst.
	AI_Output(self,other,"Info_Aaron_SELL_09_03"); //Dám ti 20 nugetů, jestli mi ho přineseš zpátky.

//	B_LogEntry(CH2_SnipesDeal,"Aaron offered me 20 ore to get the keys to his chest for him!"); 
//	B_LogEntry(CH2_SnipesDeal,"Aaron hat mir 20 Erz geboten, wenn ich ihm den Schlüssel seiner Truhe besorge!"); 
	B_LogEntry(CH2_SnipesDeal,"Aaron mi nabídl 20 nugetů, když mu dám klíč od jeho truhlice!"); 
};

// ***************** Schlüssel verkaufen 2*****************************
instance GRD_262_Aaron_SELLNOW(C_INFO)
{
	npc = GRD_262_Aaron;
	condition = GRD_262_Aaron_SELLNOW_Condition;
	information = GRD_262_Aaron_SELLNOW_Info;
	important = 0; 
	permanent = 0;
//	description = "(sell key)";
//	description = "(Schlüssel verkaufen)";
	description = "(prodej klíč)";
};                       

func int GRD_262_Aaron_SELLNOW_Condition()
{
	if (Npc_KnowsInfo(hero,GRD_262_Aaron_SELL)) && (Npc_HasItems(hero,ItKe_OM_02))
	{
		return 1;
	};
};
func void GRD_262_Aaron_SELLNOW_Info()
{
//	AI_Output(other,self,"Info_Aaron_SELLNOW_15_01"); //Here's your key.
//	AI_Output(other,self,"Info_Aaron_SELLNOW_15_01"); //Hier ist dein Schlüssel.
	AI_Output(other,self,"Info_Aaron_SELLNOW_15_01"); //Tady je tvůj klíč.
//	AI_Output(self,other,"Info_Aaron_SELLNOW_09_02"); //Yeah, that's it. Well, here's your 20 ore, like we agreed.
//	AI_Output(self,other,"Info_Aaron_SELLNOW_09_02"); //Tatsächlich. Also, wie abgemacht, hier sind 20 Erz für dich.
	AI_Output(self,other,"Info_Aaron_SELLNOW_09_02"); //Ano, to je on. Dobrá, tady je těch 20 nugetů, jak jsme se dohodli.
//	AI_Output(self,other,"Info_Aaron_SELLNOW_09_03"); //But you'd better watch out in future. From now on I'll be keeping an eye on you!
//	AI_Output(self,other,"Info_Aaron_SELLNOW_09_03"); //Du solltest dich aber in Zukunft vorsehen. Ab jetzt habe ich ein Auge auf dich!
	AI_Output(self,other,"Info_Aaron_SELLNOW_09_03"); //Měl bys ale příště dávat lepší pozor. Od teď na tebe budu dohlížet.

	CreateInvItems(self,ItMinugget,20);
	B_GiveInvItems(self,other,ItMinugget,20);
	B_GiveInvItems(hero,self,ItKe_OM_02,1);

	B_GiveXP(XP_SellKeyToAaron);

//	B_LogEntry(CH2_SnipesDeal,"I've sold Aaron his own key. Altogether, I've made quite some profit with it!"); 
//	B_LogEntry(CH2_SnipesDeal,"Ich habe Aaron seinen eigenen Schlüssel verkauft. Alles in allem habe ich bei der ganzen Sache ordentlich Profit gemacht!"); 
	B_LogEntry(CH2_SnipesDeal,"Prodal jsem Aaronovi jeho vlastní klíč. Celkem vzato, nakonec jsem na tom vydělal!"); 
	Log_SetTopicStatus(CH2_SnipesDeal,LOG_SUCCESS);
};

