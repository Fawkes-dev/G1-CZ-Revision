// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_Grim_Exit(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 999;
	condition = DIA_Grim_Exit_Condition;
	information = DIA_Grim_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Grim_Exit_Condition()
{
	return 1;
};

func void DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 				FALLE (Schutzgeld)
// **************************************************

instance DIA_Grim_Falle(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_Falle_Condition;
	information = DIA_Grim_Falle_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Grim_Falle_Condition()
{ 
	if (Grim_ProtectionBully == TRUE)
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Grim_Falle_Info()
{
//	AI_Output(self,other,"DIA_Grim_Falle_06_00"); //Hey, you! Aren't you the guy who wants to join the Camp?
//	AI_Output(self,other,"DIA_Grim_Falle_06_00"); //Hey, du! Du bist doch der Typ, der hier im Lager aufgenommen werden will?
	AI_Output(self,other,"DIA_Grim_Falle_06_00"); //Hej, ty! Nejseš ty ten, co se chce přidat k táboru?
//	AI_Output(other,self,"DIA_Grim_Falle_15_01"); //What if I am?
//	AI_Output(other,self,"DIA_Grim_Falle_15_01"); //Und wenn es so wäre?
	AI_Output(other,self,"DIA_Grim_Falle_15_01"); //A co když jo?
//	AI_Output(self,other,"DIA_Grim_Falle_06_02"); //I could help you...
//	AI_Output(self,other,"DIA_Grim_Falle_06_02"); //Ich könnte dir dabei helfen ...
	AI_Output(self,other,"DIA_Grim_Falle_06_02"); //Mohl bych ti s tím pomoci.
//	AI_Output(other,self,"DIA_Grim_Falle_15_03"); //And how?
//	AI_Output(other,self,"DIA_Grim_Falle_15_03"); //Und wie?
	AI_Output(other,self,"DIA_Grim_Falle_15_03"); //A jak?
//	AI_Output(self,other,"DIA_Grim_Falle_06_04"); //There are two guys sitting around outside the Camp, and one of them has stolen something from the Ore Barons. It's a precious amulet, which should have arrived with the last convoy.
//	AI_Output(self,other,"DIA_Grim_Falle_06_04"); //Draußen vorm Lager sitzen zwei Typen rum, von denen einer die Erzbarone bestohlen hat. Es ist ein wertvolles Amulett, das mit dem letzten Konvoi gekommen sein sollte.
	AI_Output(self,other,"DIA_Grim_Falle_06_04"); //Před táborem posedávají dva chlapíci a jeden z nich něco ukradl Rudobaronům. Je to hodnotný amulet, který měl přijet s posledním konvojem.
//	AI_Output(self,other,"DIA_Grim_Falle_06_05"); //One of them should still be in possession of the amulet. If we attack them together, we should manage - I couldn't do it on my own. What d'you say?
//	AI_Output(self,other,"DIA_Grim_Falle_06_05"); //Einer von ihnen müsste das Amulett noch haben. Wenn wir beide auf sie draufgehen, schaffen wir sie - alleine kann ich's nicht machen. Was sagst du?
	AI_Output(self,other,"DIA_Grim_Falle_06_05"); //Jeden z nich musí ten amulet pořád u sebe. Jestliže je napadneme společně, zvládneme je - sám bych to nedokázal. Co ty na to?

	Info_ClearChoices(DIA_Grim_Falle);
//	Info_AddChoice(DIA_Grim_Falle,"Not interested - you'll have to look for somebody else.",DIA_Grim_Falle_Deny);
//	Info_AddChoice(DIA_Grim_Falle,"Kein Interesse - such dir einen anderen.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"Nemám zájem - budeš se muset poohlédnout po někom jiném.",DIA_Grim_Falle_Deny);
//	Info_AddChoice(DIA_Grim_Falle,"What will happen when we have the amulet?",DIA_Grim_Falle_HowShare);
//	Info_AddChoice(DIA_Grim_Falle,"Was passiert, wenn wir das Amulett haben?",DIA_Grim_Falle_HowShare);
	Info_AddChoice(DIA_Grim_Falle,"Co se stane, až budeme mít ten amulet?",DIA_Grim_Falle_HowShare);
//	Info_AddChoice(DIA_Grim_Falle,"Count me in!",DIA_Grim_Falle_Accepr);
//	Info_AddChoice(DIA_Grim_Falle,"Ich bin dabei!",DIA_Grim_Falle_Accepr);
	Info_AddChoice(DIA_Grim_Falle,"Můžeš!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
//	AI_Output(other,self,"DIA_Grim_Falle_Deny_15_00"); //Not interested - you'll have to look for somebody else.
//	AI_Output(other,self,"DIA_Grim_Falle_Deny_15_00"); //Kein Interesse - such dir einen anderen.
	AI_Output(other,self,"DIA_Grim_Falle_Deny_15_00"); //Nemám zájem - budeš se muset poohlédnout po někom jiném.
//	AI_Output(self,other,"DIA_Grim_Falle_Deny_06_01"); //With this kind of attitude you won't last long here - just tell me if you change your mind!
//	AI_Output(self,other,"DIA_Grim_Falle_Deny_06_01"); //Mit der Einstellung kommst du hier nicht weit - sag mir Bescheid, falls du's dir doch noch überlegen solltest!
	AI_Output(self,other,"DIA_Grim_Falle_Deny_06_01"); //S tímhle přístupem daleko nedojdeš - řekni mi, kdyby sis to rozmyslel.
	Info_ClearChoices(DIA_Grim_Falle);
};

func void DIA_Grim_Falle_HowShare()
{
//	AI_Output(other,self,"DIA_Grim_Falle_HowShare_15_00"); //What will happen when we have the amulet?
//	AI_Output(other,self,"DIA_Grim_Falle_HowShare_15_00"); //Was passiert, wenn wir das Amulett haben?
	AI_Output(other,self,"DIA_Grim_Falle_HowShare_15_00"); //Co se stane, až budeme mít ten amulet?
//	AI_Output(self,other,"DIA_Grim_Falle_HowShare_06_01"); //That's an easy one! I'll return it and get the reward. I'l tell them you helped me. Then you'll be in Gomez' good books for sure... 
//	AI_Output(self,other,"DIA_Grim_Falle_HowShare_06_01"); //Ganz einfach! Ich geb's zurück und kassier die Belohnung - dabei sag' ich, dass du mir geholfen hast. Damit hast du bei Gomez 'nen Stein in Brett.
	AI_Output(self,other,"DIA_Grim_Falle_HowShare_06_01"); //To je snadné! Vrátím ho a dostanu odměnu. Řeknu jim, že jsi mi pomohl. Pak si u Gomeze určitě uděláš oko.

	Info_ClearChoices(DIA_Grim_Falle);
//	Info_AddChoice(DIA_Grim_Falle,"Not interested - you'll have to look for somebody else.",DIA_Grim_Falle_Deny);
//	Info_AddChoice(DIA_Grim_Falle,"Kein Interesse - such dir einen anderen.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"Nemám zájem - budeš se muset poohlédnout po někom jiném.",DIA_Grim_Falle_Deny);
//	Info_AddChoice(DIA_Grim_Falle,"No! It's either fifty-fifty or you can do it on your own!",DIA_Grim_Falle_HalfHalf);
//	Info_AddChoice(DIA_Grim_Falle,"Wir machen Halbe-Halbe! Oder du kannst dich alleine mit den Typen anlegen!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice(DIA_Grim_Falle,"Ne! Buď to bude půl na půl, nebo si to udělej sám!",DIA_Grim_Falle_HalfHalf);
//	Info_AddChoice(DIA_Grim_Falle,"Count me in!",DIA_Grim_Falle_Accepr);
//	Info_AddChoice(DIA_Grim_Falle,"Ich bin dabei!",DIA_Grim_Falle_Accepr);
	Info_AddChoice(DIA_Grim_Falle,"Můžeš!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
//	AI_Output(other,self,"DIA_Grim_Falle_HalfHalf_15_00"); //No! It's either fifty-fifty or you can do it on your own!
//	AI_Output(other,self,"DIA_Grim_Falle_HalfHalf_15_00"); //Nein! Wir machen halbe-halbe! Oder du kannst dich alleine mit den Typen anlegen!
	AI_Output(other,self,"DIA_Grim_Falle_HalfHalf_15_00"); //Ne! Buď to bude půl na půl, nebo si to udělej sám!
//	AI_Output(self,other,"DIA_Grim_Falle_HalfHalf_06_01"); //Okay, okay, fifty-fifty. I suppose it'll be enough for the two of us anyway. So - can I count on you?
//	AI_Output(self,other,"DIA_Grim_Falle_HalfHalf_06_01"); //Okay, okay, halbe-halbe. Wird schon genug dabei rausspringen. Also - bist du dabei?
	AI_Output(self,other,"DIA_Grim_Falle_HalfHalf_06_01"); //Dobře, dobře, teda půl na půl. Doufám, že to bude pro oba dost. Tak - můžu s tebou počítat?
};

func void DIA_Grim_Falle_Accepr()
{
//	AI_Output(other,self,"DIA_Grim_Falle_Accepr_15_00"); //Count me in!
//	AI_Output(other,self,"DIA_Grim_Falle_Accepr_15_00"); //Ich bin dabei!
	AI_Output(other,self,"DIA_Grim_Falle_Accepr_15_00"); //Můžeš!
//	AI_Output(self,other,"DIA_Grim_Falle_Accepr_06_01"); //Alright, just tell me when we can start!
//	AI_Output(self,other,"DIA_Grim_Falle_Accepr_06_01"); //Gut, sag Bescheid, sobald wir losgehen können!
	AI_Output(self,other,"DIA_Grim_Falle_Accepr_06_01"); //Dobrá, řekni mi, kdy můžeme začít!
	Info_ClearChoices(DIA_Grim_Falle);
};

// **************************************************
// 				Bereit für Falle
// **************************************************

instance DIA_Grim_ReadyToGo(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_ReadyToGo_Condition;
	information = DIA_Grim_ReadyToGo_Info;
	permanent = 0;
//	description = "I'm ready to go with you - let's get the amulet!";
//	description = "Ich bin bereit, mit dir zu gehen - lass uns das Amulett holen!";
	description = "Jsem připravený jít s tebou - pojďme pro ten amulet!";
};

func int DIA_Grim_ReadyToGo_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Grim_Falle))
	{
		return 1;
	};
};

func void DIA_Grim_ReadyToGo_Info()
{
//	AI_Output(other,self,"DIA_Grim_ReadyToGo_15_00"); //I'm ready to go with you - let's get the amulet!
//	AI_Output(other,self,"DIA_Grim_ReadyToGo_15_00"); //Ich bin bereit, mit dir zu gehen - lass uns das Amulett holen!
	AI_Output(other,self,"DIA_Grim_ReadyToGo_15_00"); //Jsem připravený jít s tebou - pojďme pro ten amulet!
//	AI_Output(self,other,"DIA_Grim_ReadyToGo_06_01"); //Okay, let's do it then ...
//	AI_Output(self,other,"DIA_Grim_ReadyToGo_06_01"); //Gut! Dann wollen wir mal ...
	AI_Output(self,other,"DIA_Grim_ReadyToGo_06_01"); //Dobře, pojďme do toho...

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self,"GUIDE");
}; 

