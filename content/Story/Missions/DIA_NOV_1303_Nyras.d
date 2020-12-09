// **************************************************
//						EXIT 
// **************************************************

instance DIA_Nyras_Exit(C_INFO)
{
	npc = Nov_1303_Nyras;
	nr = 999;
	condition = DIA_Nyras_Exit_Condition;
	information = DIA_Nyras_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Nyras_Exit_Condition()
{
	return 1;
};

func void DIA_Nyras_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
//						Hi
// **************************************************

instance DIA_Nyras_Hallo(C_INFO)
{
	npc = Nov_1303_Nyras;
	nr = 1;
	condition = DIA_Nyras_Hallo_Condition;
	information = DIA_Nyras_Hallo_Info;
	permanent = 0;
//	description = "Hi! I'm new here.";
//	description = "Hi! Ich bin neu hier.";
	description = "Zdar! Jsem tady nový.";
};

func int DIA_Nyras_Hallo_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};
func void DIA_Nyras_Hallo_Info()
{
//	AI_Output(other,self,"DIA_Nyras_Hallo_15_00"); //Hi! I'm new here.
//	AI_Output(other,self,"DIA_Nyras_Hallo_15_00"); //Hi! Ich bin neu hier.
	AI_Output(other,self,"DIA_Nyras_Hallo_15_00"); //Zdar! Jsem tady nový!
//	AI_Output(self,other,"DIA_Nyras_Hallo_03_01"); //The Sleeper be with you, stranger!
//	AI_Output(self,other,"DIA_Nyras_Hallo_03_01"); //Der Schläfer sei mit dir, Fremder!
	AI_Output(self,other,"DIA_Nyras_Hallo_03_01"); //Spáč s tebou, cizinče!
};

// **************************************************
//						Ort
// **************************************************

instance DIA_Nyras_Ort(C_INFO)
{
	npc = Nov_1303_Nyras;
	nr = 1;
	condition = DIA_Nyras_Ort_Condition;
	information = DIA_Nyras_Ort_Info;
	permanent = 0;
//	description = "What can you tell me about this place?";
//	description = "Was kannst du mir über diesen Ort sagen?";
	description = "Co mi můžeš říci o tomhle místě?";
};

func int DIA_Nyras_Ort_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Nyras_Hallo))
	&& (Kapitel <= 1)
	{
		return 1;
	};
};

