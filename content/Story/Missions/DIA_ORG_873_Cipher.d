/*------------------------------------------------------------------------
//							EXIT //
------------------------------------------------------------------------ */

instance Org_873_Cipher_Exit(C_INFO)
{
	npc = Org_873_Cipher;
	nr = 999;
	condition = Org_873_Cipher_Exit_Condition;
	information = Org_873_Cipher_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Org_873_Cipher_Exit_Condition()
{
	return 1;
};

func void Org_873_Cipher_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ******************************
// 			Hallo
// ******************************

instance Org_873_Cipher_Hello(C_INFO)
{
	npc = Org_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Hello_Condition;
	information = Org_873_Cipher_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "How's things?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Org_873_Cipher_Hello_Condition()
{
	if (Balor_TellsNCDealer == TRUE)
	{
		return 1;
	};

	return 0;
};

func void Org_873_Cipher_Hello_Info()
{
//	AI_Output(other,self,"DIA_Cipher_Hello_15_00"); //How's things?
//	AI_Output(other,self,"DIA_Cipher_Hello_15_00"); //Wie sieht's aus?
	AI_Output(other, self, "DIA_Cipher_Hello_15_00"); //Jak to vypadá?
//	AI_Output(self,other,"DIA_Cipher_Hello_12_01"); //We put another spoke in Gomez' wheel.
//	AI_Output(self,other,"DIA_Cipher_Hello_12_01"); //Wir haben Gomez mal wieder ins Essen gespuckt.
	AI_Output(self, other, "DIA_Cipher_Hello_12_01"); //Vsadili jsme další příčel do Gomezova kola.
//	AI_Output(self,other,"DIA_Cipher_Hello_12_02"); //Three dead guards and lots of stuff to sell. I'll drink to that!
//	AI_Output(self,other,"DIA_Cipher_Hello_12_02"); //Drei tote Gardisten und 'ne ganze Menge Zeug zum Verhökern. Darauf trink ich!
	AI_Output(self, other, "DIA_Cipher_Hello_12_02"); //Tři mrtví strážci a spousta zboží na prodej. Připíjím na to!
//	AI_Output(other,self,"DIA_Cipher_Hello_15_03"); //You're one of the guys who keep raiding the Old Camp?
//	AI_Output(other,self,"DIA_Cipher_Hello_15_03"); //Du bist einer von den Jungs, die ständig das alte Lager überfallen?
	AI_Output(other, self, "DIA_Cipher_Hello_15_03"); //Ty patříš k těm chlapům, co neustále napadali Starý tábor?
//	AI_Output(self,other,"DIA_Cipher_Hello_12_04"); //No. Only when it's worth it.
//	AI_Output(self,other,"DIA_Cipher_Hello_12_04"); //Nein. Nur wenn sich 'ne lohnende Gelegenheit bietet.
	AI_Output(self, other, "DIA_Cipher_Hello_12_04"); //Ne. Jen když to stojí za to.
};

// ******************************
// 			Fisk
// ******************************

instance Org_873_Cipher_Fisk(C_INFO)
{
	npc = Org_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Fisk_Condition;
	information = Org_873_Cipher_Fisk_Info;
	important = 0;
	permanent = 1;
//	description = "Fisk from the Old Camp is looking for a trade partner.";
//	description = "Fisk aus dem Alten sucht nach einem Handelspartner.";
	description = "Fisk ze Starého tábora hledá obchodního partnera.";
};

func int Org_873_Cipher_Fisk_Condition()
{
	if (Fisk_GetNewHehler == LOG_RUNNING)
	{
		return 1;
	};
};

func void Org_873_Cipher_Fisk_Info()
{
//	AI_Output(other,self,"DIA_Cipher_Fisk_15_00"); //Fisk from the Old Camp is looking for a trade partner.
//	AI_Output(other,self,"DIA_Cipher_Fisk_15_00"); //Fisk aus dem Alten Lager ist auf der Suche nach einem Handelspartner.
	AI_Output(other, self, "DIA_Cipher_Fisk_15_00"); //Fisk ze Starého tábora hledá obchodního partnera.
//	AI_Output(self,other,"DIA_Cipher_Fisk_12_01"); //I'm not interested.
//	AI_Output(self,other,"DIA_Cipher_Fisk_12_01"); //Kein Interesse.
	AI_Output(self, other, "DIA_Cipher_Fisk_12_01"); //Nemám zájem.
//	AI_Output(self,other,"DIA_Cipher_Fisk_12_02"); //But Sharky might be interested. if you find him, ask him.
//	AI_Output(self,other,"DIA_Cipher_Fisk_12_02"); //Aber Sharky könnte sich dafür interessieren. Wenn du ihn findest, frag ihn.
	AI_Output(self, other, "DIA_Cipher_Fisk_12_02"); //Ale Sharky by mohl mít zájem. Jestli ho uvidíš, řekni mu.
};

// ******************************
// 			Balor sent Me
// ******************************
var int Cipher_Trade;
// ******************************

instance Org_873_Cipher_FromBalor(C_INFO)
{
	npc = Org_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_FromBalor_Condition;
	information = Org_873_Cipher_FromBalor_Info;
	important = 0;
	permanent = 1;
//	description = "What have you got to offer?";
//	description = "Was hast du anzubieten?";
	description = "Co můžeš nabídnout?";
};

func int Org_873_Cipher_FromBalor_Condition()
{
	if (Npc_KnowsInfo(hero, Org_873_Cipher_Hello))
	{
		return 1;
	};

	return 0;
};

func void Org_873_Cipher_FromBalor_Info()
{
//	AI_Output(other,self,"DIA_Cipher_FromBalor_15_00"); //What have you got to offer?
//	AI_Output(other,self,"DIA_Cipher_FromBalor_15_00"); //Was hast du anzubieten?
	AI_Output(other, self, "DIA_Cipher_FromBalor_15_00"); //Co můžeš nabídnout?
//	AI_Output(self,other,"DIA_Cipher_FromBalor_12_01"); //Let's rephrase that question: What have YOU got to offer? I'm only interested in big consignments.
//	AI_Output(self,other,"DIA_Cipher_FromBalor_12_01"); //Die Frage ist doch, was hast DU anzubieten. Ich bin nur an größeren Lieferungen interessiert.
	AI_Output(self, other, "DIA_Cipher_FromBalor_12_01"); //Opakuji otázku: co MŮŽEŠ nabídnout? Zajímají mě jen velké dodávky.
	if (Balor_TellsNCDealer == TRUE)
	{
//		AI_Output(other,self,"DIA_Cipher_FromBalor_15_02"); //Balor said you'd be interested in swampweed.
//		AI_Output(other,self,"DIA_Cipher_FromBalor_15_02"); //Balor sagt, du hättest Interesse an etwas Sumpfkraut.
		AI_Output(other, self, "DIA_Cipher_FromBalor_15_02"); //Balor říkal, že by tě zajímala droga z bažin.
//		AI_Output(self,other,"DIA_Cipher_FromBalor_12_03"); //Mhmmm. You want to trade?
//		AI_Output(self,other,"DIA_Cipher_FromBalor_12_03"); //Hmmm. Du willst also handeln?
		AI_Output(self, other, "DIA_Cipher_FromBalor_12_03"); //Mhmmm. Chceš teda obchodovat?
		Cipher_Trade = TRUE;
	}
	else
	{
//		AI_Output(other,self,"DIA_Cipher_FromBalor_15_04"); //I can't help you there.
//		AI_Output(other,self,"DIA_Cipher_FromBalor_15_04"); //Damit kann ich nicht dienen.
		AI_Output(other, self, "DIA_Cipher_FromBalor_15_04"); //S tím ti nemůžu pomoci.
//		AI_Output(self,other,"DIA_Cipher_FromBalor_12_05"); //Then come back when you can help me.
//		AI_Output(self,other,"DIA_Cipher_FromBalor_12_05"); //Dann komm wieder, wenn du es kannst.
		AI_Output(self, other, "DIA_Cipher_FromBalor_12_05"); //Až mi budeš schopen pomoci, přijď zpátky.
	};
};

// ******************************
// 			TRADE
// ******************************

instance Org_873_Cipher_TRADE(C_INFO)
{
	npc = Org_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_TRADE_Condition;
	information = Org_873_Cipher_TRADE_Info;
	important = 0;
	permanent = 1;
	trade = 1;
//	description = "Let's make a deal.";
//	description = "Lass uns handeln.";
	description = "Uzavřeme obchod.";
};

func int Org_873_Cipher_TRADE_Condition()
{
	if (Cipher_Trade == TRUE)
	{
		return 1;
	};

	return 0;
};

func void Org_873_Cipher_TRADE_Info()
{
//	AI_Output(other,self,"DIA_Cipher_TRADE_15_00"); //Let's make a deal.
//	AI_Output(other,self,"DIA_Cipher_TRADE_15_00"); //Lass uns handeln.
	AI_Output(other, self, "DIA_Cipher_TRADE_15_00"); //Uzavřeme obchod.
//	AI_Output(self,other,"DIA_Cipher_TRADE_12_01"); //What do you want?
//	AI_Output(self,other,"DIA_Cipher_TRADE_12_01"); //Was willst du haben?
	AI_Output(self, other, "DIA_Cipher_TRADE_12_01"); //Co chceš?
};
