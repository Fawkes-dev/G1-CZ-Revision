// ************************************************************
// 			  				   EXIT
// ************************************************************

instance DIA_Graham_EXIT(C_INFO)
{
	npc = Vlk_573_Graham;
	nr = 999;
	condition = Info_Graham_EXIT_Condition;
	information = Info_Graham_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Graham_EXIT_Condition()
{
	return 1;
};

func void Info_Graham_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Was machst du?
// ************************************************************

instance DIA_Graham_Hello(C_INFO)
{
	npc = Vlk_573_Graham;
	nr = 3;
	condition = DIA_Graham_Hello_Condition;
	information = DIA_Graham_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "Hi! I'm new here.";
//	description = "Hi! Ich bin neu hier.";
	description = "Zdar! Jsem tady nový.";
};

func int DIA_Graham_Hello_Condition()
{
	return 1;
};

func void DIA_Graham_Hello_Info()
{
//	AI_Output(other,self,"DIA_Graham_Hello_15_00"); //Hi! I'm new here.
//	AI_Output(other,self,"DIA_Graham_Hello_15_00"); //Hi! Ich bin neu hier.
	AI_Output(other, self, "DIA_Graham_Hello_15_00"); //Zdar! Jsem tady nový.
//	AI_Output(self,other,"DIA_Graham_Hello_02_01"); //I'm Graham. I draw maps. I haven't seen you here before... What do you want?
//	AI_Output(self,other,"DIA_Graham_Hello_02_01"); //Ich bin Graham. Ich zeichne Karten. Dich hab' ich hier noch nie gesehen ... Was willst du?
	AI_Output(self, other, "DIA_Graham_Hello_02_01"); //Já jsem Graham, kreslím mapy. Ještě jsem tě tu neviděl... Co chceš?

//	B_LogEntry(GE_TraderOC,"The digger Graham sells maps left of the main gate.");
//	B_LogEntry(GE_TraderOC,"Graham der Buddler verkauft Karten links vom Haupptor.");
	//#Needs_Attention nalevo od hlavni brany? asi zalezi na tom ako sa na to clovek pozera, ked vstupis do tabora je napravo ... ked vychadzas nalavo :) idk
	B_LogEntry(GE_TraderOC, "Kopáč Graham prodává mapy nalevo od hlavní brány.");
};

// ************************************************************
// 						Sell Map
// ************************************************************
var int Graham_OMKarteVerkauft;
var int Graham_OMKarteErpresst;
// ************************************************************

instance DIA_Graham_SellMap(C_INFO)
{
	npc = Vlk_573_Graham;
	nr = 3;
	condition = DIA_Graham_SellMap_Condition;
	information = DIA_Graham_SellMap_Info;
	important = 0;
	permanent = 1;
//	description = "Diego sent me. He asks you to give me a map to the Old Mine.";
//	description = "Diego schickt mich. Er sagt, du sollst mir ne Karte geben.";
	description = "Poslal mě Diego. Říká, že mi máš dát mapu cesty do Starého dolu.";
};

func int DIA_Graham_SellMap_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_Graham_Hello))
	&& (Npc_KnowsInfo(hero, Info_Diego_MapToOldMine))
	&& (Graham_OMKarteVerkauft == FALSE)
	&& (Graham_OMKarteErpresst == FALSE))
	{
		return 1;
	};

	return 0;
};

