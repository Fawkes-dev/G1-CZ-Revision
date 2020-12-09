// ************************************************************
// 							EXIT 
// ************************************************************
instance Info_BaalLukor_EXIT(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	nr = 999;
	condition = Info_BaalLukor_EXIT_Condition;
	information = Info_BaalLukor_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Info_BaalLukor_EXIT_Condition()
{
	return 1;
};

func void Info_BaalLukor_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

//**************************************************************************
//	Info MEET: Erstes Zusammentreffen mit Baal Lukor
//**************************************************************************
instance Info_BaalLukor_MEET(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_MEET_Condition;
	information = Info_BaalLukor_MEET_Info;
	permanent = 0;
	important = 1;
};

func int Info_BaalLukor_MEET_Condition()
{
	return TRUE;
};

func void Info_BaalLukor_MEET_Info()
{
//	AI_Output(self,other,"Info_BaalLukor_MEET_13_01"); //Thanks for your help. You really arrived in the last moment.
//	AI_Output(self,other,"Info_BaalLukor_MEET_13_01"); //Danke für deine Hilfe. Du bist wirklich in letzter Sekunde gekommen.
	AI_Output(self,other,"Info_BaalLukor_MEET_13_01"); //Díky za tvojí pomoc. Přišel jsi opravdu v poslední chvíli.

	B_GiveXP(XP_SaveBaalLukor);
};

//**************************************************************************
//	Info DEAD
//**************************************************************************
instance Info_BaalLukor_DEAD(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_DEAD_Condition;
	information = Info_BaalLukor_DEAD_Info;
	nr = 20;
	permanent = 0;
	important = 0;
//	description = "I came across some dead templars on the way here!";
//	description = "Ich habe tote Templer auf dem Weg hierher gefunden!";
	description = "Na cestě sem jsem viděl několik mrtvých templářů. Co se přihodilo?";
};

func int Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

func void Info_BaalLukor_DEAD_Info()
{
//	AI_Output(other,self,"Info_BaalLukor_DEAD_15_01"); //I came across some dead templars on the way here! What happened?
//	AI_Output(other,self,"Info_BaalLukor_DEAD_15_01"); //Ich habe tote Templer auf dem Weg hierher gefunden! Was ist passiert?
	AI_Output(other,self,"Info_BaalLukor_DEAD_15_01"); //Na cestě sem jsem viděl několik mrtvých templářů. Co se přihodilo?
//	AI_Output(self,other,"Info_BaalLukor_DEAD_13_02"); //Master Cor Angar sent us here to investigate the caves.
//	AI_Output(self,other,"Info_BaalLukor_DEAD_13_02"); //Meister Cor Angar hat uns hierhin entsandt, um die Höhlen zu erforschen.
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_02"); //Mistr Cor Angar nás sem vyslal na prohlídku jeskyní.
//	AI_Output(self,other,"Info_BaalLukor_DEAD_13_03"); //We expected to find nothing but stuffy graves and half decomposed mummies.
//	AI_Output(self,other,"Info_BaalLukor_DEAD_13_03"); //Wir hatte nichts als muffige Grabnischen und halbzerfallene Mumien erwartet.
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_03"); //Očekávali jsme, že najdeme pár zatuchlých hrobů a polorozpadlé mumie.
//	AI_Output(self,other,"Info_BaalLukor_DEAD_13_04"); //Suddenly the darkness shifted and there were Orcs everywhere. I don't know what they're looking for here, but their appearing here is more than unusual!
//	AI_Output(self,other,"Info_BaalLukor_DEAD_13_04"); //Dann plötzlich bewegte sich die Dunkelheit und überall waren Orks. Ich weiß nicht, was sie hier suchen, aber ihr Auftauchen hier ist mehr als ungewöhnlich!
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_04"); //Najednou se setmělo a všude byli skřeti. Nevím co tady hledali, ale jejich přítomnost v těchto místech je víc než neobvyklá!
//	AI_Output(other,self,"Info_BaalLukor_DEAD_15_05"); //Where are the other templars?
//	AI_Output(other,self,"Info_BaalLukor_DEAD_15_05"); //Wo sind die anderen Templer?
	AI_Output(other,self,"Info_BaalLukor_DEAD_15_05"); //Kde jsou ostatní templáři?
//	AI_Output(self,other,"Info_BaalLukor_DEAD_13_06"); //Dead! I unwittingly led them to their destruction. I hope the Sleeper will pardon me.
//	AI_Output(self,other,"Info_BaalLukor_DEAD_13_06"); //Tot! Ich habe sie unwissend ins Verderben geführt. Ich hoffe, der Schläfer wird mir das verzeihen.
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_06"); //Mrtví! Nevědomky jsem je přivedl do záhuby. Snad mi to Spáč promine.

//	B_LogEntry(CH3_OrcGraveyard,"I saved Guru Baal Lukor's life in the Orc cemetery during an attack by Orcs. All his templars died in fights with these ugly creatures.");
//	B_LogEntry(CH3_OrcGraveyard,"Ich habe den Guru Baal Lukor im Ork-Friedhof vor einer Attacke von Orks gerettet. Alle seine Templer sind bei Kämpfen mit diesen häßlichen Kreaturen umgekommen.");
	B_LogEntry(CH3_OrcGraveyard,"Při útoku skřetů  na skřetím hřbitově jsem zachránil guru Baalu Lukorovi život. Všichni templáři v boji s hroznými netvory zahynuli.");
};

//**************************************************************************
//	Info SUMMONING
//**************************************************************************
instance Info_BaalLukor_SUMMONING(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_SUMMONING_Condition;
	information = Info_BaalLukor_SUMMONING_Info;
	nr = 10;
	permanent = 0;
	important = 0;
//	description = "Cor Angar sent me!";
//	description = "Cor Angar schickt mich!";
	description = "Cor Angar mě vyslal!";
};

func int Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

func void Info_BaalLukor_SUMMONING_Info()
{
//	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_01"); //Cor Angar sent me! Have you found any sign of the Sleeper?
//	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_01"); //Cor Angar schickt mich! Habt ihr irgendein Zeichen des Schläfers gefunden?
	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_01"); //Cor Angar mě vyslal! Našli jste nějaké Spáčovo znamení?
//	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_02"); //Not so far. But what about Y'Berion? Has he come to yet?
//	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_02"); //Bisher noch nicht. Aber was ist mit Y'Berion? Ist er wieder zu sich gekommen?
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_02"); //Zatím ne. Ale co Y´Berion? Už procitnul?
//	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_03"); //No, he's still unconscious.
//	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_03"); //Nein, er ist immer noch ohnmächtig.
	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_03"); //Ne, je pořád v bezvědomí.
//	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_04"); //We need to solve the riddle of these caves. After all these dreadful losses, I can't go back to the community empty-handed.
//	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_04"); //Wir müssen dem Rätsel dieser Höhlen auf den Grund gehen. Nach all den schrecklichen Verlusten kann ich nicht mit leeren Händen zur Gemeinschaft zurückkehren.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_04"); //Potřebujeme vyřešit hádanku těch jeskyní. Po všech těch hrozných ztrátách se nemůžu do komunity vrátit s prázdnýma rukama.
//	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_05"); //But my fighting skills are limited and the Orcs don't react to my magic spells like the gullible people in the Old Camp do.
//	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_05"); //Doch meine Kampfkünste sind sehr begrenzt und die Orks sprechen nicht auf meine magischen Kräfte an, so wie es die leichtgläubigen Menschen aus dem Alten Lager tun.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_05"); //Moje bojové umění je omezené a skřeti nejsou vnímaví na moje magická zaříkávadla jako ti lehkověrní lidé ze Starého tábora.
//	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_06"); //If our Brotherhood sent you, maybe you could help me with the further investigation of this tomb.
//	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_06"); //Wenn dich schon unsere Bruderschaft schickt, vielleicht könntest du mir bei der restlichen Erforschung dieser Gruft helfen.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_06"); //Jestliže tě vyslalo naše Bratrstvo, snad bys mi mohl pomoci s dalším pátráním v téhle hrobce.
};

//**************************************************************************
//	Info HELP
//**************************************************************************
instance Info_BaalLukor_HELP(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_HELP_Condition;
	information = Info_BaalLukor_HELP_Info;
	permanent = 0;
	important = 0;
//	description = "I'll help you.";
//	description = "Ich werde dir helfen";
	description = "Pomůžu ti.";
};

func int Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero,Info_BaalLukor_SUMMONING);
};

