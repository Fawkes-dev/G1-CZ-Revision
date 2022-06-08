// ************************************************************
// 							EXIT
// ************************************************************

instance DIA_BaalNamib_EXIT(C_INFO)
{
	npc = GUR_1204_BaalNamib;
	nr = 999;
	condition = DIA_BaalNamib_EXIT_Condition;
	information = DIA_BaalNamib_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_BaalNamib_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalNamib_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 					NICHT ansprechbar (Ungläubiger)
// ************************************************************
// ************************************************************

instance DIA_BaalNamib_NoTalk(C_INFO)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_NoTalk_Condition;
	information = DIA_BaalNamib_NoTalk_Info;
	important = 1;
	permanent = 1;
};

func int DIA_BaalNamib_NoTalk_Condition()
{
	if (Npc_IsInState(self, ZS_TALK)
	&& (BaalNamib_Ansprechbar == FALSE)
	&& (Npc_GetPermAttitude(self, other) != ATT_FRIENDLY))
	{
		return 1;
	};

	return 0;
};

func void DIA_BaalNamib_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalNamib_NoTalk);
	Info_AddChoice(DIA_BaalNamib_NoTalk, DIALOG_ENDE, DIA_BaalNamib_NoTalk_ENDE);
//	Info_AddChoice (DIA_BaalNamib_NoTalk,"Is everything alright, pal?",DIA_BaalNamib_NoTalk_Imp);
//	Info_AddChoice (DIA_BaalNamib_NoTalk,"Alles, klar, Alter?",DIA_BaalNamib_NoTalk_Imp);
	Info_AddChoice(DIA_BaalNamib_NoTalk, "Je všechno v pořádku, příteli?", DIA_BaalNamib_NoTalk_Imp);
//	Info_AddChoice (DIA_BaalNamib_NoTalk,"The Sleeper be with you!",DIA_BaalNamib_NoTalk_Sleeper);
//	Info_AddChoice (DIA_BaalNamib_NoTalk,"Der Schläfer sei mit dir!",DIA_BaalNamib_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalNamib_NoTalk, "Spáč buď s tebou!", DIA_BaalNamib_NoTalk_Sleeper);
//	Info_AddChoice (DIA_BaalNamib_NoTalk,"Hi! I'm new here!",DIA_BaalNamib_NoTalk_Hi);
//	Info_AddChoice (DIA_BaalNamib_NoTalk,"Hi! Ich bin neu hier!",DIA_BaalNamib_NoTalk_Hi);
	Info_AddChoice(DIA_BaalNamib_NoTalk, "Zdar! Jsem tu nový!", DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
//	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00"); //Hi! I'm new here!
//	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00"); //Hi! Ich bin neu hier!
	AI_Output(other, self, "DIA_BaalNamib_NoTalk_Hi_15_00"); //Zdar! Jsem tu nový!
//	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01"); //(sigh)
	AI_Output(self, other, "DIA_BaalNamib_NoTalk_Hi_02_01"); //(vzdech)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
//	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00"); //The Sleeper be with you!
//	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00"); //Der Schläfer sei mit dir!
	AI_Output(other, self, "DIA_BaalNamib_NoTalk_Sleeper_15_00"); //Spáč buď s tebou!
//	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01"); //(sigh)
	AI_Output(self, other, "DIA_BaalNamib_NoTalk_Sleeper_02_01"); //(vzdech)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
//	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00"); //Is everything alright, pal?
//	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00"); //Alles, klar, Alter?
	AI_Output(other, self, "DIA_BaalNamib_NoTalk_Imp_15_00"); //Je všechno v pořádku, příteli?
//	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01"); //(sigh)
	AI_Output(self, other, "DIA_BaalNamib_NoTalk_Imp_02_01"); //(vzdech)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 					BN spricht dich an
// ************************************************************

instance DIA_BaalNamib_FirstTalk(C_INFO)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_FirstTalk_Condition;
	information = DIA_BaalNamib_FirstTalk_Info;
	important = 1;
	permanent = 0;
};

func int DIA_BaalNamib_FirstTalk_Condition()
{
	if (BaalNamib_Ansprechbar == TRUE)
	{
		return 1;
	};

	return 0;
};

