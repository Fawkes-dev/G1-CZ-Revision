// ************************************************************
// 			  				   EXIT
// ************************************************************

instance DIA_BaalIsidro_EXIT(C_INFO)
{
	npc = Nov_1333_BaalIsidro;
	nr = 999;
	condition = DIA_BaalIsidro_EXIT_Condition;
	information = DIA_BaalIsidro_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_BaalIsidro_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalIsidro_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

instance DIA_BaalIsidro_Hello(C_INFO)
{
	npc = Nov_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_Hello_Condition;
	information = DIA_BaalIsidro_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "You don't look very happy.";
//	description = "Du siehst nicht sehr glücklich aus.";
	description = "Nevypadáš příliš spokojeně.";
};

func int DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

func void DIA_BaalIsidro_Hello_Info()
{
//	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_00"); //You don't look very happy.
//	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_00"); //Du siehst nicht sehr glücklich aus.
	AI_Output(other, self, "DIA_BaalIsidro_Hello_15_00"); //Nevypadáš moc šťastně.
//	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_01"); //I'm not!
//	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_01"); //Bin ich auch nicht!
	AI_Output(self, other, "DIA_BaalIsidro_Hello_03_01"); //Také nejsem!
//	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_02"); //I need to get rid of a whole pile of weed.
//	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_02"); //Ich muss noch 'nen ganzen Berg Kraut loswerden.
	AI_Output(self, other, "DIA_BaalIsidro_Hello_03_02"); //Potřebuju se zbavit celé hromady drogy.
//	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_03"); //You're here to sell goods from the Sect Camp?
//	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_03"); //Du bist hier um Waren aus dem Sektenlager zu verkaufen?
	AI_Output(other, self, "DIA_BaalIsidro_Hello_15_03"); //Ty tady máš prodávat zboží ze Sektovního tábora?
//	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_04"); //Yes. But I just can't be bothered.
//	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_04"); //Ja. Aber ich kann mich einfach nicht aufraffen.
	AI_Output(self, other, "DIA_BaalIsidro_Hello_03_04"); //Ano. Ale právě se nemůžu vzchopit.
};

// ************************************************************
// 					 	TRADE
// ************************************************************

instance DIA_BaalIsidro_TRADE(C_INFO)
{
	npc = Nov_1333_BaalIsidro;
	nr = 800;
	condition = DIA_BaalIsidro_TRADE_Condition;
	information = DIA_BaalIsidro_TRADE_Info;
	important = 0;
	permanent = 1;
	trade = 1;
//	description = "Show me what you have.";
//	description = "Zeig mir, was du hast.";
	description = "Ukaž, co máš.";
};

func int DIA_BaalIsidro_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};

	return 0;
};

func void DIA_BaalIsidro_TRADE_Info()
{
//	AI_Output(other,self,"DIA_BaalIsidro_TRADE_15_00"); //Show me what you have.
//	AI_Output(other,self,"DIA_BaalIsidro_TRADE_15_00"); //Zeig mir, was du hast.
	AI_Output(other, self, "DIA_BaalIsidro_TRADE_15_00"); //Ukaž, co máš.
//	AI_Output(self,other,"DIA_BaalIsidro_TRADE_03_01"); //Here...
//	AI_Output(self,other,"DIA_BaalIsidro_TRADE_03_01"); //Hier ...
	AI_Output(self, other, "DIA_BaalIsidro_TRADE_03_01"); //Tady...
};

// ************************************************************
// 					 Ich verkaufe für dich
// ************************************************************

instance DIA_BaalIsidro_GimmeKraut(C_INFO)
{
	npc = Nov_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_GimmeKraut_Condition;
	information = DIA_BaalIsidro_GimmeKraut_Info;
	important = 0;
	permanent = 0;
//	description = "I could sell the weed for you - for a consideration, of course.";
//	description = "Ich könnte das Kraut für dich verkaufen - gegen Beteiligung versteht sich.";
	description = "Mohl bych ti prodat drogu - samozřejmě po dohodě.";
};

func int DIA_BaalIsidro_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};

	return 0;
};

