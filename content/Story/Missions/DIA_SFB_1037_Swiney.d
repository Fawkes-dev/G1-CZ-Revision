// ************************************************************
// 			  				   EXIT
// ************************************************************

instance Info_Swiney_EXIT(C_INFO)
{
	npc = SfB_1037_Swiney;
	nr = 999;
	condition = Info_Swiney_EXIT_Condition;
	information = Info_Swiney_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Swiney_EXIT_Condition()
{
	return 1;
};

func void Info_Swiney_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

instance Info_Swiney_Hello(C_INFO)
{
	npc = SfB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_Hello_Condition;
	information = Info_Swiney_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};

func int Info_Swiney_Hello_Condition()
{
	return 1;
};

func void Info_Swiney_Hello_Info()
{
//	AI_Output(other,self,"Info_Swiney_Hello_15_00"); //Who are you?
//	AI_Output(other,self,"Info_Swiney_Hello_15_00"); //Wer bist du?
	AI_Output(other, self, "Info_Swiney_Hello_15_00"); //Kdo jsi?
//	AI_Output(self,other,"Info_Swiney_Hello_09_01"); //I'm the best mining engineer this damn colony has ever seen, my boy.
//	AI_Output(self,other,"Info_Swiney_Hello_09_01"); //Ich bin der beste Bergbauer, den diese verdammte Kolonie jemals gesehen hat, mein Junge.
	AI_Output(self, other, "Info_Swiney_Hello_09_01"); //Jsem ten nejlepší důlní inženýr, kterého kdy tahle zpropadená Kolonie spatřila, mladíku.
//	AI_Output(self,other,"Info_Swiney_Hello_09_02"); //I make sure half our boys don't go getting themselves killed by falling rocks, just because they're too stupid to scrape the right places.
//	AI_Output(self,other,"Info_Swiney_Hello_09_02"); //Ich passe auf, dass nicht die Hälfte unserer Jungs von Steinen erschlagen werden, weil sie zu dumm sind, an der richtigen Stelle zu schürfen.
	AI_Output(self, other, "Info_Swiney_Hello_09_02"); //Zajišťuji, aby polovinu našich chlapců nezabily padající kameny, jen proto, že byli příliš hloupí, aby kopali na správném místě.
};

// ************************************************************
// 						Schürfer
// ************************************************************

instance Info_Swiney_Schuerfer(C_INFO)
{
	npc = SfB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_Schuerfer_Condition;
	information = Info_Swiney_Schuerfer_Info;
	important = 0;
	permanent = 0;
//	description = "I'd like to join you as a scraper!";
//	description = "Ich will bei euch als Schürfer mitmachen!";
	description = "Chtěl bych se k vám přidat jako rudař!";
};

func int Info_Swiney_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Swiney_Hello))
	{
		return 1;
	};

	return 0;
};

