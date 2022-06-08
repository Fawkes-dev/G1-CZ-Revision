// **************************************************
//						EXIT
// **************************************************

instance DIA_Darrion_Exit(C_INFO)
{
	npc = Nov_1312_Darrion;
	nr = 999;
	condition = DIA_Darrion_Exit_Condition;
	information = DIA_Darrion_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Darrion_Exit_Condition()
{
	return 1;
};

func void DIA_Darrion_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//					Hallo
// **************************************************

instance DIA_Darrion_Hello(C_INFO)
{
	npc = Nov_1312_Darrion;
	nr = 1;
	condition = DIA_Darrion_Hello_Condition;
	information = DIA_Darrion_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "Hi - I'm new here and I'd like to get to know the Camp.";
//	description = "Hi - ich bin neu hier und will das Lager kennenlernen.";
	description = "Zdar - jsem tady nový a chtěl bych se něco dovědět o táboře.";
};

func int DIA_Darrion_Hello_Condition()
{
	return 1;
};

func void DIA_Darrion_Hello_Info()
{
//	AI_Output(other,self,"DIA_Darrion_Hello_15_00"); //Hi - I'm new here and I'd like to get to know the Camp.
//	AI_Output(other,self,"DIA_Darrion_Hello_15_00"); //Hi - ich bin neu hier und will das Lager kennen lernen.
	AI_Output(other,self,"DIA_Darrion_Hello_15_00"); //Zdar - jsem tady nový a chtěl bych se něco dovědět o táboru.
//	AI_Output(self,other,"DIA_Darrion_Hello_11_01"); //Then you've come to the wrong place. Since the templars started preparing for the fight, we've been busy day and night.
//	AI_Output(self,other,"DIA_Darrion_Hello_11_01"); //Da bist du zum falschen Ort gekommen. Seit sich die Templer zum Kampf rüsten, sind wir Tag und Nacht beschäftigt.
	AI_Output(self,other,"DIA_Darrion_Hello_11_01"); //Pak jsi přišel na špatné místo. Od té doby, co se templáři začali připravovat k boji, tu máme ve dne v noci napilno.
//	AI_Output(self,other,"DIA_Darrion_Hello_11_02"); //I don't have much time for questions. So don't disturb me - unless you want to buy something.
//	AI_Output(self,other,"DIA_Darrion_Hello_11_02"); //Ich hab' nicht viel Zeit für neugierige Fragen. Also stör mich nicht - es sei denn, du willst was kaufen.
	AI_Output(self,other,"DIA_Darrion_Hello_11_02"); //Nemám moc času na otázky. Tak mě nevyrušuj - pokud si nechceš něco koupit.

	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
//	B_LogEntry(GE_TraderPSI,"The novice Darrion deals with WEAPONS. He spends most of his time in the smithy.");
//	B_LogEntry(GE_TraderPSI,"Der Novize Darrion handelt mit WAFFEN. Er hält sich die meiste Zeit in der Schmiede auf.");
	B_LogEntry(GE_TraderPSI,"Novic Darrion obchoduje se ZBRANĚMI. Tráví většinu času v kovárně.");
};

// **************************************************
//						TRADE
// **************************************************

instance DIA_Darrion_Trade(C_INFO)
{
	npc = Nov_1312_Darrion;
	nr = 800;
	condition = DIA_Darrion_Trade_Condition;
	information = DIA_Darrion_Trade_Info;
	important = 0;
	permanent = 1;
	trade = 1;
//	description = "I'd like to trade with you!";
//	description = "Ich will mit dir handeln!";
	description = "Chtěl bych s tebou obchodovat!";
};

func int DIA_Darrion_Trade_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Darrion_Hello))
	{
		return 1;
	};

	return 0;
};

func void DIA_Darrion_Trade_Info()
{
//	AI_Output(other,self,"DIA_Darrion_Trade_15_00"); //I'd like to trade with you!
//	AI_Output(other,self,"DIA_Darrion_Trade_15_00"); //Ich will mit dir handeln!
	AI_Output(other,self,"DIA_Darrion_Trade_15_00"); //Chtěl bych s tebou obchodovat!
//	AI_Output(self,other,"DIA_Darrion_Trade_11_01"); //Good! Here - these are the weapons I have available at the moment.
//	AI_Output(self,other,"DIA_Darrion_Trade_11_01"); //Gut! Hier - das sind die Waffen, die ich zurzeit da habe.
	AI_Output(self,other,"DIA_Darrion_Trade_11_01"); //Dobře! Tady - to jsou zbraně, které mám zrovna k dispozici.

	if (Npc_HasItems(self,ItMiSwordRaw ) < 5) { CreateInvItems(self,ItMiSwordRaw, 5); };
	if (Npc_HasItems(self,ItMiSwordRawHot ) < 5) { CreateInvItems(self,ItMiSwordRawHot, 5); };
	if (Npc_HasItems(self,ItMiSwordBladeHot) < 5) { CreateInvItems(self,ItMiSwordBladeHot, 5); };
	if (Npc_HasItems(self,ItMiSwordBlade ) < 5) { CreateInvItems(self,ItMiSwordBlade, 5); };
};