// **************************************************
//				OC DRAUSSEN ANGEKOMMEN
// **************************************************

instance DIA_Grim_AtOCdraussen(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 3;
	condition = DIA_Grim_AtOCdraussen_Condition;
	information = DIA_Grim_AtOCdraussen_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_Grim_AtOCdraussen_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo)) && (Npc_GetDistToWp (hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500 ) 
	{
		return 1;
	};
};

func void DIA_Grim_AtOCdraussen_Info()
{
//	AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_00"); //So, here we are - far away from your friend Diego.
//	AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_00"); //So, hier sind wir. Schön weit weg von deinem Freund Diego.
	AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_00"); //Tak, jsme tady - daleko od našeho přítele Diega.
	if (((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))))
	{
//		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_01"); //We're to send you regards from Bloodwyn!
//		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_01"); //Wir sollen dir schöne Grüße von Bloodwyn bestellen!
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_01"); //Máme vyřídit pozdravy od Bloodwyna!
	}
	else
	{
//		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_02"); //I'm to send you regards from Bloodwyn!
//		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_02"); //Ich soll dir schöne Grüße von Bloodwyn bestellen ...
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_02"); //Mám vyřídit pozdravy od Bloodwyna!
	};

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");

	var C_NPC Bu520; Bu520 = Hlp_GetNpc(Vlk_520_Buddler);
	var C_NPC Bu534; Bu534 = Hlp_GetNpc(Vlk_534_Buddler);

	if ((Npc_GetDistToNpc(self,Bu520)<1000) && (!Npc_IsDead(Bu520)))
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_ATTACK,1,"");
	};

	if ((Npc_GetDistToNpc(self,Bu534)<1000) && (!Npc_IsDead(Bu534)))
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_ATTACK,1,"");
	};
};