func void Info_BaalLukor_HELP_Info()
{
//	AI_Output(other,self,"Info_BaalLukor_HELP_15_01"); //I'll help you.
//	AI_Output(other,self,"Info_BaalLukor_HELP_15_01"); //Ich werde dir helfen.
	AI_Output(other,self,"Info_BaalLukor_HELP_15_01"); //Pomůžu ti.
//	AI_Output(self,other,"Info_BaalLukor_HELP_13_02"); //Good. Excellent. There are three tunnels leading out of this hall. We should search 'em all.
//	AI_Output(self,other,"Info_BaalLukor_HELP_13_02"); //Gut. Sehr gut. Aus dieser Halle führen drei Stollen. Wir sollten sie alle durchsuchen.
	AI_Output(self,other,"Info_BaalLukor_HELP_13_02"); //Dobře. Skvěle. Z tohoto sálu vedou tři tunely. Měli bysme je všechny prozkoumat.
//	AI_Output(self,other,"Info_BaalLukor_HELP_13_03"); //Go ahead. I'll follow you!
//	AI_Output(self,other,"Info_BaalLukor_HELP_13_03"); //Geh voraus. Ich folge dir!
	AI_Output(self,other,"Info_BaalLukor_HELP_13_03"); //Jdi napřed. Půjdu za tebou!

//	B_LogEntry(CH3_OrcGraveyard,"Baal Lukor has joined me, together we'll solve the secret of this old place!");
//	B_LogEntry(CH3_OrcGraveyard,"Baal Lukor hat sich mir angeschlossen und gemeinsam werden wir nun dem Geheimnis dieser alten Kultstätte auf den Grund gehen!");
	B_LogEntry(CH3_OrcGraveyard,"Baal Lukor mě vzal s sebou, abychom společně vyřešili tajemství tohoto starého místa!");

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

//**************************************************************************
//	Info FOUNDNONE
//**************************************************************************
instance Info_BaalLukor_FOUNDNONE(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_FOUNDNONE_Condition;
	information = Info_BaalLukor_FOUNDNONE_Info;
	permanent = 1;
	important = 0;
//	description = "I can't find a thing!";
//	description = "Ich kann keinen Hinweis finden!";
	description = "Nedokážu se tu orientovat!";
};

func int Info_BaalLukor_FOUNDNONE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_HELP)
	&& (BaalLukor_BringParchment == 0)
	&& !Npc_HasItems(hero,OrkParchmentOne)
	&& !Npc_HasItems(hero,OrkParchmentTwo))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_FOUNDNONE_Info()
{
//	AI_Output(other,self,"Info_BaalLukor_FOUNDNONE_15_01"); //I can't find a thing!
//	AI_Output(other,self,"Info_BaalLukor_FOUNDNONE_15_01"); //Ich kann keinen Hinweis finden!
	AI_Output(other,self,"Info_BaalLukor_FOUNDNONE_15_01"); //Nedokážu se tu orientovat!
//	AI_Output(self,other,"Info_BaalLukor_FOUNDNONE_13_02"); //We'll need to search the three tunnels.
//	AI_Output(self,other,"Info_BaalLukor_FOUNDNONE_13_02"); //Wir müssen die drei Stollen durchsuchen.
	AI_Output(self,other,"Info_BaalLukor_FOUNDNONE_13_02"); //Musíme prozkoumat ty tři tunely.

	Npc_ExchangeRoutine(self,"Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info FOUNDONE
//**************************************************************************
instance Info_BaalLukor_FOUNDONE(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_FOUNDONE_Condition;
	information = Info_BaalLukor_FOUNDONE_Info;
	permanent = 1;
	important = 0;
//	description = "Apparently there is no other half to the parchment!";
//	description = "Es scheint hier keine andere Pergamenthälfte zu geben!";
	description = "Zřejmě už neexistuje druhá polovina pergamenu!";
};

func int Info_BaalLukor_FOUNDONE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_HELP)
	&& (((BaalLukor_BringParchment==1) && !Npc_HasItems(hero,OrkParchmentTwo)) || ((BaalLukor_BringParchment==2) && !Npc_HasItems(hero,OrkParchmentOne))))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_FOUNDONE_Info()
{
//	AI_Output(other,self,"Info_BaalLukor_FOUNDONE_15_01"); //Apparently there is no other half to the parchment!
//	AI_Output(other,self,"Info_BaalLukor_FOUNDONE_15_01"); //Es scheint hier keine andere Pergamenthälfte zu geben!
	AI_Output(other,self,"Info_BaalLukor_FOUNDONE_15_01"); //Zřejmě už neexistuje druhá polovina pergamenu!
//	AI_Output(self,other,"Info_BaalLukor_FOUNDONE_13_02"); //There must be a second half. We should search all three tunnels!
//	AI_Output(self,other,"Info_BaalLukor_FOUNDONE_13_02"); //Es muss eine zweite Hälfte geben. Wir sollten alle drei Stollen gründlich durchsuchen!
	AI_Output(self,other,"Info_BaalLukor_FOUNDONE_13_02"); //Musí být druhá polovina. Měli bysme prohledat všechny tři tunely!

	Npc_ExchangeRoutine(self,"Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info FIRSTWAIT
//**************************************************************************
instance Info_BaalLukor_FIRSTWAIT(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_FIRSTWAIT_Condition;
	information = Info_BaalLukor_FIRSTWAIT_Info;
	permanent = 0;
	important = 1;
};

func int Info_BaalLukor_FIRSTWAIT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_HELP)
	&& (Npc_GetDistToWP(self,"GRYD_040")<500))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_FIRSTWAIT_Info()
{
	B_FullStop(hero);
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_BaalLukor_FIRSTWAIT_13_01"); //We can't go on here! Maybe these niches bear hints.
//	AI_Output(self,other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Hier geht es nicht weiter! Vielleicht bergen die Nischen hier Hinweise.
	AI_Output(self,other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Tudy nemůžeme pokračovat! Možná tyhle výklenky značí cestu.

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInSideTunnelOne");
};

//**************************************************************************
//	Info FIRSTSCROLL
//**************************************************************************
instance Info_BaalLukor_FIRSTSCROLL(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_FIRSTSCROLL_Condition;
	information = Info_BaalLukor_FIRSTSCROLL_Info;
	permanent = 0;
	important = 0;
//	description = "I've found a piece of parchment!";
//	description = "Ich habe dieses Stück Pergament hier gefunden!";
	description = "Našel jsem kus pergamenu!";
};

func int Info_BaalLukor_FIRSTSCROLL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_HELP)
	&& Npc_HasItems(hero,OrkParchmentOne))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_FIRSTSCROLL_Info()
{
//	AI_Output(other,self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //I've found a piece of parchment!
//	AI_Output(other,self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //Ich habe dieses Stück Pergament hier gefunden!
	AI_Output(other,self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //Našel jsem kus pergamenu!
	B_GiveInvItems(hero,self,OrkParchmentOne,1); //Pergament1 übergeben
	if (BaalLukor_BringParchment == 2)
	{
//		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Very good! It's the other half of the Orcish spell scroll.
//		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Sehr gut! Dies ist die andere Hälfte der orkischen Spruchrolle.
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Výborně! To je druhá polovina Skřetího kouzelného zaříkávadla.
		BaalLukor_BringParchment = 3;
	}
	else
	{
//		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //It looks like an Orcish spell scroll, but it's been torn in two.
//		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //Das sieht aus wie eine orkische Zauberspruchrolle, aber sie ist mittendurch gerissen.
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //Vypadá to jako Skřetí kouzelné zaříkávadlo, ale je to roztržené vejpůl.
//		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //There must be another half somewhere.
//		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //Es muss noch eine andere Hälfte davon geben.
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //Někde tu musí být druhá polovina.
		AI_StopProcessInfos(self);
		BaalLukor_BringParchment = 1;
	};

	Npc_ExchangeRoutine(self,"Follow");
};

//**************************************************************************
//	Info SECONDWAIT
//**************************************************************************
instance Info_BaalLukor_SECONDWAIT(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_SECONDWAIT_Condition;
	information = Info_BaalLukor_SECONDWAIT_Info;
	permanent = 0;
	important = 1;
};

func int Info_BaalLukor_SECONDWAIT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_HELP)
	&& (Npc_GetDistToWP(self,"GRYD_047")<500))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_SECONDWAIT_Info()
{
	B_FullStop(hero);
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hmmm... this tunnel leads to a dead end! Maybe you'll find some clues here that'll help us further.
//	AI_Output(self,other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hmmm ... Dieser Stollen ist eine Sackgasse! Vielleicht findest du hier irgendwelche Hinweise, die uns weiterhelfen.
	AI_Output(self,other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hmmm... tenhle tunel je slepý! Ale možná tu najdeme nějaké znamení, které nám pomůže dál.

	if (!Npc_HasItems(hero,OrkParchmentTwo)) 
	{ 
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"WaitInSideTunnelTwo");
	};
};

