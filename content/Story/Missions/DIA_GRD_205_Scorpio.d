// **************************************
//					EXIT 
// **************************************

instance DIA_Scorpio_Exit(C_INFO)
{
	npc = GRD_205_Scorpio;
	nr = 999;
	condition = DIA_Scorpio_Exit_Condition;
	information = DIA_Scorpio_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Scorpio_Exit_Condition()
{
	return 1;
};

func void DIA_Scorpio_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************
//			Was willst du hier?
// **************************************

instance DIA_Scorpio_Hello(C_INFO)
{
	npc = GRD_205_Scorpio;
	nr = 1;
	condition = DIA_Scorpio_Hello_Condition;
	information = DIA_Scorpio_Hello_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_Scorpio_Hello_Condition()
{ 
	if !C_NpcBelongsToOldcamp (other)
	&& (Kapitel < 4)
	{
		return 1;
	};
};

func void DIA_Scorpio_Hello_Info()
{
//	AI_Output(self,other,"DIA_Scorpio_Hello_13_00"); //Who let YOU in?
//	AI_Output(self,other,"DIA_Scorpio_Hello_13_00"); //Wer hat DICH denn reingelassen?
	AI_Output(self,other,"DIA_Scorpio_Hello_13_00"); //Kdo TĚ pustil dovnitř?
	AI_Output(other,self,"DIA_Scorpio_Hello_15_01"); //Thorus.
//	AI_Output(self,other,"DIA_Scorpio_Hello_13_02"); //And what do you think you're doing?
//	AI_Output(self,other,"DIA_Scorpio_Hello_13_02"); //Und was willst du hier?
	AI_Output(self,other,"DIA_Scorpio_Hello_13_02"); //A co tady chceš?

	Info_ClearChoices(DIA_Scorpio_Hello);
//	Info_Addchoice (DIA_Scorpio_Hello,"I just wanted to see what it's like in here.",DIA_Scorpio_Hello_JustLooking);
//	Info_Addchoice (DIA_Scorpio_Hello,"Ich wollte mal wissen, wie's hier drin aussieht.",DIA_Scorpio_Hello_JustLooking);
	Info_Addchoice (DIA_Scorpio_Hello,"Jen chci vidět, jak to tu vypadá.",DIA_Scorpio_Hello_JustLooking);
//	Info_Addchoice (DIA_Scorpio_Hello,"I have a message for the mages.",DIA_Scorpio_Hello_Mages);
//	Info_Addchoice (DIA_Scorpio_Hello,"Ich habe eine Botschaft für die Magier.",DIA_Scorpio_Hello_Mages);
	Info_Addchoice (DIA_Scorpio_Hello,"Mám zprávu pro mágy.",DIA_Scorpio_Hello_Mages);
	if (Kalom_Krautbote == LOG_RUNNING)
	{
//		Info_Addchoice (DIA_Scorpio_Hello,"I've brought some weed for Gomez.",DIA_Scorpio_Hello_Kraut);
//		Info_Addchoice (DIA_Scorpio_Hello,"Ich habe eine Ladung Kraut für Gomez.",DIA_Scorpio_Hello_Kraut);
		Info_Addchoice (DIA_Scorpio_Hello,"Nesu zásilku drogy z bažin pro Gomeze.",DIA_Scorpio_Hello_Kraut);
	};
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
//		Info_Addchoice (DIA_Scorpio_Hello,"I'm on my way to see Gomez. I'm going to join up with you.",DIA_Scorpio_Hello_Join);
//		Info_Addchoice (DIA_Scorpio_Hello,"Ich bin auf dem Weg zu Gomez. Ich will mich euch anschließen.",DIA_Scorpio_Hello_Join);
		Info_Addchoice (DIA_Scorpio_Hello,"Přišel jsem, abych se setkal s Gomezem. Chci se k vám přidat.",DIA_Scorpio_Hello_Join);
	};
};

func void DIA_Scorpio_Hello_JustLooking()
{
//	AI_Output(other,self,"DIA_Scorpio_Hello_JustLooking_15_00"); //I just wanted to see what it's like in here.
//	AI_Output(other,self,"DIA_Scorpio_Hello_JustLooking_15_00"); //Ich wollte mal wissen, wie's hier drin aussieht.
	AI_Output(other,self,"DIA_Scorpio_Hello_JustLooking_15_00"); //Jen chci vidět, jak to tu vypadá.
//	AI_Output(self,other,"DIA_Scorpio_Hello_JustLooking_13_01"); //Very funny.
//	AI_Output(self,other,"DIA_Scorpio_Hello_JustLooking_13_01"); //Sehr witzig.
	AI_Output(self,other,"DIA_Scorpio_Hello_JustLooking_13_01"); //Zábavné.
	Info_ClearChoices(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Mages()
{
//	AI_Output(other,self,"DIA_Scorpio_Hello_Mages_15_00"); //I have a message for the mages.
//	AI_Output(other,self,"DIA_Scorpio_Hello_Mages_15_00"); //Ich habe eine Botschaft für die Magier.
	AI_Output(other,self,"DIA_Scorpio_Hello_Mages_15_00"); //Mám zprávu pro mágy.
//	AI_Output(self,other,"DIA_Scorpio_Hello_Mages_13_01"); //You work for the mages? I don't want nothing to do with them...
//	AI_Output(self,other,"DIA_Scorpio_Hello_Mages_13_01"); //Du arbeitest für die Magier? Damit will ich nichts zu tun haben ...
	AI_Output(self,other,"DIA_Scorpio_Hello_Mages_13_01"); //Ty pracuješ pro mágy? S tím nechci nic mít...
	Info_ClearChoices(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Kraut()
{
//	AI_Output(other,self,"DIA_Scorpio_Hello_Kraut_15_00"); //I've brought some weed for Gomez.
//	AI_Output(other,self,"DIA_Scorpio_Hello_Kraut_15_00"); //Ich habe eine Ladung Kraut für Gomez.
	AI_Output(other,self,"DIA_Scorpio_Hello_Kraut_15_00"); //Nesu zásilku drogy z bažin pro Gomeze.
//	AI_Output(self,other,"DIA_Scorpio_Hello_Kraut_13_01"); //Then take it to the house with the two guards outside the door.
//	AI_Output(self,other,"DIA_Scorpio_Hello_Kraut_13_01"); //Dann bring sie in das Haus mit den beiden Wachen vor der Tür.
	AI_Output(self,other,"DIA_Scorpio_Hello_Kraut_13_01"); //Tak ji vezmi do budovy se dvěma strážci přede dveřmi.
	Info_ClearChoices(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Join()
{
//	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_00"); //I'm on my way to see Gomez. I'm going to join up with you.
//	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_00"); //Ich bin auf dem Weg zu Gomez. Ich will mich euch anschließen.
	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_00"); //Přišel jsem, abych se setkal Gomezem. Chci se k vám přidat.
//	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_01"); //You? What have you ever done for us?
//	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_01"); //Du? Hast du überhaupt schon was für uns geleistet?
	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_01"); //Ty? Co jsi pro nás vůbec udělal?
//	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_02"); //The Shadows were very happy with me...
//	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_02"); //Die Schatten waren zufrieden.
	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_02"); //Stínové se mnou byli velmi spokojeni.
//	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_03"); //None of us in here wants to hear anything about Shadows. WE have the say in here.
//	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_03"); //Von Schatten will hier keiner was hören. Hier drin geben WIR den Ton an.
	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_03"); //Nikdo z nás tady nechce o Stínech ani slyšet. Tady rozhodujeme MY.
	Info_ClearChoices(DIA_Scorpio_Hello);
};

// **************************************
//			REFUSE TRAIN
// **************************************

instance DIA_Scorpio_REFUSETRAIN(C_INFO)
{
	npc = GRD_205_Scorpio;
	nr = 1;
	condition = DIA_Scorpio_REFUSETRAIN_Condition;
	information = DIA_Scorpio_REFUSETRAIN_Info;
	permanent = 1;
//	description = "Can you teach me to fight?";
//	description = "Kannst du mir beibringen zu kämpfen?";
	description = "Naučíš mě bojovat?";
};                       

func int DIA_Scorpio_REFUSETRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scorpio_Hello) && (Npc_GetTrueGuild(hero) != GIL_GRD))
	//#NEEDS_ATTENTION - tento dialog by nemal byt dostupny od prepadnutia Svobodneho dolu - to uz je Scorpio pri Cavalornovi
	//Teoreticky postaci dialog obmedzit 3. kapitolou
	//if (Npc_KnowsInfo(hero,DIA_Scorpio_Hello) && (Npc_GetTrueGuild (hero) != GIL_GRD) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void DIA_Scorpio_REFUSETRAIN_Info()
{
//	AI_Output(other,self,"DIA_Scorpio_REFUSETRAIN_15_00"); //Can you teach me to fight?
//	AI_Output(other,self,"DIA_Scorpio_REFUSETRAIN_15_00"); //Kannst du mir beibringen zu kämpfen?
	AI_Output(other,self,"DIA_Scorpio_REFUSETRAIN_15_00"); //Naučíš mě bojovat?
//	AI_Output(self,other,"DIA_Scorpio_REFUSETRAIN_13_01"); //I only train guards. So until Thorus has made you one, you'll have to find someone else.
//	AI_Output(self,other,"DIA_Scorpio_REFUSETRAIN_13_01"); //Ich unterrichte nur Gardisten. Bis Thorus dich nicht zum Gardisten gemacht hat, musst du dir jemand anderen suchen.
	AI_Output(self,other,"DIA_Scorpio_REFUSETRAIN_13_01"); //Cvičím jenom stráže. Dokud tě Thorus nejmenuje strážcem, budeš si muset najít někoho jiného.

};

//*******************************
//*********°°°°°°°°°°°***********
//********* KAPITEL 3 ***********
//*********...........***********
//*******************************

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN //
------------------------------------------------------------------------*/
instance GRD_205_Scorpio_WELCOME(C_INFO)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_WELCOME_Condition;
	information = GRD_205_Scorpio_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int GRD_205_Scorpio_WELCOME_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void GRD_205_Scorpio_WELCOME_Info()
{

//	AI_Output(self,other,"GRD_205_Scorpio_WELCOME_Info_13_01"); //Joining us was the best choice you ever made!
//	AI_Output(self,other,"GRD_205_Scorpio_WELCOME_Info_13_01"); //War die beste Entscheidung von dir, zu uns zu kommen!
	AI_Output(self,other,"GRD_205_Scorpio_WELCOME_Info_13_01"); //Dát se k nám byla tvoje nejlepší volba v životě!
	AI_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
							ARMBRUST TALK 
------------------------------------------------------------------------*/

instance GRD_205_Scorpio_CROSSBOW(C_INFO)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_CROSSBOW_Condition;
	information = GRD_205_Scorpio_CROSSBOW_Info;
	important = 0;
	permanent = 1;
//	description = "Will you train me?"; 
//	description = "Kann ich von dir lernen?"; 
	description = "Budeš mě cvičit?"; 
};

func int GRD_205_Scorpio_CROSSBOW_Condition()
{ 
	if (Kapitel >= 4)
	|| (Npc_GetTrueGuild(hero) == GIL_GRD) 

	{
		return TRUE;
	};

};
func void GRD_205_Scorpio_CROSSBOW_Info()
{
//	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_Info_15_01"); //Will you train me?
//	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_Info_15_01"); //Kann ich von dir lernen?
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_Info_15_01"); //Budeš mě cvičit?
//	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_Info_13_02"); //If you have enough ore, I'll teach you how to use a crossbow. Just pay me 200 ore.
//	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_Info_13_02"); //Wenn du genug Erz hast, zeige ich dir den Umgang mit der Armbrust. Gib mir einfach 200 Erz.
	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_Info_13_02"); //Pokud máš dost rudy, naučím tě, jak používat kuši. Zaplať mi 200 nugetů.
	if (log_scorpiocrossbow == FALSE)
	&& (Kapitel <= 4)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
//		B_LogEntry(GE_TeacherOC,"Scorpio can teach me how to use a CROSSBOW.");
//		B_LogEntry(GE_TeacherOC,"Scorpio kann mir den Umgang mit der ARMBRUST zeigen");
		B_LogEntry(GE_TeacherOC,"Scorpio mě může naučit používat KUŠI.");
		log_scorpiocrossbow = TRUE;
	}
	else if (log_scorpiocrossbow == FALSE)
	&& (Kapitel > 4)
	{
		Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
//		B_LogEntry(GE_TeacherOW,"Scorpio can teach me how to use a CROSSBOW.");
//		B_LogEntry(GE_TeacherOW,"Scorpio kann mir den Umgang mit der ARMBRUST zeigen");
		B_LogEntry(GE_TeacherOW,"Scorpio mě může naučit používat KUŠI.");
		log_scorpiocrossbow = TRUE;
	};
	Info_ClearChoices(GRD_205_Scorpio_CROSSBOW);
	Info_Addchoice (GRD_205_Scorpio_CROSSBOW,B_BuildLearnString(NAME_LearnCrossbow_1, LPCOST_TALENT_CROSSBOW_1,200),GRD_205_Scorpio_CROSSBOW_OK);
	Info_Addchoice (GRD_205_Scorpio_CROSSBOW,DIALOG_BACK,GRD_205_Scorpio_CROSSBOW_BACK);

};  
func void GRD_205_Scorpio_CROSSBOW_BACK()
{
	Info_ClearChoices(GRD_205_Scorpio_CROSSBOW);
};

func void GRD_205_Scorpio_CROSSBOW_OK()
{
//	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_OK_15_01"); //It's a deal. So show me how to handle a crossbow.
//	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_OK_15_01"); //Einverstanden. Zeig mir den Umgang mit der Armbrust.
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_OK_15_01"); //Nauč mě ještě lépe zacházet s kuší.
	if (Npc_HasItems(hero,ItMiNugget)>=200)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW,1,LPCOST_TALENT_CROSSBOW_1))
		{
//			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_02"); //Okay, let's get started.
//			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_02"); //Gut, fangen wir direkt an.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_02"); //Dobrá, tak začneme.
//			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_03"); //Grab hold of the shaft, and hold it close against your shoulder. That'll steady your aim.
//			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_03"); //Fasse die Armbrust am Schaft an, um ruhig zielen zu können, drücke sie an deine Schulter.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_03"); //Pevně uchop kuši a přilož si ji k ramenu, abys mohl pohodlně zamířit.
//			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_04"); //Your shoulder's gonna feel like it's liable to fall off during the first few days.
//			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_04"); //In den ersten paar Tagen wirst du ein Gefühl haben, als ob dir die Schulter abfällt.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_04"); //Prvních pár dní budeš mít pocit, jakoby ti rameno mělo upadnout.
//			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_05"); //But after just one week, you'll have a shoulder like a rock!
//			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_05"); //Aber schon nach einer Woche hast du eine Schulter wie aus Stein!
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_05"); //Ale už po týdnu budeš mít rameno jako kámen!
//			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_06"); //Aim right at your target and pull the bolt right back. There's more force behind a bolt than there is behind an arrow from a longbow, so it's going to cause more damage!
//			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_06"); //Visier dein Ziel an und zieh durch. Der Bolzen bekommt mehr Kraft als ein Pfeil durch einen gespannten Bogen, von daher richtest du mehr Schaden an!
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_06"); //Zaměř přímo na cíl podél šipky. Šíp ze samostřílu má daleko větší sílu než šíp z nataženého luku, takže způsobí větší škody!
			B_GiveInvItems(hero,other,ItMiNugget,200);
			GRD_205_Scorpio_CROSSBOW.permanent = 0;
		};
	}
	else
	{
//	 AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_07"); //TWO HUNDRED ORE, right here, in my hand. If you don't have enough ore, then get some!
//	 AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_07"); //ZWEIHUNDERT ERZ. Jeder einzelne Brocken in meine Hand. Wenn du das Erz nicht hast, dann besorge es dir!
	 AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_07"); //DVĚ STĚ nugetů pěkně sem, na ruku. Jestli nemáš dost rudy, tak si ji obstarej!
	};
};

/*------------------------------------------------------------------------
							ARMBRUST TALENT2 
------------------------------------------------------------------------*/

instance GRD_205_Scorpio_CROSSBOW2(C_INFO)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_CROSSBOW2_Condition;
	information = GRD_205_Scorpio_CROSSBOW2_Info;
	important = 0;
	permanent = 1;
//	description = "Show me more about how to handle a crossbow."; 
//	description = "Zeige mir mehr über den Umgang mit der Armbrust"; 
	description = "Nauč mě ještě lépe zacházet se samostřílem."; 
};

