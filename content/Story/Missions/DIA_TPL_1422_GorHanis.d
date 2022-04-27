// **************************************************
//						 EXIT
// **************************************************

instance Info_GorHanis_Exit(C_INFO)
{
	npc = TPL_1422_GorHanis;
	nr = 999;
	condition = Info_GorHanis_Exit_Condition;
	information = Info_GorHanis_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_GorHanis_Exit_Condition()
{
	return 1;
};

func void Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_GorHanis_What(C_INFO)
{
	npc = TPL_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_What_Condition;
	information = Info_GorHanis_What_Info;
	important = 0;
	permanent = 0;
//	description = "What are you doing here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};

func int Info_GorHanis_What_Condition()
{
	return 1;
};

func void Info_GorHanis_What_Info()
{
//	AI_Output(other,self,"Info_GorHanis_What_15_00"); //What are you doing here?
//	AI_Output(other,self,"Info_GorHanis_What_15_00"); //Was machst du hier?
	AI_Output(other,self,"Info_GorHanis_What_15_00"); //Co tady děláš?
//	AI_Output(self,other,"Info_GorHanis_What_08_01"); //Me? I'm fighting for the glory of the Sleeper!
//	AI_Output(self,other,"Info_GorHanis_What_08_01"); //Ich? Ich kämpfe für den Ruhm des Schläfers!
	AI_Output(self,other,"Info_GorHanis_What_08_01"); //Já? Bojuju za slávu Spáče!
};

// **************************************************
//					Arena
// **************************************************

instance Info_GorHanis_Arena(C_INFO)
{
	npc = TPL_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_Arena_Condition;
	information = Info_GorHanis_Arena_Info;
	important = 0;
	permanent = 1;
//	description = "You fight in the arena?";
//	description = "Du kämpfst in der Arena?";
	description = "Bojuješ v aréně?";
};

func int Info_GorHanis_Arena_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};

	return 0;
};

func void Info_GorHanis_Arena_Info()
{
//	AI_Output(other,self,"Info_GorHanis_Arena_15_00"); //You fight in the arena?
//	AI_Output(other,self,"Info_GorHanis_Arena_15_00"); //Du kämpfst in der Arena?
	AI_Output(other,self,"Info_GorHanis_Arena_15_00"); //Bojuješ v aréně?
//	AI_Output(self,other,"Info_GorHanis_Arena_08_01"); //I was sent here from the swamp by my masters to fight for the Sleeper.
//	AI_Output(self,other,"Info_GorHanis_Arena_08_01"); //Ich wurde von meinen Meistern aus dem Sumpf hierher geschickt, um für den Schläfer zu kämpfen.
	AI_Output(self,other,"Info_GorHanis_Arena_08_01"); //Byl jsem vyslaný svými mistry z bažin, abych bojoval za Spáče.
//	AI_Output(self,other,"Info_GorHanis_Arena_08_02"); //I'll fight here for his higher glory - so all infidels can see how strong his power has made me!
//	AI_Output(self,other,"Info_GorHanis_Arena_08_02"); //Zu seiner höheren Ehre kämpfe ich hier - Auf dass alle Ungläubigen sehen, wie stark ich dank seiner Macht geworden bin!
	AI_Output(self,other,"Info_GorHanis_Arena_08_02"); //Bojuji tu za jeho vyšší čest - Ať všichni nevěřící vídí, jak silný jsem se díky jeho moci stal.
};

// **************************************************
//					Schläfer
// **************************************************

instance Info_GorHanis_Sleeper(C_INFO)
{
	npc = TPL_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Sleeper_Condition;
	information = Info_GorHanis_Sleeper_Info;
	important = 0;
	permanent = 0;
//	description = "What is the Sleeper?";
//	description = "Was ist der Schläfer?";
	description = "Co je to Spáč?";
};

func int Info_GorHanis_Sleeper_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};

	return 0;
};

