//****************************************************
//	Typ der den SC an der Nase herum führt!
//****************************************************

//Variablen:
//--------------------------------------
var int SLD_753_Baloro_SC_choice;
var int SLD_753_Baloro_SC_wills_wissen;
var int SLD_753_Baloro_SC_besorgt_den_Kram;
//--------------------------------------

instance DIA_SLD_753_Baloro(C_INFO)
{
	npc = SLD_753_Baloro;
	condition = DIA_SLD_753_Baloro_Condition;
	information = DIA_SLD_753_Baloro_Intro_Info;
	important = 1;
	permanent = 0;
};

func int DIA_SLD_753_Baloro_Condition()
{
	return 1;
};

func void DIA_SLD_753_Baloro_Intro_Info()
{
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Intro_08_01"); //Hey, you! What's up?
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Intro_08_01"); //Hey, du! Was ist los?
	AI_Output(self,other,"DIA_SLD_753_Baloro_Intro_08_01"); //Hej, ty! Co se děje?
};

// ********************** Was meinst du? *****************

instance DIA_SLD_753_Baloro_Wasmeinstdu(C_INFO)
{
	npc = SLD_753_Baloro;
	condition = DIA_SLD_753_Baloro_Wasmeinstdu_Condition;
	information = DIA_SLD_753_Baloro_Wasmeinstdu_Info;
	important = 0; 
	permanent = 0;
//	description = "Hi!";
//	description = "Hi!";
	description = "Zdar!";
};                       

func int DIA_SLD_753_Baloro_Wasmeinstdu_Condition()
{
	return 1;
};

func void DIA_SLD_753_Baloro_Wasmeinstdu_Info()
{
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_01"); //Hi!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_01"); //Hi!
	AI_Output(other,self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_01"); //Zdar!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_02"); //You're walking about here as if you were searching for something!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_02"); //Du läufst hier rum, als würdest du was suchen!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_02"); //Vykračuješ si tady, jako kdybys něco hledal!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_03"); //Really? Mmh, maybe you're right. Why?
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_03"); //Tatsächlich? Mmh, stimmt vielleicht. Wieso?
	AI_Output(other,self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_03"); //Opravdu? Hmm, možná máš pravdu. Proč?
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_04"); //Great! Ask me! Maybe I can help you!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_04"); //Wunderbar! Frag mich! Ich kann dir vielleicht weiterhelfen!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_04"); //Výborně! Zeptej se mě. Možná ti můžu pomoci!

};

// ********************** Woran hast du dabei gedacht *****************

instance DIA_SLD_753_Baloro_Worumgehts(C_INFO)
{
	npc = SLD_753_Baloro;
	condition = DIA_SLD_753_Baloro_Worumgehts_Condition;
	information = DIA_SLD_753_Baloro_Worumgehts_Info;
	important = 0; 
	permanent = 0;
//	description = "What did you have in mind?";
//	description = "Woran hast du dabei gedacht?";
	description = "Co jsi měl na mysli?";
};                       

func int DIA_SLD_753_Baloro_Worumgehts_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu)) && (SLD_753_Baloro_SC_choice == 0))
	{
	return 1;
	};

};

func void DIA_SLD_753_Baloro_Worumgehts_Info()
{
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01"); //What did you have in mind?
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01"); //Woran hast du dabei gedacht?
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01"); //Co jsi měl na mysli?
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_01"); //What do you need?
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_01"); //Was brauchst du denn?
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_01"); //Co potřebuješ?
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_02"); //What about a good sword, thick armor or access to the mine?
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_02"); //Wie wär's mit einem guten Schwert, einer starken Rüstung oder dem Zugang zur Mine?
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_02"); //Co takhle dobrý meč, lehkou zbroj nebo přístup do dolu?
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_02"); //Aw no! That's nothing!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_02"); //Ach was! Das ist alles noch viel zu schlapp!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_02"); //Ó ne! To nic!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_03"); //I can give you something that'll make your eyes pop out of their sockets! I can give you a weapon that will defeat any foe!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_03"); //Ich hab' dir was anzubieten, da werden dir die Augen übergehen! Ich kann dir eine Waffe besorgen, mit der du jeden Gegner besiegst!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_03"); //Můžu ti dát něco, co udrží tvoje oči na stopkách! Můžu ti dát zbraň, která rozdrtí každého nepřítele!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_04"); //You only need to do me a small favor. Then it'll be yours! What do you say?
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_04"); //Das einzige, was du tun musst, um sie zu bekommen, ist mir einen kleinen Gefallen zu erweisen. Und sie gehört dir! Was sagst du?
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_04"); //Musíš mi jen prokázat malou službičku. Pak bude tvoje! Co říkáš?

	Info_ClearChoices(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
//	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"I must have it.",DIA_SLD_753_Baloro_Worumgehts_ja);
//	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"Will ich unbedingt haben",DIA_SLD_753_Baloro_Worumgehts_ja);
	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"Musím to mít.",DIA_SLD_753_Baloro_Worumgehts_ja);