func void DIA_BaalIsidro_GimmeKraut_Info()
{
//	AI_Output(other,self,"DIA_BaalIsidro_GimmeKraut_15_00"); //I could sell the weed for you - for a consideration, of course.
//	AI_Output(other,self,"DIA_BaalIsidro_GimmeKraut_15_00"); //Ich könnte das Kraut für dich verkaufen - gegen Beteiligung versteht sich.
	AI_Output(other, self, "DIA_BaalIsidro_GimmeKraut_15_00"); //Mohl bych ti prodat drogu - samozřejmě po dohodě.
//	AI_Output(self,other,"DIA_BaalIsidro_GimmeKraut_03_01"); //Forget it - I'm not as drunk as all that. You'd just go running away with it.
//	AI_Output(self,other,"DIA_BaalIsidro_GimmeKraut_03_01"); //Vergiss es - so besoffen bin ich nun auch wieder nicht. Du brennst doch einfach damit durch.
	AI_Output(self, other, "DIA_BaalIsidro_GimmeKraut_03_01"); //Zapomeň na to - nejsem vůbec tak opilý. Měl by ses s tím ztratit.

	Log_CreateTopic(CH1_DealerJob, LOG_MISSION);
	Log_SetTopicStatus(CH1_DealerJob, LOG_RUNNING);
//	B_LogEntry(CH1_DealerJob,"The novice Baal Isidro hangs around at the bar at the lake and gets plastered. He should sell his share of weed stalks, but he doesn't manage to. Perhaps I could convince him to let me do it, but how should I do that?");
//	B_LogEntry(CH1_DealerJob,"Der Novize Baal Isidro hängt den ganzen Tag in der Kneipe auf dem See des Neuen Lagers herum und betrinkt sich sinnlos. Er muss seine Ladung Krautstengel verkaufen, kann sich aber nicht aufraffen. Vielleicht könnte ich ihn irgendwie dazu überreden, mir den Job zu geben, nur wie?");
	B_LogEntry(CH1_DealerJob, "Novic Baal Isidro se celý den motá v baru na jezeře a popíjí. Měl by prodávat svůj díl drogy, ale nedbá na to. Snad bych ho mohl přesvědčit, aby mě to nechal udělat. Jak ale na to?");
};

// ************************************************************
// 					Baal Kagan hat gepetzt
// ************************************************************

instance DIA_BaalIsidro_Problem(C_INFO)
{
	npc = Nov_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_Problem_Condition;
	information = DIA_BaalIsidro_Problem_Info;
	important = 0;
	permanent = 0;
//	description = "You have a problem. Baal Kagan will make sure you'll be replaced.";
//	description = "Du hast ein Problem. Baal Kagan will dafür sorgen, dass du ersetzt wirst.";
	description = "Něco ti povím - máš problém. Baal Kagan se postará, abys byl vyměněn.";
};

func int DIA_BaalIsidro_Problem_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};

	return 0;
};

func void DIA_BaalIsidro_Problem_Info()
{
//	AI_Output(other,self,"DIA_BaalIsidro_Problem_15_00"); //I'll tell you something - you have a problem. Baal Kagan will make sure you'll be replaced.
//	AI_Output(other,self,"DIA_BaalIsidro_Problem_15_00"); //Ich sag dir was - du hast ein Problem. Baal Kagan will dafür sorgen, dass du ersetzt wirst.
	AI_Output(other, self, "DIA_BaalIsidro_Problem_15_00"); //Něco ti povím - máš problém. Baal Kagan zajistí, že tě vymění.
//	AI_Output(self,other,"DIA_BaalIsidro_Problem_03_01"); //What? The Sleeper have mercy on me! I need to get rid of the stuff...
//	AI_Output(self,other,"DIA_BaalIsidro_Problem_03_01"); //Was? Beim großen Schläfer. Ich muss das Zeug loswerden ...
	AI_Output(self, other, "DIA_BaalIsidro_Problem_03_01"); //Cože? Spáč se mnou bude mít slitování! Potřebuju se toho zboží zbavit...

	if (BaalIsidro_GotDrink == FALSE)
	{
//		B_LogEntry(CH1_DealerJob,"Baal Isidro was obviously upset when I told him about the plan to substitute him. But it still wasn't enough for him to let me do it.");
//		B_LogEntry(CH1_DealerJob,"Baal Isidro war sichtlich erschüttert, als ich von den Plänen, ihn zu ersetzen, berichtete. Aber es hat nicht ganz gereicht, mir den Job zu übergeben.");
		B_LogEntry(CH1_DealerJob, "Baal Isidro byl očividně zmatený, když jsem mu nabídl, že ho nahradím. Nestačilo to však k tomu, aby mě to nechal udělat.");
	}
	else
	{
//		B_LogEntry(CH1_DealerJob,"Baal Kagan's plans to have the alcoholic Baal Isidro replaced finished him off. I think he'll accept my offer now!");
//		B_LogEntry(CH1_DealerJob,"Die Pläne Baal Kagans den trunksüchtigen Baal Isidro zu ersetzen, haben ihm den Rest gegeben. Ich glaube jetzt ist er reif für mein Angebot!");
		B_LogEntry(CH1_DealerJob, "Baal Kagan se chystá opilce Baala Isidra nahradit někým jiným. Myslím, že teď už moji nabídku přijme!");
	};
};

