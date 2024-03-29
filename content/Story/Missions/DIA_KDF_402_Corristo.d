instance KDF_402_Corristo_Exit(C_INFO)
{
	npc = KDF_402_Corristo;
	nr = 999;
	condition = KDF_402_Corristo_Exit_Condition;
	information = KDF_402_Corristo_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int KDF_402_Corristo_Exit_Condition()
{
	return TRUE;
};

func void KDF_402_Corristo_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ************************ Intruder **************************

instance Info_Corristo_Intruder(C_INFO)
{
	npc = KDF_402_Corristo;
	nr = 1;
	condition = Info_Corristo_Intruder_Condition;
	information = Info_Corristo_Intruder_Info;
	permanent = 1;
	important = 1;
};

func int Info_Corristo_Intruder_Condition()
{
	if Npc_IsInState(self,ZS_Talk)
	&& ((!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) && (CorKalom_BringMCQBalls != LOG_SUCCESS))
	{
		return 1;
	};
};

func void Info_Corristo_Intruder_Info()
{
//	AI_Output(self,other,"Info_Saturas_Intruder_14_00"); //What are you doing here? You've no business here! Scram!
//	AI_Output(self,other,"Info_Saturas_Intruder_14_00"); //Was machst du hier? Du hast hier nichts zu suchen! Verschwinde!
	AI_Output(self,other,"Info_Saturas_Intruder_14_00"); //Co tady děláš? Tady nemáš co pohledávat! Zmiz!

	AI_StopProcessInfos(self);
};

//--------------------------------------------------------------------------
// 							ÜBER DIE MAGIER
//--------------------------------------------------------------------------
instance KDF_402_Corristo_EXPLAINMAGE(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_EXPLAINMAGE_Condition;
	information = KDF_402_Corristo_EXPLAINMAGE_Info;
	important = 0;
	permanent = 0;
//	description = "Tell me - what is it like to be a magician.";
//	description = "Erzähl mir, wie ist es, ein Magier zu sein.";
	description = "Řekni mi - jaké to je být mágem.";
};

func int KDF_402_Corristo_EXPLAINMAGE_Condition()
{
	if (!Npc_KnowsInfo(hero,KDF_402_Corristo_WANNBEKDF))
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};

};
func void KDF_402_Corristo_EXPLAINMAGE_Info()
{
//	AI_Output(other,self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01"); //Tell me - what is it like to be a magician.
//	AI_Output(other,self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01"); //Erzähl mir, wie ist es, ein Magier zu sein.
	AI_Output(other,self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01"); //Řekni mi - jaké to je, být mágem.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02"); //We are Magicians of Fire. We are the servants of Innos, the highest of all gods.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02"); //Wir sind die Magier des Feuers. Die Diener von Innos, dem obersten aller Götter.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02"); //Jsme mágové Ohně. Jsme služebníci Innose, nejvyššího ze všech bohů.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03"); //Our magic is a gift from the gods. We've been chosen to act as priests, tutors and judges.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03"); //Unsere Magie ist ein Geschenk der Götter. Wir sind auserwählt, zugleich Priester, Lehrer und Richter zu sein.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03"); //Naše kouzla jsou dar boží. Byli jsme zvoleni, abychom působili jako kněží, učitelé a soudci.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04"); //It is a gift which is a constant burden to us. A task which determines our lives.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04"); //Ein Geschenk, das zugleich eine Bürde ist. Ein Amt, das unser Leben bestimmt.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04"); //Je to dar, který je naším trvalým břemenem. Úkolem, který určuje naše životy.
};
//--------------------------------------------------------------------------
// 							MAGIERAUFNAHME
//--------------------------------------------------------------------------
instance KDF_402_Corristo_WANNBEKDF(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_WANNBEKDF_Condition;
	information = KDF_402_Corristo_WANNBEKDF_Info;
	important = 0;
	permanent = 1;
//	description     = "I'd like to enter the magic Circle.";
//	description     = "Ich möchte in den Kreis der Magier aufgenommen werden";
	description     = "Chtěl bych vstoupit do magického Kruhu.";
};

