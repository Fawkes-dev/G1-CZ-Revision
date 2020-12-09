// **************************************************
// 						 EXIT 
// **************************************************

instance DIA_Dusty_Exit(C_INFO)
{
	npc = Vlk_524_Dusty;
	nr = 999;
	condition = DIA_Dusty_Exit_Condition;
	information = DIA_Dusty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Dusty_Exit_Condition()
{
	return 1;
};

func void DIA_Dusty_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 				Was machst du?
// **************************************************

instance DIA_Dusty_Hello(C_INFO)
{
	npc = Vlk_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_Hello_Condition;
	information = DIA_Dusty_Hello_Info;
	permanent = 0;
//	description = "Hi! I'm new here - how's things?";
//	description = "Hi! Ich bin neu hier - wie sieht's aus?";
	description = "Zdar! Jsem tady nový - jak to jde?";
};

func int DIA_Dusty_Hello_Condition()
{ 
	return 1;
};

func void DIA_Dusty_Hello_Info()
{
//	AI_Output(other,self,"DIA_Dusty_Hello_15_00"); //Hi! I'm new here - how's things?
//	AI_Output(other,self,"DIA_Dusty_Hello_15_00"); //Hi! Ich bin neu hier - wie sieht's aus?
	AI_Output(other,self,"DIA_Dusty_Hello_15_00"); //Zdar! Jsem tady nový - jak to jde?
//	AI_Output(self,other,"DIA_Dusty_Hello_03_01"); //Go away! I've been working my ass off in the mines for the last two weeks. And what for?
//	AI_Output(self,other,"DIA_Dusty_Hello_03_01"); //Ach hör auf! Ich hab' die letzten zwei Wochen in den Minen geschuftet. Und wofür?
	AI_Output(self,other,"DIA_Dusty_Hello_03_01"); //Jdi pryč! Za poslední dva týdny jsem se v dolech sedřel k smrti. A co z toho?
//	AI_Output(self,other,"DIA_Dusty_Hello_03_02"); //Some sad lumps of ore is all I got. I had to spend most of it on food.
//	AI_Output(self,other,"DIA_Dusty_Hello_03_02"); //Ein paar lausige Brocken Erz sind mir geblieben. Das meiste ging für Essen drauf.
	AI_Output(self,other,"DIA_Dusty_Hello_03_02"); //Nějakej blbej kus rudy, to je všechno. Většinu z toho utratím za jídlo.
//	AI_Output(self,other,"DIA_Dusty_Hello_03_03"); //I talked to Baal Parvez down there. He told me some interesting things about the Sect Camp.
//	AI_Output(self,other,"DIA_Dusty_Hello_03_03"); //Ich hab' mich mit Baal Parvez da unten unterhalten. Er hat mir ein paar interessante Sachen über das Lager der Sekte erzählt.
	AI_Output(self,other,"DIA_Dusty_Hello_03_03"); //Mluvil jsem s Baalem Parvezem. Řekl mi o Sektovním táboře několik zajímavých věcí.
//	AI_Output(self,other,"DIA_Dusty_Hello_03_04"); //I think I'd better go there instead of slaving away for Gomez.
//	AI_Output(self,other,"DIA_Dusty_Hello_03_04"); //Ich glaube, ich sollte besser zu denen gehen, als mir weiter für Gomez den Rücken krumm zu schuften.
	AI_Output(self,other,"DIA_Dusty_Hello_03_04"); //Myslím, že by bylo lepší přejít tam, než tady dál otročit na Gomeze.
};

// **************************************************
// 				Warum gehst du nicht?
// **************************************************

instance DIA_Dusty_WhyNotLeave(C_INFO)
{
	npc = Vlk_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_WhyNotLeave_Condition;
	information = DIA_Dusty_WhyNotLeave_Info;
	permanent = 0;
//	description = "You don't like it here? Why don't you just go then?";
//	description = "Dir gefällt's hier nicht? Wieso gehst du dann nicht einfach?";
	description = "Tobě se tady nelíbí? Proč teda neodejdeš?";
};

func int DIA_Dusty_WhyNotLeave_Condition()
{ 
	if  Npc_KnowsInfo(hero,DIA_Dusty_Hello)
	&& !Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin)
	{
		return 1;
	};
};

