// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Vlk_1_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_1 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Vlk_1_EXIT_Condition;
	information = Info_Vlk_1_EXIT_Info;
	permanent = 1;
	description = "END";
};

func int Info_Vlk_1_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Vlk_1_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Vlk_1_EinerVonEuchWerden_Condition;
	information = Info_Vlk_1_EinerVonEuchWerden_Info;
	permanent = 1;
//	description = "How do I join this camp?";
//	description = "Wie werde ich in diesem Lager aufgenommen?";
	description = "Jak se můžu přidat k táboru?";
};

func int Info_Vlk_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Vlk_1_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00"); //How do I join this camp?
//	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00"); //Wie werde ich in diesem Lager aufgenommen?
	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00"); //Jak se můžu přidat k táboru?
//	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01"); //That's simple. Grab a pickaxe and get in the mine. Half of your ore gets spent for protection, and the rest will just about enable you to survive.
//	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01"); //Ganz einfach. Du schnappst dir eine Spitzhacke und gehst in die Mine. Etwa die Hälfte von deinem Erz geht für Schutzgeld drauf, von der anderen kann man gerade so leben.
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01"); //To je jednoduché. Seber krumpáč a jdi do dolu. Polovinu své rudy vydáš za ochranu a zbytek ti umožní přežití.
//	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02"); //The prices Gomez asks for his supplies are usury. Still, it's better than munching rice all day like they do in the New Camp.
//	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02"); //Die Preise, die Gomez für seine Vorräte nimmt, sind Wucher. Ist aber immer noch besser als den ganzen Tag Reis zu fressen wie im Neuen Lager.
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02"); //Ceny, jaké si Gomez říká za ochranu, jsou lichvářské. Ale je to pořád lepší, než celý den přežvykovat rýži jako v Novém táboře.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Vlk_1_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Vlk_1_WichtigePersonen_Condition;
	information = Info_Vlk_1_WichtigePersonen_Info;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_Vlk_1_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_1_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01"); //The Ore Barons. They organize the exchange of ore with the King. The more important you are, the more you get.
//	AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01"); //Die Erzbarone. Sie organisieren den Erzaustausch mit dem König. Je höher du stehst, desto mehr bekommst du.
	AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01"); //Rudobaroni. Organizují výměnu rudy s Králem. Čím důležitější jsi, tím víc dostáváš.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Vlk_1_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Vlk_1_DasLager_Condition;
	information = Info_Vlk_1_DasLager_Info;
	permanent = 1;
//	description = "Is there anything more interesting than huts to see?";
//	description = "Gibt es hier noch was interessanteres als Hütten?";
	description = "Je tady k vidění něco zajímavějšího než chatrče?";
};

func int Info_Vlk_1_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_1_DasLager_Info()
{
//	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00"); //Is there anything more interesting than huts to see?
//	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00"); //Gibt es hier noch irgendwas interessanteres als Hütten?
	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00"); //Je tady něco zajímavějšího k vidění než pece?
//	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01"); //Well, you can go to the arena in the evenings and watch the guards puttin' each others faces out of joint.
//	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01"); //Abends kannst du dir in der Arena ansehen, wie sich die Gardisten gegenseitig die Fresse polieren.
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01"); //Jistě, večer můžeš jít do arény a pozorovat strážce, jak si navzájem rozbíjejí ksichty.
//	AI_Output(self,other,"Info_Vlk_1_DasLager_01_02"); //It is really worth the entrance fee.
//	AI_Output(self,other,"Info_Vlk_1_DasLager_01_02"); //Das ist den Eintritt glatt wert.
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_02"); //Za to vstupné to opravdu stojí.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Vlk_1_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Vlk_1_DieLage_Condition;
	information = Info_Vlk_1_DieLage_Info;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_Vlk_1_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_1_DieLage_Info()
{
//	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00"); //Jak se máš?
//	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01"); //I've spent the last two weeks working in the mine. All I want is peace. Get out of my sight.
//	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01"); //Ich habe die letzten zwei Wochen in der Mine geschuftet. Alles, was ich will, ist meine Ruhe. Also geh mir nicht auf den Sack.
	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01"); //Poslední dva týdny jsem strávil prací v dole. Jediné, co chci, je klid. Takže se mi kliď z očí.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Vlk_1(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);

	Info_Vlk_1_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_DieLage.npc = Hlp_GetInstanceID(slf);
};
