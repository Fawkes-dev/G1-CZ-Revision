// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr = 999;
	condition = Info_grd_7_EXIT_Condition;
	information = Info_grd_7_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_grd_7_EXIT_Condition()
{
	return 1;
};

func void Info_grd_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_grd_7_EinerVonEuchWerden(C_INFO) // E1
{
	nr = 1;
	condition = Info_grd_7_EinerVonEuchWerden_Condition;
	information = Info_grd_7_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "What do I have to do to get accepted as one of Gomez' guards?";
//	description = "Was muß ich tun, um bei Gomez' Gardisten aufgenommen zu werden?";
	description = "Co mám udělat proto, abych byl přijat mezi Gomezovy stráže?";
};

func int Info_grd_7_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) != GIL_GRD)
	&& (Npc_GetTrueGuild(other) != GIL_KDF)
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

func void Info_grd_7_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //What do I have to do to get accepted as one of Gomez' guards?
//	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //Was muss ich tun, um bei Gomez' Gardisten aufgenommen zu werden?
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //Co mám udělat proto, abych byl přijat mezi Gomezovy stráže?
//	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //You?! You're kidding. You think you can just come in here strutting and get straight to the top, or what?
//	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //Du?! Du machst mir Spaß. Kommst hier rein und willst direkt ganz nach oben, was?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //Ty?! Jsi blázen. Myslíš, že si sem přijdeš jen tak a budeš hned nahoře, nebo co?
//	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Gomez has only the best people for guards.
//	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Gomez macht nur die Besten seiner Leute zu Gardisten.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Gomez má mezi stráží jen ty nejlepší.
//	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //You're gonna have to work your way up like everyone else, and prove your loyalty as a Shadow.
//	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Du wirst wie alle anderen anfangen müssen, und deine Loyalität als Schatten unter Beweis stellen.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Musíš tu pracovat jako každý jiný a prokázat svou oddanost jako Stín.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_grd_7_WichtigePersonen(C_INFO)
{
	nr = 1;
	condition = Info_grd_7_WichtigePersonen_Condition;
	information = Info_grd_7_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who calls the shots around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo to tady vede?";
};

func int Info_grd_7_WichtigePersonen_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
func void Info_grd_7_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //Who calls the shots around here?
//	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //Kdo to tady vede?
//	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Thorus controls all that goes on in the Camp. Diego's his lieutenant.
//	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Thorus kontrolliert alles, was im Lager läuft. Diego ist seine rechte Hand.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Thorus kontroluje všechno, co se děje v táboře. Diego je jeho pravá ruka.
//	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //If you want to get anywhere here, they're the guys you need to talk to.
//	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //Wenn du hier aufgenommen werden willst, sind das die Leute, mit denen du reden musst.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //Pokud chceš kamkoliv jít, musíš to těm hochům říci.
	var C_NPC Diego; Diego = Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_grd_7_DasLager(C_INFO)
{
	nr = 1;
	condition = Info_grd_7_DasLager_Condition;
	information = Info_grd_7_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "Do all the people here work for Gomez?";
//	description = "Arbeiten alle Leute hier für die Erzbarone?";
	description = "Pracují tady všichni pro Gomeze?";
};

func int Info_grd_7_DasLager_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
func void Info_grd_7_DasLager_Info()
{
//	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Do all the people here work for Gomez?
//	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Arbeiten alle Leute hier für Gomez?
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Pracují tady všichni pro Gomeze?
//	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //Na. Most of them are just ordinary diggers.
//	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //Nein. Die meisten hier sind einfache Buddler.
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //Ne. Většinou jsou to obyčejní kopáči.
//	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Only we guards and the Shadows are with Gomez.
//	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Nur wir Gardisten und die Schatten sind Gomez' Leute.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Jenom my, stráže a Stínové jsou s Gomezem.
	Info_ClearChoices(Info_grd_7_DasLager);
//	Info_AddChoice(Info_grd_7_DasLager,"BACK", Info_grd_7_DasLager_Zurueck);
//	Info_AddChoice(Info_grd_7_DasLager,"ZURÜCK", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"ZPĚT", Info_grd_7_DasLager_Zurueck);
//	Info_AddChoice(Info_grd_7_DasLager,"What do the guards do?", Info_grd_7_DasLager_Gardisten);
//	Info_AddChoice(Info_grd_7_DasLager,"Was tun die Gardisten?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"Co stráže dělají?", Info_grd_7_DasLager_Gardisten);
//	Info_AddChoice(Info_grd_7_DasLager,"What do the Shadows do?", Info_grd_7_DasLager_Schatten);
//	Info_AddChoice(Info_grd_7_DasLager,"Was ist die Aufgabe der Schatten?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"Co dělají Stínové?", Info_grd_7_DasLager_Schatten);
//	Info_AddChoice(Info_grd_7_DasLager,"What do the diggers do?", Info_grd_7_DasLager_Buddler);
//	Info_AddChoice(Info_grd_7_DasLager,"Wofür sind die Buddler da?", Info_grd_7_DasLager_Buddler);
	Info_AddChoice(Info_grd_7_DasLager,"Co dělají kopáči?", Info_grd_7_DasLager_Buddler);
};