func int KDF_402_Corristo_WANNBEKDF_Condition()
{
	if ((CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE))
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};
};
func void KDF_402_Corristo_WANNBEKDF_Info()
{
//	AI_Output(other,self,"KDF_402_Corristo_WANNBEKDF_Info_15_01"); //I'd like to enter the magic Circle.
//	AI_Output(other,self,"KDF_402_Corristo_WANNBEKDF_Info_15_01"); //Ich möchte in den Kreis der Magier aufgenommen werden.
	AI_Output(other,self,"KDF_402_Corristo_WANNBEKDF_Info_15_01"); //Chtěl bych vstoupit do magického Kruhu.
//	AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_02"); //So you want to become a Magician of the Circle of Fire? Hm...
//	AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_02"); //Du willst also ein Magier des Feuers werden? Hm....
	AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_02"); //Tak ty se chceš stát mágem Kruhu ohně? Hm...

	if (hero.level < 10)
	{
//		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //You are not ready yet. Come back when you've learned more.
//		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Du bist noch nicht so weit. Komm erst wieder zu mir, wenn du mehr gelernt hast.
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Ještě nemáš dostatečné vědomosti. Vrať se, až budeš znát víc.

		AI_StopProcessInfos(self);
		B_PrintGuildCondition(10);
	}
	else
	{
//		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_03"); //Many have wanted to join us, but throughout the years I have only taken one as my apprentice. All the others have failed.
//		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_03"); //Schon viele wollten uns angehören und nur einen habe ich in all den Jahren zum Lehrling genommen. Alle anderen haben versagt.
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_03"); //Mnozí se k nám chtěli přidat, ale za ta léta jsem přijal jen jediného za svého učedníka. Všichni ostatní neuspěli.
//		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_05"); //Your spirit is mature and ready to join us. If you want to become a magician, I must test you first. Let me know when you're ready for the test.
//		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_05"); //Dein Geist ist reif für die Aufnahme. Wenn du Magier werden willst, dann muss ich dich zuvor prüfen. Sag mir Bescheid, wenn du dich dieser Prüfung unterziehen willst.
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_05"); //Tvoje duše je vyzrálá a připravená se k nám přidat. Jestli se chceš stát mágem, musím tě nejdříve vyzkoušet. Řekni mi, až budeš připraven na zkoušku.
		Corristo_KDFAufnahme = 1;
		KDF_402_Corristo_WANNBEKDF.permanent = 0;
		Info_ClearChoices(KDF_402_Corristo_WANNBEKDF);

		Log_CreateTopic(GE_BecomeFiremage,LOG_NOTE);
//		B_LogEntry(GE_BecomeFiremage,"Corristo has told me that he'll let me join the circle of the Magicians of Fire. But not until after he's put me to the test.");
//		B_LogEntry(GE_BecomeFiremage,"Corristo hat sich bereit erklärt, mich in den Kreis der Feuermagier aufzunehmen. Er will mich allerdings vorher auf die Probe stellen.");
		B_LogEntry(GE_BecomeFiremage,"Corristo mi řekl, že mi dovolí přidat se ke Kruhu mágů Ohně. Nejdřív však musím složit zkoušku.");
	};
};
//--------------------------------------------------------------------------
// 							DIE PROBE
//--------------------------------------------------------------------------
instance KDF_402_Corristo_KDFTEST(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_KDFTEST_Condition;
	information = KDF_402_Corristo_KDFTEST_Info;
	important = 0;
	permanent = 0;
//	description = "I'm up for it. Just test me.";
//	description = "Ich bin bereit. Stell mich auf die Probe";
	description = "Jsem připraven. Vyzkoušej mě.";
};

func int KDF_402_Corristo_KDFTEST_Condition()
{
	if (Corristo_KDFAufnahme == 1)
	{
		return TRUE;
	};

};
func void KDF_402_Corristo_KDFTEST_Info()
{
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_Info_15_01"); //I'm up for it. Just test me.
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_Info_15_01"); //Ich bin bereit. Stell mich auf die Probe.
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_Info_15_01"); //Jsem připraven. Vyzkoušej mě.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_Info_14_02"); //Good. You have served the Brotherhood in the swamp, have you not?
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_Info_14_02"); //Gut. Du hast der Bruderschaft im Sumpf einen Dienst erwiesen, richtig?
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_Info_14_02"); //Dobře. Sloužil jsi Bratrstvu u bažin, že ano?
	Info_ClearChoices(KDF_402_Corristo_KDFTEST);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Yes",KDF_402_Corristo_KDFTEST_JA);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Ja",KDF_402_Corristo_KDFTEST_JA);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Ano.",KDF_402_Corristo_KDFTEST_JA);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"No",KDF_402_Corristo_KDFTEST_NO);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Nein",KDF_402_Corristo_KDFTEST_NO);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Ne",KDF_402_Corristo_KDFTEST_NO);

};
func void KDF_402_Corristo_KDFTEST_JA()
{
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01"); //Yes.
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01"); //Ja.
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01"); //Ano.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02"); //Hmm...
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03"); //What is the name of our god?
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03"); //Wie ist der Name unseres Gottes?
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03"); //Jak se jmenuje náš bůh?
	Corristo_KDFAufnahme = 2;
	Info_ClearChoices(KDF_402_Corristo_KDFTEST);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Adanos",KDF_402_Corristo_KDFTEST_ADANOS);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Adanos",KDF_402_Corristo_KDFTEST_ADANOS);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Adanos.",KDF_402_Corristo_KDFTEST_ADANOS);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"The Sleeper",KDF_402_Corristo_KDFTEST_SLEEPER);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Der Schläfer",KDF_402_Corristo_KDFTEST_SLEEPER);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Spáč.",KDF_402_Corristo_KDFTEST_SLEEPER);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Innos",KDF_402_Corristo_KDFTEST_INNOS);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Innos",KDF_402_Corristo_KDFTEST_INNOS);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Innos.",KDF_402_Corristo_KDFTEST_INNOS);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Gomez",KDF_402_Corristo_KDFTEST_GOMEZ);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Gomez",KDF_402_Corristo_KDFTEST_GOMEZ);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Gomez.",KDF_402_Corristo_KDFTEST_GOMEZ);
};