//**************************************************************************
//	Info SECONDSCROLL
//**************************************************************************
instance Info_BaalLukor_SECONDSCROLL(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_SECONDSCROLL_Condition;
	information = Info_BaalLukor_SECONDSCROLL_Info;
	permanent = 0;
//	description = "There is a torn piece of parchment here!";
	description = "Tady je roztržený kus pergamenu!";
};

func int Info_BaalLukor_SECONDSCROLL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_HELP)
	&& Npc_HasItems(hero,OrkParchmentTwo))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_SECONDSCROLL_Info()
{
	B_FullStop(hero);
	AI_GotoNpc(self,hero);

//	AI_Output(other,self,"Info_BaalLukor_SECONDSCROLL_15_01"); //There is a torn piece of parchment here!
//	AI_Output(other,self,"Info_BaalLukor_SECONDSCROLL_15_01"); //Hier ist ein zerrissenes Stück Pergament!
	AI_Output(other,self,"Info_BaalLukor_SECONDSCROLL_15_01"); //Tady je roztržený kus pergamenu!
	B_GiveInvItems(hero,self,OrkParchmentTwo,1); //Pergament2 übergeben
	if (BaalLukor_BringParchment == 1)
	{
//		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Very good! It's the other half of the Orcish spell scroll.
//		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Sehr gut! Dies ist die andere Hälfte der orkischen Spruchrolle.
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Výborně! To je druhá polovina Skřetího kouzelného zaříkávadla.
		BaalLukor_BringParchment = 3;
	}
	else
	{
//		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_03"); //It looks like an Orcish spell scroll, but it's been torn in two.
//		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_03"); //Das sieht aus wie eine orkische Zauberspruchrolle, aber sie ist mittendurch gerissen.
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_03"); //Vypadá to jako Skřetí kouzelné zaříkávadlo, ale je to roztržené vejpůl.
//		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_04"); //There must be another half somewhere.
//		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_04"); //Es muss noch eine andere Hälfte davon geben.
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_04"); //Někde tu musí být druhá polovina.
		AI_StopProcessInfos(self);
		BaalLukor_BringParchment = 2;
	};

	Npc_ExchangeRoutine(self,"Follow");
};

