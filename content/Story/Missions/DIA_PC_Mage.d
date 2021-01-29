//*********************************************
//  EXIT
//*********************************************
instance DIA_Milten_EXIT(C_INFO)
{
	npc = PC_MAGE;
	nr = 999;
	condition = DIA_Milten_EXIT_Condition;
	information = DIA_Milten_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Milten_EXIT_Condition()
{
	return 1;
};

func void DIA_Milten_EXIT_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
//		AI_Output(self,hero,"DIA_Milten_EXIT_02_00"); //On we go.
//		AI_Output(self,hero,"DIA_Milten_EXIT_02_00"); //Weiter geht's.
		AI_Output(self,hero,"DIA_Milten_EXIT_02_00"); //Pokračujeme.
	}
	else
	{
//		AI_Output(self,hero,"DIA_Milten_EXIT_02_01"); //See you later.
//		AI_Output(self,hero,"DIA_Milten_EXIT_02_01"); //Wir sehen uns.
		AI_Output(self,hero,"DIA_Milten_EXIT_02_01"); //Ještě se uvidíme.
	};
	AI_StopProcessInfos(self);
};

//*********************************************
// First
//*********************************************

instance DIA_Milten_First(C_INFO)
{
	npc = PC_MAGE;
	nr = 1;
	condition = DIA_Milten_First_Condition;
	information = DIA_Milten_First_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_Milten_First_Condition()
{
	if ((CorKalom_BringMCQBalls != LOG_SUCCESS) && (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)))
	&& (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Milten_First_Info()
{
//	AI_Output(self,other,"DIA_Milten_First_02_00"); //You may not cross this doorstep unless Master Corristo allows it.
//	AI_Output(self,other,"DIA_Milten_First_02_00"); //Du darfst keinen Fuß über diese Schwelle setzen, es sei denn Meister Corristo gestattet es.
	AI_Output(self,other,"DIA_Milten_First_02_00"); //Bez povolení mistra Corrista nesmíš překročit tenhle práh.
};

//*********************************************
//  hallo
//*********************************************

instance DIA_Milten_Hello(C_INFO)
{
	npc = PC_MAGE;
	nr = 1;
	condition = DIA_Milten_Hello_Condition;
	information = DIA_Milten_Hello_Info;
	permanent = 0;
//	description = "I'm looking for the High Magician of the Circle of Fire.";
//	description = "Ich suche den obersten Magier des Feuers.";
	description = "Hledám Velkého mága Kruhu ohně.";
};                       

func int DIA_Milten_Hello_Condition()
{
	if (Saturas_BringFoci == FALSE) && (!Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo))
	{
		return 1;
	};
};

func void DIA_Milten_Hello_Info()
{
//	AI_Output(other,self,"DIA_Milten_Hello_15_00"); //I'm looking for the High Magician of the Circle of Fire.
//	AI_Output(other,self,"DIA_Milten_Hello_15_00"); //Ich suche den obersten Magier des Feuers.
	AI_Output(other,self,"DIA_Milten_Hello_15_00"); //Hledám Velkého mága Kruhu ohně.
//	AI_Output(self,other,"DIA_Milten_Hello_02_01"); //That is Corristo. What do you want with him?
//	AI_Output(self,other,"DIA_Milten_Hello_02_01"); //Das ist Corristo. Was willst du von ihm?
	AI_Output(self,other,"DIA_Milten_Hello_02_01"); //To je Corristo. Co mu chceš?
};

//*********************************************
// GotoCorristo
//*********************************************

instance DIA_Milten_GotoCorristo(C_INFO)
{
	npc = PC_MAGE;
	nr = 1;
	condition = DIA_Milten_GotoCorristo_Condition;
	information = DIA_Milten_GotoCorristo_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_Milten_GotoCorristo_Condition()
{
	if ((CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE))
	&& (Npc_GetTrueGuild(hero) == GIL_STT) 
	{
		return 1;
	};
};

func void DIA_Milten_GotoCorristo_Info()
{
	if ((Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1))
	{
		//***kopierte AI_outputs, falls SC Brief noch hat***
//		AI_Output(other,self,"DIA_Milten_Hello_15_00"); //I'm looking for the High Magician of the Circle of Fire.
//		AI_Output(other,self,"DIA_Milten_Hello_15_00"); //Ich suche den obersten Magier des Feuers.
		AI_Output(other,self,"DIA_Milten_Hello_15_00"); //Hledám Velkého mága Kruhu ohně.
//		AI_Output(self,other,"DIA_Milten_Hello_02_01"); //That is Corristo. What do you want with him?
//		AI_Output(self,other,"DIA_Milten_Hello_02_01"); //Das ist Corristo. Was willst du von ihm?
		AI_Output(self,other,"DIA_Milten_Hello_02_01"); //To je Corristo. Co mu chceš?
//		AI_Output(other,self,"DIA_Milten_Letter_15_00"); //I have a letter for the High Magician of the Circle of Fire.
//		AI_Output(other,self,"DIA_Milten_Letter_15_00"); //Ich habe einen Brief für den obersten Feuermagier.
		AI_Output(other,self,"DIA_Milten_Letter_15_00"); //Mám dopis pro Velkého mága Kruhu ohně.
//		//AI_Output(self,other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Außenwelt?
//		//AI_Output(self,other,"DIA_Milten_Letter_02_01"); //Jsi kurýr z vnějšího světa?
//		//AI_Output(other,self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
//		//AI_Output(other,self,"DIA_Milten_Letter_15_02"); //Ano. Jeden mág mi dal tento dopis krátce předtím, než mě poslali do Kolonie.
//		AI_Output(self,other,"DIA_Milten_Letter_02_03"); //Show me the letter.
//		AI_Output(self,other,"DIA_Milten_Letter_02_03"); //Zeig mir den Brief.
		AI_Output(self,other,"DIA_Milten_Letter_02_03"); //Ukaž mi ten dopis.
//		AI_Output(other,self,"DIA_Milten_Letter_Give_15_00"); //Here it is.
//		AI_Output(other,self,"DIA_Milten_Letter_Give_15_00"); //Hier ist er.
		AI_Output(other,self,"DIA_Milten_Letter_Give_15_00"); //Tady je,
		B_GiveXP(XP_XardasLetter);
		if Npc_HasItems(other,ItWr_Fire_Letter_01)
		{ 
			B_GiveInvItems(other,self,ItWr_Fire_Letter_01,1);
		}
		else if Npc_HasItems(other,ItWr_Fire_Letter_02) 
		{ 
			B_GiveInvItems(other,self,ItWr_Fire_Letter_02,1);
		};
//		AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01"); //What about some kind of reward?
//		AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01"); //Wie sieht's mit einer Belohnung aus?
		AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01"); //A co takhle nějakou odměnu?
//		AI_Output(self,hero,"Info_Milten_SHSEAL_02_05"); //There will be no need for that now.
//		AI_Output(self,hero,"Info_Milten_SHSEAL_02_05"); //Das ist nicht mehr nötig.
		AI_Output(self,hero,"Info_Milten_SHSEAL_02_05"); //To už nebude třeba.
		//***kopierte AI_outputs ENDE***
	};

//	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_01"); //We have heard what you achieved in the Old Mine. Without the minecrawlers, ore mining has become much safer.
//	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_01"); //Wir haben von deiner Leistung in der Alten Mine gehört. Ohne die Minecrawler ist der Erzabbau viel sicherer geworden.
	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_01"); //Slyšeli jsme, co jsi dokázal ve Starém dole. Bez důlních červů se ruda získává daleko snadněji.
//	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_02"); //Corristo knows of your achievements, too. He wishes to speak to you. Go to him.
//	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_02"); //Auch Corristo weiß davon. Er wünscht dich zu sprechen. Geh zu ihm.
	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_02"); //Corristo také ví o tvém úspěchu. Chce s tebou mluvit. Jdi za ním.
};

//*********************************************
//  Got Brief
//*********************************************
	var int milten_HasLetter;
//*********************************************

instance DIA_Milten_Letter(C_INFO)
{
	npc = PC_MAGE;
	nr = 1;
	condition = DIA_Milten_Letter_Condition;
	information = DIA_Milten_Letter_Info;
	permanent = 0;
//	description = "I have a letter for the High Magician of the Circle of Fire.";
//	description = "Ich habe einen Brief für den obersten Feuermagier.";
	description = "Mám dopis pro Velkého mága Kruhu ohně.";
};                       

func int DIA_Milten_Letter_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Milten_Hello)) && ((Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1)))
	&& (Kapitel < 4) && (Saturas_BringFoci == FALSE)
	{
		return 1;
	};
};

