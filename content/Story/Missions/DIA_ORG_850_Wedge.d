// ****************************************
// 					Exit
// ****************************************

instance DIA_Wedge_Exit(C_INFO)
{
	npc = ORG_850_Wedge;
	nr = 999;
	condition = DIA_Wedge_Exit_Condition;
	information = DIA_Wedge_Exit_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

func void DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ****************************************
// 					Psst
// ****************************************

instance DIA_Wedge_Psst(C_INFO)
{
	npc = Org_850_Wedge;
	nr = 1;
	condition = DIA_Wedge_Psst_Condition;
	information = DIA_Wedge_Psst_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Wedge_Psst_Condition()
{ 
	if ((Npc_GetDistToNpc(hero,self) < 900) && (Wld_IsTime(08,00,23,30)))
	{
		return TRUE;
	};
};
func void DIA_Wedge_Psst_Info()
{
//	AI_Output(self,other,"DIA_Wedge_Psst_05_00"); //Sshh... hey, you!
//	AI_Output(self,other,"DIA_Wedge_Psst_05_00"); //Psst ... Hey,  du!
	AI_Output(self,other,"DIA_Wedge_Psst_05_00"); //Pssss... hej, ty!
//	AI_Output(other,self,"DIA_Wedge_Psst_15_01"); //Who?... Me?
//	AI_Output(other,self,"DIA_Wedge_Psst_15_01"); //Wer? ... ich?
	AI_Output(other,self,"DIA_Wedge_Psst_15_01"); //Kdo?... Já?
//	AI_Output(self,other,"DIA_Wedge_Psst_05_02"); //Exactly... Come over here!
//	AI_Output(self,other,"DIA_Wedge_Psst_05_02"); //Genau du ... Komm mal her!
	AI_Output(self,other,"DIA_Wedge_Psst_05_02"); //Přesně tak... Pojď sem!
	AI_StopProcessInfos(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance DIA_Wedge_Hello(C_INFO)
{
	npc = Org_850_Wedge;
	condition = DIA_Wedge_Hello_Condition;
	information = DIA_Wedge_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "What do you want?"; 
//	description = "Was willst du von mir?"; 
	description = "Co chceš?"; 
};

func int DIA_Wedge_Hello_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};

};
func void DIA_Wedge_Hello_Info()
{
//	AI_Output(other,self,"DIA_Wedge_Hello_15_00"); //What do you want?
//	AI_Output(other,self,"DIA_Wedge_Hello_15_00"); //Was willst du von mir?
	AI_Output(other,self,"DIA_Wedge_Hello_15_00"); //Co chceš?
//	AI_Output(self,other,"DIA_Wedge_Hello_05_01"); //You've just arrived, haven't you? I noticed it straight away.
//	AI_Output(self,other,"DIA_Wedge_Hello_05_01"); //Du bist noch nicht lange hier, was? So was sehe ich direkt.
	AI_Output(self,other,"DIA_Wedge_Hello_05_01"); //Právě jsi sem přišel, viď? Hned jsem si toho všiml.
//	AI_Output(self,other,"DIA_Wedge_Hello_05_02"); //There are a lot of things you need to know. I can teach you a few things.
//	AI_Output(self,other,"DIA_Wedge_Hello_05_02"); //Es gibt 'ne Menge Sachen, die du hier wissen musst. Einige davon kann ich dir beibringen.
	AI_Output(self,other,"DIA_Wedge_Hello_05_02"); //Je spousta věcí, které potřebuješ vědět. Můžu tě pár věcí naučit.
//	AI_Output(self,other,"DIA_Wedge_Hello_05_03"); //Besides, you have to watch who you talk to. Butch, for example - that's the guy over there, next to the campfire... Be aware of him!
//	AI_Output(self,other,"DIA_Wedge_Hello_05_03"); //Außerdem musst du hier aufpassen, mit wem du redest. Butch zum Beispiel - der Typ da drüben am Lagerfeuer, vor dem musst du dich in Acht nehmen.
	AI_Output(self,other,"DIA_Wedge_Hello_05_03"); //Mimo jiné musíš dávat pozor na to, s kým mluvíš. Tak například Butch - to je ten chlapík támhle, vedle táborového ohně... Dávej si na něj pozor!
};  

// ****************************************
// 				Was ist mit Butch
// ****************************************

instance DIA_Wedge_WarnsOfButch(C_INFO)
{
	npc = Org_850_Wedge;
	condition = DIA_Wedge_WarnsOfButch_Condition;
	information = DIA_Wedge_WarnsOfButch_Info;
	important = 0;
	permanent = 0;
//	description = "What's the matter with Butch?"; 
//	description = "Was ist mit Butch?"; 
	description = "Co je s Butchem?"; 
};

func int DIA_Wedge_WarnsOfButch_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};

};
func void DIA_Wedge_WarnsOfButch_Info()
{
//	AI_Output(other,self,"DIA_Wedge_WarnsOfButch_15_00"); //What's the matter with Butch?
//	AI_Output(other,self,"DIA_Wedge_WarnsOfButch_15_00"); //Was ist mit Butch?
	AI_Output(other,self,"DIA_Wedge_WarnsOfButch_15_00"); //Co je s Butchem?
//	AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_01"); //He has the mean habit of beating up the new ones. So you'd better avoid meeting him.
//	AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_01"); //Er hat die fiese Angewohnheit, Neuen zur Begrüßung das Fell über die Ohren zu ziehen. Also geh' ihm am besten aus dem Weg.
	AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_01"); //Má ve zvyku mlátit nováčky. Raději se mu vyhýbej.
	//AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_02"); //Also, geh ihm am besten aus dem Weg.//***Doppelt***
};  