// ************************************************************
// 					 Trink noch einen
// ************************************************************
var int BaalIsidro_GotDrink;
// ************************************************************

instance DIA_BaalIsidro_Drink(C_INFO)
{
	npc = Nov_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_Drink_Condition;
	information = DIA_BaalIsidro_Drink_Info;
	important = 0;
	permanent = 1;
//	description = "Here you go - have another drink on me.";
//	description = "Hier - trink noch einen auf meine Rechnung.";
	description = "Tady - dej si na mě ještě jednu.";
};

func int DIA_BaalIsidro_Drink_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut))
	&& (BaalIsidro_GotDrink == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_BaalIsidro_Drink_Info()
{
//	AI_Output(other,self,"DIA_BaalIsidro_Drink_15_00"); //Here you go - have another drink on me.
//	AI_Output(other,self,"DIA_BaalIsidro_Drink_15_00"); //Hier - trink noch einen auf meine Rechnung.
	AI_Output(other, self, "DIA_BaalIsidro_Drink_15_00"); //Tady - dej si na mě ještě jednu.

	if ((Npc_HasItems(other, ItFoBooze) > 0) || (Npc_HasItems(other, ItFoBeer) > 0) || (Npc_HasItems(other, ItFoWine) > 0))
	{
//		AI_Output(self,other,"DIA_BaalIsidro_Drink_03_01"); //Thanks, man. I'll drink to your health!
//		AI_Output(self,other,"DIA_BaalIsidro_Drink_03_01"); //Danke, Mann. Ich trinke auf dein Wohl!
		AI_Output(self, other, "DIA_BaalIsidro_Drink_03_01"); //Díky, člověče. Připíjím na tvoje zdraví!

		//TODO: add option to choose which drink you offer to NPC
		if (Npc_HasItems(other, ItFoBooze))
		{
			B_GiveInvItems(other, self, ItFoBooze, 1);
			if (C_BodystateContains(self, BS_SIT))
			{
				AI_StandUp(self);
				AI_TurnToNpc(self, hero);
			};

			AI_UseItem(self, ItFoBooze);
		}
		else if (Npc_HasItems(other, ItFoBeer))
		{
			B_GiveInvItems(other, self, ItFoBeer, 1);
			if (C_BodystateContains(self, BS_SIT))
			{
				AI_StandUp(self);
				AI_TurnToNpc(self, hero);
			};

			AI_UseItem(self, ItFoBeer);
		}
		else if (Npc_HasItems(other, ItFoWine))
		{
			B_GiveInvItems(other, self, ItFoWine, 1);
			if (C_BodystateContains(self, BS_SIT))
			{
				AI_StandUp(self);
				AI_TurnToNpc(self, hero);
			};

			AI_UseItem(self, ItFoWine);
		};

		BaalIsidro_GotDrink = TRUE;

		if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Problem))
		{
//			B_LogEntry(CH1_DealerJob,"The last sip of my generous offer drowned the last bit of Baal Isidro's resistance. I think he'll accept my offer now.");
//			B_LogEntry(CH1_DealerJob,"Der letzte Schluck meiner spendablen Geste hat den letzten Widerstand Baal Isidro's weggespült. Ich glaube jetzt ist er für mein Angebot empfänglich.");
			B_LogEntry(CH1_DealerJob, "Poslední lok mé šlechetné nabídky zlomil zbývající špetku odporu Baala Isidra. Myslím, že teď už moji nabídku přijme!");
		}
		else
		{
//			B_LogEntry(CH1_DealerJob,"Baal Isidro happily accepted the drink but he still doesn't want to pass the weed sale on to me.");
//			B_LogEntry(CH1_DealerJob,"Baal Isidro nahm den ausgegebenen Tropfen dankbar entgegen, doch er scheint noch nicht soweit zu sein, mir den Krautverkauf übertragen zu wollen.");
			B_LogEntry(CH1_DealerJob, "Baal Isidro nadšeně přijal pití, ale ještě stále mi nechce svěřit prodej drogy.");
		};
	}
	else
	{
//		AI_Output(self,other,"DIA_BaalIsidro_NO_Drink_03_00"); //What? Where?
//		AI_Output(self,other,"DIA_BaalIsidro_NO_Drink_03_00"); //Was? Wo?
		AI_Output(self, other, "DIA_BaalIsidro_NO_Drink_03_00"); //Co? Kde?
	};
};