func void DIA_Milten_Letter_Info()
{
//	AI_Output(other,self,"DIA_Milten_Letter_15_00"); //I have a letter for the High Magician of the Circle of Fire.
//	AI_Output(other,self,"DIA_Milten_Letter_15_00"); //Ich habe einen Brief für den obersten Feuermagier.
	AI_Output(other,self,"DIA_Milten_Letter_15_00"); //Mám dopis pro Velkého mága Kruhu ohně.
//	AI_Output(self,other,"DIA_Milten_Letter_02_01"); //Are you a messenger from the outside world?
//	AI_Output(self,other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Außenwelt?
	AI_Output(self,other,"DIA_Milten_Letter_02_01"); //Jsi kurýr z vnějšího světa?
//	AI_Output(other,self,"DIA_Milten_Letter_15_02"); //Yes. A magician gave me the letter shortly before they threw me into the colony.
//	AI_Output(other,self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
	AI_Output(other,self,"DIA_Milten_Letter_15_02"); //Ano. Jeden mág mi dal tento dopis krátce předtím, než mě poslali do Kolonie.
//	AI_Output(self,other,"DIA_Milten_Letter_02_03"); //Show me the letter.
//	AI_Output(self,other,"DIA_Milten_Letter_02_03"); //Zeig mir den Brief.
	AI_Output(self,other,"DIA_Milten_Letter_02_03"); //Ukaž mi ten dopis.
	Info_ClearChoices(DIA_Milten_Letter);
//	Info_AddChoice(DIA_Milten_Letter,"I want my reward first.",DIA_Milten_Letter_NO);
//	Info_AddChoice(DIA_Milten_Letter,"Erst will ich meine Belohnung.",DIA_Milten_Letter_NO);
	Info_AddChoice(DIA_Milten_Letter,"Nejdřív chci svoji odměnu.",DIA_Milten_Letter_NO);
//	Info_AddChoice(DIA_Milten_Letter,"Here it is.",DIA_Milten_Letter_Give);
//	Info_AddChoice(DIA_Milten_Letter,"Hier ist er.",DIA_Milten_Letter_Give);
	Info_AddChoice(DIA_Milten_Letter,"Tady je,",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
//	AI_Output(other,self,"DIA_Milten_Letter_Give_15_00"); //Here it is.
//	AI_Output(other,self,"DIA_Milten_Letter_Give_15_00"); //Hier ist er.
	AI_Output(other,self,"DIA_Milten_Letter_Give_15_00"); //Tady je,
	B_UseFakeScroll();

	B_GiveXP(XP_XardasLetter);
//	AI_Output(self,other,"DIA_Milten_Letter_Give_02_03"); //This letter is addressed to Xardas!
//	AI_Output(self,other,"DIA_Milten_Letter_Give_02_03"); //Das ist ein Brief an Xardas!
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_03"); //Ten dopis je adresován Xardasovi!
//	AI_Output(other,self,"DIA_Milten_Letter_Give_15_04"); //What's so exciting about that?
//	AI_Output(other,self,"DIA_Milten_Letter_Give_15_04"); //Und was ist daran so aufregend?
	AI_Output(other,self,"DIA_Milten_Letter_Give_15_04"); //A co je na tom tak divného?
//	AI_Output(self,other,"DIA_Milten_Letter_Give_02_05"); //Xardas has not been a servant of Innos for ages. He left us some years ago and turned towards black magic.
//	AI_Output(self,other,"DIA_Milten_Letter_Give_02_05"); //Xardas ist schon lange kein Diener Innos mehr. Vor einigen Jahren hat er uns verlassen und sich der schwarzen Magie zugewandt.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_05"); //Xardas už dlouho není Innosovým služebníkem. Odešel od nás už před pár lety a dal se na černou magii.
//	AI_Output(self,other,"DIA_Milten_Letter_Give_02_06"); //He lives in a tower in the middle of the Orc land and concentrates on his studies.
//	AI_Output(self,other,"DIA_Milten_Letter_Give_02_06"); //Er lebt in einem Turm mitten im Orkgebiet und widmet sich dort seinen Studien.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_06"); //Žije ve věži uprostřed skřetího území a soustředí se na svá studia.
//	AI_Output(self,other,"DIA_Milten_Letter_Give_02_07"); //He said he would go his own way to find out what went wrong with the Barrier.
//	AI_Output(self,other,"DIA_Milten_Letter_Give_02_07"); //Er sagte, er wolle auf seine Art herausfinden, was mit der Barriere nicht stimmt.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_07"); //Říkal, že chce sám přijít na to, co se pokazilo na Bariéře.

//	AI_Output(self,other,"DIA_Milten_Letter_Give_02_08"); //Wait here. I'll be back in a moment.
//	AI_Output(self,other,"DIA_Milten_Letter_Give_02_08"); //Warte hier. Ich bin gleich wieder da.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_08"); //Počkej tu. Hned se vrátím.
	AI_StopProcessInfos(self);
	AI_GotoWP (self,"OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self,"OCC_CHAPEL_ENTRANCE");

	if Npc_HasItems(other,ItWr_Fire_Letter_01)
	{ 
		B_GiveInvItems(other,self,ItWr_Fire_Letter_01,1);
	}
	else if Npc_HasItems(other,ItWr_Fire_Letter_02) 
	{ 
		B_GiveInvItems(other,self,ItWr_Fire_Letter_02,1);
	};
	milten_HasLetter = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void DIA_Milten_Letter_NO()
{
//	AI_Output(other,self,"DIA_Milten_Letter_NO_15_00"); //I want my reward first.
//	AI_Output(other,self,"DIA_Milten_Letter_NO_15_00"); //Erst will ich meine Belohnung.
	AI_Output(other,self,"DIA_Milten_Letter_NO_15_00"); //Nejdřív chci svoji odměnu.
//	AI_Output(self,other,"DIA_Milten_Letter_NO_02_01"); //Corristo will ask Torrez to give it to you as soon as he has the letter.
//	AI_Output(self,other,"DIA_Milten_Letter_NO_02_01"); //Corristo wird Torrez anweisen, sie dir zu geben, sobald er den Brief erhalten hat.
	AI_Output(self,other,"DIA_Milten_Letter_NO_02_01"); //Corristo dá vědět Torrezovi, aby ti ji dal, hned jak dostane ten dopis.
//	AI_Output(self,other,"DIA_Milten_Letter_NO_02_02"); //I'm a servant of Innos - I never lie. Now give me the letter.
//	AI_Output(self,other,"DIA_Milten_Letter_NO_02_02"); //Ich bin ein Diener Innos - ich lüge niemals. Gib mir den Brief jetzt.
	AI_Output(self,other,"DIA_Milten_Letter_NO_02_02"); //Jsem Innosův služebník - nikdy nelžu. Teď mi dej ten dopis.
	Info_ClearChoices(DIA_Milten_Letter);
//	Info_AddChoice(DIA_Milten_Letter,"I'd rather give the letter to Torrez himself.",DIA_Milten_Letter_NO_AGAIN);
//	Info_AddChoice(DIA_Milten_Letter,"Ich möchte den Brief lieber Torrez direkt geben.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice(DIA_Milten_Letter,"Raději bych ten dopis dal přímo Torrezovi.",DIA_Milten_Letter_NO_AGAIN);
//	Info_AddChoice(DIA_Milten_Letter,"Here it is.",DIA_Milten_Letter_Give);
//	Info_AddChoice(DIA_Milten_Letter,"Hier ist er.",DIA_Milten_Letter_Give);
	Info_AddChoice(DIA_Milten_Letter,"Tady je,",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
//	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //I'd rather give the letter to Torrez himself.
//	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Ich möchte den Brief lieber Torrez direkt geben.
	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Raději bych ten dopis dal přímo Torrezovi.
//	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //I can't talk you out of that, can I?
//	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //Du lässt nicht mit dir reden, hm?
	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //Ty nechceš, abych ho četl, viď?
//	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //No. I want to see my reward first.
//	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //Nein. Ich will erst meine Belohnung sehen!
	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //Ne. Chci nejdřív vidět odměnu.
//	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Well then. If that's what you want. Wait here.
//	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Nun gut. Du willst es nicht anders. Warte hier.
	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Nu dobře. Když teda chceš. Počkej tady.

	Info_ClearChoices(DIA_Milten_Letter);
	AI_StopProcessInfos(self);

	AI_GotoWP (self,"OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self,"OCC_CHAPEL_ENTRANCE");
	milten_HasLetter = FALSE;
	Npc_SetRefuseTalk(self,10);
};

//*********************************************
//  Got Brief
//*********************************************

instance DIA_Milten_ComesBack(C_INFO)
{
	npc = PC_MAGE;
	nr = 1;
	condition = DIA_Milten_ComesBack_Condition;
	information = DIA_Milten_ComesBack_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_Milten_ComesBack_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Milten_Letter)) && (Npc_RefuseTalk(self) == FALSE) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void DIA_Milten_ComesBack_Info()
{
	if (milten_HasLetter==FALSE)
	{
//		AI_Output(self,other,"DIA_Milten_ComesBack_02_00"); //Corristo was not very pleased to see that you have so little faith in the servants of Innos.
//		AI_Output(self,other,"DIA_Milten_ComesBack_02_00"); //Corristo war nicht sehr erfreut, dass du den Dienern Innos so wenig Vertrauen entgegen bringst.
		AI_Output(self,other,"DIA_Milten_ComesBack_02_00"); //Corristo neměl moc velkou radost, když viděl, jak malou důvěru máš ve služebníky Innosovy.
//		AI_Output(self,other,"DIA_Milten_ComesBack_02_01"); //But he says you may go to Torrez and let him give you the usual reward.
//		AI_Output(self,other,"DIA_Milten_ComesBack_02_01"); //Aber er sagt, du sollst zu Torrez gehen und dir die übliche Belohnung geben lassen.
		AI_Output(self,other,"DIA_Milten_ComesBack_02_01"); //Ale říkal, že máš jít k Torrezovi a vzít si obvyklou odměnu.
	}
	else
	{
//		AI_Output(self,other,"DIA_Milten_ComesBack_02_02"); //Corristo was beside himself with delight. He said that you may go to Torrez and choose your reward.
//		AI_Output(self,other,"DIA_Milten_ComesBack_02_02"); //Corristo war ganz außer sich vor Freude. Er sagt, du kannst zu Torrez gehen und dir deine Belohnung selbst aussuchen.
		AI_Output(self,other,"DIA_Milten_ComesBack_02_02"); //Corristo byl celý bez sebe potěšením. Řekl, že můžeš jít k Torrezovi a vybrat si svou odměnu.
	};
};

//*********************************************
// Wo finde ich Torrez?
//*********************************************

instance DIA_Milten_WoTorrez(C_INFO)
{
	npc = PC_MAGE;
	nr = 1;
	condition = DIA_Milten_WoTorrez_Condition;
	information = DIA_Milten_WoTorrez_Info;
	permanent = 0;
//	description = "Where can I find Torrez?";
//	description = "Wo finde ich Torrez?";
	description = "Kde najdu Torreze?";
};                       

func int DIA_Milten_WoTorrez_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Milten_ComesBack) && (Saturas_BringFoci == FALSE))
	{
		return 1;
	};
};

func void DIA_Milten_WoTorrez_Info()
{
//	AI_Output(other,self,"DIA_Milten_WoTorrez_15_00"); //Where can I find Torrez?
//	AI_Output(other,self,"DIA_Milten_WoTorrez_15_00"); //Wo finde ich Torrez?
	AI_Output(other,self,"DIA_Milten_WoTorrez_15_00"); //Kde najdu Torreze?
//	AI_Output(self,other,"DIA_Milten_WoTorrez_02_01"); //He is in front of the temple building all day.
//	AI_Output(self,other,"DIA_Milten_WoTorrez_02_01"); //Er ist den ganzen Tag draußen hier vorm Tempelgebäude.
	AI_Output(self,other,"DIA_Milten_WoTorrez_02_01"); //Je celý den před budovou chrámu.
//	AI_Output(self,other,"DIA_Milten_WoTorrez_02_02"); //At night he is inside like all the others - but only magicians may enter the temple house, so you can only speak to him during the day.
//	AI_Output(self,other,"DIA_Milten_WoTorrez_02_02"); //Nachts ist er wie alle anderen drinnen - aber nur Magier dürfen das Tempelhaus betreten. Also kannst du ihn nur tagsüber sprechen.
	AI_Output(self,other,"DIA_Milten_WoTorrez_02_02"); //V noci je uvnitř jako všichni ostatní - ale do chrámu smějí vstoupit jenom mágové, takže s ním můžeš mluvit jedině přes den.
};

//*********************************************
// Noch ein Brief
//*********************************************

instance DIA_Milten_NochEinBrief(C_INFO)
{
	npc = PC_MAGE;
	nr = 2;
	condition = DIA_Milten_NochEinBrief_Condition;
	information = DIA_Milten_NochEinBrief_Info;
	permanent = 0;
//	description = "I have a letter from the Magicians of Water.";
//	description = "Ich habe da noch einen Brief von den Wassermagiern.";
	description = "Mám dopis od mágů Kruhu vody.";
};                       

func int DIA_Milten_NochEinBrief_Condition()
{
	if ((Cronos_Messenger == LOG_RUNNING) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void DIA_Milten_NochEinBrief_Info()
{
//	AI_Output(other,self,"DIA_Milten_NochEinBrief_15_00"); //I have a letter from the Magicians of Water.
//	AI_Output(other,self,"DIA_Milten_NochEinBrief_15_00"); //Ich habe da noch einen Brief von den Wassermagiern.
	AI_Output(other,self,"DIA_Milten_NochEinBrief_15_00"); //Mám dopis od mágů Kruhu vody.
//	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_01"); //Ah! Very good! I'll give it to Corristo.
//	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_01"); //Ah! Sehr gut! Ich werde ihn an Corristo weiterleiten.
	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_01"); //Ach! Výborně! Dám ho Corristovi.
//	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_02"); //When you're back in the New Camp, the Magicians of Water will surely reward you for your efforts.
//	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_02"); //Wenn du wieder im Neuen Lager bist, werden die Wassermagier dich sicherlich für deine Mühen belohnen.
	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_02"); //Až se vrátíš do Nového tábora, mágové Vody tě za tvoji snahu jistě odmění.

	Cronos_Messenger = LOG_SUCCESS;
	B_GiveInvItems(other,self,Cronos_Brief,1);
};

//*********************************************
// PERM
//*********************************************

instance DIA_Milten_PERM(C_INFO)
{
	npc = PC_MAGE;
	nr = 1;
	condition = DIA_Milten_PERM_Condition;
	information = DIA_Milten_PERM_Info;
	permanent = 0;
//	description = "Tell me something about the Magicians of Fire.";
//	description = "Erzähl mir was über die Feuermagier.";
	description = "Řekni mi něco o mázích Ohně.";
};                       

func int DIA_Milten_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Milten_ComesBack) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void DIA_Milten_PERM_Info()
{
//	AI_Output(other,self,"DIA_Milten_PERM_15_00"); //Tell me something about the Magicians of Fire.
//	AI_Output(other,self,"DIA_Milten_PERM_15_00"); //Erzähl mir was über die Feuermagier.
	AI_Output(other,self,"DIA_Milten_PERM_15_00"); //Řekni mi něco o mázích Ohně.
//	AI_Output(self,other,"DIA_Milten_PERM_02_01"); //The Circle of Fire takes its powers from the grace of Innos. The god of light, truth and justice watches over us.
//	AI_Output(self,other,"DIA_Milten_PERM_02_01"); //Der Kreis des Feuers bezieht seine Macht von der Gnade Innos. Der Gott des Lichts, der Wahrheit und der Gerechtigkeit wacht über uns.
	AI_Output(self,other,"DIA_Milten_PERM_02_01"); //Kruh ohně čerpá moc z milosti Innos. Bůh světla, pravdy a spravedlnosti na nás dozírá.
//	AI_Output(self,other,"DIA_Milten_PERM_02_02"); //The magicians consider themselves to be the chosen ones - and that's how they treat others.
//	AI_Output(self,other,"DIA_Milten_PERM_02_02"); //Die Magier betrachten sich selber als die Erwählten - und so behandeln sie auch alle anderen.
	AI_Output(self,other,"DIA_Milten_PERM_02_02"); //Mágové se sami rozhodli, že se stanou vyvolenými - a tak jednají i s ostatními.
//	AI_Output(self,other,"DIA_Milten_PERM_02_03"); //I was lucky to be admitted. Corristo made me his apprentice. He probably just wanted some entertainment.
//	AI_Output(self,other,"DIA_Milten_PERM_02_03"); //Ich hatte das Glück, damals aufgenommen zu werden. Corristo hat mich zu seinem Lehrling gemacht. Vermutlich hatte er einfach Lust auf Unterhaltung.
	AI_Output(self,other,"DIA_Milten_PERM_02_03"); //Měl jsem štěstí, že jsem byl přijat. Corristo mě přijal za učedníka. Nejspíš potřeboval nějakou zábavu.
//	AI_Output(self,other,"DIA_Milten_PERM_02_04"); //Since then, I've been trying to improve my magic skills every day in order to be admitted to the next Circle.
//	AI_Output(self,other,"DIA_Milten_PERM_02_04"); //Seitdem bemühe ich mich jeden Tag, meine magischen Fähigkeiten zu steigern, damit ich in den nächsten Kreis aufgenommen werden kann.
	AI_Output(self,other,"DIA_Milten_PERM_02_04"); //Od té doby jsem se pak snažil každý den zlepšovat v magickém umění, abych byl přijatý to dalšího Kruhu.
};

//*********************************************
// WannaMage
//*********************************************

instance DIA_Milten_WannaMage(C_INFO)
{
	npc = PC_MAGE;
	nr = 2;
	condition = DIA_Milten_WannaMage_Condition;
	information = DIA_Milten_WannaMage_Info;
	permanent = 1;
//	description = "I want to become a magician's apprentice, too. Just like you.";
//	description = "Ich will ein Lehrling der Magier werden - so wie du.";
	description = "Chci se taky stát kouzelnickým učněm - jako ty.";
};                       

func int DIA_Milten_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Milten_PERM) && (CorKalom_BringMCQBalls != LOG_SUCCESS))
	{
		return 1;
	};
};