func void KDF_402_Corristo_KDFTEST_NO()
{
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01"); //No.
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01"); //Nein.
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01"); //Ne.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02"); //Hmmm...
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03"); //We have no use for a man who denies his deeds.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03"); //Einen Mann der seine Taten verleugnet, können wir nicht gebrauchen.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03"); //Nepotřebujeme muže, který zapírá své činy.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04"); //Make yourself useful as a fighter or digger. The path of magic will remain forever closed to you.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04"); //Mach dich als Kämpfer oder Buddler nützlich. Der Weg der Magie wird dir immer verschlossen bleiben.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04"); //Buď raději užitečný jako bojovník nebo kopáč. Cesta k magii pro tebe zůstane provždy uzavřená.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};
func void KDF_402_Corristo_KDFTEST_ADANOS()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01"); //Adanos.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02"); //Hmmm...
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03"); //That is incorrect. Maybe the Guards can make use of you.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03"); //Das ist nicht richtig. Vielleicht kann dich ja die Garde gebrauchen.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03"); //To není správně. Možná by tě mohly využít stráže.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};
func void KDF_402_Corristo_KDFTEST_SLEEPER()
{
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01"); //The Sleeper.
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01"); //Der Schläfer.
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01"); //Spáč.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02"); //Hmmm...
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03"); //Looks like you've been spending too much time among the swamp brothers. Maybe you'd better stay there.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03"); //Du warst wohl zu lange bei den Sumpfbrüdern. Vielleicht wärst du besser bei ihnen geblieben.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03"); //Vypadáš jako někdo, kdo strávil příliš času mezi bratry z bažin. Možná bys měl raději zůstat tam.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};
func void KDF_402_Corristo_KDFTEST_INNOS()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01"); //Innos.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02"); //Hmmm...
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03"); //Which is the highest virtue of all?
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03"); //Was ist die höchste Tugend?
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03"); //Jaká je nejvyšší ctnost?
	Corristo_KDFAufnahme = 3;
	Info_ClearChoices(KDF_402_Corristo_KDFTEST);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"A warrior's honor.",KDF_402_Corristo_KDFTEST_FIGHT);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Die Ehre des Kämpfers",KDF_402_Corristo_KDFTEST_FIGHT);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Čest bojovníka.",KDF_402_Corristo_KDFTEST_FIGHT);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Humility in the face of magic.",KDF_402_Corristo_KDFTEST_DEMUT);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Die Demut vor der Magie",KDF_402_Corristo_KDFTEST_DEMUT);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Pokora před tváří magie.",KDF_402_Corristo_KDFTEST_DEMUT);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"The discipline of a man.",KDF_402_Corristo_KDFTEST_DISZIPLIN);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Die Disziplin des Mannes",KDF_402_Corristo_KDFTEST_DISZIPLIN);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Ukázněnost muže.",KDF_402_Corristo_KDFTEST_DISZIPLIN);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Awe of the gods.",KDF_402_Corristo_KDFTEST_EHRFURCHT);
//	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Die Ehrfurcht vor den Göttern",KDF_402_Corristo_KDFTEST_EHRFURCHT);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Bohabojnost.",KDF_402_Corristo_KDFTEST_EHRFURCHT);
};
func void KDF_402_Corristo_KDFTEST_GOMEZ()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01"); //Gomez.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02"); //Hmmm...
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03"); //I believe the Guards would be just right for you! Speak to Thorus!
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03"); //Ich glaube, die Garde wäre genau das richtige für dich! Sprich mal mit Thorus!
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03"); //Myslím, že tvé místo bude u stráží! Promluv s Thorusem!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};
//--------------------------------------------------------------------------
// 							DIE PROBE 3
//--------------------------------------------------------------------------
func void KDF_402_Corristo_KDFTEST_FIGHT()
{
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01"); //A warrior's honor.
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01"); //Die Ehre des Kämpfers.
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01"); //Čest bojovníka.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_02"); //Hmmm...
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03"); //I believe the Guards would be just right for you! Speak to Thorus!
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03"); //Ich glaube, die Garde wäre genau das Richtige für dich! Sprich mal mit Thorus!
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03"); //Myslím, že tvé místo bude u stráží! Promluv s Thorusem!
	AI_StopProcessInfos(self);

};
func void KDF_402_Corristo_KDFTEST_DEMUT()
{
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01"); //Humility in the face of magic.
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01"); //Die Demut vor der Magie.
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01"); //Pokora před tváři magie.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02"); //Hmmm...
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03"); //You have replied well and rightly. I shall teach you the art of magic.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03"); //Du hast gut und recht geantwortet. Ich werde dich die Kunst der Magie lehren.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03"); //Odpovídal jsi dobře a správně. Budu tě učit umění magie.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04"); //Follow me to the Hall of Magic, where you will take the ancient vow.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04"); //Folge mir nun zur Halle der Magie, wo du den alten Schwur leisten wirst.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04"); //Následuj mě do Sálu magie, kde složíš prastarý slib.

	AI_StopProcessInfos(self);
	Corristo_KDFAufnahme = 4;
	B_Story_Feueraufnahme();
};
func void KDF_402_Corristo_KDFTEST_DISZIPLIN()
{
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01"); //The discipline of a man.
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01"); //Die Disziplin des Mannes.
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01"); //Ukázněnost muže.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02"); //Hmmm...
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02"); //Hmmm...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02"); //Hmmm.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03"); //You have replied well and rightly. I shall teach you the art of magic.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03"); //Du hast gut und recht geantwortet. Ich werde dich die Kunst der Magie lehren.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03"); //Odpovídal jsi dobře a správně. Budu tě učit umění magie.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04"); //Follow me to the Hall of Magic, where you will take the ancient vow.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04"); //Folge mir nun zur Halle der Magie, wo du den alten Schwur leisten wirst.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04"); //Následuj mě do Sálu magie, kde složíš prastarý slib.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos(self);
	B_Story_Feueraufnahme();

};
func void KDF_402_Corristo_KDFTEST_EHRFURCHT()
{
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01"); //Awe of the gods.
//	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01"); //Die Ehrfurcht vor den Göttern.
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01"); //Bohabojnost.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02"); //Hmmm...
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03"); //You have replied well and rightly. I shall teach you the art of magic.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03"); //Du hast gut und recht geantwortet. Ich werde dich die Kunst der Magie lehren.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03"); //Odpovídal jsi dobře a správně. Budu tě učit umění magie.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04"); //Follow me to the Hall of Magic, where you will take the ancient vow.
//	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04"); //Folge mir nun zur Halle der Magie, wo du den alten Schwur leisten wirst.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04"); //Následuj mě do Sálu magie, kde složíš prastarý slib.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos(self);
	B_Story_Feueraufnahme();
};
//--------------------------------------------------------------------------
// 							DAS AUFNAHMERITUAL
//--------------------------------------------------------------------------
instance KDF_402_Corristo_AUFNAHME(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_AUFNAHME_Condition;
	information = KDF_402_Corristo_AUFNAHME_Info;
	important = 1;
	permanent = 0;
};

