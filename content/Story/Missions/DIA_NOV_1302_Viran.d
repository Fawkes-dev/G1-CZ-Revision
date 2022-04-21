// **************************************************
//						EXIT
// **************************************************

instance DIA_Viran_Exit(C_INFO)
{
	npc = Nov_1302_Viran;
	nr = 999;
	condition = DIA_Viran_Exit_Condition;
	information = DIA_Viran_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Viran_Exit_Condition()
{
	return 1;
};

func void DIA_Viran_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//				Was macht ihr hier?
// **************************************************

instance DIA_Viran_What(C_INFO)
{
	npc = Nov_1302_Viran;
	nr = 1;
	condition = DIA_Viran_What_Condition;
	information = DIA_Viran_What_Info;
	permanent = 0;
//	description = "What are you doing here?";
//	description = "Was macht ihr hier?";
	description = "Co tady děláš?";
};

func int DIA_Viran_What_Condition()
{
	return 1;
};

func void DIA_Viran_What_Info()
{
//	AI_Output(other,self,"DIA_Viran_What_15_00"); //What are you doing here?
//	AI_Output(other,self,"DIA_Viran_What_15_00"); //Was macht ihr hier?
	AI_Output(other,self,"DIA_Viran_What_15_00"); //Co tady děláte?
//	AI_Output(self,other,"DIA_Viran_What_07_01"); //We're picking the swampweed to be processed by our brothers, so it can be smoked later on.
//	AI_Output(self,other,"DIA_Viran_What_07_01"); //Wir sammeln das Sumpfkraut, das unsere Brüder dann zu Rauchwaren verarbeiten.
	AI_Output(self,other,"DIA_Viran_What_07_01"); //Sbíráme tady drogu z bažin, kterou zpracovávají naši bratři, aby jí bylo potom možné kouřit.
//	AI_Output(self,other,"DIA_Viran_What_07_02"); //It's quite dangerous to pick it in the swamp, but the stuff only grows here. Actually, that's a good thing.
//	AI_Output(self,other,"DIA_Viran_What_07_02"); //Es ist ziemlich gefährlich, im Sumpf zu sammeln, aber das Zeug wächst nun mal nur hier. Ist auch gut so.
	AI_Output(self,other,"DIA_Viran_What_07_02"); //Sběr v bažinách je velmi nebezpečný, ale ta droga neroste nikde jinde. A vlastně je to tak dobře.
//	AI_Output(other,self,"DIA_Viran_What_15_03"); //Why?
//	AI_Output(other,self,"DIA_Viran_What_15_03"); //Warum?
	AI_Output(other,self,"DIA_Viran_What_15_03"); //Proč?
//	AI_Output(self,other,"DIA_Viran_What_07_04"); //Because then the other two camps won't get it. We're the only ones in the colony who are able to pick swampweed.
//	AI_Output(self,other,"DIA_Viran_What_07_04"); //Weil dann die beiden anderen Lager nicht rankommen. Wir sind die Einzigen in der Kolonie, die Sumpfkraut ernten können.
	AI_Output(self,other,"DIA_Viran_What_07_04"); //Protože tak jí ostatní dva tábory nedostanou. Jsme jediní z kolonie, kdo může sbírat drogu z bažin.
//	AI_Output(self,other,"DIA_Viran_What_07_05"); //We can trade it with the other two camps - and WE can set the price.
//	AI_Output(self,other,"DIA_Viran_What_07_05"); //In den beiden anderen Lagern können wir es tauschen - und WIR bestimmen den Preis.
	AI_Output(self,other,"DIA_Viran_What_07_05"); //Můžeme s ní obchodovat s ostatníma dvěma tábory - MY si můžeme stanovit cenu.
};

// **************************************************
//				Kraut abholen
// **************************************************

instance DIA_Viran_FetchWeed(C_INFO)
{
	npc = Nov_1302_Viran;
	nr = 1;
	condition = DIA_Viran_FetchWeed_Condition;
	information = DIA_Viran_FetchWeed_Info;
	permanent = 0;
//	description = "Baal Orun sent me. I'm to take the whole harvest to Kalom.";
//	description = "Baal Orun schickt mich. Ich soll die gesamte Ernte zu Kalom bringen.";
	description = "Poslal mě Baal Orun. Mám předat celou sklizeň Kalomovi.";
};

func int DIA_Viran_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Viran_FetchWeed_Info()
{
//	AI_Output(other,self,"DIA_Viran_FetchWeed_15_00"); //Baal Orun sent me. I'm to take the whole harvest to Kalom.
//	AI_Output(other,self,"DIA_Viran_FetchWeed_15_00"); //Baal Orun schickt mich. Ich soll die gesamte Ernte zu Kalom bringen.
	AI_Output(other,self,"DIA_Viran_FetchWeed_15_00"); //Poslal mě Baal Orun. Mám předat celou sklizeň Kalomovi.
//	AI_Output(self,other,"DIA_Viran_FetchWeed_07_01"); //You think it's that easy, do you?
//	AI_Output(self,other,"DIA_Viran_FetchWeed_07_01"); //So einfach stellst du dir das vor, was?
	AI_Output(self,other,"DIA_Viran_FetchWeed_07_01"); //Představuješ si to dost jednouše, co?
//	AI_Output(self,other,"DIA_Viran_FetchWeed_07_02"); //Anybody could turn up like that. 'Baal Orun sent me' - and whoosh - the whole lot of the weeds were gone.
//	AI_Output(self,other,"DIA_Viran_FetchWeed_07_02"); //Da kann ja jeder kommen. 'Baal Orun schickt mich' - und schwupps - weg ist das ganze Kraut.
	AI_Output(self,other,"DIA_Viran_FetchWeed_07_02"); //To by mohl říci každý: 'poslal mě Baal Orun' - fííí - a celá sklizeň je tatam.

	Info_ClearChoices(DIA_Viran_FetchWeed);
//	Info_Addchoice (DIA_Viran_FetchWeed,"Go see him and ask him if you don't believe me!",DIA_Viran_FetchWeed_GotoHim);
//	Info_Addchoice (DIA_Viran_FetchWeed,"Geh doch zu ihm und frag ihn, wenn du mir nicht glaubst!",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice (DIA_Viran_FetchWeed,"Jdi za ním a zeptej se ho, když mi nevěříš!",DIA_Viran_FetchWeed_GotoHim);
//	Info_Addchoice (DIA_Viran_FetchWeed,"But Baal Orun really has sent me!",DIA_Viran_FetchWeed_Really);
//	Info_Addchoice (DIA_Viran_FetchWeed,"Baal Orun schickt mich aber wirklich!",DIA_Viran_FetchWeed_Really);
	Info_Addchoice (DIA_Viran_FetchWeed,"Ale Baal Orun mě skutečně poslal!",DIA_Viran_FetchWeed_Really);
};

func void DIA_Viran_FetchWeed_Really()
{
//	AI_Output(other,self,"DIA_Viran_FetchWeed_Really_15_00"); //But Baal Orun really has sent me!
//	AI_Output(other,self,"DIA_Viran_FetchWeed_Really_15_00"); //Baal Orun schickt mich aber wirklich!
	AI_Output(other,self,"DIA_Viran_FetchWeed_Really_15_00"); //Ale Baal Orun mě skutečně poslal!
//	AI_Output(self,other,"DIA_Viran_FetchWeed_Really_07_01"); //Sure.
//	AI_Output(self,other,"DIA_Viran_FetchWeed_Really_07_01"); //Natürlich.
	AI_Output(self,other,"DIA_Viran_FetchWeed_Really_07_01"); //Jistě.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
//	AI_Output(other,self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Go see him and ask him if you don't believe me!
//	AI_Output(other,self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Geh doch zu ihm und frag ihn, wenn du mir nicht glaubst!
	AI_Output(other,self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Jdi za ním a zeptej se ho, když mi nevěříš!
//	AI_Output(self,other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //I have a better idea. You prove your loyalty by doing a little job for us!
//	AI_Output(self,other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //Ich hab' 'ne bessere Idee. Du beweist mir deine Loyalität, indem du eine kleine Aufgabe für mich erledigst!
	AI_Output(self,other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //Mám lepší nápad. Dokaž svou oddanost tím, že pro nás uděláš malou službičku!
	Info_ClearChoices(DIA_Viran_FetchWeed);
};

// **************************************************
//				MISSION Bloodflies
// **************************************************
	var int Viran_Bloodflies;
// **************************************************

instance DIA_Viran_Bloodflies(C_INFO)
{
	npc = Nov_1302_Viran;
	nr = 1;
	condition = DIA_Viran_Bloodflies_Condition;
	information = DIA_Viran_Bloodflies_Info;
	permanent = 0;
//	description = "And what do you want me to do?";
//	description = "Und was soll ich machen?";
	description = "A co mám udělat?";
};

func int DIA_Viran_Bloodflies_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		return 1;
	};
};

func void DIA_Viran_Bloodflies_Info()
{
//	AI_Output(other,self,"DIA_Viran_Bloodflies_15_00"); //And what do you want me to do?
//	AI_Output(other,self,"DIA_Viran_Bloodflies_15_00"); //Und was soll ich machen?
	AI_Output(other,self,"DIA_Viran_Bloodflies_15_00"); //A co mám udělat?
//	AI_Output(self,other,"DIA_Viran_Bloodflies_07_01"); //It's really nothing. Work in the swamp, it's a bit risky, and then there's those damn bloodflies.
//	AI_Output(self,other,"DIA_Viran_Bloodflies_07_01"); //Ist nur 'ne Kleinigkeit. Die Arbeit im Sumpf ist nicht ganz ungefährlich, und die verdammten Blutfliegen tun ihr übriges dazu.
	AI_Output(self,other,"DIA_Viran_Bloodflies_07_01"); //Jenom maličkost. Práce v bažinách je trochu nebezpečná, a ještě ke všemu jsou tam ty proklaté krvavé mouchy.
//	AI_Output(self,other,"DIA_Viran_Bloodflies_07_02"); //Work would be much easier without them! Do you follow?
//	AI_Output(self,other,"DIA_Viran_Bloodflies_07_02"); //Ohne sie wäre das Arbeiten viel leichter! Wir verstehen uns?
	AI_Output(self,other,"DIA_Viran_Bloodflies_07_02"); //Práce by byla daleko snazší bez nich! Už chápeš?
	Viran_Bloodflies = LOG_RUNNING;

//	B_LogEntry(CH1_DeliverWeed,"Viran will only give me the swampweed once I've killed all the bloodflies within a radius of 20 paces.");
//	B_LogEntry(CH1_DeliverWeed,"Viran will mir seine Sumpfkrautlieferung erst geben, nachdem ich alle Blutfliegen in 20 Schritt Umkreis erlegt habe.");
	B_LogEntry(CH1_DeliverWeed,"Viran mi dal drogu z bažin, když jsem vyhladil všechny krvavé mouchy v okruhu 20 kroků.");
};

// **************************************************
//				Running / Success
// **************************************************
	var int Viran_BotenDay;
// **************************************************

instance DIA_Viran_Running(C_INFO)
{
	npc = Nov_1302_Viran;
	nr = 1;
	condition = DIA_Viran_Running_Condition;
	information = DIA_Viran_Running_Info;
	permanent = 1;
//	description = "I don't see any more bloodflies anywhere.";
//	description = "Ich seh weit und breit keine Blutfliegen mehr.";
	description = "Už tu žádné krvavé mouchy nevidím.";
};

func int DIA_Viran_Running_Condition()
{
	if (Viran_Bloodflies == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Viran_Running_Info()
{
//	AI_Output(other,self,"DIA_Viran_Running_15_00"); //I don't see any more bloodflies anywhere.
//	AI_Output(other,self,"DIA_Viran_Running_15_00"); //Ich seh' weit und breit keine Blutfliegen mehr.
	AI_Output(other,self,"DIA_Viran_Running_15_00"); //Už tu žádné krvavé mouchy nevidím.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self,other)<2000)) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unverändert (= hero)
	{
//		AI_Output(self,hero,"DIA_Viran_Running_07_00"); //But there are some more bugs within twenty paces!
//		AI_Output(self,hero,"DIA_Viran_Running_07_00"); //Da sind aber noch Viecher innerhalb von zwanzig Schritt!
		AI_Output(self,hero,"DIA_Viran_Running_07_00"); //Na každém dvanáctém kroku jsou ale další hovada!
//		AI_Output(self,hero,"DIA_Viran_Running_07_01"); //You won't get off that easily!
//		AI_Output(self,hero,"DIA_Viran_Running_07_01"); //So leicht kommst du mir nicht davon!
		AI_Output(self,hero,"DIA_Viran_Running_07_01"); //Ty se ti tak snadno odstranit nepodaří!
	}
	else
	{
//		AI_Output(self,hero,"DIA_Viran_Running_07_02"); //No more bugs to be seen. That was a good job you did!
//		AI_Output(self,hero,"DIA_Viran_Running_07_02"); //Weit und Breit keins von den Biestern mehr zu sehen. Das war ganze Arbeit!
		AI_Output(self,hero,"DIA_Viran_Running_07_02"); //Už tu nejsou žádné potvory. Odvedl jsi dobrou práci!
//		AI_Output(self,hero,"DIA_Viran_Running_07_03"); //Someone who works like that is either on our side or a complete idiot!
//		AI_Output(self,hero,"DIA_Viran_Running_07_03"); //Wer sich so abplagt, ist entweder auf unserer Seite oder ein kompletter Vollidiot!
		AI_Output(self,hero,"DIA_Viran_Running_07_03"); //Ten, kdo takhle pracuje, je buď na naší straně, nebo je úplný idiot!
//		AI_Output(self,hero,"DIA_Viran_Running_07_04"); //An idiot would be too stupid to fool me, right?
//		AI_Output(self,hero,"DIA_Viran_Running_07_04"); //Und ein Idiot wäre zu dumm, um mich aufs Kreuz zu legen, richtig?
		AI_Output(self,hero,"DIA_Viran_Running_07_04"); //Ale idiot by byl příliš hloupý, aby mě přelstil, nemám pravdu?
//		AI_Output(self,hero,"DIA_Viran_Running_07_05"); //Here, take the harvest and take it to Cor Kalom.
//		AI_Output(self,hero,"DIA_Viran_Running_07_05"); //Hier, nimm die Ernte und bring sie zu Cor Kalom.
		AI_Output(self,hero,"DIA_Viran_Running_07_05"); //Tak si vezmi tu sklizeň a předej ji Cor Kalomovi.
//		AI_Output(self,hero,"DIA_Viran_Running_07_06"); //If he complains and says it's not enough, tell him to move his butt here himself,to give him an idea of how much hard work it is.
//		AI_Output(self,hero,"DIA_Viran_Running_07_06"); //Falls er meckert, es sei zu wenig, sag ihm, er soll seinen Hintern hier selber hinbewegen, dann kann er mal sehen, wie viel Arbeit das ist.
		AI_Output(self,hero,"DIA_Viran_Running_07_06"); //Jestli si bude stěžovat, že jí není dost, vzkaž mu, ať pohne svým zadkem sem a já mu udělám představu o tom, jak těžká je to práce.

		B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01, 50);

		if Npc_KnowsInfo(hero,DIA_Balor_FetchWeed)
		{
//			B_LogEntry(CH1_DeliverWeed,"Viran gave me the second half of today's swampweed harvest. Let's see whether Cor Kalom is satisfied with the amount.");
//			B_LogEntry(CH1_DeliverWeed,"Viran gab mir die zweite Hälfte der heutigen Sumpfkrauternte. Mal sehen, ob Cor Kalom mit der Menge zufrieden ist.");
			B_LogEntry(CH1_DeliverWeed,"Viran mi předal druhou polovinu dnešní sklizně drogy z bažin. Uvidíme, jestli bude Cor Kalom s tímto množstvím spokojený.");
		}
		else
		{
//			B_LogEntry(CH1_DeliverWeed,"Viran gave me today's swampweed harvest. Doesn't look that much. Perhaps there's a second group of gatherers.");
//			B_LogEntry(CH1_DeliverWeed,"Viran übergab mir seine heutige Sumpfkrauternte. Sieht nach ziemlich wenig aus. Vielleicht gibt es noch eine zweite Sammlergruppe.");
			B_LogEntry(CH1_DeliverWeed,"Viran mi dal dnešní sklizeň drogy z bažin. Nevypadá to, že je jí dost. Snad je tu ještě druhá skupina sběračů.");
		};
		B_GiveXP(XP_WeedFromViran);

		Viran_Bloodflies = LOG_SUCCESS;
		Viran_BotenDay = Wld_GetDay();
	};
	AI_StopProcessInfos(self);
};

// **************************************************
//					PERMANENT
// **************************************************

instance DIA_Viran_Perm(C_INFO)
{
	npc = Nov_1302_Viran;
	nr = 1;
	condition = DIA_Viran_Perm_Condition;
	information = DIA_Viran_Perm_Info;
	permanent = 1;
//	description = "How's the picking going?";
//	description = "Wie steht's mit der Sammelei?";
	description = "Jak jde sklízení?";
};

func int DIA_Viran_Perm_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Viran_Perm_Info()
{
//	AI_Output(other,self,"DIA_Viran_Perm_15_00"); //How's the picking going?
//	AI_Output(other,self,"DIA_Viran_Perm_15_00"); //Wie steht's mit der Sammelei?
	AI_Output(other,self,"DIA_Viran_Perm_15_00"); //Jak jde sklízení?
//	AI_Output(self,other,"DIA_Viran_Perm_07_01"); //Yeah, yeah, just take make fun of me. I'm sure you're getting better jobs from the Gurus.
//	AI_Output(self,other,"DIA_Viran_Perm_07_01"); //Ja, ja, verarsch mich ruhig. Ich bin mir sicher, du bekommst bessere Aufgaben von den Gurus.
	AI_Output(self,other,"DIA_Viran_Perm_07_01"); //Jasně, jasně, teď jsi mě pobavil. Jsem přesvědčený, že jsi od Guru dostal něco lepšího na práci.
//	AI_Output(self,other,"DIA_Viran_Perm_07_02"); //Well, at least I don't need to do the dirty work myself. The 'infantry' do that - he, he, he.
//	AI_Output(self,other,"DIA_Viran_Perm_07_02"); //Na, immerhin muss ich mich nicht selbst bücken. Das übernimmt das Fußvolk - hee, hee, hee.
	AI_Output(self,other,"DIA_Viran_Perm_07_02"); //Jistě, aspoň tu špinavou práci nebudu muset dělat sám. Od toho je 'pěchota' - hehehe!
};

// **************************************************
//					Verarschen
// **************************************************

instance DIA_Viran_RipOff(C_INFO)
{
	npc = Nov_1302_Viran;
	nr = 5;
	condition = DIA_Viran_RipOff_Condition;
	information = DIA_Viran_RipOff_Info;
	permanent = 0;
//	description = "I'm to take all the weeds to Cor Kalom again.";
//	description = "Ich soll nochmal alles Kraut zu Cor Kalom bringen.";
	description = "Jsem tu, abych pro Cora Kaloma znovu převzal celou sklizeň.";
};

func int DIA_Viran_RipOff_Condition()
{
	if ((Viran_BotenDay<=(Wld_GetDay()-2)) && (Viran_Bloodflies == LOG_SUCCESS)) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

func void DIA_Viran_RipOff_Info()
{
//	AI_Output(other,self,"DIA_Viran_RipOff_15_00"); //I'm to take all the weeds to Cor Kalom again.
//	AI_Output(other,self,"DIA_Viran_RipOff_15_00"); //Ich soll noch mal alles Kraut zu Cor Kalom bringen.
	AI_Output(other,self,"DIA_Viran_RipOff_15_00"); //Jsem tu, abych pro Cora Kaloma znovu převzal celou sklizeň.
//	AI_Output(self,other,"DIA_Viran_RipOff_07_01"); //Again?
//	AI_Output(self,other,"DIA_Viran_RipOff_07_01"); //Schon wieder?
	AI_Output(self,other,"DIA_Viran_RipOff_07_01"); //Znovu?
//	AI_Output(other,self,"DIA_Viran_RipOff_15_02"); //Now you're not going to tell me to kill all the swampsharks for you, are you? I really don't have that much time.
//	AI_Output(other,self,"DIA_Viran_RipOff_15_02"); //Jetzt erzähl mir bloß nicht, ich soll alle Sumpfhaie für dich umbringen - ich hab' wenig Zeit.
	AI_Output(other,self,"DIA_Viran_RipOff_15_02"); //Jen mi teď neříkej, že mám zabít všechny ty močálové žraloky! Opravdu nemám moc času.
//	AI_Output(self,other,"DIA_Viran_RipOff_07_03"); //Okay okay! Here, take the bloody weeds!
//	AI_Output(self,other,"DIA_Viran_RipOff_07_03"); //Ist ja schon gut! Hier, nimm das verdammte Kraut!
	AI_Output(self,other,"DIA_Viran_RipOff_07_03"); //Dobře, dobře! Tady je ta zatracená sklizeň!
	CreateInvItems(self,ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01, 50);
};

