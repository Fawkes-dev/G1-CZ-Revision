// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Vlk_2_EXIT_Condition;
	information = Info_Vlk_2_EXIT_Info;
	permanent = 1;
	description = "END";
};

func int Info_Vlk_2_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Vlk_2_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Vlk_2_EinerVonEuchWerden_Condition;
	information = Info_Vlk_2_EinerVonEuchWerden_Info;
	permanent = 1;
//	description = "I want to join you.";
//	description = "Ich will bei euch mitmachen.";
	description = "Chci s k vám přidat.";
};

func int Info_Vlk_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Vlk_2_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00"); //I want to join you.
//	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00"); //Ich will bei euch mitmachen.
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00"); //Chci se k vám přidat.
//	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01"); //I can't understand why you'd wanna volunteer to work in the mines. Guys like you are more likely to be living in the castle soon.
//	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01"); //Ich kann mir nicht vorstellen, dass du freiwillig in den Minen schuften willst. Einer wie du kann schon bald in der Burg leben.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01"); //Nechápu, proč bys chtěl dobrovolně pracovat v dolech. Někdo jako ty může brzy žít na hradě.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Vlk_2_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Vlk_2_WichtigePersonen_Condition;
	information = Info_Vlk_2_WichtigePersonen_Info;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Vlk_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_2_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01"); //Here in the outer ring, Fletcher, Bloodwyn and Jackal collect the protection money. They run a district each.
//	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01"); //Hier im äußeren Ring treiben Fletcher, Bloodwyn und Jackal das Schutzgeld ein. Jedem gehört ein Viertel.
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01"); //Tady na vnějším kruhu vybírají Fletcher, Bloodwyn a Jackal peníze za ochranu. Každý má svůj obvod.
//	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02"); //If you get on the right side of them, you're okay.
//	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02"); //Wenn du dich mit ihnen gut stellst, kann dir nichts passieren.
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02"); //Když s nimi budeš zadobře, nic se ti nestane.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Vlk_2_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Vlk_2_DasLager_Condition;
	information = Info_Vlk_2_DasLager_Info;
	permanent = 1;
//	description = "I want to know more about the Camp.";
//	description = "Ich will mehr über dieses Lager erfahren.";
	description = "Chci vědět o táboře víc.";
};

func int Info_Vlk_2_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_2_DasLager_Info()
{
//	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00"); //I want to know more about the Camp.
//	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00"); //Ich will mehr über dieses Lager erfahren.
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00"); //Chci vědět o táboře víc.
//	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01"); //You should talk to the Shadows. They can tell you all you need to know. Be careful, though, you can't trust most of them.
//	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01"); //Dann solltest du mit den Schatten reden, sie können dir noch am ehesten sagen, was du wissen willst. Aber sei vorsichtig. Den meisten von ihnen kannst du nicht trauen.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01"); //Měl by sis promluvit se Stíny. Řeknou ti, co potřebuješ vědět. Buď ale opatrný, většině z nich nelze důvěřovat.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Vlk_2_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Vlk_2_DieLage_Condition;
	information = Info_Vlk_2_DieLage_Info;
	permanent = 1;
//	description = "What's life like here?";
//	description = "Wie ist das Leben hier?";
	description = "Jak se tady žije?";
};

func int Info_Vlk_2_DieLage_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
func void Info_Vlk_2_DieLage_Info()
{
//	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00"); //What's life like here?
//	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00"); //Wie ist das Leben hier?
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00"); //Jak se tady žije?
//	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01"); //If you've been sent by the Ore Barons, tell 'em I don't want no trouble. I'm not talking to anybody.
//	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01"); //Wenn die Erzbarone dich schicken, sag ihnen, ich will keinen Ärger. Von mir bekommt keiner was zu hören.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01"); //Pokud tě posílají Rudobaroni, vzkaž jim, že nechci žádné problémy. Ode mě nic neuslyšíš.
//	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02"); //I'm satisfied with what they give us.
//	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02"); //Ich bin zufrieden mit dem, was sie uns geben.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02"); //S tím, co nám dávají, jsem spokojený.
//	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03"); //Nobody sent me. I only just got here.
//	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03"); //Niemand schickt mich. Ich bin neu hier.
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03"); //Nikdo mě neposlal. Jsem tu nový.
//	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04"); //A new one, uh? Newcomers always get into trouble pretty quick. I don't wanna get involved, okay?
//	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04"); //Ein Neuer ... Neue kriegen hier immer schnell Ärger. Ich will in nichts reingezogen werden, klar?
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04"); //Nováček, co? Nováčci se vždycky hned dostanou do problémů. Nechci s tím mít nic společného, jasný?
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Vlk_2(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);

	Info_Vlk_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_DieLage.npc = Hlp_GetInstanceID(slf);
};