// **************************************************
// 				NACH Falle
// **************************************************

instance DIA_Grim_NACHFalle(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_NACHFalle_Condition;
	information = DIA_Grim_NACHFalle_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Grim_NACHFalle_Condition()
{ 
	if ((Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen)) && (Npc_GetDistToNpc(self,other)<ZivilAnquatschDist))
	{
		return 1;
	};
};

func void DIA_Grim_NACHFalle_Info()
{
//	AI_Output(other,self,"DIA_Grim_NACHFalle_15_01"); //So you idiot, just wanted to trap me...
//	AI_Output(other,self,"DIA_Grim_NACHFalle_15_01"); //Du Penner wolltest mir also nur 'ne Falle stellen ...
	AI_Output(other,self,"DIA_Grim_NACHFalle_15_01"); //Ty darebáku, chtěl jsi mě chytit do pasti...
//	AI_Output(self,other,"DIA_Grim_NACHFalle_06_02"); //Hey, man! We're sitting in the same boat! I am not into digging in the mines either.
//	AI_Output(self,other,"DIA_Grim_NACHFalle_06_02"); //Hey, Mann! Wir spielen beide dasselbe Spiel! Ich hab' auch keine Lust, in den Minen buddeln zu gehen.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_02"); //Hej, chlape! Jsme na stejné lodi! Také se mi nechce rubat v dolech.
//	AI_Output(self,other,"DIA_Grim_NACHFalle_06_03"); //So I'll do what the guards tell me, then I'll be accepted soon.
//	AI_Output(self,other,"DIA_Grim_NACHFalle_06_03"); //Also werd' ich tun, was mir die Gardisten sagen, dann werde ich hier bald aufgenommen.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_03"); //A tak udělám to, co mi stráže řeknou, pak mě sem přijmou dříve.
//	AI_Output(self,other,"DIA_Grim_NACHFalle_06_04"); //That I should whack YOU of all people is your own fault really. Why did you have to start a bloody fight with the guards?
//	AI_Output(self,other,"DIA_Grim_NACHFalle_06_04"); //Dass ich ausgerechnet DIR aufs Maul hauen sollte, hast du dir im Grunde selber zuzuschreiben. Warum legst du dich auch mit den Gardisten an.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_04"); //To, že jsem měl zmlátit tebe, je TVÁ chyba. Proč jsi proboha odporoval strážcům?
//	AI_Output(self,other,"DIA_Grim_NACHFalle_06_05"); //Personally, I don't dislike you. So what do you think - peace or further fighting?
//	AI_Output(self,other,"DIA_Grim_NACHFalle_06_05"); //Persönlich hab' ich nichts gegen dich. Also was ist - Frieden oder weiterprügeln?
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_05"); //Já proti tobě osobně nic nemám. Tak co myslíš - mír nebo válka?

	Info_ClearChoices(DIA_Grim_NACHFalle);
//	Info_AddChoice(DIA_Grim_NACHFalle,"Brawl on.",DIA_Grim_NACHFalle_Weiterpruegeln);
//	Info_AddChoice(DIA_Grim_NACHFalle,"Weiterprügeln.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice(DIA_Grim_NACHFalle,"Do toho.",DIA_Grim_NACHFalle_Weiterpruegeln);
//	Info_AddChoice(DIA_Grim_NACHFalle,"Peace.",DIA_Grim_NACHFalle_Frieden);
//	Info_AddChoice(DIA_Grim_NACHFalle,"Frieden.",DIA_Grim_NACHFalle_Frieden);
	Info_AddChoice(DIA_Grim_NACHFalle,"Mír.",DIA_Grim_NACHFalle_Frieden);
};