func void DIA_BaalNamib_FirstTalk_Info()
{
//	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_00"); //(sigh)
	AI_Output(self, other, "DIA_BaalNamib_FirstTalk_02_00"); //(vzdech)
//	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_01"); //The Sleeper has chosen you. Do you really want to join us?
//	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_01"); //Der Schläfer hat dich erwählt. Ist es dir wirklich ernst mit deinem Wunsch, uns beizutreten?
	AI_Output(self, other, "DIA_BaalNamib_FirstTalk_02_01"); //Spáč si tě vyvolil. Chceš se k nám opravdu přidat?

	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
//	Info_AddChoice(DIA_BaalNamib_FirstTalk,"SAY NOTHING",DIA_BaalNamib_FirstTalk_Mute);
//	Info_AddChoice(DIA_BaalNamib_FirstTalk,"NICHTS SAGEN",DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice(DIA_BaalNamib_FirstTalk, "NIC NEŘÍKEJ", DIA_BaalNamib_FirstTalk_Mute);
//	Info_AddChoice(DIA_BaalNamib_FirstTalk,"Yes, I wish to follow the Sleeper!",DIA_BaalNamib_FirstTalk_Sleeper);
//	Info_AddChoice(DIA_BaalNamib_FirstTalk,"Ja, ich will den Weg des Schläfers beschreiten!",DIA_BaalNamib_FirstTalk_Sleeper);
	Info_AddChoice(DIA_BaalNamib_FirstTalk, "Ano, chci následovat Spáče!", DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
//	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Mute_15_00"); //
	AI_Output(other, self, "DIA_BaalNamib_FirstTalk_Mute_15_00"); //(vzdech)
//	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Mute_02_01"); //Well?
//	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Mute_02_01"); //Nun?
	AI_Output(self, other, "DIA_BaalNamib_FirstTalk_Mute_02_01"); //Všechno v pořádku?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
//	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00"); //Yes, I wish to follow the Sleeper!
//	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00"); //Ja, ich will den Weg des Schläfers beschreiten!
	AI_Output(other, self, "DIA_BaalNamib_FirstTalk_Sleeper_15_00"); //Ano, chci následovat cestu Spáče!
//	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01"); //Go to Cor Kalom. Tell him I sent you because you are a true supporter of the faith!
//	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01"); //Geh zu Cor Kalom. Sag ihm, ich schicke ihm einen wahren Anhänger des Glaubens!
	AI_Output(self, other, "DIA_BaalNamib_FirstTalk_Sleeper_02_01"); //Jdi za Cor Kalomem. Řekni mu, že jsem tě vyslal, protože jsi opravdový služebník víry!
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);

//	B_LogEntry(CH1_JoinPsi,"Lester's acting bit has worked out. Baal Namib has spoken to me, and he's convinced that I'm now a true believer. Now I'm supposed to see the Guru Cor Kalom in his alchemy lab!");
//	B_LogEntry(CH1_JoinPsi,"Lester's Schauspiel hat funktioniert. Baal Namib hat mir mir gesprochen und ist überzeugt, dass ich nun ein wahrer Anhänger des Glaubens bin. Ich soll nun den Guru Cor Kalom in seinem Alchemielabor aufsuchen!");
	B_LogEntry(CH1_JoinPsi, "Lesterova scénka fungovala. Baal Namib se mnou promluvil a je přesvědčený, že jsem skutečně věřící. Nyní můžu jít navštívit guru Cor Kaloma do jeho alchymistické dílny!");
	B_GiveXP(XP_ImpressBaalNamib);
};

//-----------------------------------------------------
// BESSERE RÜSTUNG NOVIZEN
//-----------------------------------------------------
instance GUR_1204_BaalNamib_ARMOR(C_INFO)
{
	npc = GUR_1204_BaalNamib;
	condition = GUR_1204_BaalNamib_ARMOR_Condition;
	information = GUR_1204_BaalNamib_ARMOR_Info;
	important = 0;
	permanent = 1;
//	description = "I'd like to have better armor.";
//	description = "Ich möchte eine bessere Rüstung haben.";
	description = "Rád bych měl lepší zbroj.";
};

func int GUR_1204_BaalNamib_ARMOR_Condition()
{
	if ((Npc_GetTrueGuild(hero) == GIL_NOV)
	&& (!Npc_HasItems(hero, NOV_ARMOR_H)))
	{
		return 1;
	};

	return 0;
};

