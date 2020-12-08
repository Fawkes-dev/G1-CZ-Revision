// ************************ EXIT **************************

instance VLK_585_Aleph_Exit(C_INFO)
{
	npc = VLK_585_Aleph;
	nr = 999;
	condition = VLK_585_Aleph_Exit_Condition;
	information = VLK_585_Aleph_Exit_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int VLK_585_Aleph_Exit_Condition()
{
	return 1;
};

func void VLK_585_Aleph_Exit_Info()
{
	if !Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH)
	{
//		AI_Output(other,self,"VLK_585_Aleph_Exit_Info_15_01"); //Good luck!
//		AI_Output(other,self,"VLK_585_Aleph_Exit_Info_15_01"); //Viel Glück noch.
		AI_Output(other,self,"VLK_585_Aleph_Exit_Info_15_01"); //Hodně štěstí!
//		AI_Output(self,other,"VLK_585_Aleph_Exit_Info_05_02"); //Well, you know where to find me.
//		AI_Output(self,other,"VLK_585_Aleph_Exit_Info_05_02"); //Du weißt ja, wo du mich findest.
		AI_Output(self,other,"VLK_585_Aleph_Exit_Info_05_02"); //Dobře, víš kde mě najdeš.
	};

	AI_StopProcessInfos(self);

};
// ***************** ALEPH IST EIN FAULPELZ *****************************
instance VLK_585_Aleph_CLEVER(C_INFO)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_CLEVER_Condition;
	information = VLK_585_Aleph_CLEVER_Info;
	important = 1;
	permanent = 0;
};

func int VLK_585_Aleph_CLEVER_Condition()
{
	return 1;
};

func void VLK_585_Aleph_CLEVER_Info()
{
//	AI_Output(self,other,"VLK_585_Aleph_CLEVER_Info_05_01"); //Hehehe, the guards will never get me!
//	AI_Output(self,other,"VLK_585_Aleph_CLEVER_Info_05_01"); //Hehehe, die Wachen erwischen mich nie!
	AI_Output(self,other,"VLK_585_Aleph_CLEVER_Info_05_01"); //Hehehe, stráže mě nikdy nedostanou!
};
// ***************** ALEPH ERKLÄRT SEINE ARBEITSHALTUNG *****************************

instance VLK_585_Aleph_GUARDS(C_INFO)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_GUARDS_Condition;
	information = VLK_585_Aleph_GUARDS_Info;
	important = 0;
	permanent = 0;
//	description = "What do you mean?"; 
//	description = "Wie meinst du das?"; 
	description = "Jak to myslíš?"; 
};

func int VLK_585_Aleph_GUARDS_Condition()
{ 
	if Npc_KnowsInfo(hero,VLK_585_Aleph_CLEVER) 
	{
		return 1;
	};
};

func void VLK_585_Aleph_GUARDS_Info()
{
//	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_01"); //What do you mean?
//	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_01"); //Wie meinst du das?
	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_01"); //Jak to myslíš?
//	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_02"); //I only work when the guards are nearby or they can see me. Otherwise I just hang around here.
//	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_02"); //Ich arbeite nur, wenn Wachen in der Nähe sind oder mich sehen können. Ansonsten häng' ich hier meine Zeit ab.
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_02"); //Pracuju jen tehdy, když jsou stráže blízko nebo když mě můžou vidět. Jinak se jenom procházím.
//	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_03"); //Don't they get suspicious?
//	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_03"); //Werden sie nicht misstrauisch?
	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_03"); //Nedostanou podezření?
//	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_04"); //Yeah, well of course, I dig less ore than all the others do. It's not always enough, so I have to do a bit of trading.
//	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_04"); //Nun ja, ich schürfe natürlich weniger Erz als alle anderen. Es reicht natürlich nicht immer, da muss ich halt mal ein bisschen geschickt tauschen.
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_04"); //Jo, jistě, narubu míň rudy než ostatní. Není to nikdy dost, a tak musím dělat trochu obchod.
//	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_05"); //I keep my ears open, so I get to know many useful things. You don't happen to have some ore on you? Let's say about 10 ore?
//	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_05"); //Ich halt immer meine Ohren offen und bekomme viele nützliche Dinge mit. Du hast nicht zufällig etwas Erz bei dir? So ungefähr 10 Erz?
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_05"); //Jsem jedno ucho, takže se dozvídám užitečné informace. Nemáš náhodou sebou nějakou rudu? Řekněme 10 nugetů?

	Npc_ExchangeRoutine(self,"BUSY");

	var C_Npc Brandick; 
	Brandick = Hlp_GetNpc(GRD_261_Brandick);
	Npc_ExchangeRoutine(Brandick,"WATCH");
	AI_ContinueRoutine(Brandick); // TEST!!!
};
// ***************** ALEPH BIETET INFO *****************************