func void DIA_Milten_WannaMage_Info()
{
//	AI_Output(other,self,"DIA_Milten_WannaMage_15_00"); //I want to become a magician's apprentice, too. Just like you.
//	AI_Output(other,self,"DIA_Milten_WannaMage_15_00"); //Ich will ein Lehrling der Magier werden - so wie du.
	AI_Output(other,self,"DIA_Milten_WannaMage_15_00"); //Chci se taky stát kouzelnickým učněm - jako ty.
//	AI_Output(self,other,"DIA_Milten_WannaMage_02_01"); //Corristo chose me because I did something special for the Ore Barons.
//	AI_Output(self,other,"DIA_Milten_WannaMage_02_01"); //Corristo hat mich damals erwählt, weil ich eine besondere Sache für die Erzbarone erledigt habe.
	AI_Output(self,other,"DIA_Milten_WannaMage_02_01"); //Corristo mě vybral, protože jsem vykonal něco významného pro Rudobarony.
//	AI_Output(self,other,"DIA_Milten_WannaMage_02_02"); //Unless you do something truly exceptional, he will never consider you for apprenticeship.
//	AI_Output(self,other,"DIA_Milten_WannaMage_02_02"); //Ohne dass du etwas Herausragendes leistest, wird er dich nicht als Lehrling in Betracht ziehen.
	AI_Output(self,other,"DIA_Milten_WannaMage_02_02"); //Dokud nevykonáš něco opravdu významného, nikdy tě do učení nevezme.
//	AI_Output(self,other,"DIA_Milten_WannaMage_02_03"); //Besides, you must belong to the Old Camp. I doubt if Corristo would take a member of any other camp for his apprentice.
//	AI_Output(self,other,"DIA_Milten_WannaMage_02_03"); //Du mußt außerdem dem Alten Lager angehören. Ich kann mir nicht vorstellen, dass Corristo ein Mitglied eines anderen Lagers als Lehrling akzeptiert.
	AI_Output(self,other,"DIA_Milten_WannaMage_02_03"); //Kromě toho musíš patřit ke Starému táboru. Neumím si představit, že by Corristo přijal do učení někoho, kdo je členem nějakého jiného tábora.
};

//#####################################################################
//##
//##
//## KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
// Info SHWAIT
//***************************************************************************
instance Info_Milten_SHWAIT(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHWAIT_Condition;
	information = Info_Milten_SHWAIT_Info;
	important = 1;
	permanent = 0;
};

func int Info_Milten_SHWAIT_Condition()
{
	if (Npc_GetDistToWP(hero,"OW_PATH_274")<1000)
	{
		return 1;
	}; 
};

func void Info_Milten_SHWAIT_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Milten_SHWAIT_02_01"); //Greetings! My friend Lester from the swamp camp told me about your great deeds there!
//	AI_Output(self,hero,"Info_Milten_SHWAIT_02_01"); //Sei gegrüßt! Mein Freund Lester aus dem Sumpflager hat mir von deinen großen Taten dort erzählt!
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_01"); //Buď zdráv! Můj přítel Lester z tábora v bažinách mi řekl o tvých velkých skutcích!
//	AI_Output(self,hero,"Info_Milten_SHWAIT_02_02"); //I am impressed. You have become very strong.
//	AI_Output(self,hero,"Info_Milten_SHWAIT_02_02"); //Ich bin beeindruckt. Du bist sehr stark geworden.
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_02"); //Jsem ohromen. Stal ses velmi silným.
//	AI_Output(hero,self,"Info_Milten_SHWAIT_15_03"); //I do my best.
//	AI_Output(hero,self,"Info_Milten_SHWAIT_15_03"); //Man tut, was man kann.
	AI_Output(hero,self,"Info_Milten_SHWAIT_15_03"); //Dělám, jak umím.
//	AI_Output(self,hero,"Info_Milten_SHWAIT_02_04"); //Ah, yes. Always modest, aren't you?
//	AI_Output(self,hero,"Info_Milten_SHWAIT_02_04"); //Ja, ja, immer bescheiden, was?
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_04"); //Ano, ano, stále skromný, že?
};

//***************************************************************************
// Info SHGORN
//***************************************************************************
instance Info_Milten_SHGORN(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHGORN_Condition;
	information = Info_Milten_SHGORN_Info;
	important = 0;
	permanent = 0;
//	description = "I met Gorn.";
//	description = "Ich habe Gorn getroffen";
	description = "Potkal jsem Gorna.";
};

func int Info_Milten_SHGORN_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHWAIT) && Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHGORN_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHGORN_15_01"); //I met Gorn.
//	AI_Output(hero,self,"Info_Milten_SHGORN_15_01"); //Ich habe Gorn getroffen.
	AI_Output(hero,self,"Info_Milten_SHGORN_15_01"); //Potkal jsem Gorna.
//	AI_Output(self,hero,"Info_Milten_SHGORN_02_02"); //Really? Where?
//	AI_Output(self,hero,"Info_Milten_SHGORN_02_02"); //Wirklich? Wo?
	AI_Output(self,hero,"Info_Milten_SHGORN_02_02"); //Opravdu? Kde?
//	AI_Output(hero,self,"Info_Milten_SHGORN_15_03"); //By the old ruined monastery by the sea. The two of us searched it for treasures.
//	AI_Output(hero,self,"Info_Milten_SHGORN_15_03"); //An der alten Klosterruine am Meer. Wir haben sie gemeinsam nach Schätzen durchsucht.
	AI_Output(hero,self,"Info_Milten_SHGORN_15_03"); //U staré rozvaliny kláštera u moře. Hledali jsme tam oba poklad.
//	AI_Output(self,hero,"Info_Milten_SHGORN_02_04"); //I am sure he'll tell me all about it when we meet again.
//	AI_Output(self,hero,"Info_Milten_SHGORN_02_04"); //Davon wird er mir bei unserem nächsten Treffen bestimmt erzählen.
	AI_Output(self,hero,"Info_Milten_SHGORN_02_04"); //Jsem přesvědčený, že mi o tom bude vyprávět, až se spolu zase setkáme.
};

//***************************************************************************
// Info SHLESTER
//***************************************************************************
instance Info_Milten_SHLESTER(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHLESTER_Condition;
	information = Info_Milten_SHLESTER_Info;
	important = 0;
	permanent = 0;
//	description = "Lester and I took out the mountain fort.";
//	description = "Lester und ich haben die Bergfestung ausgenommen";
	description = "Byli jsme s Lesterem v horské pevnosti.";
};

func int Info_Milten_SHLESTER_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHWAIT) && Npc_KnowsInfo(hero,PC_Psionic_FINISH))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHLESTER_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHLESTER_15_01"); //Lester and I took out the mountain fort.
//	AI_Output(hero,self,"Info_Milten_SHLESTER_15_01"); //Lester und ich haben die Bergfestung ausgenommen.
	AI_Output(hero,self,"Info_Milten_SHLESTER_15_01"); //Vyloupili jsme s Lesterem horskou pevnost.
//	AI_Output(self,hero,"Info_Milten_SHLESTER_02_02"); //He told me about it. Apparently you can be trusted.
//	AI_Output(self,hero,"Info_Milten_SHLESTER_02_02"); //Er hat mir davon erzählt. Du scheinst vertrauenswürdig zu sein.
	AI_Output(self,hero,"Info_Milten_SHLESTER_02_02"); //Vyprávěl mi o tom. Vypadá to, že ti můžeme věřit.
//	AI_Output(hero,self,"Info_Milten_SHLESTER_15_03"); //Where have the four of you been meeting so far?
//	AI_Output(hero,self,"Info_Milten_SHLESTER_15_03"); //Wo habt ihr vier euch bisher getroffen?
	AI_Output(hero,self,"Info_Milten_SHLESTER_15_03"); //Kde jste se vy čtyři doposud setkávali?
//	AI_Output(self,hero,"Info_Milten_SHLESTER_02_04"); //Oh, here and there. We meet in a lot of different places.
//	AI_Output(self,hero,"Info_Milten_SHLESTER_02_04"); //Ach, hier und da. Wir treffen uns an den verschiedensten Orten.
	AI_Output(self,hero,"Info_Milten_SHLESTER_02_04"); //Och, tu i onde. Setkávali jsme se na nejrůznějších místech.
};

//***************************************************************************
// Info SHYOU
//***************************************************************************
instance Info_Milten_SHYOU(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHYOU_Condition;
	information = Info_Milten_SHYOU_Info;
	important = 0;
	permanent = 0;
//	description = "What are you doing here?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};

func int Info_Milten_SHYOU_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHWAIT))
	{
		return 1;
	}; 
};

func void Info_Milten_SHYOU_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHYOU_15_01"); //What are you doing here?
//	AI_Output(hero,self,"Info_Milten_SHYOU_15_01"); //Was machst du hier?
	AI_Output(hero,self,"Info_Milten_SHYOU_15_01"); //Co děláš tady?
//	AI_Output(self,hero,"Info_Milten_SHYOU_02_02"); //There is an ancient ring of stone not far from here. In its center lies the entrance to an underground vault.
//	AI_Output(self,hero,"Info_Milten_SHYOU_02_02"); //Nicht weit von hier befindet sich ein uraltes Stonehenge, in dessen Mitte der Eingang zu einem unterirdischen Gewölbe liegt.
	AI_Output(self,hero,"Info_Milten_SHYOU_02_02"); //Nedaleko odtud je prastarý kamenný kruh, v jeho středu leží vstup do podzemních prostory.
//	AI_Output(hero,self,"Info_Milten_SHYOU_15_03"); //Some sort of tomb?
//	AI_Output(hero,self,"Info_Milten_SHYOU_15_03"); //Eine Art Gruft?
	AI_Output(hero,self,"Info_Milten_SHYOU_15_03"); //Nějaká hrobka?
//	AI_Output(self,hero,"Info_Milten_SHYOU_02_04"); //Yes, something like that.
//	AI_Output(self,hero,"Info_Milten_SHYOU_02_04"); //Ja, so was in der Richtung.
	AI_Output(self,hero,"Info_Milten_SHYOU_02_04"); //Ano, něco takového.
//	AI_Output(self,hero,"Info_Milten_SHYOU_02_05"); //There is something in that tomb that I'd like to have.
//	AI_Output(self,hero,"Info_Milten_SHYOU_02_05"); //In dieser Gruft gibt es etwas, das ich gerne haben würde.
	AI_Output(self,hero,"Info_Milten_SHYOU_02_05"); //V té hrobce je něco, co bych chtěl mít.
};

//***************************************************************************
// Info SHME
//***************************************************************************
instance Info_Milten_SHME(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHME_Condition;
	information = Info_Milten_SHME_Info;
	important = 0;
	permanent = 0;
//	description = "I'm looking for a focus stone.";
//	description = "Ich suche nach einem Fokusstein.";
	description = "Hledám ohniskový kámen.";
};

func int Info_Milten_SHME_Condition()
{
	if Npc_KnowsInfo(hero,Info_Milten_SHWAIT)
	&& !Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	{
		return 1;
	}; 
};

func void Info_Milten_SHME_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHME_15_01"); //I'm looking for a focus stone. It must be here somewhere.
//	AI_Output(hero,self,"Info_Milten_SHME_15_01"); //Ich suche nach einem Fokusstein. Er muss irgendwo hier in der Gegend sein.
	AI_Output(hero,self,"Info_Milten_SHME_15_01"); //Hledám ohniskový kámen. Někde tady v okolí musí být.
//	AI_Output(self,hero,"Info_Milten_SHME_02_02"); //That almost sounds as if we were both looking for something in the same place.
//	AI_Output(self,hero,"Info_Milten_SHME_02_02"); //Hört sich fast so an, als ob wir beide etwas am gleichen Ort suchen würden.
	AI_Output(self,hero,"Info_Milten_SHME_02_02"); //Vypadá to, jako bychom oba něco hledali na stejném místě.
};

//***************************************************************************
// Info SHPROBLEM
//***************************************************************************
instance Info_Milten_SHPROBLEM(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHPROBLEM_Condition;
	information = Info_Milten_SHPROBLEM_Info;
	important = 0;
	permanent = 0;
//	description = "Why don't you go down into the tomb and get what you're looking for?";
//	description = "Warum gehst du nicht in die Gruft und holst dir was du suchst?";
	description = "Proč nejdeš dolů do té hrobky a nevezmeš si to, co hledáš?";
};

