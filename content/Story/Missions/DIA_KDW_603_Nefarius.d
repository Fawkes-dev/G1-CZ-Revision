// ****************************
//				EXIT
// ****************************

instance Info_Nefarius_EXIT(C_INFO)
{
	npc = KDW_603_Nefarius;
	nr = 999;
	condition = Info_Nefarius_EXIT_Condition;
	information = Info_Nefarius_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Nefarius_EXIT_Condition()
{
	return 1;
};

func void Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ****************************
//			Hallo
// ****************************

instance Info_Nefarius_Hallo(C_INFO)
{
	npc = KDW_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_Hallo_Condition;
	information = Info_Nefarius_Hallo_Info;
	important = 0;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};

func int Info_Nefarius_Hallo_Condition()
{
	return 1;
};

func void Info_Nefarius_Hallo_Info()
{
//	AI_Output(other,self,"Info_Nefarius_Hallo_15_00"); //Who are you?
//	AI_Output(other,self,"Info_Nefarius_Hallo_15_00"); //Wer bist du?
	AI_Output(other, self, "Info_Nefarius_Hallo_15_00"); //Kdo jsi?
//	AI_Output(self,other,"Info_Nefarius_Hallo_04_01"); //I am Nefarius. Magician of the Circle of Water.
//	AI_Output(self,other,"Info_Nefarius_Hallo_04_01"); //Ich bin Nefarius. Magier vom Kreis des Wassers.
	AI_Output(self, other, "Info_Nefarius_Hallo_04_01"); //Jsem Nefarius. Mág Kruhu vody.
};

// ****************************
//			Wo Saturas
// ****************************

instance Info_Nefarius_WoSaturas(C_INFO)
{
	npc = KDW_603_Nefarius;
	nr = 2;
	condition = Info_Nefarius_WoSaturas_Condition;
	information = Info_Nefarius_WoSaturas_Info;
	important = 0;
	permanent = 0;
//	description = "Where can I find Saturas?";
//	description = "Wo finde ich Saturas?";
	description = "Kde najdu Saturase?";
};

func int Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

func void Info_Nefarius_WoSaturas_Info()
{
//	AI_Output(other,self,"Info_Nefarius_WoSaturas_15_00"); //Where can I find Saturas?
//	AI_Output(other,self,"Info_Nefarius_WoSaturas_15_00"); //Wo finde ich Saturas?
	AI_Output(other, self, "Info_Nefarius_WoSaturas_15_00"); //Kde najdu Saturase?
//	AI_Output(self,other,"Info_Nefarius_WoSaturas_04_01"); //Go through the big round gate. You'll find him there.
//	AI_Output(self,other,"Info_Nefarius_WoSaturas_04_01"); //Geh durch das große runde Tor. Dort wirst du ihn finden.
	AI_Output(self, other, "Info_Nefarius_WoSaturas_04_01"); //Projdi tou velkou kulatou branou. Tam ho najdeš.
};

// ****************************
//			WannaMage
// ****************************

instance Info_Nefarius_WannaMage(C_INFO)
{
	npc = KDW_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_WannaMage_Condition;
	information = Info_Nefarius_WannaMage_Info;
	important = 0;
	permanent = 0;
//	description = "I'd like to become a Magician of the Circle of Water!";
//	description = "Ich will ein Magier vom Kreis des Wassers werden!";
	description = "Chtěl bych se stát mágem Kruhu vody.";
};

func int Info_Nefarius_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Nefarius_Hallo))
	{
		return 1;
	};

	return 0;
};