instance VLK_585_Aleph_INFO(C_INFO)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_INFO_Condition;
	information = VLK_585_Aleph_INFO_Info;
	important = 0;
	permanent = 0;
//	description = "(give 10 ore)";
//	description = "(10 Erz geben)";
	description = "(dej 10 nugetů)";
};

func int VLK_585_Aleph_INFO_Condition()
{
	if (Npc_HasItems(hero,ItMinugget)) >= 10 && (Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS)) 
	{
		return 1;
	};
};

func void VLK_585_Aleph_INFO_Info()
{
//	AI_Output(other,self,"VLK_585_Aleph_INFO_Info_15_01"); //Alright, here's 10 ore for you.
//	AI_Output(other,self,"VLK_585_Aleph_INFO_Info_15_01"); //In Ordnung, hier sind 10 Erz für dich.
	AI_Output(other,self,"VLK_585_Aleph_INFO_Info_15_01"); //Dobře, tady máš 10 nugetů.
//	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_02"); //Thanks. If you go to the main shaft and follow the catwalks further down, you'll soon get to two side caves.
//	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_02"); //Danke. Wenn du zurück zum Hauptschacht gehst und den Stegen weiter nach unten folgst, kommst du bald an zwei Nebenhöhlen.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_02"); //Díky. Když půjdeš do hlavní šachty a půjdeš po lávkách pořád dolu, dostaneš se za chvíli do dvojité jeskyně.
//	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_03"); //There's a guard in the second one, and there's also an old masher.
//	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_03"); //In der zweiten Höhle steht eine Wache. Da steht auch ein alter Stampfer.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_03"); //V té druhé je stráž a také tam stojí stará drtička.
//	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_04"); //There's a healing potion lying about somewhere, but be careful and beware of the crawlers!
//	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_04"); //Dort liegt noch irgendwo ein Heiltrank, aber sei vorsichtig und nimm dich vor den Crawlern in Acht!
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_04"); //Povalují se tam hojivé lektvary, ale měj se na pozoru před červy!
//	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_05"); //And if you need or hear something, come back to me, I'm sure I'll be able to help....
//	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_05"); //Und wenn du mal wieder was brauchst oder hörst, dann komm ruhig zu mir, ich kann dir bestimmt weiterhelfen ...
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_05"); //A kdybys něco potřeboval, nebo něco slyšel, vrať se zpátky ke mně, určitě ti budu schopen pomoci...

	B_GiveInvItems(hero,other,ItMiNugget,10);
};
// ***************** WIRD ALEPH ANGESCHWÄRZT IST ER SAUER*****************************
instance VLK_585_Aleph_ANGRY(C_INFO)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_ANGRY_Condition;
	information = VLK_585_Aleph_ANGRY_Info;
	important = 1;
	permanent = 0;
}; 

func int VLK_585_Aleph_ANGRY_Condition()
{
	if (Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH))
	{
		return 1;
	};
};

func void VLK_585_Aleph_ANGRY_Info()
{

//	AI_Output(self,other,"VLK_585_Aleph_ANGRY_Info_05_01"); //You ran me down with Brandick? Get lost!
//	AI_Output(self,other,"VLK_585_Aleph_ANGRY_Info_05_01"); //Du hast mich bei Brandick angeschwärzt? Mach, dass du wegkommst!
	AI_Output(self,other,"VLK_585_Aleph_ANGRY_Info_05_01"); //Tys mě podvedl s Brandickem? Ztrať se!

	AI_StopProcessInfos(self);
	Npc_SetTempAttitude(self,ATT_ANGRY);
};
//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_KEY(C_INFO)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_KEY_Condition;
	information = VLK_585_Aleph_KEY_Info;
	important = 0;
	permanent = 0;
//	description     = "Have you got any other useful information?";
//	description     = "Hast du noch ein paar nützliche Informationen?";
	description     = "Máš ještě nějaké užitečné informace?";
};
func int VLK_585_Aleph_KEY_Condition()
{
	if ! (Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH)) && (Npc_KnowsInfo(hero,VLK_585_Aleph_INFO))
	{
		return 1;
	};
};