func int Info_Milten_SHPROBLEM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHYOU))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHPROBLEM_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_01"); //Why don't you go down into the tomb and get what you're looking for?
//	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_01"); //Warum gehst du nicht in die Gruft und holst dir was du suchst?
	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_01"); //Proč nejdeš dolů do té hrobky a nevezmeš si to, co hledáš?
//	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Oh, that's a long story. I'd have to go a long way back to explain.
//	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Oh, das ist nicht so schnell erzählt. Dafür müsste ich etwas weiter ausholen.
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Och, to je dlouhý příběh. Musel bych jít hodně do minulosti, abych to mohl vysvětlit.
//	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Go ahead, I'm in no hurry.
//	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Erzähl, ich habe Zeit !
	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Vyprávěj, já nespěchám.
//	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_04"); //Alright! After the creation of the Magic Barrier which imprisons us all...
//	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_04"); //Nun gut! Nach der Erschaffung der magischen Barriere, die uns alle hier gefangen hält ...
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_04"); //Dobře! Po vytvoření magické Bariéry, která nás všechny uvěznila...
//	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_05"); //... one of the magicians sealed a magic artefact down there.
//	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_05"); //...hat einer der beteiligten Magier ein magisches Artefakt dort unten versiegelt.
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_05"); //...zapečetil tam dole jeden mág nějaký magický artefakt.
};

//***************************************************************************
// Info SHFOCUS
//***************************************************************************
instance Info_Milten_SHFOCUS(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHFOCUS_Condition;
	information = Info_Milten_SHFOCUS_Info;
	important = 0;
	permanent = 0;
//	description = "Is this artefact one of the five focus stones?";
//	description = "Ist dieses Artefakt einer der fünf Fokussteine?";
	description = "Není ten artefakt jeden z pěti ohniskových kamenů?";
};

func int Info_Milten_SHFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHPROBLEM))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHFOCUS_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_01"); //Is this artefact one of the five focus stones?
//	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_01"); //Ist dieses Artefakt einer der fünf Fokussteine?
	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_01"); //Není ten artefakt jeden z pěti ohniskových kamenů?
//	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_02"); //Exactly! So you already know the story of the five focus stones?
//	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_02"); //Genau! Dann kennst du die Geschichte der fünf Fokussteine wohl schon. 
	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_02"); //Přesně tak! Takže ty už znáš příběh pěti ohniskových kamenů.
//	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_03"); //Don't tell me you're after the focus as well!
//	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_03"); //Jetzt sag bloß, du bist auch hinter diesem Fokus her?
	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_03"); //Neříkej mi, že také hledáš to ohnisko!
//	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_04"); //No. I'm not interested in the focus stone. I'm looking for an Orcish talisman.
//	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_04"); //Nein. Der Fokusstein interessiert mich nicht. Ich suche einen orkischen Talisman.
	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_04"); //Ne. Mě ohniskový kámen nezajímá. Já hledám skřetí talisman.
};

//***************************************************************************
// Info SHSEAL
//***************************************************************************
instance Info_Milten_SHSEAL(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHSEAL_Condition;
	information = Info_Milten_SHSEAL_Info;
	important = 0;
	permanent = 0;
//	description = "The artefact was sealed away?";
//	description = "Das Artefakt wurde versiegelt?";
	description = "Ten artefakt byl zapečetěn?";
};

func int Info_Milten_SHSEAL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHPROBLEM))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHSEAL_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHSEAL_15_01"); //The artefact was sealed away?
//	AI_Output(hero,self,"Info_Milten_SHSEAL_15_01"); //Das Artefakt wurde versiegelt?
	AI_Output(hero,self,"Info_Milten_SHSEAL_15_01"); //Ten artefakt byl zapečetěn?
//	AI_Output(self,hero,"Info_Milten_SHSEAL_02_02"); //Yes. A powerful spell protects it. The first grave robber trying to swipe the focus...
//	AI_Output(self,hero,"Info_Milten_SHSEAL_02_02"); //Ja. Ein mächtiger Bannzauber bewirkt, dass der erste Grabräuber, der sich den Fokus unter den Nagel reißen will ...
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_02"); //Ano. Chrání ho mocné kouzlo. První vykradač hrobů, který se pokusí ukrást ohnisko...
//	AI_Output(self,hero,"Info_Milten_SHSEAL_02_03"); //... will be cursed, and doomed to an existence as a restless undead, who will have to protect the tomb from other grave robbers.
//	AI_Output(self,hero,"Info_Milten_SHSEAL_02_03"); //... zu einem Dasein als ruheloser Untoter verflucht wird, der fortan diese Gruft vor allen nachfolgenden Grabräuber beschützen soll.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_03"); //...bude proklet a začarován do nesmrtelné bytosti, která nepozná odpočinek a která bude střežit hrobku před dalšími vykradači hrobů.
//	AI_Output(hero,self,"Info_Milten_SHSEAL_15_04"); //How can you get past that curse?
//	AI_Output(hero,self,"Info_Milten_SHSEAL_15_04"); //Wie kommst du dann an diesem Bannzauber vorbei?
	AI_Output(hero,self,"Info_Milten_SHSEAL_15_04"); //Jak se vyhneš té kletbě?
//	AI_Output(self,hero,"Info_Milten_SHSEAL_02_05"); //There will be no need for that now.
//	AI_Output(self,hero,"Info_Milten_SHSEAL_02_05"); //Das ist nicht mehr nötig.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_05"); //To už nebude třeba.
//	AI_Output(self,hero,"Info_Milten_SHSEAL_02_06"); //Some years ago, an Ore Baron out pleasure hunting for Orcs was careless enough to enter the tomb.
//	AI_Output(self,hero,"Info_Milten_SHSEAL_02_06"); //Vor einigen Jahren war ein Erzbaron, der zum Zeitvertreib Orks jagte, unvorsichtig genug, die Gruft zu betreten.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_06"); //Před několika lety se jeden Rudobaron, který z dlouhé chvíle lovil skřety, neopatrně přiblížil k hrobce a vstoupil do ní.
//	AI_Output(self,hero,"Info_Milten_SHSEAL_02_07"); //Now HE is the guard of the treasures down there.
//	AI_Output(self,hero,"Info_Milten_SHSEAL_02_07"); //Nun ist ER der Wächter über alle Schätze dort unten.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_07"); //Teď je ON strážcem toho starého pokladu.
};

//***************************************************************************
// Info SHTALISMAN
//***************************************************************************
instance Info_Milten_SHTALISMAN(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHTALISMAN_Condition;
	information = Info_Milten_SHTALISMAN_Info;
	important = 0;
	permanent = 0;
//	description = "What about that talisman?";
//	description = "Was hat es mit diesem Talisman auf sich?";
	description = "A co ten talisman?";
};

func int Info_Milten_SHTALISMAN_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHFOCUS))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHTALISMAN_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHTALISMAN_15_01"); //What about that talisman?
//	AI_Output(hero,self,"Info_Milten_SHTALISMAN_15_01"); //Was hat es mit diesem Talisman auf sich?
	AI_Output(hero,self,"Info_Milten_SHTALISMAN_15_01"); //A co ten talisman?
//	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_02"); //I believe its former owner used it to defend himself against angry Orcs.
//	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Ich vermute, sein ehemaliger Besitzer benutzte ihn, um sich wütende Orks vom Hals zu halten.
	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Myslím, že ho jeho bývalý majitel používal k vlastní obraně před rozzlobenými skřety.
//	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_03"); //If I'm right, the talisman may be of great use.
//	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Wenn ich Recht habe, kann der Talisman von großem Nutzen sein.
	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Jestli mám pravdu, pak může být ten talisman velice užitečný.
};

//***************************************************************************
// Info SHOFFER
//***************************************************************************
instance Info_Milten_SHOFFER(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHOFFER_Condition;
	information = Info_Milten_SHOFFER_Info;
	important = 0;
	permanent = 0;
//	description = "We should seek out the tomb together!";
//	description = "Wir sollten die Gruft gemeinsam ausheben!";
	description = "Měli bychom hrobku prohledat společně.";
};

func int Info_Milten_SHOFFER_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHSEAL)
	&& Npc_KnowsInfo(hero,Info_Milten_SHTALISMAN))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHOFFER_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHOFFER_15_01"); //We should seek out the tomb together! You get the talisman, and I'll have the focus stone.
//	AI_Output(hero,self,"Info_Milten_SHOFFER_15_01"); //Wir sollten die Gruft gemeinsam ausheben! Du bekommst den Talisman und ich den Fokusstein.
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_01"); //Měli bychom hrobku prohledat společně. Ty dostaneš talisman a já ohniskový kámen.
//	AI_Output(self,hero,"Info_Milten_SHOFFER_02_02"); //Alright, but there is one little problem...
//	AI_Output(self,hero,"Info_Milten_SHOFFER_02_02"); //Einverstanden, aber da gibt es noch ein 'kleines' Problem ...
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_02"); //Dobře, je tu ale jeden malý problém...
//	AI_Output(hero,self,"Info_Milten_SHOFFER_15_03"); //A problem?
//	AI_Output(hero,self,"Info_Milten_SHOFFER_15_03"); //Ein Problem?
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_03"); //Problém?
//	AI_Output(self,hero,"Info_Milten_SHOFFER_02_04"); //Yes. The guard down there in the tomb...
//	AI_Output(self,hero,"Info_Milten_SHOFFER_02_04"); //Ja. Der Wächter da unten in der Gruft ...
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_04"); //Ano. Ten strážce dole v hrobce...
//	AI_Output(hero,self,"Info_Milten_SHOFFER_15_05"); //Can't he be cut into handy little pieces?
//	AI_Output(hero,self,"Info_Milten_SHOFFER_15_05"); //Kann man ihn nicht in handliche Stücke zerlegen?
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_05"); //Nemůžeme ho prostě rozsekat na kousky?
//	AI_Output(self,hero,"Info_Milten_SHOFFER_02_06"); //That wouldn't be too easy. He seems to be extremely resistant against the effects of normal weapons.
//	AI_Output(self,hero,"Info_Milten_SHOFFER_02_06"); //Zumindest nicht so einfach. Er scheint gegen die Wirkung normaler Waffen extrem widerstandsfähig zu sein.
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_06"); //To není tak snadné. Vypadá to, že je neuvěřitelně odolný vůči normálním zbraním.
//	AI_Output(hero,self,"Info_Milten_SHOFFER_15_07"); //Let me guess, you already got a plan, right?
//	AI_Output(hero,self,"Info_Milten_SHOFFER_15_07"); //Lass mich raten, du hast bereits einen Plan dafür, richtig?
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_07"); //Nech mě hádat, ty už máš připravený plán, viď?
//	AI_Output(self,hero,"Info_Milten_SHOFFER_02_08"); //Uhm... well... I have a plan but I can't carry it out on my own.
//	AI_Output(self,hero,"Info_Milten_SHOFFER_02_08"); //Ähem ... tja also ... einen Plan habe ich schon, aber ich kann ihn nicht alleine durchführen.
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_08"); //Ech... no... Mám plán, ale nedokážu ho provést sám.
};

//***************************************************************************
// Info SHOFFER2
//***************************************************************************
instance Info_Milten_SHOFFER2(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHOFFER2_Condition;
	information = Info_Milten_SHOFFER2_Info;
	important = 0;
	permanent = 0;
//	description = "Tell me!";
//	description = "Lass hören!";
	description = "Povídej!";
};

func int Info_Milten_SHOFFER2_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHOFFER))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHOFFER2_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_01"); //Tell me!
//	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_01"); //Lass hören!
	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_01"); //Povídej!
//	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_02"); //I have a spell scroll with a very powerful spell here.
//	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_02"); //Ich habe hier eine Spruchrolle, die einen sehr mächtigen Zauber enthält.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_02"); //Mám s sebou kouzelný svitek s velmi mocným zaříkávadlem.
//	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_03"); //The spell will destroy all the undead who fall under it.
//	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_03"); //Der Zauber vernichtet jeden Untoten, der davon getroffen wird.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_03"); //To kouzlo zničí všechny nemrtvé, které zasáhne.
//	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_04"); //Then it should be child's play to take out the tomb.
//	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_04"); //Damit sollte das Ausheben der Gruft ein Kinderspiel werden.
	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_04"); //Pak by mělo být vybrání hrobky hračka.
//	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_05"); //Mhmm... Well... Not quite! The guard is not on his own any longer.
//	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_05"); //Tja ... also... nicht ganz! Der Wächter hat mittlerweile Gesellschaft bekommen.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_05"); //Hmmm... Dobře... Ne tak docela! Ten strážce tam už není tak docela sám.
//	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_06"); //Probably later grave robbers who were no more successful than he was.
//	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_06"); //Wahrscheinlich nachfolgende Grabräuber, die wenig erfolgreich waren.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_06"); //Nejspíš nějaký pozdější vykradač hrobů, který nebyl o moc úspěšnější než ten první.
//	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_07"); //I went down there once, and I was nearly killed. One man on his own cannot do much there.
//	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_07"); //Ich war bereits einmal dort unten und wäre fast getötet worden. Einer alleine kann da nicht viel ausrichten.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_07"); //Jednou jsem sešel dolu a skoro mě zabili. Jeden muž tam sám jít nemůže.
};

