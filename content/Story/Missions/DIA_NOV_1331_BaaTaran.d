// **************************************************
//  EXIT 
// **************************************************

instance DIA_BaalTaran_EXIT(C_INFO)
{
	npc = NOV_1331_BaalTaran;
	nr = 999;
	condition = DIA_BaalTaran_EXIT_Condition;
	information = DIA_BaalTaran_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// Erste Begrüssung
// **************************************************

instance DIA_BaalTaran_Greet(C_INFO)
{
	npc = NOV_1331_BaalTaran;
	nr = 1;
	condition = DIA_BaalTaran_Greet_Condition;
	information = DIA_BaalTaran_Greet_Info;
	permanent = 0;
//	description = "I'm new here. Who are you?";
//	description = "Ich bin neu hier. Wer bist du?";
	description = "Jsem tady nový. Kdo jsi?";
};                       

func int DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

func void DIA_BaalTaran_Greet_Info()
{
//	AI_Output(other,self,"DIA_BaalTaran_Greet_15_00"); //I'm new here. Who are you?
//	AI_Output(other,self,"DIA_BaalTaran_Greet_15_00"); //Ich bin neu hier. Wer bist du?
	AI_Output(other,self,"DIA_BaalTaran_Greet_15_00"); //Jsem tady nový. Kdo jsi?
//	AI_Output(self,other,"DIA_BaalTaran_Greet_05_01"); //I am Baal Taran of the Brotherhood of the Sleeper.
//	AI_Output(self,other,"DIA_BaalTaran_Greet_05_01"); //Ich bin Baal Taran von der Bruderschaft des Schläfers.
	AI_Output(self,other,"DIA_BaalTaran_Greet_05_01"); //Jsem Baal Taran ze Spáčova Bratrstva.
};

// **************************************************
// Was ist Bruderschaft
// **************************************************

instance DIA_BaalTaran_Bruderschaft(C_INFO)
{
	npc = NOV_1331_BaalTaran;
	nr = 1;
	condition = DIA_BaalTaran_Bruderschaft_Condition;
	information = DIA_BaalTaran_Bruderschaft_Info;
	permanent = 0;
//	description = "What is the Brotherhood of the Sleeper?";
//	description = "Was ist die Bruderschaft des Schläfers?";
	description = "Co to je Spáčovo Bratrstvo?";
};                       

func int DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

func void DIA_BaalTaran_Bruderschaft_Info()
{
//	AI_Output(other,self,"DIA_BaalTaran_Bruderschaft_15_00"); //What is the Brotherhood of the Sleeper?
//	AI_Output(other,self,"DIA_BaalTaran_Bruderschaft_15_00"); //Was ist die Bruderschaft des Schläfers?
	AI_Output(other,self,"DIA_BaalTaran_Bruderschaft_15_00"); //Co to je Spáčovo Bratrstvo?
//	AI_Output(self,other,"DIA_BaalTaran_Bruderschaft_05_01"); //We're a community of believers in a new faith.
//	AI_Output(self,other,"DIA_BaalTaran_Bruderschaft_05_01"); //Wir sind eine Gemeinschaft von Anhängern eines neuen Glaubens.
	AI_Output(self,other,"DIA_BaalTaran_Bruderschaft_05_01"); //Jsme komunita vyznavačů nové víry.
//	AI_Output(self,other,"DIA_BaalTaran_Bruderschaft_05_02"); //Our camp is situated in the east, in the swamp. I've come to preach the words of the Sleeper to strangers like you.
//	AI_Output(self,other,"DIA_BaalTaran_Bruderschaft_05_02"); //Unser Lager liegt östlich von hier, im Sumpfgebiet. Ich bin hergekommen, um Fremden wie dir die Lehre des Schläfers zu verkünden.
	AI_Output(self,other,"DIA_BaalTaran_Bruderschaft_05_02"); //Náš tábor se rozkládá na východě v bažinách. Přišel jsem šířit Spáčovo učení cizincům, jako jsi ty.
};

// **************************************************
// Wer ist der Schläfer
// **************************************************

instance DIA_BaalTaran_Sleeper(C_INFO)
{
	npc = NOV_1331_BaalTaran;
	nr = 1;
	condition = DIA_BaalTaran_Sleeper_Condition;
	information = DIA_BaalTaran_Sleeper_Info;
	permanent = 0;
//	description = "Who is the Sleeper?";
//	description = "Wer ist der Schläfer?";
	description = "Kdo je ten Spáč?";
};                       

func int DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

func void DIA_BaalTaran_Sleeper_Info()
{
//	AI_Output(other,self,"DIA_BaalTaran_Sleeper_15_00"); //Who is the Sleeper?
//	AI_Output(other,self,"DIA_BaalTaran_Sleeper_15_00"); //Wer ist der Schläfer?
	AI_Output(other,self,"DIA_BaalTaran_Sleeper_15_00"); //Kdo je ten Spáč?
//	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_01"); //The Sleeper is our redeemer. He disclosed himself five years ago through Y'Berion, our master.
//	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_01"); //Der Schläfer ist unser Erlöser. Er hat sich uns vor 5 Jahren durch Y'Berion, unseren Meister, offenbart.
	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_01"); //Spáč je náš spasitel. Zjevil se před pěti lety skrze našeho mistra Y´Beriona.
//	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_02"); //Since then, we have all renounced the three gods. And you should do so as well.
//	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_02"); //Seitdem haben wir den drei Göttern abgeschworen. Und das solltest du auch tun.
	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_02"); //Od té doby se zříkáme tří bohů. A ty bys to měl udělat také.
//	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_03"); //The gods just stood by and watched while we were exiled to this prison. But the Sleeper will lead us to freedom.
//	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_03"); //Die Götter haben es zugelassen, dass wir in dieses Gefängnis verbannt wurden. Der Schläfer aber wird uns wieder in die Freiheit führen.
	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_03"); //Bohové dopustili, abychom byli vykázáni do tohoto vězení. Spáč nás ale dovede ke svobodě.
};

// **************************************************
// Lehre des Schläfers
// **************************************************

instance DIA_BaalTaran_Lehre(C_INFO)
{
	npc = NOV_1331_BaalTaran;
	nr = 3;
	condition = DIA_BaalTaran_Lehre_Condition;
	information = DIA_BaalTaran_Lehre_Info;
	permanent = 0;
//	description = "Tell me about the Sleeper's teachings.";
//	description = "Erzähl mir von der Lehre des Schläfers.";
	description = "Povídej mi o Spáčově učení.";
};                       

func int DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

func void DIA_BaalTaran_Lehre_Info()
{
//	AI_Output(other,self,"DIA_BaalTaran_Lehre_15_00"); //Tell me about the Sleeper's teachings.
//	AI_Output(other,self,"DIA_BaalTaran_Lehre_15_00"); //Erzähl mir von der Lehre des Schläfers.
	AI_Output(other,self,"DIA_BaalTaran_Lehre_15_00"); //Povídej mi o Spáčově učení.
//	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_01"); //The Sleeper is a powerful being, maybe even more powerful than Innos, the god of light.
//	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_01"); //Der Schläfer ist ein mächtiges Wesen, vielleicht sogar mächtiger als Innos, der Gott des Lichts.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_01"); //Spáč je mocná bytost, možná ještě mocnější než Innos, bůh světla.
//	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_02"); //He is with us in spirit. But his power is still limited. He has been sleeping for a thousand years, but now the moment of his awakening is near.
//	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_02"); //Im Geiste ist er mit uns. Aber seine Macht ist noch begrenzt. Er schläft einen tausendjährigen Schlaf, aber die Zeit seines Erwachens ist nahe.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_02"); //Je v naší duši. Jeho síla je však stále omezená. Spal po tisíce let, ale okamžik jeho procitnutí je už blízko.
//	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_03"); //He has chosen us to be witnesses to his awakening and to spread his word.
//	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_03"); //Uns hat er auserwählt, sein Erwachen zu bezeugen und seine Lehre zu verbreiten.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_03"); //Zvolil nás, abysme byli svědky jeho procitnutí a šířili jeho učení.
//	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_04"); //So listen, all those who join the Sleeper will have immortal souls, but those who are against him will be punished.
//	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_04"); //Denn höre, diejenigen, die sich dem Schläfer anschließen, deren Seelen werden unsterblich, aber die, die ihm entsagen oder sich gar gegen ihn stellen, werden vernichtet werden.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_04"); //Tak poslouchej, všichni, kdo se přidají ke Spáčovi, získají nesmrtelné duše, ale ti, kteří se postaví proti němu, budou potrestáni.
//	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_05"); //But the Sleeper is compassionate and sends proof of his might to all who doubt him.
//	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_05"); //Aber der Schläfer ist barmherzig und gibt allen Zweiflern einen Beweis seiner Macht.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_05"); //Spáč je však milosrdný a poslal důkaz své moci všem, kdo o něm pochybovali.
};

// **************************************************
// Freiheit
// **************************************************

instance DIA_BaalTaran_Freiheit(C_INFO)
{
	npc = NOV_1331_BaalTaran;
	nr = 4;
	condition = DIA_BaalTaran_Freiheit_Condition;
	information = DIA_BaalTaran_Freiheit_Info;
	permanent = 0;
//	description = "What will the way to freedom look like?";
//	description = "Wie soll der Weg in die Freiheit aussehen?";
	description = "Jak vypadá cesta ke svobodě?";
};                       

func int DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

func void DIA_BaalTaran_Freiheit_Info()
{
//	AI_Output(other,self,"DIA_BaalTaran_Freiheit_15_00"); //What will the way to freedom look like?
//	AI_Output(other,self,"DIA_BaalTaran_Freiheit_15_00"); //Wie soll der Weg in die Freiheit aussehen?
	AI_Output(other,self,"DIA_BaalTaran_Freiheit_15_00"); //Jak vypadá cesta ke svobodě?
//	AI_Output(self,other,"DIA_BaalTaran_Freiheit_05_01"); //We are preparing a great invocation of the Sleeper, in which all novices create the contact together.
//	AI_Output(self,other,"DIA_BaalTaran_Freiheit_05_01"); //Wir bereiten eine große Anrufung des Schläfers vor, in der alle Novizen zusammen den Kontakt herstellen.
	AI_Output(self,other,"DIA_BaalTaran_Freiheit_05_01"); //Připravujeme se na velké vzývání Spáče, při kterém vstoupí všichni novicové společně ve spojení.
//	AI_Output(self,other,"DIA_BaalTaran_Freiheit_05_02"); //In this invocation, the Sleeper will reveal the path to freedom.
//	AI_Output(self,other,"DIA_BaalTaran_Freiheit_05_02"); //In dieser Anrufung wird uns der Schläfer den Weg in die Freiheit offenbaren.
	AI_Output(self,other,"DIA_BaalTaran_Freiheit_05_02"); //Při tomto vzývání Spáč ukáže cestu ke svobodě.
};

// **************************************************
// Beweis
// **************************************************

instance DIA_BaalTaran_Beweis(C_INFO)
{
	npc = NOV_1331_BaalTaran;
	nr = 3;
	condition = DIA_BaalTaran_Beweis_Condition;
	information = DIA_BaalTaran_Beweis_Info;
	permanent = 0;
//	description = "How does your god prove his might?";
//	description = "Wie beweist euch euer Gott seine Macht?";
	description = "Jak váš bůh dokázal svou moc?";
};                       

func int DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

func void DIA_BaalTaran_Beweis_Info()
{
//	AI_Output(other,self,"DIA_BaalTaran_Beweis_15_00"); //How does your god prove his might?
//	AI_Output(other,self,"DIA_BaalTaran_Beweis_15_00"); //Wie beweist euch euer Gott seine Macht?
	AI_Output(other,self,"DIA_BaalTaran_Beweis_15_00"); //Jak váš bůh dokázal svou moc?
//	AI_Output(self,other,"DIA_BaalTaran_Beweis_05_01"); //He speaks to us through visions. Whoever hears his voice, no longer doubts his might.
//	AI_Output(self,other,"DIA_BaalTaran_Beweis_05_01"); //Er spricht zu uns durch Visionen. Wer seine Stimme gehört hat, zweifelt nicht mehr an seiner Macht.
	AI_Output(self,other,"DIA_BaalTaran_Beweis_05_01"); //Promluvil k nám skrze vize. Kdo slyšel jeho hlas, přestal o jeho moci pochybovat.
//	AI_Output(self,other,"DIA_BaalTaran_Beweis_05_02"); //If you take the weed which grows in the swamp, you will be close to the Sleeper and able to hear him. Some people even see images.
//	AI_Output(self,other,"DIA_BaalTaran_Beweis_05_02"); //Wenn man das Kraut, das im Sumpf wächst, einnimmt, ist man dem Schläfer nahe und kann ihn hören. Manche sehen auch Bilder.
	AI_Output(self,other,"DIA_BaalTaran_Beweis_05_02"); //Když vezmeš drogu, která roste v bažinách, budeš Spáčovi blíž a budeš ho moci slyšet. Někteří dokonce vidí obrazy.
//	AI_Output(other,self,"DIA_BaalTaran_Beweis_15_03"); //I see.
//	AI_Output(other,self,"DIA_BaalTaran_Beweis_15_03"); //Verstehe.
	AI_Output(other,self,"DIA_BaalTaran_Beweis_15_03"); //Aha.
};

// **************************************************
// Weg zum ST
// **************************************************

instance DIA_BaalTaran_WayToST(C_INFO)
{
	npc = NOV_1331_BaalTaran;
	nr = 1;
	condition = DIA_BaalTaran_WayToST_Condition;
	information = DIA_BaalTaran_WayToST_Info;
	permanent = 0;
//	description = "How do I get to the Brotherhood's camp?";
//	description = "Wie komme ich zum Lager der Bruderschaft?";
	description = "Jak se dostanu do tábora Bratrstva?";
};                       

func int DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

func void DIA_BaalTaran_WayToST_Info()
{
//	AI_Output(other,self,"DIA_BaalTaran_WayToST_15_00"); //How do I get to the Brotherhood's camp?
//	AI_Output(other,self,"DIA_BaalTaran_WayToST_15_00"); //Wie komme ich zum Lager der Bruderschaft?
	AI_Output(other,self,"DIA_BaalTaran_WayToST_15_00"); //Jak se dostanu do tábora Bratrstva?
//	AI_Output(self,other,"DIA_BaalTaran_WayToST_05_01"); //I'm busy. But Baal Parvez should be somewhere in this camp as well.
//	AI_Output(self,other,"DIA_BaalTaran_WayToST_05_01"); //Ich bin gerade beschäftigt. Aber Baal Parvez müsste sich auch hier im Lager befinden.
	AI_Output(self,other,"DIA_BaalTaran_WayToST_05_01"); //Nemám čas. Ale Baal Parvez by tu někde v táboře měl být také.
//	AI_Output(self,other,"DIA_BaalTaran_WayToST_05_02"); //He's near the market place, on the other side of the castle. I believe he's even got his own hut there.
//	AI_Output(self,other,"DIA_BaalTaran_WayToST_05_02"); //Er ist in der Nähe des Marktplatzes, auf der andern Seite der Burg. Ich glaube, er hat dort sogar 'ne eigene Hütte.
	AI_Output(self,other,"DIA_BaalTaran_WayToST_05_02"); //Je poblíž tržiště, na druhé straně od hradu. Myslím, že bude ve své chatrči.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
//	B_LogEntry(CH1_JoinPsi,"A novice called Baal Parvez can lead me to the swamp camp of the Brotherhood. He is at the market square behind the castle of the Old Camp.");
//	B_LogEntry(CH1_JoinPsi,"Ein Novize namens Baal Parvez kann mich ins Sumpflager der Bruderschaft führen. Er hält sich am Marktplatz hinter der Burg des Alten Lagers auf.");
	B_LogEntry(CH1_JoinPsi,"Novic jménem Baal Parvez mě může dovést do tábora Bratrstva v bažinách. Najdu ho na tržišti za hradem Starého tábora.");
};

// **************************************************
// Will in die BURG
// **************************************************

instance DIA_BaalTaran_IntoCastle(C_INFO)
{
	npc = NOV_1331_BaalTaran;
	nr = 10;
	condition = DIA_BaalTaran_IntoCastle_Condition;
	information = DIA_BaalTaran_IntoCastle_Info;
	permanent = 1;
//	description = "I need to get into the castle. Can you help me?";
//	description = "Ich muss in die Burg. Kannst du mir dabei helfen?";
	description = "Potřebuji se dostat do hradu. Můžeš mi pomoci?";
};                       

func int DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

func void DIA_BaalTaran_IntoCastle_Info()
{
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_15_00"); //I need to get into the castle. Can you help me?
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_15_00"); //Ich muss in die Burg. Kannst du mir dabei helfen?
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_15_00"); //Potřebuji se dostat do hradu. Můžeš mi pomoci?
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_01"); //I fear I cannot, brother. The only ones among us who may enter the castle are those who supply the weed to Gomez.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_01"); //Ich fürchte nicht, Bruder. Die einzigen von uns, die die Burg betreten dürfen, sind diejenigen, die Gomez das Kraut liefern.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_01"); //Obávám se, že ne, bratře. Jen někteří z nás smějí vstoupit do hradu a to jsou ti, kteří zásobují Gomeze drogou.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_02"); //We gather swampweed and sell part of it to the Old Camp, in exchange for goods from the outside world.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_02"); //Wir ernten Sumpfkraut und verkaufen einen Teil davon ans Alte Lager, zum Austausch gegen Waren aus der Außenwelt.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_02"); //Sbíráme tady drogu z bažin a část jí pak prodáme do Starého tábora a vyměníme za zboží z vnějšího světa.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_03"); //If you were one of the couriers working for Cor Kalom, you could get into the castle. But for that you would need to be one of us.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_03"); //Wenn du einer der Kuriere wärst, die für Cor Kalom arbeiten, könntest du in die Burg kommen. Aber dazu müsstest du natürlich einer von uns sein.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_03"); //Kdybys byl jedním z kurýrů, kteří pracují pro Cor Kaloma, mohl by ses na hrad dostat. Ale to bys musel být jedním z nás.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_04"); //What do you want to do in the castle anyway?
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_04"); //Was willst du überhaupt in der Burg?
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_04"); //A co vůbec chceš na hradě dělat?

	Info_ClearChoices(DIA_BaalTaran_IntoCastle);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,"I want to meet somebody there.",DIA_BaalTaran_IntoCastle_MeetSomeone);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,""Ich will dort jemanden treffen."						",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice(DIA_BaalTaran_IntoCastle,"Chci se tam s někým setkat.",DIA_BaalTaran_IntoCastle_MeetSomeone);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,"I have a letter for the High Magician of the Circle of Fire.",DIA_BaalTaran_IntoCastle_Letter);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,""Ich habe einen Brief für den obersten Feuermagier."	",DIA_BaalTaran_IntoCastle_Letter);
	Info_AddChoice(DIA_BaalTaran_IntoCastle,"Mám dopis pro Velkého mága Kruhu ohně.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //I want to meet somebody there.
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Ich will dort jemanden treffen.
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Chci se tam s někým setkat.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Do you? Who? And why don't you just wait until he comes out?
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //So? Wen? Und wieso wartest du nicht einfach, bis er rauskommt?
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Tak? A s kým? A proč nepočkáš, až dotyčný vyjde ven?
	Info_ClearChoices(DIA_BaalTaran_IntoCastle);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,"That's none of your business.",DIA_BaalTaran_IntoCastle_ForgetIt);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,""Das geht dich nichts an."	",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice(DIA_BaalTaran_IntoCastle,"Do toho ti nic není.",DIA_BaalTaran_IntoCastle_ForgetIt);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,"He's one of the magicians.",DIA_BaalTaran_IntoCastle_Mage);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,""Es ist einer der Magier."	",DIA_BaalTaran_IntoCastle_Mage);
	Info_AddChoice(DIA_BaalTaran_IntoCastle,"On je jedním z mágů.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //I have a letter for the High Magician of the Circle of Fire.
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Ich habe einen Brief für den obersten Feuermagier.
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Mám dopis pro Velkého mága Kruhu ohně.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Oh? And where did you get that from? The mages gave you that before they threw you in here, right?
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Ach? Und woher hast du den? Den haben dir die Magier gegeben, bevor sie dich hier reingeworfen haben, richtig?
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Och? A kde jsi k němu přišel? Dali ti ho mágové, ještě než tě sem vyhnali, co?
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //You're stupid to tell people about it. But don't worry - I won't tell anybody.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Du bist ganz schön dumm, das so rum zu erzählen. Aber keine Sorge - ich behalt's für mich.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Jsi hloupý, když o tom říkáš lidem. Ale neměj obavy - já to nikomu neřeknu!
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //But do yourself a favor, and don't tell anybody else about it either. The people here might slit anybody's throat for a thing like that!
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Nur tu dir selber einen Gefallen und erzähl es keinem anderen, ja? Die Leute hier schneiden dir für so was die Kehle durch!
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Ale pro svoje vlastní dobro to stejně nikomu neříkej. Zdejší lidi by za takovouhle věc byli schopní komukoliv podříznout krk!
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Most people would love to earn the reward you get for a message from the outside world.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Die Belohnung, die es für eine Nachricht aus der Außenwelt gibt, will jeder gerne kassieren.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Většina lidí by ráda dostala odměnu za zprávu z vnějšího světa.
	Info_ClearChoices(DIA_BaalTaran_IntoCastle);
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //He's one of the magicians.
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //Es ist einer der Magier.
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //On je jedním z mágů.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Oh! Well, they never leave the castle. You really will have to get in.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Oh! Tja, die kommen wirklich nie raus. Da musst du schon in die Burg rein.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Och! Dobře, ti nikdy neopustí hrad. Opravdu se musíš dostat dovnitř.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //What do you want from them anyway? Magic runes? Or potions?
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //Was willst du denn von denen? Magische Runen kaufen? Oder Tränke?
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //Co od nich vůbec chceš? Kouzelné runy? Nebo lektvary?
	Info_ClearChoices(DIA_BaalTaran_IntoCastle);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,"That's none of your business.",DIA_BaalTaran_IntoCastle_ForgetIt);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,""Das geht dich nichts an."	",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice(DIA_BaalTaran_IntoCastle,"Do toho ti nic není.",DIA_BaalTaran_IntoCastle_ForgetIt);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,"That's right.",DIA_BaalTaran_IntoCastle_Exactly);
