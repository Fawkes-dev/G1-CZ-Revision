// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									Vor Gespräch
// *************************************************************************

instance Info_SFB_5_Pre(C_INFO)
{
	nr = 1;
	condition = Info_SFB_5_Pre_Condition;
	information = Info_SFB_5_Pre_Info;
	important = 1;
	permanent = 0;
};

func int Info_SFB_5_Pre_Condition()
{
	return 1;
};

func void Info_SFB_5_Pre_Info()
{
//	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00"); //Hello!
//	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00"); //Hallo!
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00"); //Nazdar!
};

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_SFB_5_EXIT(C_INFO)
{
	nr = 999;
	condition = Info_SFB_5_EXIT_Condition;
	information = Info_SFB_5_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_SFB_5_EXIT_Condition()
{
	return 1;
};

func void Info_SFB_5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_SFB_5_EinerVonEuchWerden(C_INFO)
{
	nr = 4;
	condition = Info_SFB_5_EinerVonEuchWerden_Condition;
	information = Info_SFB_5_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "What if I want to join you?";
//	description = "Was ist wenn ich hier mitmachen will?";
	description = "Co kdybych se dal k vám?";
};

func int Info_SFB_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_SFB_5_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //What if I wanna join you?
//	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //Was ist, wenn ich hier mitmachen will?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //Co kdybych se dal k vám?
//	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //Join us! As what, a water carrier?
//	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //Hier mitmachen? Als was, Wasserträger?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //Přidat se k nám? Jako co? Jako nosič vody?
//	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //No, as a scraper.
//	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //Nein, als Schürfer?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //Ne, jako rudař.
//	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //Look, I'll tell you something: Nobody VOLUNTEERS to become a scraper.
//	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //Pass mal auf, lass dir eins gesagt sein: Niemand wird FREIWILLIG Schürfer.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //Podívej, něco ti řeknu: nikdo se DOBROVOLNĚ nestane rudařem.
//	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //Of course, if you insist... Go and talk to Swiney, I'm sure he'll have a spare pickaxe he can let you have.
//	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //Aber bitte, wenn du unbedingt willst. Geh mal zu Swiney, der hat bestimmt 'ne Spitzhacke übrig, die er dir gerne zur Verfügung stellt.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //Dobrá, když na tom trváš... Jdi a promluv si se Swineym, vsadím se, že má krumpáč nazbyt a že ti ho rád přenechá.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_SFB_5_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_SFB_5_WichtigePersonen_Condition;
	information = Info_SFB_5_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who's important here?";
//	description = "Wer ist hier wichtig?";
	description = "Kdo je tu nejdůležitější?";
};

func int Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_SFB_5_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //Who's important here?
//	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //Wer ist hier wichtig?
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //Kdo je tu nejdůležitější?
//	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //Who's important? Me, of course.
//	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //Wer hier wichtig ist? -Ich!
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //Nejdůležitější? Samozřejmě já.
//	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //But I guess you mean who calls the shots.
//	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //Aber ich glaube, du willst wissen, wer hier das Sagen hat.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //Myslím, že víš, kdo tady velí.
//	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Well, I guess you should talk to the mercenaries or the rogues. You won't even get near the water mages.
//	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Also, ich denke, du solltest dich an die Söldner oder an die Banditen wenden. An die Wassermagier wirst du nicht rankommen.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Dobře, asi by sis měl promluvit se žoldáky nebo s bandity. K Vodním mágům se nedostaneš.
//	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //That big ass Swiney thinks he's more important than he really is. He just dishes out the pickaxes and does what Okyl tells him to.
//	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //Der aufgeblasene Swiney tut wichtiger, als er wirklich ist. Er verteilt nur die Spitzhacken und gehorcht ansonsten nur Okyls Befehlen.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //Ten velkohubý Swiney se dělá důležitější než je. Přitom akorát rozděluje krumpáče a dělá, co mu nařídí Okyl.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_SFB_5_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_SFB_5_DasLager_Condition;
	information = Info_SFB_5_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "What does the Camp have to offer?";
//	description = "Was gibt es hier im Lager?";
	description = "Co může tábor nabídnout?";
};

func int Info_SFB_5_DasLager_Condition()
{
	return 1;
};

func void Info_SFB_5_DasLager_Info()
{
//	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //What does the Camp have to offer?
//	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //Was gibt es hier im Lager?
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //Co může tábor nabídnout?
//	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //Whatever you make of it. For some nothing but work, for others a hell of a lot of fun.
//	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //Kommt drauf an was man draus macht. Für einige nur viel Arbeit, für andere gibt's auch 'ne ganze Menge Spaß.
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //Cokoliv, co si zasloužíš. Pro některé tu není nic než práce a pro jiné spousta užívání.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_SFB_5_DieLage(C_INFO)
{
	nr = 1;
	condition = Info_SFB_5_DieLage_Condition;
	information = Info_SFB_5_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "What's life like here?";
//	description = "Wie ist das Leben hier?";
	description = "Jak se tady žije?";
};

func int Info_SFB_5_DieLage_Condition()
{
	return 1;
};

func void Info_SFB_5_DieLage_Info()
{
//	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //What's life like here?
//	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //Wie ist das Leben hier?
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //Jak se tady žije?
//	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //Great!
//	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //Toll!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //Paráda!
//	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //And 'cos we're so happy here, we do the best we can to get away.
//	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //Und weil es uns so gut geht, versuchen wir möglichst schnell von hier abzuhauen.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //A protože jsme tu tak šťastní, uděláme nejlépe, když odsud vypadneme.
//	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //What do you think this place is? It's a jail and nobody likes living in a jail.
//	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //Was glaubst du wo wir sind? Wir sind im Knast und niemand ist gerne im Knast.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //Co si myslíš, že tohle místo je? Je to vězení a ve vězení nikdo žít nechce.

};
// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_SFB_5(var c_NPC slf)
{
	Info_SFB_5_Pre.npc = Hlp_GetInstanceID(slf);

	Info_SFB_5_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_DieLage.npc = Hlp_GetInstanceID(slf);
};