func void Info_Nefarius_WannaMage_Info()
{
//	AI_Output(other,self,"Info_Nefarius_WannaMage_15_00"); //I'd like to become a Magician of the Circle of Water!
//	AI_Output(other,self,"Info_Nefarius_WannaMage_15_00"); //Ich will ein Magier vom Kreis des Wassers werden!
	AI_Output(other, self, "Info_Nefarius_WannaMage_15_00"); //Chtěl bych se stát mágem Kruhu vody.
//	AI_Output(self,other,"Info_Nefarius_WannaMage_04_01"); //Not so fast, my boy!
//	AI_Output(self,other,"Info_Nefarius_WannaMage_04_01"); //(lacht) Nicht so schnell, mein Junge!
	AI_Output(self, other, "Info_Nefarius_WannaMage_04_01"); //(smích) Ne tak rychle, chlapče!
//	AI_Output(self,other,"Info_Nefarius_WannaMage_04_02"); //Before we let a young man join us, he needs to have done something great.
//	AI_Output(self,other,"Info_Nefarius_WannaMage_04_02"); //Bevor wir einen jungen Mann in unsere Reihen aufnehmen, muss er etwas Großes vollbracht haben.
	AI_Output(self, other, "Info_Nefarius_WannaMage_04_02"); //Než mezi sebe vezmeme nějakého mladíka, musí vykonat něco velkého.
//	AI_Output(self,other,"Info_Nefarius_WannaMage_04_03"); //And he must have served us for some time.
//	AI_Output(self,other,"Info_Nefarius_WannaMage_04_03"); //Und er muss uns eine Zeit lang gedient haben.
	AI_Output(self, other, "Info_Nefarius_WannaMage_04_03"); //A nějaký čas nám musí sloužit.
//	AI_Output(self,other,"Info_Nefarius_WannaMage_04_04"); //if you're really serious, you should join our mercenaries. There you can serve us.
//	AI_Output(self,other,"Info_Nefarius_WannaMage_04_04"); //Wenn es dir wirklich ernst ist, solltest du zu unseren Söldnern gehen. Dort kannst du uns dienen.
	AI_Output(self, other, "Info_Nefarius_WannaMage_04_04"); //Pokud to myslíš vážně, měl by ses přidat k žoldákům. U nich nám můžeš sloužit.
//	AI_Output(self,other,"Info_Nefarius_WannaMage_04_05"); //And maybe one day you'll be granted a chance to do something great.
//	AI_Output(self,other,"Info_Nefarius_WannaMage_04_05"); //Und vielleicht erhältst du eines Tages die Chance, etwas Großes zu vollbringen.
	AI_Output(self, other, "Info_Nefarius_WannaMage_04_05"); //A jednoho dne možná dostaneš možnost vykonat něco velkého.
};

// ****************************
//			NowReady
// ****************************

instance Info_Nefarius_NowReady(C_INFO)
{
	npc = KDW_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_NowReady_Condition;
	information = Info_Nefarius_NowReady_Info;
	important = 0;
	permanent = 1;
//	description = "Am I ready for the Circle of Water?";
//	description = "Bin ich bereit für den Kreis des Wassers?";
	description = "Jsem připraven na vstup do Kruhu vody?";
};

func int Info_Nefarius_NowReady_Condition()
{
	if ((!FMTaken)
	&& (Npc_KnowsInfo(hero, Info_Nefarius_WannaMage))
	&& (Npc_GetTrueGuild(hero) != GIL_KDW))
	{
		return 1;
	};

	return 0;
};

