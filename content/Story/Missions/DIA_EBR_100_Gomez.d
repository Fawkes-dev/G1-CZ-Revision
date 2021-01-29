// **************************************
//					EXIT 
// **************************************

instance DIA_Gomez_Exit(C_INFO)
{
	npc = Ebr_100_Gomez;
	nr = 999;
	condition = DIA_Gomez_Exit_Condition;
	information = DIA_Gomez_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Gomez_Exit_Condition()
{
	return 1;
};

func void DIA_Gomez_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_Gomez_Fault(C_INFO)
{
	npc = Ebr_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_Fault_Condition;
	information = DIA_Gomez_Fault_Info;
	permanent = 0;
//	description = "I came to offer my services.";
//	description = "Ich bin gekommen, um dir meine Dienste anzubieten.";
	description = "Přišel jsem nabídnout své služby.";
};                       

func int DIA_Gomez_Fault_Condition()
{
	if (!Npc_KnowsInfo(hero,DIA_Raven_There))
	{
		return 1;
	};
};

func void DIA_Gomez_Fault_Info()
{
//	AI_Output(other,self,"DIA_Gomez_Fault_15_00"); //I came to offer my services.
//	AI_Output(other,self,"DIA_Gomez_Fault_15_00"); //Ich bin gekommen, um dir meine Dienste anzubieten.
	AI_Output(other,self,"DIA_Gomez_Fault_15_00"); //Přišel jsem nabídnout své služby.
//	AI_Output(self,other,"DIA_Gomez_Fault_11_01"); //You just come marching in here and expect me to concern myself with you, you worm? GUARDS!
//	AI_Output(self,other,"DIA_Gomez_Fault_11_01"); //Du platzt hier einfach rein und erwartest, dass ich mich mit dir befasse, du Wurm? WACHE!
	AI_Output(self,other,"DIA_Gomez_Fault_11_01"); //Tak ty sem jednoduše vtrhneš a myslíš si, že se tebou budu zabývat, ty červe? STRÁŽE!

	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

// **************************************
//				Hallo
// **************************************
	var int gomez_kontakte;
// **************************************

instance DIA_Gomez_Hello(C_INFO)
{
	npc = Ebr_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_Hello_Condition;
	information = DIA_Gomez_Hello_Info;
	permanent = 1;
//	description = "I have come to offer my services.";
//	description = "Ich bin gekommen, um dir meine Dienste anzubieten.";
	description = "Přišel jsem nabídnout své služby.";
};                       

func int DIA_Gomez_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_There) && (gomez_kontakte<4))
	{
		return 1;
	};
};