// ************************************************************
// 					 Übrleg's dir!
// ************************************************************
var int BaalIsidro_DealerJob;
// ************************************************************

instance DIA_BaalIsidro_ThinkAgain(C_INFO)
{
	npc = Nov_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_ThinkAgain_Condition;
	information = DIA_BaalIsidro_ThinkAgain_Info;
	important = 0;
	permanent = 1;
//	description = "Think about it - give me the weed and we'll share the profit.";
//	description = "Überleg's dir - Gib mir das Kraut und wir teilen den Gewinn.";
	description = "Přemýšlej o tom - dej mi drogu a o zisk se rozdělíme.";
};

func int DIA_BaalIsidro_ThinkAgain_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut))
	&& (BaalIsidro_DealerJob != LOG_RUNNING)
	&& (BaalIsidro_DealerJob != LOG_SUCCESS))
	{
		return 1;
	};

	return 0;
};

func void DIA_BaalIsidro_ThinkAgain_Info()
{
//	AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Think about it - give me the weed and we'll share the profit.
//	AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Überleg's dir - Gib mir das Kraut und wir teilen den Gewinn.
	AI_Output(other, self, "DIA_BaalIsidro_ThinkAgain_15_00"); //Přemýšlej o tom - dej mi drogu a o zisk se rozdělíme.

	if ((BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero, DIA_BaalIsidro_Problem))
	{
//		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_01"); //Oh man, I need to get rid of the stuff. You wouldn't try to make me look like a fool, would you?
//		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_01"); //Oh Mann, ich muss das Zeug loswerden. Du willst mich doch nicht über's Ohr hauen, oder?
		AI_Output(self, other, "DIA_BaalIsidro_ThinkAgain_03_01"); //Ach, člověče, potřebuju se toho zboží zbavit. Neměl bys na mě koukat jako na blázna, jo?
//		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_02"); //I give you my word.
//		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_02"); //Ich geb' dir mein Wort.
		AI_Output(other, self, "DIA_BaalIsidro_ThinkAgain_15_02"); //Dávám ti své slovo.
//		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Good, here's the stuff... You should get at least 400 ore for it. That would be 200 for each of us. I'll be waiting here. Come back as soon as you have the ore.
//		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Gut, hier ist das Zeug... Du müsstest mindestens 400 Erz dafür kriegen. Also 200 für jeden. Ich bin die ganze Zeit hier. Wenn du das Erz hast, komm zurück.
		AI_Output(self, other, "DIA_BaalIsidro_ThinkAgain_03_03"); //Dobře, tady je to zboží... Měl bys za něj dostat aspoň 400 nugetů. To znamená po 200 nugetů pro každého. Počkám tady. Přijď hned, jak budeš mít tu rudu.
//		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_04"); //Do you know who'll take bigger amounts here?
//		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_04"); //Weißt du, wer hier größere Mengen abnimmt?
		AI_Output(other, self, "DIA_BaalIsidro_ThinkAgain_15_04"); //Víš, kdo si vezme větší část?
//		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_05"); //if I knew that I would have gone myself.
//		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Wenn ich das wüsste, wär' ich selber losgegangen.
		AI_Output(self, other, "DIA_BaalIsidro_ThinkAgain_03_05"); //Pokud vím, já jsem s tím začal.
//		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_06"); //I feel much better now that I'm rid of the stuff.
//		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_06"); //Jetzt, wo ich das Zeug los bin, fühle ich mich schon viel besser.
		AI_Output(self, other, "DIA_BaalIsidro_ThinkAgain_03_06"); //Cítím se teď mnohem líp, když jsem se zbavil toho zboží.

		BaalIsidro_DealerJob = LOG_RUNNING;
//		B_LogEntry(CH1_DealerJob,"Baal Isidro gave me loads of weed stalks. if I sell them he'll give me half of the profit, which would be 200 ore.");
//		B_LogEntry(CH1_DealerJob,"Baal Isidro hat mir einen Haufen Krautstengel gegeben, die ich verhökern soll. Er will die Hälfte der Einnahmen also 200 Erz davon abhaben.");
		B_LogEntry(CH1_DealerJob, "Baal Isidro mi předal dávku lodyh drogy. Pokud všechnu drogu prodám, dá mi polovinu zisku, což činí 200 nugetů.");

		//Itemübergabe
		CreateInvItems(self, itmijoint_1, 40);
		B_GiveInvItems(self, other, itmijoint_1, 50); //Notwendig zur Textausgabe "50 Items übergeben", wird sofort ausgeglichen
		Npc_RemoveInvItems(self, itmijoint_2, 20);
		Npc_RemoveInvItems(self, itmijoint_3, 20);
		Npc_RemoveInvItems(other, itmijoint_1, 40);
		CreateInvItems(other, itmijoint_2, 20);
		CreateInvItems(other, itmijoint_3, 20);

		AI_StopProcessInfos(self);
	}
	else
	{
//		AI_Output(self,other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //No, man. I'll manage...
//		AI_Output(self,other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Nee, Mann. Ich schaff das schon noch ...
		AI_Output(self, other, "DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Ne, člověče. Mně se to podaří...
	};
};

// ************************************************************
// 					RUNNING / SUCCESS
// ************************************************************

instance DIA_BaalIsidro_RUNNING(C_INFO)
{
	npc = Nov_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_RUNNING_Condition;
	information = DIA_BaalIsidro_RUNNING_Info;
	important = 0;
	permanent = 0;
//	description = "I've sold the weed. Here's your 200 ore.";
//	description = "Ich hab' das Kraut verkauft. Hier sind deine 200 Erz.";
	description = "Prodal jsem tu drogu. Tady je tvých 200 nugetů.";
};

func int DIA_BaalIsidro_RUNNING_Condition()
{
	if (BaalIsidro_DealerJob == LOG_RUNNING)
	{
		return 1;
	};

	return 0;
};

func void DIA_BaalIsidro_RUNNING_Info()
{
//	AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_00"); //I've sold the weed.
//	AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_00"); //Ich hab' das Kraut verkauft.
	AI_Output(other, self, "DIA_BaalIsidro_RUNNING_15_00"); //Prodal jsem tu drogu.
//	AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_01"); //And my 200 ore?
//	AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_01"); //Meine 200?
	AI_Output(self, other, "DIA_BaalIsidro_RUNNING_03_01"); //A co mých 200 nugetů?

	if (Npc_HasItems(other, itminugget) >= 200)
	{
//		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_02"); //Here it is.
//		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_02"); //Hier sind sie.
		AI_Output(other, self, "DIA_BaalIsidro_RUNNING_15_02"); //Tady jsou.
//		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_03"); //Good... Now I don't give a damn about Baal Kagan any more.
//		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_03"); //Gut ... Jetzt kann mich Baal Kagan mal. (lacht dreckig)
		AI_Output(self, other, "DIA_BaalIsidro_RUNNING_03_03"); //Dobře... Teď už nikdy nebudu Baala Kagana proklínat. (drsný smích)
//		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_04"); //It was a good idea to do business with you.
//		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_04"); //War ne gute Idee, mit dir Geschäfte zu machen.
		AI_Output(self, other, "DIA_BaalIsidro_RUNNING_03_04"); //Obchodovat s tebou byl dobrý nápad.

		B_GiveInvItems(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;

		Log_SetTopicStatus(CH1_DealerJob, LOG_SUCCESS);
//		B_LogEntry(CH1_DealerJob,"Baal Isidro was relieved to get his 200 ore.");
//		B_LogEntry(CH1_DealerJob,"Baal Isidro war erleichtert seine 200 Erz zu bekommen.");
		B_LogEntry(CH1_DealerJob, "Baal Isidro se nemusel namáhat, aby dostal svých 200 nugetů.");
		B_GiveXP(XP_BaalIsidroPayShare);
	}
	else
	{
//		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //I don't have it on me.
//		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Hab ich nicht bei mir.
		AI_Output(other, self, "DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Nemám to u sebe.
//		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //Then get it!
//		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //Dann schaff sie ran!
		AI_Output(self, other, "DIA_BaalIsidro_RUNNING_NoOre_03_06"); //Tak si to obstarej!
		AI_StopProcessInfos(self);
	};
};
