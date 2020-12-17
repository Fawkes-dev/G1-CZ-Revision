instance Tpl_1438_Templer_Exit(C_INFO)
{
	npc = Tpl_1438_Templer;
	nr = 999;
	condition = Tpl_1438_Templer_Exit_Condition;
	information = Tpl_1438_Templer_Exit_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Tpl_1438_Templer_Exit_Condition()
{
	return 1;
};

func void Tpl_1438_Templer_Exit_Info()
{
//	AI_Output(other,self,"Tpl_1438_Templer_Exit_Info_15_01"); //See you later.
//	AI_Output(other,self,"Tpl_1438_Templer_Exit_Info_15_01"); //Bis dann.
	AI_Output(other,self,"Tpl_1438_Templer_Exit_Info_15_01"); //Ještě se uvidíme!
//	AI_Output(self,other,"Tpl_1438_Templer_Exit_Info_13_02"); //May the Sleeper awaken!
//	AI_Output(self,other,"Tpl_1438_Templer_Exit_Info_13_02"); //Möge der Schläfer erwachen!
	AI_Output(self,other,"Tpl_1438_Templer_Exit_Info_13_02"); //Kéž Spáč procitne!

	AI_StopProcessInfos(self);
};
// ***************** GELABER *****************************

instance Tpl_1438_Templer_INFO(C_INFO)
{
	npc = Tpl_1438_Templer;
	condition = Tpl_1438_Templer_INFO_Condition;
	information = Tpl_1438_Templer_INFO_Info;
	important = 0;
	permanent = 0;
//	description = "What are you templars doing in the mine?"; 
//	description = "Was macht ihr Templer hier in der Mine?"; 
	description = "Co dělají templáři v dole?"; 
};

func int Tpl_1438_Templer_INFO_Condition()
{ 
	if (  CorKalom_BringMCQBalls != LOG_RUNNING ) 
	{
		return TRUE;
	};

};

func void Tpl_1438_Templer_INFO_Info()
{
//	AI_Output(other,self,"Tpl_1438_Templer_INFO_Info_15_01"); //What are you templars doing in the mine?
//	AI_Output(other,self,"Tpl_1438_Templer_INFO_Info_15_01"); //Was macht ihr Templer hier in der Mine?
	AI_Output(other,self,"Tpl_1438_Templer_INFO_Info_15_01"); //Co dělají templáři v dolu?
//	AI_Output(self,other,"Tpl_1438_Templer_INFO_Info_13_02"); //We're hunting for minecrawlers. Go back to the Camp, you'll be safe there.
//	AI_Output(self,other,"Tpl_1438_Templer_INFO_Info_13_02"); //Wir jagen die Minecrawler. Geh lieber zurück ins Lager, da bist du sicher.
	AI_Output(self,other,"Tpl_1438_Templer_INFO_Info_13_02"); //Lovíme tady důlní červy. Jdi zpátky do tábora, tam budeš v bezpečí.
}; 

// ***************** SEKRET *****************************

instance Tpl_1438_Templer_WHY(C_INFO)
{
	npc = Tpl_1438_Templer;
	condition = Tpl_1438_Templer_WHY_Condition;
	information = Tpl_1438_Templer_WHY_Info;
	important = 0;
	permanent = 0;
//	description = "Why do you hunt the crawlers?"; 
//	description = "Warum jagt ihr die Crawler?"; 
	description = "Proč lovíte důlní červy?"; 
};

func int Tpl_1438_Templer_WHY_Condition()
{ 
	if (Npc_KnowsInfo(hero,Tpl_1438_Templer_INFO )) 
	{
		return 1;
	};

};
func void Tpl_1438_Templer_WHY_Info()
{
//	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_01"); //Why do you hunt the crawlers?
//	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_01"); //Warum jagt ihr die Crawler?
	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_01"); //Proč lovíte důlní červy?
//	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_02"); //For their mandibles. They contain a valuable secretion.
//	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_02"); //Wegen ihren Zangen. Sie enthalten ein wertvolles Sekret.
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_02"); //Pro jejich čelisti. Obsahují cenný výměšek.
//	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_03"); //What kind of secretion?
//	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_03"); //Was für ein Sekret?
	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_03"); //Jaký druh výměšku?
//	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_04"); //A poison. Only our Guru Cor Kalom knows how to brew potions with it.
//	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_04"); //Ein Gift. Nur unser Guru Cor Kalom weiß, wie man daraus Tränke brauen kann.
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_04"); //Jed. Jedině náš Guru Cor Kalom ví, jak z něj připravit lektvar.
};
// ***************** KALOM *****************************

instance Tpl_1438_Templer_KALOM(C_INFO)
{
	npc = Tpl_1438_Templer;
	condition = Tpl_1438_Templer_KALOM_Condition;
	information = Tpl_1438_Templer_KALOM_Info;
	important = 0;
	permanent = 0;
//	description = "Who is Cor Kalom?"; 
//	description = "Wer ist Cor Kalom?"; 
	description = "Kdo je Cor Kalom?"; 
};

func int Tpl_1438_Templer_KALOM_Condition()
{ 
	if (Npc_KnowsInfo(hero,Tpl_1438_Templer_WHY )) 
	{
		return 1;
	};

};

func void Tpl_1438_Templer_KALOM_Info()
{
//	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_01"); //Who is Cor Kalom?
//	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_01"); //Wer ist Cor Kalom?
	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_01"); //Kdo je Cor Kalom?
//	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_02"); //One of the most powerful men in the whole Brotherhood. He knows many secrets, he can control other people's thoughts!
//	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_02"); //Er ist einer der mächtigsten Männer in der Bruderschaft. Er kennt viele Geheimnisse und kann die Gedanken anderer kontrollieren!
	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_02"); //Je to jeden z nejmocnějších mužů celého Bratrstva. Zná mnohá tajemství a dokáže ovládat mysl jiných lidí!
//	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Apart from that, he's an alchemist. He brews potions so we can make spiritual contact with the Sleeper. Just go down to the Camp. We're always looking for people!
//	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Zudem ist er der Alchemist. Er braut Tränke, damit wir geistigen Kontakt zum Schläfer herstellen können. Geh doch einfach mal ins Lager. Wir suchen immer gute Leute!
	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Kromě toho je alchymista. Připravuje lektvary, díky kterým můžeme navazovat duchovní spojení se Spáčem. Jdi do tábora. Pořád hledáme nějaké schopné lidi!
//	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_04"); //I'll think about it.
//	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Ich werde mal darüber nachdenken.
	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Budu o tom přemýšlet.
};  
//---------------------WENN DIE EIERSUCHE LÄUFT-------------------------------  
instance Tpl_1438_Templer_EGGSEARCH(C_INFO)
{
	npc = Tpl_1438_Templer;
	condition = Tpl_1438_Templer_EGGSEARCH_Condition;
	information = Tpl_1438_Templer_EGGSEARCH_Info;
	important = 0;
	permanent = 0;
//	description = "I'm looking for the nest of the crawlers."; 
//	description = "Ich bin auf der Suche nach dem Crawlernest"; 
	description = "Hledám hnízdo důlních červů."; 
};

func int Tpl_1438_Templer_EGGSEARCH_Condition()
{ 
	if (CorKalom_BringMCQBalls == LOG_RUNNING )
	{
		return TRUE;
	};

};
func void Tpl_1438_Templer_EGGSEARCH_Info()
{
//	AI_Output(other,self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //I'm looking for the nest of the crawlers.
//	AI_Output(other,self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Ich bin auf der Suche nach dem Crawlernest.
	AI_Output(other,self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Hledám hnízdo důlních červů.
//	AI_Output(self,other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Go and see Gor Na Vid, Gor Na Kosh or Gor Na Bar. They know more about the crawlers than I do.
//	AI_Output(self,other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Wende dich an Gor Na Vid, Gor Na Kosh oder Gor Na Bar. Die kennen sich da unten bei den Crawlern besser aus als ich.
	AI_Output(self,other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Jdi za Gor Na Videm, Gor Na Koshem nebo Gor Na Barem. Ti vědí o důlních červech mnohem více než já.

//	B_LogEntry(CH2_MCEggs,"At the entrance to the Old Mine, I asked a templar for the minecrawlers' nest. He referred me to three other templars - Gor Na Vid, Gor Na Kosh and Gor Na Bar. These names they have in the Brotherhood are driving me crazy.");  
//	B_LogEntry(CH2_MCEggs,"Ich fragte einen Templer am Eingang der Alten Mine nach dem Nest der Minecrawler. Er verwies mich an drei andere Templer mit Namen Gor Na Vid, Gor Na Kosh und Gor Na Bar. Diese Namen der Bruderschaft bringen mich noch um den Verstand.");  
	B_LogEntry(CH2_MCEggs,"U vchodu do Starého dolu jsem se zeptal jednoho templáře na hnízdo důlních červů. Odkázal mě na tři další templáře - Gor Na Vida, Gor Na Koshe a Gor Na Bara. Tahle jména, která používají v Bratrstvu, mě přivádějí k šílenství.");  
};  
/*------------------------------------------------------------------------
//							ZANGEN FREISCHALTEN     //
------------------------------------------------------------------------*/

instance Tpl_1438_Templer_ZANGEN(C_INFO)
{
	npc = Tpl_1438_Templer;
	condition = Tpl_1438_Templer_ZANGEN_Condition;
	information = Tpl_1438_Templer_ZANGEN_Info;
	important = 0;
	permanent = 0;
//	description = "How can I remove the mandibles from the minecrawlers?"; 
//	description = "Wie kann ich den Minecrawlern die Zangen entfernen?"; 
	description = "Jak oddělím důlnímu červovi čelisti?"; 
};

func int Tpl_1438_Templer_ZANGEN_Condition()
{ 
	if (Npc_KnowsInfo(hero,Tpl_1438_Templer_WHY) || (CorKalom_BringMCQBalls == LOG_RUNNING))
	&& (Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
func void Tpl_1438_Templer_ZANGEN_Info()
{
//	AI_Output(other,self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //How can I remove the mandibles from the minecrawlers?
//	AI_Output(other,self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Wie kann ich den Minecrawlern die Zangen entfernen?
	AI_Output(other,self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Jak oddělím důlnímu červovi čelisti?
//	AI_Output(self,other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //It's not that easy to do that. I can teach you.
//	AI_Output(self,other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //Das ist ein Vorgang, der nicht so einfach ist. Ich kann dir das beibringen.
	AI_Output(self,other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //Není to tak snadné. Mohu tě to naučit.
}; 
/*------------------------------------------------------------------------
//							LERNEN ZANGEN ZU ENTFERNEN //
------------------------------------------------------------------------*/

instance Tpl_1438_Templer_TEACHZANGEN(C_INFO)
{
	npc = Tpl_1438_Templer;
	condition = Tpl_1438_Templer_TEACHZANGEN_Condition;
	information = Tpl_1438_Templer_TEACHZANGEN_Info;
	important = 0;
	permanent = 1;
//	description = "Learn to cut out mandibles (1 skill point)"; 
//	description = "Zangen rausschneiden lernen (1 Lernpunkt)"; 
	description = "Vyříznout čelisti důlních červů (1 dovednostní bod)"; 
};

func int Tpl_1438_Templer_TEACHZANGEN_Condition()
{ 
	if (Npc_KnowsInfo(hero,Tpl_1438_Templer_ZANGEN))
	&& (Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
func void Tpl_1438_Templer_TEACHZANGEN_Info()
{

//	AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Can you teach me how to remove the mandibles?
//	AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Kannst du mir das Zangen rausschneiden beibringen?
	AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Můžeš mě naučit, jak vyříznout čelisti?

	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
//		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //First you need to cut deep into the flesh. Be careful not to hit the mandible gland. If you do, the secretion will squirt out.
//		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Du musst erst einen tiefen Schnitt in das Fleisch machen. Sei vorsichtig, dass du nicht die Zangendrüse erwischst. Triffst du sie, spritzt das Sekret raus.
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Nejdřív musíš udělat hluboký zářez do masa. Buď opatrný, abys neporušil čelistní žlázu. Pokud to uděláš, výměšek vystříkne ven.
//		AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //That must be quite painful.
//		AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //Das ist bestimmt ziemlich schmerzhaft.
		AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //To je určitě dost bolestivé.
//		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //You bet! Did you ever meet Korgur Three-Fingers, the crawler hunter? Oh no, that was before you arrived. Well, let's go on...
//		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //Und wie! Hast du eigentlich noch Drei-Finger-Korgur, den Crawlerjäger, kennengelernt? Ach nein, das war vor deiner Zeit. Nun, also weiter...
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //A jak! Znáš Korgura Tříprsťáka, lovce důlních červů? Ale ne, to bylo před tím, než jsi přišel. Dobrá, pokračujme...
//		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Cut around the glands, leaving a wide gap, and then remove the flesh together with the mandible. If you stick to that, you won't have any problems removing the mandibles.
//		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Schneide großflächig um die Drüsen herum und entferne dann das Fleisch zusammen mit der Zange. Wenn du dich daran hältst, wirst du keine Probleme mit dem Rausschneiden der Zangen haben.
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Veď řez kolem žlázy a vyjmi maso společně s čelistí. Pokud se budeš držet tohoto postupu, nebudeš mít problém s vyříznutím čelistí.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
//		B_LogEntry(GE_AnimalTrophies,"How to remove mandibles - minecrawlers");
//		B_LogEntry(GE_AnimalTrophies,"Wissen über Zangen rausschneiden - Minecrawler");
		B_LogEntry(GE_AnimalTrophies,"Jak vyříznout čelisti - důlní červi");
		Tpl_1438_Templer_TEACHZANGEN.permanent = 0;
//		PrintScreen("Learn: Cutting out minecrawlers' mandibles", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//		PrintScreen("Lerne: Minecrawlerzangen rausschneiden", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		PrintScreen("Naučil ses: Vyříznutí čelistí důlních červů", -1,-1,"FONT_OLD_20_WHITE.TGA",2); 
	}
	else 
	{
//		PrintScreen("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
//		PrintScreen("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		PrintScreen("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say (self,other,"$NOLEARNNOPOINTS");
	};
};   