func void DIA_Gomez_Hello_Info()
{
//	AI_Output(other,self,"DIA_Gomez_Hello_15_00"); //I have come to offer my services.
//	AI_Output(other,self,"DIA_Gomez_Hello_15_00"); //Ich bin gekommen, um dir meine Dienste anzubieten.
	AI_Output(other,self,"DIA_Gomez_Hello_15_00"); //Přišel jsem nabídnout své služby.
//	AI_Output(self,other,"DIA_Gomez_Hello_11_01"); //What makes you think we're interested in your services?
//	AI_Output(self,other,"DIA_Gomez_Hello_11_01"); //Warum denkst du, dass wir an deinen Diensten interessiert sind?
	AI_Output(self,other,"DIA_Gomez_Hello_11_01"); //Proč si myslíš, že bychom měli mít o tvoje služby zájem?

	Info_ClearChoices(DIA_Gomez_Hello); 
//	Info_AddChoice(DIA_Gomez_Hello,"I hope I'm not going to have to chop your head off to prove myself.",DIA_Gomez_Hello_KopfAb);
//	Info_AddChoice(DIA_Gomez_Hello,"Ich hoffe ich muss dir nicht erst den Kopf abhacken, um mich zu beweisen.",DIA_Gomez_Hello_KopfAb);
	Info_AddChoice(DIA_Gomez_Hello,"Doufám, že ti nebudu muset useknout hlavu, abych ti ukázal, že to dokážu.",DIA_Gomez_Hello_KopfAb);
//	Info_AddChoice(DIA_Gomez_Hello,"There's only blockheads around here.",DIA_Gomez_Hello_Spinner);
//	Info_AddChoice(DIA_Gomez_Hello,"Weil hier nur Schwachköpfe rumrennen.",DIA_Gomez_Hello_Spinner);
	Info_AddChoice(DIA_Gomez_Hello,"Protože tu pobíhají jen samí hňupové.",DIA_Gomez_Hello_Spinner);
//	Info_AddChoice(DIA_Gomez_Hello,"I've been traveling around a lot and I have contacts in all the camps.",DIA_Gomez_Hello_Kontakte);
//	Info_AddChoice(DIA_Gomez_Hello,"Ich bin viel rumgekommen und habe gute Kontakte in allen Lagern.",DIA_Gomez_Hello_Kontakte);
	Info_AddChoice(DIA_Gomez_Hello,"Chodil jsem po všech táborech a ve všech mám známé.",DIA_Gomez_Hello_Kontakte);
//	Info_AddChoice(DIA_Gomez_Hello,"I have stood the test of faith.",DIA_Gomez_Hello_ThorusSays);
//	Info_AddChoice(DIA_Gomez_Hello,"Ich habe die Prüfung des Vertrauens bestanden.",DIA_Gomez_Hello_ThorusSays);
	Info_AddChoice(DIA_Gomez_Hello,"Složil jsem zkoušku poctivosti.",DIA_Gomez_Hello_ThorusSays);

};

func void DIA_Gomez_Hello_ThorusSays()
{
//	AI_Output(other,self,"DIA_Gomez_Hello_ThorusSays_15_00"); //I have stood the test of faith and Thorus says I'm worth it.
//	AI_Output(other,self,"DIA_Gomez_Hello_ThorusSays_15_00"); //Ich habe die Prüfung des Vertrauens bestanden und Thorus sagt, ich bin ein guter Mann.
	AI_Output(other,self,"DIA_Gomez_Hello_ThorusSays_15_00"); //Složil jsem zkoušku poctivosti a Thorus říkal, že jsem správný chlap.
//	AI_Output(self,other,"DIA_Gomez_Hello_ThorusSays_11_01"); //You wouldn't have gotten in here alive if that weren't so. I hope that's not the best you can do.
//	AI_Output(self,other,"DIA_Gomez_Hello_ThorusSays_11_01"); //Du wärst hier nicht lebend reingekommen, wenn das nicht so wäre. Ich hoffe, das war nicht schon alles.
	AI_Output(self,other,"DIA_Gomez_Hello_ThorusSays_11_01"); //Kdyby to tak opravdu nebylo, nebyl by ses sem dostal živý. Doufám ale, že to nebylo všechno, co umíš.
};

func void DIA_Gomez_Hello_Kontakte()
{
	gomez_kontakte = 0;
//	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_15_00"); //I've been traveling around the colony a lot and I have contacts in all the camps.
//	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_15_00"); //Ich bin viel in der Kolonie rumgekommen und habe gute Kontakte in allen Lagern.
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_15_00"); //Chodil jsem po Kolonii a mám známe ve všech táborech.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_11_01"); //Now that could prove useful. Who are you in contact with?
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_11_01"); //Das ist tatsächlich ein guter Grund. Zu wem hast du Kontakte?
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_11_01"); //To je skutečně skvělý základ. S kým jsi v kontaktu?
	Info_ClearChoices(DIA_Gomez_Hello);
//	Info_AddChoice(DIA_Gomez_Hello,"Those were the important ones.",DIA_Gomez_Hello_Kontakte_ThatsAll);
//	Info_AddChoice(DIA_Gomez_Hello,"Das waren alle wichtigen.",DIA_Gomez_Hello_Kontakte_ThatsAll);
	Info_AddChoice(DIA_Gomez_Hello,"To byli všichni důležití.",DIA_Gomez_Hello_Kontakte_ThatsAll);
