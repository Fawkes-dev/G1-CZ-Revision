// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_Vlk_4_EXIT_Condition;
	information = Info_Vlk_4_EXIT_Info;
	permanent = 1;
//	description = "END";
//	description = "ENDE";
	description = "KONEC";
};

func int Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_4_EXIT_Info()
{
//	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Thanks. Good luck.
//	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Danke. Mach's gut.
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Díky. Hodně štěstí.
//	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Chin up, boy.
//	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Halt die Ohren steif, Junge.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Hlavu vzhůru, hochu.
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_Vlk_4_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 4;
	condition = Info_Vlk_4_EinerVonEuchWerden_Condition;
	information = Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent = 1;
//	description = "What do I have to do to join this camp?";
//	description = "Was muß ich tun, um in diesem Lager aufgenommen zu werden?";
	description = "Co musím udělat, abych se mohl přidat k táboru?";
};

func int Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Vlk_4_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //What do I have to do to join this camp?
//	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //Was muss ich tun, um in diesem Lager aufgenommen zu werden?
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //Co musím udělat, abych se mohl přidat k táboru?
//	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //You mean as a Shadow or a guard? That won't be easy, man. You'll have to pass a few tests before old Thorus'll let you see Gomez.
//	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //Als Schatten oder Gardist meinst du? Das wird nicht leicht, Junge. Du wirst einige Prüfungen bestehen müssen, bevor der alte Thorus dich Gomez vorstellt.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //Myslíš jako Stín nebo jako strážce? To nebude snadné, člověče. Než tě starý Thorus pustí za Gomezem, budeš muset složit pár zkoušek.
//	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //And you'll have to get on the right side of people here. But as long as you don't belong to any camp, nobody's gonna take you seriously.
//	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //Und du musst dich mit den Leuten hier gut stellen. Aber solange du keinem Lager angehörst, nimmt dich keiner ernst.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //A budeš tu muset dobře vyjít s lidmi Ale dokud nebudeš patřit k nějakému táboru, nikdo tě nebude brát vážně.
//	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //If I were you, I'd have a word with some of the Shadows. Maybe you'll find one of them who's willing to help you. If you offer them something in return, that is.
//	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //Wenn ich du wäre, würde ich mich bei den Schatten umhören. Unter ihnen findest du noch am ehesten einen, der dir hilft. Natürlich nur für eine Gegenleistung.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //Být tebou, dal bych řeč s některým ze Stínů. Možná bys našel někoho, kdo by ti mohl pomoci. Samozřejmě když nabídneš něco na oplátku.

	var C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_Vlk_4_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_Vlk_4_WichtigePersonen_Condition;
	information = Info_Vlk_4_WichtigePersonen_Info;
	permanent = 1;
//	description = "Is there anyone special here I should know?";
//	description = "Gibt es hier Leute, die ich kennen sollte?";
	description = "Je tu něco zvláštního, co bych měl vědět?";
};

func int Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_4_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //Is there anyone special here who I should know?
//	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //Gibt es hier Leute, die ich kennen sollte?
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //Je tu někdo důležitý, koho bych měl znát?
//	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Being new, you'd better make sure you don't fall out with Gravo. He may only be a digger, but he knows how to deal with the Ore Barons.
//	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Als Neuer solltest du's dir nicht mit Gravo verscherzen. Er ist zwar nur ein Buddler, aber er hat Beziehungen bis zu den Erzbaronen.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Když jsi tu nový, neměl by ses dostat do křížku s Gravem. I když je jenom kopáč, ví, jak jednat s Rudobarony.
//	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //If you get into trouble with Gomez' bunch, he can help you get out of it.
//	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Wenn du mal ein Problem mit Gomez' Leuten hast, kann er dir helfen dich freizukaufen.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Pokud se dostaneš do problémů s někým z Gomezovy party, může ti z toho pomoci ven.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_Vlk_4_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_Vlk_4_DasLager_Condition;
	information = Info_Vlk_4_DasLager_Info;
	permanent = 1;
//	description = "What places around here should I know about?";
//	description = "Was gibt es hier für wichtige Orte?";
	description = "Která místa bych tady měl znát?";
};

func int Info_Vlk_4_DasLager_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
func void Info_Vlk_4_DasLager_Info()
{
//	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //What places around here should I know about?
//	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //Was gibt es hier für wichtige Orte?
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //Která místa bych tady měl znát?
//	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //Unless you fancy digging in the mines, you should hang around in between the northern gate and the castle gate.
//	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //Wenn du keine Lust hast, in den Minen zu schuften, solltest du dich am Eingangsplatz zwischen Nordtor und Burgtor rumtreiben.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //Jestli nemáš chuť kopat v dolech, měl by ses porozhlédnout mezi severní a hradní bránou.
//	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //If you're lucky, Thorus or Diego might give you something to do for them - that'll give you a chance to get on the right side of them. It can't hurt to get in with Gomez' people.
//	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Wenn du Glück hast, gibt Thorus oder Diego dir 'ne Aufgabe - dann kannst du dich bewähren. Ist bestimmt nicht schlecht, zu Gomez' Leuten zu gehören.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Když budeš mít štěstí, Thorus nebo Diego by ti mohli navrhnout něco, co bys pro ně mohl udělat - tak budeš mít šanci dostat se na jejich stranu. Určitě není špatné patřit ke Gomezovým lidem..
//	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Or you might meet a mage. They sometimes ask folks to do errands for 'em. And they pay well.
//	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Oder du hast das Glück einen Magier zu treffen. Sie wollen manchmal, dass du einen Botengang für sie erledigst. Sie zahlen immer gut.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Nebo by ses měl setkat s mágy. Občas potřebují vyřídit nějaké obchůzky. A platí vždycky dobře.
//	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //The mages come out of the castle? When?
//	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //Die Magier kommen aus der Burg raus? Wann?
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //Mágové vycházejí z hradu? A kdy?
//	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //What do I know. Ask the folks that live there.
//	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //Was weiß ich. Frag die Leute, die da wohnen.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //Co já vím.Zeptej se lidí, kteří tam žijí.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_Vlk_4_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_Vlk_4_DieLage_Condition;
	information = Info_Vlk_4_DieLage_Info;
	permanent = 1;
//	description = "You okay?";
//	description = "Alles klar?";
	description = "Jsi v pořádku?";
};

func int Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_4_DieLage_Info()
{
//	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //You okay?
//	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //Alles klar?
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //Jsi v pořádku?
//	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //As okay as I was 20 years ago. Nothing much has changed since then.
//	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //So klar wie vor 20 Jahren. Und seitdem hat sich hier nicht viel verändert.
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //Tak jako před dvaceti lety. Nic se za tu dobu nezměnilo.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Vlk_4(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);

	Info_Vlk_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc = Hlp_GetInstanceID(slf);
};