func int GRD_205_Scorpio_CROSSBOW2_Condition()
{
	if (Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 1) 
	{
		return TRUE;
	};

};
func void GRD_205_Scorpio_CROSSBOW2_Info()
{
//	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_Info_15_01"); //Show me more about how to handle a crossbow.
//	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_Info_15_01"); //Zeige mir mehr über den Umgang mit der Armbrust
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_Info_15_01"); //Nauč mě ještě lépe zacházet se samostřílem.
//	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_Info_13_02"); //That'll cost you 300 ore.
//	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_Info_13_02"); //Kostet dich 300 Erz.
	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_Info_13_02"); //Bude to stát 300 nugetů.

	Info_ClearChoices(GRD_205_Scorpio_CROSSBOW2);
	Info_Addchoice (GRD_205_Scorpio_CROSSBOW2,B_BuildLearnString(NAME_LearnCrossbow_2,LPCOST_TALENT_CROSSBOW_2,300),GRD_205_Scorpio_CROSSBOW2_OK);
	Info_Addchoice (GRD_205_Scorpio_CROSSBOW2,DIALOG_BACK,GRD_205_Scorpio_CROSSBOW2_BACK);

};  
func void GRD_205_Scorpio_CROSSBOW2_BACK()
{
	Info_ClearChoices(GRD_205_Scorpio_CROSSBOW);
};

