// **************************************************
//						EXIT
// **************************************************

instance DIA_Caine_Exit(C_INFO)
{
	npc = Nov_1301_Caine;
	nr = 999;
	condition = DIA_Caine_Exit_Condition;
	information = DIA_Caine_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Caine_Exit_Condition()
{
	return 1;
};

func void DIA_Caine_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Caine_Hallo(C_INFO)
{
	npc = Nov_1301_Caine;
	nr = 1;
	condition = DIA_Caine_Hallo_Condition;
	information = DIA_Caine_Hallo_Info;
	important = 0;
	permanent = 0;
//	description = "Hi! I'm new here!";
//	description = "Hi! Ich bin neu hier!";
	description = "Zdar! Jsem tu nový!";
};

func int DIA_Caine_Hallo_Condition()
{
	return 1;
};

func void DIA_Caine_Hallo_Info()
{
//	AI_Output(other,self,"DIA_Caine_Hallo_15_00"); //Hi! I'm new here!
//	AI_Output(other,self,"DIA_Caine_Hallo_15_00"); //Hi! Ich bin neu hier!
	AI_Output(other, self, "DIA_Caine_Hallo_15_00"); //Zdar! Jsem tady nový!
//	AI_Output(self,other,"DIA_Caine_Hallo_13_01"); //I... I... I'm Caine, a student of Cor Kalom. You must've heard about him, right?
//	AI_Output(self,other,"DIA_Caine_Hallo_13_01"); //Ich bin Caine. Schüler von Cor Kalom. Du hast sicher schon von ihm gehört, richtig?
	AI_Output(self, other, "DIA_Caine_Hallo_13_01"); //Já... Já... Já jsem Caine, žák Cora Kaloma. Určitě jsi o něm slyšel, že jo?

	Info_ClearChoices(DIA_Caine_Hallo);
//	Info_AddChoice(DIA_Caine_Hallo,"No.",DIA_Caine_Hallo_Nein);
//	Info_AddChoice(DIA_Caine_Hallo,"Nein.",DIA_Caine_Hallo_Nein);
	Info_AddChoice(DIA_Caine_Hallo, "Ne.", DIA_Caine_Hallo_Nein);
//	Info_AddChoice(DIA_Caine_Hallo,"Yes.",DIA_Caine_Hallo_Ja);
//	Info_AddChoice(DIA_Caine_Hallo,"Ja.",DIA_Caine_Hallo_Ja);
	Info_AddChoice(DIA_Caine_Hallo, "Ano.", DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
//	AI_Output(other,self,"DIA_Caine_Hallo_Ja_15_00"); //Yeah.
//	AI_Output(other,self,"DIA_Caine_Hallo_Ja_15_00"); //Ja.
	AI_Output(other, self, "DIA_Caine_Hallo_Ja_15_00"); //Tak.
//	AI_Output(self,other,"DIA_Caine_Hallo_Ja_13_01"); //Then you'll know that he's the second man in this camp... a-after Y'Berion.
//	AI_Output(self,other,"DIA_Caine_Hallo_Ja_13_01"); //Dann weißt du ja, dass er hier der zweitwichtigste Mann nach Y'Berion ist.
	AI_Output(self, other, "DIA_Caine_Hallo_Ja_13_01"); //Pak musíš vědět, že je to druhý muž tohohle tábora... p-po Y´Berionovi.
	Info_ClearChoices(DIA_Caine_Hallo);
};

func void DIA_Caine_Hallo_Nein()
{
//	AI_Output(other,self,"DIA_Caine_Hallo_Nein_15_00"); //No.
//	AI_Output(other,self,"DIA_Caine_Hallo_Nein_15_00"); //Nein.
	AI_Output(other, self, "DIA_Caine_Hallo_Nein_15_00"); //Ne.
//	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_01"); //No?! You haven't been here long, have you?
//	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_01"); //Nicht?! Du bist wohl wirklich noch nicht lange hier, was?
	AI_Output(self, other, "DIA_Caine_Hallo_Nein_13_01"); //Ne?! Ty tady asi nebudeš dlouho, viď?
//	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_02"); //Cor Kalom's the second most important man after Y'Berion. He decides who may join us as a novice.
//	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_02"); //Cor Kalom ist der zweitwichtigste Mann nach Y'Berion. Er entscheidet, wer als Novize bei uns aufgenommen wird.
	AI_Output(self, other, "DIA_Caine_Hallo_Nein_13_02"); //Cor Kalom je druhý nejdůležitější muž po Y´Berionovi. Rozhoduje, kdo se k nám může přidat jako novic.
	Info_ClearChoices(DIA_Caine_Hallo);
};

/*
// **************************************************
//						Zu Kalom
// **************************************************

instance DIA_Caine_WaysToKalom(C_INFO)
{
	npc = Nov_1301_Caine;
	nr = 2;
	condition = DIA_Caine_WaysToKalom_Condition;
	information = DIA_Caine_WaysToKalom_Info;
	important = 0;
	permanent = 0;
	description = "Ich würde gerne mit Cor Kalom reden - kannst du mir dabei helfen?";
};

func int DIA_Caine_WaysToKalom_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Caine_Hallo))
	{
		return 1;
	};
};

func void DIA_Caine_WaysToKalom_Info()
{
	AI_Output(other, self, "DIA_Caine_WaysToKalom_15_00"); //Ich würde gerne mit Cor Kalom reden - kannst du mir dabei helfen?
	AI_Output(self, other, "DIA_Caine_WaysToKalom_13_01"); //Wenn du zu Cor Kalom willst, mußt du einen guten Grund haben.
	AI_Output(self, other, "DIA_Caine_WaysToKalom_13_02"); //Die Wache hat Anweisung, nur die vorzulassen, die Alchimistische Substanzen bringen oder von einen der Gurus geschickt wurden.
};

// **************************************************
//				Alchimistische Subsatanzen
// **************************************************

instance DIA_Caine_Alchemies(C_INFO)
{
	npc = Nov_1301_Caine;
	nr = 2;
	condition = DIA_Caine_Alchemies_Condition;
	information = DIA_Caine_Alchemies_Info;
	important = 0;
	permanent = 0;
	description = "Was für alchimistische Substanzen kann ich Kalom bringen?";
};

func int DIA_Caine_Alchemies_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Caine_WaysToKalom))
	{
		return 1;
	};
};

func void DIA_Caine_Alchemies_Info()
{
	AI_Output(other, self, "DIA_Caine_Alchemies_15_00"); //Was für alchimistische Substanzen kann ich Kalom bringen?
	AI_Output(self, other, "DIA_Caine_Alchemies_13_01"); //Kalom benötigt vor allem das Sekret der Minecrawler. Wenn du ihm genug davon beschaffst, wird dich die Wache sicher vorlassen.
	AI_Output(self, other, "DIA_Caine_Alchemies_13_02"); //Er braucht zwar auch Pflanzen und Beeren, die man zwischen den Lagern findet, aber die nimmt Fortuno unten an.
};

*/

// **************************************************
//						Job = Substanzen
// **************************************************

instance DIA_Caine_Job(C_INFO)
{
	npc = Nov_1301_Caine;
	nr = 2;
	condition = DIA_Caine_Job_Condition;
	information = DIA_Caine_Job_Info;
	important = 0;
	permanent = 0;
//	description = "And what's your job?";
//	description = "Und was tust du?";
	description = "Co je tvá práce?";
};

func int DIA_Caine_Job_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Caine_Hallo))
	{
		return 1;
	};
};