func int KDF_402_Corristo_AUFNAHME_Condition()
{
	if ( Npc_GetDistToWp (hero,"OCC_CHAPEL_UPSTAIRS") < 500)
	&& (Corristo_KDFAufnahme == 4)
	{
		return TRUE;
	};
};
func void KDF_402_Corristo_AUFNAHME_Info()
{
	Corristo_KDFAufnahme = 5;
	B_Story_Feueraufnahme();
	AI_UnequipWeapons(hero);
	AI_SetWalkmode(hero,NPC_WALK);
	AI_GotoNpc(hero,self);
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_01"); //We are gathered here today to ordain a servant of Fire.
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_01"); //Wir sind heute zusammengekommen, um einen Diener des Feuers zu weihen.
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_01"); //Dnes jsme se tu shromáždili, abysme vysvětili služebníka Ohně.
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_02"); //Now take the oath of Fire.
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_02"); //Schwöre nun den Eid des Feuers.
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_02"); //Teď prones přísahu ohně.
	Snd_Play("howling_01");
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_03"); //I swear by the might of the gods...
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_03"); //Ich schwöre bei den Mächten der Götter...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_03"); //Přísahám při moci boží...
//	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_04"); //I swear by the might of the gods...
//	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_04"); //Ich schwöre bei den Mächten der Götter...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_04"); //Přísahám při moci boží...
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_05"); //... I swear by the force of the holy Fire...
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_05"); //Ich schwöre bei der Macht des heiligen Feuers...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_05"); //...přísahám při moci svatého Ohně...
//	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_06"); //... I swear by the force of the holy Fire...
//	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_06"); //Ich schwöre bei der Macht des heiligen Feuers...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_06"); //...přísahám při moci svatého Ohně...
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_07"); //... that my knowledge and my deeds from now on and forever shall be one with the flame...
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_07"); //Dass mein Wissen und Handlen von nun an und auf ewig mit der Flamme verbunden sei...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_07"); //...že mé vědomosti a mé skutky vejdou od tohoto okamžiku a navždy v jednotu s ohněm...
//	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_08"); //... that my knowledge and my deeds from now on and forever shall be one with the flame...
//	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_08"); //Dass mein Wissen und Handlen von nun an und auf ewig mit der Flamme verbunden sei...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_08"); //...že mé vědomosti a mé skutky vejdou od tohoto okamžiku a navždy v jednotu s ohněm...
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_09"); //... until my body shall return to the realm of Beliar and the fire of my life be extinguished.
//	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_09"); //Bis mein Körper einkehrt in Beliars Reich und das Feuer des Lebens erlischt.
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_09"); //...dokud mé tělo nebude navráceno říši Beliarově a oheň mého života nepohasne.
//	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_10"); //... until my body shall return to the realm of Beliar and the fire of my life be extinguished.
//	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_10"); //Bis mein Körper einkehrt in Beliars Reich und das Feuer des Lebens erlischt.
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_10"); //...dokud mé tělo nebude navráceno říši Beliarově a oheň mého života nepohasne.
	AI_StopProcessInfos(self);
};
instance KDF_402_Corristo_ROBE(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_ROBE_Condition;
	information = KDF_402_Corristo_ROBE_Info;
	important = 1;
	permanent = 0;
};

func int KDF_402_Corristo_ROBE_Condition()
{
	if (Npc_KnowsInfo(hero,KDF_402_Corristo_AUFNAHME))
	{
		return TRUE;
	};
};
func void KDF_402_Corristo_ROBE_Info()
{
	Snd_Play("MFX_Heal_Cast");

	CreateInvItem(hero,KDF_ARMOR_L);

	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);

//	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_01"); //By uttering the words of the oath you have now entered into a bond with the Fire.
//	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_01"); //Mit den Worten des Schwurs, bist du den Bund mit dem Feuer eingegangen.
	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_01"); //Pronesením slov této přísahy jsi nyní vstoupil ve spojení s Ohněm.