func void GRD_205_Scorpio_CROSSBOW2_OK()
{
//	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01"); //Let's start now.
//	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01"); //Lass uns direkt anfangen.
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01"); //Tak začneme.
	if (Npc_HasItems(hero,ItMiNugget)>=300)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW,2,LPCOST_TALENT_CROSSBOW_2))
		{
//		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_02"); //Right. Your shots'll be more accurate and straight if you bend your knees when firing.
//		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_02"); //Gut. Du bekommst mehr Treffsicherheit und Ruhe, wenn du beim Schuss in die Knie gehst
		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_02"); //Dobře. Pokud si při střelbě klekneš, budeš moci lépe zamířit a tvé střely budou přesnější.
//		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_03"); //You'll have to learn to judge what speed your target's moving at.
//		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_03"); //Lerne die Geschwindigkeit von beweglichen Zielen einzuschätzen.
		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_03"); //Musíš se naučit odhadnout, jakou rychlostí se pohybuje tvůj protivník.
//		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_04"); //Fire your bolt into the moving target's path to hit it and slow it down.
//		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_04"); //Schieß in die Laufbahn des Zieles, dann wirst du es treffen und es dadurch auch in seiner Bewegung aufhalten.
		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_04"); //Vystřel šipku do dráhy pohybujícího se cíle, abys jej zasáhl a zpomalil.
//		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_05"); //If there's more than one target, don't waste any time. Nail 'em all down one after the other with calculated shots.
//		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_05"); //Wenn du mehrere Ziele hast, dann verschwende keine Zeit, sondern nagel' alle Ziele mit gezielten Schüssen fest und strecke sie abwechselnd nieder.
		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_05"); //Pokud máš více než jeden cíl, pak nesmíš plýtvat časem. Sundej je jednoho po druhém v naplánovaném pořadí.
//		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_06"); //That's it, I've taught you all I know.
//		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_06"); //Tak jsem tě naučil všechno, co umím.
		B_GiveInvItems(hero,other,ItMiNugget,300);
		GRD_205_Scorpio_CROSSBOW2.permanent = 0;
		};
	}
	else
	{
//	 AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_07"); //See if you can get THREE HUNDRED ore from somewhere.
//	 AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_07"); //Junge, sieh erst mal zu, dass du irgendwo DREIHUNDERT Erz auftreibst.
	 AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_07"); //Uvidíme, jestli někde dokážeš sehnat TŘI STA nugetů.
	};
};
/*------------------------------------------------------------------------
Ab Kapitel 4 steht Scorpio draussen, damit der Spieler bei ihm noch lernen kann 
------------------------------------------------------------------------*/
/*------------------------------------------------------------------------
//							hey PC! //
------------------------------------------------------------------------*/
instance GRD_205_Scorpio_HeyPC(C_INFO)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_HeyPC_Condition;
	information = GRD_205_Scorpio_HeyPC_Info;
	important = 1;
	permanent = 0;
};