//	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"I don't believe a word he says.",DIA_SLD_753_Baloro_Exit_Info);
//	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"Der Typ will mich doch verarschen!",DIA_SLD_753_Baloro_Exit_Info);
	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"Ten chlápek mele nesmysly.",DIA_SLD_753_Baloro_Exit_Info);

};

func void DIA_SLD_753_Baloro_Worumgehts_ja()
{
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05"); //What will I have to do for it?
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05"); //Was müsste ich denn dafür tun?
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05"); //Co pro tebe mám udělat?
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_03"); //Very simple!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_03"); //Ganz einfach!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_03"); //Velmi jednoduché!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_04"); //Get me 5 apples, 2 bottles of rice schnapps, 5 bottles of beer, 3 loafs of bread, 2 pieces of cheese and 2 bunches of grapes, and we're in business!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_04"); //Bring mir 5 Äpfel, 2 Flaschen Reisschnaps, 5 Flaschen Bier, 3 Laibe Brot, 2 Käsestücke und 2 Weintraubenreben und wir kommen ins Geschäft!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_04"); //Dej mi 5 jablek, 2 láhve rýžové pálenky, 5 láhví piva, 3 bochníky chleba, 2 kusy sýra, 2 hrozny vína a jsme domluveni!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_05"); //Believe me, you won't be sorry. As I just said: You'll really defeat any kind of enemy with it!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_05"); //Glaub mir, du wirst es nicht bereuen. Wie ich schon sagte: Wirklich jeden Gegner machst du damit platt!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_05"); //Věř mi, nebudeš litovat! Jak jsem řekl: porazíš s ní jakéhokoliv nepřítele!

	Info_ClearChoices(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
//	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"I must have it.",DIA_SLD_753_Baloro_Worumgehts_jaklar);
//	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"Muss ich haben",DIA_SLD_753_Baloro_Worumgehts_jaklar);
	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"Musím to mít.",DIA_SLD_753_Baloro_Worumgehts_jaklar);
//	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"The bloke's taking the piss.",DIA_SLD_753_Baloro_Exit_Info);
//	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"Der Typ will mich doch verarschen!",DIA_SLD_753_Baloro_Exit_Info);
	Info_AddChoice(DIA_SLD_753_Baloro_Worumgehts,"Ten chlápek mele nesmysly.",DIA_SLD_753_Baloro_Exit_Info);
};

func void DIA_SLD_753_Baloro_Worumgehts_jaklar()
{
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_06"); //Okay! I'll see what I can do then!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_06"); //Na gut! Ich werde sehen, was ich tun kann!
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_06"); //Dobrá, uvidíme, co budu moci udělat!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_06"); //Very good! But hurry up!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_06"); //Sehr schön! Aber beeil dich!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_06"); //Výborně! Ale nepospíchej
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_07"); //Don't forget: 5 apples, 2 bottles of rice schnapps, 5 bottles of beer, 3 loafs of bread, 2 pieces of cheese and 2 bunches of grapes! Okay?
//	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_07"); //Vergiss es nicht: 5 Äpfel, 2 Flaschen Reisschnaps, 5 Flaschen Bier, 3 Laibe Brot, 2 Käsestücke und 2 Weintraubenreben! Klar?
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_07"); //A nezapomeň: 5 jablek, 2 láhve rýžové pálenky, 5 láhví piva, 3 bochníky chleba, 2 kusy sýra, 2 hrozny vína! Jasný?
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07"); //Of course!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07"); //Klar!
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07"); //Jasný!