func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
//	AI_Output(other,self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //I feel like fighting!
//	AI_Output(other,self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //Mir ist eher nach Weiterprügeln!
	AI_Output(other,self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //Já to vidím jako válku.
//	AI_Output(self,other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Oh man, you get me down...
//	AI_Output(self,other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Oh Mann, du schaffst mich ...
	AI_Output(self,other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Och, člověče, dostal jsi mě...
	Info_ClearChoices(DIA_Grim_NACHFalle);
	AI_StopProcessInfos(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
//	AI_Output(other,self,"DIA_Grim_NACHFalle_Frieden_15_00"); //Peace sounds good.
//	AI_Output(other,self,"DIA_Grim_NACHFalle_Frieden_15_00"); //Frieden klingt gut.
	AI_Output(other,self,"DIA_Grim_NACHFalle_Frieden_15_00"); //Mír zní lépe.
//	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_01"); //I'm glad we see eye to eye on this. Let's forget about it. From now on, I'm on your side.
//	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Freut mich, dass du das Ganze durch meine Augen sehen kannst. Die Sache ist vergessen. Ab jetzt bin ich auf deiner Seite.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Jsem rád, že vidíš mýma očima. Zapomeňme na to. Od teďka jsem na tvojí straně.
//	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_02"); //If you ever have trouble again, you can count on me - I owe you some, after all.
//	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Wenn du noch mal Ärger haben solltest - kannst du auf mich zählen - schließlich schulde ich dir was.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Kdybys měl ještě někdy nějaké problémy, můžeš se mnou počítat - ostatně, něco ti dlužím.
	Info_ClearChoices(DIA_Grim_NACHFalle);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};

// **************************************************
// 				Hallo
// **************************************************
	var int FirstOver; 
// **************************************************

instance DIA_Grim_Hallo(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_Hallo_Condition;
	information = DIA_Grim_Hallo_Info;
	permanent = 0;
//	description = "I am new here.";
//	description = "Ich bin neu hier!";
	description = "Jsem tady nový.";
};

func int DIA_Grim_Hallo_Condition()
{ 
	if (Grim_ProtectionBully==TRUE)
	{
		FirstOver = TRUE;
	};

	if (FirstOver == FALSE)
	{
		return 1;
	};
};

func void DIA_Grim_Hallo_Info()
{
//	AI_Output(other,self,"DIA_Grim_Hallo_15_00"); //I am new here.
//	AI_Output(other,self,"DIA_Grim_Hallo_15_00"); //Ich bin neu hier!
	AI_Output(other,self,"DIA_Grim_Hallo_15_00"); //Jsem tady nový.
//	AI_Output(self,other,"DIA_Grim_Hallo_06_01"); //Just arrived, have you? I'm Grim - I haven't been here for long either. I was thrown in with the load before you.
//	AI_Output(self,other,"DIA_Grim_Hallo_06_01"); //Gerade angekommen, was? Ich bin Grim - bin auch noch nicht so lange da. Bin eine Fuhre vor dir mit reingeworfen worden.
	AI_Output(self,other,"DIA_Grim_Hallo_06_01"); //Právě jsi přišel, viď? Já jsem Grim - nejsem tady ještě dlouho. Hodili mě sem se skupinou právě před tebou.
};

// **************************************************
// 						Leben
// **************************************************

instance DIA_Grim_Leben(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_Leben_Condition;
	information = DIA_Grim_Leben_Info;
	permanent = 0;
//	description = "What's life like here?";
//	description = "Wie ist das Leben hier so?";
	description = "Jak se tady žije?";
};

func int DIA_Grim_Leben_Condition()
{ 
	return 1;
};

func void DIA_Grim_Leben_Info()
{
//	AI_Output(other,self,"DIA_Grim_Leben_15_00"); //What's life like here?
//	AI_Output(other,self,"DIA_Grim_Leben_15_00"); //Wie ist das Leben hier so?
	AI_Output(other,self,"DIA_Grim_Leben_15_00"); //Jaký je tady život?
//	AI_Output(self,other,"DIA_Grim_Leben_06_01"); //Easy going, as long as you pay your share of protection money to the guards.
//	AI_Output(self,other,"DIA_Grim_Leben_06_01"); //Ganz ruhig, so lange du dein Schutzgeld an die Gardisten bezahlst.
	AI_Output(self,other,"DIA_Grim_Leben_06_01"); //Docela to ujde, pokud platíš strážím peníze za ochranu.
};

// **************************************************
// 						Aufnahme
// **************************************************

instance DIA_Grim_Aufnahme(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 3;
	condition = DIA_Grim_Aufnahme_Condition;
	information = DIA_Grim_Aufnahme_Info;
	permanent = 0;
//	description = "What do I have to do if I want to get admitted to this camp?";
//	description = "Was muss ich machen, wenn ich in dieses Lager aufgenommen werden will?";
	description = "Co musím udělat, aby mě přijali k táboru?";
};

func int DIA_Grim_Aufnahme_Condition()
{ 
	return 1;
};

func void DIA_Grim_Aufnahme_Info()
{
//	AI_Output(other,self,"DIA_Grim_Aufnahme_15_00"); //What do I have to do if I want to get admitted to this camp?
//	AI_Output(other,self,"DIA_Grim_Aufnahme_15_00"); //Was muss ich machen, wenn ich in diesem Lager aufgenommen werden will?
	AI_Output(other,self,"DIA_Grim_Aufnahme_15_00"); //Co musím udělat, aby mě přijali k táboru?
//	AI_Output(self,other,"DIA_Grim_Aufnahme_06_01"); //Well, first of all you have to become a Shadow. Therefore, you have to find somebody who supports you. Somebody who explains everything to you and takes responsibility for you.
//	AI_Output(self,other,"DIA_Grim_Aufnahme_06_01"); //Also zuerst mal wirst du Schatten. Dazu musst du einen Fürsprecher finden. Jemand, der dir alles erklärt und für dich einsteht.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_01"); //Tak, nejdřív se musíš stát Stínem. Proto si musíš najít někoho, kdo tě bude podporovat. Někoho, kdo ti všechno vysvětlí a bude za tebou stát.
//	AI_Output(self,other,"DIA_Grim_Aufnahme_06_02"); //If I was you I'd try and keep close to Diego - I did it like that - he's quite alright.
//	AI_Output(self,other,"DIA_Grim_Aufnahme_06_02"); //Ich an deiner Stelle würd' mich direkt an Diego halten - hab' ich auch gemacht - der ist ganz in Ordnung.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_02"); //Být tebou, držel bych se Diega - já to taky tak udělal - je docela v pohodě.
//	AI_Output(self,other,"DIA_Grim_Aufnahme_06_03"); //He'll make you take the test of faith - that's different for everybody. Then there'll be some other smaller tasks from other Shadows.
//	AI_Output(self,other,"DIA_Grim_Aufnahme_06_03"); //Er stellt dir die Prüfung des Vertrauens - die sieht bei jedem anders aus. Dann gibt's noch einige kleinere Aufgaben von anderen Schatten.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_03"); //Zadá ti zkoušku poctivosti - ta je pro každého jiná. Pak splníš pár menších úkolů od ostatních Stínů.
//	AI_Output(self,other,"DIA_Grim_Aufnahme_06_04"); //If you manage them, you'll be with us.
//	AI_Output(self,other,"DIA_Grim_Aufnahme_06_04"); //Wenn du die gelöst hast, bist du dabei.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_04"); //Když je splníš, budeš patřit k nám.
};

// **************************************************
// 						Wie weit bist DU?
// **************************************************
var int Grim_Tests;
// **************************************************

instance DIA_Grim_HowFarAreYou(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 4;
	condition = DIA_Grim_HowFarAreYou_Condition;
	information = DIA_Grim_HowFarAreYou_Info;
	permanent = 1;
//	description = "And - how far have you got with your tests?";
//	description = "Und - wie weit bist du mit deinen Prüfungen?";
	description = "A - jak daleko ses dostal se svými zkouškami?";
};

func int DIA_Grim_HowFarAreYou_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

func void DIA_Grim_HowFarAreYou_Info()
{
//	AI_Output(other,self,"DIA_Grim_HowFarAreYou_15_00"); //And - how far have you got with your tests?
//	AI_Output(other,self,"DIA_Grim_HowFarAreYou_15_00"); //Und - wie weit bist du mit deinen Prüfungen?
	AI_Output(other,self,"DIA_Grim_HowFarAreYou_15_00"); //A - jak daleko ses dostal se svými zkouškami?
//	AI_Output(self,other,"DIA_Grim_HowFarAreYou_06_01"); //I've already talked to Dexter and Sly and Fingers. They are some of the most influential Shadows here in the Camp.
//	AI_Output(self,other,"DIA_Grim_HowFarAreYou_06_01"); //Ich hab' schon mit Dexter, Sly und Fingers geredet. Das sind einige der einflussreichsten Schatten hier im Lager.
	AI_Output(self,other,"DIA_Grim_HowFarAreYou_06_01"); //Už jsem mluvil s Dexterem, Slyem a Fingersem. Ti patří k nejdůležitějším lidem v táboře.

	if !Grim_Tests
	{
//		B_LogEntry(CH1_JoinOC,"Dexter, Sly and Fingers are influential Shadows.");
//		B_LogEntry(CH1_JoinOC,"Einflussreiche Schatten sind Dexter, Sly und Fingers");
		B_LogEntry(CH1_JoinOC,"Dexter, Sly a Shadow jsou vlivní Stínové.");
		Grim_Tests = TRUE;
	};
};

// **************************************************
// 						Leben
// **************************************************

instance DIA_Grim_YourPDV(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 5;
	condition = DIA_Grim_YourPDV_Condition;
	information = DIA_Grim_YourPDV_Info;
	permanent = 0;
//	description = "What was YOUR test of faith?";
//	description = "Was ist DEINE Prüfung des Vertrauens?";
	description = "Jaká byla TVOJE zkouška poctivosti?";
};

func int DIA_Grim_YourPDV_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme))
	{
		return 1;
	};
};