func void DIA_Graham_SellMap_Info()
{
//	AI_Output(other,self,"DIA_Graham_SellMap_15_00"); //Diego sent me. He asks you to give me a map with the route to the Old Mine.
//	AI_Output(other,self,"DIA_Graham_SellMap_15_00"); //Diego schickt mich. Er sagt, du sollst mir 'ne Karte geben, auf der der Weg zur Alten Mine verzeichnet ist.
	AI_Output(other, self, "DIA_Graham_SellMap_15_00"); //Poslal mě Diego. Říká, že mi máš dát mapu cesty do Starého dolu.
//	AI_Output(self,other,"DIA_Graham_SellMap_02_01"); //No problem. For you... only 20 ore.
//	AI_Output(self,other,"DIA_Graham_SellMap_02_01"); //Kein Problem. Für dich nur 20 Erz.
	AI_Output(self, other, "DIA_Graham_SellMap_02_01"); //Žádný problém. Pro tebe jen 20 nugetů.
	Info_ClearChoices(DIA_Graham_SellMap);
//	Info_AddChoice(DIA_Graham_SellMap,"I'll return.",DIA_Graham_SellMap_BACK);
//	Info_AddChoice(DIA_Graham_SellMap,"Ich komme wieder.",DIA_Graham_SellMap_BACK);
	Info_AddChoice(DIA_Graham_SellMap, "Ještě přijdu.", DIA_Graham_SellMap_BACK);
//	Info_AddChoice(DIA_Graham_SellMap,"I'll pay for the map. Here, take the ore.",DIA_Graham_SellMap_Pay);
//	Info_AddChoice(DIA_Graham_SellMap,"Gut - ich werde die Karte bezahlen. Hier, nimm das Erz.",DIA_Graham_SellMap_Pay);
	Info_AddChoice(DIA_Graham_SellMap, "Dobře - zaplatím za tu mapu. Tady, vezmi si rudu.", DIA_Graham_SellMap_Pay);
//	Info_AddChoice(DIA_Graham_SellMap,"Give me the map or I'll take it!",DIA_Graham_SellMap_AufsMaul);
//	Info_AddChoice(DIA_Graham_SellMap,"Rück die Karte raus, oder ich polier dir die Fresse!",DIA_Graham_SellMap_AufsMaul);
	Info_AddChoice(DIA_Graham_SellMap, "Vytáhni tu mapu, nebo ti zmaluju obličej!", DIA_Graham_SellMap_AufsMaul);
//	Info_AddChoice(DIA_Graham_SellMap,"Hold on, Diego said you should GIVE me the map, not SELL it to me!",DIA_Graham_SellMap_GiveNotSell);
//	Info_AddChoice(DIA_Graham_SellMap,"Moment, Diego sagte, du sollst mir die Karte GEBEN, nicht verkaufen.",DIA_Graham_SellMap_GiveNotSell);
	Info_AddChoice(DIA_Graham_SellMap, "Zadrž, Diego řekl, že bys mi měl tu mapu DÁT, ne, že bys mi ji měl prodat.", DIA_Graham_SellMap_GiveNotSell);
};

func void DIA_Graham_SellMap_BACK()
{
//	AI_Output(other,self,"DIA_Graham_SellMap_BACK_15_00"); //I'll return.
//	AI_Output(other,self,"DIA_Graham_SellMap_BACK_15_00"); //Ich komme wieder.
	AI_Output(other, self, "DIA_Graham_SellMap_BACK_15_00"); //Ještě přijdu.
	Info_ClearChoices(DIA_Graham_SellMap);
};

func void DIA_Graham_SellMap_Pay()
{
//	AI_Output(other,self,"DIA_Graham_SellMap_Pay_15_00"); //I'll pay for the map. Here, take the ore.
//	AI_Output(other,self,"DIA_Graham_SellMap_Pay_15_00"); //Ich werde die Karte bezahlen. Hier, nimm das Erz.
	AI_Output(other, self, "DIA_Graham_SellMap_Pay_15_00"); //Dobře - zaplatím za tu mapu. Tady, vezmi si tu rudu.
	if (Npc_HasItems(other, itminugget) >= 20)
	{
//		AI_Output(self,other,"DIA_Graham_SellMap_Pay_02_01"); //Okay. You'll never get a map like this that cheap - believe me.
//		AI_Output(self,other,"DIA_Graham_SellMap_Pay_02_01"); //Gut. So billig kommst du nie wieder an so eine Karte - glaub mir.
		AI_Output(self, other, "DIA_Graham_SellMap_Pay_02_01"); //Dobrá. Takhle lacino mapu nikde jinde nedostaneš - to mi věř.
		B_GiveInvItems(other, self, itminugget, 20);
		B_GiveInvItems(self, other, ItWrOMmap, 1);
		Graham_OMKarteVerkauft = TRUE;
		Info_ClearChoices(DIA_Graham_SellMap);
	}
	else
	{
//		AI_Output(self,other,"DIA_Graham_SellMap_Pay_NoOre_02_00"); //Go and get some ore first. Hunt animals or collect mushrooms - you can sell the stuff here in the Camp.
//		AI_Output(self,other,"DIA_Graham_SellMap_Pay_NoOre_02_00"); //Beschaff dir erst mal ein bisschen Erz. Geh Tiere jagen oder Pilze sammeln - du kannst den Krempel dann hier im Lager zu Erz machen.
		AI_Output(self, other, "DIA_Graham_SellMap_Pay_NoOre_02_00"); //Napřed si opatři nějakou rudu. Jdi lovit zvěř nebo nasbírej nějaké houby - tyhle krámy potom můžeš tady v táboře prodat.
	};
};