//******** Auftragannahme **************************

	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_RUNNING ;

	Log_CreateTopic(Baloros_Waffe,LOG_MISSION);
	Log_SetTopicStatus(Baloros_Waffe,LOG_RUNNING);
//	B_LogEntry(Baloros_Waffe, "Baloro promised to trade me a superb weapon, if I'd bring him 5 Apples, 2 bottles of rice schnapps, 5 bottles of beer, 3 lofs of bread, 2 pieces of cheese and 2 bunches of grapes."); 
//	B_LogEntry(Baloros_Waffe, "Baloro hat versprochen, mir eine verdammt gute Waffe zu geben, wenn ich ihm ein paar Sachen besorge. Er will 5 Äpfel, 2 Flaschen Reisschnaps, 5 Flaschen Bier, 3 Laibe Brot, 2 Käsestücke und 2 Weintraubenreben."); 
	B_LogEntry(Baloros_Waffe, "Baloro mi slíbil výbornou zbraň, pokud mu přinesu 5 jablek, 2 láhve rýžové pálenky, 5 lahví piva, 3 bochníky chleba, 2 kousky sýra a 2 trsy hroznů."); 

	AI_StopProcessInfos(self);
};

// ********************** Ich hab´s noch nicht dabei ***************** 

instance DIA_SLD_753_Baloro_habsnichtdabei(C_INFO)
{
	npc = SLD_753_Baloro;
	condition = DIA_SLD_753_Baloro_habsnichtdabei_Condition;
	information = DIA_SLD_753_Baloro_habsnichtdabei_Info;
	important = 0; 
	permanent = 1;
//	description = "I couldn't get your stuff yet!";
//	description = "Ich konnte deinen Kram noch nicht besorgen!";
	description = "Nemohl jsem sehnat, co jsi chtěl!";
};                       

func int DIA_SLD_753_Baloro_habsnichtdabei_Condition()
{
	if (SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)   
	{
		return 1;
	};

};

func void DIA_SLD_753_Baloro_habsnichtdabei_Info()
{
//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_01"); //I couldn't get your stuff yet! What was it again? There were so many different things!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_01"); //Ich konnte deinen Kram nicht besorgen! Was war das noch mal? Es war so viel Verschiedenes!
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_01"); //Nemohl jsem sehnat, co jsi chtěl! Jakže to bylo? Bylo to spousta různých věcí!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_01"); //Okay then! I'll repeat it slowly. Well, I want you to get...
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_01"); //Na schön! Noch mal zum Mitschreiben. Also, ich will von dir ...
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_01"); //Dobře! Zopakuju ti to pomalu. Chci, abys mi přinesl...
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_02"); //5 apples, 2 bottles of rice schnapps, 5 bottles of beer, 3 loafs of bread, 2 pieces of cheese and 2 bunches of grapes! Did you get it this time?
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_02"); //5 Äpfel, 2 Flaschen Reisschnaps, 5 Flaschen Bier, 3 Laib Brot, 2 Käsestücke und 2 Weintraubenreben! Hast du's jetzt?
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_02"); //5 jablek, 2 láhve rýžové pálenky, 5 láhví piva, 3 bochníky chleba, 2 kusy sýra, 2 hrozny vína! Pamatuješ si to už?
//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_02"); //Alright! Sure! I'll hurry up!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_02"); //Ach ja! Sicher! Ich beeil mich!
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_02"); //Jistě! Určitě! Pospíším si!

	AI_StopProcessInfos(self); 
};

// ********************** Ich hab´s  dabei ***************** 

instance DIA_SLD_753_Baloro_habsdabei(C_INFO)
{
	npc = SLD_753_Baloro;
	condition = DIA_SLD_753_Baloro_habsdabei_Condition;
	information = DIA_SLD_753_Baloro_habsdabei_Info;
	important = 0; 
	permanent = 0;
//	description = "I have all the stuff on me!";
//	description = "Ich hab' den ganzen Kram dabei!";
	description = "Mám pro tebe všechno, co jsi chtěl!";
};                       

func int DIA_SLD_753_Baloro_habsdabei_Condition()
{
	if ((SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)      
		&& (Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Worumgehts)) 
		&& (SLD_753_Baloro_SC_choice == 0) 
		&& (Npc_HasItems(other,ItFoApple)>=5)  
		&& (Npc_HasItems(other,ItFoBooze)>=2) 
		&& (Npc_HasItems(other,ItFoBeer)>=5) 
		&& (Npc_HasItems(other,ItFoLoaf)>=3) 
		&& (Npc_HasItems(other,ItFoCheese)>=2) 
		&& (Npc_HasItems(other,ItFo_wineberrys_01)>=2))
	{
		return 1;
	};

};

