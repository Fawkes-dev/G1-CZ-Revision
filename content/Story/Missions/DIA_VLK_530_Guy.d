// **************************************************
// 						 EXIT
// **************************************************

instance DIA_Guy_Exit(C_INFO)
{
	npc = Vlk_530_Guy;
	nr = 999;
	condition = DIA_Guy_Exit_Condition;
	information = DIA_Guy_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Guy_Exit_Condition()
{
	return 1;
};

func void DIA_Guy_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

instance DIA_Guy_Hello(C_INFO)
{
	npc = Vlk_530_Guy;
	nr = 2;
	condition = DIA_Guy_Hello_Condition;
	information = DIA_Guy_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "Hello!";
//	description = "Hallo!";
	description = "Nazdar!";
};

func int DIA_Guy_Hello_Condition()
{
	if (Kapitel <= 1)
	{
		return 1;
	};

	return 0;
};

func void DIA_Guy_Hello_Info()
{
//	AI_Output(other,self,"DIA_Guy_Hello_15_00"); //Hello!
//	AI_Output(other,self,"DIA_Guy_Hello_15_00"); //Hallo!
	AI_Output(other,self,"DIA_Guy_Hello_15_00"); //Nazdar!
//	AI_Output(self,other,"DIA_Guy_Hello_03_01"); //Mhm? I haven't seen you before - you are new here, aren't you?
//	AI_Output(self,other,"DIA_Guy_Hello_03_01"); //Hm? Dich hab' ich hier noch nie gesehen - du bist neu hier, oder?
	AI_Output(self,other,"DIA_Guy_Hello_03_01"); //Hmm? Ještě jsem tě tu neviděl, jsi tady nový, že jo?
//	AI_Output(other,self,"DIA_Guy_Hello_15_02"); //Just recently arrived...
//	AI_Output(other,self,"DIA_Guy_Hello_15_02"); //Vor kurzem angekommen ...
	AI_Output(other,self,"DIA_Guy_Hello_15_02"); //Nedávno jsem přišel.
//	AI_Output(self,other,"DIA_Guy_Hello_03_03"); //Have you already decided which camp you want to join?
//	AI_Output(self,other,"DIA_Guy_Hello_03_03"); //Hast du dir schon überlegt, welchem Lager du dich anschließen willst?
	AI_Output(self,other,"DIA_Guy_Hello_03_03"); //Už ses rozhodl, ke kterému táboru se přidáš?
//	AI_Output(other,self,"DIA_Guy_Hello_15_04"); //No, what do you think?
//	AI_Output(other,self,"DIA_Guy_Hello_15_04"); //Nein, was würdest du mir raten?
	AI_Output(other,self,"DIA_Guy_Hello_15_04"); //Ne, co bys mi radil?
//	AI_Output(self,other,"DIA_Guy_Hello_03_05"); //Well, it depends - each camp has its advantages, I guess.
//	AI_Output(self,other,"DIA_Guy_Hello_03_05"); //Kommt drauf an - jedes Lager hat seine Vorteile - denke ich.
	AI_Output(self,other,"DIA_Guy_Hello_03_05"); //No, to záleží - každý tábor má své výhody, řekl bych.
//	AI_Output(self,other,"DIA_Guy_Hello_03_06"); //Until you've made your decision, you can stay here - a hut just became available.
//	AI_Output(self,other,"DIA_Guy_Hello_03_06"); //Bist du dir's überlegt hast, kannst du hier wohnen - ist gerade 'ne Hütte freigeworden.
	AI_Output(self,other,"DIA_Guy_Hello_03_06"); //Dokud se nerozhodneš, můžeš bydlet tady - jedna chatrč se právě uvolnila.
};

// **************************************************
// 				Advantages OC
// **************************************************

instance DIA_Guy_AdOC(C_INFO)
{
	npc = Vlk_530_Guy;
	nr = 2;
	condition = DIA_Guy_AdOC_Condition;
	information = DIA_Guy_AdOC_Info;
	important = 0;
	permanent = 1;
//	description = "What are the advantages of the Old Camp?";
//	description = "Was sind die Vorteile des Alten Lagers?";
	description = "Jaké jsou výhody Starého tábora?";
};

func int DIA_Guy_AdOC_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};

	return 0;
};