//	Info_AddChoice(DIA_Gomez_Hello,"A couple of fences in the New Camp.",DIA_Gomez_Hello_Kontakte_NLHehler);
//	Info_AddChoice(DIA_Gomez_Hello,"Zu einigen Hehlern im Neuen Lager.",DIA_Gomez_Hello_Kontakte_NLHehler);
	Info_AddChoice(DIA_Gomez_Hello,"S pár překupníky z Nového tábora.",DIA_Gomez_Hello_Kontakte_NLHehler);
//	Info_AddChoice(DIA_Gomez_Hello,"Zu Lares.",DIA_Gomez_Hello_Kontakte_Lares);
	Info_AddChoice(DIA_Gomez_Hello,"S Laresem.",DIA_Gomez_Hello_Kontakte_Lares);
	//Info_AddChoice(DIA_Gomez_Hello,"Zu Lee." ,DIA_Gomez_Hello_Kontakte_Lee);
//	Info_AddChoice(DIA_Gomez_Hello,"A few of the Baals in the Brotherhood's camp.",DIA_Gomez_Hello_Kontakte_Baals);
//	Info_AddChoice(DIA_Gomez_Hello,"Zu einigen Baals aus dem Lager der Bruderschaft.",DIA_Gomez_Hello_Kontakte_Baals);
	Info_AddChoice(DIA_Gomez_Hello,"S pár Baaly z tábora Bratrstva.",DIA_Gomez_Hello_Kontakte_Baals);
//	Info_AddChoice(DIA_Gomez_Hello,"Zu Cor Kalom.",DIA_Gomez_Hello_Kontakte_Kalom);
	Info_AddChoice(DIA_Gomez_Hello,"S Cor Kalomem.",DIA_Gomez_Hello_Kontakte_Kalom);

	if (gomez_kontakte < 3)
	{
//	Info_AddChoice(DIA_Gomez_Hello,"Zu Y'Berion.",DIA_Gomez_Hello_Kontakte_YBerion);
	Info_AddChoice(DIA_Gomez_Hello,"S Y'Berionem.",DIA_Gomez_Hello_Kontakte_YBerion);
	};
};

func void DIA_Gomez_Hello_Spinner()
{
//	AI_Output(other,self,"DIA_Gomez_Hello_Spinner_15_00"); //There's only blockheads around here, on the lookout for newcomers to pass their jobs onto instead of doing them themselves.
//	AI_Output(other,self,"DIA_Gomez_Hello_Spinner_15_00"); //Weil hier nur Schwachköpfe rumrennen, die ihre Aufgaben lieber an Neulinge weitergeben, statt sie selber zu erledigen.
	AI_Output(other,self,"DIA_Gomez_Hello_Spinner_15_00"); //Protože jsou tu jenom hňupové, kteří všechnu práci jenom přehazují na nováčky, místo aby ji dělali sami.
//	AI_Output(self,other,"DIA_Gomez_Hello_Spinner_11_01"); //That may be true, with few exceptions. Still, it's no reason to hire another blockhead.
//	AI_Output(self,other,"DIA_Gomez_Hello_Spinner_11_01"); //Das ist zwar bis auf wenige Ausnahmen richtig, aber kein Grund einen weiteren Schwachkopf anzuheuern.
	AI_Output(self,other,"DIA_Gomez_Hello_Spinner_11_01"); //To je, až na pár výjimek, pravda. Není to ale vůbec důvod najímat další hňupy.
};