func void DIA_SLD_753_Baloro_habsdabei_Info()
{
//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_01"); //I have all the stuff on me! Now we'll do the deal with that super weapon, right?
//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_01"); //Ich hab' den ganzen Kram dabei! Jetzt machen wir den Deal mit der ultimativen Waffe, ja?
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_01"); //Mám pro tebe všechno, co jsi chtěl! A teď uděláme ten obchod s tou zázračnou zbraní, dobře?
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_01"); //Then show me the stuff first!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_01"); //Dann zeig doch erst mal her!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_01"); //Nejdřív mi ukaž ty věci!

	CreateInvItems(other,ItFoApple, 14);

	B_GiveInvItems(other,self,ItFoApple, 19); //Nötig für die Ausschrift "19 Itmes abgegeben", wird sofort angeglichen.

	Npc_RemoveInvItems(other,ItFoBooze,2);
	Npc_RemoveInvItems(other,ItFoBeer,5);
	Npc_RemoveInvItems(other,ItFoLoaf,3);
	Npc_RemoveInvItems(other,ItFoCheese,2);
	Npc_RemoveInvItems(other,ItFo_wineberrys_01,2);

	Npc_RemoveInvItems(self,ItFoApple,14);
	CreateInvItems(self,ItFoBooze,2);
	CreateInvItems(self,ItFoBeer,5);
	CreateInvItems(self,ItFoLoaf,3);
	CreateInvItems(self,ItFoCheese,2);
	CreateInvItems(self,ItFo_wineberrys_01,2);

//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_02"); //Here you go!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_02"); //Hier hast du!
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_02"); //Tady jsou.
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_02"); //Yeah, great!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_02"); //Ja, klasse!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_02"); //Ano. Výborně.
//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_03"); //Well, give me the thing now!!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_03"); //So, nun her mit dem Ding!!
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_03"); //Dobře, a teď mi dej tu věcičku!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_03"); //Forget it!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_03"); //Vergiss es!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_03"); //Zapomeň na to!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_04"); //What?
//	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_04"); //Was?
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_04"); //Cože?
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_04"); //Did you really think you'd get something for it? I mean, if you're stupid enough to believe that you don't deserve any better!!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_04"); //Glaubst du echt, da kommt jetzt noch was? Ich meine, wer so dämlich ist, sich auf so einen Quatsch einzulassen, der hat's auch nicht besser verdient!!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_04"); //Opravdu sis myslel, že za to něco dostaneš? Mám pocit, že jestli jsi tak tupý, žes tomu věřil, tak si nezasloužíš nic jiného!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_05"); //I'm amazed to see you're still alive! If you believe everything people say, you won't survive long here!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_05"); //Wundert mich, dass du überhaupt noch lebst! Wenn du so leichtgläubig hier in der Gegend rumrennst, machst du's nicht mehr lange!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_05"); //Překvapuje mě, že jsi stále naživu! Když věříš všemu, co lidi říkají, moc dlouho nepřežiješ!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_06"); //Doesn't matter though! Now we boys have enough food for a party! Thanks a lot! And maybe we'll meet you again. He he he!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_06"); //Macht aber nichts! Jetzt haben wir Jungs wenigstens genügend Fressalien zum Feiern! Schönen Dank auch! Und vielleicht sehen wir uns ja noch mal. He he he!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_06"); //Ale nevadí! Teď máme my chlapi dost jídla na oslavu! Díky moc! Možná se ještě uvidíme. Hehehe!

	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_SUCCESS ;
	B_GiveXP(300);
//	B_LogEntry(Baloros_Waffe, "I should have known better than trusting this jerk! Nevermind, now I've learned my lesson!"); 
//	B_LogEntry(Baloros_Waffe, "Hätte ich mir gleich denken können, daß der Typ mich nur verarschen will. Egal! Jetzt bin um eine Erfahrung reicher!"); 
	B_LogEntry(Baloros_Waffe, "Měl bych více přemýšlet, než skočím na takový špek! Nevadí, aspoň jsem dostal lekci!"); 

	Log_SetTopicStatus(Baloros_Waffe,LOG_SUCCESS);

	AI_StopProcessInfos(self); 
};