//**************************************************************************
//	Info BOTHSCROLLS
//**************************************************************************
instance Info_BaalLukor_BOTHSCROLLS(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_BOTHSCROLLS_Condition;
	information = Info_BaalLukor_BOTHSCROLLS_Info;
	permanent = 0;
	important = 0;
//	description = "What do we do with the two pieces now?";
//	description = "Was fangen wir jetzt mit den beiden Stücken an?";
	description = "Co teď s těma dvěma kusy uděláme?";
};

func int Info_BaalLukor_BOTHSCROLLS_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_HELP)
	&& (BaalLukor_BringParchment == 3))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_BOTHSCROLLS_Info()
{
//	AI_Output(other,self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //What do we do with the two pieces now?
//	AI_Output(other,self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //Was fangen wir jetzt mit diesen beiden Stücken an?
	AI_Output(other,self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //Co teď s těmi dvěma kusy uděláme?
//	AI_Output(self,other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //The two halves match. But I can't translate these Orcish signs.
//	AI_Output(self,other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //Die beiden Hälften passen zusammen. Doch ich kann die orkischen Zeichen nicht übersetzen.
	AI_Output(self,other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //Obě půlky k sobě sedí. Neumím ale přeložit ty skřetí znaky.

//	B_LogEntry(CH3_OrcGraveyard,"We've found two halves of an Orcish spell scroll, but Baal Lukor can't translate it. We'll carry on searching.");
//	B_LogEntry(CH3_OrcGraveyard,"Wir haben zwei Hälften einer orkischen Zauberspruchrolle gefunden, doch Baal Lukor kann sie nicht übersetzen. Wir werden weitersuchen.");
	B_LogEntry(CH3_OrcGraveyard,"Našli jsme dvě poloviny skřetího svitku, ale Baal Lukor je nedokázal rozluštit. Budeme pokračovat v pátrání.");

	Npc_ExchangeRoutine(self,"Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info RUNES
//**************************************************************************
instance Info_BaalLukor_RUNES(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_RUNES_Condition;
	information = Info_BaalLukor_RUNES_Info;
	permanent = 0;
	important = 1;
};

func int Info_BaalLukor_RUNES_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_BOTHSCROLLS)
	&& ((Npc_GetDistToWP(hero,"GRYD_025")<600) || (Npc_GetDistToWP(hero,"GRYD_048")<600)))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_RUNES_Info()
{
	B_FullStop(hero);
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_BaalLukor_RUNES_13_01"); //Hang on! This is interesting...
//	AI_Output(self,other,"Info_BaalLukor_RUNES_13_01"); //Warte mal! Das ist interessant ...
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_01"); //Počkej! To je zajímavé...
//	AI_Output(other,self,"Info_BaalLukor_RUNES_15_02"); //Well, I can't find anything interesting in this place.
//	AI_Output(other,self,"Info_BaalLukor_RUNES_15_02"); //Also ich kann diesem Ort beim besten Willen nichts Interessantes abgewinnen.
	AI_Output(other,self,"Info_BaalLukor_RUNES_15_02"); //Dobrá, nic zajímavého tady nevidím.
//	AI_Output(self,other,"Info_BaalLukor_RUNES_13_03"); //Be silent and take a look at the ornamental runes in this cave.
//	AI_Output(self,other,"Info_BaalLukor_RUNES_13_03"); //Schweig und betrachte die Runenornamente in dieser Höhle hier.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_03"); //Buď ticho a dívej se na ty ozdobné runy v jeskyni.
//	AI_Output(self,other,"Info_BaalLukor_RUNES_13_04"); //Yeah, these should suffice to translate the two halves of the parchment.
//	AI_Output(self,other,"Info_BaalLukor_RUNES_13_04"); //Das sollte ausreichend Material geben, um die geteilten Pergamenthälften zu übersetzen.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_04"); //To by mělo postačit k překladu těch dvou půlek pergamenu.
	B_UseFakeScroll();
	//AI_Output(self,other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
//	AI_Output(self,other,"Info_BaalLukor_RUNES_13_06"); //I have it! It's a teleportation spell. It seems that it can only unfold its powers in a certain place.
//	AI_Output(self,other,"Info_BaalLukor_RUNES_13_06"); //Das ist es! Es handelt sich um einen Teleportzauber. Er scheint aber nur an einem gewissen Ort seine Kraft entfalten zu können.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_06"); //Mám to! Je to zaříkávadlo pro přenos. Zdá se, že jeho sílu jde využít pouze na určitém místě!
//	AI_Output(self,other,"Info_BaalLukor_RUNES_13_07"); //Strange!
//	AI_Output(self,other,"Info_BaalLukor_RUNES_13_07"); //Seltsam!
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_07"); //Divné!

	Npc_RemoveInvItems(self,OrkParchmentOne,1); //Pergament 1 entfernen
	Npc_RemoveInvItems(self,OrkParchmentTwo,1); //Pergament 2 entfernen
	//Hier Teleport-Übergabe entfernt --> erst wenn vor wand!

//	B_LogEntry(CH3_OrcGraveyard,"With the aid of wall inscriptions in one of the halls, Baal Lukor was able to translate the scroll. Seems it's a teleportation spell for a very short distance."); 
//	B_LogEntry(CH3_OrcGraveyard,"Mit Hilfe orkischer Wandinschriften in einer der Hallen konnte Baal Lukor die Spruchrolle übersetzen. Es handelt sich um einen Teleportationszauber, der wohl nur über sehr kurze Distanz wirkt."); 
	B_LogEntry(CH3_OrcGraveyard,"S pomocí nástěnných nápisů v jednom ze sálů se Baalovi Lukorovi podařilo rozluštit ten svitek. Vypadá jako teleportační kouzlo pro malé vzdálenosti."); 

	Npc_ExchangeRoutine(self,"Follow"); //Björn: Patch2

};

//**************************************************************************
//	Info WHATNOW
//**************************************************************************
instance Info_BaalLukor_WHATNOW(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_WHATNOW_Condition;
	information = Info_BaalLukor_WHATNOW_Info;
	permanent = 1;
	important = 0;
//	description = "What 'certain' place?";
//	description = "Was für ein 'gewisser' Ort!";
	description = "Na jakém 'určitém' místě?";
};

func int Info_BaalLukor_WHATNOW_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_RUNES)
	&& Npc_KnowsInfo(hero,Info_BaalLukor_HALLWITHOUT)
	&& !Npc_KnowsInfo(hero,Info_BaalLukor_HALLWITH))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_WHATNOW_Info()
{
//	AI_Output(other,self,"Info_BaalLukor_WHATNOW_15_01"); //What 'certain' place?
//	AI_Output(other,self,"Info_BaalLukor_WHATNOW_15_01"); //Was für ein 'gewisser' Ort!
	AI_Output(other,self,"Info_BaalLukor_WHATNOW_15_01"); //Na jakém 'určitém' místě?
//	AI_Output(self,other,"Info_BaalLukor_WHATNOW_13_02"); //The big hall we passed through earlier seemed a very... strange... place. Let's just go back there!
//	AI_Output(self,other,"Info_BaalLukor_WHATNOW_13_02"); //Die große Halle vorhin, kam mir sehr ... seltsam ... vor. Lass uns noch mal dorthin zurück!
	AI_Output(self,other,"Info_BaalLukor_WHATNOW_13_02"); //Velký sál, kterým jsme před chvíli prošli, se zdál jako velmi... zvláštní... místo. Pojďme se tam vrátit!

	Npc_ExchangeRoutine(self,"Follow"); //Björn: Patch2

};