func void DIA_Gomez_Hello_KopfAb()
{
//	AI_Output(other,self,"DIA_Gomez_Hello_KopfAb_15_00"); //I hope I'm not going to have to chop your head off to prove that I can handle a weapon.
//	AI_Output(other,self,"DIA_Gomez_Hello_KopfAb_15_00"); //Ich hoffe ich muss dir nicht erst den Kopf abhacken, um dir zu beweisen, dass ich mit einer Waffe umgehen kann
	AI_Output(other,self,"DIA_Gomez_Hello_KopfAb_15_00"); //Doufám, že ti nebudu muset useknout hlavu, abych ti ukázal, že se umím ohánět se zbraní.
//	AI_Output(self,other,"DIA_Gomez_Hello_KopfAb_11_01"); //Thers's a fine line between bravery and stupidity.
//	AI_Output(self,other,"DIA_Gomez_Hello_KopfAb_11_01"); //Mut und Dummheit liegen dicht beieinander ...
	AI_Output(self,other,"DIA_Gomez_Hello_KopfAb_11_01"); //Mezi hrdinstvím a pitomostí je jen velmi malý rozdíl.

	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

//----------------KONTAKTE--------------------

func void DIA_Gomez_Hello_Kontakte_YBerion()
{
//	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00"); //Zu Y'Berion.
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00"); //S Y'Berionem.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01"); //Y'Berion doesn't waste his time on guys like you.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01"); //Y'Berion gibt sich nicht mit Burschen wie dir ab.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01"); //Y'Berion neztrácí čas s chlapíky jako jsi ty.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02"); //Your lies tell me you think I am an idiot.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02"); //Dass du lügst, zeigt mir, dass du mich für dumm hältst.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02"); //Lžeš mi, jako bych byl nějaký idiot.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03"); //I'm disappointed to see you think I'm STUPID.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03"); //Dass du mich für DUMM hältst, enttäuscht mich.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03"); //Mrzí mě, když vidím, že mě máš za HLUPÁKA.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04"); //I hate being disappointed.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04"); //Ich hasse es, enttäuscht zu werden.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04"); //Nerad se cítím zklamaný.
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Gomez_Hello_Kontakte_Kalom()
{
//	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00"); //Zu Cor Kalom.
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00"); //S Cor Kalomem.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01"); //And?
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01"); //Und?
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01"); //A?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_Baals()
{
//	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Baals_15_00"); //A few of the Baals in the Brotherhood's camp.
//	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Baals_15_00"); //Zu einigen Baals aus dem Lager der Bruderschaft.
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Baals_15_00"); //S pár Baaly z tábora Bratrstva.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Baals_11_01"); //And?
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Baals_11_01"); //Und?
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Baals_11_01"); //A?
	gomez_kontakte = gomez_kontakte + 1;
};