func void VLK_585_Aleph_KEY_Info()
{
//	AI_Output(other,self,"VLK_585_Aleph_KEY_Info_15_01"); //Have you got any other useful information?
//	AI_Output(other,self,"VLK_585_Aleph_KEY_Info_15_01"); //Hast du noch ein paar nützliche Informationen?
	AI_Output(other,self,"VLK_585_Aleph_KEY_Info_15_01"); //Máš ještě nějaké užitečné informace?
//	AI_Output(self,other,"VLK_585_Aleph_KEY_Info_05_02"); //Sure, have you got 10 ore?
//	AI_Output(self,other,"VLK_585_Aleph_KEY_Info_05_02"); //Na klar, hast du noch 10 Erz?
	AI_Output(self,other,"VLK_585_Aleph_KEY_Info_05_02"); //Jistě, máš 10 nugetů?
};

//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_GLEN(C_INFO)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_GLEN_Condition;
	information = VLK_585_Aleph_GLEN_Info;
	important = 0;
	permanent = 0;
//	description     = "(give 10 ore)";
//	description     = "(10 Erz geben)";
	description     = "(dej 10 nugetů)";
};
func int VLK_585_Aleph_GLEN_Condition()
{
	if (Npc_HasItems(hero,ItMinugget)) >= 10 && (Npc_KnowsInfo(hero,VLK_585_Aleph_KEY))
	{
		return 1;
	};
};

func void VLK_585_Aleph_GLEN_Info()
{

//	AI_Output(other,self,"VLK_585_Aleph_GLEN_Info_15_01"); //I expect good information for my ore!
//	AI_Output(other,self,"VLK_585_Aleph_GLEN_Info_15_01"); //Für mein Erz erwarte ich auch eine gute Information!
	AI_Output(other,self,"VLK_585_Aleph_GLEN_Info_15_01"); //Za tuhle rudu očekávám dobré informace!
//	AI_Output(self,other,"VLK_585_Aleph_GLEN_Info_05_02"); //There's loads of locked chests here. Glen, the digger at the top, can get you a couple of lockpicks.
//	AI_Output(self,other,"VLK_585_Aleph_GLEN_Info_05_02"); //Hier gibt's eine Menge verschlossener Truhen. Glen, der Buddler, der ganz oben steht, kann dir ein paar Dietriche besorgen.
	AI_Output(self,other,"VLK_585_Aleph_GLEN_Info_05_02"); //Je tu hromada zamčených truhel. Glen, vrchní kopáč, ti může dát pár paklíčů.

	B_GiveInvItems(hero,self,ItMinugget,10); 
};
//***************** LAGERSCHUPPENSCHLÜSSEL*****************************
func void B_Aleph_StorageShedKey()
{
//	B_LogEntry(CH2_StorageShed,"Aleph sold me the key to the chests in the store shed!");
//	B_LogEntry(CH2_StorageShed,"Aleph hat mir den Schlüssel für die Truhen im Lagerschuppen verkauft!");
	B_LogEntry(CH2_StorageShed,"Aleph mi prodal klíč od truhlic ve skladu!");
};

instance VLK_585_Aleph_SCHUPPEN(C_INFO)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_SCHUPPEN_Condition;
	information = VLK_585_Aleph_SCHUPPEN_Info;
	important = 0;
	permanent = 0;
//	description     = "Do you know anything about the key to the chests in the storage shed??";
//	description     = "Weißt du was über den Schlüssel für die Truhen im Lagerschuppen?";
	description     = "Víš něco o klíči od těch truhel ve skladové jeskyni?";
};
func int VLK_585_Aleph_SCHUPPEN_Condition()
{
	if (Npc_KnowsInfo(hero,GRD_271_ULBERT_DRUNK)) && ( !Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH))
	{
		return 1;
	};
};

func void VLK_585_Aleph_SCHUPPEN_Info()
{

//	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01"); //Do you know anything about the key for the chests in the storage shed??
//	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01"); //Weißt du was über den Schlüssel für die Truhen im Lagerschuppen?
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01"); //Víš něco o klíči od těch truhel ve skladové jeskyni?
//	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02"); //Well, that depends...
//	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02"); //Nun, das kommt ganz darauf an ...
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02"); //Jistě, to záleží na...
//	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03"); //On how much ore I'll give you?
//	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03"); //Darauf, wieviel Erz ich dir gebe?
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03"); //Tak kolik nugetů ti mám dát?
//	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04"); //You learn fast.
//	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04"); //Du lernst schnell.
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04"); //Učíš se rychle.

	Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);