//**************************************************************************
//	Info HALLWITHOUT
//**************************************************************************
instance Info_BaalLukor_HALLWITHOUT(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_HALLWITHOUT_Condition;
	information = Info_BaalLukor_HALLWITHOUT_Info;
	permanent = 0;
	important = 1;
};

func int Info_BaalLukor_HALLWITHOUT_Condition()
{
	if ( !Npc_KnowsInfo(hero,Info_BaalLukor_RUNES)
	&& (Npc_GetDistToWP(hero,"GRYD_055")<500))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_HALLWITHOUT_Info()
{
	B_FullStop(hero);
	AI_SetWalkmode(self,NPC_WALK);
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_01"); //This place... I can't explain it, but this place here...
//	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_01"); //Dieser Ort ... ich kann es nicht erklären, aber dieser Ort hier ...
	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_01"); //Tohle místo... Nedokážu to vysvětlit, ale tohle místo...
//	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Oh, forget it. Must have been my imagination.
//	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Ach vergiss es. Es ist bestimmt nur Einbildung.
	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Och, zapomeň na to. To jen ta moje představivost.

//	B_LogEntry(CH3_OrcGraveyard,"When we entered the big rectangular column hall, the Guru felt something. He wasn't so sure what it was, though.");
//	B_LogEntry(CH3_OrcGraveyard,"Als wir eine große rechteckige Säulenhalle betraten, fühlte der Guru irgendetwas. Er war sich allerdings nicht sicher was.");
	B_LogEntry(CH3_OrcGraveyard,"Když jsme vstoupili do velkého obdélníkového sálu se sloupovím, guru cosi pocítil. Nebyl si však jistý, co to bylo.");

	Npc_ExchangeRoutine(self,"Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info HALLWITH
//**************************************************************************
instance Info_BaalLukor_HALLWITH(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_HALLWITH_Condition;
	information = Info_BaalLukor_HALLWITH_Info;
	permanent = 0;
	important = 1;
};

func int Info_BaalLukor_HALLWITH_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_RUNES)
	&& Npc_GetDistToWP(hero,"GRYD_055")<500 )
	{
		return TRUE;
	};
};

