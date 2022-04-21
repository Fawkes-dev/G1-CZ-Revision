// ************************ EXIT **************************

instance VLK_583_Glen_Exit(C_INFO)
{
	npc = VLK_583_Glen;
	nr = 999;
	condition = VLK_583_Glen_Exit_Condition;
	information = VLK_583_Glen_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int VLK_583_Glen_Exit_Condition()
{
	return 1;
};

func void VLK_583_Glen_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ***************** Infos *****************************

instance VLK_583_Glen_INFO(C_INFO)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_INFO_Condition;
	information = VLK_583_Glen_INFO_Info;
	important = 0;
	permanent = 1;
//	description = "What should I keep in mind when I'm in the mine?";
//	description = "Worauf sollte ich in der Mine achten?";
	description = "Na co bych měl pamatovat, až budu v dole?";
};

func int VLK_583_Glen_INFO_Condition()
{
	return 1;
};

func void VLK_583_Glen_INFO_Info()
{
//	AI_Output(other,self,"VLK_583_Glen_INFO_Info_15_01"); //What should I keep in mind when I'm in the mine?
//	AI_Output(other,self,"VLK_583_Glen_INFO_Info_15_01"); //Worauf sollte ich in der Mine achten?
	AI_Output(other,self,"VLK_583_Glen_INFO_Info_15_01"); //Na co bych měl pamatovat, až budu v dole?
//	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_02"); //Beware of the minecrawlers.
//	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_02"); //Auf die Minecrawler.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_02"); //Na důlní červy.
//	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_03"); //The further you get down, the closer you get to the beasts. Those rotten creatures come directly from Beliar's realm!
//	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_03"); //Je weiter du nach unten kommst, desto näher bist den Viechern. Die Mistdinger kommen direkt aus Beliars Reich!
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_03"); //Čím jdeš níž, tím blíž se k těm bestiím dostáváš. Ty prašivé bestie přicházejí rovnou z Beliarovy říše!
//	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_04"); //You can hear them scraping and scratching. They are sitting in the dark, just waiting for you. I've seen them kill...
//	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_04"); //Man kann sie schaben und kratzen hören. Sie lauern in der Dunkelheit und warten nur auf dich. Ich habe gesehen, wie sie getötet haben.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_04"); //Je slyšet jak hrabou a škrábou. Číhají v temnotě a vyčkávají na tebe. Viděl jsem je zabíjet.
//	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_05"); //They're merciless and fast. If you enjoy being alive, you shouldn't be down here. You better go before something happens to you.
//	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_05"); //Gnadenlos und schnell. Wenn du am Leben hängst, solltest du dich nicht hier unten aufhalten. Geh lieber, bevor dir noch was passiert.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_05"); //Jsou nemilosrdní a rychlí. Jestli chceš zůstat naživu, neměl bys chodit dolů. Měl bys odejít, než se ti něco stane.
};
// ***************** Infos *****************************

instance VLK_583_Glen_LOCKPICK(C_INFO)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_LOCKPICK_Condition;
	information = VLK_583_Glen_LOCKPICK_Info;
	important = 0;
	permanent = 0;
//	description = "I heard I could buy lockpicks here?";
//	description = "Bei dir gibts Dietriche?";
	description = "Slyšel jsem, že bych tu dostal paklíče?";
};

func int VLK_583_Glen_LOCKPICK_Condition()
{
	if (Npc_KnowsInfo(hero,VLK_585_Aleph_GLEN))
	{
		return 1;
	};
};

func void VLK_583_Glen_LOCKPICK_Info()
{
//	AI_Output(other,self,"VLK_583_Glen_LOCKPICK_15_01"); //I heard I could buy lockpicks here?
//	AI_Output(other,self,"VLK_583_Glen_LOCKPICK_15_01"); //Ich hab' gehört, bei dir kann ich Dietriche kaufen.
	AI_Output(other,self,"VLK_583_Glen_LOCKPICK_15_01"); //Slyšel jsem, že bych tu dostal paklíče?
//	AI_Output(self,other,"VLK_583_Glen_LOCKPICK_02_02"); //Well, since you were brainy enough to find that out, you can have some. 10 ore a piece.
//	AI_Output(self,other,"VLK_583_Glen_LOCKPICK_02_02"); //Nun, wenn du schlau genug warst, das herauszufinden, dann kannst du welche haben. 10 Erz das Stück.
	AI_Output(self,other,"VLK_583_Glen_LOCKPICK_02_02"); //Jistě, protože jsi dost bystrý, když jsi to zjistil, tak si můžeš nějaký koupit. 10 nugetů za kus.

};
// ***************** Infos *****************************

instance VLK_583_Glen_BUY(C_INFO)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_BUY_Condition;
	information = VLK_583_Glen_BUY_Info;
	important = 0;
	permanent = 1;
//	description = "(buy lockpicks)";
//	description = "(Dietriche kaufen)";
	description = "Chci koupit paklíče."; // #COMMENT Zvyšuje immersion:tm:
	trade = 1;
};

func int VLK_583_Glen_BUY_Condition()
{
	if (Npc_KnowsInfo(hero,VLK_583_Glen_LOCKPICK))
	{
		return 1;
	};
};
func void VLK_583_Glen_BUY_Info()
{
//	AI_Output(other,self,"VLK_583_Glen_BUY_Info_15_01"); //I wanna buy lockpicks.
//	AI_Output(other,self,"VLK_583_Glen_BUY_Info_15_01"); //Ich will Dietriche kaufen.
	AI_Output(other,self,"VLK_583_Glen_BUY_Info_15_01"); //Chci koupit paklíče.

};
