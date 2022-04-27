// ******************************************************************
// Zur Info: Bloodwyn: 244, 243; Bloodwyn: 229, 242; Fletcher: 241, 240

// ************************************************************
// 			  				   EXIT_Schutzgeld
// ************************************************************

instance Info_Bloodwyn_EXIT_Schutzgeld(C_INFO)
{
	npc = GRD_233_Bloodwyn;
	nr = 999;
	condition = Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information = Info_Bloodwyn_EXIT_Schutzgeld_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

func void Info_Bloodwyn_EXIT_Schutzgeld_Info()
{
//	AI_Output(other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //See ya.
//	AI_Output(other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //Wir sehen uns.
	AI_Output(other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //Ještě se uvidíme.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
//		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Take care of yourself,kid.
//		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Pass gut auf dich auf, Kleiner!
		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Dej na sebe pozor, chlapče.
	}
	else
	{
//		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //Don't you worry about anything here in the Camp! We'll be looking out for you.
//		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //Mach dir keine Sorgen, während du hier im Lager bist! Wir passen auf dich auf.
		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //Nedělej si starosti. Když jsi v táboře, dohlédneme na tebe.
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
instance Info_Bloodwyn_Hello(C_INFO)
{
	npc = GRD_233_Bloodwyn;
	nr = 3;
	condition = Info_Bloodwyn_Hello_Condition;
	information = Info_Bloodwyn_Hello_Info;
	important = 1;
	permanent = 0;
};

func int Info_Bloodwyn_Hello_Condition()
{
	if (Kapitel <= 2)
	//#NEEDS_ATTENTION Bloodwyn ma tento dialog aj ked hrac patri k nejakej guilde - asi by sme mali zamedzit kontrolou guildy:
	//if ((Kapitel <= 2) && (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void Info_Bloodwyn_Hello_Info()
{
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_00"); //Hey, you!
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_00"); //Hey du!
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_00"); //Hej, ty!
//	AI_Output(other,self,"Info_Bloodwyn_Hello_15_01"); //Are you talking to me?
//	AI_Output(other,self,"Info_Bloodwyn_Hello_15_01"); //Redest du mit mir?
	AI_Output(other,self,"Info_Bloodwyn_Hello_15_01"); //To mluvíš se mnou?
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_02"); //I'm warning you! People like you can get into trouble awfully quick round here!
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_02"); //Ich will dich warnen! Jemand wie du hat hier schnell Ärger am Hals!
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_02"); //Chci tě varovat! Lidi jako ty se tady dostanou do problémů razdva!
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_03"); //And most of the guys they chuck in here are bastards!
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_03"); //Und die meisten, die sie hier reingeworfen haben, sind Arschlöcher!
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_03"); //A většina chlapů, se kterými se tu setkáš, jsou bastardi!
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_04"); //They think they can do what they like to you. But we won't allow that.
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_04"); //Sie denken, dass sie mit dir machen können, was sie wollen. Aber das lassen wir nicht zu.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_04"); //Myslí si, že si s tebou můžou dělat, co je napadne. Ale my jim to nedovolíme.
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_05"); //Gomez wants some peace in the Camp, and we guards make sure he gets it. But it's a job that doesn't come cheap.
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_05"); //Gomez will, dass Ruhe im Lager herrscht. Und wir Gardisten sorgen dafür. Aber so eine Aufgabe ist extrem kostspielig.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_05"); //Gomez chce, aby byl v táboře klid, a o to se staráme my, stráže. Je to ale práce, která není nijak laciná.
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_06"); //That's why I'm asking you for some ore. Look at it as a kind of token of friendship. You help us, and we'll help you. If you get in trouble, we'll be there for you.
//	AI_Output(self,other,"Info_Bloodwyn_Hello_08_06"); //Darum bitte ich dich um etwas Erz. Du musst das als Freundschaftsdienst verstehen. Du hilfst uns und wir helfen dir. Wenn du mal Ärger hast, sind wir da.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_06"); //Proto tě prosím o pár nugetů. Ber to jako jakýsi projev přátelství. Ty pomůžeš nám, my pomůžeme tobě. Když se dostaneš do maléru, my tě z něj vytáhneme.

	Info_ClearChoices(Info_Bloodwyn_Hello);
//	Info_AddChoice(Info_Bloodwyn_Hello,"Why not? How much ore were you thinking of?",Info_Bloodwyn_Hello_HowMuch);
//	Info_AddChoice(Info_Bloodwyn_Hello,"Warum nicht. An wieviel Erz hattest du denn gedacht?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice(Info_Bloodwyn_Hello,"Proč ne? Kolik nugetů máš na mysli?",Info_Bloodwyn_Hello_HowMuch);
//	Info_AddChoice(Info_Bloodwyn_Hello,"You want me to pay protection money? I can take care of myself!",Info_Bloodwyn_Hello_ForgetIt);
//	Info_AddChoice(Info_Bloodwyn_Hello,"Ich soll Schutzgeld zahlen? Ich kann auf mich selbst aufpassen!",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice(Info_Bloodwyn_Hello,"Chceš, abych zaplatil peníze za ochranu? Postarám se o sebe sám!",Info_Bloodwyn_Hello_ForgetIt);
//	Info_AddChoice(Info_Bloodwyn_Hello,"Is that a threat?",Info_Bloodwyn_Hello_SollDrohungSein);
//	Info_AddChoice(Info_Bloodwyn_Hello,"Soll das eine Drohung sein?",Info_Bloodwyn_Hello_SollDrohungSein);
	Info_AddChoice(Info_Bloodwyn_Hello,"To má být pohrůžka?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
//	AI_Output(other,self,"Info_Bloodwyn_ForgetIt_15_00"); //You mean you want me to pay protection money? No thanks, I can take care of myself!
//	AI_Output(other,self,"Info_Bloodwyn_ForgetIt_15_00"); //Ich soll Schutzgeld zahlen? Ich kann auf mich selbst aufpassen!
	AI_Output(other,self,"Info_Bloodwyn_ForgetIt_15_00"); //Myslíš, že ti mám zaplatit za ochranu? Ne, díky, postarám se o sebe sám!
//	AI_Output(self,other,"Info_Bloodwyn_ForgetIt_08_01"); //Have it your own way, kid. You'll soon regret turning down a friendly offer!
//	AI_Output(self,other,"Info_Bloodwyn_ForgetIt_08_01"); //Wie du meinst, Kleiner. Wirst schon sehen, was du davon hast, ein Freundschaftsangebot abzulehnen!
	AI_Output(self,other,"Info_Bloodwyn_ForgetIt_08_01"); //Jak myslíš, hochu. Brzy budeš litovat, že jsi tuhle přátelskou nabídku odmítl!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Bloodwyn_Hello);
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
//	AI_Output(other,self,"Info_Bloodwyn_SollDrohungSein_15_00"); //Is that a threat?
//	AI_Output(other,self,"Info_Bloodwyn_SollDrohungSein_15_00"); //Soll das eine Drohung sein?
	AI_Output(other,self,"Info_Bloodwyn_SollDrohungSein_15_00"); //To má být pohrůžka?
//	AI_Output(self,other,"Info_Bloodwyn_SollDrohungSein_08_01"); //On the contrary! It's an offer of friendship!
//	AI_Output(self,other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Im Gegenteil! Es ist ein Freundschaftsangebot!
	AI_Output(self,other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Naopak! Přátelská nabídka!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
//	AI_Output(other,self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Why not? How much ore were you thinking of?
//	AI_Output(other,self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Warum nicht. An wie viel Erz hast du denn gedacht?
	AI_Output(other,self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Proč ne? Kolik nugetů máš na mysli?
//	AI_Output(self,other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Not much. 10 ore, that's all I need.
//	AI_Output(self,other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Nicht viel. 10 Erz, mehr brauche ich nicht.
	AI_Output(self,other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Ne moc. 10 nugetů, víc nepotřebuju.

	Info_ClearChoices(Info_Bloodwyn_Hello);
//	Info_AddChoice(Info_Bloodwyn_Hello,"I don't have 10 ore.",Info_Bloodwyn_Hello_NotNow);
//	Info_AddChoice(Info_Bloodwyn_Hello,"Ich habe gerade keine 10 Erz.",Info_Bloodwyn_Hello_NotNow);
	Info_AddChoice(Info_Bloodwyn_Hello,"Nemám 10 nugetů.",Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget) >= 10)
	{
//		Info_AddChoice(Info_Bloodwyn_Hello,"Here's your ore. I can always use a friend or two.",Info_Bloodwyn_Hello_OkTakeIt);
//		Info_AddChoice(Info_Bloodwyn_Hello,"Hier hast du das Erz. Ich kann Freunde brauchen.",Info_Bloodwyn_Hello_OkTakeIt);
		Info_AddChoice(Info_Bloodwyn_Hello,"Tady je tvoje ruda. Přátelé se vždycky hodí.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};

// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
//	AI_Output(other,self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Here's your ore. I can always use a friend or two.
//	AI_Output(other,self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Hier hast du das Erz. Ich kann Freunde gebrauchen.
	AI_Output(other,self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Tady je tvoje ruda. Přátelé se vždycky hodí.
//	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //You seem to be a clever lad. From now on, we'll be watching out for you.
//	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Du scheinst mir ein kluges Bürschchen zu sein. Von nun an werden wir auf dich aufpassen.
	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Vypadá to, že jsi rozumný mladík. Od teďka tě budeme ochraňovat.
//	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //But that doesn't mean to say you can do what you like around here, okay?
//	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Aber das heißt nicht, dass du hier machen kannst, was du willst, verstanden?
	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //To ale neznamená, že si tu můžeš dělat, co se ti zlíbí, jasný?

	B_GiveInvItems(other,self,itminugget, 10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Bloodwyn_Hello);
};

func void Info_Bloodwyn_Hello_NotNow()
{
//	AI_Output(other,self,"Info_Bloodwyn_Hello_NotNow_15_00"); //I don't have 10 ore.
//	AI_Output(other,self,"Info_Bloodwyn_Hello_NotNow_15_00"); //Ich habe gerade keine 10 Erz.
	AI_Output(other,self,"Info_Bloodwyn_Hello_NotNow_15_00"); //Nemám 10 nugetů.
//	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Then I'll take whatever you have - that's okay. You can give me the rest next time I see you.
//	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Dann nehme ich das, was du hast - ist schon okay. Du kannst ja beim nächsten Mal die volle Summe zahlen.
	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Pak dej, co máš - to bude stačit. Zbytek mi můžeš dát, až se uvidíme příště.
	AI_GotoNpc(self,other);
//	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Let me see...
//	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Lass mal sehen ...
	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Ještě se uvidíme...

	if (Npc_HasItems(other,itminugget) > 0)
	{
		if (Npc_HasItems(other,itminugget) > 9)
		{
//			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //Hey, look at that? Looks like someone can't count to 10, eh?
//			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //Na, was haben wir denn da? Kann da jemand nicht bis 10 zählen?
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //A, kohopak to tu máme. Někdo, kdo neumí počítat do deseti, co?
//			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //I'm just gonna take everything you have. That'll help me forget you lied to me.
//			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Ich werd einfach alles nehmen, was du hast. Dafür vergesse ich, dass du mich belogen hast.
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Vezmu si všechno, co máš. To mi pomůže zapomenout, žes mi lhal.
		}
		else
		{
//			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Oh, I take small donations too. It's the thought that counts! Thanks for the ore, kid!
//			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Ich nehme auch kleine Spenden, es ist der gute Wille, der zählt! Danke für das Erz, Kleiner!
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Vezmu si také malý příspěvek. Dobrá vůle se počítá. Díky za ty nugety, hochu!
//			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //From now on, I'll be watching out for you whenever you're in the Camp.
//			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //Von jetzt an werden wir ein Auge auf dich haben, solange du im Lager bist.
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //Od teďka budu na tebe dávat pozor po celou dobu, co budeš v táboře.
		};
	}
	else
	{
//		AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Hm, you really are broke, aren't you. Well, I guess there's always next time...
//		AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Du hast ja wirklich nichts ... Na, wie gesagt, beim nächsten Mal ...
		AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Hm, opravdu nic nemáš. Dobrá, tak řekněme, že příště...
	};

	//#NEEDS_ATTENTION co ak hrac nema ziadnu rudu ? presun rudy by mal byt skor hore v podmienke
	//if (Npc_HasItems(other,itminugget) > 0)
	B_GiveInvItems(other,self,itminugget, Npc_HasItems(other,itminugget));//Alle Nuggets entfernen
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Bloodwyn_Hello);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************

instance Info_Bloodwyn_PayDay(C_INFO)
{
	npc = GRD_233_Bloodwyn;
	nr = 3;
	condition = Info_Bloodwyn_PayDay_Condition;
	information = Info_Bloodwyn_PayDay_Info;
	important = 1; //*** NUR, WENN SC AUCH 10 ERZ HAT! ***
	permanent = 1;
};

func int Info_Bloodwyn_PayDay_Condition()
{
	if ((Kapitel <= 2)
	&& (Bloodwyn_PayDay <= Wld_GetDay() - 1)
	&& (Npc_HasItems(other,itminugget) >= 10))
	//#NEEDS_ATTENTION ak hrac zaplatil ako GIL_NONE, tak od neho Bloodwyn bude stale pytat rudu, mali by sme obmedzit na GIL_NONE
	//if ((Kapitel <= 2) && (Bloodwyn_PayDay <= Wld_GetDay() - 1) && (Npc_HasItems(other,itminugget) >= 10) && (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void Info_Bloodwyn_PayDay_Info()
{
	if (Bloodwyn_ProtectionPaid == TRUE)
	{
//		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_00"); //Ah, good to see you, my friend!
//		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_00"); //Gut, dass ich dich treffe, mein Freund!
		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_00"); //Á, dobře, že tě vidím, příteli!
//		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_01"); //How about your daily contribution? Your 10 ore is due, you know.
//		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_01"); //Wie sieht's mit deiner täglichen Unterstützung aus? Deine 10 Erz sind wieder mal fällig.
		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_01"); //Co tvůj denní příspěvek? Dlužíš 10 nugetů, však víš.

		Info_ClearChoices(Info_Bloodwyn_PayDay);
//		Info_AddChoice(Info_Bloodwyn_PayDay,"Here, take it. 10 ore's not much among friends.",Info_Bloodwyn_PayDay_PayAgain);
//		Info_AddChoice(Info_Bloodwyn_PayDay,"Hier, nimm - 10 Erz sind nicht viel unter Freuden.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice(Info_Bloodwyn_PayDay,"Tady jsou. 10 nugetů není mezi přáteli mnoho.",Info_Bloodwyn_PayDay_PayAgain);
//		Info_AddChoice(Info_Bloodwyn_PayDay,"I'm not paying - you've had enough out of me already.",Info_Bloodwyn_PayDay_PayNoMore);
//		Info_AddChoice(Info_Bloodwyn_PayDay,"Ich werde nicht mehr zahlen - du hast schon genug gekriegt.",Info_Bloodwyn_PayDay_PayNoMore);
		Info_AddChoice(Info_Bloodwyn_PayDay,"Nezaplatím - už jste ze mě vytáhli dost.",Info_Bloodwyn_PayDay_PayNoMore);
	}
	//#NEEDS_ATTENTION - zbytocna podmienka, staci else :)
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
//		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hey, you!
//		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hey du!
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hej, ty!
//		AI_Output(other,self,"Info_Bloodwyn_PayDay_Den_15_01"); //Now what?
//		AI_Output(other,self,"Info_Bloodwyn_PayDay_Den_15_01"); //Was denn jetzt schon wieder?
		AI_Output(other,self,"Info_Bloodwyn_PayDay_Den_15_01"); //No, co?
//		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_02"); //The time's come for you to prove you're a true friend.
//		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_02"); //Es ist eine neue Gelegenheit für dich gekommen, dich als Freund zu erweisen.
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_02"); //Máš novou příležitost dokázat, že jsi opravdový přítel.
//		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_03"); //Just 10 ore, and you're in - what d'you say?
//		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_03"); //Mit nur 10 Erz bist du dabei - wie sieht's aus?
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_03"); //Jen 10 nugetů a můžeš dovnitř - co ty na to?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
//	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Here, take it. 10 ore's not much among friends.
//	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Hier, nimm - 10 Erz sind nicht viel unter Freunden
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Tady jsou. 10 nugetů není mezi přáteli mnoho.
//	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //My thoughts exactly!
//	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //Genau so sehe ich das auch.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //Přesně tak!

	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Info_ClearChoices(Info_Bloodwyn_PayDay);
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
//	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //I'm not paying - you've had enough out of me already.
//	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Ich werde nicht mehr zahlen - du hast schon genug gekriegt.
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Nezaplatím - už jste ze mě vytáhli dost.
//	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //You disappoint me! We're not friends anymore. See to it that you don't get mugged and robbed on your own now!
//	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Du enttäuschst mich! Von nun an sind wir keine Freunde mehr. Du wirst selber aufpassen müssen, dass du nicht von üblen Halunken niedergeschlagen und ausgeraubt wirst.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Zklamal jsem se v tobě! Takže už nejsme přátelé. Uvidíš, že jsi udělal chybu a okradl sám sebe!
//	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Don't worry, I can take care of myself just fine.
//	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Ich kann ganz gut auf mich selbst aufpassen.
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Neměj obavy, postarám se o sebe docela dobře sám.
//	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //We'll see...
//	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //Das werden wir ja sehen ...
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //To se uvidí...

	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(Info_Bloodwyn_PayDay);
};

// ************************************************************
// 						DOCH zahlen
// ************************************************************

instance Info_Bloodwyn_Doch(C_INFO)
{
	npc = GRD_233_Bloodwyn;
	nr = 3;
	condition = Info_Bloodwyn_Doch_Condition;
	information = Info_Bloodwyn_Doch_Info;
	important = 0;
	permanent = 1;
//	description = "I've changed my mind. I'm going to pay you the 10 ore after all.";
//	description = "Ich hab's mir überlegt - ich würde DOCH gern die 10 Erz bezahlen.";
	description = "Rozmyslel jsem se. Přece jen ti těch 10 nugetů dám.";
};

func int Info_Bloodwyn_Doch_Condition()
{
	if (Bloodwyn_ProtectionPaid == FALSE)
	//#NEEDS_ATTENTION, zase by som obmedzil na GIL_NONE
	//if ((Bloodwyn_ProtectionPaid == FALSE) && (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};

	return 0;
};

func void Info_Bloodwyn_Doch_Info()
{
//	AI_Output(other,self,"Info_Bloodwyn_Doch_15_00"); //I've changed my mind. I'm going to pay you the 10 ore after all.
//	AI_Output(other,self,"Info_Bloodwyn_Doch_15_00"); //Ich hab's mir überlegt - ich würde DOCH gern die 10 Erz bezahlen.
	AI_Output(other,self,"Info_Bloodwyn_Doch_15_00"); //Rozmyslel jsem se. Přece jen ti těch 10 nugetů dám.
	if (Npc_HasItems(other,itminugget)>=10)
	{
//		AI_Output(self,other,"Info_Bloodwyn_Doch_08_01"); //There now! You see, you CAN make the right choices.
//		AI_Output(self,other,"Info_Bloodwyn_Doch_08_01"); //Na siehst du! Du kannst ja DOCH die richtige Entscheidung treffen.
		AI_Output(self,other,"Info_Bloodwyn_Doch_08_01"); //Konečně! Vidíš, že se UMÍŠ dobře rozhodnout!
//		AI_Output(self,other,"Info_Bloodwyn_Doch_08_02"); //And from now on, you'll keep paying me your daily contribution, won't you?
//		AI_Output(self,other,"Info_Bloodwyn_Doch_08_02"); //Und von jetzt an zahlen wir schön brav täglich unsere Unterstützung, ja?
		AI_Output(self,other,"Info_Bloodwyn_Doch_08_02"); //A od teďka mi budeš platit denní příspěvek, jasný?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
//		AI_Output(self,other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Then come back when you have it.
//		AI_Output(self,other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Dann komm wieder, wenn du sie hast.
		AI_Output(self,other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Tak přijď, až budeš mít.
		AI_StopProcessInfos(self);
	};
};

instance Info_Bloodwyn_PayForJesse(C_INFO)
{
	npc = GRD_233_Bloodwyn;
	nr = 5;
	condition = Info_Bloodwyn_PayForJesse_Condition;
	information = Info_Bloodwyn_PayForJesse_Info;
	important = 0;
	permanent = 1;
//	description = "Jesse sent me to pay his 10 ore for him.";
//	description = "Jesse schickt mich - ich will seine 10 Erz für ihn zahlen.";
	description = "Jesse mě poslal, abych za něj zaplatil 10 nugetů.";
};

func int Info_Bloodwyn_PayForJesse_Condition()
{
	if (Jesse_PayForMe == LOG_RUNNING)
	{
		return 1;
	};

	return 0;
};

func void Info_Bloodwyn_PayForJesse_Info()
{
//	AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse sent me to pay his 10 ore for him.
//	AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse schickt mich - ich will seine 10 Erz für ihn zahlen.
	AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse mě poslal, abych za něj zaplatil 10 nugetů.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
//		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_01"); //What you should do is pay YOUR 10 ore.
//		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_01"); //Du solltest lieber DEINE 10 Erz zahlen.
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_01"); //Měl bys raději zaplatit SVÝCH 10 nugetů.
	};
//	AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_02"); //Never mind about Jesse. He's a loser, he's not got long anyway.
//	AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_02"); //Vergiss Jesse. Er ist ein Verlierer und wird sowieso bald draufgehen.
	AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_02"); //O Jesse se nestarej. Je to ztroskotanec a stejně tu už dlouho nezůstane.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
//		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_03"); //No - I am paying for him. So take his 10 ore and leave him be!
//		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_03"); //Nein - ich werde für ihn zahlen - hier nimm die 10 Erz und jetzt lass ihn in Ruhe!
		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_03"); //Ne - platím za něj. Tak vem si těch 10 nugetů a nech ho na pokoji!
//		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_04"); //Okay, man, if that's the way you want it.
//		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_04"); //Wie du willst, Mann - wie du willst.
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_04"); //Dobrá, člověče. Jak myslíš.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
//		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_05"); //Oh! It looks like I don't have that much ore on me.
//		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_05"); //Oh! Ich merke gerade, ich habe gar nicht so viel Erz bei mir.
		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_05"); //Och! Vypadá to, že u sebe tolik nemám.
//		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_06"); //That's an omen, man! Think again! Paying for that bum is a waste of good ore!
//		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_06"); //Das ist ein Zeichen, Mann! Überleg's dir noch mal! Für den Penner zu zahlen, ist glatte Verschwendung!
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_06"); //To je znamení, příteli! Ještě se rozmysli! Platit za toho pobudu je vyhazování peněz!
	};
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN //
------------------------------------------------------------------------*/
instance GRD_233_Bloodwyn_WELCOME(C_INFO)
{
	npc = GRD_233_Bloodwyn;
	condition = GRD_233_Bloodwyn_WELCOME_Condition;
	information = GRD_233_Bloodwyn_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int GRD_233_Bloodwyn_WELCOME_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return 1;
	};

	return 0;
};

func void GRD_233_Bloodwyn_WELCOME_Info()
{
//	AI_Output(self,other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //You're one of us now. Well done. The Guards need men like you!
//	AI_Output(self,other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Du gehörst jetzt zu uns. Gute Arbeit. Die Garde braucht Männer wie dich!
	AI_Output(self,other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Jsi jedním z nás. Dobrá práce. Stráže potřebují muže jako jsi ty!
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Bloodwyn_DIE(C_INFO)
{
	npc = Grd_233_Bloodwyn;
	condition = Info_Bloodwyn_DIE_Condition;
	information = Info_Bloodwyn_DIE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Bloodwyn_DIE_Condition()
{
	if (Kapitel == 4)
	{
		return 1;
	};

	return 0;
};

func void Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc(self,hero);

	if ((oldHeroGuild == GIL_STT)
	|| (oldHeroGuild == GIL_GRD)
	|| (oldHeroGuild == GIL_KDF))
	{
		if (oldHeroGuild == GIL_GRD)
		{
//			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_01"); //It's the traitor in our midst! PAH! And we called you a guard!
//			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_01"); //Da ist der Verräter aus unserer Mitte. PAH! Und dich haben wir mal Gardist genannt!
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_01"); //Tady je ten zrádce! PCHÁ! A my jsme tě nazvali strážcem!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
//			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_02"); //Looks like we've overlooked one of the rebellious fire mages!
//			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_02"); //Wir haben wohl einen der aufständischen Feuermagier übersehen!
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_02"); //Vypadá to, jako bychom přehlédli jednoho z těch vzpurných mágů Ohně!
		}
		else
		{
//			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_03"); //It's the Shadow that betrayed us!
//			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_03"); //Das ist der Schatten, der uns verraten hat!
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_03"); //To je ten Stín co nás zradil!
		};

//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_04"); //Hold on. What are you talking about, Bloodwyn?
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_04"); //Moment. Was redest du da, Bloodwyn?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_04"); //Počkej. O čem to mluvíš, Bloodwyne?
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_05"); //So you're in cahoots with the New Camp, huh?
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_05"); //Machst gemeinsame Sache mit dem Neuen Lager, was?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_05"); //Tak ty jsi ve spolčení s Novým táborem, jo?
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_06"); //No, wait, I'm still...
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_06"); //Warte mal, ich bin doch noch immer ...
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_06"); //Ne, počkej, pořád jsem přece...
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_07"); //Guess you must have thought you could go on like that forever.
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_07"); //Glaubtest wohl, das könnte ewig so gehen.
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_07"); //Asi sis myslel, že ti to bude procházet věčně.
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_08"); //Stop this nonsense...
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_08"); //Jetzt hör aber auf mit diesem Unsinn ...
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_08"); //Přestaň s těmi nesmysly...
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_09"); //Traitors like you must die.
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_09"); //Verräter wie dich machen wir kalt.
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_09"); //Zrádce jako ty musí zemřít.
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_10"); //DIE, TRAITOR!!!
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_10"); //STIRB, ABTRÜNNIGER!!!
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_10"); //SMRT ZRÁDCI!!!

		if (Npc_KnowsInfo(hero,Info_Fletcher_DIE))
		{
//			B_LogEntry(CH4_BannedFromOC,"Fletcher, who's guarding the main gate now, reacted the same way as Bloodwyn at the back gate. I don't know why, but it must somehow be connected to my search for the focus on behalf of the New Camp.");
//			B_LogEntry(CH4_BannedFromOC,"Fletcher, der nun das Haupttor bewacht, reagierte ähnlich wie Bloodwyn am hinteren Tor. Mir ist nicht klar warum, aber es muss etwas mit meiner Fokussuche für das Neue Lager zu tun haben.");
			B_LogEntry(CH4_BannedFromOC,"Fletcher, který teď střeží hlavní bránu, se zachoval stejně jako Bloodwyn u zadní brány. Nevím sice jak, ale musí to nějak souviset s mým hledáním ohniska pro Nový tábor.");
		}
		else if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
//			B_LogEntry(CH4_BannedFromOC,"Bloodwyn, who's guarding the back gate of the Old Camp with a group of guards, called me a traitor and a renegade. He wouldn't listen to me and attacked me at once!");
//			B_LogEntry(CH4_BannedFromOC,"Bloodwyn, der nun mit einer Gruppe Gardisten am hinteren Tor des Alten Lagers Wache hält, bezeichnete mich als Verräter und Abtrünniger. Er lies sich auf keine Diskussion ein und griff mich sofort an!");
			B_LogEntry(CH4_BannedFromOC,"Bloodwyn, který se skupinou strážců střeží zadní bránu Starého tábora, mě nazval zrádcem a odpadlíkem. Ani mě nevyslechl a zaútočil na mě!");
//			B_LogEntry(CH4_BannedFromOC,"It looks like I've been banished from the Old Camp!");
//			B_LogEntry(CH4_BannedFromOC,"Es sieht so aus, als ob ich nun aus dem alten Lager verbannt wurde!");
			B_LogEntry(CH4_BannedFromOC,"Vypadá to, že jsem vyhoštěn ze Starého tábora.");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
//			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_11"); //So you've ventured out of your New Camp? That was mighty stupid of you!
//			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_11"); //Du wagst dich tatsächlich aus deinem Neuen Lager heraus? Wie dumm von dir!
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_11"); //Tak ty ses odvážil opustit Nový tábor? To byl hodně špatný nápad!
		}
		else
		{
//			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_12"); //Oh, so you've ventured out of your swamp camp? That was mighty stupid of you!
//			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_12"); //Du wagst dich tatsächlich aus deinem Sumpflager heraus? Wie dumm von dir!
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_12"); //Och, tak ty ses odvážil opustit tábor v bažinách? To byl hodně špatný nápad!
		};

//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_13"); //What? What do you mean?
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_13"); //Was soll das? Was meinst du?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_13"); //Co? Co máš na mysli?
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_14"); //Haven't you heard about the attack on your mine?
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_14"); //Hast wohl noch nichts von unserem Überfall auf eure Mine gehört, was?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_14"); //Neslyšel jsi o napadení vašeho dolu?
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_15"); //What...
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_15"); //Moment mal ...
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_15"); //Co...
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_16"); //Sorry, but we can't let you go shooting your mouth off!
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_16"); //Leider können wir es nicht zulassen, dass du das irgendwo herumerzählst!
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_16"); //Bohužel tě to němůžeme nechat jít vyzvonit!
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hey, I don't want any trouble...
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hey, ich will keinen Streit ...
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hej, nechci žádné problémy...
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_18"); //You should've thought of that before!
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_18"); //Das hättest du dir vorher überlegen sollen!
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_18"); //Na to's měl myslet dřív!
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_19"); //Look, I've had about enough of this...
//		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_19"); //Jetzt ist es aber genug ...
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_19"); //Poslyš, už toho mám dost...
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_20"); //So have I! KILL HIM!
//		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_20"); //Richtig! TÖTET IHN!
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_20"); //Správně! ZABIJTE HO!
	};

	Npc_ExchangeRoutine(self,"FMTaken2"); // Verstärkung vor das Hinterem Tor (Anführer)
	B_ExchangeRoutine(GRD_232_Gardist, "FMTaken2"); // Verstärkung vor das Hinterem Tor
	B_ExchangeRoutine(GRD_229_Gardist, "FMTaken2"); // Verstärkung vor das Hinterem Tor (Fernkämpfer)
	B_ExchangeRoutine(GRD_216_Torwache, "FMTaken2"); // reguläre Wache am Hinteren Tor
	B_ExchangeRoutine(GRD_217_Torwache, "FMTaken2"); // reguläre Wache am Hinteren Tor

	B_SetPermAttitude (GRD_233_Bloodwyn, ATT_HOSTILE);
	B_SetPermAttitude (GRD_232_Gardist, ATT_HOSTILE);
	B_SetPermAttitude (GRD_229_Gardist, ATT_HOSTILE);
	B_SetPermAttitude (GRD_216_Torwache, ATT_HOSTILE);
	B_SetPermAttitude (GRD_217_Torwache, ATT_HOSTILE);

	if (!Npc_KnowsInfo(hero,Info_Fletcher_DIE))
	{
//		B_LogEntry(CH4_Firemages,"The gates of the Old Camp are now closed, they're protected by guards. They attack anybody approaching the Camp.");
//		B_LogEntry(CH4_Firemages,"Die Tore des Alten Lagers sind nun verschlossen und werden von Gardisten bewacht. Sie attackieren jeden der dem Lager zu nahe kommt.");
		B_LogEntry(CH4_Firemages,"Brány Starého tábora jsou nyní uzavřeny a hlídány strážemi. Napadají každého, kdo se přiblíží k táboru.");
	};

	AI_StopProcessInfos(self);
};