func void Info_BaalLukor_HALLWITH_Info()
{
	B_FullStop(hero);
	AI_SetWalkmode(self,NPC_WALK);
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_01"); //This place has a special aura... the aura of the hidden.
//	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_01"); //Dieser Ort hat eine besondere Ausstrahlung ... Die Ausstrahlung des Verborgenen.
	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_01"); //Tohle místo má zvláštní auru... auru zmizení.
//	AI_Output(other,self,"Info_BaalLukor_HALLWITH_15_02"); //This hall reminds me of the image in the vision.
//	AI_Output(other,self,"Info_BaalLukor_HALLWITH_15_02"); //Diese Halle erinnert mich an das Bild aus der Vision.
	AI_Output(other,self,"Info_BaalLukor_HALLWITH_15_02"); //Tenhle sál mi připomíná obraz z té vidiny.
//	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_03"); //The vision... We're very close to our target...
//	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_03"); //Die Vision ... Wir sind unserem Ziel sehr nahe ...
	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_03"); //Ta vidina... Jsme velmi blízko u cíle...

//	B_LogEntry(CH3_OrcGraveyard,"Baal Lukor was led by an invisible power, he went straight to one of the walls in the big column hall.");
//	B_LogEntry(CH3_OrcGraveyard,"Baal Lukor wurde von einer unsichtbaren Kraft geleitet und lief zielstrebig auf eine der Wände in der großen Säulenhallte zu.");
	B_LogEntry(CH3_OrcGraveyard,"Baal Lukor byl veden neviditelnou silou, která mířila přímo k jedné ze stěn velkého sloupového sálu.");

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DOOR");
};