//	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_02"); //Wear this robe as a sign of the eternal bond.
//	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_02"); //Trage diese Robe als Zeichen des ewigen Bundes.
	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_02"); //Nos toto roucho na znamení věčného svazku.
	AI_StopProcessInfos(self);
	AI_EquipBestArmor(hero);
	AI_UnequipWeapons(hero);
	Npc_SetTrueGuild(hero,GIL_KDF);
	hero.guild = GIL_KDF;

	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];

//	B_LogEntry(GE_BecomeFiremage,"I've passed the test and sworn the oath of Fire. From now on I'll wear the red robe of the Circle of Fire!");
//	B_LogEntry(GE_BecomeFiremage,"Ich habe die Probe bestanden und den Schwur des Feuers abgelegt. Fortan trage ich die rote Robe des Feuerkreises!");
	B_LogEntry(GE_BecomeFiremage,"Složil jsem zkoušku a pronesl přísahu Ohně. Nyní smím nosit roucho Kruhu ohně! ");
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
//	B_LogEntry(GE_TeacherOC,"Corristo can teach me the magic CIRCLES and increase my MANA. He's in the house of the Magicians of Fire.");
//	B_LogEntry(GE_TeacherOC,"Corristo kann mich die magischen KREISE lehren und meine MANA steigern. Er hält sich den ganzen Tag im Haus der Feuermagier auf.");
	B_LogEntry(GE_TeacherOC,"Corristo mě může naučit magické KRUHY a zvýšit moji magickou energii. Obývá dům mágů Ohně.");
};
//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance KDF_402_Corristo_MANA(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_MANA_Condition;
	information = KDF_402_Corristo_MANA_Info;
	important = 0;
	permanent = 1;
//	description = "I need more magic power.";
//	description = "Ich benötige mehr magische Kraft";
	description = "Potřebuji více magické moci.";
};

func int KDF_402_Corristo_MANA_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};

};
func void KDF_402_Corristo_MANA_Info()
{
//	AI_Output(other,self,"KDF_402_Corristo_MANA_Info_15_01"); //I need more magic power.
//	AI_Output(other,self,"KDF_402_Corristo_MANA_Info_15_01"); //Ich benötige mehr magische Kraft.
	AI_Output(other,self,"KDF_402_Corristo_MANA_Info_15_01"); //Potřebuji více magické moci.
//	AI_Output(self,other,"KDF_402_Corristo_MANA_Info_14_02"); //I can help you to increase your power. What use you make of it is your affair.
//	AI_Output(self,other,"KDF_402_Corristo_MANA_Info_14_02"); //Ich kann dir helfen, deine Kraft zu steigern. Wie du sie nutzt, liegt nur an dir.
	AI_Output(self,other,"KDF_402_Corristo_MANA_Info_14_02"); //Můžu ti pomoci zvětšit tvoji sílu. Jak ji použiješ, je už tvoje věc.

	Info_ClearChoices(KDF_402_Corristo_MANA);
	Info_AddChoice(KDF_402_Corristo_MANA,DIALOG_BACK ,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_1);
};
func void KDF_402_Corristo_MANA_BACK()
{
	Info_ClearChoices(KDF_402_Corristo_MANA);
};

func void KDF_402_Corristo_MANA_MAN_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(KDF_402_Corristo_MANA);
	Info_AddChoice(KDF_402_Corristo_MANA,DIALOG_BACK ,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_1);

};

func void KDF_402_Corristo_MANA_MAN_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(KDF_402_Corristo_MANA);
	Info_AddChoice(KDF_402_Corristo_MANA,DIALOG_BACK ,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice(KDF_402_Corristo_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_1);

};
//--------------------------------------------------------------------------
// 							ERLÄUTERUNG DER KREISE
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance KDF_402_Corristo_EXPLAINCIRCLES(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_EXPLAINCIRCLES_Condition;
	information = KDF_402_Corristo_EXPLAINCIRCLES_Info;
	important = 0;
	permanent = 0;
//	description = "Please explain the meaning of the magic Circles.";
//	description = "Erkläre mir das Wesen der magischen Kreise.";
	description = "Vysvětli mi význam kouzelných Kruhů.";
};