func void Info_Swiney_Schuerfer_Info()
{
//	AI_Output(other,self,"Info_Swiney_Schuerfer_15_00"); //I'd like to join you as a scraper!
//	AI_Output(other,self,"Info_Swiney_Schuerfer_15_00"); //Ich will bei euch als Schürfer mitmachen!
	AI_Output(other, self, "Info_Swiney_Schuerfer_15_00"); //Chtěl bych se k vám přidat jako rudař!
//	AI_Output(self,other,"Info_Swiney_Schuerfer_09_01"); //Oh yeah? Well, just don't think you're going to get anything much out of it. There's three portions of rice a day, any extra you'll have to see to yourself.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_09_01"); //So? Denk bloß nicht, du kannst hier viel erwarten. Jeden Tag gibt's 3 Portionen Reis und für den Rest musst du selber sorgen.
	AI_Output(self, other, "Info_Swiney_Schuerfer_09_01"); //Tak? Ale nemysli si, že tu získáš něco zvláštního. Každý den to dělá tři porce rýže a o zbytek už se musíš postarat sám.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_09_02"); //D'you know why we're doin' this? We're doin' this job so one day we can all walk out of here to freedom.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_09_02"); //Du weißt, warum wir das hier machen? Wir machen die Arbeit, damit alle hier eines Tages wieder rausspazieren können.
	AI_Output(self, other, "Info_Swiney_Schuerfer_09_02"); //Víš, proč to děláme? Děláme to proto, abysme odtud jednoho dne mohli odejít za svobodou.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_09_03"); //That means all the ore's to be handed in, then it goes on the big ore mound. And once a month everybody who's been working here gets 50 ore to get stoned on.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_09_03"); //Das heißt, alles Erz wird abgegeben und kommt auf den großen Haufen. Und einmal im Monat kriegt jeder, der hier hart gearbeitet hat, 50 Brocken Erz zum Versaufen.
	AI_Output(self, other, "Info_Swiney_Schuerfer_09_03"); //To znamená, že všechna ruda, která se tu vytěží, putuje na velkou rudnou haldu. A jednou za měsíc dostane každý, kdo tu tvrdě pracoval, 50 nugetů, aby se mohl zpít do němoty.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_09_04"); //That's the most important things you ought to know.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_09_04"); //Das waren auch schon die wichtigsten Sachen, die du wissen musst.
	AI_Output(self, other, "Info_Swiney_Schuerfer_09_04"); //To byly ty nejdůležitější věci, které bys měl znát.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_09_05"); //Do you at least have any experience on the job?
//	AI_Output(self,other,"Info_Swiney_Schuerfer_09_05"); //Kennst du dich wenigstens mit der Arbeit aus?
	AI_Output(self, other, "Info_Swiney_Schuerfer_09_05"); //Máš s touhle prací alespoň nějaké zkušenosti?

	Info_ClearChoices(Info_Swiney_Schuerfer);
//	Info_AddChoice(Info_Swiney_Schuerfer,"No.",Info_Swiney_Schuerfer_Nein);
//	Info_AddChoice(Info_Swiney_Schuerfer,"Nein.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice(Info_Swiney_Schuerfer, "Ne.", Info_Swiney_Schuerfer_Nein);
//	Info_AddChoice(Info_Swiney_Schuerfer,"Yes.",Info_Swiney_Schuerfer_Ja);
//	Info_AddChoice(Info_Swiney_Schuerfer,"Ja.",Info_Swiney_Schuerfer_Ja);
	Info_AddChoice(Info_Swiney_Schuerfer, "Ano.", Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
//	AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00"); //Yes.
//	AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00"); //Ja.
	AI_Output(other, self, "Info_Swiney_Schuerfer_Ja_15_00"); //Ano.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_Ja_09_01"); //Good! Then you know what to watch out for. Here's your protective clothin'. You'll have to find your own pickaxe. Enjoy yourself.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_Ja_09_01"); //Gut! Dann weißt du ja, worauf du zu achten hast. Hier ist Schutzkleidung. 'Ne Spitzhacke musst du dir suchen. Viel Spaß.
	AI_Output(self, other, "Info_Swiney_Schuerfer_Ja_09_01"); //Dobrá! Pak víš, na co tu dávat pozor. Tady máš ochranný oděv. Krumpáč si musíš obstarat sám. Příjemnou zábavu!
	CreateInvItem(self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);

	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
//	AI_Output(other,self,"Info_Swiney_Schuerfer_Nein_15_00"); //No.
//	AI_Output(other,self,"Info_Swiney_Schuerfer_Nein_15_00"); //Nein.
	AI_Output(other, self, "Info_Swiney_Schuerfer_Nein_15_00"); //Ne.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_01"); //Of course you don't! Why's it always me? Okay. Listen carefully. You take this stuff and put it on - here.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_01"); //Natürlich nicht! Warum immer ich? Gut. Pass auf. Du nimmst jetzt diese Klamotten und ziehst sie dir an - hier.
	AI_Output(self, other, "Info_Swiney_Schuerfer_Nein_09_01"); //Samozřejmě, že ne! Proč pořád já? Dobře, poslouchej pozorně. Vezmeš si tyhle hadry a oblékneš si je - tady.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_02"); //if an ore nugget falls on your foot while you're not wearing your protective clothing, you'll be crippled for life and only worth half of what you were before to us.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_02"); //Wenn dir ein Erzbrocken auf den Fuß fällt und du keine Schutzkleidung trägst, bist du ein Krüppel und nur noch die Hälfte für uns wert.
	AI_Output(self, other, "Info_Swiney_Schuerfer_Nein_09_02"); //Když ti spadne magický nuget na nohu a ty přitom nebudeš na sobě mít ochranný oděv, budeš na doživotí mrzák a budeš pro nás mít jen poloviční hodnotu.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_03"); //There'll be a pickaxe lying somewhere around here.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_03"); //Ne Spitzhacke liegt hier bestimmt irgendwo noch rum.
	AI_Output(self, other, "Info_Swiney_Schuerfer_Nein_09_03"); //Určitě se tu někde bude povalovat krumpáč.
//	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_04"); //But you won't be able to do much with it - well - so what...
//	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_04"); //Aber viel anfangen kannst du damit sowieso nicht - na ja - was soll's ...
	AI_Output(self, other, "Info_Swiney_Schuerfer_Nein_09_04"); //Ale moc s tím tak jako tak nenaděláš - no jo - co se dá dělat...

	CreateInvItem(self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);

	Info_ClearChoices(Info_Swiney_Schuerfer);
};

// ************************************************************
// 							PERM
// ************************************************************

instance Info_Swiney_PERM(C_INFO)
{
	npc = SfB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_PERM_Condition;
	information = Info_Swiney_PERM_Info;
	important = 0;
	permanent = 1;
//	description = "How much ore have you collected so far?";
//	description = "Wieviel Erz habt ihr schon gesammelt?";
	description = "Kolik rudy jste už nahromadili?";
};

func int Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Swiney_Schuerfer))
	{
		return 1;
	};

	return 0;
};

func void Info_Swiney_PERM_Info()
{
//	AI_Output(other,self,"Info_Swiney_PERM_15_00"); //How much ore have you collected so far?
//	AI_Output(other,self,"Info_Swiney_PERM_15_00"); //Wie viel Erz habt ihr schon gesammelt?
	AI_Output(other, self, "Info_Swiney_PERM_15_00"); //Kolik rudy jste už nahromadili?
//	AI_Output(self,other,"Info_Swiney_PERM_09_01"); //The mages say that we won't need much more. Go to the New Camp and have a look at the mound.
//	AI_Output(self,other,"Info_Swiney_PERM_09_01"); //Die Magier sagen, viel brauchen wir nicht mehr. Geh ins Neue Lager und sieh dir den Haufen an.
	AI_Output(self, other, "Info_Swiney_PERM_09_01"); //Mágové říkají, že už jí tolik nepotřebujeme. Jdi do Nového tábora a prohlédni si haldu.
	AI_StopProcessInfos(self);
};
