// *******************************
// 				EXIT
// *******************************

instance DIA_GorNaRan_Exit(C_INFO)
{
	npc = TPL_1405_GorNaRan;
	nr = 999;
	condition = DIA_GorNaRan_Exit_Condition;
	information = DIA_GorNaRan_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_GorNaRan_Exit_Condition()
{
	return 1;
};

func void DIA_GorNaRan_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// *******************************
// 				Wache
// *******************************

instance DIA_GorNaRan_Wache(C_INFO)
{
	npc = TPL_1405_GorNaRan;
	nr = 1;
	condition = DIA_GorNaRan_Wache_Condition;
	information = DIA_GorNaRan_Wache_Info;
	important = 0;
	permanent = 1;
//	description = "What are you doing here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};

func int DIA_GorNaRan_Wache_Condition()
{
	return 1;
};

func void DIA_GorNaRan_Wache_Info()
{
//	AI_Output(other,self,"DIA_GorNaRan_Wache_15_00"); //What are you doing here?
//	AI_Output(other,self,"DIA_GorNaRan_Wache_15_00"); //Was machst du hier?
	AI_Output(other,self,"DIA_GorNaRan_Wache_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_GorNaRan_Wache_13_01"); //I'm making sure no swampsharks come too close to the Camp.
//	AI_Output(self,other,"DIA_GorNaRan_Wache_13_01"); //Ich passe auf, das kein Sumpfhai zu nah ans Lager gerät.
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_01"); //Dávám pozor, aby se močáloví žraloci nedostali příliš blízko k táboru.
//	AI_Output(self,other,"DIA_GorNaRan_Wache_13_02"); //If I were you, I'd steer clear of the beasts. You don't stand a chance against them.
//	AI_Output(self,other,"DIA_GorNaRan_Wache_13_02"); //Wenn ich du wäre, würde ich 'nen weiten Bogen um die Viecher machen. Du hast keine Chance gegen sie.
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_02"); //Být tebou, vyhnul bych se těm bestiím. Nemáš proti nim vůbec šanci.
//	AI_Output(self,other,"DIA_GorNaRan_Wache_13_03"); //Now don't disturb me any more, I need to keep my eyes peeled.
//	AI_Output(self,other,"DIA_GorNaRan_Wache_13_03"); //Jetzt stör' mich nicht weiter, ich muss die Augen aufhalten.
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_03"); //Teď už mě neruš, musím dávat bedlivý pozor.
	AI_StopProcessInfos(self);
};

instance Info_TPL_1405_GorNaRan(C_INFO)
{
	npc = TPL_1405_GorNaRan;
	condition = Info_TPL_1405_GorNaRan_Condition;
	information = Info_TPL_1405_GorNaRan_Info;
	important = 1;
	permanent = 0;
};

func int Info_TPL_1405_GorNaRan_Condition()
{
	if (Kapitel == 6)
	{
		return 1;
	};

	return 0;
};

func void Info_TPL_1405_GorNaRan_Info()
{
//	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_01"); //Where do you think you are going? Nobody's allowed to pass here!
//	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_01"); //Wo willst DU hin, hier darf niemand durch!
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_01"); //Kam si myslíš, že jdeš? Nikdo tudy nesmí projít!
};

// ****************** ANGRIFF  *********************

instance Info_TPL_1405_GorNaRan2(C_INFO)
{
	npc = TPL_1405_GorNaRan;
	nr = 1;
	condition = Info_TPL_1405_GorNaRan2_Condition;
	information = Info_TPL_1405_GorNaRan2_Info;
	important = 0;
	permanent = 1;
//	description = "What's going on here anyway?";
//	description = "Was ist hier eigentlich los?";
	description = "Co se tu vlastně děje?";
};

func int Info_TPL_1405_GorNaRan2_Condition()
{
	if (Npc_KnowsInfo(hero,Info_TPL_1405_GorNaRan)) {
		return 1;
	};

	return 0;
};

func void Info_TPL_1405_GorNaRan2_Info()
{
//	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_02"); //What's going on here anyway?
//	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_02"); //Was ist hier eigentlich los?
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_02"); //Co se tu vlastně děje?
//	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_03"); //You're asking me what's going on? Throw yourself into the dust and pay tribute to the Sleeper, because at this very moment he awakens to banish all infidels from this world.
//	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_03"); //Du fragst mich, was hier los ist? Wirf dich in den Staub und huldige dem Schläfer, denn just in diesem Moment erwacht er und wird alle Ungläubigen vom Antlitz dieser Welt verbannen.
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_03"); //Ptáš se mě, co se tu děje? Vrhni se do prachu a vzdej hold Spáčovi, který za okamžik procitne, a zatratí všechny bezvěrce na tomhle světě.
};

// ****************** ANGRIFF  *********************

instance Info_TPL_1405_GorNaRan3(C_INFO)
{
	npc = TPL_1405_GorNaRan;
	nr = 1;
	condition = Info_TPL_1405_GorNaRan3_Condition;
	information = Info_TPL_1405_GorNaRan3_Info;
	important = 0;
	permanent = 1;
//	description = "Just wanted to have a look around.";
//	description = "Wollte mich nur umsehen";
	description = "Chtěl jsem se tu jen porozhlédnout.";
};

func int Info_TPL_1405_GorNaRan3_Condition()
{
	if (Npc_KnowsInfo(hero,Info_TPL_1405_GorNaRan)) {
		return 1;
	};

	return 0;
};

func void Info_TPL_1405_GorNaRan3_Info()
{
//	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_04"); //Just wanted to have a look around.
//	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_04"); //Wollte mich nur umsehen.
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_04"); //Chtěl jsem se tu jen porozhlédnout.
//	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_05"); //You worm, you and your kind have no business here when the Sleeper awakes! I'll have to clear you out of the way.
//	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_05"); //Du Wurm, du und deinesgleichen haben hier nichts zu suchen, wenn der Schläfer erwacht! Ich werde dich aus dem Weg räumen müssen.
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_05"); //Ty červe, ty a tobě podobní tady nemáte co pohledávat, až Spáč procitne! Budu tě muset odstranit z cesty.

	AI_StopProcessInfos(self);

	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack, 1 ,"");
};

instance Info_TPL_1405_GorNaRan4(C_INFO)
{
	npc = TPL_1405_GorNaRan;
	nr = 1;
	condition = Info_TPL_1405_GorNaRan4_Condition;
	information = Info_TPL_1405_GorNaRan4_Info;
	important = 0;
	permanent = 0;
//	description = "You can't stop me!";
//	description = "Du kannst mich nicht aufhalten!";
	description = "Nemůžeš mě zastavit!";
};

func int Info_TPL_1405_GorNaRan4_Condition()
{
	if (Npc_KnowsInfo(hero,Info_TPL_1405_GorNaRan)) {
		return 1;
	};

	return 0;
};

func void Info_TPL_1405_GorNaRan4_Info()
{
//	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_06"); //You can't stop me!
//	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_06"); //Du kannst mich nicht aufhalten!
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_06"); //Nemůžeš mě zastavit!
//	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_07"); //Whatever you say, boy, for the Sleeper!
//	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_07"); //Wie du meinst, Junge, für den Schläfer!
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_07"); //Jak myslíš, chlapče. Za Spáče!

	AI_StopProcessInfos(self);

	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack, 1 ,"");
};
