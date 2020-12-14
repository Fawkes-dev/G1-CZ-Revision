// **************************************************
// 						 PRE EXIT 
// **************************************************

instance DIA_Orry_PreExit(C_INFO)
{
	npc = GRD_254_Orry;
	nr = 999;
	condition = DIA_Orry_PreExit_Condition;
	information = DIA_Orry_PreExit_Info;
	permanent = 0;
	description = DIALOG_ENDE;
};                       

func int DIA_Orry_PreExit_Condition()

	{
		return 1;
	};

func void DIA_Orry_PreExit_Info()
{
//	AI_Output(self,other,"DIA_Orry_PreExit_06_00"); //You'd better make sure you reach the Old Camp in one piece!
//	AI_Output(self,other,"DIA_Orry_PreExit_06_00"); //Sieh zu, das du heil zum Alten Lager kommst!
	AI_Output(self,other,"DIA_Orry_PreExit_06_00"); //Udělal bys líp, kdyby ses do Starého tábora dostal celý!
	AI_StopProcessInfos(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_Orry_Exit(C_INFO)
{
	npc = GRD_254_Orry;
	nr = 999;
	condition = DIA_Orry_Exit_Condition;
	information = DIA_Orry_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Orry_PreExit))
	{
		return 1;
	};
};

func void DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 					Ich Wache
// **************************************************

instance DIA_Orry_GuardGate(C_INFO)
{
	npc = GRD_254_Orry;
	nr = 2;
	condition = DIA_Orry_GuardGate_Condition;
	information = DIA_Orry_GuardGate_Info;
	permanent = 0;
//	description = "What are you doing here?"; 
//	description = "Was machst du hier?"; 
	description = "Co tady děláš?"; 
};

func int DIA_Orry_GuardGate_Condition()
{ 
	if (Kapitel <= 1)
	{
		return 1;
	};
};

