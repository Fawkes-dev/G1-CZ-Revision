/*------------------------------------------------------------------------
//							EXIT //
------------------------------------------------------------------------*/

instance Nov_1371_BaalNetbek_Exit(C_INFO)
{
	npc = Nov_1371_BaalNetbek;
	nr = 999;
	condition = Nov_1371_BaalNetbek_Exit_Condition;
	information = Nov_1371_BaalNetbek_Exit_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Nov_1371_BaalNetbek_Exit_Condition()
{
	return TRUE;
};

func void Nov_1371_BaalNetbek_Exit_Info()
{
	AI_StopProcessInfos(self);
};
/*------------------------------------------------------------------------
							GÄRTNER
------------------------------------------------------------------------*/

instance Nov_1371_BaalNetbek_CRAZY(C_INFO)
{
	npc = Nov_1371_BaalNetbek;
	condition = Nov_1371_BaalNetbek_CRAZY_Condition;
	information = Nov_1371_BaalNetbek_CRAZY_Info;
	important = 0;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};

func int Nov_1371_BaalNetbek_CRAZY_Condition()
{
	return TRUE;
};

func void Nov_1371_BaalNetbek_CRAZY_Info()
{
//	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //Who are you?
//	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //Wer bist du?
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //Kdo jsi?
//	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //I'm the Guru, the Guru of the swamp. My servants call me Baal Netbek.
//	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //Ich bin der Guru, ich bin der Guru des Sumpfes. Meine Diener nennen mich Baal Netbek.
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //Jsem Guru, Guru bažin. Moji služebníci mi říkají Baal Netbek.
//	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //Servants? I don't see any servants!
//	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //Diener? Ich sehe keine Diener!
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //Služebníci? Nevidím žádné služebníky!
//	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //They're everywhere. The trees! They walk and skip and dance...
//	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //Sie sind hier überall. Die Bäume! Sie wandern und springen und tanzen...
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //Jsou všude. Stromy! Vykračujou si, skáčou a tancujou...
//	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //... Oh, I see. Well, I'll be on my way then...
//	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //...ach so, na ich geh dann mal wieder...
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //...Och, aha. Dobře, pak si půjdu svou cestou...
//	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //Wait, you can help me convert this swamp into a massive meadow of flowers!
//	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //Warte, du kannst mir helfen, diesen Sumpf in eine gigantische Blumenwiese zu verwandeln!
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //Počkej, můžeš mi pomoci změnit tyhle bažiny v obrovskou louku plnou květů!
//	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //Okay, you just get started. Me... I'll be back later.
//	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //Fang am besten schon mal damit an, ich... ich komme dann später wieder.
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //Dobře, jen musíš začít. Já... vrátím se později.
	AI_TurnAway(hero,self);
//	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //He's not going to get me anywhere...
//	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //Ich glaube, der Kerl bringt mich nicht wirklich weiter...
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //S ním se nikam nedostanu...
	AI_StopProcessInfos(self);
};
/*------------------------------------------------------------------------
							AGAIN
------------------------------------------------------------------------*/

instance Nov_1371_BaalNetbek_AGAIN(C_INFO)
{
	npc = Nov_1371_BaalNetbek;
	condition = Nov_1371_BaalNetbek_AGAIN_Condition;
	information = Nov_1371_BaalNetbek_AGAIN_Info;
	important = 0;
	permanent = 1;
//	description = "Hey, how's it going?";
//	description = "Hey, gehts dir gut?";
	description = "Jak to jde?";
};

func int Nov_1371_BaalNetbek_AGAIN_Condition()
{
	if (Npc_KnowsInfo(hero,Nov_1371_BaalNetbek_CRAZY))
	{
		return TRUE;
	};

};
func void Nov_1371_BaalNetbek_AGAIN_Info()
{
//	AI_Output(other,self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //Hey, how's it going?
//	AI_Output(other,self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //Hey, geht's dir gut?
	AI_Output(other,self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //Hej, jak to jde?
//	AI_Output(self,other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //Mind you don't hurt my trees!
//	AI_Output(self,other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //Pass auf, dass du meine Bäume nicht verletzt!
	AI_Output(self,other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //Pamatuj, neubližuj mým stromům!
};