func int KDF_402_Corristo_EXPLAINCIRCLES_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};
func void KDF_402_Corristo_EXPLAINCIRCLES_Info()
{
//	AI_Output(other,self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01"); //Please explain the meaning of the magic Circles.
//	AI_Output(other,self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01"); //Erkläre mir das Wesen der magischen Kreise.
	AI_Output(other,self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01"); //Vysvětli mi význam kouzelných Kruhů.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02"); //Of course. The Circles symbolize your share of the magic.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02"); //Natürlich. Die Kreise symbolisieren deinen Anteil an der magischen Macht.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02"); //Jistě. Tyhle Kruhy znázorňují, že sdílíš kouzlo.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03"); //They stand for knowledge, skill and the learning of new magic spells.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03"); //Sie stehen für Wissen, Begabung und für das Erlernen neuer Zaubersprüche.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03"); //Jsou tady pro vědění, dovednost a učení nových kouzelných zaříkávadel.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04"); //You must pass through each Circle before you can join the next.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04"); //Du wirst jeden Kreis durchlaufen, bis du in den nächsten aufgenommen werden kannst.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04"); //Aby ses mohl přidat k dalšímu Kruhu, musíš projít předchozím.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05"); //Many hours of learning are required and you'll need much experience to reach the higher Circles.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05"); //Es erfordert viele Lernstunden und es bedarf hoher Erfahrung, willst du die höheren Kreise erreichen.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05"); //Vyžaduje to dlouhé učení a také budeš potřebovat získat spoustu zkušeností, než dosáhneš vyšších kruhů.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06"); //But your efforts to reach them will be rewarded with new and powerful spells each time. However, the Circles of magic are more than that.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06"); //Doch die Mühe, sie zu erlernen, wird jedes Mal mit neuen machtvollen Zaubern belohnt. Die Kreise der Magie sind aber noch mehr als das.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06"); //Ale tvoje úsilí o jejich dosažení bude pokaždé odměněno novými a mocnějšími kouzly. Kouzelné Kruhy jsou však ještě něčím více.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07"); //They are part of your life. They will always be with you. Make them part of you.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07"); //Sie sind ein Teil deines Lebens. Sie werden dich immer begleiten. Mache sie zu einem Teil von dir.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07"); //Jsou součástí života. Budou vždy s tebou. Ber je jako součást sebe sama.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08"); //To understand their might, you need to recognize your own.
//	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08"); //Ihre Macht zu verstehen, bedeutet deine eigene Macht zu erkennen.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08"); //Abys porozuměl jejich moci, musíš poznat sám sebe.
};
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance KDF_402_Corristo_KREIS1(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_KREIS1_Condition;
	information = KDF_402_Corristo_KREIS1_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0);
//	description = B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0);
	description = B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0);
};

func int KDF_402_Corristo_KREIS1_Condition()
{
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_KnowsInfo(hero,KDF_402_Corristo_EXPLAINCIRCLES))
	&& (Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};

};
func void KDF_402_Corristo_KREIS1_Info()
{
//	AI_Output(other,self,"KDF_402_Corristo_KREIS1_Info_15_01"); //I am ready to enter the First Circle.
//	AI_Output(other,self,"KDF_402_Corristo_KREIS1_Info_15_01"); //Ich bin jetzt bereit, den ersten Kreis zu erlernen.
	AI_Output(other,self,"KDF_402_Corristo_KREIS1_Info_15_01"); //Jsem připraven vstoupit do Prvního Kruhu.

	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_02"); //To enter the first of the magic Circles means learning to use magic runes.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_02"); //Den ersten der magischen Kreise zu betreten, bedeutet die Anwendung magischer Runen erlernen.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_02"); //Vstoupit do prvního z kouzelných Kruhů znamená naučit se používat kouzelné runy.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_03"); //Each rune contains the structure of a special magic spell.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_03"); //Jede Rune birgt in sich die Struktur eines speziellen Zaubers.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_03"); //Každá runa obsahuje strukturu zvláštního kouzelného zaříkávadla.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_04"); //By using your own magic powers, you'll be able to cast the magic of the rune.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_04"); //Durch den Einsatz deiner eigenen magischen Energie, bist du in der Lage, den Zauber der Rune zu wirken.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_04"); //Spolu se svými vlastními kouzelnými silami budeš schopen využívat kouzlo run.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_05"); //But in contrast to the magic scrolls, which are magic formulas as well, the magic power of the rune ensures that the structure of the spell endures.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_05"); //Doch anders als Spruchrollen, die auch eine Zauberformel sind, sorgt die magische Kraft, die der Rune innewohnt dafür, dass die Struktur des Zaubers erhalten bleibt.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_05"); //Ale narozdíl od kouzelných svitků, které jsou také kouzelnými formulemi, magická síla run zajišťuje, že struktura zaříkávadla přetrvává.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_06"); //Every rune is a source of magic power which you can fall back on anytime.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_06"); //Jede Rune ist eine Quelle magischer Kraft, auf die du immer wieder zurückgreifen kannst.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_06"); //Každá runa je zdrojem magické síly, kterou můžeš kdykoliv zase zrušit.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_07"); //Your own magic power is used up when you use a rune, just as with a spell scroll.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_07"); //Deine eigene magische Kraft verbraucht sich beim Benutzen der Rune, wie bei einer Spruchrolle.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_07"); //Svoji vlastní kouzelnou moc využiješ tehdy, když použiješ runu, podobně jako je tomu s kouzelným svitkem.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_08"); //With every Circle you enter, you learn to use further runes as well.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_08"); //Mit jedem Kreis, den du lernst, lernst du auch die Möglichkeit weitere Runen zu benutzen.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_08"); //Se vstupem do každého dalšího Kruhu se naučíš využívat také další kouzelné runy.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_09"); //Use the power of the runes to recognize yourself.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_09"); //Nutze die Kraft der Runen, um dich selber zu erkennen.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_09"); //Využij moc run k poznání sebe sama.
		KDF_402_Corristo_KREIS1.permanent = 0;
	};
};
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance KDF_402_Corristo_KREIS2(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_KREIS2_Condition;
	information = KDF_402_Corristo_KREIS2_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0);
//	description = B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0);
	description = B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0);
};

