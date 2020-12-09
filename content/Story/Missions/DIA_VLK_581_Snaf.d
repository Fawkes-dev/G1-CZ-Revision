// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_Snaf_Exit(C_INFO)
{
	npc = Vlk_581_Snaf;
	nr = 999;
	condition = DIA_Snaf_Exit_Condition;
	information = DIA_Snaf_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Snaf_Exit_Condition()
{
	return 1;
};

func void DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

instance DIA_Snaf_Hello(C_INFO)
{
	npc = Vlk_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Hello_Condition;
	information = DIA_Snaf_Hello_Info;
	permanent = 0;
//	description = "How's things?";
//	description = "Wie steht's?";
	description = "Jak to jde?";
};

func int DIA_Snaf_Hello_Condition()
{ 
	return 1;
};

func void DIA_Snaf_Hello_Info()
{
//	AI_Output(other,self,"DIA_Snaf_Hello_15_00"); //How's things?
//	AI_Output(other,self,"DIA_Snaf_Hello_15_00"); //Wie steht's?
	AI_Output(other,self,"DIA_Snaf_Hello_15_00"); //Jak to jde?
//	AI_Output(self,other,"DIA_Snaf_Hello_01_01"); //Not bad. If you can cook well, you have many friends here.
//	AI_Output(self,other,"DIA_Snaf_Hello_01_01"); //Nicht schlecht. Wenn man gut kochen kann, hat man viele Freunde hier.
	AI_Output(self,other,"DIA_Snaf_Hello_01_01"); //Není to zlé. Když umíš dobře vařit, máš tady spoustu přátel.
//	AI_Output(self,other,"DIA_Snaf_Hello_01_02"); //Would you like some of my rice stew?
//	AI_Output(self,other,"DIA_Snaf_Hello_01_02"); //Willst du etwas von meinem Reiseintopf? Hier, nimm und lass es dir schmecken.
	AI_Output(self,other,"DIA_Snaf_Hello_01_02"); //Nechceš nějaký z mých rýžových nákypů?
//	AI_Output(other,self,"DIA_Snaf_Hello_15_03"); //Thanks.
//	AI_Output(other,self,"DIA_Snaf_Hello_15_03"); //Danke.
	AI_Output(other,self,"DIA_Snaf_Hello_15_03"); //Díky.
//	AI_Output(self,other,"DIA_Snaf_Hello_01_04"); //You could do me a favor.
//	AI_Output(self,other,"DIA_Snaf_Hello_01_04"); //Du könntest mir einen Gefallen tun.
	AI_Output(self,other,"DIA_Snaf_Hello_01_04"); //Mohl bys pro mě udělat laskavost.

	CreateInvItem(self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

// **************************************************
// 				Bring Zutaten
// **************************************************
	var int Snaf_Zutaten; 
	var int Snaf_FreeMBRagout;
// **************************************************

instance DIA_Snaf_Zutaten(C_INFO)
{
	npc = Vlk_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Zutaten_Condition;
	information = DIA_Snaf_Zutaten_Info;
	permanent = 0;
//	description ="What can I do for you?";
//	description = "Was kann ich für dich tun?";
	description = "Co pro tebe můžu udělat?";
};

func int DIA_Snaf_Zutaten_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

func void DIA_Snaf_Zutaten_Info()
{
//	AI_Output(other,self,"DIA_Snaf_Zutaten_15_00"); //What can I do for you?
//	AI_Output(other,self,"DIA_Snaf_Zutaten_15_00"); //Was kann ich für dich tun?
	AI_Output(other,self,"DIA_Snaf_Zutaten_15_00"); //Co bych měl udělat?
//	AI_Output(self,other,"DIA_Snaf_Zutaten_01_01"); //You must be used to good food. I have a new recipe: meatbug ragout a la Snaf with rice and mushrooms.
//	AI_Output(self,other,"DIA_Snaf_Zutaten_01_01"); //Du bist sicher gutes Essen gewöhnt. Ich hab' da ein neues Rezept: Fleischwanzen-Ragout ŕ la Snaf, mit Reis und Pilzen.
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_01"); //Musíš být zvyklý na dobré jídlo. Mám nový recept: ragú ze žravých štěnic po zlodějsku s rýží a houbami.
//	AI_Output(self,other,"DIA_Snaf_Zutaten_01_02"); //You can have as much as you want, but I still need  3 meatbugs and some hell mushrooms - 5 should be enough.
//	AI_Output(self,other,"DIA_Snaf_Zutaten_01_02"); //Du kannst haben, so viel du willst, aber ich brauche aber noch 3 Fleischwanzen und einige Höllenpilze - 5 müssten reichen.
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_02"); //Můžeš mít, kolik si jen vzpomeneš, ale budeš potřebovat: 3 žravé štěnice a pár pekelných hub - 5 by mělo stačit.

	Info_ClearChoices(DIA_Snaf_Zutaten);
//	Info_AddChoice(DIA_Snaf_Zutaten,"You want me to throw up?",DIA_Snaf_Zutaten_KOTZ);
//	Info_AddChoice(DIA_Snaf_Zutaten,"Willst du, dass ich kotze?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice(DIA_Snaf_Zutaten,"Chceš, abych se pozvracel?",DIA_Snaf_Zutaten_KOTZ);
//	Info_AddChoice(DIA_Snaf_Zutaten,"Sounds good.",DIA_Snaf_Zutaten_DoIt);
//	Info_AddChoice(DIA_Snaf_Zutaten,"Hört sich gut an.",DIA_Snaf_Zutaten_DoIt);
	Info_AddChoice(DIA_Snaf_Zutaten,"To zní dobře.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
//	AI_Output(other,self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //You want me to throw up?
//	AI_Output(other,self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Willst du, dass ich kotze?
	AI_Output(other,self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Chceš, abych se pozvracel?
//	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //You don't have to eat it, but I think at least you could try! If you happen to get the things, think of me.
//	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Du musst es ja nicht essen, aber zumindest probieren solltest du es! Falls du an die Sachen rankommst, denk an mich.
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Nemusíš to sníst, ale mohl bys to aspoň zkusit! Jestli se ti podaří ty věci sehnat, vzpomeň si na mě.
//	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //I've already sent somebody but he just hasn't come back - must have deserted to the New Camp.
//	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //Ich hab' schon jemanden geschickt, aber der kommt einfach nicht wieder - ist bestimmt zum Neuen Lager übergelaufen.
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //Už jsem někoho poslal, ale ještě se nevrátil - zřejmě zběhl do Nového tábora.
	Snaf_Zutaten = LOG_RUNNING;

	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
//	B_LogEntry(CH1_SnafsRecipe,"Snaf, the cook who lives in the Outer Ring of the Old Camp, sent me to get him 3 meatbugs and 5 hell mushrooms for a new recipe.");
//	B_LogEntry(CH1_SnafsRecipe,"Der Koch Snaf im Aussenring des Alten Lagers hat mich geschickt, ihm 3 Fleischwanzen und 5 Höllenpilze für ein neues Rezept zu besorgen.");
	B_LogEntry(CH1_SnafsRecipe,"Snaf, kuchař který žije na Vnějším okruhu, mě poslal, abych mu pro nový kuchařský recept opatřil 3 žravé štěnice a 5 pekelných hub.");

	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
//	AI_Output(other,self,"DIA_Snaf_Zutaten_DoIt_15_00"); //Sounds good.
//	AI_Output(other,self,"DIA_Snaf_Zutaten_DoIt_15_00"); //Hört sich gut an.
	AI_Output(other,self,"DIA_Snaf_Zutaten_DoIt_15_00"); //To zní dobře.
//	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Then go and see you get me the things.
//	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Dann sieh mal zu, dass du die Sachen besorgst.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Tak jdi a sežeň mi ty věci.
//	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_02"); //The last one I sent just hasn't come back - must have deserted to the New Camp.
//	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_02"); //Der Letzte, den ich losgeschickt hab, kommt einfach nicht wieder - ist bestimmt zum Neuen Lager übergelaufen.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_02"); //Poslední, kterého jsem poslal, se ještě nevrátil - zřejmě zběhl do Nového tábora.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;

	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
//	B_LogEntry(CH1_SnafsRecipe,"Snaf, the cook who lives in the Outer Ring of the Old Camp, sent me to get him 3 meatbugs and 5 hell mushrooms for a new recipe. I can have some when it's finished."); 
//	B_LogEntry(CH1_SnafsRecipe,"Der Koch Snaf im Aussenring des Alten Lagers hat mich geschickt, ihm 3 Fleischwanzen und 5 Höllenpilze für ein neues Rezept zu besorgen. Er gibt mir dann auch was ab."); 
	B_LogEntry(CH1_SnafsRecipe,"Snaf, kuchař žijící na Vnějším okruhu, mě poslal, abych mu pro nový kuchařský recept opatřil 3 žravé štěnice a 5 pekelných hub. Až to bude hotové, také z toho budu něco mít."); 

	Info_ClearChoices(DIA_Snaf_Zutaten); 
};

// **************************************************
// 					SUCCESS
// **************************************************

instance DIA_Snaf_ZutatenSuccess(C_INFO)
{
	npc = Vlk_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_ZutatenSuccess_Condition;
	information = DIA_Snaf_ZutatenSuccess_Info;
	permanent = 0;
//	description = "I have the things you wanted from me!";
//	description = "Ich hab' die Sachen, die du von mir wolltest!";
	description = "Mám ty věci, co jsi po mně chtěl!";
};

func int DIA_Snaf_ZutatenSuccess_Condition()
{ 
	if ((Snaf_Zutaten==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Mushroom_01)>=5) && (Npc_HasItems(other,ItAt_Meatbug_01)>=3))
	{
		return 1;
	};
};

func void DIA_Snaf_ZutatenSuccess_Info()
{
//	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00"); //I have the things you wanted from me!
//	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00"); //Ich hab' die Sachen, die du von mir wolltest!
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00"); //Mám ty věci, co jsi po mně chtěl!
//	AI_Output(self,other,"DIA_Snaf_ZutatenSuccess_01_01"); //Good, I just have to add them, then the stew will be ready... Wait ...
//	AI_Output(self,other,"DIA_Snaf_ZutatenSuccess_01_01"); //Gut, ich brauch sie nur noch dazuzugeben, dann ist der Eintopf fertig ... warte ...
	AI_Output(self,other,"DIA_Snaf_ZutatenSuccess_01_01"); //Výborně, musím je přidat, pak bude to ragú hotové... Počkej...

	CreateInvItems(other,ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items übergeben, wird sofort angepasst

	Npc_RemoveInvItems(self,ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other,ItAt_MeatBug_01, 3);

	CreateInvItems(self,ItFoMeatbugragout,3);
	B_GiveInvItems(self,other,ItFoMeatbugragout,3);

	Snaf_Zutaten = LOG_SUCCESS;

	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_SUCCESS);
//	B_LogEntry(CH1_SnafsRecipe,"Snaf was really satisfied when I gave him the ingredients.");
//	B_LogEntry(CH1_SnafsRecipe,"Snaf war sehr zufrieden, als ich ihm die Zutaten übergab.");
	B_LogEntry(CH1_SnafsRecipe,"Snaf byl velmi spokojený, když jsem mu přinesl ty přísady.");

	if Snaf_FreeMBRagout==TRUE
	{
//		B_LogEntry(CH1_SnafsRecipe,"From now on, he'll give me meatbug ragout every day.");
//		B_LogEntry(CH1_SnafsRecipe,"Ab jetzt kann ich jeden Tag Fleischwanzen-Ragout bei ihm essen.");
		B_LogEntry(CH1_SnafsRecipe,"Ode dneška mi bude každý den dávat ragú ze žravých štěnic.");
	};

	B_GiveXP(100);

	AI_StopProcessInfos(self);
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************
	var int Snaf_RagoutDay;
// **************************************************

instance DIA_Snaf_AfterSuccess(C_INFO)
{
	npc = Vlk_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_AfterSuccess_Condition;
	information = DIA_Snaf_AfterSuccess_Info;
	permanent = 1;
//	description = "You told me I could have as much stew as I wanted...";
//	description = "Du hast gesagt, ich kann soviel von dem Eintopf haben, wie ich will...";
	description = "Řekl jsi mi, že můžu mít tolik ragú, kolik budu chtít...";
};

func int DIA_Snaf_AfterSuccess_Condition()
{ 
	if ((Snaf_Zutaten==LOG_SUCCESS) && (Snaf_FreeMBRagout==TRUE))
	{
		return 1;
	};
};

func void DIA_Snaf_AfterSuccess_Info()
{
// 	AI_Output(other,self,"DIA_Snaf_AfterSuccess_15_00"); //You told me I could have as much stew as I wanted...
// 	AI_Output(other,self,"DIA_Snaf_AfterSuccess_15_00"); //Du hast gesagt, ich kann so viel von den Eintopf haben, wie ich will ...
 	AI_Output(other,self,"DIA_Snaf_AfterSuccess_15_00"); //Řekl jsi mi, že můžu mít tolik ragú, kolik budu chtít...

 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
// 		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_01"); //And that's true. Here, take 3 portions.
// 		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_01"); //Und das stimmt auch. Hier, nimm 3 Portionen!
 		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_01"); //A to je pravda. Tady jsou tři porce.
		CreateInvItems(self,ItFoMeatbugragout,3);
		B_GiveInvItems(self,other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
//		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_02"); //Sure! But there's nothing left today. Come back tomorrow!
//		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_02"); //Klar! Heute ist aber alles schon auf. Komm morgen wieder!
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_02"); //Jistě! Ale dnes nic nezbylo. Přijď zase zítra.
	};
};

// **************************************************
// 					Wo Fleischwanzen
// **************************************************

instance DIA_Snaf_WhereMeatbugs(C_INFO)
{
	npc = Vlk_581_Snaf;
	nr = 3;
	condition = DIA_Snaf_WhereMeatbugs_Condition;
	information = DIA_Snaf_WhereMeatbugs_Info;
	permanent = 0;
//	description = "Where can I find meatbugs?";
//	description = "Wo finde ich Fleischwanzen?";
	description = "Kde najdu žravé štěnice?";
};

func int DIA_Snaf_WhereMeatbugs_Condition()
{ 
	if ((Snaf_Zutaten==LOG_RUNNING))
	{
		return 1;
	};
};

func void DIA_Snaf_WhereMeatbugs_Info()
{
//	AI_Output(other,self,"DIA_Snaf_WhereMeatbugs_15_00"); //Where can I find the meatbugs?
//	AI_Output(other,self,"DIA_Snaf_WhereMeatbugs_15_00"); //Wo finde ich Fleischwanzen?
	AI_Output(other,self,"DIA_Snaf_WhereMeatbugs_15_00"); //Kde najdu žravé štěnice?
//	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_01"); //Everywhere where there's garbage lying around. You should be able to find some at the deserted huts near the castle wall.
//	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_01"); //Überall da, wo Müll rumliegt. An der Burgmauer gibt es einige verlassene Hütten, da solltest du welche finden.
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_01"); //Všude, kde se válí odpadky. Něco bys mohl najít u té opuštěné chatrče nedaleko hradní zdi.
//	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_02"); //Don't get confused by their ugly looks. Once cooked they are tasty.
//	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_02"); //Lass dich von ihrem fiesen Aussehen nicht täuschen. Gekocht sind sie lecker.
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_02"); //Nedej se zmást jejich nevábným vzhledem. Jakmile se uvaří, jsou znamenité.

//	B_LogEntry(CH1_SnafsRecipe,"There are meatbugs near the deserted huts by the castle wall."); 
//	B_LogEntry(CH1_SnafsRecipe,"Fleischwanzen gibt es bei den verlassenen Hütten an der Burgmauer."); 
	B_LogEntry(CH1_SnafsRecipe,"Poblíž zpustlých chatrčí u hradních zdí se vyskytují žravé štěnice."); 
};

// **************************************************
// 					Where Mushrooms
// **************************************************

instance DIA_Snaf_WhereMushrooms(C_INFO)
{
	npc = Vlk_581_Snaf;
	nr = 4;
	condition = DIA_Snaf_WhereMushrooms_Condition;
	information = DIA_Snaf_WhereMushrooms_Info;
	permanent = 0;
//	description = "Where can I find hell mushrooms?";
//	description = "Wo finde ich Höllenpilze?";
	description = "Kde najdu houby?";
};

func int DIA_Snaf_WhereMushrooms_Condition()
{ 
	if ((Snaf_Zutaten==LOG_RUNNING))
	{
		return 1;
	};
};

func void DIA_Snaf_WhereMushrooms_Info()
{
//	AI_Output(other,self,"DIA_Snaf_WhereMushrooms_15_00"); //Where can I find hell mushrooms?
//	AI_Output(other,self,"DIA_Snaf_WhereMushrooms_15_00"); //Wo finde ich Höllenpilze?
	AI_Output(other,self,"DIA_Snaf_WhereMushrooms_15_00"); //Kde najdu houby?
//	AI_Output(self,other,"DIA_Snaf_WhereMushrooms_01_01"); //If you leave through the south gate - that's the collapsed tower - you'll see a plain directly in front of you. There's mushrooms growing there.
//	AI_Output(self,other,"DIA_Snaf_WhereMushrooms_01_01"); //Wenn du aus dem Südtor rausgehst - das ist der umgestürzte Turm - findest du direkt vor dir eine Ebene, auf der Pilze wachsen.
	AI_Output(self,other,"DIA_Snaf_WhereMushrooms_01_01"); //Když projdeš jižní branou - to je ta zhroucená věž - uvidíš přímo před sebou pláň. Tam rostou houby.

//	B_LogEntry(CH1_SnafsRecipe,"Hell mushrooms can be found on the plain in front of the fallen tower of the south gate."); 
//	B_LogEntry(CH1_SnafsRecipe,"Höllenpilze gibt es auf der Ebene vor dem umgestürzten Turm, dem Südtor."); 
	B_LogEntry(CH1_SnafsRecipe,"Pekelné houby najdu na planině před zřícenou věží jižní brány."); 
};

// **************************************************
// 					Where Nek
// **************************************************

instance DIA_Snaf_WhereNek(C_INFO)
{
	npc = Vlk_581_Snaf;
	nr = 5;
	condition = DIA_Snaf_WhereNek_Condition;
	information = DIA_Snaf_WhereNek_Info;
	permanent = 0;
//	description = "Who was the guy you sent before me?";
//	description = "Wer war der Typ, den du vor mir losgeschickt hast?";
	description = "Kdo byl ten chlapík, kterého jsi poslal přede mnou?";
};

func int DIA_Snaf_WhereNek_Condition()
{ 
	if ((Snaf_Zutaten==LOG_RUNNING))
	{
		return 1;
	};
};

func void DIA_Snaf_WhereNek_Info()
{
//	AI_Output(other,self,"DIA_Snaf_WhereNek_15_00"); //Who was the guy you sent before me?
//	AI_Output(other,self,"DIA_Snaf_WhereNek_15_00"); //Wer war der Typ, den du vor mir losgeschickt hast?
	AI_Output(other,self,"DIA_Snaf_WhereNek_15_00"); //Kdo byl ten chlapík, kterého jsi poslal přede mnou?
//	AI_Output(self,other,"DIA_Snaf_WhereNek_01_01"); //His name was Nek. He was pretty discontented here - I think he's in the New Camp now.
//	AI_Output(self,other,"DIA_Snaf_WhereNek_01_01"); //Sein Name war Nek. Er war ziemlich unzufrieden hier - ich denke, er ist jetzt im Neuen Lager.
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_01"); //Jmenoval se Nek. Byl tady hrozně nespokojený - myslím, že je teď v Novém táboře.
//	AI_Output(self,other,"DIA_Snaf_WhereNek_01_02"); //I sent him to collect mushrooms - but he didn't come back...
//	AI_Output(self,other,"DIA_Snaf_WhereNek_01_02"); //Hab ihn Pilze suchen geschickt - aber er kam nicht wieder ...
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_02"); //Poslal jsem ho nasbírat houby - ale už se nevrátil zpátky...

	if (Sly_LostNek != LOG_SUCCESS)
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_LostNek,LOG_MISSION);
		Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
	};
//	B_LogEntry(CH1_LostNek,"Snaf, the cook, last saw Nek when he went to gather mushrooms.");
//	B_LogEntry(CH1_LostNek,"Der Koch Snaf hat Nek zum letzten Mal gesehen, als er Pilze pflücken ging.");
	B_LogEntry(CH1_LostNek,"Kuchař Snaf viděl Neka naposledy, když odešel sbírat houby.");
};

