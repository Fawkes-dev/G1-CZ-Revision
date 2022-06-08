// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Nov_5_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_5 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Nov_5_EXIT_Condition;
	information = Info_Nov_5_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_Nov_5_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Nov_5_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Nov_5_EinerVonEuchWerden_Condition;
	information = Info_Nov_5_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "How can I join this camp?";
//	description = "Wie werde ich in diesem Lager aufgenommen?";
	description = "Jak se můžu přidat k táboru?";
};

func int Info_Nov_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Nov_5_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00"); //How can I join this camp?
//	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00"); //Wie werde ich in diesem Lager aufgenommen?
	AI_Output(other, self, "Info_Nov_5_EinerVonEuchWerden_15_00"); //Jak se můžu přidat k táboru?
//	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01"); //There's nothing simpler. Just talk to a couple of the junior Gurus. They'll help you.
//	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01"); //Nichts leichter als das. Rede einfach mit einigen der niederen Gurus. Sie werden dir weiterhelfen.
	AI_Output(self, other, "Info_Nov_5_EinerVonEuchWerden_05_01"); //Není nic jednoduššího. Prostě řekneš pár mladým Guru. Pomůžou ti.
//	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02"); //You'll come to like it here, you'll see.
//	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02"); //Es wird dir hier gefallen - wirst schon sehen.
	AI_Output(self, other, "Info_Nov_5_EinerVonEuchWerden_05_02"); //Bude se ti tu líbit, uvidíš.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Nov_5_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Nov_5_WichtigePersonen_Condition;
	information = Info_Nov_5_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Nov_5_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_5_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other, self, "Info_Nov_5_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01"); //The Gurus have everything under control. But if you don't draw attention to yourself,they'll leave you alone.
//	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01"); //Die Gurus haben alles unter Kontrolle. Aber wenn man nicht auffällt, lassen sie einen in Ruhe.
	AI_Output(self, other, "Info_Nov_5_WichtigePersonen_05_01"); //Guru mají všechno pod kontrolou. Pokud ale na sebe nebudeš přitahovat pozornost, nechají tě na pokoji
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Nov_5_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Nov_5_DasLager_Condition;
	information = Info_Nov_5_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "What can you tell me about this camp?";
//	description = "Was kannst du mit über dieses Lager erzählen?";
	description = "Co mi můžeš říci o táboře?";
};

func int Info_Nov_5_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_5_DasLager_Info()
{
//	AI_Output(other,self,"Info_Nov_5_DasLager_15_00"); //What can you tell me about this camp?
//	AI_Output(other,self,"Info_Nov_5_DasLager_15_00"); //Was kannst du mir über dieses Lager erzählen?
	AI_Output(other, self, "Info_Nov_5_DasLager_15_00"); //Co mi můžeš říci o táboru?
//	AI_Output(self,other,"Info_Nov_5_DasLager_05_01"); //It's the best place to be in the entire goddam colony.
//	AI_Output(self,other,"Info_Nov_5_DasLager_05_01"); //Es ist der beste Ort, an dem du in dieser gottverdammten Kolonie sein kannst.
	AI_Output(self, other, "Info_Nov_5_DasLager_05_01"); //Je to nejlepší místo v celé téhle proklaté kolonii.
//	AI_Output(self,other,"Info_Nov_5_DasLager_05_02"); //Even if you don't believe in the Sleeper's teachings, at least you get your daily ration of food and swampweed. All you have to do is talk to Fortuno.
//	AI_Output(self,other,"Info_Nov_5_DasLager_05_02"); //Selbst wenn du nicht an die Lehren des Schläfers glaubst, bekommst du deine tägliche Ration Essen und Sumpfkraut. Du brauchst nur zu Fortuno zu gehen.
	AI_Output(self, other, "Info_Nov_5_DasLager_05_02"); //Dokonce i když nebudeš věřit Spáčovu učení, dostaneš svůj denní příděl drogy z bažin. Všechno, co musíš udělat, je říci si Fortunovi.
//	AI_Output(other,self,"Info_Nov_5_DasLager_15_03"); //Where can I find him?
//	AI_Output(other,self,"Info_Nov_5_DasLager_15_03"); //Und wo finde ich den?
	AI_Output(other, self, "Info_Nov_5_DasLager_15_03"); //Kde ho najdu?
//	AI_Output(self,other,"Info_Nov_5_DasLager_05_04"); //Down at Cor Kalom's lab, near the big temple courtyard.
//	AI_Output(self,other,"Info_Nov_5_DasLager_05_04"); //Unten an Cor Kaloms Labor. In der Nähe des großen Tempelplatzes.
	AI_Output(self, other, "Info_Nov_5_DasLager_05_04"); //Dole pod dílnou Cora Kaloma, kousek od velkého templářského dvora.

	var C_Npc CorKalom; CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Nov_5_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Nov_5_DieLage_Condition;
	information = Info_Nov_5_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How are things?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Nov_5_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_5_DieLage_Info()
{
//	AI_Output(other,self,"Info_Nov_5_DieLage_15_00"); //How are things?
//	AI_Output(other,self,"Info_Nov_5_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other, self, "Info_Nov_5_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_Nov_5_DieLage_05_01"); //I can't complain. Say, are you new around here?
//	AI_Output(self,other,"Info_Nov_5_DieLage_05_01"); //Kann mich nicht beklagen. Bist du neu hier?
	AI_Output(self, other, "Info_Nov_5_DieLage_05_01"); //Nemůžu si stěžovat. Ty jsi tady nový?
//	AI_Output(other,self,"Info_Nov_5_DieLage_15_02"); //I've only just arrived.
//	AI_Output(other,self,"Info_Nov_5_DieLage_15_02"); //Ich bin vor kurzem angekommen.
	AI_Output(other, self, "Info_Nov_5_DieLage_15_02"); //Jen jsem právě přišel.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Nov_5(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);

	Info_Nov_5_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_DieLage.npc = Hlp_GetInstanceID(slf);
};