func int GRD_205_Scorpio_HeyPC_Condition()
{ 
	if (kapitel >= 4)
	&& (Npc_GetDistToNpc(hero,self) < 1000)
	{
		return TRUE;
	};
};
func void GRD_205_Scorpio_HeyPC_Info()
{
//	AI_Output(self,other,"GRD_205_Scorpio_HeyPC_Info_13_01"); //Hey, no sweat, man. Come over here!
//	AI_Output(self,other,"GRD_205_Scorpio_HeyPC_Info_13_01"); //Hey, keine Angst, Mann, komm mal rüber!
	AI_Output(self,other,"GRD_205_Scorpio_HeyPC_Info_13_01"); //Hej, žádnej strach, člověče. Pojď sem!
};

/*------------------------------------------------------------------------
//							Scorpio ist abgehauen //
------------------------------------------------------------------------*/
instance GRD_205_Scorpio_BANISHED(C_INFO)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_BANISHED_Condition;
	information = GRD_205_Scorpio_BANISHED_Info;
	important = 0;
	permanent = 0;
//	description = "You okay?"; 
//	description = "Alles klar bei dir?"; 
	description = "Jsi v pořádku?"; 
};

func int GRD_205_Scorpio_BANISHED_Condition()
{ 
	if (Npc_KnowsInfo(hero,GRD_205_Scorpio_HeyPC))
	{
		return TRUE;
	};

};
func void GRD_205_Scorpio_BANISHED_Info()
{
//	AI_Output(other,self,"GRD_205_Scorpio_BANISHED_Info_15_01"); //You okay?
//	AI_Output(other,self,"GRD_205_Scorpio_BANISHED_Info_15_01"); //Alles klar bei dir?
	AI_Output(other,self,"GRD_205_Scorpio_BANISHED_Info_15_01"); //Jsi v pořádku?
//	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_02"); //I'm hiding away here. I don't care for the trash those guards are pulling off.
//	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_02"); //Ich habe mich hier her verzogen. Für den Mist, den die Gardisten gerade abziehen, habe ich nichts übrig.
	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_02"); //Přesunul jsem se sem. S tím, co stráže na hradě provádí, nechci mít nic společného.
//	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_03"); //But I've taken some pretty good stuff from the arsenal. If you need a weapon, just let me know.
//	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_03"); //Aber ich habe mir ein paar gute Stücke aus der Waffenkammer mitgenommen. Wenn du eine Waffe brauchst, sag mir Bescheid.
	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_03"); //Ale vzal jsem s sebou pár pěkných kousků ze zbrojnice. Když budeš potřebovat nějakou zbraň, dej mi vědět.
	if (Scorpio_Exile == FALSE)
	{
	Log_CreateTopic(GE_TraderOW,LOG_NOTE);
//	B_LogEntry(GE_TraderOW,"Scorpio has left the Old Camp and is now staying with Cavalorn in the hunting hut between the Old and the New Camp.");
//	B_LogEntry(GE_TraderOW,"Scorpio hat aufgrund der Situation das Alte Lager verlassen und hält sich nun in der Jagdhütte bei Cavalorn zwischen dem Alten und dem Neuen Lager auf.");
	B_LogEntry(GE_TraderOW,"Scorpio se kvůli situaci ve Starém táboře přesunul do Cavalornovy lovecké chýše mezi Starým a Novým táborem.");
	Scorpio_Exile = TRUE;
	};
};  

/*------------------------------------------------------------------------
							TRADE 
------------------------------------------------------------------------*/

instance GRD_205_Scorpio_TRADE(C_INFO)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_TRADE_Condition;
	information = GRD_205_Scorpio_TRADE_Info;
	important = 0;
	permanent = 1;
//	description = "Show me what you have."; 
//	description = "Zeig mir deine Ware"; 
	description = "Ukaž, co máš."; 
	trade = 1;
};

func int GRD_205_Scorpio_TRADE_Condition()
{ 
	if(Npc_KnowsInfo(hero,GRD_205_Scorpio_BANISHED))
	{
		return TRUE;
	};

};
func void GRD_205_Scorpio_TRADE_Info()
{
//	AI_Output(other,self,"GRD_205_Scorpio_TRADE_Info_15_01"); //Show me what you have.
//	AI_Output(other,self,"GRD_205_Scorpio_TRADE_Info_15_01"); //Zeig mir deine Ware.
	AI_Output(other,self,"GRD_205_Scorpio_TRADE_Info_15_01"); //Ukaž, co máš.

};  