/*
func void DIA_Gomez_Hello_Kontakte_Lee()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Lee_15_00"); //Zu Lee.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Lee_11_01"); //Lee ist also ein guter Freund von dir, ja?
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Lee_11_02"); //Dann sieht die Sache natürlich ANDERS AUS (zornig am ENDE)

	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};
*/
func void DIA_Gomez_Hello_Kontakte_Lares()
{
//	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Lares_15_00"); //Zu Lares.
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Lares_15_00"); //S Laresem.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Lares_11_01"); //And?
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Lares_11_01"); //Und?
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Lares_11_01"); //A?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_NLHehler()
{
//	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00"); //A couple of the fences in the New Camp.
//	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00"); //Zu einigen Hehlern im Neuen Lager.
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00"); //S pár překupníky z Nového tábora.
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01"); //And?
//	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01"); //Und?
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01"); //A?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_ThatsAll()
{
//	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00"); //Those were the important ones.
//	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00"); //Das waren alle wichtigen.
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00"); //To byli všichni důležití.
	if (gomez_kontakte >= 4) 
	{
//		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01"); //Not bad - for a beginner...
//		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01"); //Beachtlich - für einen Neuling wie dich ...
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01"); //Pozoruhodné - na nováčka...
//		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02"); //You shall have your chance.
//		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02"); //Du sollst deine Chance kriegen.
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02"); //Měl bys dostat šanci.
		Info_ClearChoices(DIA_Gomez_Hello);
	}
	else
	{
//		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00"); //You expect THAT to impress me? We have DIGGERS with better connections!
//		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00"); //DAMIT willst du mich beeindrucken? Im Lager gibt es BUDDLER, die bessere Beziehungen haben!
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00"); //Myslíš si, že mě TOHLE dojme? Máme KOPÁČE s lepšími kontakty!
		Info_ClearChoices(DIA_Gomez_Hello);
	};
};

// **************************************
//				Bin ich dabei
// **************************************

instance DIA_Gomez_Dabei(C_INFO)
{
	npc = Ebr_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_Dabei_Condition;
	information = DIA_Gomez_Dabei_Info;
	permanent = 0;
//	description = "Does that mean I'm in?";
//	description = "Heißt das, ich bin dabei?";
	description = "Znamená to, že jsem přijat?";
};                       

func int DIA_Gomez_Dabei_Condition()
{
	if (gomez_kontakte >= 3)
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Gomez_Dabei_Info()
{
//	AI_Output(other,self,"DIA_Gomez_Dabei_15_00"); //Does that mean I'm in?
//	AI_Output(other,self,"DIA_Gomez_Dabei_15_00"); //Heißt das, ich bin dabei?
	AI_Output(other,self,"DIA_Gomez_Dabei_15_00"); //Znamená to, že jsem přijat?
//	AI_Output(self,other,"DIA_Gomez_Dabei_11_01"); //You bet it does. You're one of us now, kid.
//	AI_Output(self,other,"DIA_Gomez_Dabei_11_01"); //Genau das heißt es. Du bist jetzt einer von uns, Kleiner.
	AI_Output(self,other,"DIA_Gomez_Dabei_11_01"); //Přesně tak. Jsi jedním z nás, hochu.
//	AI_Output(self,other,"DIA_Gomez_Dabei_11_02"); //Raven'll fill you in on everything.
//	AI_Output(self,other,"DIA_Gomez_Dabei_11_02"); //Alles Weitere wird dir Raven erzählen.
	AI_Output(self,other,"DIA_Gomez_Dabei_11_02"); //Raven ti vysvětlí všechno ostatní.

	Npc_SetTrueGuild(hero,GIL_STT);
	hero.guild = GIL_STT;
	B_GiveXP(XP_BecomeShadow);
//	B_LogEntry(CH1_JoinOC,"From today on, I'm working for Gomez and the Old Camp. Raven will tell me everything else!");
//	B_LogEntry(CH1_JoinOC,"Von heute an arbeite ich für Gomez und das Alte Lager. Raven wird mir alles weitere erzählen!");
	B_LogEntry(CH1_JoinOC,"Ode dneška pracuji pro Gomeze a Starý tábor. Raven mi vysvětlí vše potřebné!");
	Log_SetTopicStatus(CH1_JoinOC,LOG_SUCCESS);

	// Canceln der anderen Aufnahmen
	Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinNC,LOG_FAILED);
//	B_LogEntry(CH1_JoinNC,"Since I now belong to Gomez' people I can't be admitted to Lares' gang!");
//	B_LogEntry(CH1_JoinNC,"Als einer von Gomez' Leuten ist eine Aufnahme in Lares' Bande unmöglich geworden!");
	B_LogEntry(CH1_JoinNC,"Od doby, co patřím ke Gomezovým lidem, nemůžu být přijat do Laresovy tlupy.");

	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_FAILED);
//	B_LogEntry(CH1_JoinPsi,"From now on the Old Camp is my new home. The Brotherhood of the Sleeper will have to make do without me.");
//	B_LogEntry(CH1_JoinPsi,"Von nun an ist das Alte Lager mein neues Zuhause. Die Bruderschaft des Schläfers wird ohne mich auskommen müssen.");
	B_LogEntry(CH1_JoinPsi,"Nyní je mým novým domovem Starý tábor. Bratrstvo Spáče si bude muset poradit beze mě.");

	AI_StopProcessInfos(self);
};

// **************************************
//				Nur so (PERM)
// **************************************