func void DIA_Grim_YourPDV_Info()
{
//	AI_Output(other,self,"DIA_Grim_YourPDV_15_00"); //What was YOUR test of faith?
//	AI_Output(other,self,"DIA_Grim_YourPDV_15_00"); //Was ist DEINE Prüfung des Vertrauens?
	AI_Output(other,self,"DIA_Grim_YourPDV_15_00"); //Jaká byla TVOJE zkouška poctivosti?
//	AI_Output(self,other,"DIA_Grim_YourPDV_06_01"); //I can't tell you, man. You have to be silent about things like that here!
//	AI_Output(self,other,"DIA_Grim_YourPDV_06_01"); //Das kann ich dir nicht sagen, Mann. Über solche Dinge musst du hier schweigen!
	AI_Output(self,other,"DIA_Grim_YourPDV_06_01"); //To ti nemůžu říci, chlape. O takových věcech nesmíš mluvit.
};

//#####################################################################
//##
//##
//## KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMO
//---------------------------------------------------------------------
instance DIA_Grim_INEXTREMO(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_INEXTREMO_Condition;
	information = DIA_Grim_INEXTREMO_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_Grim_INEXTREMO_Condition()
{
	if ((Kapitel == 2) && (InExtremoPlaying == true))
	{
		return TRUE;
	};
};

func void DIA_Grim_INEXTREMO_Info()
{
//	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_01"); //Hey, have you heard the news?
//	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_01"); //Hey, hast du schon gehört?
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_01"); //Hej, už si slyšel novinky?
//	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_02"); //In Extremo are here. They're on stage over there.
//	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_02"); //In Extremo ist hier. Sie sind drüben auf der Bühne.
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_02"); //Jsou tady In Extremo. Jsou právě na pódiu.
//	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_03"); //Hurry, otherwise, you'll miss the gig!
//	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_03"); //Schnell, sonst versäumst du noch den Auftritt!
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_03"); //Pospěš, jinak tu představení propásneme!

	Npc_ExchangeRoutine(self,"InExtremo");

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//## KAPITEL 3
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMOAWAY
//---------------------------------------------------------------------
instance DIA_Grim_INEXTREMOAWAY(C_INFO)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_INEXTREMOAWAY_Condition;
	information = DIA_Grim_INEXTREMOAWAY_Info;
	permanent = 0;
	important = 0;
//	description = "Where are In Extremo?";
//	description = "Wo sind InExtremo?";
	description = "Kde jsou In Extremo?";
};                       

func int DIA_Grim_INEXTREMOAWAY_Condition()
{
	if Npc_KnowsInfo(hero,DIA_Grim_INEXTREMO)
	&& (Kapitel == 3) 
	{
		return TRUE;
	};
};

func void DIA_Grim_INEXTREMOAWAY_Info()
{
//	AI_Output(hero,self,"DIA_Grim_INEXTREMOAWAY_15_01"); //Where are In Extremo?
//	AI_Output(hero,self,"DIA_Grim_INEXTREMOAWAY_15_01"); //Wo sind InExtremo?
	AI_Output(hero,self,"DIA_Grim_INEXTREMOAWAY_15_01"); //Kde jsou In Extremo?
//	AI_Output(self,hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //They've moved on. It's a shame, I got really used to the evenings in front of the stage.
//	AI_Output(self,hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Sie sind weitergezogen. Schade, ich hatte mich an die Abende vor der Bühne gewöhnt.
	AI_Output(self,hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Už jsou zase pryč. To je škoda, měl jsem rád večery před pódiem.

	AI_StopProcessInfos(self);
};