// ****************************************
// 					Lehrer
// ****************************************

instance DIA_Wedge_Lehrer(C_INFO)
{
	npc = Org_850_Wedge;
	nr = 700;
	condition = DIA_Wedge_Lehrer_Condition;
	information = DIA_Wedge_Lehrer_Info;
	permanent = 1;
//	description = "What can you teach me?"; 
//	description = "Was kannst du mir beibringen?"; 
	description = "Co mě můžeš naučit?"; 
};

func int DIA_Wedge_Lehrer_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Wedge_Hello))
	{ 
		return TRUE; 
	};
};

func void DIA_Wedge_Lehrer_Info()
{
	if (log_wedgelearn == FALSE)
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
//		B_LogEntry(GE_TeacherNC,"Wedge, the rogue, can teach me the talents of SNEAKING, PICKPOCKETING and LOCK PICKING.");
//		B_LogEntry(GE_TeacherNC,"Wedge der Bandit, kann mir die Talente SCHLEICHEN, TASCHENDIEBSTAHL und SCHLÖSSER ÖFFNEN beibringen.");
		B_LogEntry(GE_TeacherNC,"Bandita Wedge mě může učit dovednostem PLÍŽENÍ, VYBÍRÁNÍ KAPES a PÁČENÍ ZÁMKŮ.");
		log_wedgelearn = TRUE ;
	};
//	AI_Output(other,self,"DIA_Wedge_Lehrer_15_00"); //What can you teach me?
//	AI_Output(other,self,"DIA_Wedge_Lehrer_15_00"); //Was kannst du mir beibringen?
	AI_Output(other,self,"DIA_Wedge_Lehrer_15_00"); //Co mě můžeš naučit?
//	AI_Output(self,other,"DIA_Wedge_Lehrer_05_01"); //It depends... What do you want to know?
//	AI_Output(self,other,"DIA_Wedge_Lehrer_05_01"); //Kommt drauf an, was willst du wissen?
	AI_Output(self,other,"DIA_Wedge_Lehrer_05_01"); //To záleží... Co chceš umět?

	Info_ClearChoices(DIA_Wedge_Lehrer);
	Info_AddChoice(DIA_Wedge_Lehrer,DIALOG_BACK ,DIA_Wedge_Lehrer_BACK);
	if (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0),DIA_Wedge_Lehrer_Pickpocket2);
	};
	if (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0),DIA_Wedge_Lehrer_Pickpocket);
	};
	if (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2, LPCOST_TALENT_PICKLOCK_2,0),DIA_Wedge_Lehrer_Lockpick2);
	};
	if (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1, LPCOST_TALENT_PICKLOCK_1,0),DIA_Wedge_Lehrer_Lockpick);
	};
	if (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak, LPCOST_TALENT_SNEAK,0),DIA_Wedge_Lehrer_Schleichen);
	};
};

