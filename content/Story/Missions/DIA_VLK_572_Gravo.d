// **************************************************
//						 EXIT
// **************************************************

instance DIA_Gravo_Exit(C_INFO)
{
	npc = Vlk_572_Gravo;
	nr = 999;
	condition = DIA_Gravo_Exit_Condition;
	information = DIA_Gravo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Gravo_Exit_Condition()
{
	return 1;
};

func void DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Gravo_Hallo(C_INFO)
{
	npc = Vlk_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_Hallo_Condition;
	information = DIA_Gravo_Hallo_Info;
	permanent = 0;
//	description = "How are you doing?";
//	description = "Wie steht's denn so?";
	description = "Jak to vypadá?";
};

func int DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func void DIA_Gravo_Hallo_Info()
{
//	AI_Output(other,self,"DIA_Gravo_Hallo_15_00"); //How are you doing?
//	AI_Output(other,self,"DIA_Gravo_Hallo_15_00"); //Wie steht's denn so?
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00"); //Jak to vypadá?
//	AI_Output(self,other,"DIA_Gravo_Hallo_04_01"); //Well, since I stopped working in the mine, I can't really complain.
//	AI_Output(self,other,"DIA_Gravo_Hallo_04_01"); //Seit ich aufgehört habe, in der Mine zu arbeiten, lässt sich's hier richtig gut leben.
	AI_Output(self,other,"DIA_Gravo_Hallo_04_01"); //Nemůžu si stěžovat od té doby, co jsem přestal pracovat v dole.
//	AI_Output(other,self,"DIA_Gravo_Hallo_15_02"); //And where do you get your ore from?
//	AI_Output(other,self,"DIA_Gravo_Hallo_15_02"); //Und woher kriegst du dein Erz?
	AI_Output(other,self,"DIA_Gravo_Hallo_15_02"); //A odkud teď bereš rudu?
//	AI_Output(self,other,"DIA_Gravo_Hallo_04_03"); //I help people who have problems.
//	AI_Output(self,other,"DIA_Gravo_Hallo_04_03"); //Ich helfe Leuten, die Probleme haben.
	AI_Output(self,other,"DIA_Gravo_Hallo_04_03"); //Pomáhám lidem, kteří mají problémy.
//	AI_Output(self,other,"DIA_Gravo_Hallo_04_04"); //If you get into trouble with influential people here, I can help you sort the thing out.
//	AI_Output(self,other,"DIA_Gravo_Hallo_04_04"); //Wenn du hier Ärger mit einflussreichen Leuten hast, kann ich dafür sorgen, dass die Sache wieder ins Lot kommt.
	AI_Output(self,other,"DIA_Gravo_Hallo_04_04"); //Jestli se tu dostaneš do problémů s vlivnými lidmi, budu ti schopen pomoci věci napravit.
};

// **************************************************
//						HelpHow
// **************************************************

instance DIA_Gravo_HelpHow(C_INFO)
{
	npc = Vlk_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpHow_Condition;
	information = DIA_Gravo_HelpHow_Info;
	permanent = 0;
//	description = "If I was in trouble, YOU could help me? How?";
//	description = "Wenn ich hier Ärger habe, kannst DU mir also helfen? Wie?";
	description = "Když se dostanu do problémů, tak mi TY můžeš pomoci? Jak?";
};

func int DIA_Gravo_HelpHow_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpHow_Info()
{
//	AI_Output(other,self,"DIA_Gravo_HelpHow_15_00"); //If I was in trouble, YOU could help me? How?
//	AI_Output(other,self,"DIA_Gravo_HelpHow_15_00"); //Wenn ich hier Ärger habe, kannst DU mir also helfen? Wie?
	AI_Output(other,self,"DIA_Gravo_HelpHow_15_00"); //Když se dostanu do problémů, tak mi TY můžeš pomoci? Jak?
//	AI_Output(self,other,"DIA_Gravo_HelpHow_04_01"); //Well, let's assume you're in trouble with Thorus. You better never get into trouble with him, but then, well, you never know.
//	AI_Output(self,other,"DIA_Gravo_HelpHow_04_01"); //Nun - sagen wir mal, du hast Ärger mit Thorus. Du solltest es besser nie dazu kommen lassen, aber man weiß ja nie, was passiert.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_01"); //No, řekněme, že máš problém s Thorusem. Lepší bude, když se s ním do křížku nikdy nedostaneš, ale jeden nikdy neví.
//	AI_Output(self,other,"DIA_Gravo_HelpHow_04_02"); //Thorus can be quite stubborn - when he's pissed off with you once, he'll never talk to you again. And that's a bad thing.
//	AI_Output(self,other,"DIA_Gravo_HelpHow_04_02"); //Thorus kann ziemlich stur sein - wenn du's dir einmal mit ihm verscherzt hast, redet er nicht mehr mit dir. Das ist schlecht.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_02"); //Thorus dokáže být pěkně neústupný - když se jednou na někoho naštve, už s ním nikdy nepromluví. A to nechceš.
//	AI_Output(self,other,"DIA_Gravo_HelpHow_04_03"); //As a greenhorn, you depend on him. So you come to see me. I know a lot of people here Thorus listens to.
//	AI_Output(self,other,"DIA_Gravo_HelpHow_04_03"); //Denn als Neuer bist du auf ihn angewiesen. Also kommst du zu mir. Ich kenne 'ne Menge Leute hier, die Einfluss auf Thorus haben.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_03"); //Jako nováček jsi na něm závislý. Pak teda přijdeš za mnou. Znám tady řadu lidí, kterým Thorus naslouchá.
//	AI_Output(self,other,"DIA_Gravo_HelpHow_04_04"); //They put in a good word for you, and Thorus is your friend again. Of course the boys want to see some ore for these kind of favors. Your ore.
//	AI_Output(self,other,"DIA_Gravo_HelpHow_04_04"); //Die legen ein gutes Wort für dich ein und Thorus ist wieder auf deiner Seite. Natürlich wollen die Jungs dafür Erz sehen. Dein Erz.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_04"); //Přimluví se za tebe u Thoruse a ten je najednou zase na tvojí straně. Ti hoši však pochopitelně za tenhle druh laskavosti chtějí vidět nějakou rudu. Tvoji rudu.
//	AI_Output(self,other,"DIA_Gravo_HelpHow_04_05"); //And I take care that your ore gets to the right people...
//	AI_Output(self,other,"DIA_Gravo_HelpHow_04_05"); //Und ICH kümmere mich darum, dass dein Erz die richtigen Leute erreicht ...
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_05"); //A JÁ se starám o to, aby se ta ruda dostala do správných rukou...

//	B_LogEntry(GE_TraderOC,"The digger Gravo is selling a special kind of service. If I get in trouble with important people in the Camp, I can pay him to settle it.");
//	B_LogEntry(GE_TraderOC,"Der Buddler Gravo verkauft eine Dienstleistung besonderer Art. Wenn ich es mir bei wichtigen Leuten im Alten Lager verscherzt habe, kann ich ihn bezahlen, um den Streit beizulegen.");
	B_LogEntry(GE_TraderOC,"Kopáč Gravo poskytuje zvláštní služby. Pokud se v táboře dostanu do konfliktu s důležitými lidmi, můžu mu zaplatit za to, že vše urovná.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	//#Needs_Attention tu by sme mali Gravovi odstranit rudu - inak ju hrac moze vymlatit naspat. A Gravo tu rudu predsa pouzije aby uplatil NPC #Immerion
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
//		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //That's right, you're in his bad books.
//		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Stimmt, er ist nicht besonders gut auf dich zu sprechen.
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Pravda, moc dobře o tobě nemluvil.
//		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //I'll have some people talk to him. 100 ore and I'll take care of the problem.
//		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Ich werd' zusehen, dass sich ein paar Leute mal mit ihm unterhalten. 100 Erz und ich erledige die Sache.
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Zajdu za pár lidmi a popovídám si s nimi. 100 nugetů a já se o to postarám.
		if (Npc_HasItems(other,itminugget)>=100)
		{
//			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Well, let's see how much you have... Ah! Yeah, that should be enough. You can consider the affair settled.
//			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Lass sehen, wie viel du hast ... Ah! Das sollte reichen. Betrachte die Sache als erledigt.
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Ukaž, kolik máš... Ach! To by mělo stačit. Považuj ten problém za vyřešený.
//			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //And don't talk to anyone about it. Just behave as if nothing had happened at all.
//			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //Und sprich mit keinem darüber. Tu einfach so, als wär' nichts passiert.
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //A s nikým se o tom nebav. Dělej, jako by se nic nestalo.
			B_GiveInvItems(hero,self,itminugget, 100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
//			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01"); //I don't have that much.
//			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Soviel hab' ich nicht.
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nemám tolik rudy.
//			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Then I can't do anything for you - I'm sorry, boy.
//			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Dann kann ich nichts für dich tun - tut mit leid, Junge.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Pak pro tebe nebudu moci nic udělat - je mi líto, chlapče.
		};

	}
	else if (Npc_GetPermAttitude(prob, other)==ATT_HOSTILE)
	{
//		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //You call that trouble? That's an understatement, I think. I think he would like to tear you into little pieces, boy.
//		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //Ärger ist gar kein Ausdruck, Junge. Er würde dir am liebsten den Kopf abreißen.
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //Tomu říkáš problém? To je dost jemně řečeno, hochu. Nejradši by ti utrhl hlavu!
//		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //It won't be cheap if I'm to convince some people to calm him down again. It'll cost you 500 ore at least.
//		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Wenn ich ein paar Jungs davon überzeugen soll, ihn wieder gut zu stimmen, wird das nicht billig. 500 Erz musst du schon hinlegen.
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Jestli mám pár chlapů přesvědčit, aby ho zase uklidnili, tak to nebude vůbec levné. Musíš složit alespoň 500 nugetů.
		if (Npc_HasItems(other,itminugget)>=500)
		{
//			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Let's see what you have there... You seem to be a rich boy. I'll take the 500 and sort the thing out.
//			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Lass sehen, wie viel du hast ... Du scheinst ein reicher Bursche zu sein. Ich nehme die 500 und kümmere mich drum.
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Podívejme, co to tady máš... Zdá se, že jsi boháč. Vezmu si těch 500 nugetů a smetem tu záležitost ze stolu.
//			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //And remember: He is never ever to know that I took care of the problem - so don't you talk to anybody about it, you understand?
//			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //Und noch was: Er darf nie erfahren, dass ICH die Sache für dich geregelt habe - also rede mit KEINEM darüber!
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //A ještě něco. Nesmí se dozvědět, že jsem tu věc zařídil JÁ, takže o tom nikomu neříkej!
			B_GiveInvItems(hero,self,itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
//			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Soviel hab' ich nicht.
//			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Soviel hab' ich nicht.
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nemám tolik.
//			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Dann kann ich nichts für dich tun - tut mit leid, Junge.
//			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Dann kann ich nichts für dich tun - tut mit leid, Junge.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Pak pro tebe nemůžu nic udělat - je mi líto, chlapče.
		};
	}
	else
	{
//		AI_Output(self,other,"B_Gravo_HelpAttitude_NoProb_04_00"); //As far as I know he doesn't have a problem with you - don't worry.
//		AI_Output(self,other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Soweit ich weiß, hat er kein Problem mit dir - mach dir keine Sorgen.
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Co já vím, tak s tebou nemá problém - neměj obavy.
	};
};

//---------------------------------------------------

instance DIA_Gravo_HelpAngryNow(C_INFO)
{
	npc = Vlk_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpAngryNow_Condition;
	information = DIA_Gravo_HelpAngryNow_Info;
	permanent = 1;
//	description = "Can you help me - I think I'm in trouble.";
//	description = "Kannst du mir helfen - ich glaub, ich hab' Ärger.";
	description = "Můžeš mi pomoci - myslím, že mám problém.";
};

func int DIA_Gravo_HelpAngryNow_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpAngryNow_Info()
{
//	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00"); //Can you help me - I think I'm in trouble.
//	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00"); //Kannst du mir helfen - ich glaub, ich hab' Ärger.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00"); //Můžeš mi pomoci - myslím, že mám problém.
//	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01"); //I think so, but I warn you, my help could cost between 100 and 500 ore.
//	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01"); //Ich denke schon, aber ich warne dich, die Sache kann dich zwischen 100 und 500 Erz kosten.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01"); //Taky myslím, ale varuju tě, může tě to stát 100 až 500 nugetů.

	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
	Info_AddChoice(DIA_Gravo_HelpAngryNow, DIALOG_BACK ,DIA_Gravo_HelpAngryNow_BACK);
//	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Help me with Diego.",DIA_Gravo_HelpAngryNow_Diego);
//	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Mit Diego.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Pomoz mi s Diegem.",DIA_Gravo_HelpAngryNow_Diego);
//	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Help me with Thorus.",DIA_Gravo_HelpAngryNow_Thorus);
//	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Mit Thorus",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Pomoz mi s Thorusem.",DIA_Gravo_HelpAngryNow_Thorus);
//	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Help me with Gomez.",DIA_Gravo_HelpAngryNow_Gomez);
//	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Mit Gomez",DIA_Gravo_HelpAngryNow_Gomez);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Pomoz mi s Gomezem.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
//	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Help me with Diego.
//	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Mit Diego.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Pomoz mi s Diegem.
	var C_NPC diego; diego = Hlp_GetNpc(PC_Thief);
	B_Gravo_HelpAttitude(diego);

	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
//	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Help me with Thorus.
//	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Mit Thorus.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Pomoz mi s Thorusem.
	var C_NPC thorus; thorus = Hlp_GetNpc(Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);

	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
//	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Help me with Gomez.
//	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Mit Gomez.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Pomoz mi s Gomezem.
	var C_NPC gomez; gomez = Hlp_GetNpc(Ebr_100_Gomez);
	B_Gravo_HelpAttitude(gomez);

	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

// **************************************************
//						Influence
// **************************************************

instance DIA_Gravo_Influence(C_INFO)
{
	npc = Vlk_572_Gravo;
	nr = 2;
	condition = DIA_Gravo_Influence_Condition;
	information = DIA_Gravo_Influence_Info;
	//#Needs_Attention toto nemusi byt permanent - kedze mame aj zapis do denniku :-/
	permanent = 1;
//	description = "Could you tell me who belongs to the influential people here?";
//	description = "Kannst du mir sagen, wer hier zu den einflussreichen Leuten gehört?";
	description = "Můžeš mi říci, kdo tu patří k vlivným lidem?";
};

func int DIA_Gravo_Influence_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_Influence_Info()
{
//	AI_Output(other,self,"DIA_Gravo_Influence_15_00"); //Could you tell me which of the Shadows belongs to the influential people here?
//	AI_Output(other,self,"DIA_Gravo_Influence_15_00"); //Kannst du mir sagen, wer von den Schatten hier zu den einflussreichen Leuten gehört?
	AI_Output(other,self,"DIA_Gravo_Influence_15_00"); //Můžeš mi říci, kdo tu patří k vlivným lidem?
//	AI_Output(self,other,"DIA_Gravo_Influence_04_01"); //You want to impress the right people, do you?
//	AI_Output(self,other,"DIA_Gravo_Influence_04_01"); //Du willst die richtigen Leute beeindrucken, he?
	AI_Output(self,other,"DIA_Gravo_Influence_04_01"); //Chceš udělat dojem na správné lidi, viď?
//	AI_Output(self,other,"DIA_Gravo_Influence_04_02"); //Diego has the most power of all the Shadows. He trusts Fingers, Whistler and Sly.
//	AI_Output(self,other,"DIA_Gravo_Influence_04_02"); //Diego hat von allen Schatten am meisten zu melden. Zu seinen Vertrauten zählen Fingers, Whistler und Sly.
	AI_Output(self,other,"DIA_Gravo_Influence_04_02"); //Diego má ze Stínů největší moc. Důvěřuje Fingersovi, Whistlerovi a Slyovi.
//	AI_Output(self,other,"DIA_Gravo_Influence_04_03"); //Dexter and Fisk sell their stuff on the market square. They have many customers, even the guards, and that makes them rather influential.
//	AI_Output(self,other,"DIA_Gravo_Influence_04_03"); //Dexter und Fisk verscherbeln ihre Sachen auf dem Marktplatz. Sie haben viele Kunden, selbst unter den Gardisten und sind dementsprechend einflussreich.
	AI_Output(self,other,"DIA_Gravo_Influence_04_03"); //Dexter a Fisk prodávají své zboží na tržišti. Mají spoustu zákazníků, dokonce i mezi strážci, a to z nich dělá důležité osoby.
//	AI_Output(self,other,"DIA_Gravo_Influence_04_04"); //And then there's Scatty. He's in charge of the arena, and determines who fights and all that. Many people here owe him ore - he's important as well.
//	AI_Output(self,other,"DIA_Gravo_Influence_04_04"); //Und dann wäre da noch Scatty, er leitet die Arena, bestimmt wer kämpft und so. Es gibt viele hier, die ihm noch Erz schulden - auch an ihn kannst du dich halten.
	AI_Output(self,other,"DIA_Gravo_Influence_04_04"); //A pak je tu Scatty, stará se o arénu a rozhoduje, kdo bude bojovat a tak. Spousta lidí mu dluží rudu - je tedy dost důležitý.

	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
//	B_LogEntry(GE_TraderOC,"Dexter and Fisk trade in various goods on the market square.");
//	B_LogEntry(GE_TraderOC,"Dexter und Fisk handeln mit verschiedenen Waren am Marktplatz.");
	B_LogEntry(GE_TraderOC,"Dexter a Fisk obchodují na tržišti s různým zbožím.");

};