//***************************************************************************
// Info SHACCEPT
//***************************************************************************
instance Info_Milten_SHACCEPT(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHACCEPT_Condition;
	information = Info_Milten_SHACCEPT_Info;
	important = 0;
	permanent = 0;
//	description = "Give me the spell scroll and we'll do it together!";
//	description = "Gib mir die Spruchrolle und wir heben diese Gruft gemeinsam aus!";
	description = "Dej mi ten kouzelný svitek a uděláme to společně!";
};

func int Info_Milten_SHACCEPT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHOFFER2))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHACCEPT_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_01"); //Give me the spell scroll and we'll do it together!
//	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_01"); //Gib mir die Spruchrolle und wir heben diese Gruft gemeinsam aus!
	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_01"); //Dej mi ten kouzelný svitek a uděláme to společně!
//	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_02"); //Good, very good. I hoped you would say that!
//	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_02"); //Gut, sehr gut. Ich hoffte, du würdest das sagen!
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_02"); //Dobře, velmi dobře. Doufal jsem, že to řekneš!
//	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_03"); //However, we only have one spell scroll. Use it for the guard!
//	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_03"); //Wir haben aber nur diese eine Spruchrolle. Benutze sie für den Wächter!
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_03"); //Máme ale jenom jeden kouzelný svitek. Použijeme ho na strážce!
//	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_04"); //The other undead can be defeated in normal fights as well.
//	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_04"); //Die anderen Untoten kann man auch im normalen Kampf besiegen.
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_04"); //Ostatní nemrtví mohou být zabiti i v normálním boji.
//	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_05"); //I see. Well, which way leads to the ring of stone?
//	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_05"); //Verstehe. Also, wo geht es zum Stonehenge?
	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_05"); //Aha. Která cesta vede ke kamennému kruhu?
//	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_06"); //Follow me.
//	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_06"); //Folge mir.
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_06"); //Pojď za mnou.

	Log_CreateTopic(CH3_Stonehenge,LOG_MISSION);
	Log_SetTopicStatus(CH3_Stonehenge,LOG_RUNNING);
//	B_LogEntry(CH3_Stonehenge,"I met Milten, the Magician of Fire, near the ring of stone. He told me that one of the focus stones I'm looking for was in a crypt underneath the stone formation.");
	B_LogEntry(CH3_Stonehenge,"Poblíž kamenného kruhu jsem potkal Miltena, mága Ohně. Řekl mi, že jeden z ohniskových kamenů, které hledám, je pod tímto kamenným kruhem.");
//	B_LogEntry(CH3_Stonehenge,"Milten gave me a spell scroll to defeat the undead guardian in the crypt. We'll get into the crypt together.");
	B_LogEntry(CH3_Stonehenge,"Milten mi dal kouzelný svitek, který mi pomůže porazit nemrtvého strážce hrobky. Půjdeme do hrobky společně.");

	CreateInvItem(self,ItArScrollDestroyUndead);
	B_GiveInvItems(self,hero,ItArScrollDestroyUndead,1);

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHGuide");
	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info SHARRIVED
//***************************************************************************
instance Info_Milten_SHARRIVED(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHARRIVED_Condition;
	information = Info_Milten_SHARRIVED_Info;
	important = 1;
	permanent = 0;
};

func int Info_Milten_SHARRIVED_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES")<500))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHARRIVED_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Milten_SHARRIVED_02_01"); //Here we are. The tunnel here leads directly to the tomb. 
//	AI_Output(self,hero,"Info_Milten_SHARRIVED_02_01"); //Hier sind wir. Der Stollen hier führt direkt in die Gruft.
	AI_Output(self,hero,"Info_Milten_SHARRIVED_02_01"); //Tak, jsme tady. Tenhle tunel vede přímo do hrobky.
//	AI_Output(hero,self,"Info_Milten_SHARRIVED_15_02"); //Then let's go and visit the guard!
//	AI_Output(hero,self,"Info_Milten_SHARRIVED_15_02"); //Dann statten wir dem Wächter mal einen Besuch ab!
	AI_Output(hero,self,"Info_Milten_SHARRIVED_15_02"); //Tak pojďme navštívit strážce!

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHFollow");
	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info SHHEAL
//***************************************************************************
instance Info_Milten_SHHEAL(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHHEAL_Condition;
	information = Info_Milten_SHHEAL_Info;
	important = 0;
	permanent = 0;
//	description = "I'm wounded. Please help me.";
//	description = "Ich bin verwundet. Bitte hilf mir!";
	description = "Jsem zraněný. Pomoz mi, prosím.";
};

func int Info_Milten_SHHEAL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&& !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS)
	&& (hero.attribute[ATR_HITPOINTS] < ((hero.attribute[ATR_HITPOINTS_MAX]*7)/10))
	&& (Npc_HasItems(hero,ItFo_Potion_Health_02) == 0))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHHEAL_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHHEAL_15_01"); //I'm wounded. Please help me.
//	AI_Output(hero,self,"Info_Milten_SHHEAL_15_01"); //Ich bin verwundet. Bitte hilf mir!
	AI_Output(hero,self,"Info_Milten_SHHEAL_15_01"); //Jsem zraněný. Pomoz mi, prosím.

	if ((Npc_HasItems(self,ItFo_Potion_Health_02) >  0))
	{
//		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02"); //Take this healing potion.
//		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02"); //Nimm diesen Heiltrank. Aber sei nicht verschwenderisch, ich habe nicht unendlich viel davon.
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02"); //Vezmi si léčivý lektvar.
		B_GiveInvItems(self,hero,ItFo_Potion_Health_02,1);
	}
	else
	{
//		AI_Output(self,hero,"Info_Milten_SHHEAL_02_03"); //I don't have any healing potion left.
//		AI_Output(self,hero,"Info_Milten_SHHEAL_02_03"); //Ich habe keinen Heiltrank mehr.
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_03"); //Už mi žádný léčivý lektvar nezbyl.
	}; 

	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info SHRUNNING
//***************************************************************************
instance Info_Milten_SHRUNNING(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHRUNNING_Condition;
	information = Info_Milten_SHRUNNING_Info;
	important = 0;
	permanent = 1;
//	description = "The guard's still alive!";
//	description = "Der Wächter lebt noch!";
	description = "Strážce stále žije!";
};

func int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self,ZombieTheKeeper, NOFUNC, -1);

	if Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&& (keeperFound && !Npc_IsDead(other)) // Wächter noch nicht besiegt...
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHRUNNING_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHRUNNING_15_01"); //The guard's still alive!
//	AI_Output(hero,self,"Info_Milten_SHRUNNING_15_01"); //Der Wächter lebt noch!
	AI_Output(hero,self,"Info_Milten_SHRUNNING_15_01"); //Strážce stále žije!
//	AI_Output(self,hero,"Info_Milten_SHRUNNING_02_02"); //Then destroy him with the spell scroll.
//	AI_Output(self,hero,"Info_Milten_SHRUNNING_02_02"); //Dann vernichte ihn mit der Spruchrolle.
	AI_Output(self,hero,"Info_Milten_SHRUNNING_02_02"); //Tak ho znič kouzelným svitkem.
};

//***************************************************************************
// Info SHSCROLL
//***************************************************************************
instance Info_Milten_SHSCROLL(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHSCROLL_Condition;
	information = Info_Milten_SHSCROLL_Info;
	important = 0;
	permanent = 0;
//	description = "I used the spell scroll!";
//	description = "Ich habe die Spruchrolle verbraucht!";
	description = "Použil jsem kouzelný svitek!";
};

func int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self,ZombieTheKeeper, NOFUNC, -1);
	if ((keeperFound && !Npc_IsDead(other)) // Wächter noch nicht besiegt...
	&& Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&& (Npc_HasItems(hero,ItArScrollDestroyUndead)==0) 
	&& (Npc_HasItems(hero,ItArRuneDestroyUndead)==0))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHSCROLL_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHSCROLL_15_01"); //I used the spell scroll - but not on the guard!
//	AI_Output(hero,self,"Info_Milten_SHSCROLL_15_01"); //Ich habe die Spruchrolle verbraucht ... aber nicht auf den Wächter!
	AI_Output(hero,self,"Info_Milten_SHSCROLL_15_01"); //Použil jsem kouzelný svitek - ale ne na strážce!
//	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_02"); //This is a catastrophe! Then you will have to find another way to defeat him!
//	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_02"); //Das ist großes Pech. Dann musst du einen anderen Weg finden, ihn zu besiegen.
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_02"); //To je katastrofa! Pak ho musíš porazit nějakým jiným způsobem!
//	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_03"); //Perhaps you can buy another spell scroll or a rune in one of the camps.
//	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_03"); //Vielleicht kannst du in einem Lager eine weitere Spruchrolle oder sogar eine Rune kaufen.
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_03"); //Snad můžeš koupit další kouzelný svitek nebo runu v jednom z táborů.
//	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_04"); //I'll wait for you over there, where we met.
//	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_04"); //Ich werde dort drüben, wo wir uns getroffen haben, auf dich warten.
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_04"); //Počkám tady na tebe. Tady se sejdeme.

  	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SHWait");
};

//***************************************************************************
// Info SHNEWSCROLL
//***************************************************************************
instance Info_Milten_SHNEWSCROLL(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHNEWSCROLL_Condition;
	information = Info_Milten_SHNEWSCROLL_Info;
	important = 0;
	permanent = 0;
//	description = "I have a new 'Death to the Undead' spell scroll!";
//	description = "Ich habe eine neue Spruchrolle 'Untote vernichten'!";
	description = "Mám nový svitek 'Smrt nemrtvému'.";
};

func int Info_Milten_SHNEWSCROLL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHSCROLL)
	&& !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS) 
	&& ((Npc_HasItems(hero,ItArScrollDestroyUndead)>0) || (Npc_HasItems(hero,ItArRuneDestroyUndead)>0)))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHNEWSCROLL_Info()
{
//	AI_Output(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //I have a new 'Death to the Undead' spell scroll!
//	AI_Output(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //Ich habe eine neue Spruchrolle 'Untote vernichten'!
	AI_Output(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //Mám nový svitek 'Smrt Nemrtvému'.
//	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //Very good. Now we can pay another visit to the guard.
//	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //Sehr gut, dann können wir ja dem Wächter wieder einen Besuch abstatten.
	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //Výborně. Teď můžeme na další návštěvu k tomu strážci.
//	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Go first, I'll follow.
//	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Geh voraus, ich folge dir!
	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Jdi první, půjdu za tebou.

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SHFollow");
};

//***************************************************************************
// Info SHLEAVE
//***************************************************************************
instance Info_Milten_SHLEAVE(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHLEAVE_Condition;
	information = Info_Milten_SHLEAVE_Info;
	important = 1;
	permanent = 1;
};

func int Info_Milten_SHLEAVE_Condition()
{
	if  Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&& !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS) 
	&& (Npc_GetDistToWP(hero,"OW_PATH_3_STONES")>10000)
  	&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHLEAVE_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_01"); //You seem to have lost interest in the tomb.
//	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_01"); //Du scheinst kein Interesse mehr an der Gruft zu haben.
	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_01"); //Vidím, že už jsi o hrobku ztratil zájem.
//	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_02"); //If you change your mind, you can meet me where we met before.
//	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_02"); //Wenn du es dir anders überlegst, triff mich dort, wo wir uns vorhin schon einmal getroffen haben.
	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_02"); //Jestli se rozmyslíš, můžem se setkat tam co předtím.

  	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"SHWait");
	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info SHCONTINUE
//***************************************************************************
instance Info_Milten_SHCONTINUE(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHCONTINUE_Condition;
	information = Info_Milten_SHCONTINUE_Info;
	important = 0;
	permanent = 1;
//	description = "Shall we dare to have another go at the guard?";
//	description = "Wollen wir einen weiteren Versuch beim Wächter wagen?";
	description = "Chceme se znovu podívat do té hrobky?";
};

func int Info_Milten_SHCONTINUE_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&& !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS)
	&& (Npc_GetDistToWP(hero,"OW_PATH_3_STONES")<9000)
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHCONTINUE_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(hero,self,"Info_Milten_SHCONTINUE_15_01"); //Shall we dare to have another go at the guard?
//	AI_Output(hero,self,"Info_Milten_SHCONTINUE_15_01"); //Wollen wir einen weiteren Versuch beim Wächter wagen?
	AI_Output(hero,self,"Info_Milten_SHCONTINUE_15_01"); //Chceme se znovu podívat do té hrobky?
//	AI_Output(self,hero,"Info_Milten_SHCONTINUE_02_02"); //I'm ready. Go ahead, I'll follow.
//	AI_Output(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Ich bin bereit. Geh voraus, ich folge dir!
	AI_Output(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Jsem připraven. Jdi napřed, já půjdu za tebou.

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHFollow");
	AI_StopProcessInfos(self);
};