func int KDF_402_Corristo_KREIS2_Condition()
{
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild(hero) == GIL_KDF)

	{
		return TRUE;
	};

};
func void KDF_402_Corristo_KREIS2_Info()
{
//	AI_Output(other,self,"KDF_402_Corristo_KREIS2_Info_15_01"); //I am ready to enter the Second Circle.
//	AI_Output(other,self,"KDF_402_Corristo_KREIS2_Info_15_01"); //Ich möchte den zweiten Kreis erlernen.
	AI_Output(other,self,"KDF_402_Corristo_KREIS2_Info_15_01"); //Jsem připraven vstoupit do Druhého kruhu.

	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_02"); //You have learned to understand the runes. Now is the time to deepen this understanding.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_02"); //Du hast das Verständnis der Runen gelernt. Nun ist es an der Zeit, dieses Verständnis zu vertiefen.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_02"); //Naučil ses rozumět kouzelným znakům. Nadešel čas prohloubit toto porozumění.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_03"); //When you join the Second Circle you will learn the foundations of stronger battle spells, and above all the secret of healing.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_03"); //Mit dem zweiten Kreis lernst du die Grundsätze stärkerer Kampfzauber und vor allem das Geheimnis der Heilung.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_03"); //Jakmile se přidáš ke Druhému kruhu, naučíš se základům mocnějších bojových zaříkávadel a všem tajům ranhojičství.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_04"); //But you need to learn much if you want to recognize the true secrets of magic.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_04"); //Doch du musst noch viel lernen, willst du die tatsächlichen Geheimnisse der Magie ergründen.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_04"); //Budeš se ale muset naučit ještě víc, jestli chceš poznat opravdová tajemství magie.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_05"); //You know that you can use every rune as often as you like until you've used up all of your own powers.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_05"); //Du weißt, dass du jede Rune solange einsetzen kannst, bis deine eigene Kraft verbraucht ist.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_05"); //Víš, že každou runu můžeš používat jak často chceš, dokud nevyčerpáš své vlastní síly.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_06"); //But before you act, think about the point of your actions. You have obtained powers with which you may easily conjure up death and destruction.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_06"); //Aber frage dich, ob es sinnvoll ist. Du hast Macht verliehen bekommen, mit der es dir ein Leichtes ist, Tod und Verderben zu bringen.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_06"); //Než budeš jednat, rozmysli si cíl svého jednání. Nabyl jsi síly, která tě snadno může dovést k záhubě a zničení.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_07"); //But a true magician only uses magic when it is necessary.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_07"); //Doch der wahrhafte Magier zaubert nur dann, wenn es angebracht ist.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_07"); //Opravdový kouzelník ale užívá kouzla jen tehdy, když je to nezbytné.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_08"); //Understand the situation, then you'll recognize the power of the runes.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_08"); //Erkenne die Situation, dann wirst du die Macht der Runen erkennen.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_08"); //Pokud porozumíš situaci, pak poznáš moc run.
		KDF_402_Corristo_KREIS2.permanent = 0;
	};

};
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance KDF_402_Corristo_KREIS3(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_KREIS3_Condition;
	information = KDF_402_Corristo_KREIS3_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0);
//	description = B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0);
	description = B_BuildLearnString(NAME_LearnMage_3,LPCOST_TALENT_MAGE_3,0);
};

func int KDF_402_Corristo_KREIS3_Condition()
{
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild(hero) == GIL_KDF)

	{
		return TRUE;
	};

};
func void KDF_402_Corristo_KREIS3_Info()
{
//	AI_Output(other,self,"KDF_402_Corristo_KREIS3_Info_15_01"); //Could you teach me the Third Circle?
//	AI_Output(other,self,"KDF_402_Corristo_KREIS3_Info_15_01"); //Kannst du mich den dritten Kreis lehren?
	AI_Output(other,self,"KDF_402_Corristo_KREIS3_Info_15_01"); //Můžeš mě připravit do Třetího kruhu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_02"); //The Third Circle of Magic is one of the most important steps in the life of a magician. Once you've reached it, you cease to be a seeker.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_02"); //Der dritte Kreis der Magie ist einer der wichtigsten Schritte im Leben eines Magiers. Nicht länger bist du ein Suchender.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_02"); //Třetí kouzelný kruh je jedním z nejdůležitějších kroků v životě mága. Jakmile ho dosáhneš, přestáváš být hledačem.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_03"); //You have already come far on the path of magic. You have learned to use the runes.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_03"); //Du bist bereits ein Stück des magischen Weges gegangen. Du hast gelernt, die Runen zu nutzen.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_03"); //Došel jsi už po cestě magie opravdu daleko. Naučil ses používat kouzelné runy.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_04"); //This knowledge is the foundation for your further path. Use the runes with deliberation.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_04"); //Dieses Wissen ist das Fundament für deinen weiteren Weg. Nutze die Runen mit Bedacht.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_04"); //Tato znalost je východisko pro tvojí další cestu. Používej tyto runy s uvážením.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_05"); //You may use a rune or not. But you must decide on one of these possibilities.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_05"); //Du kannst eine Rune nutzen oder nicht. Aber entscheide dich für eine der Möglichkeiten.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_05"); //Runy můžeš nebo nemusíš používat. Ale musíš se rozhodnout pro jednu z těchto možností.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_06"); //Do not hesitate to use your powers as soon as you've made your choice.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_06"); //Zögere nicht, deine Macht einzusetzen, wenn du dich einmal entscheiden hast.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_06"); //Jakmile se rozhodneš, neostýchej se využít svých sil.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_07"); //Understand your path, then you'll recognize the power of the decision.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_07"); //Erkenne deinen Weg, dann wirst du die Macht der Entscheidung erkennen.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_07"); //Jakmile porozumíš své cestě, pak poznáš sílu rozhodnutí.
		KDF_402_Corristo_KREIS3.permanent = 0;
	};

};
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance KDF_402_Corristo_KREIS4(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_KREIS4_Condition;
	information = KDF_402_Corristo_KREIS4_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0);