// ********************** EXIT\ Spieler will Rechenschaft ***************** 

instance DIA_SLD_753_Baloro_letztes_Wort(C_INFO)
{
	npc = SLD_753_Baloro;
	condition = DIA_SLD_753_Baloro_letztes_Wort_Condition;
	information = DIA_SLD_753_Baloro_letztes_Wort_Info;
	important = 0; 
	permanent = 0;
//	description = "Hey man! You can't do that to me!";
//	description = "Hey, Mann! Das kannst du mit mir nicht machen!";
	description = "Hej, člověče! Tohle mi nemůžeš udělat!";

};                       

func int DIA_SLD_753_Baloro_letztes_Wort_Condition()
	{
		if (SLD_753_Baloro_SC_besorgt_den_Kram == LOG_SUCCESS)
		{
		return 1;
		}; 
	};

func void DIA_SLD_753_Baloro_letztes_Wort_Info()

	 	{
//			AI_Output(other,self,"DIA_SLD_753_Baloro_letztes_Wort_Info_15_01"); //Hey man! You can't do that to me!
//			AI_Output(other,self,"DIA_SLD_753_Baloro_letztes_Wort_Info_15_01"); //Hey, Mann! Das kannst du mit mir nicht machen!
			AI_Output(other,self,"DIA_SLD_753_Baloro_letztes_Wort_Info_15_01"); //Hej, člověče! Tohle mi nemůžeš udělat!
//			AI_Output(self,other,"DIA_SLD_753_Baloro_letztes_Wort_Info_08_01"); //What more do you want! Piss off! Get on somebody else's nerves, or you'll get it! Got it?
//			AI_Output(self,other,"DIA_SLD_753_Baloro_letztes_Wort_Info_08_01"); //Was willst du denn noch! Verschwinde! Geh jemand anders auf die Nerven, sonst setzt's was! Kapiert?
			AI_Output(self,other,"DIA_SLD_753_Baloro_letztes_Wort_Info_08_01"); //Co chceš víc? Odtáhni! Lez si na nervy někomu jinému, nebo tě rozmáznu! Jasný!

			SLD_753_Baloro_SC_wills_wissen = 1 ;

			AI_StopProcessInfos(self); 

		};

// ********************** EXIT\ Spieler will´s wissen ***************** 

instance DIA_SLD_753_Baloro_SC_wills_wissen(C_INFO)
{
	npc = SLD_753_Baloro;
	condition = DIA_SLD_753_Baloro_SC_wills_wissen_Condition;
	information = DIA_SLD_753_Baloro_SC_wills_wissen_Info;
	important = 0; 
	permanent = 0;
//	description = "I'm afraid I'm going to have to whack you one!";
//	description = "Ich glaube, ich muss dir jetzt leider die Fresse polieren!";
	description = "Obávám se, že tě budu muset přetáhnout holí!";

};                       

func int DIA_SLD_753_Baloro_SC_wills_wissen_Condition()
	{
		if (SLD_753_Baloro_SC_wills_wissen == 1)
		{

		return 1;
		}; 
	};

func void DIA_SLD_753_Baloro_Attack()
{
//	B_FullStop(self); 
	AI_StopProcessInfos(self); 
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack, 1, "");
};

func void DIA_SLD_753_Baloro_SC_wills_wissen_Info()
{
//	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01"); //I'm afraid I'm going to have to whack you one!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01"); //Ich glaube, ich muss dir jetzt leider die Fresse polieren!
	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01"); //Obávám se, že tě budu muset přetáhnout holí!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_01"); //We've had our fun! Now get lost, man!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_01"); //Wir haben unseren Spaß gehabt! Jetzt zieh´ Leine, Mann!
	AI_Output(self,other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_01"); //Tak jsme se zasmáli! A teď padej, člověče!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02"); //I believe you didn't understand me!
//	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02"); //Ich glaube, du hast mich nicht verstanden!
	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02"); //Mám pocit, žes mi nerozuměl!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_02"); //Okay then! You asked for it! You were warned!
//	AI_Output(self,other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_02"); //Na gut! Du willst es ja nicht anders! Ich hab' dich gewarnt!
	AI_Output(self,other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_02"); //Dobrá! Říkal sis o to! Já tě varoval!

	DIA_SLD_753_Baloro_Attack() ;

};

