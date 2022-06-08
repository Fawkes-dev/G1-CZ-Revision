// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************

instance Info_SFB_1_EXIT(C_INFO)
{
	nr = 999;
	condition = Info_SFB_1_EXIT_Condition;
	information = Info_SFB_1_EXIT_Info;
	important = 0;
	permanent = 1;
	description = "END";
};

func int Info_SFB_1_EXIT_Condition()
{
	return 1;
};

func void Info_SFB_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

instance Info_SFB_1_EinerVonEuchWerden(C_INFO)
{
	nr = 4;
	condition = Info_SFB_1_EinerVonEuchWerden_Condition;
	information = Info_SFB_1_EinerVonEuchWerden_Info;
	important = 0;
	permanent = 1;
//	description = "How do I join the league of scrapers?";
//	description = "Wie kann ich dem Schürferbund beitreten?";
	description = "Jak se můžu přidat do spolku rudařů?";
};

func int Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_SFB_1_EinerVonEuchWerden_Info()
{
//	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //How do I join the league of scrapers?
//	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //Wie kann ich dem Schürferbund beitreten?
	AI_Output(other, self, "Info_SFB_1_EinerVonEuchWerden_15_00"); //Jak se můžu přidat do spolku rudařů?
//	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //Join us? Now don't you go thinkin' we don't work around here, just 'cause no-one forces us to.
//	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //Bei uns mitmachen? Glaub bloß nicht, hier wird nicht gearbeitet, nur weil man uns nicht zwingt.
	AI_Output(self, other, "Info_SFB_1_EinerVonEuchWerden_01_01"); //Přidat se k nám? Nemysli na to. Nepracujeme tu, pokud nás k tomu někdo nedonutí.
//	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //if you think you can just laze around here, then you got another thing coming, my friend.
//	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //Also wenn du glaubst, du kannst hier faulenzen, dann bist du schief gewickelt, mein Freund.
	AI_Output(self, other, "Info_SFB_1_EinerVonEuchWerden_01_02"); //Jestli si myslíš, že se tu můžeš jen tak poflakovat, tak uvidíš, příteli.
//	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //Now, if you still think this place is right for you, you'd better have a word with Swiney. That's the scraper that stands around smoking all day.
//	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //Wenn du jetzt immer noch glaubst hier richtig zu sein, dann rede mal mit Swiney. Er ist der Schürfer, der den ganzen Tag rumsteht und raucht.
	AI_Output(self, other, "Info_SFB_1_EinerVonEuchWerden_01_03"); //Jestli si ještě myslíš, že je tohle místo pro tebe to pravé, pak by sis měl promluvit se Swineym. To je ten rudař, co tady celý den pokuřuje.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

instance Info_SFB_1_WichtigePersonen(C_INFO)
{
	nr = 3;
	condition = Info_SFB_1_WichtigePersonen_Condition;
	information = Info_SFB_1_WichtigePersonen_Info;
	important = 0;
	permanent = 1;
//	description = "Who's in charge around here?";
//	description = "Wer hat hier das Sagen?";
	description = "Kdo tady má velení?";
};

func int Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_SFB_1_WichtigePersonen_Info()
{
//	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //Who's in charge around here?
//	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(other, self, "Info_SFB_1_WichtigePersonen_15_00"); //Kdo tady má velení?
//	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //In charge? Take a look around. It's not the ones that spend all day working their butts off to collect ore, that's for sure.
//	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //Das Sagen? Sieh dich doch mal um. Bestimmt nicht die Leute, die den ganzen Tag schuften, um genug Erz zu fördern.
	AI_Output(self, other, "Info_SFB_1_WichtigePersonen_01_01"); //Velení? Rozhlédni se kolem. Určitě nikdo, kdo by se dřel do úmoru a sbíral rudu. To je jisté.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

instance Info_SFB_1_DasLager(C_INFO)
{
	nr = 2;
	condition = Info_SFB_1_DasLager_Condition;
	information = Info_SFB_1_DasLager_Info;
	important = 0;
	permanent = 1;
//	description = "What is this?";
//	description = "Was ist das hier?";
	description = "Co to je?";
};

func int Info_SFB_1_DasLager_Condition()
{
	return 1;
};

func void Info_SFB_1_DasLager_Info()
{
//	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //What is this?
//	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //Was ist das hier?
	AI_Output(other, self, "Info_SFB_1_DasLager_15_00"); //Co to je?
//	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //What's it look like? The royal palace?
//	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //Wie sieht es denn aus? Wie der Palast des Königs?
	AI_Output(self, other, "Info_SFB_1_DasLager_01_01"); //Co takhle může vypadat? Královský palác?
//	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //if you really wanna work in the Free Mine, you'll have to work your way up here in the Hollow first to prove you're any use to us.
//	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //Also wenn du wirklich in der Freien Mine arbeiten willst, dann wirst du erst hier im Kessel beweisen müssen, dass wir dich gebrauchen können.
	AI_Output(self, other, "Info_SFB_1_DasLager_01_02"); //Jestli chceš opravdu pracovat ve Svobodném dole, musíš se nejdříve vypracovat v Kotlině a ukázat, jestli máš pro nás cenu.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

instance Info_SFB_1_DieLage(C_INFO)
{
	nr = 1;
	condition = Info_SFB_1_DieLage_Condition;
	information = Info_SFB_1_DieLage_Info;
	important = 0;
	permanent = 1;
//	description = "How are you doing?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};

func int Info_SFB_1_DieLage_Condition()
{
	return 1;
};

func void Info_SFB_1_DieLage_Info()
{
//	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //How are you doing?
//	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(other, self, "Info_SFB_1_DieLage_15_00"); //Jak se máš?
//	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //How d'you think? Just as bad as usual. Nothing to eat, lots to do.
//	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //Wie soll's schon aussehen? Beschissen wie immer. Kaum was zu beißen, dafür immer was zu tun.
	AI_Output(self, other, "Info_SFB_1_DieLage_01_01"); //Jak to vidím? Špatně jako vždycky. Nic k jídlu, spousta práce.
//	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //The only one of us who doesn't have his hands full is Swiney. Okyl promoted him to spokesman for us scrapers. Now he stands around here all day making sure no-one gets blisters on their hands.
//	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //Der Einzige von uns, der nicht so viel zu tun hat, ist Swiney. Okyl hat ihn zum Sprecher für uns Schürfer benannt. Jetzt steht er den ganzen Tag rum und passt auf, dass er keine Blasen an den Händen kriegt.
	AI_Output(self, other, "Info_SFB_1_DieLage_01_02"); //Jediný, kdo nic nedělá, je Swiney. Okyl ho jmenoval mluvčím rudařů. Teď se tu celý den rozhlíží a kontroluje, jestli nemá na rukou mozoly.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_SFB_1(var C_Npc slf)
{
	Info_SFB_1_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc = Hlp_GetInstanceID(slf);
};