func void Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

func void Info_grd_7_DasLager_Gardisten()
{
//	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //What do the guards do?
//	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //Was tun die Gardisten?
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //Co stráže dělají?
//	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //We guard the Camp and protect the diggers.
//	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Wir bewachen das Lager und beschützen die Buddler.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Střežíme tábor a chráníme kopáče.
//	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //We get paid by Gomez and the diggers pay us protection money. It's a pretty lucrative business.
//	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Mit Sold, den Gomez uns zahlt und dem Schutzgeld, das wir von den Buddlern bekommen, kann man seine Zeit ganz gut rumkriegen.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Od Gomeze dostáváme žold a kopáči nám platí za ochranu. Je to dobrej džob.
};

func void Info_grd_7_DasLager_Schatten()
{
//	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //What do the Shadows do?
//	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //Was ist die Aufgabe der Schatten?
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //Co dělají Stínové?
//	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //The Shadows see to it that Gomez' orders are obeyed.
//	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //Die Schatten sorgen dafür, dass Gomez' Befehle ausgeführt werden.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //Stínové dohlížejí na plnění Gomezových příkazů.
//	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //Most of them are common bootlickers trying to work their way up through the ranks. If you wanna make it anywhere round here, that's the way to go.
//	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //Die meisten von ihnen sind Speichellecker, die sich hocharbeiten wollen, aber wenn du hier was werden willst, ist das der einzige Weg.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //Většinou jsou to patolízalové, kteří se pokoušejí propracovat nahoru. Pokud tu něco chceš dokázat, je to jediná cesta.
//	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //You do your chores long enough without failing, and you may become one of us.
//	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //Wenn du lange genug deine Aufgaben erledigt hast, ohne zu versagen, kannst du einer von uns werden.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //Děláš už svou práci dost dlouho tak dobře, aby ses stal jedním z nás.
//	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Once you're with Gomez, nobody in the entire colony will push you around anymore, kid!
//	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Wenn du erst zu Gomez' Leuten gehörst, kann dir niemand in der ganzen Kolonie mehr was anhaben, Kleiner!
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Jakmile budeš s Gomezem, mladej, už si tu na tebe nikdo nedovolí.
};

func void Info_grd_7_DasLager_Buddler()
{
//	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //What do the diggers do?
//	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //Wofür sind die Buddler da?
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //Co dělají kopáči?
//	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //That's a good question! We shouldn't even really let those mudeaters out of the mine.
//	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //Gute Frage! Die Dreckfresser sollten wir eigentlich gar nicht aus der Mine rauslassen.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //Dobrá otázka! Neměli bysme ty umouněnce vůbec pouštět z dolů ven!
//	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //When they've been in the mine for a while they come out here to spend their loot.
//	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //Wenn sie 'ne Zeit lang in der Mine waren, kommen sie her, um ihren Anteil auszugeben.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //Když budou chvilku v dolech, přijdou ven utratit svůj výdělek.
//	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Once they've squandered the lot, they go back into the mine. That's what most people round here do.
//	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Wenn alles verprasst ist, geht's wieder ab in die Mine. Die meisten hier leben so.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Když všechno promrhají, vrátí se do dolů. Tak to tu dělá většina lidí.
//	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //You look like you're cut out for more than just swinging a pickaxe. You should have a word with Thorus, if you haven't already.
//	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Du siehst aus, als wenn du mehr draufhättest, als nur ne Hacke zu schwingen. Du solltest mit Thorus reden, wenn du's nicht schon getan hast.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Vypadá to, že máš na víc, než se ohánět s krumpáčem. Měl bys prohodit slovo s Thorusem, jestli se na to cítíš...
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_grd_7_DieLage(C_INFO) // E1
{
	nr = 1;
	condition = Info_grd_7_DieLage_Condition;
	information = Info_grd_7_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How's it going?";
//	description = "Wie steht's?";
	description = "Jak to jde?";
};

func int Info_grd_7_DieLage_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
func void Info_grd_7_DieLage_Info()
{
//	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //How's it going?
//	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //Wie steht's?
	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //For you, you mean? Until you decide which camp you're with, nobody's gonna take you seriously, kid!
//	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //Für dich? Solange du keinem Lager angehörst, nimmt dich hier keiner ernst, Kleiner!
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //Tak jak to vidíš? Dokud se nerozhodneš, do kterého tábora se dáš, nikdo tě nebude brát vážně, mladej!
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_grd_7(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);

	Info_grd_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_DieLage.npc = Hlp_GetInstanceID(slf);
};
