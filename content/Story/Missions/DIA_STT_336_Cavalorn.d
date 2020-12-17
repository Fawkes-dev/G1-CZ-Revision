// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_Cavalorn_Exit(C_INFO)
{
	npc = STT_336_Cavalorn;
	nr = 999;
	condition = DIA_Cavalorn_Exit_Condition;
	information = DIA_Cavalorn_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Cavalorn_Exit_Condition()
{
	return 1;
};

func void DIA_Cavalorn_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 					Ich Jäger
// **************************************************

instance DIA_cavalorn_Hunter(C_INFO)
{
	npc = STT_336_cavalorn;
	nr = 2;
	condition = DIA_cavalorn_Hunter_Condition;
	information = DIA_cavalorn_Hunter_Info;
	permanent = 0;
//	description = "What are you doing out here?"; 
//	description = "Was machst du hier draußen?"; 
	description = "Co tady venku děláš?"; 
};

func int DIA_cavalorn_Hunter_Condition()
{ 
	return 1; 
};

func void DIA_cavalorn_Hunter_Info()
{
//	AI_Output(other,self,"DIA_cavalorn_Hunter_15_00"); //What are you doing out here?
//	AI_Output(other,self,"DIA_cavalorn_Hunter_15_00"); //Was machst du hier draußen?
	AI_Output(other,self,"DIA_cavalorn_Hunter_15_00"); //Co tady venku děláš
//	AI_Output(self,other,"DIA_cavalorn_Hunter_12_01"); //I'm a hunter - above all I hunt scavengers.
//	AI_Output(self,other,"DIA_cavalorn_Hunter_12_01"); //Ich bin Jäger - ich jage vor allem Scavenger.
	AI_Output(self,other,"DIA_cavalorn_Hunter_12_01"); //Jsem lovec - lovím především mrchožrouty.

};

// **************************************************
// 						Lehrer
// **************************************************

instance DIA_cavalorn_Lehrer(C_INFO)
{
	npc = STT_336_cavalorn;
	nr = 2;
	condition = DIA_cavalorn_Lehrer_Condition;
	information = DIA_cavalorn_Lehrer_Info;
	permanent = 1;
//	description = "Can you teach me something about hunting?"; 
//	description = "Kannst du mir was über die Jagd beibringen?"; 
	description = "Můžeš mě naučit něco o lovu?"; 
};

func int DIA_cavalorn_Lehrer_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_cavalorn_Hunter))
	{
		return 1; 
	};
};

func void DIA_cavalorn_Lehrer_Info()
{
	if (log_cavalorntrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
//		B_LogEntry(GE_TeacherOW,"Cavalorn's a hunter. He can teach me to SNEAK and to FIRE A BOW as well. He lives in a hut between the Old and the New Camp.");
//		B_LogEntry(GE_TeacherOW,"Cavalorn ist Jäger. Von ihm kann ich ausser SCHLEICHEN noch BOGENSCHIESSEN lernen. Er lebt in einer Hütte zwischen Altem und Neuem Lager.");
		B_LogEntry(GE_TeacherOW,"Cavalorn je lovec. Může mě naučit PLÍŽENÍ a také LUKOSTŘELBĚ. Žije v chatrči mezi Starým a Novým táborem.");
		log_cavalorntrain = TRUE;
	};
//	AI_Output(other,self,"DIA_cavalorn_Lehrer_15_00"); //Can you teach me something about hunting?
//	AI_Output(other,self,"DIA_cavalorn_Lehrer_15_00"); //Kannst du mir was über die Jagd beibringen?
	AI_Output(other,self,"DIA_cavalorn_Lehrer_15_00"); //Můžeš mě naučit něco o lovu?
//	AI_Output(self,other,"DIA_cavalorn_Lehrer_12_01"); //That depends - what do you want to know?
//	AI_Output(self,other,"DIA_cavalorn_Lehrer_12_01"); //Kommt drauf an - was willst du wissen?
	AI_Output(self,other,"DIA_cavalorn_Lehrer_12_01"); //To záleží - co chceš umět?

	Info_ClearChoices(DIA_cavalorn_Lehrer);
	Info_AddChoice(DIA_cavalorn_Lehrer,DIALOG_BACK ,DIA_cavalorn_Lehrer_BACK);

	if (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_2, LPCOST_TALENT_BOW_2,0),DIA_cavalorn_Lehrer_Bow_2);
	};

	if (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_1, LPCOST_TALENT_BOW_1,0),DIA_cavalorn_Lehrer_Bow);
	};

	if (Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnSneak, LPCOST_TALENT_SNEAK,0),DIA_cavalorn_Lehrer_Schleichen);
	};
};

