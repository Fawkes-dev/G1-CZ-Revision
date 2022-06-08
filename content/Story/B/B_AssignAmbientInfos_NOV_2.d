// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Nov_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_2 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Nov_2_EXIT_Condition;
	information = Info_Nov_2_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Nov_2_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Nov_2_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Nov_2_EinerVonEuchWerden_Condition;
	information = Info_Nov_2_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "I want to join you.";
//	description = "Ich will bei euch mitmachen.";
	description = "Chci s k vám přidat.";
};

func int Info_Nov_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Nov_2_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Nov_2_EinerVonEuchWerden_15_00"); //I want to join you.
//	AI_Output(other,self,"Info_Nov_2_EinerVonEuchWerden_15_00"); //Ich will bei euch mitmachen.
	AI_Output(other, self, "Info_Nov_2_EinerVonEuchWerden_15_00"); //Chci s k vám přidat.
//	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_01"); //You mean you've decided to serve the Sleeper? A path of happiness and good fortune lies ahead of you.
//	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_01"); //Du hast dich entschieden, dem Schläfer zu dienen? Vor dir liegt ein Weg voller Freude und Glück.
	AI_Output(self, other, "Info_Nov_2_EinerVonEuchWerden_02_01"); //Opravdu jsi se rozhodl sloužit Spáčovi? Cesta ke štěstí a dobré vyhlídky ti leží přímo u nohou.
//	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_02"); //Go and talk to Cor Kalom. He'll decide what job you're most suited for.
//	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_02"); //Gehe zu Cor Kalom, er entscheidet, für welche Aufgabe du am besten geeignet bist.
	AI_Output(self, other, "Info_Nov_2_EinerVonEuchWerden_02_02"); //Jdi a promluv si s Corem Kalomem. Rozhodne, jaká práce pro tebe bude nejlepší.

	var C_Npc CorKalom; CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Nov_2_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Nov_2_WichtigePersonen_Condition;
	information = Info_Nov_2_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who are your leaders?";
//	description = "Wer sind eure Anführer?";
	description = "Kdo je váš vůdce?";
};

func int Info_Nov_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_2_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Nov_2_WichtigePersonen_15_00"); //Who are your leaders?
//	AI_Output(other,self,"Info_Nov_2_WichtigePersonen_15_00"); //Wer sind eure Anführer?
	AI_Output(other, self, "Info_Nov_2_WichtigePersonen_15_00"); //Kdo je váš vůdce?
//	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_01"); //Y'Berion, Cor Kalom and Cor Angar are our mentors.
//	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_01"); //Y'Berion, Cor Kalom und Cor Angar sind unsere geistigen Väter.
	AI_Output(self, other, "Info_Nov_2_WichtigePersonen_02_01"); //Y'Berion, Cor Kalom a Cor Angar jsou naši rádci.
//	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_02"); //They are our link to the Sleeper. During the invocations, they are the ones who make contact with the Sleeper.
//	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_02"); //Sie stellen unsere Verbindung zum Schläfer dar. Wenn wir an den Anrufungen teilnehmen, sind sie es, die den Kontakt zum Schläfer herstellen.
	AI_Output(self, other, "Info_Nov_2_WichtigePersonen_02_02"); //Jsou naším spojením se Spáčem. Během vzývání jsou jediní, kdo mají se Spáčem kontakt.

	var C_Npc YBerion; YBerion = Hlp_GetNpc(Gur_1200_Yberion);
	var C_Npc CorKalom; CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	var C_Npc CorAngar; CorAngar = Hlp_GetNpc(Gur_1202_CorAngar);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
	CorAngar.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Nov_2_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Nov_2_DasLager_Condition;
	information = Info_Nov_2_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "What should I know about this place?";
//	description = "Was gibt es wichtiges über diesen Ort zu wissen?";
	description = "Co bych měl o tomhle místě vědět?";
};

func int Info_Nov_2_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_2_DasLager_Info()
{
//	AI_Output(other,self,"Info_Nov_2_DasLager_15_00"); //What should I know about this place?
//	AI_Output(other,self,"Info_Nov_2_DasLager_15_00"); //Was gibt es wichtiges über diesen Ort zu wissen?
	AI_Output(other, self, "Info_Nov_2_DasLager_15_00"); //Co bych měl o tomhle místě vědět?
//	AI_Output(self,other,"Info_Nov_2_DasLager_02_01"); //It is a place of faith, brother. We do not have much, but what we do have we share with all who are willing to listen to the Sleeper's teachings.
//	AI_Output(self,other,"Info_Nov_2_DasLager_02_01"); //Es ist ein Ort des Glaubens, Bruder. Wir haben nicht viel, aber was wir haben, teilen wir gerne mit denen, die sich die Lehren des Schläfers anhören wollen.
	AI_Output(self, other, "Info_Nov_2_DasLager_02_01"); //Toto je místo víry, bratře. Nemáme toho mnoho, ale to co máme, sdílíme s každým, kdo je ochoten naslouchat Spáčovu učení.
//	AI_Output(self,other,"Info_Nov_2_DasLager_02_02"); //Speak to one of the Gurus, and your soul will be enriched.
//	AI_Output(self,other,"Info_Nov_2_DasLager_02_02"); //Suche einen der Gurus auf, und lass deine Seele bereichern.
	AI_Output(self, other, "Info_Nov_2_DasLager_02_02"); //Promluv si s jedním z Guru a tvá duše bude povznesena.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Nov_2_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Nov_2_DieLage_Condition;
	information = Info_Nov_2_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Nov_2_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_2_DieLage_Info()
{
//	AI_Output(other,self,"Info_Nov_2_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_Nov_2_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other, self, "Info_Nov_2_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Nov_2_DieLage_02_01"); //I don't have much time. I have jobs to perform.
//	AI_Output(self,other,"Info_Nov_2_DieLage_02_01"); //Ich habe wenig Zeit - muss mich um meine Aufgaben kümmern.
	AI_Output(self, other, "Info_Nov_2_DieLage_02_01"); //Nemám moc času. Musím pracovat.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Nov_2(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);

	Info_Nov_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_DieLage.npc = Hlp_GetInstanceID(slf);
};