//	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"DIALOG_BACK 	   ",VLK_585_Aleph_SCHUPPEN_Back);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,DIALOG_BACK    ,VLK_585_Aleph_SCHUPPEN_Back);
//	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"Pay 50 ore.",VLK_585_Aleph_SCHUPPEN_50);
//	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"50 Erz zahlen",VLK_585_Aleph_SCHUPPEN_50);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"Zaplať 50 nugetů.",VLK_585_Aleph_SCHUPPEN_50);
//	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"Pay 30 ore.",VLK_585_Aleph_SCHUPPEN_30);
//	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"30 Erz zahlen",VLK_585_Aleph_SCHUPPEN_30);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"Zaplať 30 nugetů.",VLK_585_Aleph_SCHUPPEN_30);
//	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"Pay 15 ore.",VLK_585_Aleph_SCHUPPEN_15);
//	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"15 Erz zahlen",VLK_585_Aleph_SCHUPPEN_15);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"Zaplať 15 nugetů.",VLK_585_Aleph_SCHUPPEN_15);
};

func void VLK_585_Aleph_SCHUPPEN_50()
{

	if (Npc_HasItems(hero,ItMiNugget) >= 50)
	{ 
//		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01"); //50 ore should be more than enough for you!
//		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01"); //50 Erz sind mehr als genug für dich!
		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01"); //50 nugetů by ti mělo víc než stačit!
//		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02"); //Very generous! Here's the key. And take this ring as well. It's always brought good luck to me.
//		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02"); //Überaus großzügig. Hier ist der Schlüssel. Und nimm auch diesen Ring. Mir hat er immer Glück gebracht.
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02"); //Jak šlechetné! Tady je klíč. A ten prsten si vezmi taky. Mně vždycky přináší štěstí.

		CreateInvItems(self,ItKe_OM_03,1); // nur für die korrekte Textausgaben!!!
		B_GiveInvItems(self,hero,ItKe_OM_03, 2);
		Npc_RemoveInvItem(hero,ItKe_OM_03);

		Npc_RemoveInvItem(self,Staerkering);
		CreateInvItem(hero,Staerkering);

		B_GiveInvItems(hero,self,ItMinugget,50);  

		Npc_SetPermAttitude(self,ATT_FRIENDLY); 
		Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
//		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03"); //You don't have that much ore!
//		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03"); //So viel Erz hast du nicht!
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03"); //Tolik rudy nemáš!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	};
};

func void VLK_585_Aleph_SCHUPPEN_30()
{

	if (Npc_HasItems(hero,ItMiNugget) >= 30)
	{ 
		CreateInvItem(self,ItKe_OM_03);
		B_GiveInvItems(self,other,ItKe_OM_03,1);
		B_GiveInvItems(hero,self,ItMinugget,30);  
		Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);
//		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01"); //30 ore should be enough.
//		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01"); //30 Erz sollten reichen.
		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01"); //30 nugetů by mělo stačit.
//		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02"); //Alright, I happen to have the key here.
//		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02"); //Nun gut, zufällig habe ich hier einen Schlüssel.
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02"); //Dobře, náhodou mám ten klíč sebou.
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
//		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03"); //You don't have that much ore.
//		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03"); //So viel Erz hast du nicht!
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03"); //Tolik rudy nemáš!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	}; 
}; 
func void VLK_585_Aleph_SCHUPPEN_15()
{
//	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01"); //Is 15 ore alright with you?
//	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01"); //Bist du mit 15 Erz einverstanden?
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01"); //Bude ti 15 nugetů stačit?
//	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02"); //15 ore? I don't know anything about a key!
//	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02"); //15 Erz? Ich weiß nichts von einem Schlüssel!
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02"); //15 nugetů? Já o žádném klíči nic nevím!
	VLK_585_Aleph_SCHUPPEN.permanent = 0;
}; 
func void VLK_585_Aleph_SCHUPPEN_Back()
{
	Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);
	VLK_585_Aleph_SCHUPPEN.permanent = 1;
};

// WENN DER SPIELER ALEPH BEI BRANDICK ANGESCHWÄRZT HAT
instance VLK_585_Aleph_DIRTY(C_INFO)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_DIRTY_Condition;
	information = VLK_585_Aleph_DIRTY_Info;
	important = 0;
	permanent = 0;