instance DIA_Gomez_NurSo(C_INFO)
{
	npc = Ebr_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_NurSo_Condition;
	information = DIA_Gomez_NurSo_Info;
	permanent = 1;
//	description = "I just thought I'd report in.";
//	description = "Ich wollte mal einen Zwischenbericht abgeben.";
	description = "Chci ti podat hlášení.";
};                       

func int DIA_Gomez_NurSo_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Gomez_NurSo_Info()
{
//	AI_Output(other,self,"DIA_Gomez_NurSo_15_00"); //I just thought I'd report in.
//	AI_Output(other,self,"DIA_Gomez_NurSo_15_00"); //Ich wollte mal einen Zwischenbericht abgeben.
	AI_Output(other,self,"DIA_Gomez_NurSo_15_00"); //Chci ti podat hlášení.
//	AI_Output(self,other,"DIA_Gomez_NurSo_11_00"); //Then go and see Raven. And never speak to me again unless you're told to!
//	AI_Output(self,other,"DIA_Gomez_NurSo_11_00"); //Dann geh zu Raven. Und sprich mich nie wieder an, ohne dass du dazu aufgefordert worden bist!
	AI_Output(self,other,"DIA_Gomez_NurSo_11_00"); //Tak jdi za Ravenem. A nikdy už na mě nemluv, dokud tě k tomu nevyzvu!
};

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////////////////   	Kapitel 5        ///////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

// ***********************************************
// 				Wartet auf den SC
// ***********************************************

instance DIA_EBR_100_Gomez_Wait4SC(C_INFO)
{
	npc = EBR_100_Gomez;
	condition = DIA_EBR_100_Gomez_Wait4SC_Condition;
	information = DIA_EBR_100_Gomez_Wait4SC_Info;
	important = 1;
	permanent = 0;
};

func int DIA_EBR_100_Gomez_Wait4SC_Condition()
{ 
	if ExploreSunkenTower
	{
		return TRUE;
	};
};
func void DIA_EBR_100_Gomez_Wait4SC_Info()
{
//	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_01"); //How did you get in here?
//	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_01"); //Wie bist du denn hier rein gekommen?
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_01"); //Jak ses sem dostal?
//	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_02"); //Hang on! Aren't you the one that fought our men in the Free Mine?
//	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_02"); //Moment! Bist du nicht diese Pestzecke gewesen, die unsere Leute in der Freien Mine kalt gemacht hat?
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_02"); //Stůj! Nejsi ty ten, který pozabíjel naše muže ve Svobodném dole?
//	AI_Output(other,self,"DIA_EBR_100_Gomez_Wait4SC_15_03"); //Your men had no right to invade it. I just corrected their attack of megalomania!
//	AI_Output(other,self,"DIA_EBR_100_Gomez_Wait4SC_15_03"); //Deine Leute hatten kein Recht, dort einzufallen. Ich habe diesen Anflug von Größenwahnsinn nur wieder korrigiert!
	AI_Output(other,self,"DIA_EBR_100_Gomez_Wait4SC_15_03"); //Tví muži neměli právo důl napadnout! Jen jsem tento náznak velikáštví trošku zkorigoval!
//	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_04"); //Talking to me, GOMEZ, in that way shows some courage. But it was foolish of you to turn up here like that.
//	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_04"); //Du hast Mut, so mit mir - GOMEZ - zu sprechen, aber es war ziemlich dumm von dir, hier einfach aufzutauchen.
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_04"); //Máš odvahu, takhle se mnou - GOMEZEM - mluvit. Ale bylo od tebe dost hloupé, takhle sem vpadnout.
//	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_05"); //I will personally take care that you never get in my way again.
//	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_05"); //Ich werde persönlich sicherstellen, dass du mir nie wieder in die Suppe spucken wirst.
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_05"); //Osobně dohlédnu na to, abys mi už nikdy nezkřížil cestu.

	AI_StopProcessInfos(self);

	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR); 
};