//**************************************************************************
//	Info DOOR
//**************************************************************************
instance Info_BaalLukor_DOOR(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_DOOR_Condition;
	information = Info_BaalLukor_DOOR_Info;
	permanent = 0;
	important = 1;
};

func int Info_BaalLukor_DOOR_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_HALLWITH)
	&& Npc_GetDistToWP(hero,"GRYD_060")<500 )
	{
		return TRUE;
	};
};

func void Info_BaalLukor_DOOR_Info()
{
	B_FullStop(hero);
	AI_SetWalkmode(self,NPC_WALK);
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_BaalLukor_DOOR_13_01"); //Behind this wall... that must be it!
//	AI_Output(self,other,"Info_BaalLukor_DOOR_13_01"); //Hinter dieser Wand ... Das muss es sein!
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_01"); //Za tou stěnou... to musí být!
//	AI_Output(self,other,"Info_BaalLukor_DOOR_13_02"); //My magic powers are still very weak.
//	AI_Output(self,other,"Info_BaalLukor_DOOR_13_02"); //Meine magische Kraft ist noch immer geschwächt.
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_02"); //Má kouzelná síla je pořád velmi slabá.
//	AI_Output(self,other,"Info_BaalLukor_DOOR_13_03"); //Use the Orcish teleportation spell here, in front of this wall.
//	AI_Output(self,other,"Info_BaalLukor_DOOR_13_03"); //Benutze den orkischen Teleportzauber hier vor dieser Wand.
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_03"); //Použij to skřetí zaříkávadlo pro přenos tady, naproti té stěně.

	CreateInvItem(self,ItArScrollTeleport4); //Teleport erschaffen
	B_GiveInvItems(self,hero,ItArScrollTeleport4,1); //Teleport übergeben

	AI_StopProcessInfos(self);
};

//**************************************************************************
//	Info TELEPORT
//**************************************************************************
instance Info_BaalLukor_TELEPORT(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_TELEPORT_Condition;
	information = Info_BaalLukor_TELEPORT_Info;
	permanent = 0;
	important = 1;
};

func int Info_BaalLukor_TELEPORT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_DOOR)
	&& Npc_CanSeeNpcFreeLOS(self,hero) 
	&& Npc_GetDistToWP(hero,"GRYD_072")<550 )
	{
		return TRUE;
	};
};

func void Info_BaalLukor_TELEPORT_Info()
{
	B_FullStop(hero);
	AI_SetWalkmode(self,NPC_WALK);
	AI_GotoNpc(self,hero);

//	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_01"); //You've found the hidden place. My instincts have not deceived me.
//	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_01"); //Du hast den verborgenen Ort gefunden. Meine Instinkte haben mich nicht getäuscht.
	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_01"); //Našli jsme skryté místo. Mé instinkty mě nezradily.
//	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_02"); //And does the answer to the strange invocation of the Sleeper really lie here???
//	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_02"); //Und hier liegt die Antwort auf die rätselhafte Anrufung des Schläfers???
	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_02"); //A ta odpověď na to záhadné vzývání Spáče leží skutečně tady???
//	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_03"); //It looks more like another burial chamber to me.
//	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_03"); //Sieht mir eher nach einer weiteren Grabkammer aus.
	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_03"); //Připadá mi to spíše jako zakopaná komora.
//	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_04"); //We need to proceed.
//	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_04"); //Wir müssen weiter.
	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_04"); //Musíme pokračovat.
//	AI_Output(self,other,"Info_BaalLukor_HELP_13_03"); //Go ahead. I'll follow you!
//	AI_Output(self,other,"Info_BaalLukor_HELP_13_03"); //Geh voraus. Ich folge dir!
	AI_Output(self,other,"Info_BaalLukor_HELP_13_03"); //Jdi napřed. Půjdu za tebou!

//	B_LogEntry(CH3_OrcGraveyard,"With the aid of the Orcish teleportation spell, I discovered a secret tunnel leading away from the big column hall.");
//	B_LogEntry(CH3_OrcGraveyard,"Mit Hilfe des orkischen Teleportationszaubers entdeckte ich einen geheimen Stollen, der von der großen Säulenhalle abgeht.");
	B_LogEntry(CH3_OrcGraveyard,"S pomocí skřetího teleportačního kouzla jsem objevil tajnou chodbu vedoucí ven ze sloupového sálu.");

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TELEPORT");
};

