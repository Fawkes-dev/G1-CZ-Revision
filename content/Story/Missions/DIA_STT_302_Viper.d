// ************************ EXIT **************************

instance Stt_302_Viper_Exit(C_INFO)
{
	npc = Stt_302_Viper;
	nr = 999;
	condition = Stt_302_Viper_Exit_Condition;
	information = Stt_302_Viper_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Stt_302_Viper_Exit_Condition()
{
	return 1;
};

func void Stt_302_Viper_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ***************************** INFOS ****************************************//

instance Stt_302_Viper_GREET(C_INFO)
{
	npc = Stt_302_Viper;
	condition = Stt_302_Viper_GREET_Condition;
	information = Stt_302_Viper_GREET_Info;
	important = 0;
	permanent = 0;
//	description = "I hear you're the smelter.";
//	description = "Ich habe gehört, du bist der Schmelzer";
	description = "Slyšel jsem, že jsi tavič.";
};

func int Stt_302_Viper_GREET_Condition()
{
	return 1;
};

func void Stt_302_Viper_GREET_Info()
{
//	AI_Output(other,self,"Stt_302_Viper_GREET_Info_15_01"); //I hear you're the smelter.
//	AI_Output(other,self,"Stt_302_Viper_GREET_Info_15_01"); //Ich habe gehört, du bist der Schmelzer.
	AI_Output(other, self, "Stt_302_Viper_GREET_Info_15_01"); //Slyšel jsem, že jsi tavič.
//	AI_Output(self,other,"Stt_302_Viper_GREET_Info_11_02"); //You're a smart boy indeed.
//	AI_Output(self,other,"Stt_302_Viper_GREET_Info_11_02"); //Du bist ja ein ganz schlauer Bursche.
	AI_Output(self, other, "Stt_302_Viper_GREET_Info_11_02"); //Ty jsi ale chytrý mladík.
};

// ***************************** SCHMELZGESCHICHTE ****************************************//

instance Stt_302_Viper_MELT(C_INFO)
{
	npc = Stt_302_Viper;
	condition = Stt_302_Viper_MELT_Condition;
	information = Stt_302_Viper_MELT_Info;
	important = 0;
	permanent = 0;
//	description = "I hear you only melt down part of the ore.";
//	description = "Ich habe gehört, ihr schmelzt nur einen Teil des Erzes ein";
	description = "Slyšel jsem, že tavíš jenom malou část rudy.";
};

func int Stt_302_Viper_MELT_Condition()
{
	if ((Npc_KnowsInfo(hero, Stt_302_Viper_GREET))
	&& (Npc_KnowsInfo(hero, Grd_260_Drake_Mine_Mehr)))
	{
		return 1;
	};

	return 0;
};

func void Stt_302_Viper_MELT_Info()
{
//	AI_Output(other,self,"Stt_302_Viper_MELT_Info_15_01"); //I hear you only melt down part of the ore.
//	AI_Output(other,self,"Stt_302_Viper_MELT_Info_15_01"); //Ich habe gehört, ihr schmelzt nur einen Teil des Erzes ein.
	AI_Output(other, self, "Stt_302_Viper_MELT_Info_15_01"); //Slyšel jsem, že tavíš jenom malou část rudy.
//	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_02"); //Some time ago we used to melt the lot down. But Gomez and the mages were none too happy about that.
//	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_02"); //Früher haben wir alles Erz eingeschmolzen. Aber damit waren Gomez und die Magier nicht einverstanden.
	AI_Output(self, other, "Stt_302_Viper_MELT_Info_11_02"); //Dříve jsme tavili úplně všechno. Ale Gomez a jeho mágové s tím nesouhlasili.
//	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_03"); //They hung around here for weeks to examine the ore and everything else.
//	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_03"); //Wochenlang haben sie sich hier rumgetrieben und haben das Erz und alles andere untersucht.
	AI_Output(self, other, "Stt_302_Viper_MELT_Info_11_03"); //Celé týdny se tady potloukali a zkoumali rudu a všechny věci okolo.
//	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_04"); //They fiddled about and stuck their noble noses in things they didn't have a clue about.
//	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_04"); //Sie haben hier rumgeschnüffelt und ihre feinen Nasen in Sachen gesteckt, von denen sie keine Ahnung haben.
	AI_Output(self, other, "Stt_302_Viper_MELT_Info_11_04"); //Slídili tady kolem a strkali své nóbl nosy do věcí, kterým vůbec nerozumí.
//	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_05"); //Finally we only smelted a part of the ore. The mages never came back here.
//	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_05"); //Das Ende vom Lied war, dass wir nur noch einen Teil des Erzes einschmelzen. Die Magier sind nicht mehr hier runter gekommen.
	AI_Output(self, other, "Stt_302_Viper_MELT_Info_11_05"); //Nakonec jsme přetavili jenom část rudy. Mágové už sem nikdy znovu nepřišli.
};

// ***************************** ****************************************//

instance Stt_302_Viper_BUY(C_INFO)
{
	npc = Stt_302_Viper;
	condition = Stt_302_Viper_BUY_Condition;
	information = Stt_302_Viper_BUY_Info;
	important = 0;
	permanent = 1;
	trade = 1;
//	description = "Can you give me ore?";
//	description = "Kannst du mir Erz geben?";
	description = "Můžeš mi dát rudu?";
};

func int Stt_302_Viper_BUY_Condition()
{
	if (Npc_KnowsInfo(hero, Stt_302_Viper_GREET))
	{
		return 1;
	};

	return 0;
};

func void Stt_302_Viper_BUY_Info()
{
//	AI_Output(other,self,"Stt_302_Viper_BUY_Info_15_01"); //Can you give me ore?
//	AI_Output(other,self,"Stt_302_Viper_BUY_Info_15_01"); //Kannst du mir Erz geben?
	AI_Output(other, self, "Stt_302_Viper_BUY_Info_15_01"); //Můžeš mi dát rudu?
//	AI_Output(self,other,"Stt_302_Viper_BUY_Info_11_02"); //if you can give me any goods.
//	AI_Output(self,other,"Stt_302_Viper_BUY_Info_11_02"); //Wenn du mir Waren geben kannst.
	AI_Output(self, other, "Stt_302_Viper_BUY_Info_11_02"); //Pokud mi můžeš dát nějaké zboží.
};