func void DIA_Dusty_WhyNotLeave_Info()
{
//	AI_Output(other,self,"DIA_Dusty_WhyNotLeave_15_00"); //You don't like it here? Why don't you just go then?
//	AI_Output(other,self,"DIA_Dusty_WhyNotLeave_15_00"); //Dir gefällt's hier nicht? Wieso gehst du dann nicht einfach?
	AI_Output(other,self,"DIA_Dusty_WhyNotLeave_15_00"); //Tobě se tady nelíbí? Proč teda neodejdeš?
//	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_01"); //Because I'm not quite sure what to expect there. I had a pal here - his name was Melvin. He headed off to the Sect Camp a week ago.
//	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_01"); //Weil ich nicht sicher bin, was mich da erwartet. Ich habe 'nen Kumpel hier gehabt - Melvin heißt er. Er ist vor einer Woche ins Sektenlager abgehauen.
	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_01"); //Protože si nejsem úplně jistý, co tam můžu očekávat. Měl jsem tady kamaráda - jmenoval se Melvin. Odešel před týdnem do Sektovního tábora.
//	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_02"); //But since then I haven't heard of him. And as long as I don't get a message from him, I'll stay here!
//	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_02"); //Aber ich habe seitdem nichts mehr von ihm gehört. Und so lange sich das nicht ändert, bleibe ich besser hier!
	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_02"); //Od té doby jsem o něm neslyšel. A dokud o něm nedostanu zprávu, zůstanu tady!

	Log_CreateTopic(CH1_RecruitDusty,LOG_MISSION);
	Log_SetTopicStatus(CH1_RecruitDusty,LOG_RUNNING);
//	B_LogEntry(CH1_RecruitDusty,"Dusty, a digger from the Old Camp, is no longer satisfied with living there. He's thinking about joining the Brotherhood in the swamp.");
//	B_LogEntry(CH1_RecruitDusty,"Dusty, ein Buddler aus dem Alten Lager ist dort sehr unzufrieden. Er spielt mit dem Gedanken sich der Bruderschaft im Sumpf anzuschließen.");
	B_LogEntry(CH1_RecruitDusty,"Dusty, kopáč ze Starého tábora, už je dlouho nespokojen se zdejším životem. Přemýšlí o tom, že se přidá k Bratrstvu v bažinách.");
};

// **************************************************
// 				Mit Melvin geredet
// **************************************************

instance DIA_Dusty_MetMelvin(C_INFO)
{
	npc = Vlk_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_MetMelvin_Condition;
	information = DIA_Dusty_MetMelvin_Info;
	permanent = 0;
//	description = "I was in the Sect Camp and met Melvin.";
//	description = "Ich war im Lager der Sekte und hab' Melvin getroffen.";
	description = "Byl jsem v Sektovním táboře a setkal se s Melvinem.";
};

func int DIA_Dusty_MetMelvin_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Melvin_Hello))
	{
		return 1;
	};
};

func void DIA_Dusty_MetMelvin_Info()
{
//	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_00"); //I was in the Sect Camp and met Melvin.
//	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_00"); //Ich war im Lager der Sekte und hab' Melvin getroffen.
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_00"); //Byl jsem v Sektovním táboře a setkal se s Melvinem.
//	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_01"); //And? What did he say?
//	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_01"); //Und? Was sagt er?
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_01"); //No a? Co říkal?
//	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_02"); //Apparently he likes it more than getting harassed by the guards.
//	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_02"); //Es gefällt ihm anscheinend besser, als sich von den Gardisten schikanieren zu lassen.
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_02"); //Očividně mu to vyhovovalo líp, než se nechat utlačovat od stráží.
//	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_03"); //Hey man! He has all the fun for himself? I have to go there. But I'll never make it out of the Camp.
//	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_03"); //Hey, Mann! Er hat den ganzen Spaß ohne mich? Ich muss da hin. Aber ich komme nie aus dem Lager raus.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_03"); //No, těbuch! To si tu celou radost nechává sám pro sebe? Musím tam jít. Ale z tohohle tábora se nikdy nedostanu..
//	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_04"); //Really? Why not?
//	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_04"); //So? Warum nicht?
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_04"); //Vážně? Proč ne?
//	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_05"); //The guards have found out that I wanna leave, I guess I talk too much.
//	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_05"); //Die Gardisten haben spitz gekriegt, dass ich mich verdrücken will - schätze, ich hab' zu viel geredet.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_05"); //Stráže zjistily, že jsem chtěl odejít, protože jsem asi moc mluvil.
//	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_06"); //I need at least 100 ore to bribe the guards.
//	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_06"); //Ich bräuchte mindestens 100 Erz, um die Wachen zu bestechen.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_06"); //Potřebuju aspoň 100 nugetů na uplacení stráží.
};