func void Info_GorHanis_Sleeper_Info()
{
//	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00"); //What is the Sleeper?
//	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00"); //Was ist der Schläfer?
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00"); //Co je to Spáč?
//	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01"); //You will find priests who'll be able to answer that question better than I can in our camp.
//	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01"); //Bei uns im Lager findest du Priester, die dir diese Frage besser beantworten können als ich.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01"); //V našem táboře najdeš kněze, kteří ti tuhle otázku budou schopni zodpovědět lépe než já.
//	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02"); //I'll just tell you this much: The Sleeper is our redeemer, he has led us to this place and he'll get us out of here.
//	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02"); //Ich will dir nur so viel sagen: Der Schläfer ist unser Erlöser, er hat uns an diesen Ort geführt, und er wird uns auch wieder hier herausholen.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02"); //Můžu ti říci jen tohle: Spáč je náš spasitel, který nás přivedl na tohle místo a který nás odtud zase vyvede.
//	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03"); //You mean you're waiting for your god to liberate you?
//	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03"); //Du meinst, ihr wartet darauf, dass euch euer Gott befreit?
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03"); //Tím chceš říci, že čekáte, až vás váš bůh osvobodí?
//	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04"); //Yes! And the wait will soon be over. A great invocation is currently being prepared.
//	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04"); //Ja! Und das Warten wird bald ein Ende haben. Die Vorbereitungen für eine große Anrufung laufen schon.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04"); //Ano! A to čekání brzy skončí. Přípravy na velké vzývání už probíhají!
};

// **************************************************
//					Große Anrufung
// **************************************************

instance Info_GorHanis_Summoning(C_INFO)
{
	npc = TPL_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Summoning_Condition;
	information = Info_GorHanis_Summoning_Info;
	important = 0;
	permanent = 0;
//	description = "What kind of invocation is it you're planning?";
//	description = "Was ist das für eine große Anrufung, die ihr plant?";
	description = "Jaký druh vzývání připravujete?";
};

func int Info_GorHanis_Summoning_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};

	return 0;
};

func void Info_GorHanis_Summoning_Info()
{
//	AI_Output(other,self,"Info_GorHanis_Summoning_15_00"); //What kind of invocation is it you're planning?
//	AI_Output(other,self,"Info_GorHanis_Summoning_15_00"); //Was ist das für eine große Anrufung, die ihr plant?
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00"); //Jaký druh vzývání připravujete?
//	AI_Output(self,other,"Info_GorHanis_Summoning_08_01"); //Our prophets say that the common invocation of the Sleeper is the key to freedom!
//	AI_Output(self,other,"Info_GorHanis_Summoning_08_01"); //Unsere Propheten sagen, die gemeinsame Anrufung des Schläfers sei der Schlüssel zur Freiheit für uns alle!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01"); //Naši proroci říkají, že společné vzývání Spáče je naším klíčem ke svobodě!
//	AI_Output(self,other,"Info_GorHanis_Summoning_08_02"); //If you want to find out more about it, just come to our camp.
//	AI_Output(self,other,"Info_GorHanis_Summoning_08_02"); //Wenn du mehr darüber erfahren willst, begib dich zu uns ins Lager.
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02"); //Jestli se chceš o tom dozvědět víc, jdi do našeho tábora.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance Info_GorHanis_WayToST(C_INFO)
{
	npc = TPL_1422_GorHanis;
	nr = 0;
	condition = Info_GorHanis_WayToST_Condition;
	information = Info_GorHanis_WayToST_Info;
	important = 0;
	permanent = 1;
//	description = "Could you describe the way to your camp?";
//	description = "Kannst du mir den Weg zu eurem Lager beschreiben?";
	description = "Můžeš mi popsat cestu do vašeho tábora?";
};

func int Info_GorHanis_WayToST_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_GorHanis_Sleeper))
	|| (Npc_KnowsInfo(hero,Info_GorHanis_Summoning)))
	{
		return 1;
	};

	return 0;
};

func void Info_GorHanis_WayToST_Info()
{
//	AI_Output(other,self,"Info_GorHanis_WayToST_15_00"); //Could you describe the way to your camp?
//	AI_Output(other,self,"Info_GorHanis_WayToST_15_00"); //Kannst du mir den Weg zu eurem Lager beschreiben?
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00"); //Můžeš mi popsat cestu do vašeho tábora?
//	AI_Output(self,other,"Info_GorHanis_WayToST_08_01"); //There are always some novices around here in the Old Camp, willing to accompany newcomers like you to our camp. You only need to speak to them!
//	AI_Output(self,other,"Info_GorHanis_WayToST_08_01"); //Hier im Alten Lager sind immer einige Novizen, die Neuankömmlinge wie dich in unser Lager begleiten. Du musst sie nur ansprechen!
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01"); //Ve Starém táboře je několik noviců, kteří jsou ochotní doprovázet nové příchozí jako jsi ty do našeho tábora. Musíš jim jen říct!
};