//***************************************************************************
// Info SHSUCCESS
//***************************************************************************
instance Info_Milten_SHSUCCESS(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_SHSUCCESS_Condition;
	information = Info_Milten_SHSUCCESS_Info;
	important = 1;
	permanent = 0;
};

func int Info_Milten_SHSUCCESS_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && Npc_HasItems(hero,ItMi_OrcTalisman))
	{
		return TRUE;
	}; 
};

func void Info_Milten_SHSUCCESS_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Good. You have the talisman.
//	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Sehr gut. Du hast den Talisman!
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Výborně. Máš talisman.
//	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Here, take it. That was our deal!
//	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Hier, nimm ihn. So war unsere Abmachung!
	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Tady, vem si ho. To byla naše domluva!
//	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Thank you, my friend. I never forget anybody who helped me.
//	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Danke, mein Freund. Ich vergesse niemanden, der mir geholfen hat. Du hast was gut bei mir!
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Děkuju, příteli. Nikdy ti nezapomenu, jak jsi mi pomohl.
//	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_04"); //I'll go back to the Old Camp, perhaps we'll meet there.
//	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Ich gehe zurück ins Alte Lager, vielleicht sehen wir uns dort.
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Vrátím se do Starého tábora, snad se tam sejdeme.

	B_GiveInvItems(hero,self,ItMi_OrcTalisman,1);

//	B_LogEntry(CH3_Stonehenge,"Together we defeated the GUARDIAN under the ring of stone. Milten took his share of the booty and returned to the Old Camp.");
	B_LogEntry(CH3_Stonehenge,"Společně jsme porazili nemrtvého STRÁŽCE pod kamenným kruhem. Milten si vzal svůj podíl kořisti a vrátil se zpátky do Starého tábora.");
//	B_LogEntry(CH3_Stonehenge,"Saturas will be happy that I found a focus here!");
	B_LogEntry(CH3_Stonehenge,"Saturas bude rád, že jsem tu našel ohniskový kámen!");

  	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"ReturnToOC");
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
// Info OCWARN
//***************************************************************************
instance Info_Milten_OCWARN(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_OCWARN_Condition;
	information = Info_Milten_OCWARN_Info;
	important = 1;
	permanent = 0;
};

func int Info_Milten_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	}; 
};

func void Info_Milten_OCWARN_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Milten_OCWARN_02_01"); //They... They are all dead  .. all DEAD. I couldn't help them... I was... was not there... I...
//	AI_Output(self,hero,"Info_Milten_OCWARN_02_01"); //Sie ... sie sind alle tot. .. alle TOT. Ich konnte nicht helfen ... ich war ... war unterwegs ... ich ...
	AI_Output(self,hero,"Info_Milten_OCWARN_02_01"); //Oni... Oni jsou mrtví... všichni MRTVÍ. Nedokázal jsem jim pomoci... Já... nebyl jsem tam... Já...

	if (Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
//		AI_Output(hero,self,"Info_Milten_OCWARN_15_02"); //Calm down, Milten, I've already met Diego on the other side of the Camp.
//		AI_Output(hero,self,"Info_Milten_OCWARN_15_02"); //Ganz ruhig, Milten, ich habe Diego auf der anderen Seite des Lagers bereits getroffen.
		AI_Output(hero,self,"Info_Milten_OCWARN_15_02"); //Uklidni se, Miltene, už jsem se s Diegem potkal na druhé straně tábora.
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_03"); //Good, then you know. What did Diego say?
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_03"); //Gut, dann weißt du ja Bescheid. Was sagte Diego?
		AI_Output(self,hero,"Info_Milten_OCWARN_02_03"); //Dobře, pak už to víš. Co říkal Diego?
//		AI_Output(hero,self,"Info_Milten_OCWARN_15_04"); //If I can find Gorn and Lester, I'll warn them and send them to your meeting place.
//		AI_Output(hero,self,"Info_Milten_OCWARN_15_04"); //Wenn ich Gorn und Lester finden kann, werde ich sie warnen, und zu eurem Versammlungsplatz schicken.
		AI_Output(hero,self,"Info_Milten_OCWARN_15_04"); //Pokud najdu Gorna a Lestera, budu je varovat a pošlu je na místo vašeho srazu.
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_05"); //Good luck and take care!
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_05"); //Viel Glück und pass auf dich auf!
		AI_Output(self,hero,"Info_Milten_OCWARN_02_05"); //Hodně štěstí a dávej pozor!
//		B_LogEntry(CH4_Firemages,"Just like Diego, Milten is hiding near the Old Camp. At a safe distance from the main gate, the Magician of Fire warns those who arrive there, so that they don't fall into the guards' hands.");
		B_LogEntry(CH4_Firemages,"Milten se skrývá nedaleko Starého tábora, stejně jako Diego. Tento mág Ohně varuje v bezpečné vzdálenosti od hlavní brány příchozí, aby nepadli do rukou strážím.");
		AI_StopProcessInfos(self);
	}
	else
	{
//		AI_Output(hero,self,"Info_Milten_OCWARN_15_06"); //Calm down, Milten, what happened?
//		AI_Output(hero,self,"Info_Milten_OCWARN_15_06"); //Ganz ruhig, Milten, was ist los?
		AI_Output(hero,self,"Info_Milten_OCWARN_15_06"); //Uklidni se, Miltene, co se stalo?
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_07"); //They killed the Magicians of Fire. ALL OF THEM apart from me, and I was close to death as well.
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_07"); //Sie haben die Feuermagier getötet. ALLE bis auf mich, und da hätte auch nicht mehr viel gefehlt.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_07"); //Zabili mágy Ohně. VŠECHNY kromě mě, byl jsem taky v blízkosti smrti.
//		AI_Output(hero,self,"Info_Milten_OCWARN_15_08"); //You'd better tell me the whole story from the beginning, one thing after the other.
//		AI_Output(hero,self,"Info_Milten_OCWARN_15_08"); //Am besten du erzählst ganz von vorne und der Reihe nach.
		AI_Output(hero,self,"Info_Milten_OCWARN_15_08"); //Raději mi ten příběh řekni celý od začátku, jedno po druhém.
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_09"); //Okay. Keep cool, Milten, keep cool...
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_09"); //Ok. Ganz ruhig, Milten, ganz ruhig ... 
		AI_Output(self,hero,"Info_Milten_OCWARN_02_09"); //Dobře. Uklidni se, Miltene, klid.
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_10"); //It all started with the Old Mine caving in...
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_10"); //Es fing alles damit an, dass die Alte Mine einstürzte.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_10"); //Všechno začalo zavalením Starého dolu...
//		AI_Output(hero,self,"Info_Milten_OCWARN_15_11"); //The Old Mine CAVED IN???
//		AI_Output(hero,self,"Info_Milten_OCWARN_15_11"); //Die Alte Mine ist EINGESTÜRTZT???
		AI_Output(hero,self,"Info_Milten_OCWARN_15_11"); //Starý důl byl ZAVALEN???
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_12"); //Yes. It all happened very fast. Nobody in the mine made it out.
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_12"); //Ja. Es ging alles sehr schnell. Keiner aus der Mine hat es herausgeschafft.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_12"); //Ano. Stalo se to velmi rychle. Nikdo z dolu nedostal ven.
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_13"); //The guards blocked the entrance to the mine.
//		AI_Output(self,hero,"Info_Milten_OCWARN_02_13"); //Die Gardisten haben den Mineneingang gesperrt.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_13"); //Stráže zablokovaly vchod do dolu.
	};
};

//***************************************************************************
// Info OCMINE
//***************************************************************************
instance Info_Milten_OCMINE(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_OCMINE_Condition;
	information = Info_Milten_OCMINE_Info;
	important = 0;
	permanent = 0;
//	description = "How could the mine cave in?";
//	description = "Wie konnte die Mine einstürzen?";
	description = "Jak se mohl důl zavalit?";
};

func int Info_Milten_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_OCWARN) && !Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
		return TRUE;
	}; 
};

func void Info_Milten_OCMINE_Info()
{
//	AI_Output(hero,self,"Info_Milten_OCMINE_15_01"); //How could the mine cave in?
//	AI_Output(hero,self,"Info_Milten_OCMINE_15_01"); //Wie konnte die Mine einstürzen?
	AI_Output(hero,self,"Info_Milten_OCMINE_15_01"); //Jak se mohl důl zavalit?
//	AI_Output(self,hero,"Info_Milten_OCMINE_02_02"); //I've no idea. Some of the diggers who were waiting in front of the entrance said something about a massive earthquake and a huge cloud of dust coming from the tunnel.
//	AI_Output(self,hero,"Info_Milten_OCMINE_02_02"); //Keine Ahnung. Einige Buddler, die vor dem Mineneingang warteten, erzählten von einem gewaltigen Beben und einer riesigen Staubwolke, die aus dem Stollen kam.
	AI_Output(self,hero,"Info_Milten_OCMINE_02_02"); //Nemám zdání. Některý z kopáčů, kteří čekali vpředu u vchodu, říkali něco o silném zemětřesení a velkém oblaku dýmu, který se valil z hlavní štoly.
//	AI_Output(hero,self,"Info_Milten_OCMINE_15_03"); //Were you there?
//	AI_Output(hero,self,"Info_Milten_OCMINE_15_03"); //Warst du dort?
	AI_Output(hero,self,"Info_Milten_OCMINE_15_03"); //Byl jsi tam?
//	AI_Output(self,hero,"Info_Milten_OCMINE_02_04"); //Yes. That's where I learned about the cave-in.
//	AI_Output(self,hero,"Info_Milten_OCMINE_02_04"); //Ja. Dort erfuhr ich dann auch vom Einsturz.
	AI_Output(self,hero,"Info_Milten_OCMINE_02_04"); //Ano. Tam jsem se o tom závalu dozvěděl.
};

//***************************************************************************
// Info OCKDW
//***************************************************************************
instance Info_Milten_OCKDW(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_OCKDW_Condition;
	information = Info_Milten_OCKDW_Info;
	important = 0;
	permanent = 0;
//	description = "What was that you said about the Magicians of Fire?";
//	description = "Was sagtest du über die Feuermagier?";
	description = "Cos to říkal o mázích Ohně?";
};

func int Info_Milten_OCKDW_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_OCWARN) && !Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
		return TRUE;
	}; 
};

func void Info_Milten_OCKDW_Info()
{
//	AI_Output(hero,self,"Info_Milten_OCKDW_15_01"); //What was that you said about the Magicians of Fire?
//	AI_Output(hero,self,"Info_Milten_OCKDW_15_01"); //Was sagtest du über die Feuermagier?
	AI_Output(hero,self,"Info_Milten_OCKDW_15_01"); //Cos to říkal o mázích Ohně?
//	AI_Output(self,hero,"Info_Milten_OCKDW_02_02"); //I only know that they were all killed by the Ore Barons shortly after the mine caved in.
//	AI_Output(self,hero,"Info_Milten_OCKDW_02_02"); //Ich weiß nur, dass sie kurz nach dem Einsturz alle von den Erzbaronen umgebracht wurden.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_02"); //Jenom vím, že byli všichni zabiti Rudobarony krátce po zavalení dolu.
//	AI_Output(self,hero,"Info_Milten_OCKDW_02_03"); //When I returned from our adventure under the ring of stone, the guards at the gate suddenly attacked me.
//	AI_Output(self,hero,"Info_Milten_OCKDW_02_03"); //Als ich von unserem gemeinsamen Abenteuer unter dem Stonehenge zurückkehrte, griffen mich die Wachen am Tor plötzlich an.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_03"); //Když jsem se vrátil po našem dobrodružství u kamenného kruhu, stráže u brány mě znenadání napadly.
//	AI_Output(self,hero,"Info_Milten_OCKDW_02_04"); //They shouted words like 'traitor' and 'collaborator' at me. I had a very narrow escape.
//	AI_Output(self,hero,"Info_Milten_OCKDW_02_04"); //Sie schrieen mir Worte wie 'Verräter' und 'Kollaborateur' entgegen. Ich konnte mich gerade noch in Sicherheit bringen.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_04"); //Vykřikovaly na mě slova 'zrádce' a 'kolaborant'. Jen taktak, se mi podařilo dostat se do bezpečí.
};

//***************************************************************************
// Info OCWHY
//***************************************************************************
instance Info_Milten_OCWHY(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_OCWHY_Condition;
	information = Info_Milten_OCWHY_Info;
	important = 0;
	permanent = 0;
//	description = "Why would the Ore Barons want to kill the magicians...";
//	description = "Warum töten Erzbarone Feuermagier? Das gibt doch keinen Sinn...";
	description = "Proč by Rudobaroni chtěli zabít mágy? To nedává smysl...";
};

func int Info_Milten_OCWHY_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_OCKDW))
	{
		return TRUE;
	}; 
};