// ********************** EXIT ***************** 

instance DIA_SLD_753_Baloro_Exit(C_INFO)
{
	npc = SLD_753_Baloro;
	nr =999;
	condition = DIA_SLD_753_Baloro_Exit_Condition;
	information = DIA_SLD_753_Baloro_Exit_Info;
	important = 0; 
	permanent = 1;
//	description = "I need to go on.";
//	description = "Ich muss weiter!";
	description = "Musím jít dál.";

};                       

func int DIA_SLD_753_Baloro_Exit_Condition()
	{
		if    ((SLD_753_Baloro_SC_wills_wissen == 0) && (SLD_753_Baloro_SC_besorgt_den_Kram == 0)    )
		{
		return 1;
		};
	};

func void DIA_SLD_753_Baloro_Exit_Info()
{ 

				if ((Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu))  && (SLD_753_Baloro_SC_choice == 0))  
					{
//						AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_01"); //No, no! Just leave it! I'm not interested!
//						AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_01"); //Nee, nee! Lass mal! Kein Interesse!
						AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_01"); //Ne, ne! Jdi pryč! Nezajímáš mě!
//						AI_Output(self,other,"DIA_SLD_753_Baloro_Exit_Info_08_02"); //Well then! As you wish! You've had your chance!
//						AI_Output(self,other,"DIA_SLD_753_Baloro_Exit_Info_08_02"); //Na gut! Wie du willst! Du hattest deine Chance!
						AI_Output(self,other,"DIA_SLD_753_Baloro_Exit_Info_08_02"); //Dobrá! Jak chceš! Dostal si šanci!

						SLD_753_Baloro_SC_choice = 1 ;
					}
				else
					{
//						AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_03"); //I'm sorry! Unfortunately I don't have any time to chat!
//						AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_03"); //Tut mir Leid! Ich hab' leider keine Zeit für ein Pläuschchen!
						AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_03"); //Je mi líto! Bohužel nemám čas si povídat!
//						AI_Output(self,other,"DIA_SLD_753_Baloro_Exit_Info_08_04"); //Oh, you're busy! I'll see you!
//						AI_Output(self,other,"DIA_SLD_753_Baloro_Exit_Info_08_04"); //Oh, haben wir es eilig! Na dann! Wir sehen uns!
						AI_Output(self,other,"DIA_SLD_753_Baloro_Exit_Info_08_04"); //Och, ty nemáš čas! Ještě se uvidíme!
					};

	AI_StopProcessInfos(self);
};

// ********************** EXIT\ wie war das mit deinem Angebot ***************** 

instance DIA_SLD_753_Baloro_Angebotdochannehmen(C_INFO)
{
	npc = SLD_753_Baloro;
	condition = DIA_SLD_753_Baloro_Angebotdochannehmen_Condition;
	information = DIA_SLD_753_Baloro_Angebotdochannehmen_Info;
	important = 0; 
	permanent = 0;
//	description = "I've thought about it. I'd like to get back to your offer now.";
//	description = "Ich hab's mir überlegt. Ich möchte dein Angebot doch annehmen.";
	description = "Přemýšlel jsem o tom! Chtěl bych tvoji nabídku přijmout.";

};                       

func int DIA_SLD_753_Baloro_Angebotdochannehmen_Condition()
	{
		if (SLD_753_Baloro_SC_choice == 1)
		{
		return 1;
		}; 
	};

func void DIA_SLD_753_Baloro_Angebotdochannehmen_Info()

	 	{
//			AI_Output(other,self,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_15_01"); //I thought about it. I'd like to get back to your offer now.
//			AI_Output(other,self,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_15_01"); //Ich hab's mir überlegt. Ich möchte dein Angebot doch annehmen.
			AI_Output(other,self,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_15_01"); //Přemýšlel jsem o tom! Chtěl bych tvoji nabídku přijmout.
//			AI_Output(self,other,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_08_01"); //It's too late now! You've had your chance!
//			AI_Output(self,other,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_08_01"); //Dafür ist es jetzt zu spät! Du hattest deine Chance!
			AI_Output(self,other,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_08_01"); //To už je pozdě! Měl jsi možnost!

			AI_StopProcessInfos(self); 

		};

