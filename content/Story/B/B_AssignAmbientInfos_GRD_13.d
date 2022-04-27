// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_grd_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_13 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_grd_13_EXIT_Condition;
	information = Info_grd_13_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_grd_13_EXIT_Condition()
{
	return 1;
};

func void Info_grd_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_grd_13_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 1;
	condition = Info_grd_13_EinerVonEuchWerden_Condition;
	information = Info_grd_13_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "I want to join the guards.";
//	description = "Ich will Gardist werden.";
	description = "Chci se stát strážcem.";
};

func int Info_grd_13_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) != GIL_GRD)
	&& (Npc_GetTrueGuild(other) != GIL_KDF)
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

func void Info_grd_13_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //I want to join the guards.
//	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //Ich will Gardist werden.
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //Chci se stát strážcem.
//	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01"); //Then you have a long way ahead, boy!
//	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01"); //Da hast du aber noch einiges vor dir, Junge!
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01"); //Pak před sebou budeš mít dlouhou cestu, chlapče.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_grd_13_WichtigePersonen(C_INFO)
{
	nr = 1;
	condition = Info_grd_13_WichtigePersonen_Condition;
	information = Info_grd_13_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_grd_13_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00"); //Kdo to tady vede?
//	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01"); //I do. And I'm telling ya: You'd better watch what you're saying, boy!
//	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01"); //Ich hab hier das Sagen. Und ich sage: Sei vorsichtig, was du sagst, Junge!
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01"); //Já tu dohlížím. A říkám ti: měl bys dávat, hochu, pozor na to, co říkáš!
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_grd_13_DasLager(C_INFO)
{
	nr = 1;
	condition = Info_grd_13_DasLager_Condition;
	information = Info_grd_13_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "How do I get into the castle?";
//	description = "Wie komme ich in die Burg?";
	description = "Jak se dostanu na hrad?";
};

func int Info_grd_13_DasLager_Condition()
{
	if (Kapitel == 1)
	{
	return 1;
	};
};

func void Info_grd_13_DasLager_Info()
{
//	AI_Output(other,self,"Info_grd_13_DasLager_15_00"); //How do I get into the castle?
//	AI_Output(other,self,"Info_grd_13_DasLager_15_00"); //Wie komme ich in die Burg?
	AI_Output(other,self,"Info_grd_13_DasLager_15_00"); //Jak se dostanu na hrad?
//	AI_Output(self,other,"Info_grd_13_DasLager_13_01"); //You don't. Only Gomez' people get to go in there.
//	AI_Output(self,other,"Info_grd_13_DasLager_13_01"); //Gar nicht. Nur Gomez' Leute kommen in die Burg.
	AI_Output(self,other,"Info_grd_13_DasLager_13_01"); //Nedostaneš. Tam smí jen Gomezovi lidé.
	Info_ClearChoices(Info_grd_13_DasLager);
//	Info_AddChoice(Info_grd_13_DasLager,"I see.", Info_grd_13_DasLager_Verstehe);
//	Info_AddChoice(Info_grd_13_DasLager,"Verstehe.", Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager,"Aha...", Info_grd_13_DasLager_Verstehe);
//	Info_AddChoice(Info_grd_13_DasLager,"What if I bribe the guards?", Info_grd_13_DasLager_WachenBestechen);
//	Info_AddChoice(Info_grd_13_DasLager,"Und wenn ich die Wachen besteche?", Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager,"Co kdybych podplatil stráže?", Info_grd_13_DasLager_WachenBestechen);
//	Info_AddChoice(Info_grd_13_DasLager,"How do I get to talk to Gomez?", Info_grd_13_DasLager_GomezSprechen);
//	Info_AddChoice(Info_grd_13_DasLager,"Und wenn ich mit Gomez sprechen will?", Info_grd_13_DasLager_GomezSprechen);
	Info_AddChoice(Info_grd_13_DasLager,"Jak bych si mohl promluvit s Gomezem?", Info_grd_13_DasLager_GomezSprechen);
};

func void Info_grd_13_DasLager_Verstehe()
{
//	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00"); //I see.
//	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00"); //Verstehe.
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00"); //Aha...
	Info_ClearChoices(Info_grd_13_DasLager);
};

func void Info_grd_13_DasLager_WachenBestechen()
{
//	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00"); //What if I bribe the guards?
//	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00"); //Und wenn ich die Wachen besteche?
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00"); //Co kdybych podplatil stráže?
//	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01"); //You have a nerve, kid. I guess you might persuade 'em to look the other way for a minute - if you give 'em enough ore.
//	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01"); //Ganz schön dreist, Kleiner. Schätze für die richtige Menge Erz könntest du sie überzeugen, mal wegzusehen.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01"); //Máš ale nervy, mladej. Jediné, jak bys je mohl přesvědčit, aby se na minutku dívali jinam, je přinést jim něco rudy.
//	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02"); //But if Gomez hears that they've let fresh meat like you go marching into his castle, he'll have the lot of 'em thrown in the dungeons.
//	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02"); //Aber wenn Gomez erfährt, dass sie einen Frischling einfach so in seine Burg gelassen haben, lässt er sie in den Kerker werfen.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02"); //Jak se ale Gomez dozví, že nechali takové čerstvé maso napochodovat do jeho zámku, uvrhne je do vězení.
//	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03"); //Of course, that risk'll make it all the dearer to get in.
//	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03"); //Das steigert natürlich den Preis.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03"); //Jistě, takovýhle risk je ale nutný.
//	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04"); //But even if you did get inside, what would you do in there? All the buildings are strictly guarded.
//	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04"); //Aber selbst wenn du reinkommst, was würdest du drinnen machen? Alle Gebäude sind streng bewacht.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04"); //Ale i když se dostaneš dovnitř, co tam budeš dělat? Všechny budovy jsou přísně střežené.
//	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05"); //I was just curious, that's all.
//	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05"); //Ich war nur neugierig.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05"); //Byl jsem zvědavý, to je vše.
};

func void Info_grd_13_DasLager_GomezSprechen()
{
//	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00"); //How do I get to talk to Gomez?
//	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00"); //Und wenn ich mit Gomez sprechen will?
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00"); //Jak bych si mohl promluvit s Gomezem?
//	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01"); //Gomez ain't interested in new kids that haven't proved their worth.
//	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01"); //Gomez hat kein Interesse an dahergelaufenen Neuen, die sich noch nicht bewährt haben.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01"); //Gomeze nezajímají nováčci, kteří neprokázali své schopnosti.
//	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02"); //If you're serious, have a word with Thorus.
//	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02"); //Rede mit Thorus, wenn es dir ernst ist.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02"); //Jestli to myslíš vážně, promluv si s Thorusem.

	var C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_grd_13_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_grd_13_DieLage_Condition;
	information = Info_grd_13_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie läuft's?";
	description = "Jak to jde?";
};

func int Info_grd_13_DieLage_Condition()
{
	if (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
func void Info_grd_13_DieLage_Info()
{
//	AI_Output(other,self,"Info_grd_13_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_grd_13_DieLage_15_00"); //Wie läuft's?
	AI_Output(other,self,"Info_grd_13_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_grd_13_DieLage_13_01"); //It's quiet. You get the odd brawl with the New Camp or a couple of the sect loonies.
//	AI_Output(self,other,"Info_grd_13_DieLage_13_01"); //Ruhig. Ab und zu gibt's Scherereien mit dem Neuen Lager oder ein paar von den Sektenspinnern.
	AI_Output(self,other,"Info_grd_13_DieLage_13_01"); //Je klid. Občas nějaký problém s Novým táborem nebo pár sektářskými blázny.
//	AI_Output(self,other,"Info_grd_13_DieLage_13_02"); //As long as you're new, it doesn't matter. But as soon as you decide which camp to join you're up to your neck in it.
//	AI_Output(self,other,"Info_grd_13_DieLage_13_02"); //Solange du noch neu bist, hast du kein Problem damit, aber wenn du dich erst mal für ein Lager entschieden hast, steckst du mittendrin - wie wir alle.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02"); //Pokud jsi nový, všechno je jedno. Jakmile se ale rozhodneš, ke kterému táboru se dáš, pak jsi v tom jako my všichni.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_grd_13(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);

	Info_grd_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_DieLage.npc = Hlp_GetInstanceID(slf);
};