func void GUR_1204_BaalNamib_ARMOR_Info()
{
//	AI_Output(hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");//I'd like to have better armor.
//	AI_Output(hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");//Ich möchte eine bessere Rüstung haben.
	AI_Output(hero, self, "GUR_1204_BaalNamib_ARMOR_Info_15_01"); //Rád bych měl lepší zbroj.

	/*
	#Needs_attention - toto nedava zmysel - rucho novica mozes kupit az od 3.tej kapitoly, ale ked v 3.tej kapitole si uz davno templar ...
	Dal by som to od 1. kapitoly ... ak mas dost rudy
	*/
	if (Kapitel < 3)
	{
//		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");//The time has not yet come for you to wear the heavy armor of a novice.
//		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");//Es ist noch nicht an der Zeit für dich, die schwere Rüstung der Novizen zu tragen.
		AI_Output(self, other, "GUR_1204_BaalNamib_ARMOR_Info_02_02"); //Ještě nepřišel čas, abys oblékl těžkou zbroj novice.
	}
	else if (Npc_HasItems(hero, ItMinugget) < VALUE_NOV_ARMOR_H)
	{
//		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");//Come back as soon as you have enough ore.
//		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");//Komm wieder, wenn du genug Erz hast.
		AI_Output(self, other, "GUR_1204_BaalNamib_ARMOR_Info_02_03"); //Vrať se, až budeš mít dost rudy.
	}
	else
	{
//		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");//This armor protects your body, like the Sleeper protects your spirit!
//		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");//Diese Rüstung schützt deinen Körper, wie der Schläfer deinen Geist schützt!
		AI_Output(self, other, "GUR_1204_BaalNamib_ARMOR_Info_02_04"); //Tahle zbroj ochrání tvoje tělo, tak jako Spáč ochrání tvoji duši!
		CreateInvItem(self, NOV_ARMOR_H);
		B_GiveInvItems(self, hero, NOV_ARMOR_H, 1);
		B_GiveInvItems(hero, self, ItMinugget, VALUE_NOV_ARMOR_H);
	};
};

////////////////////////////////////////
////////////////////////////////////////
/////////		Kap 2 ////////
////////////////////////////////////////
////////////////////////////////////////

// **************************************************************************
//					BAAL NAMIB SCHICKT DEN SPIELER ZU YBERION
// **************************************************************************
instance Info_BaalNamib_BROTHERHOOD(C_INFO)
{
	npc = GUR_1204_BaalNamib;
	condition = Info_BaalNamib_BROTHERHOOD_Condition;
	information = Info_BaalNamib_BROTHERHOOD_Info;
	important = 0;
	permanent = 0;
//	description = "Are there any tasks I can do for the Brotherhood?";
//	description = "Gibt es Aufgaben, die ich für die Bruderschaft erledigen kann?";
	description = "Můžu pro Bratrstvo vykonat nějaké úkoly?";
};

func int Info_BaalNamib_BROTHERHOOD_Condition()
{
	//#Needs_Attention - tento dialog nieje dostupny - asi kvoli tomu, ze to presunuli na Lestera :thinking:
	//v ceskych skriptoch od Milhausa je dialog zapnuty - ale teoreticky moze sposobit problemy - lebo meni rutinu Cor Kalomovi (po odchode z tabora ho moze vratit)
	//nechame vypnuty, alebo zapneme a osetrime? (dialog nic extra neponuka :sad: )
//	return (kapitel == 2) ;
};

func void Info_BaalNamib_BROTHERHOOD_Info()
{
//	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_15_01"); //Are there any tasks I can do for the Brotherhood?
//	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_15_01"); //Gibt es Aufgaben, die ich für die Bruderschaft erledigen kann?
	AI_Output(other, self, "Info_BaalNamib_BROTHERHOOD_15_01"); //Můžu pro Bratrstvo vykonat nějaké úkoly?
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_02_02"); //Our master, the wise Y'Berion, has sent for a novice. Since you're a member of the community now, go to him and offer your services.
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_02_02"); //Unser Meister, der weise Y'Berion, schickt nach einem Novizen. Nun, da du ein Bruder der Gemeinschaft geworden bist, geh zu ihm und biete ihm deine Hilfe an.
	AI_Output(self, other, "Info_BaalNamib_BROTHERHOOD_02_02"); //Náš mistr, moudrý Y'Berion, nechal poslat pro novice. Protože jsi nyní členem komunity, jdi za ním a nabídni mu své služby.
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
//	Info_AddChoice (Info_BaalNamib_BROTHERHOOD,"Alright, I'll go to see him now.",Info_BaalNamib_BROTHERHOOD_OK);
//	Info_AddChoice (Info_BaalNamib_BROTHERHOOD,"In Ordnung, ich werde ihn sofort aufsuchen",Info_BaalNamib_BROTHERHOOD_OK);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD, "Dobrá, půjdu za ním hned.", Info_BaalNamib_BROTHERHOOD_OK);
//	Info_AddChoice (Info_BaalNamib_BROTHERHOOD,"Where can I find Y'Berion?",Info_BaalNamib_BROTHERHOOD_YBWO);
//	Info_AddChoice (Info_BaalNamib_BROTHERHOOD,"Wo finde ich Y'Berion?",Info_BaalNamib_BROTHERHOOD_YBWO);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD, "Kde najdu Y'Beriona?", Info_BaalNamib_BROTHERHOOD_YBWO);
//	Info_AddChoice (Info_BaalNamib_BROTHERHOOD,"Do you know what Y'Berion wants me to do?",Info_BaalNamib_BROTHERHOOD_YBWAS);
//	Info_AddChoice (Info_BaalNamib_BROTHERHOOD,"Weißt du, was ich für Y'berion erledigen soll?",Info_BaalNamib_BROTHERHOOD_YBWAS);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD, "Víš, co ode mě Y'Berion chce?", Info_BaalNamib_BROTHERHOOD_YBWAS);
	var C_Npc Kalom;
	Kalom = Hlp_GetNpc(GUR_1201_CORKALOM);
	Npc_ExchangeRoutine(Kalom, "kapitel2");
	AI_ContinueRoutine(Kalom);
};