func void DIA_Caine_Job_Info()
{
//	AI_Output(other,self,"DIA_Caine_Job_15_00"); //And what's your job?
//	AI_Output(other,self,"DIA_Caine_Job_15_00"); //Und was tust du?
	AI_Output(other, self, "DIA_Caine_Job_15_00"); //A co máš na starosti ty?
//	AI_Output(self,other,"DIA_Caine_Job_13_01"); //I... I... I help my master prepare his alchemic potions.
//	AI_Output(self,other,"DIA_Caine_Job_13_01"); //Ich helfe meinem Meister bei der Aufbereitung der alchimistischen Substanzen.
	AI_Output(self, other, "DIA_Caine_Job_13_01"); //Já... Já... Já pomáhám svému mistrovi připravovat alchymistické lektvary.
//	AI_Output(self,other,"DIA_Caine_Job_13_02"); //Mostly s-swampweed and minecrawler secretion. The... the secretion is required very urgently.
//	AI_Output(self,other,"DIA_Caine_Job_13_02"); //Im wesentlichen Sumpfkraut und Minecrawlersekret. Vor allem das Sekret braucht er dringend.
	AI_Output(self, other, "DIA_Caine_Job_13_02"); //Většinou z d-drogy z b-bažin a z výměšků důlních červů. T.. ten výměšek je nesmírně žádaný.
};