// **************************************************
//					FORDERN
// **************************************************

instance Info_GorHanis_Charge(C_INFO)
{
	npc = TPL_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_Charge_Condition;
	information = Info_GorHanis_Charge_Info;
	important = 0;
	permanent = 0;
//	description = "I challenge you to a duel in the arena!";
//	description = "Ich fordere dich zum Duell in der Arena!";
	description = "Vyzývám tě na souboj v aréně!";
};

func int Info_GorHanis_Charge_Condition()
{
	if (Npc_KnowsInfo(hero,Info_GorHanis_Arena))
	{
		return 1;
	};

	return 0;
};

func void Info_GorHanis_Charge_Info()
{
//	AI_Output(other,self,"Info_GorHanis_Charge_15_00"); //I challenge you to a duel in the arena!
//	AI_Output(other,self,"Info_GorHanis_Charge_15_00"); //Ich fordere dich zum Duell in der Arena!
	AI_Output(other,self,"Info_GorHanis_Charge_15_00"); //Vyzývám tě na souboj v aréně!
//	AI_Output(self,other,"Info_GorHanis_Charge_08_01"); //It will not serve the glory of the Sleeper if I slaughter just any bum in front of the audience.
//	AI_Output(self,other,"Info_GorHanis_Charge_08_01"); //Es dient nicht der höheren Ehre des Schläfers, wenn ich einen dahergelaufenen Bauertölpel vorm Publikum niedermetzele.
	AI_Output(self,other,"Info_GorHanis_Charge_08_01"); //Neposloužilo by příliš Spáčově slávě, kdybych před obecenstvem zabil nějakého ťulpase.
//	AI_Output(self,other,"Info_GorHanis_Charge_08_02"); //I'll only fight against you when you've become a worthy opponent.
//	AI_Output(self,other,"Info_GorHanis_Charge_08_02"); //Ich werde erst gegen dich kämpfen, wenn du ein würdiger Gegner für mich bist.
	AI_Output(self,other,"Info_GorHanis_Charge_08_02"); //Budu proti tobě bojovat jedině v případě, že mi budeš důstojným protivníkem.
//	AI_Output(self,other,"Info_GorHanis_Charge_08_03"); //But I'm sure that the fighters from the Old or New Camp aren't all men of principle…
//	AI_Output(self,other,"Info_GorHanis_Charge_08_03"); //Aber ich bin mir sicher, die Kämpfer aus dem Alten oder dem Neuen Lager haben nicht so einen hohen moralischen Anspruch ...
	AI_Output(self,other,"Info_GorHanis_Charge_08_03"); //Ale jsem si jistý, že bojovníci ze Starého nebo Nového tábora nemají tak vysoké morální zásady...
};

// **************************************************
//					NOCHMAL FORDERN
// **************************************************

instance Info_GorHanis_ChargeGood(C_INFO)
{
	npc = TPL_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_ChargeGood_Condition;
	information = Info_GorHanis_ChargeGood_Info;
	important = 0;
	permanent = 1;
//	description = "Am I now strong enough to fight against you?";
//	description = "Bin ich jetzt gut genug, um gegen dich zu kämpfen?";
	description = "Jsem už dost silný, abych se s tebou mohl utkat?";
};

func int Info_GorHanis_ChargeGood_Condition()
{
	if (Npc_KnowsInfo(hero,Info_GorHanis_Charge))
	{
		return 1;
	};

	return 0;
};

func void Info_GorHanis_ChargeGood_Info()
{
//	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00"); //Am I now strong enough to fight against you?
//	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00"); //Bin ich jetzt gut genug, um gegen dich zu kämpfen?
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00"); //Jsem už dost silný, abych se s tebou mohl utkat?
//	AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01"); //No! Your strength is insufficient - you're no opponent for me!
//	AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01"); //Nein! Deine Stärke reicht noch nicht aus - du bist kein Gegner für mich!
	AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01"); //Ne! Nemáš dost síly - nejsi pro mě protivník!
};