func void DIA_Nyras_Ort_Info()
{
//	AI_Output(other,self,"DIA_Nyras_Ort_15_00"); //What can you tell me about this place?
//	AI_Output(other,self,"DIA_Nyras_Ort_15_00"); //Was kannst du mir über diesen Ort sagen?
	AI_Output(other,self,"DIA_Nyras_Ort_15_00"); //Co mi můžeš říci o tomhle místě?
//	AI_Output(self,other,"DIA_Nyras_Ort_03_01"); //Well - the Gurus are the most important people here. They spread the word of the Sleeper and pass our master's visions on to the novices.
//	AI_Output(self,other,"DIA_Nyras_Ort_03_01"); //Nun - die Gurus sind die wichtigsten Leute hier. Sie verbreiten die Lehre des Schläfers, und teilen den Novizen die Visionen unseres Meisters mit.
	AI_Output(self,other,"DIA_Nyras_Ort_03_01"); //Dobrá - Guru jsou tady nejdůležitějšími lidmi. Šíří Spáčovo učení a předávají vize našich mistrů novicům.
//	AI_Output(self,other,"DIA_Nyras_Ort_03_02"); //Of course he's too tired to talk to everybody himself.
//	AI_Output(self,other,"DIA_Nyras_Ort_03_02"); //Er selbst ist natürlich viel zu erschöpft, um immer zu allen zu reden.
	AI_Output(self,other,"DIA_Nyras_Ort_03_02"); //On sám je pochopitelně příliš unavený, než aby to říkal každému sám.
//	AI_Output(self,other,"DIA_Nyras_Ort_03_03"); //But on some days he speaks to us in the temple courtyard and reveals the holy words of the Sleeper.
//	AI_Output(self,other,"DIA_Nyras_Ort_03_03"); //Aber an manchen Tagen spricht er auf dem Tempelplatz zu uns und offenbart uns die heiligen Worte des Schläfers.
	AI_Output(self,other,"DIA_Nyras_Ort_03_03"); //Občas k nám ale promluví v chrámovém dvoře a předá nám svaté Spáčovo poslání.

	Info_ClearChoices(DIA_Nyras_Ort);
//	Info_Addchoice (DIA_Nyras_Ort,"Tell me about the holy words of the great Sleeper.",DIA_Nyras_Ort_Holy);
//	Info_Addchoice (DIA_Nyras_Ort,"Berichte mir von den heiligen Worten des großen Schläfers.",DIA_Nyras_Ort_Holy);
	Info_Addchoice (DIA_Nyras_Ort,"Povídej mi o svatém poslání velkého Spáče!",DIA_Nyras_Ort_Holy);
//	Info_Addchoice (DIA_Nyras_Ort,"And what does he say then?",DIA_Nyras_Ort_Casual);
//	Info_Addchoice (DIA_Nyras_Ort,"Und was sagt er so?",DIA_Nyras_Ort_Casual);
	Info_Addchoice (DIA_Nyras_Ort,"A co říká potom?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
//	AI_Output(other,self,"DIA_Nyras_Ort_Casual_15_00"); //And what does he say then?
//	AI_Output(other,self,"DIA_Nyras_Ort_Casual_15_00"); //Und was sagt er so?
	AI_Output(other,self,"DIA_Nyras_Ort_Casual_15_00"); //A co říká potom?
//	AI_Output(self,other,"DIA_Nyras_Ort_Casual_03_01"); //The Sleeper guides the way. But an infidel like you wouldn't understand that!
//	AI_Output(self,other,"DIA_Nyras_Ort_Casual_03_01"); //Der Schläfer weist uns unseren Weg. Aber davon versteht ein Ungläubiger wie du nichts!
	AI_Output(self,other,"DIA_Nyras_Ort_Casual_03_01"); //Spáč určuje naší cestu. Tomu by ale nevěrci, jako jsi ty, nemohli rozumět!
	Info_ClearChoices(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
//	AI_Output(other,self,"DIA_Nyras_Ort_Holy_15_00"); //Tell me about the holy words of the great Sleeper.
//	AI_Output(other,self,"DIA_Nyras_Ort_Holy_15_00"); //Berichte mir von den heiligen Worten des großen Schläfers.
	AI_Output(other,self,"DIA_Nyras_Ort_Holy_15_00"); //Povídej mi o svatém poslání velkého Spáče!
//	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_01"); //HE tells us what we need to do to gain freedom again.
//	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_01"); //ER sagt uns, was wir tun müssen, um die Freiheit zu erlangen.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_01"); //ON nám říká, co musíme udělat, abysme opět získali svobodu.
//	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_02"); //Y'Berion says that the Sleeper will show us the way as soon as we're able to hear him.
//	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_02"); //Y'Berion sagt, der Schläfer wird uns den Weg mitteilen, sobald wir in der Lage sind, ihn zu hören.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_02"); //Y´Berion říká, že Spáč nám ukáže cestu ihned, jakmile mu budeme schopni naslouchat.
//	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_03"); //He's preparing a great invocation, in which he'll contact the Sleeper together with the best novices.
//	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_03"); //Er bereitet eine große Anrufung vor, in der er zusammen mit den besten Novizen mit dem Schläfer in Kontakt treten will.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_03"); //Připravuje velké vzývání, ve kterém se spolu s nejlepšími novici spojí se Spáčem.
//	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_04"); //Cor Kalom supports him. He's an alchemist who brews substances which put us into a sleep-like state.
//	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_04"); //Cor Kalom unterstützt ihn dabei. Er ist Alchimist und braut Substanzen zusammen, die uns in einen schlafähnlichen Zustand versetzen.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_04"); //Cor Kalom mu pomáhá. Je to alchymista, který připravuje substance, které ho uvádějí do jakoby spánkového stavu.
//	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_05"); //You can only receive the thoughts of the Sleeper in this state - or when sleeping.
//	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_05"); //Nur in diesem Zustand - oder wenn du schläfst - kannst du die Gedanken des Schläfers empfangen.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_05"); //Jedině v takovém stavu můžeš přijímat Spáčovy myšlenky - nebo ve spánku.
	Info_ClearChoices(DIA_Nyras_Ort);
};

// ***************************************************
//						
// ***************************************************

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
////////////////////		Bring Fokus 1 ///////////////////////////
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

// ***************************** BEGRÜßUNG ****************************************//

instance Nov_1303_Nyras_GREET(C_INFO)
{
	npc = Nov_1303_Nyras;
	condition = Nov_1303_Nyras_GREET_Condition;
	information = Nov_1303_Nyras_GREET_Info;
	important = 1;
	permanent = 0;
};

func int Nov_1303_Nyras_GREET_Condition()
{
	if ( YBerion_BringFocus == LOG_RUNNING )
	{
		return 1;
	};
};
func void Nov_1303_Nyras_GREET_Info()
{
//	AI_Output(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Scram! You have no business to be here!
//	AI_Output(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Verschwinde! Hier gibt es nichts für dich zu holen!
	AI_Output(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Zmiz! Tady nemáš co dělat!
};
// ***************************** INFOS ****************************************//

instance Nov_1303_Nyras_LEAVE(C_INFO)
{
	npc = Nov_1303_Nyras;
	condition = Nov_1303_Nyras_LEAVE_Condition;
	information = Nov_1303_Nyras_LEAVE_Info;
	important = 0;
	permanent = 0;
//	description = "I'm searching for the focus."; 
//	description = "Ich bin auf der Suche nach dem Fokus"; 
	description = "Hledám ohnisko."; 
};

func int Nov_1303_Nyras_LEAVE_Condition()
{ 
	if (Npc_KnowsInfo(hero,Nov_1303_Nyras_GREET))
	{
		return 1;
	};
};
func void Nov_1303_Nyras_LEAVE_Info()
{
//	AI_Output(other,self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //I'm searching for the focus.
//	AI_Output(other,self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Ich bin auf der Suche nach dem Fokus.
	AI_Output(other,self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Hledám ohnisko.
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Unfortunately you're too late for that. I've already found it!
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Da kommst du leider zu spät. Ich habe ihn bereits gefunden!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Bohužel jdeš příliš pozdě. Už jsem ho našel!
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //And I'm keeping it for myself!
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //Und ich werde ihn für mich selbst behalten!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //A nechám si ho pro sebe!
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //The Sleeper talked to me last night and made me his only tool!
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //Der Schläfer sprach heute Nacht zu mir und machte mich zu seinem alleinigen Werkzeug!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //Minulou noc ke mně mluvil Spáč a prohlásil mě svým jediným nástrojem!
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Now I'll only serve the Sleeper. No more templars or Gurus!
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Nun werde nur noch ich dem Schläfer dienen. Keine Templer, keine Gurus mehr!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Teď sloužím jen Spáčovi. Žádnému templáři ani Guru!
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //OOONNNLLLLYYYYYY MEEEEEEEEE AAALLLOOONE!!!!!!!!!
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //NUUUUR ICHHHH ALEEEEEINEEEEEEE!!!!!!!!!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //JEEENNN JÁÁÁÁ SÁÁÁÁÁMM!!!!!!
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //DIIIIIIIIEE!!!!!
//	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //STIIIIIIRB!!!!!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //ZEEEMŘŘÍÍÍ!!!!!

//	B_LogEntry(CH2_Focus,"Nyras has lost his mind. He wants to keep the focus for himself and attacked me in his rage.");
//	B_LogEntry(CH2_Focus,"Nyras hat den Verstand verloren. Er will den Fokus für sich behalten und griff mich in seinem Wahn an.");
	B_LogEntry(CH2_Focus,"Nyras se pominul. Chce získat ohnisko pro sebe a proto mě v návalu vzteku napadl.");

	Npc_SetPermAttitude(self,ATT_HOSTILE);
	AI_StopProcessInfos(self);

};  