// **************************************************
//						Wo Sekret
// **************************************************

instance DIA_Caine_WoSekret(C_INFO)
{
	npc = Nov_1301_Caine;
	nr = 2;
	condition = DIA_Caine_WoSekret_Condition;
	information = DIA_Caine_WoSekret_Info;
	important = 0;
	permanent = 0;
//	description = "Where do I get the minecrawler secretion?";
//	description = "Wo bekomme ich das Sekret der Minecrawler?";
	description = "Kde dostanu ten výměšek důlních červů?";
};

func int DIA_Caine_WoSekret_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Caine_Job))
	{
		return 1;
	};

	return 0;
};

func void DIA_Caine_WoSekret_Info()
{
//	AI_Output(other,self,"DIA_Caine_WoSekret_15_00"); //Where do I get the minecrawler secretion?
//	AI_Output(other,self,"DIA_Caine_WoSekret_15_00"); //Wo bekomme ich das Sekret der Minecrawler?
	AI_Output(other, self, "DIA_Caine_WoSekret_15_00"); //Kde dostanu ten výměšek důlních červů?
//	AI_Output(self,other,"DIA_Caine_WoSekret_13_01"); //You can find crawlers in the Old Mine. But you need to know how to win the secretion.
//	AI_Output(self,other,"DIA_Caine_WoSekret_13_01"); //Crawler findest du in der Alten Mine. Aber du musst wissen wie du ihnen das Sekret abzapfst.
	AI_Output(self, other, "DIA_Caine_WoSekret_13_01"); //Červy najdeš ve Starém dole. Musíš ale vědět, jak ten výměšek získat.
//	AI_Output(self,other,"DIA_Caine_WoSekret_13_02"); //if you really want to fight these beasts, you'd better speak to one of the templars who's had experience. Like Gor Na Drak.
//	AI_Output(self,other,"DIA_Caine_WoSekret_13_02"); //Falls du wirklich vorhast, dich mit den Biestern anzulegen, sprich besser vorher mit einem der Templer, der Erfahrung hat. Zum Beispiel Gor Na Drak.
	AI_Output(self, other, "DIA_Caine_WoSekret_13_02"); //Jestli chceš s těmi bestiemi opravdu bojovat, měl by sis promluvit s některým z templářů, kteří s tím mají zkušenosti. Jako třeba Gor Na Drak.
//	AI_Output(self,other,"DIA_Caine_WoSekret_13_03"); //He travels around between our Camp and... and the Old Mine every day. I-In the mornings you'll find him at the lab.
//	AI_Output(self,other,"DIA_Caine_WoSekret_13_03"); //Er ist jeden Tag zwischen unserem Lager und der Alten Mine unterwegs. Morgens triffst du ihn unten am Labor.
	AI_Output(self, other, "DIA_Caine_WoSekret_13_03"); //Cestuje mezi naším táborem a Starým dolem každý den. R-ráno ho najdeš v dílně.
};

// **************************************************
//						AddInfoKalom
// **************************************************

instance DIA_Caine_AddInfoKalom(C_INFO)
{
	npc = Nov_1301_Caine;
	nr = 2;
	condition = DIA_Caine_AddInfoKalom_Condition;
	information = DIA_Caine_AddInfoKalom_Info;
	important = 0;
	permanent = 0;
//	description = "What more can you tell me about your master?";
//	description = "Was kannst du mir noch über deinen Meister erzählen?";
	description = "Co mi ještě můžeš říci o svém mistrovi?";
};