/*

// infos
instance Info_TPL_1422_GorHanis(C_INFO)
{
	npc = TPL_1422_GorHanis;
	condition = Info_TPL_1422_GorHanis_Condition;
	information = Info_TPL_1422_GorHanis_Info;
	important = 1;
	permanent = 0;
};

func int Info_TPL_1422_GorHanis_Condition()
{
	if (Npc_KnowsInfo(hero,Info_PC_Mage_LoadSword3 )) {
		return 1;
	};
};

func void Info_TPL_1422_GorHanis_Info()
{
	AI_Output(self,other,"Info_TPL_1422_GorHanis_08_01"); //Was machst du hier?
};

instance Info_TPL_1422_GorHanis1(C_INFO)
{
	npc = TPL_1422_GorHanis;
	condition = Info_TPL_1422_GorHanis1_Condition;
	information = Info_TPL_1422_GorHanis1_Info;
	important = 0;
	permanent = 0;
	description = "Ich will helfen den Schläfer zu erwecken.";
};

func int Info_TPL_1422_GorHanis1_Condition()
{
	if (Npc_KnowsInfo(hero,Info_TPL_1422_GorHanis )) {
		return 1;
	};
};

func void Info_TPL_1422_GorHanis1_Info()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis1_15_01"); //Ich will helfen den Schläfer zu erwecken.
	AI_Output(self,other,"Info_TPL_1422_GorHanis1_08_02"); //Hmm, siehst gar nicht so aus, als wolltest Du wirklich helfen wollen. Geh aber ruhig weiter, ich halte dich nicht auf, falls du lügst, wird der Hohenpriester dir schon eine Lektion erteilen.
};

instance Info_TPL_1422_GorHanis2(C_INFO)
{
	npc = TPL_1422_GorHanis;
	condition = Info_TPL_1422_GorHanis2_Condition;
	information = Info_TPL_1422_GorHanis2_Info;
	important = 0;
	permanent = 0;
	description = "Das geht dich nichts an!";
};

func int Info_TPL_1422_GorHanis2_Condition()
{
	if (Npc_KnowsInfo(hero,Info_TPL_1422_GorHanis )) {
		return 1;
	};
};

func void Info_TPL_1422_GorHanis2_Info()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis2_15_01"); //Das geht dich nichts an!
//	AI_Output(self,other,"Info_TPL_1422_GorHanis2_08_02"); //Soso, dann lasse ich dich lieber passieren, bevor du mir weh tust (lacht). Am Hohenpriester kommst Du eh nicht vorbei und ich muss mein Schwert nicht mit deinem Blut beschmutzen.
	AI_Output(self,other,"Info_TPL_1422_GorHanis2_08_02"); //Soso, dann lasse ich dich lieber passieren, bevor du mir weh tust (lacht). Am Hohenpriester kommst Du eh nicht vorbei und ich muss mein Schwert nicht mit deinem Blut beschmutzen.
};

instance Info_TPL_1422_GorHanis3(C_INFO)
{
	npc = TPL_1422_GorHanis;
	condition = Info_TPL_1422_GorHanis3_Condition;
	information = Info_TPL_1422_GorHanis3_Info;
	important = 0;
	permanent = 0;
	description = "Wie seit ihr an dem Priester vorbei gekommen?";
};

func int Info_TPL_1422_GorHanis3_Condition()
{
	if (Npc_KnowsInfo(hero,Info_TPL_1422_GorHanis2 )) || (Npc_KnowsInfo(hero,Info_TPL_1422_GorHanis1 )) {
		return 1;
	};
};

func void Info_TPL_1422_GorHanis3_Info()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis3_15_01"); //Wie seit ihr an dem Priester vorbei gekommen?
	AI_Output(self,other,"Info_TPL_1422_GorHanis3_08_02"); //Ich sage es dir, es wird dir eh nicht nutzen. Der Priester hat uns nur passieren lassen, weil Meister Kalom mit im gesprochen hat, dass Glück wirst du nicht haben. Geh nur (lacht).
};
*/
