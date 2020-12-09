// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_STT_331_Fingers_Exit(C_INFO)
{
	npc = STT_331_Fingers;
	nr = 999;
	condition = DIA_STT_331_Fingers_Exit_Condition;
	information = DIA_STT_331_Fingers_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

func void DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 				 Schatten werden
// **************************************************
	var int Fingers_CanTeach;
// **************************************************

instance DIA_Fingers_BecomeShadow(C_INFO)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_BecomeShadow_Condition;
	information = DIA_Fingers_BecomeShadow_Info;
	permanent = 1;
//	description = "I want to become a Shadow!"; 
//	description = "Ich will Schatten werden!"; 
	description = "Chci se stát Stínem!"; 
};

func int DIA_Fingers_BecomeShadow_Condition()
{ 
	if ((Fingers_CanTeach == FALSE))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Fingers_BecomeShadow_Info()
{
//	AI_Output(other,self,"DIA_Fingers_BecomeShadow_15_00"); //I want to become a Shadow!
//	AI_Output(other,self,"DIA_Fingers_BecomeShadow_15_00"); //Ich will Schatten werden!
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_15_00"); //Chci se stát Stínem!
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_05_01"); //So?
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_05_01"); //Und?
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_05_01"); //No a?
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
	Info_AddChoice(DIA_Fingers_BecomeShadow,DIALOG_BACK ,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
//		Info_AddChoice(DIA_Fingers_BecomeShadow,"I'm looking for somebody to teach me something.",DIA_Fingers_BecomeShadow_TeachMe);
//		Info_AddChoice(DIA_Fingers_BecomeShadow,"Ich suche jemanden, der mir was beibringt.",DIA_Fingers_BecomeShadow_TeachMe);
		Info_AddChoice(DIA_Fingers_BecomeShadow,"Hledám někoho, kdo mě něco naučí.",DIA_Fingers_BecomeShadow_TeachMe);
	};
//	Info_AddChoice(DIA_Fingers_BecomeShadow,"Can you help me?",DIA_Fingers_BecomeShadow_AnyTips);
//	Info_AddChoice(DIA_Fingers_BecomeShadow,"Kannst du mir dabei helfen?",DIA_Fingers_BecomeShadow_AnyTips);
	Info_AddChoice(DIA_Fingers_BecomeShadow,"Můžeš mi pomoci?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
//	AI_Output(other,self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Can you help me?
//	AI_Output(other,self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Kannst du mir dabei helfen?
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Můžeš mi pomoci?
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //I wouldn't know how...
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Ich wüsste nicht, wie ...
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Nevím jak...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
//	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //I'm looking for somebody to teach me something.
//	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Ich suche jemanden, der mir was beibringt.
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Hledám někoho, kdo mě něco naučí.
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //Why have you come to me?
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //Wie kommst du auf mich?
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //Proč jsi ke mně přišel?
//	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Diego sent me.
//	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Diego schickt mich.
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Poslal mě Diego.
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //You should have said that before.
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //Sag das doch gleich.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //To jsi měl říci rovnou.
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //If you wanna join the Camp, it's an advantage to be a good fighter or thief.
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Wenn du im Lager aufgenommen werden willst, hilft es, wenn du ein geschickter Kämpfer oder Dieb bist.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Jestli se chceš přidat k táboru, pak je výhodné být dobrý bojovník nebo zloděj.
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //If the influential Shadows in this camp test you, they'll give you tasks you'd better not get caught doing.
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Wenn die einflussreichen Schatten in diesem Lager dich auf die Probe stellen, werden sie dir Aufträge geben, bei denen du dich besser nicht erwischen lässt.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Jestli tě budou tady v táboře zkoušet nezávislé Stíny, dají ti takové úkoly, které nebudeš nejspíš schopný splnit.
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //That's why the way of the thief would be a good start to you.
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Deswegen ist für den Anfang der Weg des Diebes für dich vielversprechender.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Proto by ses pro začátek mohl stát zlodějem.
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Incidentally, I'm the best thief in the whole of the Old Camp.
//	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Wie es der Zufall so will, bin ich der beste Dieb im ganzen Alten Lager.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Mimochodem, já jsem nejlepší zloděj z celého Starého tábora.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
//	B_LogEntry(GE_TeacherOC,"Fingers can teach me the skills of PICKPOCKETING and how to OPEN LOCKS");
//	B_LogEntry(GE_TeacherOC,"Fingers kann mir die Talente der TASCHENDIEBSTAHL und SCHLÖSSER ÖFFNEN beibringen");
	B_LogEntry(GE_TeacherOC,"Fingers mě může naučit dovednost VYBÍRÁNÍ KAPES a OTEVÍRÁNÍ ZÁMKŮ.");
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};

// **************************************************
// 						 Lehrer
// **************************************************
	var int Fingers_Wherecavalorn;

instance DIA_Fingers_Lehrer(C_INFO)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Lehrer_Condition;
	information = DIA_Fingers_Lehrer_Info;
	permanent = 1;
//	description = "What can you teach me?"; 
//	description = "Was kannst du mir beibringen?"; 
	description = "Co mě můžeš naučit?"; 
};

func int DIA_Fingers_Lehrer_Condition()
{ 
	if (Fingers_CanTeach == TRUE)
	{
		return 1; 
	};
};

func void DIA_Fingers_Lehrer_Info()
{
//	AI_Output(other,self,"DIA_Fingers_Lehrer_15_00"); //What can you teach me?
//	AI_Output(other,self,"DIA_Fingers_Lehrer_15_00"); //Was kannst du mir beibringen?
	AI_Output(other,self,"DIA_Fingers_Lehrer_15_00"); //Co mě můžeš naučit?
//	AI_Output(self,other,"DIA_Fingers_Lehrer_05_02"); //That depends on what you want to know.
//	AI_Output(self,other,"DIA_Fingers_Lehrer_05_02"); //Kommt drauf an, was willst du wissen?
	AI_Output(self,other,"DIA_Fingers_Lehrer_05_02"); //To záleží na tom, co chceš umět.

	Info_ClearChoices(DIA_Fingers_Lehrer);
	Info_AddChoice(DIA_Fingers_Lehrer,DIALOG_BACK ,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2 , LPCOST_TALENT_PICKPOCKET_2,0),DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1 , LPCOST_TALENT_PICKPOCKET_1,0),DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2 , LPCOST_TALENT_PICKLOCK_2,0),DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1 , LPCOST_TALENT_PICKLOCK_1,0),DIA_Fingers_Lehrer_Lockpick);