func int DIA_Caine_AddInfoKalom_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Caine_Job))
	{
		return 1;
	};

	return 0;
};

func void DIA_Caine_AddInfoKalom_Info()
{
//	AI_Output(other,self,"DIA_Caine_AddInfoKalom_15_00"); //What more can you tell me about your master?
//	AI_Output(other,self,"DIA_Caine_AddInfoKalom_15_00"); //Was kannst du mir noch über deinen Meister erzählen?
	AI_Output(other, self, "DIA_Caine_AddInfoKalom_15_00"); //Co mi ještě můžeš říci o svém mistrovi?
//	AI_Output(self,other,"DIA_Caine_AddInfoKalom_13_01"); //He... he's not like the... the other Gurus. Everybody may address him, but... but NOBODY's allowed to waste his precious time.
//	AI_Output(self,other,"DIA_Caine_AddInfoKalom_13_01"); //Er ist nicht wie die anderen Gurus. Er getattet jedem, ihn anzusprechen, aber NIEMANDEM seine kostbare Zeit zu verschwenden.
	AI_Output(self, other, "DIA_Caine_AddInfoKalom_13_01"); //On... on není jako... ostatní Guru. Každý se na něj může obrátit, ale... ale NIKDO nesmí plýtvat jeho vzácným časem.
};

/*
// **************************************************
//
// **************************************************

instance DIA_Caine_WieGuruSend(C_INFO)
{
	npc = Nov_1301_Caine;
	nr = 2;
	condition = DIA_Caine_WieGuruSend_Condition;
	information = DIA_Caine_WieGuruSend_Info;
	important = 0;
	permanent = 0;
	description = "Wie bringe ich einen Guru dazu, dass er mich zu Kalom schickt.";
};

func int DIA_Caine_WieGuruSend_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Caine_WaysToKalom))
	{
		return 1;
	};
};

func void DIA_Caine_WieGuruSend_Info()
{
	AI_Output(other, self, "DIA_Caine_WieGuruSend_15_00"); //Wie bringe ich einen Guru dazu, dass er mich zu Kalom schickt.
	AI_Output(self, other, "DIA_Caine_WieGuruSend_13_01"); //Darüber kann die Lester mehr erzählen.
	AI_Output(self, other, "DIA_Caine_WieGuruSend_13_02"); //Bis vor kurzen hat er noch für Cor Kalom gearbeitet, jetzt kümmert er sich zusammen mit den Gurus um die Neuen.
};

*/

/*------------------------------------------------------------------------
REZEPT INNER TRUHE
------------------------------------------------------------------------ */

instance Nov_1301_Caine_CHEST(C_INFO)
{
	npc = Nov_1301_Caine;
	condition = Nov_1301_Caine_CHEST_Condition;
	information = Nov_1301_Caine_CHEST_Info;
	important = 0;
	permanent = 0;
//	description = "How can I get Kalom's recipe?";
//	description = "Wie komme ich an das Rezept von Kalom?";
	description = "Jak dostanu Kalomův recept?";
};

func int Nov_1301_Caine_CHEST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};

	return 0;
};

func void Nov_1301_Caine_CHEST_Info()
{
//	AI_Output(other,self,"Nov_1301_Caine_CHEST_Info_15_01"); //How can I get Kalom's recipe?
//	AI_Output(other,self,"Nov_1301_Caine_CHEST_Info_15_01"); //Wie komme ich an das Rezept von Kalom?
	AI_Output(other, self, "Nov_1301_Caine_CHEST_Info_15_01"); //Jak dostanu Kalomův recept?
//	AI_Output(self,other,"Nov_1301_Caine_CHEST_Info_13_02"); //You don't. He keeps it in a locked chest and won't give it to anybody.
//	AI_Output(self,other,"Nov_1301_Caine_CHEST_Info_13_02"); //Gar nicht. Er hält es in seiner Truhe verschlossen. Das rückt er niemals raus.
	AI_Output(self, other, "Nov_1301_Caine_CHEST_Info_13_02"); //Nedostaneš ho. Má ho zamčený ve své truhle a nikomu ho nedá.
};