//**************************************************************************
//	Info ALTAR
//**************************************************************************
instance Info_BaalLukor_ALTAR(C_INFO)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_ALTAR_Condition;
	information = Info_BaalLukor_ALTAR_Info;
	permanent = 0;
	important = 1;
};

func int Info_BaalLukor_ALTAR_Condition()
{
	if (Npc_KnowsInfo(hero,Info_BaalLukor_TELEPORT)
	&& Npc_GetDistToWP(hero,"GRYD_082")<400
	&& Npc_CanSeeNpcFreeLOS(self,hero))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_ALTAR_Info()
{
	B_FullStop(hero);
	AI_GotoWP (hero,"GRYD_081");
	AI_AlignToWP (hero);

	AI_GotoNpc(self,hero);
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_01"); //NO! This can't be true! There's nothing here but... but dust and... and bones.
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_01"); //NEIN! Das darf nicht wahr sein! Hier gibt es nichts außer ... außer Staub und ... und Gebeinen.
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_01"); //NE! To není možné! Není tu nic než... než prach a... kosti.

	AI_SetWalkmode(self,NPC_RUN);
	AI_GotoWP (self,"GRYD_082");

	AI_PlayAniBS(self,"T_STAND_2_PRAY", BS_SIT);
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_02"); //NO!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_02"); //NEIN!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_02"); //NE!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_03"); //MASTER, SPEAK TO ME!!!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_03"); //MEISTER, SPRICH ZU MIR!!!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_03"); //PANE, PROMLUV KE MNĚ!!!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_04"); //SLEEPER, REVEAL YOURSELF!!!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_04"); //SCHLÄFER, OFFENBARE DICH!!!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_04"); //SPÁČI, ZJEV SE!!!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_05"); //NOOOOOO!!!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_05"); //NEEEEEIIIIIINNNNN!!!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_05"); //NEEEEE!!!

//	AI_Output(hero,self,"Info_BaalLukor_ALTAR_15_06"); //That was it. Now he's gone completely crazy!
//	AI_Output(hero,self,"Info_BaalLukor_ALTAR_15_06"); //Das war's. Jetzt ist er völlig übergeschnappt!
	AI_Output(hero,self,"Info_BaalLukor_ALTAR_15_06"); //A je to. Musel se úplně pominout!

	AI_StandUp(self);
	B_WhirlAround (self,hero);
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_07"); //This is all your fault. Your unholy presence has enraged the almighty Sleeper!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_07"); //Das ist alles nur deine Schuld. Deine unheilige Präsenz hat den allmächtigen Schläfer erzürnt!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_07"); //To všechno je tvoje chyba. Tvoje bezbožná přítomnost rozrušila všemocného Spáče!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_08"); //Now I shall have to suffer for your sacrilegious behavior!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_08"); //Jetzt muss ich für dein frevelhaftes Verhalten büßen!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_08"); //Teď budu muset trpět za tvoje svatokrádežné chování!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_09"); //I need to make a sacrifice for the master. A HUMAN SACRIFICE!!!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_09"); //Ich werde unserem Meister ein Opfer darbringen. Ein MENSCHENOPFER!!!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_09"); //Musím velkému pánovi vzdát oběť. LIDSKOU OBĚŤ!!!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_10"); //Then he'll be sure to enlighten me and make me his servant.
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_10"); //Bestimmt wird er mich dann erleuchten und zu seiner rechten Hand machen.
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_10"); //Pak budu určitě osvícen a stanu se jeho služebníkem.
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_11"); //DIE, INFIDEL!!!!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_11"); //STIRB, UNGLÄUBIGER!!!!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_11"); //ZEMŘI, NEVĚRČE!!!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_12"); //AIIIEEEEHHHHHH!!!!!!
//	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_12"); //AIIIEEEEHHHHHH!!!!!!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_12"); //AAJEEEEÉÉÉHHH!!!!!

	self.flags = 0;
	self.npctype = NpcType_Main;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	//CreateInvItems(self,ItArScrollPyrokinesis, 3);

//	B_LogEntry(CH3_OrcGraveyard,"Baal Lukor went mad when he understood that there is ABSOLUTELY NOTHING down here. Finally he even attacked me in his rage. Cor Angar is bound to worry when he hears that story.");
//	B_LogEntry(CH3_OrcGraveyard,"Baal Lukor hat den Verstand verloren, als ihm klar wurde, dass es auch absolut GARNICHTS hier unten gibt. Zu guter Letzt griff er mich -völlig wahnsinnig geworden- auch noch an. Cor Angar wird sich bestimmt große Sorgen machen, wenn er hiervon erfährt.");
	B_LogEntry(CH3_OrcGraveyard,"Baala Lukora mohla trefit mrtvice, když pochopil, že tady dole není ABSOLUTNĚ NIC. Nakonec si na mně dokonce vylil zlost. Když Cor Angar uslyšel tento příběh, pojal obavy.");

	AI_StopProcessInfos(self);

	AI_StartState(self,ZS_Attack, 1, "");
};

