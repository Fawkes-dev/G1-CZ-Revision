// **************************************************
var int Mud_Nerve;
const int NerveSec = 30;
var int Mud_NerveRealized;
// **************************************************

// **************************************************
// 						 EXIT
// **************************************************

instance DIA_Mud_Exit(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Exit_Condition;
	information = DIA_Mud_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Mud_Exit_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_Mud_FirstEXIT))
	//{
	return 1;
	//};
};

func void DIA_Mud_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 						First + EXIT
// **************************************************

instance DIA_Mud_FirstEXIT(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 1;
	condition = DIA_Mud_FirstEXIT_Condition;
	information = DIA_Mud_FirstEXIT_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Mud_FirstEXIT_Condition()
{
	if (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_FirstEXIT_Info()
{
//	AI_Output(self,other,"DIA_Mud_FirstEXIT_07_00"); //Hey, man! New here? I haven't seen you before.
//	AI_Output(self,other,"DIA_Mud_FirstEXIT_07_00"); //Hey, Mann! Neu hier? Dich hab' ich hier noch nie gesehen.
	AI_Output(self, other, "DIA_Mud_FirstEXIT_07_00"); //Hej, člověče! Jsi tu nový? Nikdy jsem tě tu neviděl.
//	AI_Output(self,other,"DIA_Mud_FirstEXIT_07_01"); //I'll join you for a while, if you don't mind. I'm sure you'll need a friend.
//	AI_Output(self,other,"DIA_Mud_FirstEXIT_07_01"); //Wenn du nichts dagegen hast, komme ich ein Stück mit. Du kannst sicher einen Freund brauchen.
	AI_Output(self, other, "DIA_Mud_FirstEXIT_07_01"); //Jestli proti tomu nic nemáš, půjdu kousek s tebou. Určitě potřebuješ kamaráda.
	Info_ClearChoices(DIA_Mud_FirstEXIT);
//	Info_AddChoice(DIA_Mud_FirstEXIT,"Get lost!",DIA_Mud_FirstEXIT_Verpiss);
//	Info_AddChoice(DIA_Mud_FirstEXIT,"Verpiss dich!",DIA_Mud_FirstEXIT_Verpiss);
	Info_AddChoice(DIA_Mud_FirstEXIT, "Ztrať se!", DIA_Mud_FirstEXIT_Verpiss);
//	Info_AddChoice(DIA_Mud_FirstEXIT,"Why not - come along!",DIA_Mud_FirstEXIT_Komm);
//	Info_AddChoice(DIA_Mud_FirstEXIT,"Warum nicht - komm mit!",DIA_Mud_FirstEXIT_Komm);
	Info_AddChoice(DIA_Mud_FirstEXIT, "Proč ne - pojď.", DIA_Mud_FirstEXIT_Komm);
};

func void DIA_Mud_FirstEXIT_Verpiss()
{
//	AI_Output(other,self,"DIA_Mud_FirstEXIT_Verpiss_15_00"); //Get lost!
//	AI_Output(other,self,"DIA_Mud_FirstEXIT_Verpiss_15_00"); //Verpiss dich!
	AI_Output(other, self, "DIA_Mud_FirstEXIT_Verpiss_15_00"); //Ztrať se!
//	AI_Output(self,other,"DIA_Mud_FirstEXIT_Verpiss_07_01"); //You're not in a good mood today, are you? I better come with you...
//	AI_Output(self,other,"DIA_Mud_FirstEXIT_Verpiss_07_01"); //Bist heute nicht so gut drauf, was? Ich glaub', ich komm' mal besser mit ...
	AI_Output(self, other, "DIA_Mud_FirstEXIT_Verpiss_07_01"); //Ty dneska nemáš dobrou náladu, viď? Raději půjdu s tebou...
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "FOLLOW");
};

func void DIA_Mud_FirstEXIT_Komm()
{
//	AI_Output(other,self,"DIA_Mud_FirstEXIT_Komm_15_00"); //Why not - come along!
//	AI_Output(other,self,"DIA_Mud_FirstEXIT_Komm_15_00"); //Warum nicht - komm mit!
	AI_Output(other, self, "DIA_Mud_FirstEXIT_Komm_15_00"); //Proč ne - pojď.
//	AI_Output(self,other,"DIA_Mud_FirstEXIT_Komm_07_01"); //Great! We can talk while we're going.
//	AI_Output(self,other,"DIA_Mud_FirstEXIT_Komm_07_01"); //Großartig! Wir können uns ja auf dem Weg etwas unterhalten.
	AI_Output(self, other, "DIA_Mud_FirstEXIT_Komm_07_01"); //Výborně! Můžeme si po cestě povídat.
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "FOLLOW");
};

// **************************************************
// 					Shut Up!
// **************************************************

instance DIA_Mud_ShutUp(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 3;
	condition = DIA_Mud_ShutUp_Condition;
	information = DIA_Mud_ShutUp_Info;
	important = 0;
	permanent = 1;
//	description = "Could you PLEASE keep quiet for a minute?";
//	description = "Kannst du mal BITTE einen Moment die Klappe halten?";
	description = "Mohl bys být, PROSÍM, chvilku zticha?";
};

func int DIA_Mud_ShutUp_Condition()
{
	if (Mud_NerveRealized == TRUE)
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_ShutUp_Info()
{
//	AI_Output(other,self,"DIA_Mud_ShutUp_15_00"); //Could you PLEASE keep quiet for a minute?
//	AI_Output(other,self,"DIA_Mud_ShutUp_15_00"); //Kannst du mal BITTE einen Moment die Klappe halten?
	AI_Output(other, self, "DIA_Mud_ShutUp_15_00"); //Mohl bys být, PROSÍM, chvilku zticha?
//	AI_Output(self,other,"DIA_Mud_ShutUp_07_01"); //Sure.
//	AI_Output(self,other,"DIA_Mud_ShutUp_07_01"); //Klar.
	AI_Output(self, other, "DIA_Mud_ShutUp_07_01"); //Jistě.
	Npc_SetRefuseTalk(self, 300);
};

// **************************************************
// 					Verpiß dich
// **************************************************

instance DIA_Mud_GetLost(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 2;
	condition = DIA_Mud_GetLost_Condition;
	information = DIA_Mud_GetLost_Info;
	important = 0;
	permanent = 1;
//	description = "Get lost!";
//	description = "Verpiss dich!";
	description = "Ztrať se!";
};

func int DIA_Mud_GetLost_Condition()
{
	//TODO: this dialogue should be available only after DIA_Mud_FirstEXIT was told
	return 1;
};

func void DIA_Mud_GetLost_Info()
{
//	AI_Output(other,self,"DIA_Mud_GetLost_15_00"); //Get lost!
//	AI_Output(other,self,"DIA_Mud_GetLost_15_00"); //Verpiss dich!
	AI_Output(other, self, "DIA_Mud_GetLost_15_00"); //Ztrať se!
//	AI_Output(self,other,"DIA_Mud_GetLost_07_01"); //You wanna be on your own for a while, do you? I understand... I'll stay in the background...
//	AI_Output(self,other,"DIA_Mud_GetLost_07_01"); //Willst 'nen Moment allein sein, hm? Kann ich verstehen ... Ich halt mich im Hintergrund ...
	AI_Output(self, other, "DIA_Mud_GetLost_07_01"); //Chceš být chvilku sám, viď? Tomu rozumím... Budu se držet vzadu...
};

// **************************************************
// 					DEFEATED
// **************************************************

instance DIA_Mud_Defeated(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 1;
	condition = DIA_Mud_Defeated_Condition;
	information = DIA_Mud_Defeated_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Mud_Defeated_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Defeated_Info()
{
//	AI_Output(self,other,"DIA_Mud_GetLost_07_00"); //Hey, man, you hit me! What was that for?
//	AI_Output(self,other,"DIA_Mud_GetLost_07_00"); //Hey, Mann, du hast mich geschlagen! Was sollte das?
	AI_Output(self, other, "DIA_Mud_GetLost_07_00"); //Hej, člověče, tys mě praštil! Co to mělo znamenat?
//	AI_Output(other,self,"DIA_Mud_GetLost_15_01"); //I'll hit you again in a second! I'm into that!
//	AI_Output(other,self,"DIA_Mud_GetLost_15_01"); //Ich schlag' dich gleich noch mal! Ich steh' auf Schlagen!
	AI_Output(other, self, "DIA_Mud_GetLost_15_01"); //Za okamžik tě praštím znovu! Rád si bouchnu!
//	AI_Output(self,other,"DIA_Mud_GetLost_07_02"); //You're a lunatic, man! I don't want to have anything to do with you!
//	AI_Output(self,other,"DIA_Mud_GetLost_07_02"); //Mann, was bist DU denn für'n Freak! Mit dir will ich nichts mehr zu tun haben!
	AI_Output(self, other, "DIA_Mud_GetLost_07_02"); //Ty jsi šílenej, chlape! Už s tebou nechci nic mít!

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

// **************************************************
// 						 Nerve 0
// **************************************************

instance DIA_Mud_Nerve_0(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_0_Condition;
	information = DIA_Mud_Nerve_0_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_0_Condition()
{
	if ((Mud_Nerve == 0)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_0_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_0_07_00"); //Tell me, where are we going? Or is it supposed to be a surprise? I like surprises.
//	AI_Output(self,other,"DIA_Mud_Nerve_0_07_00"); //Sag mal, wohin geht es eigentlich? Oder ist das eine Überraschung für mich? Ich mag Überraschungen.
	AI_Output(self, other, "DIA_Mud_Nerve_0_07_00"); //Řekni mi, kam vlastně jdeme? Nebo to má být překvapení? Miluji překvapení.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 1;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 1
// **************************************************

instance DIA_Mud_Nerve_1(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_1_Condition;
	information = DIA_Mud_Nerve_1_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_1_Condition()
{
	if ((Mud_Nerve == 1)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_1_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_1_07_00"); //Don't pay attention to me. I'll just stay with you, don't worry.
//	AI_Output(self,other,"DIA_Mud_Nerve_1_07_00"); //Lass dich von mir nicht stören. Ich bleib' einfach bei dir, keine Sorge.
	AI_Output(self, other, "DIA_Mud_Nerve_1_07_00"); //Mě si nevšímej. Já ti neuteču, neboj se.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 2;
	Mud_NerveRealized = TRUE;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 2
// **************************************************

instance DIA_Mud_Nerve_2(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_2_Condition;
	information = DIA_Mud_Nerve_2_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_2_Condition()
{
	if ((Mud_Nerve == 2)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_2_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_2_07_00"); //Don't you have any plan of where you want to go?
//	AI_Output(self,other,"DIA_Mud_Nerve_2_07_00"); //Hast du eigentlich keinen Plan, wo du hinwillst? Suchst du ein stilles Plätzchen? Wo wir ein bisschen reden können und so?
	//#Needs_Attention toto je taky isty dialog ako DIA_Mud_Nerve_3_07_00. To je skoda. Anglicky dabing ponuka 2 varianty - rozseknuty dialog. Volil by som teda rozseknut ho aj tu
	//AI_Output(self,other,"DIA_Mud_Nerve_2_07_00"); //Už máš nějaký plán, kam chceš dojít?
	AI_Output(self, other, "DIA_Mud_Nerve_2_07_00"); //Už máš nějaký plán, kam chceš dojít? Hledáš klidné místečko? Kde si budeme moci trochu popovídat nebo tak?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 3;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 3
// **************************************************

instance DIA_Mud_Nerve_3(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_3_Condition;
	information = DIA_Mud_Nerve_3_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_3_Condition()
{
	if ((Mud_Nerve == 3)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_3_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_3_07_00"); //Are you looking for a quiet place? Where we can talk for a bit or something?
//	AI_Output(self,other,"DIA_Mud_Nerve_3_07_00"); //Hast du eigentlich keinen Plan, wo du hinwillst? Suchst du ein stilles Plätzchen? Wo wir ein bisschen reden können und so?
	//#Needs_Attention toto je taky isty dialog ako DIA_Mud_Nerve_2_07_00. To je skoda. Anglicky dabing ponuka 2 varianty - rozseknuty dialog. Volil by som teda rozseknut ho aj tu
	//AI_Output(self,other,"DIA_Mud_Nerve_3_07_00"); //Hledáš klidné místečko? Kde si budeme moci trochu popovídat nebo tak?
	AI_Output(self, other, "DIA_Mud_Nerve_3_07_00"); //Už máš nějaký plán, kam chceš dojít? Hledáš klidné místečko? Kde si budeme moci trochu popovídat nebo tak?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 4;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 4
// **************************************************

instance DIA_Mud_Nerve_4(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_4_Condition;
	information = DIA_Mud_Nerve_4_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_4_Condition()
{
	if ((Mud_Nerve == 4)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_4_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_4_07_00"); //Is it possible we're walking in circles? I mean, I don't know where you want to go...
//	AI_Output(self,other,"DIA_Mud_Nerve_4_07_00"); //Kann es sein, dass du im Kreis läufst? Ich meine, ich weiß ja nicht, wo du hin willst ...
	//#Needs_Attention 'Myslím, že nevím, kam chceš dojít...' prebasnit? je to nejake krkolomne
	AI_Output(self, other, "DIA_Mud_Nerve_4_07_00"); //Je možné, že chodíme do kruhu? Myslím, že nevím, kam chceš dojít...
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 5;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 5
// **************************************************

instance DIA_Mud_Nerve_5(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_5_Condition;
	information = DIA_Mud_Nerve_5_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_5_Condition()
{
	if ((Mud_Nerve == 5)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_5_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_5_07_00"); //This is real fun. Thanks for taking me with you. We could do that more often, there's loads of more time left today.
//	AI_Output(self,other,"DIA_Mud_Nerve_5_07_00"); //Das macht richtig Spaß mit dir. Schön, dass du mich mitnimmst. Das können wir öfter mal machen. Und heute ist ja auch noch viel Zeit.
	AI_Output(self, other, "DIA_Mud_Nerve_5_07_00"); //To je legrační. Díky, že jsi mě vzal sebou. Mohli bychom to dělat častěji, dneska ještě zbývá hromada času.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 6;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 6
// **************************************************

instance DIA_Mud_Nerve_6(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_6_Condition;
	information = DIA_Mud_Nerve_6_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_6_Condition()
{
	if ((Mud_Nerve == 6)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_6_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_6_07_00"); //I have gotten used to you already. We'll have much fun together, I'm sure of that. Aren't you? Where do you sleep anyway? You can come to my place, no problem.
//	AI_Output(self,other,"DIA_Mud_Nerve_6_07_00"); //Ich hab' mich schon richtig an dich gewöhnt. Wir werden sicher eine Menge Spaß miteinander haben. Nicht wahr? Wo schläfst du eigentlich? Du kannst gerne zu mir kommen.
	AI_Output(self, other, "DIA_Mud_Nerve_6_07_00"); //Už jsem si na tebe zvykl. Užijeme si spolu spoustu legrace, tím jsem si jistý. Co ty na to? Kde vůbec spíš? Můžeš přijít ke mně, žádný problém.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 7;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 7
// **************************************************

instance DIA_Mud_Nerve_7(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_7_Condition;
	information = DIA_Mud_Nerve_7_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_7_Condition()
{
	if ((Mud_Nerve == 7)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_7_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_7_07_00"); //Why did they put you in here anyway? Do you like animals as well? They're not into that one bit. That's why they locked me in here.
//	AI_Output(self,other,"DIA_Mud_Nerve_7_07_00"); //Wegen was haben sie dich eigentlich hier reingeworfen? Hast du auch einen Faible für Tiere? Das haben sie ja gar nicht gerne. Da haben sie mich eingebuchtet.
	AI_Output(self, other, "DIA_Mud_Nerve_7_07_00"); //Proč tě sem vůbec strčili? Máš také slabost pro zvířátka? To se jim vůbec nelíbilo. Proto mě sem zavřeli.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 8;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 8
// **************************************************

instance DIA_Mud_Nerve_8(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_8_Condition;
	information = DIA_Mud_Nerve_8_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_8_Condition()
{
	if ((Mud_Nerve == 8)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_8_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_8_07_00"); //There are some people who constantly try to beat me up. Horrible guys from the New Camp. Real cut-throats. The next time I'll tell them that they'll have you to deal with in the future. Then they'll be dead scared.
//	AI_Output(self,other,"DIA_Mud_Nerve_8_07_00"); //Es gibt da ein paar Leute, die versuchen ständig, mich zu verprügeln. Fiese Typen aus dem Neuen Lager. Richtige Brutalos. Ich werde ihnen beim nächsten Mal gleich sagen, dass sie es in Zukunft mir dir zu tun kriegen. Das wird sie sicher abschrecken.
	AI_Output(self, other, "DIA_Mud_Nerve_8_07_00"); //Jsou tady lidi, kteří se mě soustavně pokoušejí mlátit. Odporní chlapi z Nového tábora. Opravdoví hrdlořezi. Příště jim řeknu, ať si to vyřídí s tebou. To je určitě odradí.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 9;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 9
// **************************************************

instance DIA_Mud_Nerve_9(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_9_Condition;
	information = DIA_Mud_Nerve_9_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_9_Condition()
{
	if ((Mud_Nerve == 9)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_9_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_9_07_00"); //Those bastards from the New Camp will be amazed when they get to know that I have a protector. They'll piss themselves. That'll be fun. Normally they finish people off quickly, but now they'll think twice.
//	AI_Output(self,other,"DIA_Mud_Nerve_9_07_00"); //Diese fiesen Schweine aus dem Neuen Lager werden staunen, wenn sie erfahren, dass ich einen Beschützer habe. Die werden sich in die Hosen machen. Das wird ein Spaß. Sonst machen sie ja mit allen kurzen Prozess, aber jetzt werden sie sich das zweimal überlegen.
	AI_Output(self, other, "DIA_Mud_Nerve_9_07_00"); //TA ohavná prasata z Nového tábora budou překvapená, až se dozví, že mám ochránce. Podělaj se strachy. To bude legrace. Obvykle jsou s lidmi hotoví raz dva, ale teď se budou rozmýšlet dvakrát.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 10;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 10
// **************************************************

instance DIA_Mud_Nerve_10(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_10_Condition;
	information = DIA_Mud_Nerve_10_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_10_Condition()
{
	if ((Mud_Nerve == 10)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_10_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_10_07_00"); //You know what? I'll do you a favor. I'll put in a good word for you, then perhaps you'll be admitted to the Camp. Then we could meet every day.
//	AI_Output(self,other,"DIA_Mud_Nerve_10_07_00"); //Weißt du was? Ich tu dir einen Gefallen. Ich werde ein gutes Wort für dich einlegen. Dann nehmen sie dich vielleicht in das Lager auf. Dann können wir uns jeden Tag sehen.
	AI_Output(self, other, "DIA_Mud_Nerve_10_07_00"); //Víš co? Udělám ti laskavost. Přimluvím se za tebe v táboře a pak tě snad přijmou. Pak bychom se mohli scházet každý den.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 11;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 11
// **************************************************

instance DIA_Mud_Nerve_11(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_11_Condition;
	information = DIA_Mud_Nerve_11_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_11_Condition()
{
	if ((Mud_Nerve == 11)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_11_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_11_07_00"); //Some people think I'm a complete lunatic. But somebody like you would never hang out with a lunatic. People would talk about that. So they'll finally understand that they were wrong about me.
//	AI_Output(self,other,"DIA_Mud_Nerve_11_07_00"); //Manche halten mich ja für einen durchgeknallten Spinner. Aber jemand wie du würde sich hier ja niemals mit einem Spinner sehen lassen. So was spricht sich ja rum. Also werden sie einsehen, dass sie sich in mir getäuscht haben.
	//#Needs_Attention dvojite pouzitie bavit by som mozno prebasnil 'nebavil. Lidé se o tom začnou bavit' mozno druhu cast na 'nebavil. Lidé se o tom začnou povídat' ?
	AI_Output(self, other, "DIA_Mud_Nerve_11_07_00"); //Někteří lidé si myslí, že jsem úplný cvok. Ale někdo jako ty, by se nikdy s bláznem nebavil. Lidé se o tom začnou bavit. Pak nakonec pochopí, že se ve mně mýlili.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 12;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 12
// **************************************************

instance DIA_Mud_Nerve_12(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_12_Condition;
	information = DIA_Mud_Nerve_12_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_12_Condition()
{
	if ((Mud_Nerve == 12)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_12_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_12_07_00"); //You're my best friend here. The others only want to get rid of me all the time. I'm really grateful to you.
//	AI_Output(self,other,"DIA_Mud_Nerve_12_07_00"); //Du bist mein bester Freund hier drinnen. Die anderen wollen mich immer nur loswerden. Ich bin dir echt dankbar.
	AI_Output(self, other, "DIA_Mud_Nerve_12_07_00"); //Jsi tady uvnitř můj nejlepší přítel. Ostatní se mě celou dobu chtějí akorát zbavit. Jsem ti opravdu vděčný.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 13;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 13
// **************************************************

instance DIA_Mud_Nerve_13(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_13_Condition;
	information = DIA_Mud_Nerve_13_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_13_Condition()
{
	if ((Mud_Nerve == 13)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_13_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_13_07_00"); //Listen, this running around is really getting tiring. Shouldn't we look for a cosy place and get comfy somewhere?
//	AI_Output(self,other,"DIA_Mud_Nerve_13_07_00"); //Hör mal, die Rennerei wird langsam anstrengend. Wollen wir uns nicht irgendwo ein kuscheliges Plätzchen suchen und es uns gemütlich machen?
	AI_Output(self, other, "DIA_Mud_Nerve_13_07_00"); //Poslyš, tohle chození dokola je dost únavné. Neměli bychom se poohlédnout po nějakém příjemném místečku a udělat si trochu pohodlí?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 14;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 14
// **************************************************

instance DIA_Mud_Nerve_14(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_14_Condition;
	information = DIA_Mud_Nerve_14_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_14_Condition()
{
	if ((Mud_Nerve == 14)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_14_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_14_07_00"); //You're like a big brother to me. I never had a big brother. Or a small one. My parents didn't want me. But I'm sure it was difficult for them.
//	AI_Output(self,other,"DIA_Mud_Nerve_14_07_00"); //Du bist wie ein großer Bruder für mich. Ich hatte nie einen großen Bruder. Auch keinen kleinen. Meine Eltern wollten mich nicht behalten. Ich bin sicher, das fiel ihnen nicht leicht.
	//#Needs_Attention prebasnit složité na těžké?
	AI_Output(self, other, "DIA_Mud_Nerve_14_07_00"); //Připadáš mi jako starší bratr. Nikdy jsem neměl staršího bratra. Ani mladšího. Mí rodiče mě nechtěli. Ale určitě to pro ně bylo složité.
//	AI_Output(other,self,"DIA_Mud_Nerve_14_15_01"); //Sure it was.
//	AI_Output(other,self,"DIA_Mud_Nerve_14_15_01"); //Bestimmt nicht.
	AI_Output(other, self, "DIA_Mud_Nerve_14_15_01"); //Určitě bylo.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 15;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 15
// **************************************************

instance DIA_Mud_Nerve_15(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_15_Condition;
	information = DIA_Mud_Nerve_15_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_15_Condition()
{
	if ((Mud_Nerve == 15)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_15_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_15_07_00"); //Where are you from? You must be happy as well that you finally found somebody who understands you. I'm from Khorinis. Have you ever been there? Well, doesn't matter anyway.
//	AI_Output(self,other,"DIA_Mud_Nerve_15_07_00"); //Wo kommst du denn her? Du freust dich sicher auch so, dass du jetzt endlich jemanden gefunden hast, der dich versteht. Ich komme aus Khorinis. Warst du schon mal dort? Ist ja eigentlich auch egal.
	AI_Output(self, other, "DIA_Mud_Nerve_15_07_00"); //Odkud jsi? Musíš být šťastný, že jsi konečně našel někoho, kdo ti rozumí. Pocházím z Khorinisu. Byls tam někdy? Ono je to vlastně jedno.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 16;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 16
// **************************************************

instance DIA_Mud_Nerve_16(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_16_Condition;
	information = DIA_Mud_Nerve_16_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_16_Condition()
{
	if ((Mud_Nerve == 16)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_16_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_16_07_00"); //Have you got something to eat for me? Since I'm some sort of visitor, it'd be polite if you gave me something. That's manners. My friends in Khorinis taught me that. They really liked me.
//	AI_Output(self,other,"DIA_Mud_Nerve_16_07_00"); //Hast du was zu essen für mich? Da ich ja so was wie Besuch bin, fände ich es toll, wenn du mir was geben würdest. Das gehört sich so. Das haben mir meine Freunde in Khorinis beigebracht. Die hatten mich echt gerne.
	AI_Output(self, other, "DIA_Mud_Nerve_16_07_00"); //Máš pro mě něco k jídlu? Jsem něco jako návštěvník, a tak by bylo slušné, kdybys mi něco dal. Tak se to dělá. To mě učili mí přátelé v Khorinisu. Měli mě doopravdy rádi.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 17;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 17
// **************************************************

instance DIA_Mud_Nerve_17(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_17_Condition;
	information = DIA_Mud_Nerve_17_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_17_Condition()
{
	if ((Mud_Nerve == 17)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_17_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_17_07_00"); //D'you think anybody is ever going to visit us? Probably not, they wouldn't get out of here again, would they?
//	AI_Output(self,other,"DIA_Mud_Nerve_17_07_00"); //Glaubst du, dass uns mal jemand von außerhalb besucht? Wohl kaum, was, weil die kommen ja dann nicht mehr raus, oder?
	AI_Output(self, other, "DIA_Mud_Nerve_17_07_00"); //Myslíš, že nás ještě někdo přijde navštívit? Asi ne, nikdo by se nedostal zase ven, že ne?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 18;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 18
// **************************************************

instance DIA_Mud_Nerve_18(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_18_Condition;
	information = DIA_Mud_Nerve_18_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_18_Condition()
{
	if ((Mud_Nerve == 18)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_18_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_18_07_00"); //Now that you're with me, we could show a few people where to go. These bastards have been harassing me for years. When I see one of them now, I'm gonna tell him a few things.
//	AI_Output(self,other,"DIA_Mud_Nerve_18_07_00"); //Jetzt, wo du bei mir bist, können wir ja mal einigen Arschlöchern aufs Maul hauen. Die haben mich jahrelang getriezt. Wenn ich einen von denen sehe, dann sag' ich ihnen die Meinung.
	AI_Output(self, other, "DIA_Mud_Nerve_18_07_00"); //Teď, když jsi se mnou, můžeme dát pár lidem nakládačku. Ti bastardi mě už léta trápili. Až někoho z nich uvidím, řeknu mu pár věcí.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 19;
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 Nerve 19
// **************************************************

instance DIA_Mud_Nerve_19(C_INFO)
{
	npc = Vlk_574_Mud;
	nr = 999;
	condition = DIA_Mud_Nerve_19_Condition;
	information = DIA_Mud_Nerve_19_Info;
	important = 1;
	permanent = 1;
};

func int DIA_Mud_Nerve_19_Condition()
{
	if ((Mud_Nerve == 19)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToNpc(self, hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Mud_Nerve_19_Info()
{
//	AI_Output(self,other,"DIA_Mud_Nerve_19_07_00"); //The two of us are a dream team. We could take over the Old Camp. The Ore Barons wouldn't be a problem for us since we're a team. I'll think of a plan.
//	AI_Output(self,other,"DIA_Mud_Nerve_19_07_00"); //Zusammen sind wir echt unschlagbar. Wir könnten das Alte Lager übernehmen. Mit den Erzbaronen werden wir schon fertig, wir sind ja zu zweit. Ich werde mir etwas ausdenken.
	//#Needs_Attention asi by som sa drzal viac anglickeho dabingu. Prva cast je fajn 'Spolu jsme opravdu nepřekonatelní. Mohli bychom ovládnout Starý tábor.' ale druhu by som nechal 'Rudobaroni by nepředstavovali problém, dokud bysme byli tým. Vymyslím nějaký plán.'
	//AI_Output(self,other,"DIA_Mud_Nerve_19_07_00"); //My dva jsme snový tým. Mohli bysme ovládnout Starý tábor. Rudobaroni by nepředstavovali problém, dokud bysme byli tým. Vymyslím nějaký plán.
	AI_Output(self, other, "DIA_Mud_Nerve_19_07_00"); //Spolu jsme opravdu nepřekonatelní. Mohli bychom ovládnout Starý tábor. S rudobarony bychom byli hned hotoví, jsme na ně dva. Vymyslím nějaký plán.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 0;
	AI_StopProcessInfos(self);
};
