// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Tpl_8_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_8 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Tpl_8_EXIT_Condition;
	information = Info_Tpl_8_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Tpl_8_EXIT_Condition()
{
	return 1;
};

func void Info_Tpl_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Tpl_8_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Tpl_8_EinerVonEuchWerden_Condition;
	information = Info_Tpl_8_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "Do you need another good man?";
//	description = "Könnt ihr noch einen guten Mann brauchen?";
	description = "Potřebujete spolehlivého muže?";
};

func int Info_Tpl_8_EinerVonEuchWerden_Condition()
{
	if ((Npc_GetTrueGuild(other) != GIL_TPL)
	&& (!C_NpcBelongsToNewCamp(other))
	&& (!C_NpcBelongsToOldCamp(other)))
	{
		return TRUE;
	};
};

func void Info_Tpl_8_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00"); //Do you need another good man?
//	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00"); //Könnt ihr noch einen guten Mann brauchen?
	AI_Output(other, self, "Info_Tpl_8_EinerVonEuchWerden_15_00"); //Potřebujete spolehlivého muže?
//	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01"); //We're always looking for good men. But you will have to work hard to improve yourself. Only advanced novices may become templars.
//	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01"); //Gute Leute suchen wir immer. Aber du wirst hart an dir arbeiten müssen. Erst ein fortgeschrittener Novize kann zum Templer befördert werden.
	AI_Output(self, other, "Info_Tpl_8_EinerVonEuchWerden_08_01"); //Pořád hledáme spolehlivé muže. Musíš ale tvrdě pracovat, aby ses zdokonalil. Jen zkušení novicové se mohou stát templáři.
//	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02"); //It is the greatest honor for any follower of the Brotherhood of the Sleeper.
//	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02"); //Es ist die höchste Ehre für einen Anhänger der Bruderschaft des Schläfers.
	AI_Output(self, other, "Info_Tpl_8_EinerVonEuchWerden_08_02"); //To je TA největší pocta pro všechny následovníky Spáčova Bratrstva.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Tpl_8_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Tpl_8_WichtigePersonen_Condition;
	information = Info_Tpl_8_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Tpl_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Tpl_8_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other, self, "Info_Tpl_8_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01"); //We do what the Gurus command. It is our duty to serve them.
//	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01"); //Wir tun alles, was uns die Gurus sagen. Es ist unsere Pflicht, ihnen zu dienen.
	AI_Output(self, other, "Info_Tpl_8_WichtigePersonen_08_01"); //Děláme to, co řeknou Guru. Sloužit jim je naše povinnost.
//	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02"); //Who are these Gurus?
//	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02"); //Wer sind eure Gurus?
	AI_Output(other, self, "Info_Tpl_8_WichtigePersonen_15_02"); //Kdo jsou ti Guru?
//	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03"); //Y'Berion the Enlightened One is the head Guru. Below him are Cor Kalom and Cor Angar and a few others.
//	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03"); //Y'Berion der Erleuchtete ist der Oberste Guru. Unter ihm folgen Cor Kalom und Cor Angar und noch einige weitere.
	AI_Output(self, other, "Info_Tpl_8_WichtigePersonen_08_03"); //Y´Berion Osvícený je hlavou Guru. Pod ním jsou Cor Kalom a další.
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

instance Info_Tpl_8_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Tpl_8_DasLager_Condition;
	information = Info_Tpl_8_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "What can you tell me about this camp?";
//	description = "Was kannst du mir über dieses Lager erzählen?";
	description = "Co mi můžeš říci o táboře?";
};

func int Info_Tpl_8_DasLager_Condition()
{
	if (!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_8_DasLager_Info()
{
//	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00"); //What can you tell me about this camp?
//	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00"); //Was kannst du mir über dieses Lager erzählen?
	AI_Output(other, self, "Info_Tpl_8_DasLager_15_00"); //Co mi můžeš říci o táboru?
//	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01"); //As a newcomer you may walk practically wherever you choose. But infidels cannot be allowed to enter the Sleeper's temple.
//	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01"); //Als Neuling darfst du dich fast überall aufhalten. Aber es ist Ungläubigen untersagt, den Tempel des Schläfers zu betreten.
	AI_Output(self, other, "Info_Tpl_8_DasLager_08_01"); //Jako nový příchozí můžeš jít v podstatě kam chceš. Nevěrcům však není povolen vstup do Spáčova chrámu.
//	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02"); //So only go where you are permitted to go. And do not disturb our masters in their meditation.
//	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02"); //Also halt dich nur da auf, wo es dir gestattet ist. Und störe nicht unsere Meister bei der Meditation.
	AI_Output(self, other, "Info_Tpl_8_DasLager_08_02"); //Takže choď jen tam, kam smíš. A také nevyrušuj naše pány při meditacích.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Tpl_8_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Tpl_8_DieLage_Condition;
	information = Info_Tpl_8_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How are you doing?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Tpl_8_DieLage_Condition()
{
	if (!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_8_DieLage_Info()
{
//	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00"); //How are you doing?
//	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other, self, "Info_Tpl_8_DieLage_15_00"); //Jak se máš?
//	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01"); //I am warning you. Do not be disrespectful. You are talking to one of the chosen guards of the prophets.
//	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01"); //Ich warne dich. Sei nicht respektlos. Du redest mit einem Auserwählten Beschützer der Propheten.
	AI_Output(self, other, "Info_Tpl_8_DieLage_08_01"); //Varuji tě. Nebuď nezdvořilý. Mluvíš s jedním z vyvolených prorokových strážců.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Tpl_8(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);

	Info_Tpl_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_DieLage.npc = Hlp_GetInstanceID(slf);
};