func void Info_BaalNamib_BROTHERHOOD_YBWO()
{
//	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01"); //Where can I find Y'Berion?
//	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01"); //Wo finde ich Y'Berion?
	AI_Output(other, self, "Info_BaalNamib_BROTHERHOOD_YBWO_15_01"); //Kde najdu Y'Beriona?
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02"); //He's inside the temple hill. As always.
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02"); //Er hält sich im Inneren des Tempelbergs auf. Wie immer.
	AI_Output(self, other, "Info_BaalNamib_BROTHERHOOD_YBWO_02_02"); //Je v chrámu, jako vždy.
};

func void Info_BaalNamib_BROTHERHOOD_YBWAS()
{
//	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01"); //Do you know what Y'Berion wants me to do?
//	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01"); //Weißt du, was ich für Y'Berion erledigen soll?
	AI_Output(other, self, "Info_BaalNamib_BROTHERHOOD_YBWAS_15_01"); //Víš, co ode mě Y'Berion chce?
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02"); //A great invocation will be taking place. But for it to begin, we need a magical object.
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02"); //Eine große Beschwörung wird stattfinden. Allerdings brauchen wir dafür einen magischen Gegenstand.
	AI_Output(self, other, "Info_BaalNamib_BROTHERHOOD_YBWAS_02_02"); //Bude se konat velké vzývání. Aby ale mohlo začít, potřebujeme jeden magický předmět.
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03"); //Y'Berion is looking for men brave enough to get him the artifact.
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03"); //Y'Berion sucht Männer, die mutig genug sind, ihm dieses Artefakt zu bringen.
	AI_Output(self, other, "Info_BaalNamib_BROTHERHOOD_YBWAS_02_03"); //Y'Berion hledá odvážné muže, kteří by mu ten artefakt opatřili.
//	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04"); //Sounds easy.
//	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04"); //Klingt einfach.
	AI_Output(other, self, "Info_BaalNamib_BROTHERHOOD_YBWAS_15_04"); //To zní jako snadný úkol.
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05"); //if it were easy, we'd already have the object. Talk to Y'Berion first. He'll explain it to you.
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05"); //Wenn es einfach wäre, hätten wir den Gegenstand schon. Sprich erst mal mit Y'Berion. Er wird dir alles erklären.
	AI_Output(self, other, "Info_BaalNamib_BROTHERHOOD_YBWAS_02_05"); //Kdyby to bylo snadné, už bychom ten předmět měli. Promluv si nejdříve s Y'Berionem. Všechno ti vysvětlí.
};

func void Info_BaalNamib_BROTHERHOOD_OK()
{
//	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_OK_15_01"); //Okay, I'll call on him right away.
//	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_OK_15_01"); //In Ordnung, ich werde ihn sofort aufsuchen.
	AI_Output(other, self, "Info_BaalNamib_BROTHERHOOD_OK_15_01"); //Dobrá, hned mu řeknu.
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_OK_02_02"); //May the Sleeper protect you.
//	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_OK_02_02"); //Möge der Schläfer dich beschützen
	AI_Output(self, other, "Info_BaalNamib_BROTHERHOOD_OK_02_02"); //Kéž tě Spáč ochrání!
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
};