func void Info_Milten_OCWHY_Info()
{
//	AI_Output(hero,self,"Info_Milten_OCWHY_15_01"); //Why would the Ore Barons want to kill the magicians? It doesn't make sense...
//	AI_Output(hero,self,"Info_Milten_OCWHY_15_01"); //Warum töten Erzbarone Feuermagier? Das gibt doch keinen Sinn...
	AI_Output(hero,self,"Info_Milten_OCWHY_15_01"); //Proč by Rudobaroni chtěli zabít mágy? To nedává smysl...
//	AI_Output(self,hero,"Info_Milten_OCWHY_02_02"); //That's right. The guards just didn't give me any opportunity to ask. They drew their swords immediately.
//	AI_Output(self,hero,"Info_Milten_OCWHY_02_02"); //Das stimmt. Nur gaben mir die Wachen am Lagereingang keine Gelegenheit, danach zu fragen. Sie zogen sofort ihre Schwerter.
	AI_Output(self,hero,"Info_Milten_OCWHY_02_02"); //To je pravda. Stráže mi nedaly možnost se ani zeptat. Okamžitě tasily meče.
//	AI_Output(self,hero,"Info_Milten_OCWHY_02_03"); //Perhaps Diego knows more. He was in the Camp when things got worse.
//	AI_Output(self,hero,"Info_Milten_OCWHY_02_03"); //Vielleicht kann dir Diego mehr erzählen. Er war im Lager, als sich die Ereignisse zuspitzten.
	AI_Output(self,hero,"Info_Milten_OCWHY_02_03"); //Snad ti o tom Diego může říct víc. Byl zrovna v táboře, když se situace vyhrotila.
};

//***************************************************************************
// Info OCYOU
//***************************************************************************
instance Info_Milten_OCYOU(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_OCYOU_Condition;
	information = Info_Milten_OCYOU_Info;
	important = 0;
	permanent = 0;
//	description = "You should hide. Far away from here.";
//	description = "Du solltest dich verstecken. Weit weg von hier!";
	description = "Měl by ses ukrýt. Daleko odtud.";
};

func int Info_Milten_OCYOU_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Milten_OCKDW))
	{
		return TRUE;
	}; 
};

func void Info_Milten_OCYOU_Info()
{
//	AI_Output(hero,self,"Info_Milten_OCYOU_15_01"); //You should hide. Far away from here.
//	AI_Output(hero,self,"Info_Milten_OCYOU_15_01"); //Du solltest dich verstecken. Weit weg von hier!
	AI_Output(hero,self,"Info_Milten_OCYOU_15_01"); //Měl by ses ukrýt. Daleko odtud.
//	AI_Output(self,hero,"Info_Milten_OCYOU_02_02"); //No. Diego and I agreed to keep an eye on the two gates and to warn our unsuspecting friends from the other camps.
//	AI_Output(self,hero,"Info_Milten_OCYOU_02_02"); //Nein. Diego und ich haben beschlossen, die beiden Tore im Auge zu behalten, und ahnungslose Freunde aus anderen Lagern zu warnen.
	AI_Output(self,hero,"Info_Milten_OCYOU_02_02"); //Ne. Diego a já jsme se dohodli, že budeme hlídat obě brány a varovat naše nic netušící přátele z jiných táborů.

	if (!Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{ 
//		AI_Output(self,hero,"Info_Milten_OCYOU_02_03"); //Please talk to Diego!
//		AI_Output(self,hero,"Info_Milten_OCYOU_02_03"); //Bitte sprich noch mit Diego!
		AI_Output(self,hero,"Info_Milten_OCYOU_02_03"); //Řekni to, prosím, Diegovi!
	}
	else
	{
//		B_LogEntry(CH4_Firemages,"After Diego told me about the unbelievable events, I met Milten at the front of the Old Camp. I hope they don't get caught.");
		B_LogEntry(CH4_Firemages,"Poté, co mi Diego řekl o neuvěřitelných událostech, potkal jsem před Starým táborem Miltena. Doufám, že je nechytí.");
	};
};

//***************************************************************************
// Info OCDIEGO
//***************************************************************************
instance Info_Milten_OCDIEGO(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_OCDIEGO_Condition;
	information = Info_Milten_OCDIEGO_Info;
	important = 0;
	permanent = 0;
//	description = "Where can I find Diego?";
//	description = "Wo kann ich Diego finden?";
	description = "Kde najdu Diega?";
};

func int Info_Milten_OCDIEGO_Condition()
{
	if Npc_KnowsInfo(hero,Info_Milten_OCWHY)
	&& Npc_KnowsInfo(hero,Info_Milten_OCYOU)
	&& !Npc_KnowsInfo(hero,Info_Diego_OCSTORY)
	{
		return TRUE;
	}; 
};

func void Info_Milten_OCDIEGO_Info()
{
//	AI_Output(hero,self,"Info_Milten_OCDIEGO_15_01"); //Where can I find Diego?
//	AI_Output(hero,self,"Info_Milten_OCDIEGO_15_01"); //Wo kann ich Diego finden?
	AI_Output(hero,self,"Info_Milten_OCDIEGO_15_01"); //Kde najdu Diega?
//	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_02"); //He's hiding on the other side of the Old Camp, near the back gate.
//	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_02"); //Er hält sich auf der anderen Seite des Alten Lagers in der Nähe des hinteren Tores versteckt.
	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_02"); //Ukrývá se na druhé straně Starého tábora, blízko zadní brány.
//	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_03"); //Please talk to him!
//	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_03"); //Bitte sprich mit ihm!
	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_03"); //Promluv si s ním, prosím!

//	B_LogEntry(CH4_Firemages,"Milten caught me in front of the Old Camp and told me about the collapse of the Old Mine and the assassination of the Magicians of Fire.");
	B_LogEntry(CH4_Firemages,"Milten mě zastavil před Starým táborem a řekl mi o zavalení Starého dolu a vyvraždění mágů Ohně.");
//	B_LogEntry(CH4_Firemages,"Diego is staying on the other side of the Old Camp, near the back gate. I should talk to him, he knows more about what happened.");
	B_LogEntry(CH4_Firemages,"Diego se zdržuje na druhé straně Starého tábora, poblíž zadní brány. Měl bych si s ním promluvit, bude vědět více o tom, co se přihodilo.");
};

//#####################################################################
//##
//##
//## KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
// Info LOADSWORD
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_LOADSWORD_Condition;
	information = Info_Milten_LOADSWORD_Info;
	important = 1;
	permanent = 0;
};

func int Info_Milten_LOADSWORD_Condition()
{
	if (LoadSword)
	{
		return TRUE;
	}; 
};

func void Info_Milten_LOADSWORD_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Milten_LOADSWORD_02_01"); //Greetings, my friend, I haven't seen you for ages.
//	AI_Output(self,hero,"Info_Milten_LOADSWORD_02_01"); //Sei gegrüßt, mein Freund, dich habe ich ja schon lange nicht mehr gesehen.
	AI_Output(self,hero,"Info_Milten_LOADSWORD_02_01"); //Buď pozdraven, příteli, už jsem tě neviděl věčnost.
//	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_02"); //Hello, Milten. A lot has happened since we met the last time.
//	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_02"); //Hallo, Milten. Es ist viel passiert, seit wir uns das letzte Mal trafen.
	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_02"); //Ahoj, Miltene. Hodně se toho stalo, co jsme se naposledy potkali.
//	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_03"); //I would like to tell you everything but I don't have the time right now. I'm in a hurry.
//	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_03"); //Ich würde dir gerne alles erzählen, doch im Moment ist keine Zeit dafür. Ich bin in Eile!
	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_03"); //Chtěl bych ti všechno vyprávět, ale nemám teď čas. Hrozně spěchám.
};

//---------------------------------------------------------------------
// Info LOADSWORD1
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD1(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_LOADSWORD1_Condition;
	information = Info_Milten_LOADSWORD1_Info;
	important = 0;
	permanent = 0;
//	description = "Milten, I need your help!"; 
//	description = "Milten, ich brauche deine Hilfe!"; 
	description = "Miltene, potřebuju tvoji pomoc!"; 
};

func int Info_Milten_LOADSWORD1_Condition()
{
	if Npc_KnowsInfo(hero,Info_Milten_LOADSWORD)
	{
		return 1;
	}; 
};

func void Info_Milten_LOADSWORD1_Info()
{
//	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_01"); //Milten, I need your help!
//	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_01"); //Milten, ich brauche deine Hilfe!
	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_01"); //Miltene, potřebuju tvoji pomoc!
//	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_02"); //What's up? How can I help you?
//	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_02"); //Um was geht es? Wie kann ich dir helfen?
	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_02"); //Co se děje? Jak ti můžu pomoci?
//	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_03"); //Let's go somewhere where we can talk.
//	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_03"); //Lass uns irgendwohin gehen, wo es nicht so viele Ohren gibt!
	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_03"); //Pojďme někam, kde budeme moci mluvit.
//	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_04"); //Fine. Follow me.
//	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_04"); //Wie du meinst. Folge mir!
	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_04"); //Dobře. Pojď za mnou.

	Npc_ExchangeRoutine(self,"LSAway");
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info LSAWAY
//---------------------------------------------------------------------
instance Info_Milten_LSAWAY(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_LSAWAY_Condition;
	information = Info_Milten_LSAWAY_Info;
	important = 1;
	permanent = 0;
};

func int Info_Milten_LSAWAY_Condition()
{
	if Npc_KnowsInfo(hero,Info_Milten_LOADSWORD1)
	&& (Npc_GetDistToWP(hero,"NC_KDW04_IN") < 500)
	{
		return TRUE;
	}; 
};

func void Info_Milten_LSAWAY_Info()
{
	AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_01"); //Now tell me, what is it?
//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_01"); //Nun sprich, worum geht es?
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_01"); //No tak mi řekni, co se děje?
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_02"); //I need the magic powers of the ore mound and I don't think it would be a good move to ask the other Magicians of Water.
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_02"); //Ich brauche die magische Energie des Erzhaufens, und ich halte es für unklug, die anderen Wassermagier danach zu fragen!
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_02"); //Potřebuju magické síly rudné haldy, ale mám pocit, že by nebylo rozumné požádat ostatní mágy Vody.
//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_03"); //You're joking!
//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_03"); //Du scherzt!
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_03"); //Děláš si legraci!
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_04"); //This is no time for jokes. I'm deadly serious.
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_04"); //Die Zeit des Scherzens ist vorbei, ich meine es todernst!
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_04"); //Teď není na legraci čas. Myslím to smrtelně vážně.
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_05"); //I've seen Xardas, the Necromancer!
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_05"); //Ich habe Xardas, den Dämonenbeschwörer, getroffen!
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_05"); //Mluvil jsem s Xardasem, tím nekromantem!
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_06"); //I'm working under his orders!
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_06"); //Ich handle in seinem Auftrag!
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_06"); //Pracuji pod jeho velením!
//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_07"); //XARDAS??? You're beginning to scare me!
//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_07"); //XARDAS??? Langsam machst du mir Angst!
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_07"); //XARDAS??? Začínáš mě děsit!
//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_08"); //Nobody has spoken to him since he left the Old Camp.
//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_08"); //Niemand hat mit ihm gesprochen, seit er das Alte Lager verlassen hat!
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_08"); //Od té doby, co odešel ze Starého tábora, s ním nikdo nemluvil.
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_09"); //I have!
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_09"); //Ich schon!
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_09"); //Já ano!
//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_10"); //What do you need the powers of the ore mound for?
//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_10"); //Wofür benötigst du die Energie des Erzhaufens?
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_10"); //Na co potřebuješ magickou sílu rudné haldy?
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_11"); //I want to transfer them to this sword here.
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_11"); //Ich will sie auf dieses Schwert hier übertragen.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_11"); //Chci je transformovat do tohoto meče.
//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_12"); //Wow, what a weapon!
//	AI_Output(self,hero,"Info_Milten_LSAWAY_02_12"); //Wow, was für eine Waffe!
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_12"); //Joj, to je ale zbraň!
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_13"); //It's name is URIZIEL!
//	AI_Output(hero,self,"Info_Milten_LSAWAY_15_13"); //Es trägt den Namen URIZIEL!
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_13"); //Jmenuje se URIZIEL!
};

//---------------------------------------------------------------------
// Info LOADSWORD4
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD4(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_LOADSWORD4_Condition;
	information = Info_Milten_LOADSWORD4_Info;
	important = 0;
	permanent = 0;
//	description = "Xardas gave me this magic spell!"; 
//	description = "Xardas gab mir diese magische Formel!"; 
	description = "Xardas mi dal kouzelné zaříkávadlo!"; 
};

func int Info_Milten_LOADSWORD4_Condition()
{
	if Npc_KnowsInfo(hero,Info_Milten_LSAWAY)
	{
		return 1;
	}; 
};

