// **************************************************
//  EXIT 
// **************************************************

instance DIA_Joru_Exit(C_INFO)
{
	npc = Nov_1305_Joru;
	nr = 999;
	condition = DIA_Joru_Exit_Condition;
	information = DIA_Joru_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Joru_Exit_Condition()
{
	return 1;
};

func void DIA_Joru_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// Was machst du?
// **************************************************

instance DIA_Joru_Greet(C_INFO)
{
	npc = Nov_1305_Joru;
	nr = 1;
	condition = DIA_Joru_Greet_Condition;
	information = DIA_Joru_Greet_Info;
	permanent = 0;
//	description = "What are you doing here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};                       

func int DIA_Joru_Greet_Condition()
{
	return 1;
};

func void DIA_Joru_Greet_Info()
{
//	AI_Output(other,self,"DIA_Joru_Greet_15_00"); //What are you doing here?
//	AI_Output(other,self,"DIA_Joru_Greet_15_00"); //Was machst du hier?
	AI_Output(other,self,"DIA_Joru_Greet_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_Joru_Greet_07_01"); //I'm teaching the words of the Sleeper to the novices.
//	AI_Output(self,other,"DIA_Joru_Greet_07_01"); //Ich verbreite die Lehre des Schläfers an die Novizen.
	AI_Output(self,other,"DIA_Joru_Greet_07_01"); //Učím novice Spáčovu poselství.
//	AI_Output(self,other,"DIA_Joru_Greet_07_02"); //I'm still a novice myself,but soon I'll be a Baal - one of the Gurus.
//	AI_Output(self,other,"DIA_Joru_Greet_07_02"); //Ich bin selbst noch Novize, aber bald bin ich ein Baal - einer der Gurus.
	AI_Output(self,other,"DIA_Joru_Greet_07_02"); //Jsem ještě novic, ale brzy budu Baal - jeden z Guru.
//	AI_Output(self,other,"DIA_Joru_Greet_07_03"); //I've even spoken to Y'Berion. He's the chosen one. He told me that if I work hard, I can soon be a master myself.
//	AI_Output(self,other,"DIA_Joru_Greet_07_03"); //Ich habe sogar schon mit Y'Berion geredet. Er ist der Auserwählte. Er hat mir gesagt, wenn ich hart an mir arbeite, bin ich bald selbst ein Meister.
	AI_Output(self,other,"DIA_Joru_Greet_07_03"); //Už jsem mluvil s Y´Berionem. Je tím vyvoleným. Říkal mi, že jestli budu tvrdě pracovat, můžu se zanedlouho sám stát mistrem.
//	AI_Output(self,other,"DIA_Joru_Greet_07_04"); //But I'm still putting that off. There's no rush - you understand? I can still become a master anytime.
//	AI_Output(self,other,"DIA_Joru_Greet_07_04"); //Aber ich schiebe das so'n bisschen vor mir her. Eilt ja nicht - verstehst du? Meister kann ich ja immer noch werden.
	AI_Output(self,other,"DIA_Joru_Greet_07_04"); //Pořád to ale odkládám. Žádný spěch - rozumíš? Můžu se stát mistrem kdykoliv.
//	AI_Output(self,other,"DIA_Joru_Greet_07_05"); //At the moment I'm quite happy about my current task.
//	AI_Output(self,other,"DIA_Joru_Greet_07_05"); //Im Moment bin ich ganz zufrieden mit meiner jetzigen Aufgabe.
	AI_Output(self,other,"DIA_Joru_Greet_07_05"); //V tuhle chvíli jsem docela spokojený se svým současným posláním.
};

// **************************************************
// Tester
// **************************************************

instance DIA_Joru_Tester(C_INFO)
{
	npc = Nov_1305_Joru;
	nr = 1;
	condition = DIA_Joru_Tester_Condition;
	information = DIA_Joru_Tester_Info;
	permanent = 0;
//	description = "What's your task here?";
//	description = "Was ist deine Aufgabe hier?";
	description = "Jaké je teď tvoje poslání?";
};                       

func int DIA_Joru_Tester_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	{
		return 1;
	};
};

func void DIA_Joru_Tester_Info()
{
//	AI_Output(other,self,"DIA_Joru_Tester_15_00"); //What's your task here?
//	AI_Output(other,self,"DIA_Joru_Tester_15_00"); //Was ist deine Aufgabe hier?
	AI_Output(other,self,"DIA_Joru_Tester_15_00"); //Jaké je teď tvoje poslání?
//	AI_Output(self,other,"DIA_Joru_Tester_07_01"); //I test the new substances developed by Cor Kalom in his alchemy lab with my pals here.
//	AI_Output(self,other,"DIA_Joru_Tester_07_01"); //Ich teste mit den Jungs hier die neuen Substanzen, die Cor Kalom in seinem Alchimielabor entwickelt.
	AI_Output(self,other,"DIA_Joru_Tester_07_01"); //Zkouším tu se svými kamarády nové substance, které ve své dílně vyrobil Cor Kalom.
//	AI_Output(self,other,"DIA_Joru_Tester_07_02"); //His aide gives us something new every couple of days. And we test it.
//	AI_Output(self,other,"DIA_Joru_Tester_07_02"); //Sein Gehilfe bringt alle paar Tage was Neues raus. Und wir testen es dann.
	AI_Output(self,other,"DIA_Joru_Tester_07_02"); //Jeho úsilí nám každých pár dní přináší něco nového. A my to testujeme.
//	AI_Output(self,other,"DIA_Joru_Tester_07_03"); //This weed opens your spirit. If you take the right amount, you can get in touch with the Sleeper.
//	AI_Output(self,other,"DIA_Joru_Tester_07_03"); //Dieses Kraut öffnet deinen Geist. Wenn du die richtige Menge einnimmst, kannst du in Kontakt mit dem Schläfer treten.
	AI_Output(self,other,"DIA_Joru_Tester_07_03"); //Tahle droga otevírá duši. Když vezmeš správné množství, můžeš vejít do spojení se Spáčem.
};

// **************************************************
// Schonmal Kontakt?
// **************************************************

instance DIA_Joru_SleeperContact(C_INFO)
{
	npc = Nov_1305_Joru;
	nr = 1;
	condition = DIA_Joru_SleeperContact_Condition;
	information = DIA_Joru_SleeperContact_Info;
	permanent = 0;
//	description = "Have you ever been in contact with the Sleeper?";
//	description = "Hattest du schon Kontakt zum Schläfer?";
	description = "Už jsi byl někdy ve spojení se Spáčem?";
};                       

func int DIA_Joru_SleeperContact_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
		return 1;
	};
};

