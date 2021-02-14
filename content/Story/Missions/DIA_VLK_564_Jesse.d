// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_Jesse_Exit(C_INFO)
{
	npc = Vlk_564_Jesse;
	nr = 999;
	condition = DIA_Jesse_Exit_Condition;
	information = DIA_Jesse_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Jesse_Exit_Condition()
{
	return 1;
};

func void DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 				Hi
// **************************************************

instance DIA_Jesse_Hallo(C_INFO)
{
	npc = Vlk_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Hallo_Condition;
	information = DIA_Jesse_Hallo_Info;
	permanent = 0;
//	description = "How's things?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int DIA_Jesse_Hallo_Condition()
{ 
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

func void DIA_Jesse_Hallo_Info()
{
//	AI_Output(other,self,"DIA_Jesse_Hallo_15_00"); //How's things?
//	AI_Output(other,self,"DIA_Jesse_Hallo_15_00"); //Wie sieht's aus?
	AI_Output(other,self,"DIA_Jesse_Hallo_15_00"); //Jak to jde?
//	AI_Output(self,other,"DIA_Jesse_Hallo_03_01"); //New here, are you? You better know that it's no good getting into trouble with the guards.
//	AI_Output(self,other,"DIA_Jesse_Hallo_03_01"); //Neu hier, was? Du solltest wissen, dass man sich hier besser nicht mit den Gardisten anlegt.
	AI_Output(self,other,"DIA_Jesse_Hallo_03_01"); //Jsi tu nový, viď? Měl bys vědět, že se strážemi není dobré mít problémy.
//	AI_Output(self,other,"DIA_Jesse_Hallo_03_02"); //When they want protection money, you better pay, otherwise half the Camp'll be against you.
//	AI_Output(self,other,"DIA_Jesse_Hallo_03_02"); //Wenn sie Schutzgeld wollen, zahlst du besser, sonst hast du bald das halbe Lager gegen dich.
	AI_Output(self,other,"DIA_Jesse_Hallo_03_02"); //Když budou chtít peníze za ochranu, raději zaplať, jinak bude polovina tábora proti tobě.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

instance DIA_Jesse_Warn(C_INFO)
{
	npc = Vlk_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Warn_Condition;
	information = DIA_Jesse_Warn_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Jesse_Warn_Condition()
{ 
	if ((Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE))
	{
		return 1;
	};
};

func void DIA_Jesse_Warn_Info()
{
//	AI_Output(self,other,"DIA_Jesse_Warn_03_00"); //Hey, you! I learned you didn't want to pay protection money to Bloodwyn?
//	AI_Output(self,other,"DIA_Jesse_Warn_03_00"); //Hey, du! Ich hab' gehört, du wolltest Bloodwyn kein Schutzgeld zahlen?
	AI_Output(self,other,"DIA_Jesse_Warn_03_00"); //Hej, ty! Slyšel jsem, že jsi nezaplatil Bloodwynovi peníze za ochranu?
//	AI_Output(other,self,"DIA_Jesse_Warn_15_01"); //What do you want?
//	AI_Output(other,self,"DIA_Jesse_Warn_15_01"); //Was willst du?
	AI_Output(other,self,"DIA_Jesse_Warn_15_01"); //Co chceš?
//	AI_Output(self,other,"DIA_Jesse_Warn_03_02"); //To warn you! Bloodwyn paid some people: They're gonna do you in.
//	AI_Output(self,other,"DIA_Jesse_Warn_03_02"); //Dich warnen! Bloodwyn hat einige Leute bezahlt, damit sie dir Ärger machen.
	//#Needs_Attention Skusit prebasnit ?
	//AI_Output(self,other,"DIA_Jesse_Warn_03_02"); //Varovat tě! Bloodwyn zaplatil pár lidem: ti po tobě půjdou.
	AI_Output(self,other,"DIA_Jesse_Warn_03_02"); //Varovat tě! Bloodwyn zaplatil pár lidem, aby ti udělali problémy.
//	AI_Output(self,other,"DIA_Jesse_Warn_03_03"); //I saw how he talked to people like Herek over there, and God knows who else he hired!
//	AI_Output(self,other,"DIA_Jesse_Warn_03_03"); //Ich hab' zum Beispiel gesehen, wie er mit Herek da drüben geredet hat. Und nur die Götter wissen, mit wem noch!
	//#Needs_Attention nechame boha alebo prebasnime na Innosa ? :-) immersion!?
	AI_Output(self,other,"DIA_Jesse_Warn_03_03"); //Viděl jsem například, jak mluví támhle s Herekem, a bůhví, koho si ještě najal!
//	AI_Output(other,self,"DIA_Jesse_Warn_15_04"); //Your warning about Herek is a bit late.
//	AI_Output(other,self,"DIA_Jesse_Warn_15_04"); //Was Herek betrifft, kommt deine Warnung etwas spät.
	//#Needs_Attention týká alebo týče? týka mi pride Slovenske, ale mozno je to ok aj po cesky :))
	AI_Output(other,self,"DIA_Jesse_Warn_15_04"); //Co se Hereka týká, je tvé varování trochu opožděné.
//	AI_Output(self,other,"DIA_Jesse_Warn_03_05"); //He must have talked to somebody else as well, that much I know. So do take care.
//	AI_Output(self,other,"DIA_Jesse_Warn_03_05"); //Er muss noch mit jemand anderem geredet haben - so viel hab' ich mitgekriegt. Also pass auf dich auf.
	AI_Output(self,other,"DIA_Jesse_Warn_03_05"); //Musel mluvit ještě s někým jiným. To je všechno, co vím. Tak buď opatrný.
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************

// ************************************************************

instance DIA_Jesse_Mission(C_INFO)
{
	npc = Vlk_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Mission_Condition;
	information = DIA_Jesse_Mission_Info;
	permanent = 0;
//	description = "Why did you tell me the story about Bloodwyn?";
//	description = "Warum hast du mir die Sache mit Bloodwyn erzählt?";
	description = "Proč jsi mi vyprávěl celou tu historku o Bloodwynovi?";
};

func int DIA_Jesse_Mission_Condition()
{
	//#Bugfix NPC_KnowsInfo incorrectly used with 'this' dialog instance DIA_Jesse_Mission - dialog option would never display
	//if (Npc_KnowsInfo(hero,DIA_Jesse_Mission))
	if (Npc_KnowsInfo(hero,DIA_Jesse_Warn))
	{
		return 1;
	};
};

func void DIA_Jesse_Mission_Info()
{
//	AI_Output(other,self,"DIA_Jesse_Mission_15_00"); //Why did you tell me the story about Bloodwyn?
//	AI_Output(other,self,"DIA_Jesse_Mission_15_00"); //Warum hast du mir die Sache mit Bloodwyn erzählt?
	AI_Output(other,self,"DIA_Jesse_Mission_15_00"); //Proč jsi mi vyprávěl celou tu historku o Bloodwynovi?
//	AI_Output(self,other,"DIA_Jesse_Mission_03_01"); //Because favors can be returned. And you don't look like somebody who wouldn't understand that.
//	AI_Output(self,other,"DIA_Jesse_Mission_03_01"); //Weil hier eine Hand die andere wäscht. Du siehst nicht so aus wie einer, der das nicht begreifen würde.
	AI_Output(self,other,"DIA_Jesse_Mission_03_01"); //Protože tady ruka ruku myje. A ty nevypadáš jako někdo, kdo by to nepochopil.
//	AI_Output(self,other,"DIA_Jesse_Mission_03_02"); //And because I did YOU a favor, I'd like to give you the opportunity to return it.
//	AI_Output(self,other,"DIA_Jesse_Mission_03_02"); //Und weil ich DIR jetzt einen Gefallen getan habe, möchte ich dir Gelegenheit geben, dich zu revanchieren.
	AI_Output(self,other,"DIA_Jesse_Mission_03_02"); //A protože já jsem prokázal laskavost TOBĚ, rád bych ti dal příležitost mi to oplatit.

	Info_ClearChoices(DIA_Jesse_Mission);
//	Info_AddChoice(DIA_Jesse_Mission,"Forget it! I don't owe you anything!",DIA_Jesse_Mission_ForgetIt);
//	Info_AddChoice(DIA_Jesse_Mission,"Vergiß es! Ich schulde dir gar nichts!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice(DIA_Jesse_Mission,"Zapomeň na to! Nic ti nedlužím!",DIA_Jesse_Mission_ForgetIt);
//	Info_AddChoice(DIA_Jesse_Mission,"What exactly do you have in mind?",DIA_Jesse_Mission_What);
//	Info_AddChoice(DIA_Jesse_Mission,"An was hattest du denn da gedacht?",DIA_Jesse_Mission_What);
	Info_AddChoice(DIA_Jesse_Mission,"Co přesně máš na mysli?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
//	AI_Output(other,self,"DIA_Jesse_Mission_ForgetIt_15_00"); //I don't owe you anything!
//	AI_Output(other,self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Ich schulde dir GAR nichts!
	AI_Output(other,self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Nic ti nedlužím!
//	AI_Output(self,other,"DIA_Jesse_Mission_ForgetIt_03_01"); //Oh! Then get lost!
	AI_Output(self,other,"DIA_Jesse_Mission_ForgetIt_03_01"); //Och! Pak se ztrať!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(DIA_Jesse_Mission);
	AI_StopProcessInfos(self);
};

func void DIA_Jesse_Mission_What()
{
//	AI_Output(other,self,"DIA_Jesse_Mission_What_15_00"); //What exactly do you have in mind?
//	AI_Output(other,self,"DIA_Jesse_Mission_What_15_00"); //An was hattest du denn da gedacht?
	AI_Output(other,self,"DIA_Jesse_Mission_What_15_00"); //Co přesně máš na mysli?
//	AI_Output(self,other,"DIA_Jesse_Mission_What_03_01"); //I don't have any ore left, and Bloodwyn has already fleeced me as well.
//	AI_Output(self,other,"DIA_Jesse_Mission_What_03_01"); //Ich hab' kein Erz mehr, und Bloodwyn hat schon versucht, das letzte Bröckchen aus mir rauszupressen.
	//#Needs_Attention dvakrat vyslovena informacia o tom, ze nema rudu, skusime prebasnit?
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_01"); //Už mi nezbyla žádná ruda a Bloodwyn už mě taky obral o poslední kousek rudy.
//	AI_Output(self,other,"DIA_Jesse_Mission_What_03_02"); //Now that I've helped you, you could give him the 10 ore I owe him, couldn't you? Tell him it's from me.
//	AI_Output(self,other,"DIA_Jesse_Mission_What_03_02"); //Jetzt, wo ich dir geholfen habe, könntest du ihm doch meine 10 Erz geben, oder? Sag ihm, sie kommen von mir.
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_02"); //Když jsem ti teď pomohl, mohl bys mu dát 10 nugetů, co mu dlužím, jo? Řekni mu, že je to ode mě.
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld

//	Info_AddChoice(DIA_Jesse_Mission,"Me, pay for you? Forget it!",DIA_Jesse_Mission_NO);
//	Info_AddChoice(DIA_Jesse_Mission,"Ich für dich zahlen? Vergiß es!",DIA_Jesse_Mission_NO);
	Info_AddChoice(DIA_Jesse_Mission,"Já, platit za tebe? Na to zapomeň!",DIA_Jesse_Mission_NO);
//	Info_AddChoice(DIA_Jesse_Mission,"I'll see what I can do.",DIA_Jesse_Mission_YES);
//	Info_AddChoice(DIA_Jesse_Mission,"Ich werd sehen, was ich machen kann...",DIA_Jesse_Mission_YES);
	Info_AddChoice(DIA_Jesse_Mission,"Uvidím, co budu moci udělat...",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
//	AI_Output(other,self,"DIA_Jesse_Mission_YES_15_00"); //I'll see what I can do.
//	AI_Output(other,self,"DIA_Jesse_Mission_YES_15_00"); //Ich werd sehen, was ich machen kann ...
	AI_Output(other,self,"DIA_Jesse_Mission_YES_15_00"); //Uvidím, co budu moci udělat.
//	AI_Output(self,other,"DIA_Jesse_Mission_YES_03_01"); //Thanks, man! You just saved my day! Tell me when things are settled, will you?
//	AI_Output(self,other,"DIA_Jesse_Mission_YES_03_01"); //Danke, Mann! Du bist meine Rettung! Sag mir Bescheid, wenn die Sache gelaufen ist, ja?
	AI_Output(self,other,"DIA_Jesse_Mission_YES_03_01"); //Díky, chlape! Jsi můj zachránce! Řekneš mi, až se věci urovnají, viď?
	Jesse_PayForMe = LOG_RUNNING;

	Info_ClearChoices(DIA_Jesse_Mission);
};

func void DIA_Jesse_Mission_NO()
{
//	AI_Output(other,self,"DIA_Jesse_Mission_NO_15_00"); //Me, pay for you? Forget it!
//	AI_Output(other,self,"DIA_Jesse_Mission_NO_15_00"); //Ich für dich zahlen? Vergiss es!
	AI_Output(other,self,"DIA_Jesse_Mission_NO_15_00"); //Já, platit za tebe? Na to zapomeň!
//	AI_Output(self,other,"DIA_Jesse_Mission_NO_03_01"); //Apparently I was wrong about you. Don't count on me in the future.
//	AI_Output(self,other,"DIA_Jesse_Mission_NO_03_01"); //So kann man sich in jemandem irren. Mit meiner Hilfe rechnest du am besten nicht mehr.
	AI_Output(self,other,"DIA_Jesse_Mission_NO_03_01"); //Asi jsem se v tobě mýlil. Příště už s mou pomocí nepočítej.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(DIA_Jesse_Mission);
};

// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

instance DIA_Jesse_MisSuccess(C_INFO)
{
	npc = Vlk_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_MisSuccess_Condition;
	information = DIA_Jesse_MisSuccess_Info;
	permanent = 0;
//	description = "I paid Bloodwyn!";
//	description = "Ich habe Bloodwyn bezahlt!";
	description = "Zaplatil jsem Bloodwynovi!";
};

func int DIA_Jesse_MisSuccess_Condition()
{ 
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Jesse_MisSuccess_Info()
{
//	AI_Output(other,self,"DIA_Jesse_MisSuccess_15_00"); //I paid Bloodwyn!
//	AI_Output(other,self,"DIA_Jesse_MisSuccess_15_00"); //Ich habe Bloodwyn bezahlt!
	AI_Output(other,self,"DIA_Jesse_MisSuccess_15_00"); //Zaplatil jsem Bloodwynovi!
//	AI_Output(self,other,"DIA_Jesse_MisSuccess_03_01"); //Yeah? Great! Then we're quits now.
//	AI_Output(self,other,"DIA_Jesse_MisSuccess_03_01"); //Ja? Gut! Dann sind wir ja jetzt quitt.
	AI_Output(self,other,"DIA_Jesse_MisSuccess_03_01"); //Ano? Výborně! Tak jsme si kvit.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT

	Info_ClearChoices(DIA_Jesse_MisSuccess);
//	Info_AddChoice(DIA_Jesse_MisSuccess,"WHAAAT? I spent 10 ore on a clue I knew about anyway?",DIA_Jesse_MisSuccess_Waaas);
//	Info_AddChoice(DIA_Jesse_MisSuccess,"WAAAS?! Ich hab' 10 Erz ausgegeben für einen Tip, den ich sowieso schon kannte!?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice(DIA_Jesse_MisSuccess,"COŽEEE?! Utratil jsem 10 nugetů za radu, kterého jsem ani nepotřeboval?",DIA_Jesse_MisSuccess_Waaas);
//	Info_AddChoice(DIA_Jesse_MisSuccess,"Yeah. You scratch my back, I'll scratch yours.",DIA_Jesse_MisSuccess_Ok);
//	Info_AddChoice(DIA_Jesse_MisSuccess,"Genau. Eine Hand wäscht die andere...",DIA_Jesse_MisSuccess_Ok);
	Info_AddChoice(DIA_Jesse_MisSuccess,"Tak. Ruka ruku myje...",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
//	AI_Output(other,self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //WHAAAT? I spent 10 ore on a clue I knew about anyway?
//	AI_Output(other,self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //WAAAS?! Ich hab' 10 Erz ausgegeben für einen Tipp, den ich sowieso schon kannte!?
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //COŽEEE?! Utratil jsem 10 nugetů za radu, kterého jsem ani nepotřeboval?
//	AI_Output(self,other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Apparently.
//	AI_Output(self,other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Sieht so aus.
	AI_Output(self,other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Vypadá to tak.
};

func void DIA_Jesse_MisSuccess_Ok()
{
//	AI_Output(other,self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Yeah. You scratch my back, I'll scratch yours.
//	AI_Output(other,self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Genau. Eine Hand wäscht die andere ...
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Přesně. Ruka ruku myje...
};

//a) <Herek tot>
//b) Herek wird versuchen, 

/* */