func void DIA_Guy_AdOC_Info()
{
//	AI_Output(other,self,"DIA_Guy_AdOC_15_00"); //What are the advantages of the Old Camp?
//	AI_Output(other,self,"DIA_Guy_AdOC_15_00"); //Was sind die Vorteile des Alten Lagers?
	AI_Output(other,self,"DIA_Guy_AdOC_15_00"); //Jaké jsou výhody Starého tábora?
//	AI_Output(self,other,"DIA_Guy_AdOC_03_01"); //If you pay protection money to the guards, you can have a laidback life here. They always interfere if one of the paying diggers is attacked.
//	AI_Output(self,other,"DIA_Guy_AdOC_03_01"); //Wenn du den Gardisten dein Schutzgeld zahlst, hast du ein ruhiges Leben. Sie mischen sich in alle Kämpfe ein, in denen jemand angegriffen wird, den sie beschützen.
	//#Needs_Attention 'Zasahují do všech rvaček, ve kterých je někdo, koho chrání.' by chcelo prebasnit, pride mi to krkolomne.
	AI_Output(self,other,"DIA_Guy_AdOC_03_01"); //Když platíš strážím peníze za ochranu, můžeš tu vést klidný život. Zasahují do všech rvaček, ve kterých je někdo, koho chrání.
//	AI_Output(self,other,"DIA_Guy_AdOC_03_02"); //Besides, you can only get the goods from the outside world cheap here. These things are unaffordable in the other camps.
//	AI_Output(self,other,"DIA_Guy_AdOC_03_02"); //Außerdem kommt man nur hier günstig an Außenwelt-Waren. In den anderen Lagern sind diese Sachen unbezahlbar.
	//#Needs_Attention 'V ostatních táborech jsou tyto věci k nezaplacení.' - mozno deformacia z prilisneho hrania povodnej cestiny - ale viac mi tu sedi 'V ostatních táborech jsou tyto věci nedostupné.'
	AI_Output(self,other,"DIA_Guy_AdOC_03_02"); //Kromě toho můžeš jedině tady sehnat levné zboží z vnějšího světa. V ostatních táborech jsou tyto věci k nezaplacení.

	Info_ClearChoices(DIA_Guy_AdOC);
//	Info_AddChoice(DIA_Guy_AdOC,"I think I've heard enough about the Old Camp.",DIA_Guy_AdOC_BACK);
//	Info_AddChoice(DIA_Guy_AdOC,"Ich denke, ich hab' genug über's alte Lager gehört...",DIA_Guy_AdOC_BACK);
	Info_AddChoice(DIA_Guy_AdOC,"Myslím, že jsem o Starém táboře slyšel dost.",DIA_Guy_AdOC_BACK);
//	Info_AddChoice(DIA_Guy_AdOC,"What goods are considered precious here?",DIA_Guy_AdOC_Warez);
//	Info_AddChoice(DIA_Guy_AdOC,"Was sind hier wertvolle Waren?",DIA_Guy_AdOC_Warez);
	Info_AddChoice(DIA_Guy_AdOC,"Jaké zboží je tu obzvlášť cenné?",DIA_Guy_AdOC_Warez);
//	Info_AddChoice(DIA_Guy_AdOC,"And what if two people fight each other who both pay protection money?",DIA_Guy_AdOC_Protection);
//	Info_AddChoice(DIA_Guy_AdOC,"Und was ist, wenn zwei Leute kämpfen, die beide Schutzgeld zahlen?",DIA_Guy_AdOC_Protection);
	Info_AddChoice(DIA_Guy_AdOC,"A co když se do sebe pustí dva lidé, kteří oba platí peníze za ochranu?",DIA_Guy_AdOC_Protection);
};

