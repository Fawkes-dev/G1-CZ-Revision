// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Tpl_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_13 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Tpl_13_EXIT_Condition;
	information = Info_Tpl_13_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Tpl_13_EXIT_Condition()
{
	return 1;
};

func void Info_Tpl_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Tpl_13_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Tpl_13_EinerVonEuchWerden_Condition;
	information = Info_Tpl_13_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "I want to become a templar like you.";
//	description = "Ich will ein Templer werden - so wie du.";
	description = "Chci se stát templářem jako ty.";
};

func int Info_Tpl_13_EinerVonEuchWerden_Condition()
{
	if ((Npc_GetTrueGuild(other) != GIL_TPL)
	&& (!C_NpcBelongsToNewCamp(other))
	&& (!C_NpcBelongsToOldCamp(other)))
	{
		return TRUE;
	};
};

func void Info_Tpl_13_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00"); //I want to become a templar like you.
//	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00"); //Ich will ein Templer werden - so wie du.
	AI_Output(other, self, "Info_Tpl_13_EinerVonEuchWerden_15_00"); //Chci se stát templářem jako ty.
//	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01"); //Have you any idea what I have had to deprive myself of to be allowed to serve the Sleeper's chosen ones as a temple guard?
//	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01"); //Hast du eine Ahnung wie viele Entbehrungen ich auf mich nehmen musste, um den Auserwählten des Schläfers als Tempelwächter dienen zu dürfen?
	AI_Output(self, other, "Info_Tpl_13_EinerVonEuchWerden_13_01"); //Máš ponětí, co všechno jsem musel vytrpět, abych směl sloužit mezi Spáčovými vyvolenými jako templářská stráž?
//	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02"); //Don't think you can just stroll in here and take all the highest honors.
//	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02"); //Glaub bloß nicht, du kannst hier einfach reinspazieren und bekommst so mir nichts dir nichts die höchsten Auszeichnungen.
	AI_Output(self, other, "Info_Tpl_13_EinerVonEuchWerden_13_02"); //Nemysli si, že se tu budeš jen tak poflakovat a požívat té největší pocty.
//	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03"); //Before you even consider it, you should learn a little about the Sleeper's teachings.
//	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03"); //Bevor du überhaupt darüber nachdenkst, solltest du dich mit der Lehre des Schläfers vertraut machen.
	AI_Output(self, other, "Info_Tpl_13_EinerVonEuchWerden_13_03"); //Ještě než se rozhodneš, měl by ses trochu seznámit se Spáčovým učením.
//	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04"); //That'll take some time and it may knock some sense into you.
//	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04"); //Das wird einige Zeit in Anspruch nehmen und es wird dir auch sicher die Flausen aus dem Kopf treiben.
	AI_Output(self, other, "Info_Tpl_13_EinerVonEuchWerden_13_04"); //To zabere nějaký čas a mělo by to do tebe načerpat nějaké vědomosti.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Tpl_13_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Tpl_13_WichtigePersonen_Condition;
	information = Info_Tpl_13_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Tpl_13_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other, self, "Info_Tpl_13_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01"); //Our Gurus are the Sleepers's chosen ones! The Sleeper determines our fate and the Gurus prophesy it.
//	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01"); //Unsere Gurus sind die Auserwählten des Schläfers! Der Schläfer bestimmt unser Schicksal und die Gurus verkünden es uns.
	AI_Output(self, other, "Info_Tpl_13_WichtigePersonen_13_01"); //Naši Guru jsou Spáčovi vyvolení! Spáč předurčuje náš osud a Guru jej věští.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Tpl_13_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Tpl_13_DasLager_Condition;
	information = Info_Tpl_13_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "I'd like to take a look inside the Sleeper's temple...";
//	description = "Ich würde gerne mal in den Tempel des Schläfers gehen...";
	description = "Chtěl bych se podívat do Spáčova chrámu...";
};

func int Info_Tpl_13_DasLager_Condition()
{
	if (Kapitel <= 1)
	{
		return 1;
	};
};

func void Info_Tpl_13_DasLager_Info()
{
//	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00"); //I'd like to take a look inside the Sleeper's temple...
//	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00"); //Ich würde gerne mal in den Tempel des Schläfers gehen ...
	AI_Output(other, self, "Info_Tpl_13_DasLager_15_00"); //Chtěl bych se podívat do Spáčova chrámu...
//	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01"); //That's unthinkable! An infidel in the Temple! Until you have pledged yourself to the Sleeper's service, you will not be allowed to enter the Temple!
//	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01"); //Undenkbar! Ein Ungläubiger im Tempel! Bevor du dich nicht in den Dienst des Schläfers gestellt hast, wird dir der Zutritt zum Tempel verwehrt bleiben!
	AI_Output(self, other, "Info_Tpl_13_DasLager_13_01"); //To je nemyslitelné! Nevěrec v Chrámu! Dokud se nezavážeš Spáčovi sloužit, nebudeš smět do Chrámu vstoupit!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Tpl_13_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Tpl_13_DieLage_Condition;
	information = Info_Tpl_13_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie läuft's?";
	description = "Jak to jde?";
};

func int Info_Tpl_13_DieLage_Condition()
{
	if (!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_13_DieLage_Info()
{
//	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00"); //Wie läuft's?
	AI_Output(other, self, "Info_Tpl_13_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01"); //Since I've become one of the chosen protectors of the faith, I feel better than I have ever done before.
//	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01"); //Seit ich ein auserwählter Beschützer des Glaubens bin, fühle ich mich besser als je zuvor in meinem Leben.
	AI_Output(self, other, "Info_Tpl_13_DieLage_13_01"); //Od té doby, co jsem se stal jedním z vyvolených ochránců víry, cítím se lépe než kdykoliv předtím.
//	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02"); //Sounds pretty important...
//	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02"); //Hört sich wichtig an ...
	AI_Output(other, self, "Info_Tpl_13_DieLage_15_02"); //To zní honosně...
//	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03"); //You are an infidel. You do not understand.
//	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03"); //Du bist ein Ungläubiger. Du verstehst davon nichts.
	AI_Output(self, other, "Info_Tpl_13_DieLage_13_03"); //Jsi nevěrec. Nerozumíš tomu.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Tpl_13(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);

	Info_Tpl_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DieLage.npc = Hlp_GetInstanceID(slf);
};