//	description = B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0);
	description = B_BuildLearnString(NAME_LearnMage_4,LPCOST_TALENT_MAGE_4,0);
};

func int KDF_402_Corristo_KREIS4_Condition()
{
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};

};
func void KDF_402_Corristo_KREIS4_Info()
{
//	AI_Output(other,self,"KDF_402_Corristo_KREIS4_Info_15_01"); //I am ready to enter the Fourth Circle.
//	AI_Output(other,self,"KDF_402_Corristo_KREIS4_Info_15_01"); //Ich bin bereit für den vierten der Kreise.
	AI_Output(other,self,"KDF_402_Corristo_KREIS4_Info_15_01"); //Jsem připraven vstoupit do Pátého kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_02"); //You have completed the first three Circles. Now is the time for you to learn the secrets of magic.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_02"); //Du hast die ersten drei Kreise durchschritten. Nun ist es an der Zeit, dass du die Geheimnisse der Magie kennenlernst.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_02"); //Dokončil jsi první tři Kruhy. Nyní nadešel čas naučit se tajemství magie.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_03"); //The magic of the runes is based on the stone. They are magic stones, created out of magic ore.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_03"); //Die Magie der Runen ruht in ihrem Stein. Es sind magische Steine, gewonnen aus magischem Erz.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_03"); //Kouzlo run je založeno na kamenech. Existují kouzelné kameny, vytvořené z kouzelné rudy.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_04"); //It's the same ore which is collected in the mines. This ore is endowed with magic formulas in the temples. There the runes are converted to the instruments of our power.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_04"); //Das gleiche Erz, was hier abgebaut wird. Dieses Erz wird in den Tempeln mit den Formeln der Magie versehen. Dort werden sie zu den Instrumenten unserer Macht geformt.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_04"); //Z té samé rudy, která se těží tady v dolech. Tato ruda je obdařena magickými formulemi templářů. Tyto runy jsou upraveny jako nástroje naší moci.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_05"); //With the runes you control now, you have the entire knowledge of the temples of the realm at your fingertips.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_05"); //Mit allen Runen, die du nun beherrschen kannst, steht dir das gesammelte Wissen der Tempel zur Verfügung.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_05"); //S těmito runami, které už ovládáš, máš celé vědění chrámové sféry v malíčku.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_06"); //You have now learned everything I can teach you.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_06"); //Teď už víš všechno, co jsem tě mohl naučit.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_07"); //Understand the magic, then you'll discover the secret of power.
//		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_07"); //Erkenne die Magie, dann wirst du das Geheimnis von Macht erkennen.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_07"); //Jakmile porozumíš magii, objevíš tajemství moci.
		KDF_402_Corristo_KREIS4.permanent = 0;
	};
};
/*------------------------------------------------------------------------
							SCHWERE ROBE
------------------------------------------------------------------------*/

instance KDF_402_Corristo_HEAVYARMOR(C_INFO)
{
	npc = KDF_402_Corristo;
	condition = KDF_402_Corristo_HEAVYARMOR_Condition;
	information = KDF_402_Corristo_HEAVYARMOR_Info;
	important = 0;
	permanent = 1;
	description = B_BuildBuyArmorString(NAME_CorristoHighRobe,VALUE_KDF_ARMOR_H);
};

func int KDF_402_Corristo_HEAVYARMOR_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};

};
func void KDF_402_Corristo_HEAVYARMOR_Info()
{
//	AI_Output(other,self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01"); //Master, I'd like to wear the high robe of Fire.
//	AI_Output(other,self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01"); //Meister, ich möchte die hohe Robe des Feuers tragen.
	AI_Output(other,self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01"); //Mistře, chtěl bych nosit vznešené roucho Ohně.
	if (Kapitel < 3)
	{
//		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //You are not ready yet. Come back when you've learned more.
//		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Du bist noch nicht so weit. Komm erst wieder zu mir, wenn du mehr gelernt hast.
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Ještě nemáš dostatečné vědomosti. Vrať se, až budeš znát víc.
		//AI_Output(other,self,"KDF_402_Corristo_HEAVYARMOR_Info_15_02"); //Es ist noch nicht deine Zeit, die hohe Robe zu tragen. //***FALSCHE STIMME***
	}
	else if (Npc_HasItems(hero,ItMinugget)< VALUE_KDF_ARMOR_H)
	{
//		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //You don't own enough ore.
//		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Du besitzt nicht genügend Erz.
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nemáš dost rudy.
	}
	else
	{
//		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04"); //The time has come. You are worthy of wearing the high robe of Fire.
//		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04"); //Die Zeit ist gekommen. Du bist würdig, die hohe Robe des Feuers zu tragen.
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04"); //Nadešel čas. Jsi hoden nosit vznešené roucho Ohně.

		CreateInvItem(hero,KDF_ARMOR_H);

		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);

		B_GiveInvItems(hero,self,ItMinugget,VALUE_KDF_ARMOR_H);
		AI_EquipBestArmor(hero);
		KDF_402_Corristo_HEAVYARMOR.permanent = 0;
	};

};
