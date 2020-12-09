// ************************************************************
// 							EXIT 
// ************************************************************

instance Info_Jacko_EXIT(C_INFO)
{
	npc = ORG_862_Jacko;
	nr = 999;
	condition = Info_Jacko_EXIT_Condition;
	information = Info_Jacko_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Info_Jacko_EXIT_Condition()
{
	return 1;
};

func void Info_Jacko_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

//******************************************************************
//							Raus hier! 
//******************************************************************

instance ORG_862_Jacko_GoAway(C_INFO)
{
	npc = ORG_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GoAway_Condition;
	information = ORG_862_Jacko_GoAway_Info;
	permanent = 1;
	important = 1;
};

func int ORG_862_Jacko_GoAway_Condition()
{ 
	if (Npc_GetDistToWP(hero,"LOCATION_23_CAVE_1_IN")<500)
	&& (Kalom_DrugMonopol != LOG_RUNNING)
	&& (Kalom_DrugMonopol != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_GoAway_Info()
{
//	AI_Output(self,other,"ORG_862_Jacko_GoAway_Info_06_00"); //What the hell are you doing here?
//	AI_Output(self,other,"ORG_862_Jacko_GoAway_Info_06_00"); //Was zum Teufel machst du hier?
	AI_Output(self,other,"ORG_862_Jacko_GoAway_Info_06_00"); //Co tady k čertu pohledáváš?
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
}; 

//******************************************************************
//							Weg mit den Jungs 
//******************************************************************

instance ORG_862_Jacko_GUARD(C_INFO)
{
	npc = ORG_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GUARD_Condition;
	information = ORG_862_Jacko_GUARD_Info;
	permanent = 0;
	important = 1;
};

func int ORG_862_Jacko_GUARD_Condition()
{ 
	if (Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_GUARD_Info()
{
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_00"); //Lost our way, have we?
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_00"); //Na, haben wir uns verlaufen?
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_00"); //Zabloudili jsme, že ano?
//	AI_Output(other,self,"ORG_862_Jacko_GUARD_Info_15_01"); //Cor Kalom knows about your little enterprise.
//	AI_Output(other,self,"ORG_862_Jacko_GUARD_Info_15_01"); //Cor Kalom weiß von eurem kleinen Unternehmen.
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Info_15_01"); //Cor Kalom ví o vašem malém podniku.
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_02"); //What? Why are you here?
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_02"); //Was? Warum bist du hier?
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_02"); //Cože? Proč tady jsi?

//	B_LogEntry(CH1_DrugMonopol,"I've found the secret swampweed production. Jacko and two other rogues produce weed stalks here.");
//	B_LogEntry(CH1_DrugMonopol,"Ich habe die geheime Sumpfkrautproduktion gefunden. Jacko und zwei andere Banditen stellen hier Krautstengel her.");
	B_LogEntry(CH1_DrugMonopol,"Našel jsem tajnou výrobnu drogy z bažin. Jacko a dva další bandité tu produkují lodyhy drogy.");

	Info_Clearchoices (ORG_862_Jacko_GUARD);
//	Info_Addchoice (ORG_862_Jacko_GUARD,"I'm here to warn you. Cor Kalom sent five templars to finish you off.",ORG_862_Jacko_GUARD_Templer);
//	Info_Addchoice (ORG_862_Jacko_GUARD,"Ich will euch warnen. Cor Kalom hat fünf Templer geschickt.",ORG_862_Jacko_GUARD_Templer);
	Info_Addchoice (ORG_862_Jacko_GUARD,"Jsem tu, abych vás varoval. Cor Kalom vyslal pět templářů, aby s vámi skoncovali.",ORG_862_Jacko_GUARD_Templer);
//	Info_Addchoice (ORG_862_Jacko_GUARD,"I want to know what this information is worth to you.",ORG_862_Jacko_GUARD_InfoWert);
//	Info_Addchoice (ORG_862_Jacko_GUARD,"Ich will wissen, was dir diese Information wert ist.",ORG_862_Jacko_GUARD_InfoWert);
	Info_Addchoice (ORG_862_Jacko_GUARD,"Zajímalo by mě, jakou cenu má pro tebe tahle informace.",ORG_862_Jacko_GUARD_InfoWert);
//	Info_Addchoice (ORG_862_Jacko_GUARD,"To put an end to the whole business here!",ORG_862_Jacko_GUARD_Angriff);
//	Info_Addchoice (ORG_862_Jacko_GUARD,"Um der Sache hier ein Ende zu bereiten!",ORG_862_Jacko_GUARD_Angriff);
	Info_Addchoice (ORG_862_Jacko_GUARD,"A věc se chýlí ke konci!",ORG_862_Jacko_GUARD_Angriff);
};  

func void ORG_862_Jacko_GUARD_Templer()
{
//	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_00"); //I'm here to warn you. Cor Kalom has sent five templars to finish you off.
//	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_00"); //Ich will euch warnen. Cor Kalom hat fünf Templer geschickt, die euch den Garaus machen sollen.
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_00"); //Jsem tu, abych tě varoval. Co Kalom vyslal pět templářů, aby tě zastavili.
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_01"); //What? You can't be serious!
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_01"); //Ach? Das glaubst du doch selbst nicht!
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_01"); //Cože? To nemyslíš vážně!
//	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_02"); //They should arrive here any minute.
//	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_02"); //Sie müßten jeden Moment hier sein.
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_02"); //Měli by dorazit během chvilky!
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_03"); //Damn it! We have to leave!
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_03"); //Verdammt! Wir müssen weg!
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_03"); //Sakra! Musíme zmizet!

	Info_Clearchoices (ORG_862_Jacko_GUARD);

//	B_LogEntry(CH1_DrugMonopol,"A small trick with templars who don't even exist has driven the wimps away. This problem should be solved for the moment.");
//	B_LogEntry(CH1_DrugMonopol,"Eine kleine List mit Templern die es gar nicht gibt, hat die Angsthasen in die Flucht geschlagen. Dieses Problem dürfte vorerst erledigt sein.");
	B_LogEntry(CH1_DrugMonopol,"Malá lest s templáři, kteří tu vůbec nebyli, mi pomohla zbavit se těch zbabělců. Problém by měl být na chvilku vyřešen.");
	B_GiveXP(XP_JackoRetired);

	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(ORG_861_Killian, "ARBEITSLOS");
	B_ExchangeRoutine(ORG_860_Renyu, "ARBEITSLOS");

	Stooges_Fled = TRUE;

	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_InfoWert()
{
//	AI_Output(other,self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00"); //I want to know what this information is worth to you.
//	AI_Output(other,self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00"); //Ich will wissen, was dir diese Information wert ist.
	AI_Output(other,self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00"); //Chci vědět, jestli je tvá informace pravdivá.
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01"); //Oh, that's what you want... Alright. You scratch my back and I'll scratch yours. Here, this is all the ore I have on me.
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01"); //Ach so ist das... Gut. Eine Hand wäscht die andere. Hier, das ist alles Erz, was ich bei mir habe.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01"); //Och, tak tohle teda chceš... Dobrá. Ruka ruku myje. Tady je ruda, kterou u sebe mám.
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02"); //We have to go! And you'd better disappear as well.
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02"); //Wir müssen weg! Und du verschwindest hier auch besser.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02"); //Musíme jít! A ty bys měl zmizet taky.

	B_GiveInvItems(self,other,itminugget,95);

	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(ORG_861_Killian, "ARBEITSLOS");
	B_ExchangeRoutine(ORG_860_Renyu, "ARBEITSLOS");

	Stooges_Fled = TRUE;
//	B_LogEntry(CH1_DrugMonopol,"By smart talking I've solved this problem. The thing was getting too hot for Jacko, he's cleared off.");
//	B_LogEntry(CH1_DrugMonopol,"Durch geschicktes Reden, habe ich dieses Problem gelöst. Jacko wurde die Sache hier zu heiß und ist abgehauen.");
	B_LogEntry(CH1_DrugMonopol,"Krátkou domluvou jsem vyřešil problém. Ta věc byla pro Jacka tak ožehavá, že se raději ztratil.");
	B_GiveXP(XP_JackoRetired);

	Info_Clearchoices (ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_Angriff()
{
//	AI_Output(other,self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00"); //To put an end to the whole business here!
//	AI_Output(other,self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00"); //Um der Sache hier ein Ende zu bereiten!
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00"); //A věc se chýlí ke konci!
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01"); //Guys! Just come over here for a minute!
//	AI_Output(self,other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01"); //Jungs! Kommt doch mal kurz her!
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01"); //Chlapi! Pojďte rychle sem.

	Info_Clearchoices (ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);

	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack, 1, "");
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	var C_NPC Killian; 
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Npc_SetTarget(Killian, hero);
	AI_StartState(Killian, ZS_Attack, 0, ""); //0 ist richtig!
	Npc_SetPermAttitude(Killian,ATT_HOSTILE);
	Npc_SetTempAttitude(Killian,ATT_HOSTILE);
	var C_NPC Renyu; 
	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	Npc_SetTarget(Renyu, hero);
	AI_StartState(Renyu, ZS_Attack, 0, ""); //0 ist richtig!
	Npc_SetPermAttitude(Renyu,ATT_HOSTILE);
	Npc_SetTempAttitude(Renyu,ATT_HOSTILE);
};

//******************************************************************
//							Im Banditencamp 
//******************************************************************

instance ORG_862_Jacko_Banditencamp(C_INFO)
{
	npc = ORG_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_Banditencamp_Condition;
	information = ORG_862_Jacko_Banditencamp_Info;
	permanent = 1;
//	description = "So this where you sneaked off to.";
//	description = "Hierher habt ihr euch also verkrümelt.";
	description = "Musíte se odtud odplížit.";
};

func int ORG_862_Jacko_Banditencamp_Condition()
{ 
	if ((Kalom_DrugMonopol == LOG_SUCCESS) && Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_08"))
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_Banditencamp_Info()
{
//	AI_Output(other,self,"ORG_862_Jacko_Banditencamp_15_00"); //So this is where you sneaked off to.
//	AI_Output(other,self,"ORG_862_Jacko_Banditencamp_15_00"); //Hierher habt ihr euch also verkrümelt.
	AI_Output(other,self,"ORG_862_Jacko_Banditencamp_15_00"); //Musíte se odtud odplížit.
//	AI_Output(self,other,"ORG_862_Jacko_Banditencamp_06_01"); //It was a close shave. The sect templars would have killed us.
//	AI_Output(self,other,"ORG_862_Jacko_Banditencamp_06_01"); //Es war knapp. Die Templer der Sekte hätten uns bestimmt kaltgemacht.
	AI_Output(self,other,"ORG_862_Jacko_Banditencamp_06_01"); //To bylo o fous. Sektářští templáři by nás byli zabili.

	AI_StopProcessInfos(self);
}; 

/*
//******************************************************************
//					SPELER SOLL ABHAUEN 
//******************************************************************

instance ORG_862_Jacko_DRUGGUARD(C_INFO)
{
	npc = ORG_862_Jacko;
	condition = ORG_862_Jacko_DRUGGUARD_Condition;
	information = ORG_862_Jacko_DRUGGUARD_Info;
	important = 0;
	permanent = 0;
	description = "Was machst du hier?"; 
};

func int ORG_862_Jacko_DRUGGUARD_Condition()
{ 
	return TRUE;
};
func void ORG_862_Jacko_DRUGGUARD_Info()
{
	AI_Output(other,self,"ORG_862_Jacko_DRUGGUARD_Info_15_01"); //Was machst du hier?
	AI_Output(self,other,"ORG_862_Jacko_DRUGGUARD_Info_06_02"); //Gar nichts. Geh weg!
	AI_StopProcessInfos(self);
};  

//******************************************************************
//						NORMAL 
//******************************************************************

instance ORG_862_Jacko_KALOM(C_INFO)
{
	npc = ORG_862_Jacko;
	condition = ORG_862_Jacko_KALOM_Condition;
	information = ORG_862_Jacko_KALOM_Info;
	important = 0;
	permanent = 0;
	description = "Ich bin im Auftrag der Bruderschaft hier."; 
};

func int ORG_862_Jacko_KALOM_Condition()
{ 
	if (Npc_KnowsInfo(hero,ORG_862_Jacko_DRUGGUARD))
	&& ( Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};

};
func void ORG_862_Jacko_KALOM_Info()
{
//	AI_Output(other,self,"ORG_862_Jacko_KALOM_Info_15_01"); //Ich bin im Auftrag der Bruderschaft hier.
	AI_Output(other,self,"ORG_862_Jacko_KALOM_Info_15_01"); //Ich bin im Auftrag der Bruderschaft hier. 
//	AI_Output(self,other,"ORG_862_Jacko_KALOM_Info_06_02"); //Oh scheisse! Und da schicken die so einen wie dich?
	AI_Output(self,other,"ORG_862_Jacko_KALOM_Info_06_02"); //Oh scheisse! Und da schicken die so einen wie dich? 
};  

//******************************************************************
//				NORMAL 
//******************************************************************

instance ORG_862_Jacko_ANGEBOT(C_INFO)
{
	npc = ORG_862_Jacko;
	condition = ORG_862_Jacko_ANGEBOT_Condition;
	information = ORG_862_Jacko_ANGEBOT_Info;
	important = 0;
	permanent = 0;
	description = "Ich will euch ein Angebot machen!"; 
};

func int ORG_862_Jacko_ANGEBOT_Condition()
{ 
	if (Npc_KnowsInfo(hero,ORG_862_Jacko_KALOM))
	{
		return TRUE;
	};

};
func void ORG_862_Jacko_ANGEBOT_Info()
{
	AI_Output(other,self,"ORG_862_Jacko_ANGEBOT_Info_15_01"); //Ich will euch ein Angebot machen!
//	AI_Output(self,other,"ORG_862_Jacko_ANGEBOT_Info_06_02"); //Was für ein Angebot?
	AI_Output(self,other,"ORG_862_Jacko_ANGEBOT_Info_06_02"); //Was für ein Angebot? 
//	AI_Output(other,self,"ORG_862_Jacko_ANGEBOT_Info_15_03"); //Das werde ich mit demjenigen bereden,der hier das Sagen hat.
	AI_Output(other,self,"ORG_862_Jacko_ANGEBOT_Info_15_03"); //Das werde ich mit demjenigen bereden,der hier das Sagen hat.  
	AI_Output(self,other,"ORG_862_Jacko_ANGEBOT_Info_06_04"); //Na schön,dann rede mit Renyu. Aber keine faulen Tricks, sonst zerschlage ich jeden deiner Knochen einzeln!
	AI_StopProcessInfos(self);
};  

*/