func void DIA_Guy_AdOC_BACK()
{
//	AI_Output(other,self,"DIA_Guy_AdOC_BACK_15_00"); //I think I've heard enough about the Old Camp.
//	AI_Output(other,self,"DIA_Guy_AdOC_BACK_15_00"); //Ich denke, ich hab' genug über's Alte Lager gehört...
	AI_Output(other,self,"DIA_Guy_AdOC_BACK_15_00"); //Myslím, že jsem o Starém táboře slyšel dost.
//	AI_Output(self,other,"DIA_Guy_AdOC_BACK_03_01"); //I like it here.
//	AI_Output(self,other,"DIA_Guy_AdOC_BACK_03_01"); //Also, mir gefällt's hier.
	AI_Output(self,other,"DIA_Guy_AdOC_BACK_03_01"); //Líbí se mi tady.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
//	AI_Output(other,self,"DIA_Guy_AdOC_Warez_15_00"); //What goods are considered precious here?
//	AI_Output(other,self,"DIA_Guy_AdOC_Warez_15_00"); //Was sind hier wertvolle Waren?
	AI_Output(other,self,"DIA_Guy_AdOC_Warez_15_00"); //Jaké zboží je tu obzvlášť cenné?
//	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_01"); //Everything from the outside world. Bread, cheese, bacon and above all beer and wine - not the cheap rice schnapps from the New Camp, but really good stuff.
//	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_01"); //Alles, was aus der Außenwelt kommt. Brot, Käse, Schinken und vor allem Bier und Wein - nicht der billige Reisschnaps aus dem Neuen Lager, sondern richtig guter Stoff.
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_01"); //Všechno z vnějšího světa. Chleba, sýr, šunka a především pivo a víno - ne ta laciná rýžová pálenka z Nového tábora, ale opravdu kvalitní zboží.
//	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_02"); //You always get a good price for weapons, and armor is REALLY expensive.
//	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_02"); //Für Waffen bekommt man fast immer was und Rüstungen sind RICHTIG teuer.
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_02"); //Také za zbraně ti tu dobře zaplatí a zbroje jsou SKUTEČNĚ drahé.
//	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_03"); //The guards took the old armor off the prison guards after they killed them.
//	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_03"); //Die Gardisten haben sich die alten Rüstungen der Aufseher unter den Nagel gerissen, nachdem sie sie alle umgebracht hatten.
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_03"); //Strážci si přivlastnili staré zbroje dozorců, potom, co je všechny zabili.
//	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_04"); //You can always recognize them by their armor, they only sell it to other guards. You could never get hold of one as an outsider.
//	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_04"); //Diese Rüstungen sind so was wie ihr Erkennungszeichen, die verkaufen sie nur an ihresgleichen, da kommst du als Fremder gar nicht ran.
	//#Needs_Attention Mozno dalsia moja deformacia z povodnej cestiny, viac mi sedi povodny preklad, mozno len trochu prebasnit ten povodny?
	//'Tyto zbroje jsou něco jako jejich znamení, které prodávají jen dalším strážcům' --> 'Podle této zbroje je můžeš bezpečně poznat, protože ji zase prodávají výhradně jiným strážcům.' --> 'Poznáš je právě podle zbroje, prodávají ji jenom dalším strážcům.'
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_04"); //Tyto zbroje jsou něco jako jejich znamení, které prodávají jen dalším strážcům. Jako cizinec se nemáš šnaci k takové zbroji dostat.
};

func void DIA_Guy_AdOC_Protection()
{
//	AI_Output(other,self,"DIA_Guy_AdOC_Protection_15_00"); //And what if two people fight each other who both pay protection money?
//	AI_Output(other,self,"DIA_Guy_AdOC_Protection_15_00"); //Und was ist, wenn zwei Leute kämpfen, die beide Schutzgeld zahlen?
	AI_Output(other,self,"DIA_Guy_AdOC_Protection_15_00"); //A co když se do sebe pustí dva lidé, kteří oba platí peníze za ochranu?
//	AI_Output(self,other,"DIA_Guy_AdOC_Protection_03_01"); //Then the guards just watch - until one of them kills the other: Then they do him in.
//	AI_Output(self,other,"DIA_Guy_AdOC_Protection_03_01"); //Dann sehen sich die Gardisten das in aller Seelenruhe an. Aber wehe, wenn der eine den anderen umbringt. Dann ist er selber dran!
	//#Needs_Attention 'Ale běda' by som mozno prebasnil na nieco ... viac Gothicovske :)
	AI_Output(self,other,"DIA_Guy_AdOC_Protection_03_01"); //Pak se strážci v klidu dívají. Ale běda, jak jeden z nich zemře, zabijí toho druhého!
};