// **************************************************
// 				Ich gebe dir 100 Erz
// **************************************************

instance DIA_Dusty_Offer100Ore(C_INFO)
{
	npc = Vlk_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_Offer100Ore_Condition;
	information = DIA_Dusty_Offer100Ore_Info;
	permanent = 0;
//	description = "What if I gave you the 100 ore for the guards?";
//	description = "Was wäre, wenn ich dir die 100 Erz für die Wachen geben würde?";
	description = "Co kdybych ti dal těch 100 nugetů pro stráže?";
};

func int DIA_Dusty_Offer100Ore_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin))
	&& (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Dusty_Offer100Ore_Info()
{
//	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_00"); //What if I gave you the 100 ore for the guards?
//	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_00"); //Was wäre, wenn ich dir die 100 Erz für die Wachen geben würde?
	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_00"); //Co kdybych ti dal těch 100 nugetů pro stráže?
//	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_01"); //You'd do that? Why?
//	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_01"); //Das würdest du tun? Warum?
	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_01"); //To bys udělal? Proč?
//	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_02"); //Well, let's say you aren't the only one who'd prefer you to hang around in the Sect Camp.
//	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_02"); //Nun, sagen wir mal, du bist nicht der einzige, der dein dummes Grinsen gerne im Sektenlager sehen würde.
	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_02"); //Dobrá, řekněme, že nejsi jediný, kdo by se chtěl do Sektovního tábora podívat.
//	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_03"); //You mean you wanna come with me?
//	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_03"); //Soll das heißen, du willst mit mir dahin gehen?
	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_03"); //Takže ty chceš jít se mnou?
};

// **************************************************
// 				Ich gehe mit dir
// **************************************************

instance DIA_Dusty_IWouldGo(C_INFO)
{
	npc = Vlk_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_IWouldGo_Condition;
	information = DIA_Dusty_IWouldGo_Info;
	permanent = 0;
//	description = "I WILL go with you to the Sect Camp.";
//	description = "Ich WERDE mit dir zum Sektenlager gehen.";
	description = "PŮJDU s tebou do Sektovního tábora.";
};

func int DIA_Dusty_IWouldGo_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Dusty_Offer100Ore))
	{
		return 1;
	};
};

func void DIA_Dusty_IWouldGo_Info()
{
//	AI_Output(other,self,"DIA_Dusty_IWouldGo_15_00"); //I WILL go with you to the Sect Camp.
//	AI_Output(other,self,"DIA_Dusty_IWouldGo_15_00"); //Ich WERDE mit dir zum Sektenlager gehen.
	AI_Output(other,self,"DIA_Dusty_IWouldGo_15_00"); //PŮJDU s tebou do Sektovního tábora.
//	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_01"); //Great, man! I'm ready. We can start as soon as you want.
//	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_01"); //Gut, Mann! Ich bin bereit. Wir können los, sobald du so weit bist.
	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_01"); //Výborně, člověče! Jsem připraven. Můžeme vyrazit, jakmile budeš chtít.
//	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_02"); //But don't forget - we need 100 ore for the guards.
//	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_02"); //Aber vergiss nicht - wir brauchen 100 Erz für die Wachen.
	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_02"); //Ale nezapomeň - potřebujeme těch 100 nugetů pro stráže.

//	B_LogEntry(CH1_RecruitDusty,"I managed to convince the digger Dusty to join the Brotherhood in the swamp camp. But I'll have to bribe the guards with some ore. It'll be best if I take him straight to Baal Tondral.");
//	B_LogEntry(CH1_RecruitDusty,"Ich konnte den Buddler Dusty dazu überreden, mit mir ins Sumpflager der Bruderschaft zu gehen. Allerdings werde ich die Torwachen mit etwas Erz zum wegsehen bewegen müssen. Am besten bringe ich ihn gleich direkt zu Baal Tondral.");
	B_LogEntry(CH1_RecruitDusty,"Podařilo se mi přesvědčit kopáče Dustyho, aby se přidal do Tábora v bažinách. Budu ale muset uplatit stráže nějakou rudou. Nejlepší bude, když ho přivedu přímo k Baalu Tondralovi.");
	B_GiveXP(XP_DustyJoined);
};