func void Info_Milten_LOADSWORD4_Info()
{
//	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_01"); //Xardas gave me this magic spell to carry out the transfer!
//	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_01"); //Xardas gab mir diese magische Formel, um den Transfer zu vollbringen!
	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_01"); //Xardas mi dal kouzelné zaříkávadlo, které provede tu transformaci.
//	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_02"); //You will have to recite it while I bring the sword and the ore together!
//	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_02"); //Du musst sie aussprechen, während ich Schwert und Erz in Kontakt bringe!
	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_02"); //Budeš ho muset přednést, zatímco já se budu mečem dotýkat té rudné haldy!
	B_UseFakeScroll();
//	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_03"); //Mmmm... Mmmm... It looks as if I only have to read out this spell ...
//	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_03"); //Hmmm ... Hmmm ... es sieht so aus, als ob ich diese Zauberformel nur herunterlesen müsste ...
	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_03"); //Hmmm... Hmmm... To vypadá, jako bych to zaříkávadlo musel jenom odříkat...
//	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_04"); //But we'll get into trouble with Saturas and the other magicians!
//	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_04"); //Aber wir werden ernsthaften Ärger mit Saturas und den anderen Magiern bekommen!
	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_04"); //Dostaneme se ale do sváru se Saturasem a ostatními mágy!
};

//---------------------------------------------------------------------
// Info LSRISK
//---------------------------------------------------------------------
instance Info_Milten_LSRISK(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_LSRISK_Condition;
	information = Info_Milten_LSRISK_Info;
	important = 0;
	permanent = 0;
//	description = "We'll have to take that risk!"; 
//	description = "Das Risiko müssen wir eingehen!"; 
	description = "Musíme to risknout!"; 
};

func int Info_Milten_LSRISK_Condition()
{
	if Npc_KnowsInfo(hero,Info_Milten_LOADSWORD4)
	{
		return TRUE;
	}; 
};

func void Info_Milten_LSRISK_Info()
{
//	AI_Output(hero,self,"Info_Milten_LSRISK_15_01"); //We'll have to take that risk!
//	AI_Output(hero,self,"Info_Milten_LSRISK_15_01"); //Das Risiko müssen wir eingehen!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_01"); //Musíme to risknout!
//	AI_Output(hero,self,"Info_Milten_LSRISK_15_02"); //It really is VERY, VERY important!
//	AI_Output(hero,self,"Info_Milten_LSRISK_15_02"); //Es ist wirklich SEHR, SEHR wichtig!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_02"); //Je to skutečně VELMI, VELMI důležité!
//	AI_Output(hero,self,"Info_Milten_LSRISK_15_03"); //Important for ALL inhabitants of the colony.
//	AI_Output(hero,self,"Info_Milten_LSRISK_15_03"); //Wichtig für ALLE Bewohner der Kolonie.
	AI_Output(hero,self,"Info_Milten_LSRISK_15_03"); //Důležité pro VŠECHNY obyvatele kolonie.
//	AI_Output(self,hero,"Info_Milten_LSRISK_02_04"); //I don't understand...
//	AI_Output(self,hero,"Info_Milten_LSRISK_02_04"); //Ich verstehe nicht ...
	AI_Output(self,hero,"Info_Milten_LSRISK_02_04"); //Nerozumím.
//	AI_Output(hero,self,"Info_Milten_LSRISK_15_05"); //It will get us out of here! You have to trust me!
//	AI_Output(hero,self,"Info_Milten_LSRISK_15_05"); //Es wird uns alle hier raus bringen! Du musst mir vertrauen!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_05"); //Dostaneme se odtud ven! Musíš mi věřit!
//	AI_Output(self,hero,"Info_Milten_LSRISK_02_06"); //Alright! After all you have done for us, I trust you completely.
//	AI_Output(self,hero,"Info_Milten_LSRISK_02_06"); //Einverstanden! Nach all dem, was du bereits für uns getan hast, besitzt du mein Vertrauen.
	AI_Output(self,hero,"Info_Milten_LSRISK_02_06"); //Rozumím! Po tom všem, co jsi pro nás udělal, ti věřím.
//	AI_Output(self,hero,"Info_Milten_LSRISK_02_07"); //Besides, it seems Xardas trusts you as well.
//	AI_Output(self,hero,"Info_Milten_LSRISK_02_07"); //Außerdem scheinst du auch das von Xardas zu besitzen!
	AI_Output(self,hero,"Info_Milten_LSRISK_02_07"); //Kromě toho to vypadá, že ti Xardas také věří.
//	AI_Output(self,hero,"Info_Milten_LSRISK_02_08"); //Meet me down at the ore mound, and... Don't tell anybody!
//	AI_Output(self,hero,"Info_Milten_LSRISK_02_08"); //Triff mich unten beim Erzhaufen, und ... zu keinem ein Sterbenswörtchen!
	AI_Output(self,hero,"Info_Milten_LSRISK_02_08"); //Setkáme se dole u rudné haldy a... Nikomu ani slovo!
//	AI_Output(hero,self,"Info_Milten_LSRISK_15_09"); //Good, let's meet at the ore mound! See you there!
//	AI_Output(hero,self,"Info_Milten_LSRISK_15_09"); //Gut, wir treffen uns beim Erzhaufen. Bis dann!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_09"); //Dobře, sejdeme se teda u rudné haldy! Naviděnou!

//	B_LogEntry(CH5_Uriziel,"I could convince my friend Milten to help me transfer the energy to the sword. We'll meet at the bottom of the ore mound of the Magicians of Water.");
	B_LogEntry(CH5_Uriziel,"Přesvědčil jsem svého přítele Miltena, aby mi pomohl přenést do meče magickou energii. Setkáme se u úpatí rudné haldy mágů Vody.");
	Npc_ExchangeRoutine(self,"LSOreHeap");
	B_ExchangeRoutine(Sld_726_Soeldner, "loadsword");

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info LSOREHEAP
//---------------------------------------------------------------------
instance Info_Milten_LSOREHEAP(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_LSOREHEAP_Condition;
	information = Info_Milten_LSOREHEAP_Info;
	important = 1;
	permanent = 0;
};

func int Info_Milten_LSOREHEAP_Condition()
{
	if Npc_KnowsInfo(hero,Info_Milten_LSRISK )
	&& (Npc_GetDistToWP(hero,"NC_PATH41") < 500)
	{
		return TRUE;
	}; 
};

func void Info_Milten_LSOREHEAP_Info()
{
	//AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Milten_LSOREHEAP_02_01"); //Have you got the sword and the spell?
//	AI_Output(self,hero,"Info_Milten_LSOREHEAP_02_01"); //Hast du das Schwert und die Zauberformel?
	AI_Output(self,hero,"Info_Milten_LSOREHEAP_02_01"); //Máš meč a zaříkávadlo?
};

//***************************************************************************
// Info LSNOW
//***************************************************************************
instance Info_Milten_LSNOW(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_LSNOW_Condition;
	information = Info_Milten_LSNOW_Info;
	important = 0;
	permanent = 0;
//	description = "Here, take the spell!"; 
//	description = "Hier, nimm die Zauberformel!"; 
	description = "Tady, vezmi si to zaříkávadlo!"; 
};

func int Info_Milten_LSNOW_Condition()
{
	if Npc_KnowsInfo(hero,Info_Milten_LSOREHEAP)
	&& Npc_HasItems(hero,Mythrilklinge01)
	&& Npc_HasItems(hero,Scroll4Milten)
	&& (Npc_GetDistToWP(hero,"NC_PATH41") < 1000)
	{
		return TRUE;
	}; 
};

func void Info_Milten_LSNOW_Info()
{
//	AI_Output(hero,self,"Info_Milten_LSNOW_15_01"); //Here, take the spell!
//	AI_Output(hero,self,"Info_Milten_LSNOW_15_01"); //Hier, nimm die Zauberformel!
	AI_Output(hero,self,"Info_Milten_LSNOW_15_01"); //Tady, vezmi si to zaříkávadlo!
//	AI_Output(hero,self,"Info_Milten_LSNOW_15_02"); //Are you ready?
//	AI_Output(hero,self,"Info_Milten_LSNOW_15_02"); //Bist du bereit?
	AI_Output(hero,self,"Info_Milten_LSNOW_15_02"); //Jsi připraven?
//	AI_Output(self,hero,"Info_Milten_LSNOW_02_03"); //As ready as one can be for this crazy plan.
//	AI_Output(self,hero,"Info_Milten_LSNOW_02_03"); //So bereit, wie man für solch eine Wahnsinnstat nur sein kann.
	AI_Output(self,hero,"Info_Milten_LSNOW_02_03"); //Tak, jak se jen dá na tento bláznivý podnik!
//	AI_Output(hero,self,"Info_Milten_LSNOW_15_04"); //Then let's do it!
//	AI_Output(hero,self,"Info_Milten_LSNOW_15_04"); //Dann kann es ja losgehen!
	AI_Output(hero,self,"Info_Milten_LSNOW_15_04"); //Nuže, do toho!

	B_GiveInvItems(hero,self,Scroll4Milten,1); 
	B_GiveInvItems(hero,self,Mythrilklinge01,1); 

	StartChaptersSix = TRUE;

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
// Info CHAPTERSIX
//---------------------------------------------------------------------
instance Info_Milten_CHAPTERSIX(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_CHAPTERSIX_Condition;
	information = Info_Milten_CHAPTERSIX_Info;
	important = 1;
	permanent = 0;
};

func int Info_Milten_CHAPTERSIX_Condition()
{
	if Npc_KnowsInfo(hero,Info_Milten_LSNOW)
	&& StartChaptersSix
	{
		return TRUE;
	}; 
};

func void Info_Milten_CHAPTERSIX_Info()
{
	AI_StopProcessInfos(self);
	B_Kapitelwechsel (6);
};

//---------------------------------------------------------------------
// Info LSDONE
//---------------------------------------------------------------------
instance Info_Milten_LSDONE(C_INFO)
{
	npc = PC_Mage;
	condition = Info_Milten_LSDONE_Condition;
	information = Info_Milten_LSDONE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Milten_LSDONE_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	}; 
};

func void Info_Milten_LSDONE_Info()
{
	//AI_GotoNpc(self,hero);

//	AI_Output(self,hero,"Info_Milten_LSDONE_02_01"); //It's done!
//	AI_Output(self,hero,"Info_Milten_LSDONE_02_01"); //Es ist vollbracht!
	AI_Output(self,hero,"Info_Milten_LSDONE_02_01"); //Hotovo!
//	AI_Output(hero,self,"Info_Milten_LSDONE_15_02"); //Unbelievable! The plain gray gem is shimmering bluish now!
//	AI_Output(hero,self,"Info_Milten_LSDONE_15_02"); //Unglaublich! Der unscheinbare graue Edelstein schimmert nun bläulich!
	AI_Output(hero,self,"Info_Milten_LSDONE_15_02"); //Neuvěřitelné! Ten obyčejný šedivý drahokam teď světélkuje modravou barvou!

	AI_EquipBestMeleeWeapon (hero);
	AI_ReadyMeleeWeapon (hero);
	AI_PlayAni (hero,"T_1HSINSPECT");
	AI_RemoveWeapon (hero);

//	AI_Output(self,hero,"Info_Milten_LSDONE_02_03"); //That's a good sign! The magic powers of the ore mound really seem to be in the old sword now!
//	AI_Output(self,hero,"Info_Milten_LSDONE_02_03"); //Das ist ein gutes Zeichen! Die magische Energie des Erzhaufens scheint tatsächlich in das alte Schwert übertragen worden zu sein!
	AI_Output(self,hero,"Info_Milten_LSDONE_02_03"); //To je dobré znamení! Magické síly rudné haldy jsou teď zřejmě v tom starém meči!
//	AI_Output(self,hero,"Info_Milten_LSDONE_02_04"); //But our little operation here seems to have attracted some attention.
//	AI_Output(self,hero,"Info_Milten_LSDONE_02_04"); //Aber unsere kleine Aktion hier scheint etwas Aufmerksamkeit erregt zu haben.
	AI_Output(self,hero,"Info_Milten_LSDONE_02_04"); //Naše malé představení však zřejmě přilákalo pár diváků!
//	AI_Output(self,hero,"Info_Milten_LSDONE_02_05"); //You should teleport yourself directly out of here!
//	AI_Output(self,hero,"Info_Milten_LSDONE_02_05"); //Du solltest dich am besten direkt hier heraus teleportieren!
	AI_Output(self,hero,"Info_Milten_LSDONE_02_05"); //Měl by ses ihned teleportovat na nějaké jiné místo!
//	AI_Output(hero,self,"Info_Milten_LSDONE_15_06"); //What about you?
//	AI_Output(hero,self,"Info_Milten_LSDONE_15_06"); //Was wird aus dir?
	AI_Output(hero,self,"Info_Milten_LSDONE_15_06"); //A co bude s tebou?
//	AI_Output(self,hero,"Info_Milten_LSDONE_02_07"); //Don't worry about me, I'll think of something. Go now!
//	AI_Output(self,hero,"Info_Milten_LSDONE_02_07"); //Mach dir um mich keine Sorgen, ich werde mir schon was einfallen lassen. Geh jetzt!
	AI_Output(self,hero,"Info_Milten_LSDONE_02_07"); //O mě si strach nedělej, něco vymyslím. A teď už běž!

	B_Story_UrizielLoaded();

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//## KAPITEL 6
//##
//##
//#####################################################################
