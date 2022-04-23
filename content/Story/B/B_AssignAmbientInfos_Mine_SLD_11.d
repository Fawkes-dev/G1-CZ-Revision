// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Mine_Sld_11_EXIT(C_INFO)
{
	nr = 999;
	condition = Info_Mine_Sld_11_EXIT_Condition;
	information = Info_Mine_Sld_11_EXIT_Info;
	permanent = 1;
	description = "END";
};

func int Info_Mine_Sld_11_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Mine_Sld_11_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Mine_Sld_11_EinerVonEuchWerden_Condition;
	information = Info_Mine_Sld_11_EinerVonEuchWerden_Info;
	permanent = 1;
//	description = "How do I join you?";
//	description = "Wie kann ich bei Euch mitmachen?";
	description = "Jak se můžu dát k vám?";
};

func int Info_Mine_Sld_11_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_11_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00"); //How do I join you?
//	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00"); //Wie kann ich bei euch mitmachen?
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00"); //Jak se můžu dát k vám?
//	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01"); //If you wanna be one of us, you have to earn yourself a reputation.
//	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01"); //Um hier mitzumachen, musst du erst einen Namen haben.
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01"); //Když chceš být jedním z nás, musíš si vysloužit uznání.
//	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02"); //Go and prove your worth elsewhere, then maybe you'll be allowed to serve in the Hollow.
//	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02"); //Beweise dich erst einmal woanders, dann darfst du auch im Kessel Dienst tun.
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02"); //Běž a dělej, jak nejlíp umíš, a pak ti dovolí sloužit v Kotlině.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Mine_Sld_11_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Mine_Sld_11_WichtigePersonen_Condition;
	information = Info_Mine_Sld_11_WichtigePersonen_Info;
	permanent = 1;
//	description = "Who gives the orders here?";
//	description = "Wer erteilt hier die Befehle?";
	description = "Kdo tady dává rozkazy?";
};

func int Info_Mine_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Mine_Sld_11_WichtigePersonen_15_00"); //Who gives the orders here?
//	AI_Output(other,self,"Info_Mine_Sld_11_WichtigePersonen_15_00"); //Wer erteilt hier die Befehle?
	AI_Output(other,self,"Info_Mine_Sld_11_WichtigePersonen_15_00"); //Kdo tady dává rozkazy?
//	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01"); //Here in the Hollow, everyone does what Okyl says. He knows all the bigshots in the Camp.
//	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01"); //Hier im Kessel läuft alles über Okyl. Er steht mit den wichtigen Leuten im Lager im Kontakt.
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01"); //Tady dělá každý to, co řekne Okyl. Zná tady v táboře všechny.
//	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02"); //So if you do anything stupid, the water mages in the New Camp will know about it.
//	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02"); //Also wenn du hier Mist baust, werden auch die Wassermagier im Neuen Lager davon erfahren.
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02"); //Takže jestli provedeš něco hloupého, mágové Vody v Novém táboře se o tom dovědí.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Mine_Sld_11_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Mine_Sld_11_DasLager_Condition;
	information = Info_Mine_Sld_11_DasLager_Info;
	permanent = 1;
//	description = "Anything special go on here?";
//	description = "Gibt´s hier irgendwas besonderes?";
	description = "Děje se tu něco zvláštního?";
};

func int Info_Mine_Sld_11_DasLager_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_DasLager_Info()
{
//	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00"); //Anything special go on here?
//	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00"); //Gibt's hier irgendwas besonderes?
	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00"); //A nic zvláštního se tu neděje?
//	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01"); //Nothing but a hell of a lot of trouble if you try anything foolish.
//	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01"); //Hier gibt's nichts außer ´ne ganze Menge Ärger, wenn man uns dumm kommt.
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01"); //Nic než pekelné problémy, pokud něco hloupého provedeš.
//	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02"); //Oh yeah, and more trouble if you try to get in the mine or the gatehouse without permission.
//	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02"); //Ach ja, wer versucht ohne Genehmigung in die Mine oder ins Torhaus zu kommen, bekommt auch Ärger.
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02"); //Jo, další problémy, pokud se pokusíš dostat do dolu nebo přes bránu bez povolení.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Mine_Sld_11_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Mine_Sld_11_DieLage_Condition;
	information = Info_Mine_Sld_11_DieLage_Info;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie sieht´s aus?";
	description = "Jak to jde?";
};

func int Info_Mine_Sld_11_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_DieLage_Info()
{
//	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01"); //It's quiet. A bit too quiet for my liking.
//	AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01"); //Ruhig, für meinen Geschmack etwas zu ruhig.
	AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01"); //Je klid. Až moc klid na můj vkus.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Mine_Sld_11(var c_NPC slf)
{
	//B_AssignFindNpcInfos(slf);

	Info_Mine_Sld_11_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DieLage.npc = Hlp_GetInstanceID(slf);
};