func void DIA_Orry_GuardGate_Info()
{
//	AI_Output(other,self,"DIA_Orry_GuardGate_15_00"); //What are you doing here?
//	AI_Output(other,self,"DIA_Orry_GuardGate_15_00"); //Was machst du hier?
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_Orry_GuardGate_06_01"); //Making sure no-one gets near the exchange place. Especially none of those cut-throats from the New Camp.
//	AI_Output(self,other,"DIA_Orry_GuardGate_06_01"); //Dafür sorgen, dass keiner an die Austauschstelle rankommt. Vor allem nicht die Halsabschneider aus dem Neuen Lager.
	AI_Output(self,other,"DIA_Orry_GuardGate_06_01"); //Zajišťujeme, aby se nikdo nedostal do blízkosti místa výměny. Hlavně nikdo z těch vrahounů z Nového tábora.
//	AI_Output(self,other,"DIA_Orry_GuardGate_06_02"); //You're the new guy they chucked in today, right?
//	AI_Output(self,other,"DIA_Orry_GuardGate_06_02"); //Du bist der Neue, den sie heute reingeworfen haben, nicht?
	AI_Output(self,other,"DIA_Orry_GuardGate_06_02"); //Ty jsi ten novej, co ho dneska vyhodili, že jo?
//	AI_Output(other,self,"DIA_Orry_GuardGate_15_03"); //That's me.
//	AI_Output(other,self,"DIA_Orry_GuardGate_15_03"); //Sieht so aus.
	AI_Output(other,self,"DIA_Orry_GuardGate_15_03"); //Jo, já.
//	AI_Output(self,other,"DIA_Orry_GuardGate_06_04"); //Then you'd better watch out for the guys from the New Camp!
//	AI_Output(self,other,"DIA_Orry_GuardGate_06_04"); //Dann solltest du wissen, dass du dich vor den Typen aus dem Neuen Lager in Acht nehmen musst!
	AI_Output(self,other,"DIA_Orry_GuardGate_06_04"); //Pak uděláš nejlíp, když se budeš mít na pozoru před těma chlapíkama z Nového tábora!
//	AI_Output(self,other,"DIA_Orry_GuardGate_06_05"); //I work for the Old Camp, same as the others you saw at the exchange place.
//	AI_Output(self,other,"DIA_Orry_GuardGate_06_05"); //Ich arbeite fürs alte Lager. Genau wie alle anderen, die du an der Austauschstelle gesehen hast.
	AI_Output(self,other,"DIA_Orry_GuardGate_06_05"); //Pracuju pro Starý tábor, zrovna tak jako ti ostatní, které vidíš poblíž místa výměny.
//	AI_Output(self,other,"DIA_Orry_GuardGate_06_06"); //I assume you've talked to Diego...?
//	AI_Output(self,other,"DIA_Orry_GuardGate_06_06"); //Du hast schon mit Diego geredet, nehme ich an?
	AI_Output(self,other,"DIA_Orry_GuardGate_06_06"); //Předpokládám, že jsi mluvil s Diegem...?
	Info_ClearChoices(DIA_Orry_GuardGate);
//	Info_AddChoice(DIA_Orry_GuardGate,"No.",DIA_Orry_GuardGate_No);
//	Info_AddChoice(DIA_Orry_GuardGate,"Nein.",DIA_Orry_GuardGate_No);
	Info_AddChoice(DIA_Orry_GuardGate,"Ne.",DIA_Orry_GuardGate_No);
//	Info_AddChoice(DIA_Orry_GuardGate,"Yes.",DIA_Orry_GuardGate_Yes);
//	Info_AddChoice(DIA_Orry_GuardGate,"Ja.",DIA_Orry_GuardGate_Yes);
	Info_AddChoice(DIA_Orry_GuardGate,"Ano.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
//	AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00"); //No.
//	AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00"); //Nein.
	AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00"); //Ne.
//	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_01"); //Then do so! He's the one that deals with newcomers.
//	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_01"); //Dann solltest du das tun! Er kümmert sich um die Neuen.
	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_01"); //Tak to udělej! To on se stará o nováčky.
//	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_02"); //He knows a lot about the colony - things that are important to new people like you.
//	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_02"); //Er weiß viele Dinge über die Kolonie, die für einen Neuen sehr wichtig sein können.
	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_02"); //Ví toho o kolonii hodně - věci, které jsou pro nováčky, jako jsi ty, důležité.
	Info_ClearChoices(DIA_Orry_GuardGate);
};

func void DIA_Orry_GuardGate_Yes()
{
//	AI_Output(other,self,"DIA_Orry_GuardGate_Yes_15_00"); //Yes, I have.
//	AI_Output(other,self,"DIA_Orry_GuardGate_Yes_15_00"); //Ja, hab' ich.
	AI_Output(other,self,"DIA_Orry_GuardGate_Yes_15_00"); //Ano.
//	AI_Output(self,other,"DIA_Orry_GuardGate_Yes_06_01"); //Good. Then you know what's what around here.
//	AI_Output(self,other,"DIA_Orry_GuardGate_Yes_06_01"); //Gut! Dann weißt du ja schon Bescheid.
	AI_Output(self,other,"DIA_Orry_GuardGate_Yes_06_01"); //Dobře. Pak budeš vědět, co se tady všude děje.
	Info_ClearChoices(DIA_Orry_GuardGate);
};

// **************************************************
// 					New Camp
// **************************************************

instance DIA_Orry_NewCamp(C_INFO)
{
	npc = GRD_254_Orry;
	nr = 1;
	condition = DIA_Orry_NewCamp_Condition;
	information = DIA_Orry_NewCamp_Info;
	permanent = 0;
//	description = "Why do I have to watch out for the guys from the New Camp?"; 
//	description = "Warum sollte ich mich vor dem Neuen Lager in Acht nehmen?"; 
	description = "Proč se mám mít na pozoru před chlapy z Nového tábora?"; 
};

func int DIA_Orry_NewCamp_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_NewCamp_Info()
{
//	AI_Output(other,self,"DIA_Orry_NewCamp_15_00"); //Why do I have to watch out for the guys from the New Camp?
//	AI_Output(other,self,"DIA_Orry_NewCamp_15_00"); //Warum sollte ich mich vor dem Neuen Lager in Acht nehmen?
	AI_Output(other,self,"DIA_Orry_NewCamp_15_00"); //Proč se mám mít na pozoru před chlapy z Nového tábora?
//	AI_Output(self,other,"DIA_Orry_NewCamp_06_01"); //Compared to the New Camp, the Old Camp's a quiet, peaceful sort of place.
//	AI_Output(self,other,"DIA_Orry_NewCamp_06_01"); //Verglichen mit dem Neuen Lager ist das Alte Lager ein ruhiger und friedlicher Ort.
	AI_Output(self,other,"DIA_Orry_NewCamp_06_01"); //Starý tábor je ve srovnání s Novým táborem klidné a mírumilovné místo.
//	AI_Output(self,other,"DIA_Orry_NewCamp_06_02"); //The New Camp doesn't get any deliveries from the outside world. Most of the rogues there just steal whatever they need.
//	AI_Output(self,other,"DIA_Orry_NewCamp_06_02"); //Das Neue Lager bekommt keine Waren aus der Außenwelt. Die meisten Banditen klauen sich zusammen, was sie zum Leben brauchen.
	AI_Output(self,other,"DIA_Orry_NewCamp_06_02"); //Nový tábor nedostává žádné dodávky z vnějšího světa. Většina tamějších darebáků pak krade, co potřebuje.
};

// **************************************************
// 					Old Camp
// **************************************************

instance DIA_Orry_OldCamp(C_INFO)
{
	npc = GRD_254_Orry;
	nr = 2;
	condition = DIA_Orry_OldCamp_Condition;
	information = DIA_Orry_OldCamp_Info;
	permanent = 0;
//	description = "And the Old Camp?"; 
//	description = "Und das Alte Lager?"; 
	description = "A Starý tábor?"; 
};

func int DIA_Orry_OldCamp_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_OldCamp_Info()
{
//	AI_Output(other,self,"DIA_Orry_OldCamp_15_00"); //And the Old Camp?
//	AI_Output(other,self,"DIA_Orry_OldCamp_15_00"); //Und das Alte Lager?
	AI_Output(other,self,"DIA_Orry_OldCamp_15_00"); //A Starý tábor?
//	AI_Output(self,other,"DIA_Orry_OldCamp_06_01"); //The Ore Barons have everything under control. Next in line to them are the guards, followed by the Shadows. The diggers are the lowest.
//	AI_Output(self,other,"DIA_Orry_OldCamp_06_01"); //Die Erzbarone haben alles unter Kontrolle. Unter ihnen stehen die Gardisten. Unter denen wiederum stehen die Schatten. Ganz am Ende kommen die Buddler.
	AI_Output(self,other,"DIA_Orry_OldCamp_06_01"); //Rudobaroni mají všechno pod kontrolou. Hned po nich následují stráže a po nich Stíny. Kopáči jsou až vespodu.
//	AI_Output(self,other,"DIA_Orry_OldCamp_06_02"); //Everyone who arrives here starts out as a digger. If you want to become something better than that, you'll have to get accepted as a Shadow first.
//	AI_Output(self,other,"DIA_Orry_OldCamp_06_02"); //Buddler ist jeder, der hier ankommt. Wenn du was Besseres werden willst, musst du als erstes bei den Schatten aufgenommen werden.
	AI_Output(self,other,"DIA_Orry_OldCamp_06_02"); //Každý nový příchozí začíná jako kopáč. Pokud se chceš stát něčím lepším, musíš být nejprve přijat mezi Stíny.
};

// **************************************************
// 					Shore
// **************************************************

instance DIA_Orry_Shore(C_INFO)
{
	npc = GRD_254_Orry;
	nr = 3;
	condition = DIA_Orry_Shore_Condition;
	information = DIA_Orry_Shore_Info;
	permanent = 0;
//	description = "When I was washed ashore, one of the guys punched me in the face."; 
//	description = "Als ich ans Ufer gespült wurde. hat mich einer von den Typen geschlagen."; 
	description = "Když jsem se sem dostal, jeden z těch chlapů mě praštil do tváře."; 
};

func int DIA_Orry_Shore_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_Shore_Info()
{
//	AI_Output(other,self,"DIA_Orry_Shore_15_00"); //When I was washed ashore, one of the guys punched me in the face.
//	AI_Output(other,self,"DIA_Orry_Shore_15_00"); //Als ich ans Ufer gespült wurde, hat mich einer von den Typen mit einem Schlag ins Gesicht begrüßt.
	AI_Output(other,self,"DIA_Orry_Shore_15_00"); //Když jsem se sem dostal, jeden z těch chlapů mě praštil do tváře.
//	AI_Output(self,other,"DIA_Orry_Shore_06_01"); //They do that to all the newcomers. They call it 'Standing Godfather'.
//	AI_Output(self,other,"DIA_Orry_Shore_06_01"); //Das machen sie mit jedem Neuen. Sie nennen es 'Die Taufe'.
	AI_Output(self,other,"DIA_Orry_Shore_06_01"); //Dělají to všem nováčkům. Říkají tomu 'Kmotr'.
//	AI_Output(other,self,"DIA_Orry_Shore_15_02"); //Oh. Are all the guys like that in the Old Camp?
//	AI_Output(other,self,"DIA_Orry_Shore_15_02"); //Habt ihr im Alten Lager noch mehr so nette Leute?
	AI_Output(other,self,"DIA_Orry_Shore_15_02"); //Och. Jsou všichni ti chlapi ve Starém táboře takoví?
//	AI_Output(self,other,"DIA_Orry_Shore_06_03"); //We do have a few suckers. But they won't touch you as long as you pay them protection money.
//	AI_Output(self,other,"DIA_Orry_Shore_06_03"); //Es gibt schon einige Schweine. Aber solange du dein Schutzgeld zahlst, kann dir nichts passieren.
	AI_Output(self,other,"DIA_Orry_Shore_06_03"); //Je tam dost gaunerů. Ale když jim platíš za ochranu, nechají tě být.
};

// **************************************************
// 					Frau
// **************************************************

instance DIA_Orry_Woman(C_INFO)
{
	npc = GRD_254_Orry;
	nr = 3;
	condition = DIA_Orry_Woman_Condition;
	information = DIA_Orry_Woman_Info;
	permanent = 0;
//	description = "I saw a woman being sent down with the goods."; 
//	description = "Sie haben eine Frau zusammen mit den Waren reingeschickt."; 
	description = "Viděl jsem, jak dolů se zbožím poslali i nějakou ženu."; 
};

func int DIA_Orry_Woman_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_Woman_Info()
{
//	AI_Output(other,self,"DIA_Orry_Woman_15_00"); //I saw a woman being sent down with the goods.
//	AI_Output(other,self,"DIA_Orry_Woman_15_00"); //Ich habe gesehen, wie sie eine Frau zusammen mit den Waren reingeschickt haben.
	AI_Output(other,self,"DIA_Orry_Woman_15_00"); //Viděl jsem, jak dolů se zbožím poslali i nějakou ženu.
//	AI_Output(self,other,"DIA_Orry_Woman_06_01"); //Yeah, the Ore Barons get everything they want.
//	AI_Output(self,other,"DIA_Orry_Woman_06_01"); //Ja, die Erzbarone bekommen alles, was sie wollen.
	AI_Output(self,other,"DIA_Orry_Woman_06_01"); //Jistě, Rudobaroni dostanou všechno, co se jim zachce.
//	AI_Output(other,self,"DIA_Orry_Woman_15_02"); //D'you mean to say the King exchanges women for ore?
//	AI_Output(other,self,"DIA_Orry_Woman_15_02"); //Du meinst, der König tauscht Erz gegen Frauen?
	AI_Output(other,self,"DIA_Orry_Woman_15_02"); //Chceš tím říci, že Král vyměňuje ženy za rudu?
//	AI_Output(self,other,"DIA_Orry_Woman_06_03"); //They're convicted criminals too, of course. But if Gomez hadn't asked for them, they'd be sitting in some dungeon or other.
//	AI_Output(self,other,"DIA_Orry_Woman_06_03"); //Sie sind natürlich auch verurteilte Gefangene. Aber wenn Gomez sie nicht angefordert hätte, säßen sie in irgendwelchen Kerkern.
	AI_Output(self,other,"DIA_Orry_Woman_06_03"); //Jsou to také samozřejmě odsouzené trestankyně. Ale pokud si o ně Gomez neřekne, sedí zamčené někde ve vězení.
//	AI_Output(self,other,"DIA_Orry_Woman_06_04"); //I'm not sure what's worse...
//	AI_Output(self,other,"DIA_Orry_Woman_06_04"); //Bin mir nicht sicher, was schlimmer ist ...
	AI_Output(self,other,"DIA_Orry_Woman_06_04"); //Nevím, co je horší...
};

// **************************************************
// 					Waffe
// **************************************************

instance DIA_Orry_Waffe(C_INFO)
{
	npc = GRD_254_Orry;
	nr = 3;
	condition = DIA_Orry_Waffe_Condition;
	information = DIA_Orry_Waffe_Info;
	permanent = 0;
//	description = "I'm looking for a weapon..."; 
//	description = "Ich suche eine Waffe..."; 
	description = "Hledám nějakou zbraň..."; 
};

func int DIA_Orry_Waffe_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_Waffe_Info()
{
//	AI_Output(other,self,"DIA_Orry_Waffe_15_00"); //I'm looking for a weapon...
//	AI_Output(other,self,"DIA_Orry_Waffe_15_00"); //Ich suche eine Waffe ...
	AI_Output(other,self,"DIA_Orry_Waffe_15_00"); //Hledám nějakou zbraň...
//	AI_Output(self,other,"DIA_Orry_Waffe_06_01"); //There should be some old weapons by the derelict mine further down the canyon.
//	AI_Output(self,other,"DIA_Orry_Waffe_06_01"); //Bei der verlassenen Mine weiter hinten im Canyon müsstest du alte Waffen finden.
	AI_Output(self,other,"DIA_Orry_Waffe_06_01"); //V uzavřeném dolu za kaňonem by měly být nějaké staré zbraně.
//	AI_Output(self,other,"DIA_Orry_Waffe_06_02"); //But don't go and start a war with nothing but a rusty pickaxe for a weapon - those things are slow and heavy.
//	AI_Output(self,other,"DIA_Orry_Waffe_06_02"); //Aber mach bloß nicht den Fehler und zieh mit 'ner rostigen Spitzhacke in den Krieg - die Dinger sind schwer und langsam.
	//#Spacer_OU_special_characters
	AI_Output(self,other,"DIA_Orry_Waffe_06_02"); //Nezačínej ale válku, aniž bys měl jinou zbraň než rezavý krumpáč - tyhle věci jsou pomalé a těžké.
//	AI_Output(self,other,"DIA_Orry_Waffe_06_03"); //An inexperienced fighter should never use one of them unless it's an emergency.
//	AI_Output(self,other,"DIA_Orry_Waffe_06_03"); //Ein ungeübter Kämpfer sollte sie nur im Notfall benutzen.
	AI_Output(self,other,"DIA_Orry_Waffe_06_03"); //Nezkušený bojovník by je měl použít jen v nouzi.

};