func void DIA_cavalorn_Lehrer_BACK()
{
	Info_ClearChoices(DIA_cavalorn_Lehrer);
};

func void DIA_Cavalorn_Lehrer_Bow()
{
	if (B_GiveSkill(other,NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{ 
//		AI_Output(other,self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Can you teach me how to use my bow better?
//		AI_Output(other,self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Kannst du mir beibringen, besser mit dem Bogen umzugehen?
		AI_Output(other,self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Můžeš mě naučit, jak se zlepšit v zacházení s lukem?
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_01"); //For a beginner it's not hard to get better. It's a question of your posture.
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Für einen Anfänger ist es nicht schwierig, besser zu werden. Es ist eine Frage der Haltung.
		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Pro začátečníka není těžké se zlepšit. Je to otázka postoje.
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Place your feet well apart, hold both your arms on one level, hold your breath and - shoot!
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Die Füße schön weit auseinander, Arme auf eine Linie bringen, Luft anhalten und - Schuss!
		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Rozkroč nohy hodně od sebe, drž ruce ve stejné výšce, nadechni se - a vystřel!
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_03"); //If you hit certain parts of the body, you only need one shot. As a beginner, you've only got a very small chance of hitting these parts.
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_03"); //An bestimmten Stellen des Körpers reicht ein Schuss aus, um dein Ziel zu erlegen. Als Anfänger hast du nur eine kleine Chance, diese Stellen zu erwischen.
		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Pokud zasáhneš určité partie těla, stačí jediný výstřel. Jako začátečník máš jen nepatrnou naději tato místa zasáhnout.
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_04"); //But if you bear in mind what I've told you, you'll hit better next time.
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Aber wenn du meine Ratschläge beherzigst, wirst du beim nächsten Mal besser treffen.
		AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Pokud si vezmeš moje rady k srdci, budeš se už příště lépe ztrefovat.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other,NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{ 
//		AI_Output(other,self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //I wanna learn how to sneak around.
//		AI_Output(other,self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Ich will lernen, mich lautlos zu bewegen.
		AI_Output(other,self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Chci se naučit plížit.
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Good idea. That's most important if you want to enter huts to get at somebody from behind.
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Gute Entscheidung. Das ist vor allem wichtig, wenn du in Hütten eindringen willst oder dich von hinten an jemanden anschleichst.
		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Dobrý nápad. To je nejdůležitější věc, když se chceš k někomu nepozorovaně dostat zezadu, nebo se vloupat do něčí chatrče.
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //If you bend your knees when walking, you can see the floor better and you have better control over your body as well.
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Wenn du tief nach unten gehst, hast du den Boden besser im Blick und deinen Körper besser unter Kontrolle.
		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Při chůzi se musíš prohnout v kolenou, abys viděl lépe na zem a zároveň mohl lépe kontrolovat celé tělo.
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //But everybody will notice you in this posture, so make sure nobody sees you when you sneak around!
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Aber in dieser Haltung wirst du natürlich sofort bemerkt, also, lass dich von keinem hier beim Schleichen sehen!
		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Každý si samozřejmě tvého postoje všimne, a tak musíš dbát na to, aby tě nikdo při plížení neviděl.
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Keep in mind what I told you, and above all: Never get caught!
//		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Beachte das, was ich dir sage und vor allem: Lass dich nie erwischen!
		AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Pamatuj si, co jsem ti řekl, ale především - nenech se nikdy přistihnout!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other,NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{ 
//			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //You're a good hunter already. Now acquire the remaining knowledge.
//			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Du bist jetzt schon ein guter Jäger. Erfahre nun das letzte Wissen.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Už jsi dobrý lovec. Teď si osvojíš zbývající vědomosti.
//			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //To become a good marksman, you need to stop trying to be one.
//			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Um ein Meisterschütze zu werden, musst du aufhören, einer sein zu wollen.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Aby ses stal dobrým střelcem, musíš se o to přestat snažit.
//			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Discover the laws of the eye, tension, trajectory and target. Always watch out and be prepared at all times.
//			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Erkenne das Gesetz von Auge, Spannkraft, Flugbahn und Ziel. Sei immer auf der Hut, sei immer bereit.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Objev zákony zraku, napětí, dráhy a cíle. Vždy buď ve střehu a buď vždy připravený.
//			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //You've mastered the technique very well now. Now go and apply your knowledge and skill.
//			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Die Technik beherrscht du schon lange zur Genüge. Geh einfach hin und wende dein Wissen und Können an.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Teď už jsi velmi dobře zvládl techniku. Tak běž a využívej své znalosti a dovednoti.
	};
};
/*------------------------------------------------------------------------
						BOGEN KAUFEN 
------------------------------------------------------------------------*/

instance STT_336_cavalorn_SELLBOW(C_INFO)
{
	npc = STT_336_cavalorn;
	condition = STT_336_cavalorn_SELLBOW_Condition;
	information = STT_336_cavalorn_SELLBOW_Info;
	important = 0;
	permanent = 0;
//	description = "Where will I get a bow?"; 
//	description = "Woher bekomme ich einen Bogen?"; 
	description = "Kde dostanu luk?"; 
};

func int STT_336_cavalorn_SELLBOW_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_cavalorn_Hunter))
	{
		return TRUE;
	};

};
func void STT_336_cavalorn_SELLBOW_Info()
{
//	AI_Output(other,self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Where will I get a bow?
//	AI_Output(other,self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Woher bekomme ich einen Bogen?
	AI_Output(other,self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Kde dostanu luk?
//	AI_Output(self,other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Here. I sell the best bows in the Old Camp.
//	AI_Output(self,other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Von mir. Ich verkaufe die besten Bögen des Alten Lagers.
	AI_Output(self,other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Tady. Prodávám nejlepší luky ve Starém táboře.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
//	B_LogEntry(GE_TraderOC,"Cavalorn trades in BOWS and ARROWS. I'll find him on the path to the New Camp, in the canyon to the west of the Old Camp.");
//	B_LogEntry(GE_TraderOC,"Cavalorn handelt mit BÖGEN und PFEILEN. Er hält sich in der Schlucht westlich des Alten Lagers auf dem Weg ins Neue Lager auf.");
	B_LogEntry(GE_TraderOC,"Cavalorn obchoduje s LUKY a ŠÍPY. Najdu ho na cestě k Novému táboru, v kaňonu na západ od Starého tábora.");
};  

/*------------------------------------------------------------------------
						TRADE 
------------------------------------------------------------------------*/

instance STT_336_cavalorn_TRADE(C_INFO)
{
	npc = STT_336_cavalorn;
	condition = STT_336_cavalorn_TRADE_Condition;
	information = STT_336_cavalorn_TRADE_Info;
	important = 0;
	permanent = 1;
//	description = "Show me your goods."; 
//	description = "Zeig mir deine Ware"; 
	description = "Ukaž mi svoje zboží."; 
	trade = 1;
};

func int STT_336_cavalorn_TRADE_Condition()
{ 
	if (Npc_KnowsInfo(hero,STT_336_cavalorn_SELLBOW))
	{
		return TRUE;
	};

};
func void STT_336_cavalorn_TRADE_Info()
{
//	AI_Output(other,self,"STT_336_cavalorn_TRADE_Info_15_01"); //Show me your goods.
//	AI_Output(other,self,"STT_336_cavalorn_TRADE_Info_15_01"); //Zeig mir deine Ware.
	AI_Output(other,self,"STT_336_cavalorn_TRADE_Info_15_01"); //Ukaž mi svoje zboží.

};  