func void DIA_Wedge_Lehrer_Schleichen()
{
//	AI_Output(other,self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //I want to learn how to sneak around.
//	AI_Output(other,self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Ich will lernen, mich lautlos zu bewegen.
	AI_Output(other,self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Chci se naučit plížit.
	if (B_GiveSkill(other,NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //It's all a matter of keeping your balance. You also have to learn how to control your breath.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //Es ist alles eine Frage des Gleichgewichts. Du musst auch lernen, deinen Atem zu kontrollieren.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //To je záležitost udržení rovnováhy. Také se musíš naučit ovládat svůj dech.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Pay attention to your posture and nobody will hear you moving.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Beachte die richtige Haltung, und niemand wird dich hören, wenn du dich bewegst.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Dávej pozor na držení těla a nikdo tvůj pohyb neuslyší...
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
//	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //How can I improve my lock-picking skills?
//	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Wie werde ich besser im Knacken von Schlössern?
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Jak můžu vylepšit své umění v otevírání zámků?

	if (B_GiveSkill(other,NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //You'd like to know that, wouldn't you! It's not too difficult to begin with.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //Das willst du gerne wissen, hm? Ist für den Anfang nicht so schwer.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //To bys rád věděl, co? Není těžké s tím začít.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Above all, you have to make sure that your lockpick doesn't break off.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Du musst vor allem darauf achten, dass dir dein Dietrich nicht abbricht.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Především se musíš ujistit, že se tvůj paklíč nezlomí.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //If you're a little bit more patient in the future, you'll see that you won't need that many lockpicks any more!
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Wenn du in Zukunft mit weniger Gewalt an die Sache rangehst, wirst du merken, dass du weniger Dietriche verbrauchst!
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Když budeš v budoucnu trochu trpělivější, uvidíš, že nebudeš potřebovat tolik paklíčů!
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
//	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //How can I become an expert at picking locks?
//	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Wie werde ich ein Meister im Öffnen von Schlössern?
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Jak se ze mě stane odborník na vylamování zámků?

	if (B_GiveSkill(other,NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Only when you've gained some experience can you tell when a lockpick is going to break. It makes a different sound!
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Nur wer schon einige Übung hat, merkt genau, wann ihm ein Dietrich abbricht und wann nicht. Du erkennst es am Geräusch!
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Jedině když získáš nějaké zkušenosti, budeš moci říci, jestli se paklíč zlomí. Vydává jiný zvuk!
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //I think you have it. Learn to listen for the gentle clicking of the lock and you won't lose so many lockpicks in future.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //Ich denke, du bist jetzt so weit - lerne auf das leise Klicken des Schlosses zu achten, und du wirst nur noch selten das Pech haben, einen Dietrich zu verlieren.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //Myslím, že to máš. Nauč se poslouchat to jemné cvaknutí zámku a pak už nebudeš přicházet o tolik paklíčů.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //An expert in this field stands a good chance of opening a trunk without breaking his lockpick.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Ein Meister des Fachs hat eine gute Chance, eine Truhe zu öffnen, ohne dass sein Dietrich überhaupt abbricht.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Odborník v tomhle oboru má velkou šanci, že otevře zámek, aniž by zlomil svůj paklíč.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
//	AI_Output(other,self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //I want to become a skilled pickpocket!
//	AI_Output(other,self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Ich will ein guter Taschendieb werden!
	AI_Output(other,self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Chci se stát zběhlým kapsářem.
	if (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other,NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
//			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //So you want to relieve a few people of their belongings? Well then.
//			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //So, du willst also ein paar Leute um ihre Sachen erleichtern? Nun gut.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //Takže chceš pár lidem odlehčit o jejich majetek? Dobrá teda.
//			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //I'll teach you how to improve your skills, but it's still very likely that you'll get caught.
//			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Ich werde dir beibringen, wie du besser wirst, aber es besteht immer noch eine Chance, dass du erwischt wirst.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Naučím tě, jak zlepšit své umění, ale přesto bude dost pravděpodobné, že tě přitom chytnou.
//			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //You should only take the risk if nobody but your victim is around.
//			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //Das Risiko solltest du nur eingehen, wenn außer deinem Opfer niemand sonst da ist.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //Měl bys to zkoušet pouze tehdy, až nebude kolem nikdo, než ty a tvoje oběť.
//			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Only an expert can take things from people's pockets without them noticing!
//			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Erst als Meister wirst du in der Lage sein, jemanden etwas aus der Tasche zu ziehen, ohne dass er es bemerkt!
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Jedině odborník dokáže vzít lidem věci z kapes, aniž by si toho všimli!
		};
	}
	else
	{
//		AI_Output(self,other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Forget it! You'll never make a skilled thief unless you can sneak around.
//		AI_Output(self,other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Vergiss es! Ohne dass du schleichen kannst, wirst du NIEMALS ein geschickter Dieb.
		AI_Output(self,other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Zapomeň na to! Nikdy z tebe nebude zkušený zloděj, dokud se nebudeš umět plížit.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
//	AI_Output(other,self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //I want to become an expert pickpocket!
//	AI_Output(other,self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Ich will ein Meister der Taschendiebe werden!
	AI_Output(other,self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Chci se stát kapsářským odborníkem!

	if (B_GiveSkill(other,NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{ 
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //I think you've progressed far enough to be taught the final tricks of the trade.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //Ich denke, du bist gut genug, um in die letzten Geheimnisse eingeweiht zu werden.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //Myslím, že jsi pokročil tak daleko, že tě můžu naučit poslední triky tohohle řemesla.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //But you should know that even the best can get caught sometimes.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //Du solltest aber wissen, dass es selbst den Besten manchmal passiert, dass sie bemerkt werden.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //Měl bys ale vědět, že i ten nejlepší může být někdy přistižen.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Take care.
//		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Also pass auf dich auf.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Opatruj se.
	};
};

func void DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Wedge_Lehrer);
};