// **************************************************
// 				Advantages NewCamp
// **************************************************

instance DIA_Guy_AdNC(C_INFO)
{
	npc = Vlk_530_Guy;
	nr = 3;
	condition = DIA_Guy_AdNC_Condition;
	information = DIA_Guy_AdNC_Info;
	important = 0;
	permanent = 0;
//	description = "What are the advantages of the New Camp?";
//	description = "Was spricht für das Neue Lager?";
	description = "Jaké jsou výhody Nového tábora?";
};

func int DIA_Guy_AdNC_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};

	return 0;
};

func void DIA_Guy_AdNC_Info()
{
//	AI_Output(other,self,"DIA_Guy_AdNC_15_00"); //What are the advantages of the New Camp?
//	AI_Output(other,self,"DIA_Guy_AdNC_15_00"); //Was spricht für das Neue Lager?
	AI_Output(other,self,"DIA_Guy_AdNC_15_00"); //Jaké jsou výhody Nového tábora?
//	AI_Output(self,other,"DIA_Guy_AdNC_03_01"); //If you're cool about getting your throat cut for a slice of bread, you should go there.
//	AI_Output(self,other,"DIA_Guy_AdNC_03_01"); //Wenn du kein Problem damit hast, wegen einem Stück Brot die Kehle durchgeschnitten zu kriegen, bist du da richtig!
	//#Needs_Attention :) Dalsia deformacia z povodneho prekladu? Viac mi sedi 'Jestli se chceš nechat podřezat kvůli bochníku chleba, tak tam běž!' (mozno prebasnit poslednu cast ', tak je to to správné místo!')
	AI_Output(self,other,"DIA_Guy_AdNC_03_01"); //Jestli nemáš problém s tím, podřezat chlapa kvůli kousku chleba, jsi na správném místě!
//	AI_Output(self,other,"DIA_Guy_AdNC_03_02"); //No - it's not that bad. But it's different from here.
//	AI_Output(self,other,"DIA_Guy_AdNC_03_02"); //Nein - ganz so schlimm ist es nicht. Aber es geht anders zu als hier.
	AI_Output(self,other,"DIA_Guy_AdNC_03_02"); //Ne - není to tak zlé. Ale chodí to tam jinak než tady.
//	AI_Output(self,other,"DIA_Guy_AdNC_03_03"); //Here Gomez takes care that things are sort of peaceful. In the New Camp, there is no law.
//	AI_Output(self,other,"DIA_Guy_AdNC_03_03"); //Hier sorgt Gomez dafür, das alles halbwegs ruhig bleibt. Im Neuen Lager gibt es kein Gesetz.
	AI_Output(self,other,"DIA_Guy_AdNC_03_03"); //Gomez se stará, aby tu byl jakýsi klid. V Novém táboře nemají žádné zákony.
//	AI_Output(self,other,"DIA_Guy_AdNC_03_04"); //The only ones powerful enough to have a say there are the water mages, but they're too busy studying the Barrier all day.
//	AI_Output(self,other,"DIA_Guy_AdNC_03_04"); //Die einzigen, die mächtig genug wären, den Laden zu schmeißen, sind die Wassermagier, und die forschen den ganzen Tag an der Barriere herum.
	AI_Output(self,other,"DIA_Guy_AdNC_03_04"); //Jediný, kdo tam má opravdu moc, jsou mágové Vody, ale ti celé dny jen zkoumají Bariéru.
};

// **************************************************
// 				Advantages ST
// **************************************************

instance DIA_Guy_AdST(C_INFO)
{
	npc = Vlk_530_Guy;
	nr = 4;
	condition = DIA_Guy_AdST_Condition;
	information = DIA_Guy_AdST_Info;
	important = 0;
	permanent = 0;
//	description = "Why should I join the sect?";
//	description = "Warum sollte ich mich der Sekte anschließen?";
	description = "Proč bych se měl přidat k té sektě?";
};

func int DIA_Guy_AdST_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};

	return 0;
};