// **************************************************
// 				Lass uns gehen
// **************************************************
var int Dusty_LetsGo;
// **************************************************

instance DIA_Dusty_LetsGo(C_INFO)
{
	npc = Vlk_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_LetsGo_Condition;
	information = DIA_Dusty_LetsGo_Info;
	permanent = 1;
//	description = "I'm ready - let's go!";
//	description = "Ich bin bereit - lass uns gehen.";
	description = "Jsem připraven - jdeme!";
};

func int DIA_Dusty_LetsGo_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Dusty_IWouldGo))
	&& (Npc_GetDistToWP(hero,"OCR_MAINGATE_INSIDE") > 1500)
	&& (Npc_GetDistToWP(hero,"OCR_NORTHGATE_RAMP_ATOP") > 1500)
	&& (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Dusty_LetsGo_Info()
{
//	AI_Output(other,self,"DIA_Dusty_LetsGo_15_00"); //I'm ready - let's go!
//	AI_Output(other,self,"DIA_Dusty_LetsGo_15_00"); //Ich bin bereit - lass uns gehen.
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_00"); //Jsem připraven - jdeme!
//	AI_Output(self,other,"DIA_Dusty_LetsGo_03_01"); //Okay - let's take the south gate - the north gate is of no use, it's impossible to bribe the guards there.
//	AI_Output(self,other,"DIA_Dusty_LetsGo_03_01"); //Okay - lass uns durchs Südtor gehen - auf keinen Fall durchs Nordtor - die Wachen dort lassen sich garantiert nicht bestechen.
	AI_Output(self,other,"DIA_Dusty_LetsGo_03_01"); //Dobře - pojďme jižní branou - severní brána se nedá použít, stráže tam není možné podplatit.
//	AI_Output(self,other,"DIA_Dusty_LetsGo_03_02"); //And perhaps you should see to the ore - I'm not very good at that kind of thing.
//	AI_Output(self,other,"DIA_Dusty_LetsGo_03_02"); //Und die Sache mit dem Erz regelst du am besten - ich bin nicht sehr gut in so was.
	AI_Output(self,other,"DIA_Dusty_LetsGo_03_02"); //Snad je ta ruda přesvědčí - nejsem v těchhle věcech moc dobrý.
//	AI_Output(other,self,"DIA_Dusty_LetsGo_15_03"); //Okay - let's move!
//	AI_Output(other,self,"DIA_Dusty_LetsGo_15_03"); //Gut - also los!
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_03"); //Dobrá - pojďme!

	if !Dusty_LetsGo
	{
//		B_LogEntry(CH1_RecruitDusty,"Dusty warned me not to use the main gate in the north. It seems to be easier to bribe the guards at the gate to the south.");
//		B_LogEntry(CH1_RecruitDusty,"Dusty warnte mich davor das Haupttor im Norden zu benutzen. Die Wachen am hinteren Südtor sind angeblich empfänglicher für Bestechungen.");
		B_LogEntry(CH1_RecruitDusty,"Dusty mě varoval, abych se vyhnul severní bráně. Snazší prý bude uplatit stráže u jižní brány.");
		Dusty_LetsGo = TRUE;
	};

	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");

	AI_StopProcessInfos(self);

};