//	Info_AddChoice(DIA_BaalTaran_IntoCastle,""Stimmt genau."				",DIA_BaalTaran_IntoCastle_Exactly);
	Info_AddChoice(DIA_BaalTaran_IntoCastle,"Ano.",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //That's none of your business.
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //Das geht dich nichts an.
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //To není tvoje věc.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Fine, man. I just wanted to help...
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Ist ja schon gut, Mann. Ich wollte dir nur helfen ...
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Dobře, člověče. Jen jsem chtěl pomoci...
	Info_ClearChoices(DIA_BaalTaran_IntoCastle);
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //That's right.
//	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //Stimmt genau.
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //Ano.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //I knew it! What else would a guy like you want with the mages.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Wusste ich's doch! Was will ein Typ wie du auch sonst wohl von den Magiern.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Věděl jsem to! Co jiného by mohl chlapík, jako ty, chtít od mágů.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //I can give you some good advice: Forget the mages. They take far too much ore for their stuff.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Ich kann dir 'nen guten Rat geben: Vergiss die Magier. Die nehmen viel zu viel Erz für ihren Kram.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Můžu ti dát jednu dobrou radu: zapomeň na mágy. Chtějí za své zboží příliš rudy.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Magic runes and potions are much cheaper in our camp.
//	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Bei uns im Lager kannst du viel billiger an magische Runen und Tränke herankommen.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Kouzelné runy a lektvary jsou daleko levnější v našem táboře.
	Info_ClearChoices(DIA_BaalTaran_IntoCastle);
};
