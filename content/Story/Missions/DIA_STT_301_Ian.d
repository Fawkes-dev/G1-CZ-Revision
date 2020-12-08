// ************************ EXIT **************************

instance STT_301_IAN_Exit(C_INFO)
{
	npc = STT_301_IAN;
	nr = 999;
	condition = STT_301_IAN_Exit_Condition;
	information = STT_301_IAN_Exit_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int STT_301_IAN_Exit_Condition()
{
	return 1;
};

func void STT_301_IAN_Exit_Info()
{
//	AI_Output(other,self,"STT_301_IAN_Exit_Info_15_01"); //I'll just have a look around.
//	AI_Output(other,self,"STT_301_IAN_Exit_Info_15_01"); //Ich schau' mich mal um.
	AI_Output(other,self,"STT_301_IAN_Exit_Info_15_01"); //Jenom se tu rozhlížím.
//	AI_Output(self,other,"STT_301_IAN_Exit_Info_13_02"); //Don't make any trouble.
//	AI_Output(self,other,"STT_301_IAN_Exit_Info_13_02"); //Mach keinen Ärger.
	AI_Output(self,other,"STT_301_IAN_Exit_Info_13_02"); //Nedělej problémy.

	AI_StopProcessInfos(self);
};
// ***************** Erstes Treffen *****************************

instance STT_301_IAN_HI(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_HI_Condition;
	information = STT_301_IAN_HI_Info;
	important = 0;
	permanent = 0;
//	description = "Are you Ian, the boss of the mine?"; 
//	description = "Bist du Ian, der Chef der Mine?"; 
	description = "Ty jsi Ian, šéf toho dolu?"; 
};

func int STT_301_IAN_HI_Condition()
{ 
	if ( ! Npc_KnowsInfo(hero,STT_301_IAN_NEST))
	{ 
		return TRUE;
	};
};
func void STT_301_IAN_HI_Info()
{
//	AI_Output(other,self,"STT_301_IAN_HI_Info_15_01"); //Are you Ian, the boss of the mine?
//	AI_Output(other,self,"STT_301_IAN_HI_Info_15_01"); //Bist du Ian, der Chef der Mine?
	AI_Output(other,self,"STT_301_IAN_HI_Info_15_01"); //Ty jsi Ian, šéf toho dolu?
//	AI_Output(self,other,"STT_301_IAN_HI_Info_13_02"); //Yes, I'm Ian. And this is my mine. So don't touch or break anything.
//	AI_Output(self,other,"STT_301_IAN_HI_Info_13_02"); //Ja, ich bin Ian. Und das hier ist meine Mine. Also fass nichts an und mach nichts kaputt.
	AI_Output(self,other,"STT_301_IAN_HI_Info_13_02"); //Ano, jsem Ian. A tohle je můj důl. Ničeho se nedotýkej a nic nerozbij.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_GOMEZ_Condition;
	information = STT_301_IAN_GOMEZ_Info;
	important = 0;
	permanent = 0;
//	description = "Isn't that Gomez' mine?"; 
//	description = "Ist das nicht Gomez' Mine?"; 
	description = "Není to Gomezův důl?"; 
};

func int STT_301_IAN_GOMEZ_Condition()
{ 
	if Npc_KnowsInfo(hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
func void STT_301_IAN_GOMEZ_Info()
{
//	AI_Output(other,self,"STT_301_IAN_GOMEZ_Info_15_01"); //Isn't that Gomez' mine?
//	AI_Output(other,self,"STT_301_IAN_GOMEZ_Info_15_01"); //Ist das nicht Gomez' Mine?
	AI_Output(other,self,"STT_301_IAN_GOMEZ_Info_15_01"); //Není to Gomezův důl?
//	AI_Output(self,other,"STT_301_IAN_GOMEZ_Info_13_02"); //Yes, of course this is the mine of the Old Camp. But in here there's only one boss - and that's me.
//	AI_Output(self,other,"STT_301_IAN_GOMEZ_Info_13_02"); //Ja, natürlich ist das die Mine des Alten Lagers. Aber hier drin gibt's nur einen Chef - und das bin ich.
	AI_Output(self,other,"STT_301_IAN_GOMEZ_Info_13_02"); //Ano, jistě, že je to důl Starého tábora. Ale je tady jediný šéf - a to jsem já.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_ORE(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_ORE_Condition;
	information = STT_301_IAN_ORE_Info;
	important = 0;
	permanent = 0;
//	description = "Can you tell me something about the ore production here? "; 
//	description = "Kannst du mir ein paar Takte zur Erzförderung erzählen?"; 
	description = "Můžeš mi říci něco o zdejší produkci rudy?"; 
};

func int STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo(hero,STT_301_IAN_GOMEZ)
	{
		return TRUE;
	};

};
func void STT_301_IAN_ORE_Info()
{
//	AI_Output(other,self,"STT_301_IAN_ORE_Info_15_01"); //Can you tell me something about the ore production here?
//	AI_Output(other,self,"STT_301_IAN_ORE_Info_15_01"); //Kannst du mir ein paar Takte zur Erzförderung erzählen?
	AI_Output(other,self,"STT_301_IAN_ORE_Info_15_01"); //Můžeš mi říci něco o zdejší produkci rudy?
//	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_02"); //We dig for ore day and night. This means a storage of 200 sacks per month and another 20 sacks which will be melted down.
//	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_02"); //Wir fördern hier rund um die Uhr Erz. Im Monat sind das über 200 Säcke Erz, die gelagert werden und noch mal 20 Säcke, die eingeschmolzen werden. 
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_02"); //Těžíme ve dne v noci. To znamená 200 pytlů měsíčně do skladu a dalších 20 pytlů na přetavení.
//	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_03"); //Hundreds of blades can be forged with the ore we supply to the King.
//	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_03"); //Mit dem Erz, das wir dem König liefern, können hunderte von Klingen hergestellt werden.
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_03"); //Z rudy, kterou dodáváme králi, se můžou ukovat stovky ostří.

}; 
// ***************** Infos *****************************   
instance STT_301_IAN_MORE(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_MORE_Condition;
	information = STT_301_IAN_MORE_Info;
	important = 0;
	permanent = 0;
//	description = "I've heard that the ore has magical qualities. Tell me about it."; 
//	description = "Ich habe gehört, das Erz ist magisch. Erzähl mir davon."; 
	description = "Slyšel jsem, že ta ruda má kouzelnou moc. Řekni mi o tom něco."; 
};

func int STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo(hero,STT_301_IAN_ORE);
};

func void STT_301_IAN_MORE_Info()
{
//	AI_Output(other,self,"STT_301_IAN_MORE_Info_15_01"); //I've heard that the ore has magical qualities. Tell me about it.
//	AI_Output(other,self,"STT_301_IAN_MORE_Info_15_01"); //Ich habe gehört, das Erz ist magisch. Erzähl mir davon.
	AI_Output(other,self,"STT_301_IAN_MORE_Info_15_01"); //Slyšel jsem, že ta ruda má kouzelnou moc. Řekni mi o tom něco.
//	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_02"); //The magic ore does have special qualities. Weapons forged from it don't break, their blades are sharper than usual ones.
//	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_02"); //Das magische Erz besitzt besondere Qualitäten. Es macht die Waffen unzerbrechlich und die Klingen sind schärfer als gewöhnliche. 
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_02"); //Ta magická moc dodává kovu speciální vlastnosti. Zbraně, které jsou z něj ukovány, se nelámou, jejich ostří jsou ostřejší než obyčejně.
//	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_03"); //An army equipped with these weapons has a decisive advantage in battle.
//	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_03"); //Eine Armee, die mit solchen Waffen ausgestattet ist, hat einen entscheidenden Vorteil in jeder Schlacht.
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_03"); //Armáda vybavená takovými zbraněmi má rozhodující převahu v boji.

};   
// ***************** Infos *****************************  
instance STT_301_IAN_MAGIC(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_MAGIC_Condition;
	information = STT_301_IAN_MAGIC_Info;
	important = 0;
	permanent = 0;
//	description = "Tell me more about the ore."; 
//	description = "Erzähl mir mehr vom Erz"; 
	description = "Řekni mi víc o té rudě."; 
};

func int STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo(hero,STT_301_IAN_MORE);
};