func void DIA_Joru_SleeperContact_Info()
{
//	AI_Output(other,self,"DIA_Joru_SleeperContact_15_00"); //Have you ever been in contact with the Sleeper?
//	AI_Output(other,self,"DIA_Joru_SleeperContact_15_00"); //Hattest du schon Kontakt zum Schläfer?
	AI_Output(other,self,"DIA_Joru_SleeperContact_15_00"); //Už jsi byl někdy ve spojení se Spáčem?
//	AI_Output(self,other,"DIA_Joru_SleeperContact_07_01"); //No. Not yet. But that's because we never get enough of the stuff.
//	AI_Output(self,other,"DIA_Joru_SleeperContact_07_01"); //Nein. Bis jetzt noch nicht. Wir kriegen auch nie genug von dem Zeug.
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_01"); //Ne. Ještě ne. Ale jen protože jsem nikdy neměl dost té látky.
//	AI_Output(self,other,"DIA_Joru_SleeperContact_07_02"); //Kalom always wants to hear about the effect of it, but I get the impression he's not really interested in my opinion at all.
//	AI_Output(self,other,"DIA_Joru_SleeperContact_07_02"); //Kalom will zwar immer von mir wissen, wie die Wirkung war, aber ich habe den Eindruck, meine Meinung interessiert ihn gar nicht so sehr.
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_02"); //Kalom chce vždycky vědět o vyvolaných účincích, ale mám dojem, že ho můj názor vlastně doopravdy nezajímá.
//	AI_Output(self,other,"DIA_Joru_SleeperContact_07_03"); //If I find the stuff stimulating, he passes it straight on to the Gurus...
//	AI_Output(self,other,"DIA_Joru_SleeperContact_07_03"); //Wenn ich die Wirkung anregend fand, gibt er das Zeug direkt weiter an die Gurus ...
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_03"); //Jestliže zjistím, že ta látka stimuluje, předá ji přímo Guru...
//	AI_Output(self,other,"DIA_Joru_SleeperContact_07_04"); //But soon I'll be a Guru myself,then I can go right to my limits and listen to the voice of the Sleeper myself.
//	AI_Output(self,other,"DIA_Joru_SleeperContact_07_04"); //Aber bald bin ich ja selber ein Guru, dann kann ich bis an meine Grenzen gehen und auch die Stimme des Schläfers vernehmen.
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_04"); //Brzy ale budu sám Guru, a pak budu moci zajít až na hranici svých možností a naslouchat Spáčovu hlasu sám.
};

