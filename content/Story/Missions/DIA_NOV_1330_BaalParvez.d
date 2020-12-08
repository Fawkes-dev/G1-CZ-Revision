// **************************************************
//  EXIT 
// **************************************************

instance DIA_BaalParvez_EXIT(C_INFO)
{
	npc = NOV_1330_BaalParvez;
	nr = 999;
	condition = DIA_BaalParvez_EXIT_Condition;
	information = DIA_BaalParvez_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// Erste Begrüssung
// **************************************************

instance DIA_BaalParvez_Greet(C_INFO)
{
	npc = NOV_1330_BaalParvez;
	nr = 1;
	condition = DIA_BaalParvez_Greet_Condition;
	information = DIA_BaalParvez_Greet_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_BaalParvez_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_BaalParvez_Greet_Info()
{
//	AI_Output(self,other,"DIA_BaalParvez_Greet_10_00"); //The Sleeper be with you, stranger!
//	AI_Output(self,other,"DIA_BaalParvez_Greet_10_00"); //Der Schläfer sei mit dir, Fremder!
	AI_Output(self,other,"DIA_BaalParvez_Greet_10_00"); //Spáč s tebou, cizinče!
//	AI_Output(self,other,"DIA_BaalParvez_Greet_10_01"); //I'm here to guide you onto the right path.
//	AI_Output(self,other,"DIA_BaalParvez_Greet_10_01"); //Ich bin hier, um dich auf den rechten Weg zu führen.
	AI_Output(self,other,"DIA_BaalParvez_Greet_10_01"); //Jsem tady, abych tě přivedl na správnou cestu.
};

// **************************************************
// Rechter Weg
// **************************************************

instance DIA_BaalParvez_RightWay(C_INFO)
{
	npc = NOV_1330_BaalParvez;
	nr = 1;
	condition = DIA_BaalParvez_RightWay_Condition;
	information = DIA_BaalParvez_RightWay_Info;
	permanent = 0;
//	description = "And which is the right path?";
//	description = "Und was ist der rechte Weg?";
	description = "A jaká je ta správná cesta?";
};                       

func int DIA_BaalParvez_RightWay_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

func void DIA_BaalParvez_RightWay_Info()
{
//	AI_Output(other,self,"DIA_BaalParvez_RightWay_15_00"); //And which is the right path?
//	AI_Output(other,self,"DIA_BaalParvez_RightWay_15_00"); //Und was ist der rechte Weg?
	AI_Output(other,self,"DIA_BaalParvez_RightWay_15_00"); //A jaká je ta správná cesta?
//	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_01"); //The path of the Sleeper. He alone has the power to set us free.
//	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_01"); //Der Weg des Schläfers. Er allein hat die Macht, uns von hier zu befreien.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_01"); //Cesta Spáčova. On sám je tou silou, která nás osvobodí.
//	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_02"); //The Gurus are preparing a great invocation in our camp - they want to get in contact with the Sleeper.
//	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_02"); //Im unserem Lager bereiten die Gurus eine große Beschwörung vor - sie wollen mit dem Schläfer in Kontakt treten.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_02"); //Guru připravují v našem táboře velké vzývání - chtějí navázat spojení se Spáčem.
//	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_03"); //So far he's just talked to us in visions - but now it's time to get in touch with him.
//	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_03"); //Bisher hat er nur durch Visionen zu uns gesprochen - aber jetzt ist die Zeit gekommen, mit ihm Kontakt aufzunehmen.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_03"); //Dosud k nám promlouval jen ve vizích - ale teď nastal čas, kdy s ním vstoupíme ve spojení.
//	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_04"); //We'll need as many supporters as possible for that. By focusing our spiritual power, we'll get through to him.
//	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_04"); //Wir brauchen dazu so viele Anhänger wie möglich. Durch unsere gebündelte geistige Kraft werden wir zu ihm durchdringen.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_04"); //Budeme k tomu potřebovat co nejvíce pomocníků. Když budem soustředit své duchovní síly, pak se k němu jejich prostřednictvím dostaneme.
//	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_05"); //Our camp is some distance away, in the swamp - I can take you there though, if you want.
//	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_05"); //Unser Lager liegt etwas weiter entfernt in den Sümpfen - Ich kann dich aber hinbringen, falls du es wünschst.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_05"); //Náš tábor je odsud dost daleko, v bažinách - jestli chceš, můžu tě tam dovést.
};

// **************************************************
// Vorteile für mich
// **************************************************

instance DIA_BaalParvez_MyAdvantage(C_INFO)
{
	npc = NOV_1330_BaalParvez;
	nr = 1;
	condition = DIA_BaalParvez_MyAdvantage_Condition;
	information = DIA_BaalParvez_MyAdvantage_Info;
	permanent = 0;
//	description = "What would be the benefit of joining you?";
//	description = "Was hätte ich davon, mich euch anzuschließen?";
	description = "Co z toho budu mít, když se k vám přidám?";
};                       

func int DIA_BaalParvez_MyAdvantage_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

func void DIA_BaalParvez_MyAdvantage_Info()
{
//	AI_Output(other,self,"DIA_BaalParvez_MyAdvantage_15_00"); //What would be the benefit of joining you?
//	AI_Output(other,self,"DIA_BaalParvez_MyAdvantage_15_00"); //Was hätte ich davon, mich euch anzuschließen?
	AI_Output(other,self,"DIA_BaalParvez_MyAdvantage_15_00"); //Co z toho budu mít, když se k vám přidám?
//	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_01"); //Maybe you're one of the chosen people who receive the gift of magic from the Sleeper.
//	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_01"); //Vielleicht bist du einer der Auserwählten, denen der Schläfer die Gabe der Magie verleiht.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_01"); //Možná se staneš jedním z vyvolených lidí, kteří od Spáče dostanou dar magie.
//	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_02"); //Or you might obtain the highest honors and become a templar. Only the best fighters among us can obtain that position.
//	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_02"); //Oder du erreichst die höchsten Ehren und wirst zum Templer berufen. Nur die besten Kämpfer unter uns dürfen diese Position bekleiden.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_02"); //Nebo se ti možná dostane nejvyšší pocty a staneš se templářem. Jen ti nejlepší bojovníci z nás můžou získat takové postavení.
//	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_03"); //If the Sleeper is with you, you can even combine both - the best of the templars receive the gift of magic as well.
//	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_03"); //Wenn der Schläfer mit dir ist, kannst du sogar beides kombinieren - die besten unter den Templern haben nämlich auch die Gabe der Magie.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_03"); //Pokud bude Spáč s tebou, můžeš dokonce spojit obojí - nejlepší z templářů dostanou také dar magie.
//	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_04"); //You see, our Brotherhood has a lot of possibilities for you.
//	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_04"); //Du siehst, in unserer Bruderschaft gibt es viele Möglichkeiten für dich.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_04"); //Vidíš, naše Bratrstvo ti nabízí spoustu příležitostí.
//	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_05"); //You should be aware of that before you decide on joining any other camp!
//	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_05"); //Überzeuge dich selbst davon, bevor du dich vorschnell für ein anderes Lager entscheidest!
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_05"); //Měl bys to zvážit, než se rozhodneš pro jiný tábor!
};

// **************************************************
// Schläfer
// **************************************************

instance DIA_BaalParvez_Sleeper(C_INFO)
{
	npc = NOV_1330_BaalParvez;
	nr = 2;
	condition = DIA_BaalParvez_Sleeper_Condition;
	information = DIA_BaalParvez_Sleeper_Info;
	permanent = 0;
//	description = "Who's the Sleeper?";
//	description = "Wer ist der Schläfer?";
	description = "Kdo je ten Spáč?";
};                       

func int DIA_BaalParvez_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

func void DIA_BaalParvez_Sleeper_Info()
{
//	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_00"); //Who's the Sleeper?
//	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_00"); //Wer ist der Schläfer?
	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_00"); //Kdo je ten Spáč?
//	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_01"); //The Sleeper speaks to us through dreams and visions.
//	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_01"); //Der Schläfer spricht zu uns durch unsere Träume und Visionen.
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_01"); //Spáč k nám promlouvá prostřednictvím snů a vidin.
//	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_02"); //He has been leading us ever since he first made contact with Y'Berion five years ago.
//	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_02"); //Seit er vor fünf Jahren das erste Mal mit Y'Berion in Kontakt trat, hat er uns geleitet.
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_02"); //Od té doby, co s ním Y´Berion poprvé před pěti lety vstoupil do spojení, nás stále vede.
//	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_03"); //All the followers of the Brotherhood have renounced the three gods. We pray only to the Sleeper for salvation.
//	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_03"); //Alle Anhänger der Bruderschaft haben dem Glauben an die drei Götter abgeschworen. Wir bitten nur noch den Schläfer um Erlösung.
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_03"); //Všichni přívrženci Bratrstva se zřekli tří bohů. Modlíme se za spásu jenom ke Spáčovi.
//	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_04"); //Salvation from what?
//	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_04"); //Erlösung wovon?
	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_04"); //Spásu od čeho?
//	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_05"); //From this goddamn place, of course! The Sleeper will show us the way to freedom!
//	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_05"); //Na, von diesem gottverdammten Ort hier! Der Schläfer wird uns den Weg in die Freiheit weisen!
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_05"); //Od tohohle zpropadeného místa, přece! Spáč nám ukáže cestu ke svobodě!
};

// **************************************************
// Was hat Schläfer zu euch gesagt?
// **************************************************

instance DIA_BaalParvez_SleeperSaid(C_INFO)
{
	npc = NOV_1330_BaalParvez;
	nr = 2;
	condition = DIA_BaalParvez_SleeperSaid_Condition;
	information = DIA_BaalParvez_SleeperSaid_Info;
	permanent = 0;
//	description = "What did the Sleeper tell you?";
//	description = "Was hat euch der Schläfer gesagt?";
	description = "Co vám Spáč říká?";
};                       

func int DIA_BaalParvez_SleeperSaid_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

func void DIA_BaalParvez_SleeperSaid_Info()
{
//	AI_Output(other,self,"DIA_BaalParvez_SleeperSaid_15_00"); //What did the Sleeper tell you?
//	AI_Output(other,self,"DIA_BaalParvez_SleeperSaid_15_00"); //Was hat euch der Schläfer gesagt?
	AI_Output(other,self,"DIA_BaalParvez_SleeperSaid_15_00"); //Co vám Spáč říká?
//	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_01"); //He guided us to the swamp, to the old temple ruins. That's where we built our camp.
//	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_01"); //Er hat uns in den Sumpf geführt, zu den alten Tempelruinen. Dort haben wir unser Lager errichtet.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_01"); //Dovedl nás k bažinám, ke zřícenině starého chrámu. Tam jsme vybudovali náš tábor.
//	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_02"); //He gave us independence - none of us need to labor in the mines.
//	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_02"); //Er hat uns die Unabhängigkeit gegeben - keiner von uns muss mehr in den Minen schuften.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_02"); //Dal nám nezávislost - nikdo z nás nemusí pracovat v dolech.
//	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_03"); //He showed us what swampweed can do. We sell it to the other camps, and in exchange we get everything we need.
//	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_03"); //Er hat uns die Wirkung des Sumpfkrauts gezeigt. Wir verkaufen es an die anderen Lager und bekommen dafür alles, was wir brauchen.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_03"); //Ukázal nám, co dokáže droga z bažin. Prodáváme ji do ostatních táborů a měníme ji za to, co potřebujeme.
//	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_04"); //And he gave some of us the gift of magic. Of an old and powerful magic which is different from the one the magicians of the realm use.
//	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_04"); //Und er gab einigen von uns die Gabe der Magie. Einer alten, mächtigen Magie, verschieden von der, die die Magier des Reiches anwenden.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_04"); //A některým z nás předal dar magie. Stará a mocná kouzla, která se liší od těch, která používají mágové této říše.
};

// **************************************************
// Erzähl mir von der MAgie des Schläfers
// **************************************************

instance DIA_BaalParvez_PSIMagic(C_INFO)
{
	npc = NOV_1330_BaalParvez;
	nr = 4;
	condition = DIA_BaalParvez_PSIMagic_Condition;
	information = DIA_BaalParvez_PSIMagic_Info;
	permanent = 0;
//	description = "Tell me about the magic of the Sleeper.";
//	description = "Erzähl mir von der Magie des Schläfers.";
	description = "Povídej mi o Spáčově magii.";
};                       

func int DIA_BaalParvez_PSIMagic_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

func void DIA_BaalParvez_PSIMagic_Info()
{
//	AI_Output(other,self,"DIA_BaalParvez_PSIMagic_15_00"); //Tell me about the magic of the Sleeper.
//	AI_Output(other,self,"DIA_BaalParvez_PSIMagic_15_00"); //Erzähl mir von der Magie des Schläfers.
	AI_Output(other,self,"DIA_BaalParvez_PSIMagic_15_00"); //Povídej mi o Spáčově magii.
//	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_01"); //This gift enables you to control things with the power of your mind.
//	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_01"); //Diese Gabe verleiht die Fähigkeit, Dinge mit der Kraft deines Willens zu kontrollieren.
	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_01"); //Ten dar nám umožňuje řídit věci silou vlastní mysli.
//	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_02"); //Only the Gurus of our Brotherhood have been initiated into the secrets of this magic.
//	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_02"); //Nur die Gurus unserer Bruderschaft sind in die Geheimnisse dieser Magie eingeweiht.
	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_02"); //Do tajů tohoto kouzla byli zasvěceni jen Guru našeho Bratrstva.
};

// **************************************************
// GotoNewcamp
// **************************************************
	var int BaalParvez_GotoPSI_Day;
// **************************************************

instance DIA_BaalParvez_GotoPSI(C_INFO)
{
	npc = NOV_1330_BaalParvez;
	nr = 800;
	condition = DIA_BaalParvez_GotoPSI_Condition;
	information = DIA_BaalParvez_GotoPSI_Info;
	permanent = 1;
//	description = "Take me to your camp. I want to have a look at it!";
//	description = "Bring mich zu eurem Lager. Das will ich mir ansehen!";
	description = "Vezmi mě do vašeho tábora. Chci si ho prohlédnout.";
};                       

func int DIA_BaalParvez_GotoPSI_Condition()
{
	if (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_KnowsInfo(hero,DIA_BaalParvez_RightWay))
	&& (Npc_GetDistToWP(self,"PATH_OC_PSI_18")>5000)
	&& !Npc_KnowsInfo(hero,DIA_BaalParvez_AtPSI)
	{
		return 1;
	};
};

func void DIA_BaalParvez_GotoPSI_Info()
{
//	AI_Output(other,self,"DIA_BaalParvez_GotoPSI_15_00"); //Take me to your camp. I want to have a look at it!
//	AI_Output(other,self,"DIA_BaalParvez_GotoPSI_15_00"); //Bring mich zu eurem Lager. Das will ich mir ansehen!
	AI_Output(other,self,"DIA_BaalParvez_GotoPSI_15_00"); //Vezmi mě do vašeho tábora. Chci si ho prohlédnout.
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
			Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
		};
//		B_LogEntry(CH1_JoinPsi,"Baal Parvez is a missionary of the Brotherhood. He stays in the Old Camp to look out for new believers in the SLEEPER! He offered to accompany me to the swamp camp, the home of the Brotherhood.");
//		B_LogEntry(CH1_JoinPsi,"Baal Parvez, ein Missionar der Bruderschaft sucht im Alten Lager nach neuen Anhängern für ihren Glauben an den SCHLÄFER! Er bot mir an, mich zum Sumpflager, der Heimat der Bruderschaft zu geleiten.");
		B_LogEntry(CH1_JoinPsi,"Baal Parvez, misionář Bratrstva, hledá ve Starém táboře nové věřící pro SPÁČE! Nabídl mi doprovod do Tábora v bažinách, domova bratrstva.");
		Psi_Walk = 1;
	};
//	AI_Output(self,other,"DIA_BaalParvez_GotoPSI_10_01"); //Very good! I'll go ahead. Follow me!
//	AI_Output(self,other,"DIA_BaalParvez_GotoPSI_10_01"); //Sehr gut! Ich werde vorangehen. Folge mir!
	AI_Output(self,other,"DIA_BaalParvez_GotoPSI_10_01"); //Velmi dobře! Půjdu napřed. Následuj mě!

	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_SetRefuseTalk (self,300);

	AI_StopProcessInfos(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
// AM PSICAMP ANGEKOMMEN
// **************************************************

instance DIA_BaalParvez_AtPSI(C_INFO)
{
	npc = NOV_1330_BaalParvez;
	nr = 1;
	condition = DIA_BaalParvez_AtPSI_Condition;
	information = DIA_BaalParvez_AtPSI_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_BaalParvez_AtPSI_Condition()
{
	if (Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18")) 
	{
		return 1;
	};
};

func void DIA_BaalParvez_AtPSI_Info()
{
	if (BaalParvez_GotoPSI_Day > (Wld_GetDay()-2))
	{ 
//		AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_00"); //Here we are. Down there lies the camp of the Brotherhood.
//		AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_00"); //Wir sind angekommen. Dort unten liegt das Lager der Bruderschaft.
		AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_00"); //Tak tady jsme... Dole leží tábor Bratrstva.
	}
	else
	{
//		AI_Output(self,other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //You've taken your time, brother! Down there you see the Camp.
//		AI_Output(self,other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Du hast dir viel Zeit gelassen, Bruder! Da unten siehst du das Lager.
		AI_Output(self,other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Dal sis na čas, bratře! Támhle dole je tábor.
	};
//	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_01"); //Go through the gate and speak to my brothers. I'm sure you haven't come here for nothing.
//	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_01"); //Geh durch das Tor und rede mit meinen Brüdern. Ich bin sicher, dass du den Weg nicht umsonst gemacht hast.
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_01"); //Projdi branou a promluv s mými bratry. Doufám, žes sem nepřišel pronic zanic.
//	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_02"); //Ask for Cor Kalom. He's in charge of the novices and tutors.
//	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_02"); //Frag nach Cor Kalom. Er hat die Aufsicht über die Novizen und die Lehrer.
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_02"); //Zeptej se na Cora Kaloma. Stará se o novice a žáky.
//	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_03"); //I'll go back to the Old Camp - there are still many infidels who need to be guided to the right path.
//	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_03"); //Ich gehe zurück ins alte Lager - es gibt noch viele Unwissende, die auf den richtigen Weg gebracht werden müssen.
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_03"); //Já se vrátím do Starého tábora - je tam pořád dost nevěrců, kteří potřebují navést na správnou cestu.
//	AI_Output(other,self,"DIA_BaalParvez_AtPSI_15_04"); //Good luck.
//	AI_Output(other,self,"DIA_BaalParvez_AtPSI_15_04"); //Viel Glück.
	AI_Output(other,self,"DIA_BaalParvez_AtPSI_15_04"); //Hodně štěstí.

	self.aivar[AIV_PARTYMEMBER] = FALSE;

//	B_LogEntry(CH1_JoinPsi,"The Swamp Camp is below me. My companion advised me to talk to Cor Kalom. He is the head of the novices and tutors.");
//	B_LogEntry(CH1_JoinPsi,"Das Sumpflager erstreckt sich unter mir. Mein Wegbegleiter empfahl mir, mit dem Guru Cor Kalom zu sprechen. Er ist der Aufseher über die Novizen und Lehrer.");
	B_LogEntry(CH1_JoinPsi,"Tábor v bažinách je pode mnou. Můj společník mi poradil, abych si promluvil s Cor Kalomem. Je vůdcem a učitelem noviců.");
	B_GiveXP(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self,"START");
};