func void STT_301_IAN_MAGIC_Info()
{
//	AI_Output(other,self,"STT_301_IAN_MAGIC_Info_15_01"); //Tell me more about the ore.
//	AI_Output(other,self,"STT_301_IAN_MAGIC_Info_15_01"); //Erzähl mir mehr vom Erz.
	AI_Output(other,self,"STT_301_IAN_MAGIC_Info_15_01"); //Řekni mi víc o té rudě.
//	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_02"); //Unfortunately the magic powers of the ore vanish during the smelting process. They know the right smelting technique in the blast furnaces of Nordmar.
//	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_02"); //Leider geht die magische Wirkung des Erzes beim Schmelzen verloren. In den Hochöfen von Nordmar, da kennen sie die richtige Schmelztechnik. 
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_02"); //Naneštěstí během procesu tavení magické kouzlo rudy vyprchává. V horkovzdušných tavicích pecích u Severního moře znají správnou techniku tavení.
//	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_03"); //But even without the magic powers, weapons made from this ore are extremely resistant and do more damage than normal weapons.
//	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_03"); //Aber selbst ohne die magische Wirkung sind Waffen aus diesem Erz extrem widerstandsfähig und richten mehr Schaden an als gewöhnliche Waffen.  
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_03"); //Ale zbraně vyrobené z téhle rudy jsou i bez magického kouzla výjimečně trvanlivé a mají daleko větší účinek než zbraně obyčejné.

};   
// ***************** Infos *****************************   
instance STT_301_IAN_MINE(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_MINE_Condition;
	information = STT_301_IAN_MINE_Info;
	important = 0;
	permanent = 0;
//	description = "Tell me about the mine."; 
//	description = "Erzähl mir von der Mine."; 
	description = "Řekni mi něco o dole."; 
};