// **************************************************
// JOIN PSI
// **************************************************
	var int Joru_BringJoints;
// **************************************************

instance DIA_Joru_JoinPsi(C_INFO)
{
	npc = Nov_1305_Joru;
	nr = 5;
	condition = DIA_Joru_JoinPsi_Condition;
	information = DIA_Joru_JoinPsi_Info;
	permanent = 0;
//	description = "I'd like to join your camp - can you help me?";
//	description = "Ich will mich eurem Lager anschließen - kannst du mir dabei helfen?";
	description = "Rád bych se přidal k vašemu táboru - pomůžeš mi?";
};                       

func int DIA_Joru_JoinPsi_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Joru_JoinPsi_Info()
{
//	AI_Output(other,self,"DIA_Joru_JoinPsi_15_00"); //I'd like to join your camp - can you help me?
//	AI_Output(other,self,"DIA_Joru_JoinPsi_15_00"); //Ich will mich eurem Lager anschließen - kannst du mir dabei helfen?
	AI_Output(other,self,"DIA_Joru_JoinPsi_15_00"); //Rád bych se přidal k vašemu táboru - pomůžeš mi?
//	AI_Output(self,other,"DIA_Joru_JoinPsi_07_01"); //You want to join us? That's good! Just wait... yes, I think I can help you.
//	AI_Output(self,other,"DIA_Joru_JoinPsi_07_01"); //Du willst bei uns mitmachen? Das ist gut! Warte mal ... Ja, ich glaube, ich kann dir helfen.
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_01"); //Chceš se k nám přidat? To je dobře! Počkej chvíli... ano, myslím, že ti můžu pomoci.
//	AI_Output(self,other,"DIA_Joru_JoinPsi_07_02"); //I'm not a Guru yet, but I have some influence in the Brotherhood.
//	AI_Output(self,other,"DIA_Joru_JoinPsi_07_02"); //Ich bin zwar noch kein Guru, aber ich habe einigen Einfluss in der Bruderschaft.
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_02"); //Nejsem ještě Guru, mám ale určitý vliv na Bratrstvo.
//	AI_Output(self,other,"DIA_Joru_JoinPsi_07_03"); //You'd have to do me a favor. Have you seen Fortuno yet?
//	AI_Output(self,other,"DIA_Joru_JoinPsi_07_03"); //Du müsstest mir einen kleinen Gefallen tun. Bist du schon bei Fortuno gewesen?
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_03"); //Musíš mi prokázat malou laskavost. Už jsi viděl Fortuna?

	Info_ClearChoices(DIA_Joru_JoinPsi);
//	Info_AddChoice(DIA_Joru_JoinPsi,"No.",DIA_Joru_JoinPsi_Nein);
//	Info_AddChoice(DIA_Joru_JoinPsi,""Nein."	",DIA_Joru_JoinPsi_Nein);
	Info_AddChoice(DIA_Joru_JoinPsi,"Ne.",DIA_Joru_JoinPsi_Nein);
//	Info_AddChoice(DIA_Joru_JoinPsi,"Yes.",DIA_Joru_JoinPsi_Ja);
//	Info_AddChoice(DIA_Joru_JoinPsi,""Ja."		",DIA_Joru_JoinPsi_Ja);
	Info_AddChoice(DIA_Joru_JoinPsi,"Ano.",DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
//	AI_Output(self,other,"DIA_Joru_JoinPsi_Ja_07_00"); //Then you have your daily ration? If you give it to me then we're in business.
//	AI_Output(self,other,"DIA_Joru_JoinPsi_Ja_07_00"); //Dann hast du bestimmt schon deine tägliche Ration bekommen? Wenn du sie mir überlässt, sind wir im Geschäft.
	AI_Output(self,other,"DIA_Joru_JoinPsi_Ja_07_00"); //Pak už máš svůj denní příděl? Když mi ho dáš, jsme domluveni.
//	AI_Output(other,self,"DIA_Joru_JoinPsi_Ja_15_01"); //I'll think about it.
//	AI_Output(other,self,"DIA_Joru_JoinPsi_Ja_15_01"); //Ich denke drüber nach.
	AI_Output(other,self,"DIA_Joru_JoinPsi_Ja_15_01"); //Rozmyslím si to.
	Joru_BringJoints = LOG_RUNNING; 

	Info_ClearChoices(DIA_Joru_JoinPsi);
};

func void DIA_Joru_JoinPsi_Nein()
{
//	AI_Output(self,other,"DIA_Joru_JoinPsi_Nein_07_00"); //Then go, see him and collect your daily ration. If you leave me all the swampweed he gives you, we're in business.
//	AI_Output(self,other,"DIA_Joru_JoinPsi_Nein_07_00"); //Dann geh zu ihm und hol dir deine tägliche Ration ab. Wenn du mir alles Sumpfkraut überlässt, das er dir gibt, sind wir im Geschäft.
	AI_Output(self,other,"DIA_Joru_JoinPsi_Nein_07_00"); //Pak jdi za ním a  vyzvedni si svůj denní příděl. Když mi přenecháš všechnu drogu z bažin, kterou ti dá, budeme domluveni.
//	AI_Output(other,self,"DIA_Joru_JoinPsi_Nein_15_01"); //I'll think about it.
//	AI_Output(other,self,"DIA_Joru_JoinPsi_Nein_15_01"); //Ich denk drüber nach.
	AI_Output(other,self,"DIA_Joru_JoinPsi_Nein_15_01"); //Rozmyslím si to.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
//	B_LogEntry(CH1_JoinPsi,"Joru would like to have my daily ration of swampweed I get from Fortuno.");
//	B_LogEntry(CH1_JoinPsi,"Joru möchte meine tägliche Ration Sumpfkraut haben, die ich von Fortuno bekomme");
	B_LogEntry(CH1_JoinPsi,"Joru by chtěl můj denní příděl drogy z bažin, kterou jsem dostal od Fortuna.");

	Info_ClearChoices(DIA_Joru_JoinPsi);
};

// **************************************************
// SUCCESS
// **************************************************

instance DIA_Joru_JointsRunning(C_INFO)
{
	npc = Nov_1305_Joru;
	nr = 5;
	condition = DIA_Joru_JointsRunning_Condition;
	information = DIA_Joru_JointsRunning_Info;
	permanent = 1;
//	description = "I have swampweed on me. You can have it.";
//	description = "Ich habe Sumpfkraut bei mir. Du kannst es haben.";
	description = "Mám svoji drogu z bažin. Můžeš ji mít.";
};                       

func int DIA_Joru_JointsRunning_Condition()
{
	if (Joru_BringJoints == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Joru_JointsRunning_Info()
{
//	AI_Output(other,self,"DIA_Joru_JointsRunning_15_00"); //I have swampweed on me. You can have it.
//	AI_Output(other,self,"DIA_Joru_JointsRunning_15_00"); //Ich habe Sumpfkraut bei mir. Du kannst es haben.
	AI_Output(other,self,"DIA_Joru_JointsRunning_15_00"); //Mám svoji drogu z bažin. Můžeš ji mít.

	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
//		AI_Output(self,other,"DIA_Joru_JointsRunning_07_01"); //Good! You must have noticed that none of the Gurus wants to talk to you.
//		AI_Output(self,other,"DIA_Joru_JointsRunning_07_01"); //Gut! Du hast sicher schon bemerkt, dass so gut wie keiner der Gurus mit dir reden will.
		AI_Output(self,other,"DIA_Joru_JointsRunning_07_01"); //Dobře! Jistě sis všimnul, že s tebou nikdo z Guru nechce mluvit.
//		AI_Output(self,other,"DIA_Joru_JointsRunning_07_02"); //You can change that by impressing them. I can tell you how to do that.
//		AI_Output(self,other,"DIA_Joru_JointsRunning_07_02"); //Du kannst das ändern, indem du sie beeindruckst. Ich kann dir verraten, wie du das anstellst.
		AI_Output(self,other,"DIA_Joru_JointsRunning_07_02"); //Můžeš to změnit tím, že na ně uděláš dojem. Můžu ti říci, jak to udělat.

		B_GiveInvItems(other,self,itmijoint_2, 3);

		Joru_BringJoints = LOG_SUCCESS; 
		B_GiveXP(XP_WeedForJoru);
	}
	else
	{
//		AI_Output(self,other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //We agreed on three Northern Dark and nothing else! Get me the weeds, THEN we can do business!
//		AI_Output(self,other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Drei Schwarzer Weiser waren ausgemacht, und nichts anderes! Besorg mir erst das Kraut, DANN sind wir im Geschäft!
		AI_Output(self,other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Domluvili jsme si tři Severní soumraky a nic jiného! Dej mi je a POTOM se můžeme bavit!
	}; 
};

// **************************************************
// Wie kann ich Gurus beeindrucken?
// **************************************************
	var int Joru_Tips;
// **************************************************

instance DIA_Joru_ImpressGurus(C_INFO)
{
	npc = Nov_1305_Joru;
	nr = 5;
	condition = DIA_Joru_ImpressGurus_Condition;
	information = DIA_Joru_ImpressGurus_Info;
	permanent = 1;
//	description = "How can I impress the Gurus?";
//	description = "Wie kann ich die Gurus beeindrucken?";
	description = "Jak můžu udělat dojem na Guru?";
};                       

func int DIA_Joru_ImpressGurus_Condition()
{
	if (Joru_BringJoints == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Joru_ImpressGurus_Info()
{
//	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_00"); //How can I impress the Gurus?
//	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_00"); //Wie kann ich die Gurus beeindrucken?
	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_00"); //Jak můžu udělat dojem na Guru?
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar instructs the novices in the magic of the Sleeper.
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar unterrichtet die Novizen in der Magie des Schläfers.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar cvičí novice ve Spáčově magii.
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_02"); //If you want his attention, use magic.
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_02"); //Wenn du seine Aufmerksamkeit willst, wende Magie an.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_02"); //Jestliže chceš upoutat jeho pozornost, použij kouzlo.
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_03"); //But don't give him the Fist of Wind! Send one of his audience to sleep or something like that.
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_03"); //Aber blas ihm keine Windfaust um die Ohren! Versetze einen seiner Zuhörer in Schlaf oder so was.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_03"); //Nepoužívej však na něj Větrnou pěst! Uspi jeho posluchače nebo něco takového.
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib is over there at the main gate. He's one of the toughest guys. I think Lester might be able to help you with him. Speak to him as soon as his master is away.
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib vorne am Haupttor ist einer der harten Brocken. Ich denke, bei ihm kann dir Lester helfen. Sprich ihn drauf an, wenn sein Meister gerade nicht dabei ist.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib, za hlavní branou, je jeden z nejtvrdších. Myslím, že by ti s ním mohl pomoci Lester. Promluv s ním, jakmile bude jeho pán pryč.
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_05"); //The other Gurus are basically quite okay - just try to make yourself useful.
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_05"); //Die anderen Gurus sind eigentlich ganz in Ordnung - versuch dich einfach nützlich zu machen.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_05"); //Ostatní Guru jsou vcelku v pohodě - snaž se být užitečný.
//	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_06"); //Thanks for the advice.
//	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_06"); //Danke für die Tipps.
	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_06"); //Díky za radu.
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_07"); //Hey - a deal's a deal.
//	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_07"); //Hey - eine Hand wäscht die andere.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_07"); //Hej - dohoda je dohoda.

	if ( Joru_JoinPsi == FALSE)
	{
//		B_LogEntry(CH1_JoinPsi,"In order to impress Baal Cadar I have to cast a sleeping spell on one of his listeners.");
//		B_LogEntry(CH1_JoinPsi,"Um Baal Cadar zu beeindrucken muss ich auf einen seiner Zuhörer einen Schlafzauber legen.");
		B_LogEntry(CH1_JoinPsi,"Abych udělal dojem na Baala Cadara, musel jsem seslat na jednoho z jeho posluchačů spací kouzlo.");
//		B_LogEntry(CH1_JoinPsi,"I shall ask the novice Lester how to impress Baal Namib at the main gate. I should make sure no Guru is nearby, though!");
//		B_LogEntry(CH1_JoinPsi,"Wie man Baal Namib am Haupttor beeindrucken kann, soll ich den Novizen Lester fragen. Allerdings nicht in der Nähe des Gurus!");
		B_LogEntry(CH1_JoinPsi,"Zeptám se novice Lestera, jak udělat dojem na Baala Namiba přebývajícího u hlavní brány. Měl bych se ujistit, že není v blízkosti žádný guru!");
		Joru_JoinPsi = TRUE;
	};

	Joru_Tips = TRUE;
};

// **************************************************
// Woher Magie?
// **************************************************

instance DIA_Joru_GetMagic(C_INFO)
{
	npc = Nov_1305_Joru;
	nr = 5;
	condition = DIA_Joru_GetMagic_Condition;
	information = DIA_Joru_GetMagic_Info;
	permanent = 1;
//	description = "How do I get at the magic of the Sleeper?";
//	description = "Wie komme ich an die Magie des Schläfers?";
	description = "Jak se dostanu ke Spáčově magii?";
};                       

func int DIA_Joru_GetMagic_Condition()
{
	if (Joru_Tips == TRUE)
	{
		return 1;
	};
};

func void DIA_Joru_GetMagic_Info()
{
	if (Joru_Tips_Mage == FALSE)
	{
		Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
//		B_LogEntry(GE_TraderPSI,"Baal Cadar sells RUNES and SCROLLS.");
//		B_LogEntry(GE_TraderPSI,"Baal Cadar verkauft RUNEN und SPRUCHROLLEN");
		B_LogEntry(GE_TraderPSI,"Baal Cadar prodává RUNY a SVITKY.");
		Joru_Tips_Mage =TRUE;
	};
//	AI_Output(other,self,"DIA_Joru_GetMagic_15_00"); //How do I get at the magic of the Sleeper?
//	AI_Output(other,self,"DIA_Joru_GetMagic_15_00"); //Wie komme ich an die Magie des Schläfers?
	AI_Output(other,self,"DIA_Joru_GetMagic_15_00"); //Jak se dostanu ke Spáčově magii?
//	AI_Output(self,other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar sells runes and spell scrolls. That's no use to you if he doesn't talk to you, right?
//	AI_Output(self,other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar verkauft Runen und Spruchrollen. Aber das nützt dir ja nicht viel, wenn er nicht mit dir redet, richtig?
	AI_Output(self,other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar prodává runy a zaříkávací svitky. Ale to je ti vlastně k ničemu, dokud si s ním nepromluvíš, že?
//	AI_Output(self,other,"DIA_Joru_GetMagic_07_02"); //Maybe another Guru can help you.
//	AI_Output(self,other,"DIA_Joru_GetMagic_07_02"); //Vielleicht kann einer der anderen Gurus dir helfen.
	AI_Output(self,other,"DIA_Joru_GetMagic_07_02"); //Možná ti pomůže jiný Guru.
};

/*
Sit_1_PSI_Joru_SmokingTeacher

Joru: Du bist neu hier. Hast Du schon unser Kraut genossen?
Das solltest du unbedingt tun. Weißt du, es ist ziemlich gut. Es öffnet deinen Geist für die Worte des Schläfers.
Komm, komm zu uns und lasse deinen Geist frei. Mach dich bereit für eine Reise.
Eine spirituelle Reise. Lerne die Macht des Geistes zu nutzen. Lerne sie zu kontrollieren.
Komm zu uns in die Gemeinschaft der Erwachten und gleichzeitig Erwecker. Teile mit uns deine Kraft, wie wir unsere Kraft mit dir teilen.
Mach dich frei von Suche und beginne zu finden. Entdecke die Wahrheit. Das alles kannst du erreichen, wenn du zu uns kommst.

*/ 