func void DIA_Graham_SellMap_AufsMaul()
{
//	AI_Output(other,self,"DIA_Graham_SellMap_AufsMaul_15_00"); //Give me the map or I'll take it!
//	AI_Output(other,self,"DIA_Graham_SellMap_AufsMaul_15_00"); //Rück die Karte raus, oder ich polier dir die Fresse!
	AI_Output(other, self, "DIA_Graham_SellMap_AufsMaul_15_00"); //Vytáhni tu mapu, nebo ti zmaluju obličej!
//	AI_Output(self,other,"DIA_Graham_SellMap_AufsMaul_02_01"); //Hey, be cool, man. I don't want trouble. Here, take the map and leave me alone!
//	AI_Output(self,other,"DIA_Graham_SellMap_AufsMaul_02_01"); //Mach bloß keinen Mist, Mann. Ich will keinen Ärger. Hier, nimm die verdammte Karte und jetzt lass mich in Ruhe!
	AI_Output(self, other, "DIA_Graham_SellMap_AufsMaul_02_01"); //Hej, opatrně, chlape. Nechci problémy. Tady je TA mapa a nech mě na pokoji!
	B_GiveInvItems(self, other, ItWrOMmap, 1);
	Info_ClearChoices(DIA_Graham_SellMap);
	Npc_SetPermAttitude(self, ATT_ANGRY);
	Graham_OMKarteErpresst = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Graham_SellMap_GiveNotSell()
{
//	AI_Output(other,self,"DIA_Graham_SellMap_GiveNotSell_15_00"); //Hold on, Diego said you should GIVE me the map, not that you should sell it to me.
//	AI_Output(other,self,"DIA_Graham_SellMap_GiveNotSell_15_00"); //Moment mal, Diego sagte, du sollst mir die Karte GEBEN, nicht verkaufen.
	AI_Output(other, self, "DIA_Graham_SellMap_GiveNotSell_15_00"); //Zadrž, Diego řekl, že bys mi měl tu mapu DÁT, ne, že bys mi ji měl prodat.
//	AI_Output(self,other,"DIA_Graham_SellMap_GiveNotSell_02_01"); //But I'm not interested! Have you any idea how difficult it is to make a map like this?
//	AI_Output(self,other,"DIA_Graham_SellMap_GiveNotSell_02_01"); //Das interessiert mich aber nicht! Hast du eine Ahnung, wie viel Arbeit es macht, so eine Karte anzufertigen?
	AI_Output(self, other, "DIA_Graham_SellMap_GiveNotSell_02_01"); //To mě ale nezajímá! Máš vůbec představu, kolik práce to je, takovou mapu nakreslit?
//	AI_Output(self,other,"DIA_Graham_SellMap_GiveNotSell_02_02"); //20 is my special price for friends of Diego. Usually I take 50.
//	AI_Output(self,other,"DIA_Graham_SellMap_GiveNotSell_02_02"); //20 ist schon mein Spezialpreis für Freunde von Diego. Normalerweise würde ich 50 nehmen.
	AI_Output(self, other, "DIA_Graham_SellMap_GiveNotSell_02_02"); //20 je má speciální cena pro Diegovy přátele. Obvykle beru 50.
};

instance DIA_Graham_BuyMaps(C_INFO)
{
	npc = Vlk_573_Graham;
	nr = 800;
	condition = DIA_Graham_BuyMaps_Condition;
	information = DIA_Graham_BuyMaps_Info;
	important = 0;
	permanent = 1;
	Trade = 1;
//	description = "I'd like to buy a map.";
//	description = "Ich würde gerne eine Karte kaufen.";
	description = "Chtěl bych koupit mapu.";
};

func int DIA_Graham_BuyMaps_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Graham_Hello))
	{
		return 1;
	};

	return 0;
};

func void DIA_Graham_BuyMaps_Info()
{
//	AI_Output(other,self,"DIA_Graham_BuyMaps_15_00"); //I'd like to buy a map.
//	AI_Output(other,self,"DIA_Graham_BuyMaps_15_00"); //Ich würde gerne eine Karte kaufen.
	AI_Output(other, self, "DIA_Graham_BuyMaps_15_00"); //Chtěl bych koupit mapu.
//	AI_Output(self,other,"DIA_Graham_BuyMaps_02_01"); //Sure... What are you thinking of? The more you can see on a map, the more expensive it is..
//	AI_Output(self,other,"DIA_Graham_BuyMaps_02_01"); //Klar ... Was suchst du? Je mehr drauf zu sehen ist, desto teurer sind die Karten.
	AI_Output(self, other, "DIA_Graham_BuyMaps_02_01"); //Jistě... Jakou máš na mysli? Čím více toho na mapě vidíš, tím je dražší.
};