func void DIA_Guy_AdST_Info()
{
//	AI_Output(other,self,"DIA_Guy_AdST_15_00"); //Why should I join the sect?
//	AI_Output(other,self,"DIA_Guy_AdST_15_00"); //Warum sollte ich mich der Sekte anschließen?
	AI_Output(other,self,"DIA_Guy_AdST_15_00"); //Proč bych se měl přidat k té sektě?
//	AI_Output(self,other,"DIA_Guy_AdST_03_01"); //Well, you better ask somebody from the Sect Camp.
//	AI_Output(self,other,"DIA_Guy_AdST_03_01"); //Tja, das fragst du am besten einen, der von dort kommt.
	AI_Output(self,other,"DIA_Guy_AdST_03_01"); //No, na to se raději zeptej někoho ze Sektovního tábora.
//	AI_Output(self,other,"DIA_Guy_AdST_03_02"); //There are always a couple of novices in the Camp, and I'm sure they can tell you a lot about the sect.
//	AI_Output(self,other,"DIA_Guy_AdST_03_02"); //Es sind immer einige Novizen im Lager, die können dir sicher 'ne Menge über die Sekte erzählen.
	//#Needs_Attention prebasnit?
	//AI_Output(self,other,"DIA_Guy_AdST_03_02"); //V táboře je vždycky pár noviců, co ti určitě o sektě řeknou víc.
	AI_Output(self,other,"DIA_Guy_AdST_03_02"); //V táboře je vždycky pár noviců, kteří ti bezpochyby mohou o sektě říct víc.
//	AI_Output(self,other,"DIA_Guy_AdST_03_03"); //I've never been there myself. But according to everything that's said, they must be really generous.
//	AI_Output(self,other,"DIA_Guy_AdST_03_03"); //Ich war selbst nie da. Aber nach allem, was man hört, sollen sie sehr großzügig sein.
	AI_Output(self,other,"DIA_Guy_AdST_03_03"); //Já sám jsem tam nikdy nebyl. Ale podle toho, co se povídá, mají být opravdu velkorysí.
//	AI_Output(self,other,"DIA_Guy_AdST_03_04"); //None of the three camps seems to be as much in need of new people as the Sect Camp.
//	AI_Output(self,other,"DIA_Guy_AdST_03_04"); //Keines der drei Lager scheint so dringend neue Leute zu brauchen wie das der Sekte.
	AI_Output(self,other,"DIA_Guy_AdST_03_04"); //Zdá se, že žádný ze třech táborů nepotřebuje tolik nových lidí jako Sektovní tábor.
};

// **************************************************
// 				Welche Hütte ist meine
// **************************************************

instance DIA_Guy_MyOwnHut(C_INFO)
{
	npc = Vlk_530_Guy;
	nr = 10;
	condition = DIA_Guy_MyOwnHut_Condition;
	information = DIA_Guy_MyOwnHut_Info;
	important = 0;
	permanent = 1;
//	description = "Which of the huts can I take for myself?";
//	description = "Welche von den Hütten kann ich für mich nehmen?";
	description = "Kterou chatrč bych si mohl zabrat?";
};

func int DIA_Guy_MyOwnHut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};

	return 0;
};

func void DIA_Guy_MyOwnHut_Info()
{
//	AI_Output(other,self,"DIA_Guy_MyOwnHut_15_00"); //Which of the huts can I take for myself?
//	AI_Output(other,self,"DIA_Guy_MyOwnHut_15_00"); //Welche von den Hütten kann ich für mich nehmen?
	AI_Output(other,self,"DIA_Guy_MyOwnHut_15_00"); //Kterou chatrč bych si mohl zabrat?
	AI_PointAt(self,"OCR_HUT_26");
//	AI_Output(self,other,"DIA_Guy_MyOwnHut_03_01"); //The hut over there with the little canopy is empty.
//	AI_Output(self,other,"DIA_Guy_MyOwnHut_03_01"); //Die Hütte da oben mit dem kleinen Vordach ist frei.
	AI_Output(self,other,"DIA_Guy_MyOwnHut_03_01"); //Támhleta chatrč s malým přístřeškem je prázdná.
	AI_StopPointAt(self);
};