func void Info_Nefarius_NowReady_Info()
{
//	AI_Output(other,self,"Info_Nefarius_NowReady_15_00"); //Am I ready for the Circle of Water?
//	AI_Output(other,self,"Info_Nefarius_NowReady_15_00"); //Bin ich bereit für den Kreis des Wassers?
	AI_Output(other, self, "Info_Nefarius_NowReady_15_00"); //Jsem připraven na vstup do Kruhu vody?

	if (Npc_GetTrueGuild(hero) != GIL_SLD)
	{
//		AI_Output(self,other,"Info_Nefarius_NowReady_04_01"); //Become one of our mercenaries, then we'll see...
//		AI_Output(self,other,"Info_Nefarius_NowReady_04_01"); //Werde einer unserer Söldner, dann sehen wir weiter...
		AI_Output(self, other, "Info_Nefarius_NowReady_04_01"); //Staň se jedním z našich žoldáků, pak se uvidí...
	}
	else
	{
//		AI_Output(self,other,"Info_Nefarius_NowReady_04_02"); //I see, you've become one of our mercenaries. Very good, very good...
//		AI_Output(self,other,"Info_Nefarius_NowReady_04_02"); //Ich sehe, du bist einer unserer Söldner geworden. Sehr gut, sehr gut...
		AI_Output(self, other, "Info_Nefarius_NowReady_04_02"); //Vím, stal ses jedním z našich žoldáků. Velmi dobře, velmi dobře...
//		AI_Output(self,other,"Info_Nefarius_NowReady_04_03"); //Time will attend to the rest...
//		AI_Output(self,other,"Info_Nefarius_NowReady_04_03"); //Alles Weitere wird sich mit der Zeit zeigen...
		AI_Output(self, other, "Info_Nefarius_NowReady_04_03"); //Čas dokoná zbytek...
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 4 //////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// ****************************
//			OCNews
// ****************************

instance Info_Nefarius_OCNews(C_INFO)
{
	npc = KDW_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_OCNews_Condition;
	information = Info_Nefarius_OCNews_Info;
	important = 1;
	permanent = 0;
};

func int Info_Nefarius_OCNews_Condition()
{
	if ((FMTaken)
	&& (!FindXardas))
	{
		return 1;
	};

	return 0;
};

func void Info_Nefarius_OCNews_Info()
{
//	AI_Output(self,other,"Info_Nefarius_OCNews_04_00"); //Is there any news of our friends in the Old Camp?
//	AI_Output(self,other,"Info_Nefarius_OCNews_04_00"); //Was gibt es Neues von unseren Freunden aus dem alten Lager?
	AI_Output(self, other, "Info_Nefarius_OCNews_04_00"); //Jsou nějaké noviny u našich přátel ze Starého tábora?
//	AI_Output(other,self,"Info_Nefarius_OCNews_15_01"); //Gomez has had all the Magicians of Fire killed!
//	AI_Output(other,self,"Info_Nefarius_OCNews_15_01"); //Gomez hat alle Feuermagier töten lassen!
	AI_Output(other, self, "Info_Nefarius_OCNews_15_01"); //Gomez zabil všechny mágy Ohně!
//	AI_Output(self,other,"Info_Nefarius_OCNews_04_02"); //No! The cretin! I warned Corristo - he was never to be trusted! You must tell Saturas about it!
//	AI_Output(self,other,"Info_Nefarius_OCNews_04_02"); //Nein! Dieser Hund! Ich hatte Corristo gewarnt - ihm war noch nie zu trauen! Du mußt Saturas davon berichten!
	AI_Output(self, other, "Info_Nefarius_OCNews_04_02"); //Ne! Ten grázl! Varoval jsem Corrista - nikdy se mu nedalo věřit! Musíš o tom říci Saturasovi!
	if (Npc_GetTrueGuild(hero) == GIL_SLD)
	{
//		AI_Output(self,other,"Info_Nefarius_OCNews_04_03"); //Wait!
//		AI_Output(self,other,"Info_Nefarius_OCNews_04_03"); //Warte!
		AI_Output(self, other, "Info_Nefarius_OCNews_04_03"); //Počkej!
//		AI_Output(self,other,"Info_Nefarius_OCNews_04_04"); //You have braved great dangers on our behalf.
//		AI_Output(self,other,"Info_Nefarius_OCNews_04_04"); //Du hast große Gefahren auf dich genommen, um uns zu dienen.
		AI_Output(self, other, "Info_Nefarius_OCNews_04_04"); //Čelil jsi za nás velkému nebezpečí.
//		AI_Output(self,other,"Info_Nefarius_OCNews_04_05"); //I think you are now ready to wear the robe of a Magician of Water.
//		AI_Output(self,other,"Info_Nefarius_OCNews_04_05"); //Ich denke, du bist jetzt bereit, die Robe eines Wassermagiers zu tragen.
		AI_Output(self, other, "Info_Nefarius_OCNews_04_05"); //Myslím, že jsi už hoden obléknout roucho mága Vody.
//		AI_Output(self,other,"Info_Nefarius_OCNews_04_06"); //But now speak to Saturas! Hurry!
//		AI_Output(self,other,"Info_Nefarius_OCNews_04_06"); //Aber nun sprich mit Saturas! Beeile dich!
		AI_Output(self, other, "Info_Nefarius_OCNews_04_06"); //Teď ale promluv se Saturasem. Pospěš si!
	};

	AI_StopProcessInfos(self);
};
