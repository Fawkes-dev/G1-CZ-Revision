// **************************************************
//						EXIT
// **************************************************

instance DIA_Balor_Exit(C_INFO)
{
	npc = Nov_1304_Balor;
	nr = 999;
	condition = DIA_Viran_Exit_Condition;
	information = DIA_Viran_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Balor_Exit_Condition()
{
	return 1;
};

func void DIA_Balor_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//				Kraut abholen
// **************************************************
	var int Balor_BotenDay;
// **************************************************

instance DIA_Balor_FetchWeed(C_INFO)
{
	npc = Nov_1304_Balor;
	nr = 1;
	condition = DIA_Balor_FetchWeed_Condition;
	information = DIA_Balor_FetchWeed_Info;
	important = 0;
	permanent = 0;
//	description = "Baal Orun sent me. I'm to collect all the swampweed.";
//	description = "Baal Orun schickt mich. Ich soll hier alles Sumpfkraut abholen.";
	description = "Poslal mě Baal Orun. Mám převzít celou sklizeň drogy z bažin.";
};

func int DIA_Balor_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Balor_FetchWeed_Info()
{
//	AI_Output(other,self,"DIA_Balor_FetchWeed_15_00"); //Baal Orun sent me. I'm to collect all the swampweed.
//	AI_Output(other,self,"DIA_Balor_FetchWeed_15_00"); //Baal Orun schickt mich. Ich soll hier alles Sumpfkraut abholen.
	AI_Output(other,self,"DIA_Balor_FetchWeed_15_00"); //Poslal mě Baal Orun. Mám převzít celou sklizeň drogy z bažin.
//	AI_Output(self,other,"DIA_Balor_FetchWeed_01_01"); //Good. Then I don't need to go myself. Here, take it.
//	AI_Output(self,other,"DIA_Balor_FetchWeed_01_01"); //Gut. Dann muss ich nicht selber laufen. Hier, nimm.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_01"); //Dobře. Pak tam nemusím chodit sám. Tady je.
//	AI_Output(self,other,"DIA_Balor_FetchWeed_01_02"); //Don't forget to go to Viran on the other side of the swamp, if you haven't been there yet.
//	AI_Output(self,other,"DIA_Balor_FetchWeed_01_02"); //Vergiss nicht, zu Viran auf der anderen Seite vom Sumpf zu gehen, wenn du nicht schon da warst.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_02"); //Nezapomeň zajít za Viranem na druhou stranu bažin, pokud jsi tam ještě nebyl.
//	AI_Output(self,other,"DIA_Balor_FetchWeed_01_03"); //Otherwise your load might be a bit small and people might think you'd sold the other half of it, hee, hee.
//	AI_Output(self,other,"DIA_Balor_FetchWeed_01_03"); //Sonst könnte deine Lieferung ein bisschen mickrig ausfallen, und alle würden denken, du hast die Hälfte verhökert, hee, hee.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_03"); //Jinak by tvůj náklad mohl být příliš malý a lidé by si mohli pomyslet, že jsi druhou půlku rozprodal, haha.

	B_GiveInvItems(self,other,ItMi_Plants_Swampherb_01, 50);

//	B_LogEntry(CH1_DeliverWeed,"Balor gave me today's swampweed harvest for Cor Kalom.");
//	B_LogEntry(CH1_DeliverWeed,"Balor übergab mir seine heutige Sumpfkrauternte für Cor Kalom.");
	B_LogEntry(CH1_DeliverWeed,"Balor mi dal dnešní sklizeň drogy z bažin pro Cora Kaloma.");
	B_GiveXP(XP_WeedFromBalor);

	if !Npc_KnowsInfo(hero,DIA_Viran_What)
	&& !Npc_KnowsInfo(hero,DIA_Viran_FetchWeed)
	{
//		 B_LogEntry(CH1_DeliverWeed,"According to Balor, there's a second group of gatherers who are working on the other side of the swamp. Since I wasn't allowed to ask Baal Orun any questions, I have to search the swamp for the second group, whether I like it or not.");
//		 B_LogEntry(CH1_DeliverWeed,"Laut Balor scheint es noch eine zweite Sammlergruppe zu geben, die auf der anderen Seite des Sumpfes arbeiten. Da ich Baal Orun keine Fragen stellen durfte, muss ich jetzt wohl oder übel diesen verdammten Sumpf nach der anderen Gruppe absuchen.");
		 B_LogEntry(CH1_DeliverWeed,"Podle Balora pracuje druhá skupina sběračů na druhé straně bažin. Protože nesmím klást Baalu Orunovi žádné otázky, musím prohledat bažiny, zda tam druhá skupina sběračů doopravdy je.");
	};

	Balor_BotenDay = Wld_GetDay();
};

// **************************************************
//				Wem verhökern?
// **************************************************
	var int Balor_PlayerCheating;
// **************************************************

instance DIA_Balor_SellUnder(C_INFO)
{
	npc = Nov_1304_Balor;
	nr = 1;
	condition = DIA_Balor_SellUnder_Condition;
	information = DIA_Balor_SellUnder_Info;
	important = 0;
	permanent = 0;
//	description = "Who could I sell the weeds to anyway?";
//	description = "Wem sollte ich das Kraut denn schon verhökern?";
	description = "Komu jinému bych mohl tu drogu prodat?";
};

func int DIA_Balor_SellUnder_Condition()
{
	if Npc_KnowsInfo(hero,DIA_Balor_FetchWeed)
	{
		return 1;
	};
};

func void DIA_Balor_SellUnder_Info()
{
//	AI_Output(other,self,"DIA_Balor_SellUnder_15_00"); //Who could I sell the weeds to anyway?
//	AI_Output(other,self,"DIA_Balor_SellUnder_15_00"); //Wem sollte ich das Kraut denn schon verhökern?
	AI_Output(other,self,"DIA_Balor_SellUnder_15_00"); //Komu jinému bych mohl tu drogu prodat?
//	AI_Output(self,other,"DIA_Balor_SellUnder_01_01"); //Oh-oh! Now I've been puttin' ideas in your head, haven't I?
//	AI_Output(self,other,"DIA_Balor_SellUnder_01_01"); //Oha! Ich habe dich auf Ideen gebracht, häh?
	AI_Output(self,other,"DIA_Balor_SellUnder_01_01"); //O-hó! Teď jsem ti nasadil brouka do hlavy, viď?

	Info_ClearChoices(DIA_Balor_SellUnder);
//	Info_AddChoice(DIA_Balor_SellUnder,"Forget it, it was just a thought.",DIA_Balor_SellUnder_ForgetIt);
//	Info_AddChoice(DIA_Balor_SellUnder,"Vergiß es, war nur so'n Gedanke.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice(DIA_Balor_SellUnder,"Zapomeň na to, byla to jen úvaha.",DIA_Balor_SellUnder_ForgetIt);
//	Info_AddChoice(DIA_Balor_SellUnder,"If you know somebody - we could go halves.",DIA_Balor_SellUnder_HalfHalf);
//	Info_AddChoice(DIA_Balor_SellUnder,"Wenn du einen Abnehmer weißt - wir könnten Halbe-Halbe machen.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice(DIA_Balor_SellUnder,"Jestli někoho znáš - mohli bysme se rozdělit.",DIA_Balor_SellUnder_HalfHalf);
//	Info_AddChoice(DIA_Balor_SellUnder,"No - tell me - who?",DIA_Balor_SellUnder_ComeOn);
//	Info_AddChoice(DIA_Balor_SellUnder,"Nein - sag mal - an wen?",DIA_Balor_SellUnder_ComeOn);
	Info_AddChoice(DIA_Balor_SellUnder,"Ne - řekni mi - kdo?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
//	AI_Output(other,self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Forget it, it was just a thought.
//	AI_Output(other,self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Vergiss es, war nur so'n Gedanke.
	AI_Output(other,self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Zapomeň na to, to byla jen úvaha.
	Info_ClearChoices(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
//	AI_Output(other,self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //If you know somebody - we could go halves.
//	AI_Output(other,self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Wenn du einen Abnehmer weißt - wir könnten Halbe-Halbe machen.
	AI_Output(other,self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Jestli někoho znáš - mohli bysme se rozdělit.
//	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Well, I'd know somebody in the New Camp, he'd be interested in weed...
//	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Nun, ich wüsste da jemanden im Neuen Lager, den würde so 'ne Menge Kraut schon interessieren ...
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Dobrá, věděl bych o někom z Nového tábora, koho by droga mohla zajímat...
//	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //But if the Gurus catch you at it, they'll feed you to the swampsharks! I don't know anything, okay?!
//	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Aber wenn dich die Gurus dabei erwischen, machen sie Sumpfhaifutter aus dir! Ich weiß von nichts, klar?!
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Ale jestli tě přitom přistihnou Guru, hodí tě močálovým žralokům! A já nevím nic, jasný?
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
//	AI_Output(other,self,"DIA_Balor_SellUnder_ComeOn_15_00"); //No - tell me - who?
//	AI_Output(other,self,"DIA_Balor_SellUnder_ComeOn_15_00"); //Nein - sag mal - an wen?
	AI_Output(other,self,"DIA_Balor_SellUnder_ComeOn_15_00"); //Ne - řekni mi - kdo?
//	AI_Output(self,other,"DIA_Balor_SellUnder_ComeOn_01_01"); //You have something in mind? I'm telling you: If the stuff doesn't arrive at Cor Kalom's, we'll both be in real trouble!
//	AI_Output(self,other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Du hast doch was vor! Ich sage dir: Wenn das Kraut nicht bei Cor Kalom ankommt, kriegen wir beide mächtigen Ärger!
	AI_Output(self,other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Ty máš něco v úmyslu! Řeknu ti jedno: jestli se ta droga nedostane ke Corovu Kalomovi, dostaneme se oba do maléru!
};

// **************************************************
//				Name des Dealers
// **************************************************
	var int Balor_TellsNCDealer;
// **************************************************

instance DIA_Balor_TellDealer(C_INFO)
{
	npc = Nov_1304_Balor;
	nr = 1;
	condition = DIA_Balor_TellDealer_Condition;
	information = DIA_Balor_TellDealer_Info;
	important = 0;
	permanent = 1;
//	description = "Okay - who's the buyer in the New Camp?";
//	description = "Okay - wer ist der Abnehmer im Neuen Lager?";
	description = "Dobře - kdo je ten překupník z Nového tábora?";
};

func int DIA_Balor_TellDealer_Condition()
{
	if ((Balor_PlayerCheating==TRUE) && (Balor_TellsNCDealer==FALSE))
	{
		return 1;
	};
};

func void DIA_Balor_TellDealer_Info()
{
//	AI_Output(other,self,"DIA_Balor_TellDealer_15_00"); //Okay - who's the buyer in the New Camp?
//	AI_Output(other,self,"DIA_Balor_TellDealer_15_00"); //Okay - wer ist der Abnehmer im Neuen Lager?
	AI_Output(other,self,"DIA_Balor_TellDealer_15_00"); //Dobře - kdo je ten překupník z Nového tábora?
//	AI_Output(self,other,"DIA_Balor_TellDealer_01_01"); //You think I'll give you the name and you can just make a run with the weed - it doesn't work quite like that!
//	AI_Output(self,other,"DIA_Balor_TellDealer_01_01"); //Ich verrat dir den Namen und du bist mit dem Kraut über alle Berge - so läuft das nicht!
	AI_Output(self,other,"DIA_Balor_TellDealer_01_01"); //Myslíš si, že ti řeknu to jméno a ty s tou drogou zmizíš - takhle to teda nepůjde!
//	AI_Output(self,other,"DIA_Balor_TellDealer_01_02"); //I wanna see 50 ore as an advance payment. Then we'll see.
//	AI_Output(self,other,"DIA_Balor_TellDealer_01_02"); //Ich will 50 Erz Vorschuss sehen. Dann sehen wir weiter.
	AI_Output(self,other,"DIA_Balor_TellDealer_01_02"); //Chci 50 nugetů jako platbu předem. Pak se uvidí.

	Info_ClearChoices(DIA_Balor_TellDealer);
//	Info_Addchoice (DIA_Balor_TellDealer,"Forget it.",DIA_Balor_TellDealer_ForgetIt);
//	Info_Addchoice (DIA_Balor_TellDealer,"Vergiß es.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice (DIA_Balor_TellDealer,"Na to zapomeň.",DIA_Balor_TellDealer_ForgetIt);
//	Info_Addchoice (DIA_Balor_TellDealer,"50's fair - here you go.",DIA_Balor_TellDealer_Pay);
//	Info_Addchoice (DIA_Balor_TellDealer,"50 sind fair - hier, nimm.",DIA_Balor_TellDealer_Pay);
	Info_Addchoice (DIA_Balor_TellDealer,"50, to je fér - tady jsou.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
//	AI_Output(other,self,"DIA_Balor_TellDealer_Pay_15_00"); //50's fair - here you go.
//	AI_Output(other,self,"DIA_Balor_TellDealer_Pay_15_00"); //50 sind fair - hier, nimm.
	AI_Output(other,self,"DIA_Balor_TellDealer_Pay_15_00"); //50, to je fér - tady jsou.
	if (Npc_HasItems(other,itminugget) >= 50)
	{
//		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_01"); //Good... Listen. His name's Cipher. You'll probably find him in the bar on the lake.
//		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_01"); //Gut... Hör zu. Sein Name ist Cipher. Du findest ihn meistens in der Kneipe auf dem See.
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_01"); //Dobře... Poslouchej. Jmenuje se Cipher. Najdeš ho nejspíš u baru na jezeře.
//		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_02"); //Be careful and don't let anybody fool you.
//		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_02"); //Sei vorsichtig und lass dich nicht über's Ohr hauen.
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_02"); //Buď opatrný a nenech se od nikoho napálit.
		Info_ClearChoices(DIA_Balor_TellDealer);

		B_GiveInvItems(other,self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

//		B_LogEntry(CH1_DeliverWeed,"Balor mentioned a man called Cipher, who would like to buy the swampweed harvest. I can find him in the bar at the lake of the New Camp. I would get into enormous trouble with the Gurus, though.");
//		B_LogEntry(CH1_DeliverWeed,"Balor erwähnte einen Mann namens Cipher, der ein dankbarer Käufer für die Sumpfkrauternte wäre. Ich finde ihn in der Kneipe auf dem See des Neuen Lagers. Allerdings würde mir das gewaltigen Ärger mit den Gurus einbringen.");
		B_LogEntry(CH1_DeliverWeed,"Balor se zmínil o muži jménem Cipher, který by rád koupil sklizeň drogy z bažin. Můžu ho najít v baru na jezeře v Novém táboře. Budu však mít nesmírné potíže s guru.");
		B_GiveXP(XP_BalorNamedCipher);

		Log_CreateTopic(GE_TraderNC,LOG_NOTE);
//		B_LogEntry(GE_TraderNC,"Cipher buys and sells all sorts of goods in the bar at the lake. He is especially interested in major swampweed deliveries.");
//		B_LogEntry(GE_TraderNC,"Cipher kauft und verkauft Waren aller Art in der Kneipe auf dem See. Er ist besonders an größeren Lieferungen Sumpfkraut interessiert.");
		B_LogEntry(GE_TraderNC,"Cipher skupuje a prodává v baru na jezeře veškeré zboží. Obzvlášť se zajímá o velké dodávky drogy z bažin.");
	}
	else
	{
//		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //I don't see any 50 ore. I want 50 ore and not a nugget less, okay?
//		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Ich sehe keine 50. Ich will 50 und keinen Brocken weniger, klar?
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Nevidím těch 50 nugetů. Chci 50 nugetů a ani o jeden míň, jasný?
		Info_ClearChoices(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
//	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Forget it.
//	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Vergiss es.
	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Zapomeň na to.
//	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Don't think you can simply walk into the New Camp and sell it to anybody! If you don't know the right name, you'll never get rid of it.
//	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Denk bloß nicht, du könntest einfach ins Neue Lager spazieren und es irgendwem andrehen! Wenn du den richtigen Namen nicht kennst, wirst du es nie los.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Nemysli si, že můžeš klidně jít do Nového tábora a prodat to kdekomu! Když nebudeš znát správné jméno, nikdy se toho nezbavíš!
//	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //Unless you let some rogue whack you on the nut.
//	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //Es sei denn, du lässt dir von einem Banditen über die Rübe hauen.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //Ledaže bys nechal nějakého banditu, aby ti rozbil hlavu.
	Info_ClearChoices(DIA_Balor_TellDealer);
};

// **************************************************
//					Verarschen
// **************************************************

instance DIA_Balor_RipOff(C_INFO)
{
	npc = Nov_1304_Balor;
	nr = 5;
	condition = DIA_Balor_RipOff_Condition;
	information = DIA_Balor_RipOff_Info;
	important = 0;
	permanent = 0;
//	description = "I'm to pick up the next delivery for Cor Kalom.";
//	description = "Ich soll nochmal alles Kraut zu Cor Kalom bringen.";
	description = "Mám tady vyzvednout další dodávku pro Cora Kaloma.";
};

func int DIA_Balor_RipOff_Condition()
{
	if (((Balor_BotenDay <= (Wld_GetDay() - 2))
	&& (Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};

	return 0;
};

func void DIA_Balor_RipOff_Info()
{
//	AI_Output(other,self,"DIA_Balor_RipOff_15_00"); //It's me, I'm back. I'm to pick up the next delivery.
//	AI_Output(other,self,"DIA_Balor_RipOff_15_00"); //Da bin ich wieder. Ich soll die nächste Ladung abholen.
	AI_Output(other,self,"DIA_Balor_RipOff_15_00"); //To jsem já, jsem zpátky. Mám převzít další várku.
	if (Balor_PlayerCheating == TRUE)
	{
//		AI_Output(self,other,"DIA_Balor_RipOff_01_01"); //Of course! To sell it off to the New Camp again?
//		AI_Output(self,other,"DIA_Balor_RipOff_01_01"); //Na klar! Und sie wieder ans Neue Lager verhökern!
		AI_Output(self,other,"DIA_Balor_RipOff_01_01"); //No jistě! A zase ji prodat v Novém táboře.
//		AI_Output(self,other,"DIA_Balor_RipOff_01_02"); //I wanna see 50 ore - my usual advance payment.
//		AI_Output(self,other,"DIA_Balor_RipOff_01_02"); //Ich will 50 Erz sehen - mein üblicher Vorschuss.
		AI_Output(self,other,"DIA_Balor_RipOff_01_02"); //Chci 50 nugetů - moji obvyklou platbu.
	}
	else
	{
//		AI_Output(self,other,"DIA_Balor_RipOff_01_03"); //You again? Well then, here, take it, but don't do anything stupid, you got that?
//		AI_Output(self,other,"DIA_Balor_RipOff_01_03"); //Du schon wieder? Na gut, hier nimm, aber mach keine Dummheiten damit, klar?
		AI_Output(self,other,"DIA_Balor_RipOff_01_03"); //Zase ty? Dobrá, tady je, vem si to, ale neproveď žádnou hloupost, jasný?
//		AI_Output(other,self,"DIA_Balor_RipOff_15_04"); //I wouldn't dare.
//		AI_Output(other,self,"DIA_Balor_RipOff_15_04"); //Würde ich nie wagen.
		AI_Output(other,self,"DIA_Balor_RipOff_15_04"); //To bych si nedovolil.
		CreateInvItems(self,ItMi_Plants_Swampherb_01, 50);
		B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01, 50);
	};
};

// **************************************************
//					PERMANENT
// **************************************************

instance DIA_Balor_Perm(C_INFO)
{
	npc = Nov_1304_Balor;
	nr = 1;
	condition = DIA_Balor_Perm_Condition;
	information = DIA_Balor_Perm_Info;
	important = 0;
	permanent = 1;
//	description = "Just keep picking hard!";
//	description = "Immer tüchtig weitersammeln!";
	description = "Dávej na to pořád pozor!";
};

func int DIA_Balor_Perm_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return 1;
	};

	return 0;
};

func void DIA_Balor_Perm_Info()
{
//	AI_Output(other,self,"DIA_Balor_Perm_15_00"); //Just keep picking hard!
//	AI_Output(other,self,"DIA_Balor_Perm_15_00"); //Immer tüchtig weitersammeln!
	AI_Output(other,self,"DIA_Balor_Perm_15_00"); //Dávej na to pořád pozor!
//	AI_Output(self,other,"DIA_Balor_Perm_01_01"); //Of course, what do you think I'm doing? Rocking my balls?
//	AI_Output(self,other,"DIA_Balor_Perm_01_01"); //Na klar, was denkst du denn, was ich hier mache? Mir die Eier schaukeln?
	AI_Output(self,other,"DIA_Balor_Perm_01_01"); //Jistě, co myslíš, že tu dělám? Že ležím na břiše a kopu se do zadku?
};