//	description = "Do you know anything about the key for the chests in the storage shed??"; 
//	description = "Weißt du was über den Schlüssel für die Truhen im Lagerschuppen?"; 
	description = "Víš něco o klíči od těch truhel ve skladové jeskyni?"; 
};

func int VLK_585_Aleph_DIRTY_Condition()
{
	if (Npc_KnowsInfo(hero,GRD_271_ULBERT_DRUNK)) && (Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH))
	{
		return 1;
	};
};

func void VLK_585_Aleph_DIRTY_Info()
{
//	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_01"); //Do you know anything about the key to the chests in the storage shed?
//	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_01"); //Weißt du was über den Schlüssel für die Truhen im Lagerschuppen?
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_01"); //Víš něco o klíči od těch truhel ve skladové jeskyni?
//	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_02"); //Well, that depends...
//	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_02"); //Nun, das kommt ganz darauf an ...
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_02"); //Jistě, to záleží na...
//	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_03"); //On how much ore I'll give you?
//	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_03"); //Darauf, wieviel Erz ich dir gebe?
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_03"); //Tak kolik nugetů ti mám dát?
//	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_04"); //You learn quickly. I want 100 ore.
//	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_04"); //Du lernst schnell. Ich will 100 Erz.
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_04"); //Učíš se rychle. Chci 100 nugetů.

	Info_ClearChoices(VLK_585_Aleph_DIRTY);

//	Info_AddChoice(VLK_585_Aleph_DIRTY,"(Pay 100 ore)",VLK_585_Aleph_DIRTY_100);
//	Info_AddChoice(VLK_585_Aleph_DIRTY,"(100 Erz zahlen)",VLK_585_Aleph_DIRTY_100);
	Info_AddChoice(VLK_585_Aleph_DIRTY,"(zaplať 100 nugetů)",VLK_585_Aleph_DIRTY_100);
//	Info_AddChoice(VLK_585_Aleph_DIRTY,"(Don't pay)",VLK_585_Aleph_DIRTY_NO);
//	Info_AddChoice(VLK_585_Aleph_DIRTY,"(Nicht zahlen)",VLK_585_Aleph_DIRTY_NO);
	Info_AddChoice(VLK_585_Aleph_DIRTY,"(neplať)",VLK_585_Aleph_DIRTY_NO);
};  
func void VLK_585_Aleph_DIRTY_100()
{
	if Npc_HasItems(hero,ItMinugget)>=100
	{ 
//		AI_Output(other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01"); //Alright, you crook. Here are 100 ore.
//		AI_Output(other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01"); //Na gut, du Halsabschneider. Hier sind deine 100 Erz.
		AI_Output(other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01"); //Dobrá, ty podvodníku. Tady je 100 nugetů.
//		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02"); //You shouldn't have grassed me up. Here's the key.
//		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02"); //Du hättest mich halt nicht verpfeifen sollen. Hier ist der Schlüssel.
		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02"); //Neměl bys mě dráždit. Tady je ten klíč.
		B_GiveInvItems(hero,self,ItMinugget,100);
		CreateInvItem(self,ItKe_OM_03);
		B_GiveInvItems(self,other,ItKe_OM_03,1);
		Info_ClearChoices(VLK_585_Aleph_DIRTY);
		VLK_585_Aleph_DIRTY.permanent = 0; 
		B_Aleph_StorageShedKey();
	}
	else
	{
//		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03"); //Do you think I'm stupid or what? 100 ore, and not a nugget less!
//		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03"); //Für wie blöd hältst du mich eigentlich? 100 Erz, nicht einen Brocken weniger!
		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03"); //Myslíš, že jsem tak stupidní nebo co? 100 nugetů a ani o jeden míň!
		VLK_585_Aleph_DIRTY.permanent = 1;
	};
};
func void VLK_585_Aleph_DIRTY_NO()
{
//	AI_Output(other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01"); //I'm not gonna throw 100 ore at you!
//	AI_Output(other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01"); //Ich werfe dir doch keine 100 Erz in den Rachen!
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01"); //Nemůžu vyhodit 100 nugetů!
//	AI_Output(self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02"); //Hey, it's you who constantly starts talking to me!
//	AI_Output(self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02"); //Hey, immerhin bist du derjenige, der mich die ganze Zeit anquatscht!
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02"); //Hej, jsi to ty, kdo mě v jednom kuse přemlouvá!
	VLK_585_Aleph_DIRTY.permanent = 0; 
};