//	Info_AddChoice(DIA_Fingers_Lehrer,"I want to learn how to sneak around.",DIA_Fingers_Lehrer_Schleichen);
//	Info_AddChoice(DIA_Fingers_Lehrer,"Ich will lernen, mich lautlos zu bewegen.",DIA_Fingers_Lehrer_Schleichen);
	Info_AddChoice(DIA_Fingers_Lehrer,"Chci se naučit plížit.",DIA_Fingers_Lehrer_Schleichen);
};

func void DIA_Fingers_Lehrer_Schleichen()
{
//	AI_Output(other,self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //I wanna learn how to sneak around.
//	AI_Output(other,self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Ich will lernen, mich lautlos zu bewegen.
	AI_Output(other,self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Chci se naučit plížit.
//	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //I believe - no false modesty - that I'm one of the best thieves they ever chucked into this colony.
//	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //Ich glaube - ohne falsche Bescheidenheit - ich bin einer der besten Diebe, die sie in die Kolonie geworfen haben.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //Věřím, a to bez nadsázky, že jsem jeden z nejlepších zlodějů, jaké kdy tahle kolonie spatřila.
//	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //But when it comes to teaching how to sneak around, Cavalorn is the better man for you!
//	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Aber wenn es darum geht, zu lernen, wie man sich leise bewegt, ist Cavalorn der bessere Mann für dich!
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Jestli se chceš ale naučit plížit, Cavalorn bude lepší učitel než já!
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
//	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //How can I improve my lock-picking skills?
//	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Wie werde ich besser im Knacken von Schlössern?
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Jak můžu vylepšit své umění v otevírání zámků?

	if (B_GiveSkill(other,NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //You'd like to know that, wouldn't you! It's not too difficult to begin with.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //Das willst du gerne wissen, hm? Ist für den Anfang nicht so schwer.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //To bys rád věděl, co? Není těžké s tím začít.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Above all, you have to make sure that your lockpick doesn't break off.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Du musst vor allem darauf achten, dass dir dein Dietrich nicht abbricht.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Především se musíš ujistit, že se tvůj paklíč nezlomí.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //If you're a little bit more patient in future, you'll see that you won't need that many lockpicks any more!
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Wenn du in Zukunft mit weniger Gewalt an die Sache rangehst, wirst du merken, dass du weniger Dietriche verbrauchst!
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Když budeš v budoucnu trochu trpělivější, uvidíš, že nebudeš potřebovat tolik paklíčů!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
//	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //How can I become an expert at cracking locks?
//	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Wie werde ich Meister im Öffnen von Schlössern?
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Jak se ze mě stane odborník na vylamování zámků?

	if (B_GiveSkill(other,NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Only when you've gained some experience can you tell when a lockpick is going to break. It makes a different sound!
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Nur wer schon einige Übung hat, merkt genau, wann ihm ein Dietrich abbricht und wann nicht. Du erkennst es am Geräusch!
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Jedině když získáš nějaké zkušenosti, budeš moci říci, jestli se paklíč zlomí. Vydává jiný zvuk!
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //I think you have it. Learn to listen for the gentle clicking of the lock and you won't lose so many lockpicks in future.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //Ich denke, du bist jetzt so weit - lerne, auf das leise Klicken des Schlosses zu achten, und du wirst nur noch selten das Pech haben, einen Dietrich zu verlieren.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //Myslím, že to máš. Nauč se poslouchat to jemné cvaknutí zámku a pak už nebudeš přicházet o tolik paklíčů.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //An expert in this field stands a good chance of opening a trunk without breaking his lockpick.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Ein Meister des Fachs hat eine gute Chance, eine Truhe zu öffnen, ohne dass sein Dietrich überhaupt abbricht.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Odborník v tomto směru má velkou šanci, že otevře zámek, aniž by zlomil svůj paklíč.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
//	AI_Output(other,self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //I wanna become a skilled pickpocket!
//	AI_Output(other,self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Ich will ein guter Taschendieb werden!
	AI_Output(other,self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Chci se stát zběhlým kapsářem.
	if (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other,NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
//			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //So you want to relieve a few people of their belongings? Well then.
//			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //So, du willst also ein paar Leute um ihre Sachen erleichtern? Nun gut.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Takže chceš pár lidem odlehčit o jejich majetek? Dobrá teda.
//			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //I'll teach you how to improve your skills, but it's still very likely that you'll get caught.
//			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Ich werde dir beibringen, wie du besser wirst, aber es besteht immer noch eine Chance, dass du erwischt wirst.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Naučím tě, jak zlepšit své umění, ale přesto bude dost pravděpodobné, že tě přitom chytnou.
//			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //You should only take the risk if nobody but your victim is around.
//			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Das Risiko solltest du nur eingehen, wenn außer deinem Opfer niemand sonst da ist.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Měl bys to zkoušet pouze tehdy, až nebude kolem nikdo, než ty a tvoje oběť.
//			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Only an expert can take things from people's pockets without them noticing!
//			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Erst als Meister wirst du in der Lage sein, jemandem etwas aus der Tasche zu ziehen, ohne dass er es merkt!
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Jedině odborník dokáže vzít lidem věci z kapes, aniž by si toho všimli!
		};
	}
	else
	{
//		AI_Output(self,other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Forget it! You'll never make a skilled thief unless you can sneak around.
//		AI_Output(self,other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Vergiss es! Ohne dass du schleichen kannst, wirst du NIEMALS ein geschickter Dieb.
		AI_Output(self,other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Zapomeň na to! Nikdy z tebe nebude zkušený zloděj, dokud se nebudeš umět plížit.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
//	AI_Output(other,self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //I want to become an expert pickpocket!
//	AI_Output(other,self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Ich will ein Meister der Taschendiebe werden!
	AI_Output(other,self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Chci se stát kapsářským odborníkem!

	if (B_GiveSkill(other,NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{ 
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //I think you've progressed far enough to be taught the final tricks of the trade.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Ich denke, du bist gut genug, um in die letzten Geheimnisse eingeweiht zu werden.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Myslím, že jsi pokročil tak daleko, že tě můžu naučit poslední triky tohohle řemesla.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //But you should know that even the best can get caught sometimes.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Du solltest aber wissen, dass es selbst den Besten manchmal passiert, dass sie bemerkt werden.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Měl bys ale vědět, že i ten nejlepší může být někdy přistižen.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Take care.
//		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Also pass auf dich auf.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Opatruj se.
	};
};

func void DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Fingers_Lehrer);
};

// **************************************************
// 					Wo Cavalorn
// **************************************************

instance DIA_Fingers_WhereCavalorn(C_INFO)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_WhereCavalorn_Condition;
	information = DIA_Fingers_WhereCavalorn_Info;
	permanent = 1;
//	description = "Where can I find Cavalorn?"; 
//	description = "Wo finde ich Cavalorn?"; 
	description = "Kde najdu Cavalorna?"; 
};

func int DIA_Fingers_WhereCavalorn_Condition()
{ 
	if (Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_WhereCavalorn_Info()
{
//	AI_Output(other,self,"DIA_Fingers_WhereCavalorn_15_00"); //Where can I find Cavalorn?
//	AI_Output(other,self,"DIA_Fingers_WhereCavalorn_15_00"); //Wo finde ich Cavalorn?
	AI_Output(other,self,"DIA_Fingers_WhereCavalorn_15_00"); //Kde najdu Cavalorna?
//	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_01"); //He's hunting out in the wild. You'll find him at the path to the New Camp. Westwards of the Old Camp there's a wide canyon.
//	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_01"); //Er jagt in der Wildnis. Du findest ihn auf dem Weg zum Neuen Lager. Westlich des Alten Lagers beginnt eine breite Schlucht.
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_01"); //Právě je na lovu v divočině. Najdeš ho po cestě do Nového tábora. Západně od Starého tábora je široký kaňon.
//	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_02"); //In this canyon there's an old woodcutters' hut. You'll find him there.
//	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_02"); //In dieser Schlucht steht eine alte Holzfällerhütte. Dort findest du ihn.
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_02"); //V tom kaňonu je stará dřevorubecká chata. Najdeš ho v ní.

//	B_LogEntry(GE_TeacherOW,"Cavalorn can teach me to sneak. His hut is in a canyon to the west of the Old Camp, in the direction of the New Camp.");
//	B_LogEntry(GE_TeacherOW,"Cavalorn kann mir Schleichen beibringen. Seine Hütte steht in einer Schlucht westlich des Alten Lagers, auf dem Weg zum Neuen Lager.");
	B_LogEntry(GE_TeacherOW,"Cavalorm mě může naučit plížení. Jeho chatrč stojí na západ od Starého tábora, směrem k Novému táboru.");
};

// **************************************************
// 					Gutes Wort
// **************************************************
	var int Fingers_Learnt;
// **************************************************

instance DIA_Fingers_Learnt(C_INFO)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Learnt_Condition;
	information = DIA_Fingers_Learnt_Info;
	permanent = 1;
//	description = "You wouldn't speak up for me in front of Diego, would you?"; 
//	description = "Du würdest nicht zufällig bei Diego ein gutes Wort für mich einlegen?"; 
	description = "Nepřimluvil by ses za mě u Diega?"; 
};

func int DIA_Fingers_Learnt_Condition()
{ 
	if ((Fingers_Learnt != LOG_SUCCESS))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Fingers_Learnt_Info()
{
//	AI_Output(other,self,"DIA_Fingers_Learnt_15_00"); //You wouldn't speak up for me in front of Diego, would you?
//	AI_Output(other,self,"DIA_Fingers_Learnt_15_00"); //Du würdest nicht zufällig bei Diego ein gutes Wort für mich einlegen?
	AI_Output(other,self,"DIA_Fingers_Learnt_15_00"); //Nepřimluvil by ses za mě u Diega?

	if ( Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) > 0)
	{
//		AI_Output(self,other,"DIA_Fingers_Learnt_05_01"); //Yes. You've learned something which makes you quite useful to us.
//		AI_Output(self,other,"DIA_Fingers_Learnt_05_01"); //Ja. Du hast was gelernt, was dich wertvoll für uns macht.
		AI_Output(self,other,"DIA_Fingers_Learnt_05_01"); //Ano. Naučil ses něco, díky čemu budeš pro nás docela užitečný.
//		AI_Output(self,other,"DIA_Fingers_Learnt_05_02"); //We can make use of skilled thieves in this camp here. You'll have my vote.
//		AI_Output(self,other,"DIA_Fingers_Learnt_05_02"); //Geschickte Diebe können wir hier im Lager brauchen. Meine Stimme ist dir sicher.
		AI_Output(self,other,"DIA_Fingers_Learnt_05_02"); //Potřebujeme tady v táboře zkušené zloděje. Dostaneš můj hlas.
		Fingers_Learnt = LOG_SUCCESS;

		B_GiveXP(XP_Fingerstrain);
//		B_LogEntry(CH1_JoinOC,"Fingers is really satisfied with my progress.");
//		B_LogEntry(CH1_JoinOC,"Fingers ist sehr zufrieden mit meinen Fortschritten.");
		B_LogEntry(CH1_JoinOC,"Fingers je doopravdy spokojen s mými pokroky.");
	}
	else
	{
//		AI_Output(self,other,"DIA_Fingers_Learnt_05_03"); //Depends...
//		AI_Output(self,other,"DIA_Fingers_Learnt_05_03"); //Kommt drauf an ...
		AI_Output(self,other,"DIA_Fingers_Learnt_05_03"); //Zaleží to na...
//		AI_Output(self,other,"DIA_Fingers_Learnt_05_04"); //If you demonstrate that you've learned something as a thief, we could make use of you!
//		AI_Output(self,other,"DIA_Fingers_Learnt_05_04"); //Wenn du zeigst, dass du als Dieb was gelernt hast, könnten wir dich schon brauchen!
		AI_Output(self,other,"DIA_Fingers_Learnt_05_04"); //Jestli dokážeš, že ses naučil něco ze zlodějského řemesla, mohl bys být pro nás užitečný!
//		AI_Output(other,self,"DIA_Fingers_Learnt_15_05"); //How am I supposed to do that?
//		AI_Output(other,self,"DIA_Fingers_Learnt_15_05"); //Wie soll ich das machen?
		AI_Output(other,self,"DIA_Fingers_Learnt_15_05"); //Co bych měl udělat?
//		AI_Output(self,other,"DIA_Fingers_Learnt_05_06"); //Learn a thief's skill! You need to become more skilled in sneaking around, pickpocketing or opening locks. Then you'll have my vote.
//		AI_Output(self,other,"DIA_Fingers_Learnt_05_06"); //Lerne ein Diebestalent! Werde geschickter im Schleichen, im Taschendiebstahl oder im Öffnen von Schlössern. Dann werde ich dich dir meine Stimme geben.
		AI_Output(self,other,"DIA_Fingers_Learnt_05_06"); //Nauč se zlodějskému řemeslu! Potřebuješ se vypracovat v plížení, kapsářství nebo otevírání zámků. Pak dostaneš můj hlas.
		Fingers_Learnt = LOG_RUNNING;

//		B_LogEntry(CH1_JoinOC,"Fingers will speak in my favor of me when I learn one of the thieving skills.");
//		B_LogEntry(CH1_JoinOC,"Fingers wird ein gutes Wort für mich einlegen, wenn ich ein Diebestalent lerne.");
		B_LogEntry(CH1_JoinOC,"Jakmile získám zlodějskou dovednost, Fingers se za mě přimluví.");
	};
};