func int STT_301_IAN_MINE_Condition()
{ 
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo(hero,STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void STT_301_IAN_MINE_Info()
{
//	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_01"); //Tell me about the mine.
//	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_01"); //Erzähl mir von der Mine.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_01"); //Povídej mi o dolu.
//	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_02"); //If you want to look around here you need to be careful. There are minecrawlers in the caves. You'd better stay in the main shaft.
//	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_02"); //Wenn du dich hier weiter umsehen willst, sei vorsichtig. In den Höhlen sind Minecrawler. Am besten du bleibst in diesem Hauptschacht.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_02"); //Jestli se chceš tady porozhlédnout, musíš být opatrný. V jeskyních jsou důlní červi. Měl bys raději zůstat v hlavní šachtě.
//	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_03"); //And leave the templars alone. Even if they only hang around most of the time, they're the best fighters you can ever have at your side when it comes down to the crawlers.
//	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_03"); //Und lass die Templer in Ruhe. Sie lungern zwar die meiste Zeit nur rum, aber wenn die Crawler kommen,gibt es keinen besseren Kämpfer an deiner Seite.  
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_03"); //A nechat templáře na pokoji. Sice se většinu času jen tak procházejí, ale když přijdou červi, jsou to nejlepší bojovníci, jaké vůbec můžeme na naší straně mít.
//	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_04"); //I'll keep that in mind.
//	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_04"); //Ich werd's mir merken.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_04"); //Budu si to pamatovat.
//	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_05"); //I have some work to do. And don't keep my boys from doing their work.
//	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_05"); //Ich hab' noch zu tun. Und halte meine Jungs nicht von der Arbeit ab.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_05"); //Musím něco dělat. A neruš moje chlapy při práci.
//	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_06"); //I'll just have a look around here.
//	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_06"); //Ich sehe mich nur mal um.   
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_06"); //Jen se tu rozhlížím.
};
/*------------------------------------------------------------------------
					BRING LIST 
------------------------------------------------------------------------*/

instance STT_301_IAN_WANTLIST(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_WANTLIST_Condition;
	information = STT_301_IAN_WANTLIST_Info;
	important = 0;
	permanent = 0;
//	description = "I'm here to collect the list for the Camp."; 
//	description = "Ich wollte die Liste fürs Lager abholen."; 
	description = "Mám tady opatřit seznam věcí pro tábor."; 
};

func int STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo(hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
func void STT_301_IAN_WANTLIST_Info()
{
//	AI_Output(other,self,"STT_301_IAN_WANTLIST_Info_15_01"); //I'm here to collect the list for the Camp.
//	AI_Output(other,self,"STT_301_IAN_WANTLIST_Info_15_01"); //Ich wollte die Liste fürs Lager abholen.
	AI_Output(other,self,"STT_301_IAN_WANTLIST_Info_15_01"); //Mám tady opatřit seznam věcí pro tábor.
//	AI_Output(self,other,"STT_301_IAN_WANTLIST_Info_13_02"); //Anybody could say that. Get lost.
//	AI_Output(self,other,"STT_301_IAN_WANTLIST_Info_13_02"); //Da könnte ja jeder kommen. Verpiss dich.
	AI_Output(self,other,"STT_301_IAN_WANTLIST_Info_13_02"); //To by mohl říci každý. Ztrať se.

};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN 
------------------------------------------------------------------------*/

instance STT_301_IAN_GETLIST(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_GETLIST_Condition;
	information = STT_301_IAN_GETLIST_Info;
	important = 0;
	permanent = 0;
//	description = "Diego sent me. I'm to collect the list."; 
//	description = "Diego schickt mich. Ich soll die Liste abholen."; 
	description = "Poslal mě Diego. Mám tady opatřit seznam."; 
};

func int STT_301_IAN_GETLIST_Condition()
{ 
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo(hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};

};
func void STT_301_IAN_GETLIST_Info()
{
//	AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01"); //Diego sent me. I'm to collect the list.
//	AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01"); //Diego schickt mich. Ich soll die Liste abholen.
	AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01"); //Poslal mě Diego. Mám tady opatřit seznam.
//	AI_Output(self,other,"STT_301_IAN_GETLIST_Info_13_02"); //Alright, here's the list. Tell them to hurry up with the deliveries.
//	AI_Output(self,other,"STT_301_IAN_GETLIST_Info_13_02"); //Alle klar, hier ist die Liste. Sie sollen sich mit dem Liefern beeilen.
	AI_Output(self,other,"STT_301_IAN_GETLIST_Info_13_02"); //Dobře, tady je seznam. Řekni jim, aby si s dodávkou pospíšili.
//	B_LogEntry(CH1_BringList,"Ian gave me the list without any problem.");
//	B_LogEntry(CH1_BringList,"Ian hat mir die Liste ohne Probleme übergeben.");
	B_LogEntry(CH1_BringList,"Ian mi bez problémů vydal seznam.");
	B_GiveInvItems(self,hero,TheList,1);
};  
// **************************************************************************
// MISSION BRING MCQ EIER RUNNING , 
// oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance STT_301_IAN_NEST(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_NEST_Condition;
	information = STT_301_IAN_NEST_Info;
	important = 0; 
	permanent = 0;
//	description = "There must be a nest of minecrawlers somewhere here.";
//	description = "Es muss hier irgendwo ein Nest der Minecrawler geben.";
	description = "Musí tu někde být hnízdo důlních červů.";
};                       

func int STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& (Npc_KnowsInfo(hero,STT_301_IAN_HI))
	{
		return 1;
	};
};
func void STT_301_IAN_NEST_Info()
{
//	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_01"); //There must be a nest of minecrawlers somewhere here.
//	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_01"); //Es muss hier irgendwo ein Nest der Minecrawler geben.
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_01"); //Musí tu někde být hnízdo důlních červů.
//	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_02"); //There are probably dozens of nests here.
//	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_02"); //Hier gibt's wahrscheinlich Dutzende von Nestern.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_02"); //Jsou tu zřejmě tucty jejich hnízd.
//	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_03"); //Listen, I need to get to this nest now...
//	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_03"); //Hör zu, ich muss zu diesem Nest...
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_03"); //Poslyš, potřebuju se teď dostat do jejich hnízda...
//	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_04"); //I don't have time to see to it now. Our masher doesn't work any more. The gearwheel broke a few hours ago.
//	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_04"); //Ich habe jetzt keine Zeit, mich darum zu kümmern. Unser Stampfer ist kaputt. Vor ein paar Stunden ist das Zahnrad gebrochen. 
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_04"); //Nemám čas se teď o to starat. Drtička přestala pracovat. Před několika hodinami se rozbilo ozubené kolo.
//	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_05"); //I've no idea where to get a new one.
//	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_05"); //Ich hab' noch keine Idee, wo ich ein neues herbekommen kann.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_05"); //Nemám potuchy, kde vzít nové.
//	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_06"); //Just get me a gearwheel, then I'll see to your problem.
//	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_06"); //Besorg mir doch einfach eins, dann kümmere ich mich um dein Problem.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_06"); //Postarej se mi o to ozubené kolo a já se pak postarám o tvůj problém.

//	B_LogEntry(CH2_MCEggs,"Ian, the boss of the mine, will not help me find the nest. I had better get him a new gearwheel for his broken ore masher. He mentioned an abandoned side tunnel where I might find an old masher.");
//	B_LogEntry(CH2_MCEggs,"Ian der Minenboss will mir nicht helfen das Nest zufinden Ich soll ihm erst ein neues Zahnrad für ihren kaputten Erzstampfer besorgen. Er erwähnte einen verlassenen Nebenstollen, in dem sich noch ein alter Stampfer befinden soll.");
	B_LogEntry(CH2_MCEggs,"Ian, velitel dolu, mi nepomůže hledat hnízdo. Měl bych mu obstarat nové ozubené kolo pro jeho rozbitou drtičku rudy. Zmínil se o opuštěné postranní štole, kde bych mohl najít starou drtičku.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance STT_301_IAN_GEAR_RUN(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_GEAR_RUN_Condition;
	information = STT_301_IAN_GEAR_RUN_Info;
	important = 0; 
	permanent = 0;
//	description = "A gearwheel? Where am I supposed to get that?";
//	description = "Ein Zahnrad? Wo soll ich das herkriegen?";
	description = "Ozubené kolo? Kde si myslíš, že ho vezmu?";
};                       

func int STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt (PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);

	if ((Ian_gearwheel == LOG_RUNNING)
	&& !Npc_HasItems(hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
func void STT_301_IAN_GEAR_RUN_Info()
{
//	AI_Output(other,self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //A gearwheel? Where am I supposed to get that?
//	AI_Output(other,self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Ein Zahnrad? Wo soll ich das herkriegen?
	AI_Output(other,self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Ozubené kolo? Kde si myslíš, že ho vezmu?
//	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //No idea. I'm as much at a loss as you are!
//	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Keine Ahnung. Ich bin so ratlos wie du!
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Nemám představu. Jsem stejně bezradný jako ty!
//	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //But there's an old broken masher in a side shaft. Maybe you'll be lucky there.
//	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //Aber es gibt in einem Nebenschacht noch einen alten, kaputten Stampfer. Vielleicht hast du ja dort Glück.
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //V postranní šachtě je ale stará porouchaná drtička. Možná by se dalo vzít tam.
};

// ******************************MISSION SUCCESS********************************************  
instance STT_301_IAN_GEAR_SUC(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_GEAR_SUC_Condition;
	information = STT_301_IAN_GEAR_SUC_Info;
	important = 0; 
	permanent = 0;
//	description = "I have the gearwheel.";
//	description = "Ich habe das Zahnrad.";
	description = "Mám to ozubené kolo.";
};                       

func int STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems(hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
func void STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems(hero,self,ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem(self,ItMi_Stuff_Gearwheel_01);

	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP(XP_BringGearWheel);

	var C_Npc Sklave; 
	Sklave = Hlp_GetNpc(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine(Sklave,"Stomper");

//	AI_Output(other,self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //I have the gearwheel.
//	AI_Output(other,self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //Ich habe das Zahnrad.
	AI_Output(other,self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //Mám to ozubené kolo.
//	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Hey, well done. I think that'll work. Now what about you, you're looking for the nest of the minecrawlers... hm...
//	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Hey, gut gemacht. Ich denke, das wird klappen. Nun zu dir, du suchst das Nest der Minecrawler...hm...
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Hej, dobrá práce. Myslím, že funguje. No a teď ty, hledáš hnízdo důlního červa... hmmm...
//	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Just go to Asghan and tell him to open the gate, so you can search the dark shafts.
//	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Geh mal zu Asghan, er soll das Tor öffnen, damit du die dunklen Schächte durchsuchen kannst.
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Běž za Asghanem a řekni mu, aby ti otevřel vrata, aby ses dostal do temných šachet.
//	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //"Just tell him ""Everything's gonna be fine."" Then he'll know that I've given you permission."
//	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Sag ihm einfach, "Alles wird gut". Dann wird er wissen, das ich die Erlaubnis gegeben habe.
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Řekni mu jenom 'Všechno jde dobře'. Tím bude srozuměný s tím, že jsem ti dal povolení.

//	B_LogEntry(CH2_MCEggs,"I brought Ian the gearwheel from the abandoned ore masher. Ian said I should say EVERYTHING'S GOING TO BE FINE to Asghan. Apparently, that'll make him open the gate to the dark shafts.");
//	B_LogEntry(CH2_MCEggs,"Ich habe Ian das Zahnrad des verlassenen Erzstampfers gebracht.Ian sagte mir,wenn ich Asgahn die Worte ALLES WIRD GUT sagen, dann wird er das Tor zu den dunklen Schächten öffnen.");
	B_LogEntry(CH2_MCEggs,"Přinesl jsem Ianovi ozubené kolo z vyřazené drtičky rudy. Ian prohlásil, že mám Asghanovi říci VŠECHNO BUDE V POŘÁDKU. Potom mi otevře vrata do temných šachet.");
};

// ******************************GOTO ASGHAN********************************************  
instance STT_301_IAN_GOTOASGHAN(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_GOTOASGHAN_Condition;
	information = STT_301_IAN_GOTOASGHAN_Info;
	important = 0; 
	permanent = 0;
//	description = "I'm still looking for the crawlers' nest.";
//	description = "Ich suche immer noch das Nest der Crawler.";
	description = "Pořád hledám červí hnízdo.";
};                       

func int STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&& (!Npc_KnowsInfo(hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
func void STT_301_IAN_GOTOASGHAN_Info()
{
//	AI_Output(other,self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //I'm still looking for the crawlers nest.
//	AI_Output(other,self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Ich suche immer noch das Nest der Crawler.
	AI_Output(other,self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Pořád hledám červí hnízdo.
//	AI_Output(self,other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //I've already told you, go to Asghan. He's the chief of the guards. You'll find him somewhere on the lowest level.
//	AI_Output(self,other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //Ich sagte doch, geh zu Asghan. Er ist der Anführer der Gardisten. Du findest in irgendwo auf der untersten Ebene.
	AI_Output(self,other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //Už jsem ti řekl, abys šel za Asghanem. Je to velitel stráží. Najdeš ho někde na nejnižší úrovni.

//	B_LogEntry(CH2_MCEggs,"If I want to find the minecrawlers' nest, I need to talk to Asghan.");
//	B_LogEntry(CH2_MCEggs,"Wenn ich das Minecrawlernest finden will, sollte ich mit Asghan reden.");
	B_LogEntry(CH2_MCEggs,"Pokud chci najít hnízdo důlních červů, musím si nejdříve promluvit s Asghanem.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance STT_301_IAN_AFTERALL(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_AFTERALL_Condition;
	information = STT_301_IAN_AFTERALL_Info;
	important = 0; 
	permanent = 0;
//	description = "I've found the nest!";
//	description = "Ich habe das Nest gefunden!";
	description = "Našel jsem hnízdo!";
};                       

func int STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems(hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
func void STT_301_IAN_AFTERALL_Info()
{
//	AI_Output(other,self,"STT_301_IAN_AFTERALL_Info_15_01"); //I've found the nest!
//	AI_Output(other,self,"STT_301_IAN_AFTERALL_Info_15_01"); //Ich habe das Nest gefunden!
	AI_Output(other,self,"STT_301_IAN_AFTERALL_Info_15_01"); //Našel jsem hnízdo!
//	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_02"); //Then we'll finally have peace and quiet here again. Hahaha!
//	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_02"); //Dann kehrt jetzt hier endlich wieder Ruhe ein. Hahaha!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_02"); //Tak už tady budeme konečně mít mír a klid, hahaha!
//	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_03"); //No offence. Good work, boy!
//	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_03"); //Nichts für ungut. Gute Arbeit, Kleiner! 
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_03"); //Bez urážky. Dobrá práce, hochu!
//	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_04"); //Here, take this crate of beer for your efforts.
//	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_04"); //Hier, nimm diese Kiste Bier für deine Mühen.
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_04"); //Tady si vezmi basu piv za svoji snahu.
	CreateInvItems(self,ItFo_OM_Beer_01,6);
	B_GiveInvItems(self,hero,ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance STT_301_IAN_NOTENOUGH(C_INFO)
{
	npc = STT_301_IAN;
	condition = STT_301_IAN_NOTENOUGH_Condition;
	information = STT_301_IAN_NOTENOUGH_Info;
	important = 0; 
	permanent = 0;
//	description = "I've found the nest! And the eggs of the minecrawler queen!";
//	description = "Ich habe das Nest gefunden! Und Eier von der Minecrawler-Königin!";
	description = "Našel jsem hnízdo! A vajíčka královny důlních červů!";
};                       

func int STT_301_IAN_NOTENOUGH_Condition()
{
	if (Npc_HasItems(hero,ItAt_Crawlerqueen) > 1 )
	&& (Npc_HasItems(hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
func void STT_301_IAN_NOTENOUGH_Info()
{
//	AI_Output(other,self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //I've found the nest! And the eggs of the minecrawler queen!
//	AI_Output(other,self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Ich habe das Nest gefunden! Und Eier von der Minecrawler-Königin!
	AI_Output(other,self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Našel jsem hnízdo! A vajíčka královny důlních červů!
//	AI_Output(self,other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //What? Is that all the eggs you found? Well, so what. You've proved you can fight.
//	AI_Output(self,other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Wie? Nur so wenig Eier? Na, was soll's. Du hast bewiesen, dass du kämpfen kannst.
	AI_Output(self,other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Cože? Tohle jsou všechna vajíčka, co jsi našel? Nu, co. Ukázal jsi, že umíš bojovat.
};
