// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance DIA_Jarvis_EXIT(C_INFO)
{
	npc = Sld_728_Jarvis;
	nr = 999;
	condition = DIA_Jarvis_EXIT_Condition;
	information = DIA_Jarvis_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

func void DIA_Jarvis_EXIT_Info()
{ 
//	AI_Output(self,other,"DIA_Jarvis_EXIT_08_00"); //Watch your back!
//	AI_Output(self,other,"DIA_Jarvis_EXIT_08_00"); //Pass auf deinen Rücken auf!
	AI_Output(self,other,"DIA_Jarvis_EXIT_08_00"); //Hlídej si záda!
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						First
// ************************************************************

instance DIA_Jarvis_First(C_INFO)
{
	npc = Sld_728_Jarvis;
	nr = 1;
	condition = DIA_Jarvis_First_Condition;
	information = DIA_Jarvis_First_Info;
	permanent = 0;
	important = 1;
};                       

func int DIA_Jarvis_First_Condition()
{
	return 1;
};

func void DIA_Jarvis_First_Info()
{ 
//	AI_Output(self,other,"DIA_Jarvis_First_08_00"); //Do you intend to go through this gate?
//	AI_Output(self,other,"DIA_Jarvis_First_08_00"); //Hast du vor, durch dies Tor zu gehen?
	AI_Output(self,other,"DIA_Jarvis_First_08_00"); //Máš v úmyslu projít touhle branou?
//	AI_Output(other,self,"DIA_Jarvis_First_15_01"); //Do you intend to stop me?
//	AI_Output(other,self,"DIA_Jarvis_First_15_01"); //Willst du mich aufhalten?
	AI_Output(other,self,"DIA_Jarvis_First_15_01"); //Máš v úmyslu mě zastavit?
//	AI_Output(self,other,"DIA_Jarvis_First_08_02"); //No, but you should know what's waiting for you. This is not like in the Old Camp and not like being with the sect loonies either!
//	AI_Output(self,other,"DIA_Jarvis_First_08_02"); //Nein, aber du solltest wissen, was dich erwartet. Es läuft hier nicht so wie im Alten Lager und erst recht nicht wie bei den Sektenspinnern!
	AI_Output(self,other,"DIA_Jarvis_First_08_02"); //Ne, ale měl bys vědět, co tě čeká. Tady to není jako ve Starém táboře nebo jako u těch sektářských bláznů!
//	AI_Output(other,self,"DIA_Jarvis_First_15_03"); //And what am I expecting here?
//	AI_Output(other,self,"DIA_Jarvis_First_15_03"); //Und wie läuft es hier?
	AI_Output(other,self,"DIA_Jarvis_First_15_03"); //A co mě tu čeká?
//	AI_Output(self,other,"DIA_Jarvis_First_08_04"); //There are no guards or templars to look after you. It's every man for himself,the only ones who stick together are us mercenaries.
//	AI_Output(self,other,"DIA_Jarvis_First_08_04"); //Es gibt hier keine Gardisten oder Templer, die auf dich aufpassen. Jeder ist sich selbst der Nächste, und die einzigen, die zusammenhalten, sind wir Söldner.
	AI_Output(self,other,"DIA_Jarvis_First_08_04"); //Tady nejsou žádní strážci ani templáři, kteří by na tebe dohlídli. Tady jedná každý sám za sebe a jediní, kdo spolu drží, jsme my, žoldáci.
};

// ************************************************************
// 						Söldner
// ************************************************************

instance DIA_Jarvis_SldInfo(C_INFO)
{
	npc = Sld_728_Jarvis;
	nr = 1;
	condition = DIA_Jarvis_SldInfo_Condition;
	information = DIA_Jarvis_SldInfo_Info;
	permanent = 0;
//	description = "What do the mercenaries do?";
//	description = "Was machen die Söldner?";
	description = "Co dělají žoldáci?";
};                       

func int DIA_Jarvis_SldInfo_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_First))
	{
		return 1;
	};
};

func void DIA_Jarvis_SldInfo_Info()
{ 
//	AI_Output(other,self,"DIA_Jarvis_SldInfo_15_00"); //What do the mercenaries do?
//	AI_Output(other,self,"DIA_Jarvis_SldInfo_15_00"); //Was machen die Söldner?
	AI_Output(other,self,"DIA_Jarvis_SldInfo_15_00"); //Co dělají žoldáci?
//	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_01"); //We - we are the mercenaries of the water mages.
//	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_01"); //Wir - wir sind die Söldner der Wassermagier.
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_01"); //My - my jsme žoldáci mágů Vody.
//	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_02"); //Our target is to break free from here. We're working hard for it and don't plan to take things easy like the guys from the Old Camp, who are just having an easy time resting on the backs of the diggers.
//	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_02"); //Unser Ziel ist es, hier auszubrechen. Wir arbeiten hart dafür und wir wollen uns hier keinen Lenz machen, wie die Lumpen aus dem Alten Lager, die sich nur auf den Schultern der Buddler ausruhen.
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_02"); //Náš cíl je dostat se odtud. Tvrdě na tom pracujeme a nevidíme věci tak snadno jako ti hoši ze Starého tábora, kteří si užívají dobrých časů na zádech svých kopáčů.
//	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_03"); //And we all follow Lee. He's a great man. He's the one who holds this damn camp together.
//	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_03"); //Und wir alle folgen Lee. Er ist ein großer Mann. Nur er hält dieses verdammte Lager zusammen.
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_03"); //Všichni jdeme za Leem. Je to velký muž. Muž, který drží tenhle proklatý tábor pohromadě.
};

// ************************************************************
// 						Magier
// ************************************************************

instance DIA_Jarvis_Magier(C_INFO)
{
	npc = Sld_728_Jarvis;
	nr = 2;
	condition = DIA_Jarvis_Magier_Condition;
	information = DIA_Jarvis_Magier_Info;
	permanent = 0;
//	description = "What do the mages do?";
//	description = "Was machen die Magier?";
	description = "Co dělají mágové?";
};                       

func int DIA_Jarvis_Magier_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_SldInfo))
	{
		return 1;
	};
};

func void DIA_Jarvis_Magier_Info()
{ 
//	AI_Output(other,self,"DIA_Jarvis_Magier_15_00"); //What do the mages do?
//	AI_Output(other,self,"DIA_Jarvis_Magier_15_00"); //Was machen die Magier?
	AI_Output(other,self,"DIA_Jarvis_Magier_15_00"); //Co dělají mágové?
//	AI_Output(self,other,"DIA_Jarvis_Magier_08_01"); //They investigate the magic characteristics of the ore our scrapers collect in the mine.
//	AI_Output(self,other,"DIA_Jarvis_Magier_08_01"); //Sie erforschen die magischen Eigenschafen des Erzes, das unsere Schürfer aus der Mine holen.
	AI_Output(self,other,"DIA_Jarvis_Magier_08_01"); //Zkoumají magické vlastnosti rudy, kterou naši rudaři vytěžili v dolu.
//	AI_Output(self,other,"DIA_Jarvis_Magier_08_02"); //As far as I know, they want to blow the whole damn ore mound sky-high to free us from the Barrier.
//	AI_Output(self,other,"DIA_Jarvis_Magier_08_02"); //Soweit ich das verstanden habe, wollen sie den ganzen verdammten Erzhaufen in die Luft jagen, um die Barriere wegzusprengen.
	AI_Output(self,other,"DIA_Jarvis_Magier_08_02"); //Co já vím, chtějí vyhodit celou tu zpropadenou rudnou haldu do povětří, aby se osvobodili z Bariéry.
//	AI_Output(other,self,"DIA_Jarvis_Magier_15_03"); //Sounds dangerous.
//	AI_Output(other,self,"DIA_Jarvis_Magier_15_03"); //Klingt gefährlich.
	AI_Output(other,self,"DIA_Jarvis_Magier_15_03"); //To vypadá nebezpečně.
//	AI_Output(self,other,"DIA_Jarvis_Magier_08_04"); //They said we shouldn't worry.
//	AI_Output(self,other,"DIA_Jarvis_Magier_08_04"); //Sie sagen, wir sollen uns keine Sorgen machen.
	AI_Output(self,other,"DIA_Jarvis_Magier_08_04"); //Říkali, abysme se neznepokojovali.
};

// ************************************************************
// 						Erzhaufen
// ************************************************************

instance DIA_Jarvis_Erzhaufen(C_INFO)
{
	npc = Sld_728_Jarvis;
	nr = 2;
	condition = DIA_Jarvis_Erzhaufen_Condition;
	information = DIA_Jarvis_Erzhaufen_Info;
	permanent = 0;
//	description = "You have a massive ore mound here?";
//	description = "Ihr habt einen riesigen Haufen Erz hier?";
	description = "Máte tady velkou rudnou haldu?";
};                       

func int DIA_Jarvis_Erzhaufen_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_Magier))
	{
		return 1;
	};
};

func void DIA_Jarvis_Erzhaufen_Info()
{ 
//	AI_Output(other,self,"DIA_Jarvis_Erzhaufen_15_00"); //You have a massive ore mound here?
//	AI_Output(other,self,"DIA_Jarvis_Erzhaufen_15_00"); //Ihr habt einen riesigen Haufen Erz hier?
	AI_Output(other,self,"DIA_Jarvis_Erzhaufen_15_00"); //Máte tady velkou rudnou haldu?
//	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_01"); //You could say that. We could buy the King's wife for that.
//	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_01"); //Kann man wohl sagen. Wenn wir den mit der Außenwelt tauschen würden, würde uns der König seine Frau dafür verkaufen .
	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_01"); //Dalo by se tak říci. Mohli bysme za to koupit královu ženu.
//	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_02"); //But we don't give a damn about trading the ore with that old fart. We want to get OUT OF HERE!
//	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_02"); //Aber wir werden einen Dreck tun, dem alten Sack das Erz zu geben. Wir wollen hier RAUS!
	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_02"); //My se ale nestaráme o žádný proklatý obchod s rudou s tím starým páprdou. My se chceme ODTUD DOSTAT!
};

// ************************************************************
// 						Wo Haufen
// ************************************************************

instance DIA_Jarvis_WoHaufen(C_INFO)
{
	npc = Sld_728_Jarvis;
	nr = 2;
	condition = DIA_Jarvis_WoHaufen_Condition;
	information = DIA_Jarvis_WoHaufen_Info;
	permanent = 0;
//	description = "Where's the ore mound?";
//	description = "Wo ist der Erzhaufen?";
	description = "Kde je rudná halda?";
};                       

func int DIA_Jarvis_WoHaufen_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_Erzhaufen))
	{
		return 1;
	};
};

func void DIA_Jarvis_WoHaufen_Info()
{ 
//	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_00"); //Where's the ore mound?
//	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_00"); //Wo ist der Erzhaufen?
	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_00"); //Kde je rudná halda?
//	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_01"); //You want to see a real mound of ore, do you? There's a hole in the middle of the cave, they shove it all in there.
//	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_01"); //Willst mal richtig viel Erz sehen, was? In der Mitte der Höhle ist ein Loch, da kippen sie alles rein.
	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_01"); //Chceš vidět opravdovou haldu rudy, viď? Uprostřed jeskyně je velká díra, do které to všechno ukládají.
//	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_02"); //But you won't get anywhere near it, I can tell you. The mages and our people guard the ore day and night.
//	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_02"); //Aber ran kommst du da nicht, das kann ich dir gleich sagen. Die Magier und unsere Leute bewachen das Erz Tag und Nacht.
	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_02"); //Ale blízko se k ní nedostaneš, to ti povídám. Mágové a naši lidé ji střeží ve dne v noci.
//	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_03"); //I was just curious.
//	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_03"); //Ich war nur neugierig.
	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_03"); //Byl jsem zvědavý.
};

// ************************************************************
// 						Rest
// ************************************************************

instance DIA_Jarvis_Rest(C_INFO)
{
	npc = Sld_728_Jarvis;
	nr = 3;
	condition = DIA_Jarvis_Rest_Condition;
	information = DIA_Jarvis_Rest_Info;
	permanent = 0;
//	description = "What about the rest of the people?";
//	description = "Was ist mit dem Rest der Leute?";
	description = "A co zbytek lidí?";
};                       

func int DIA_Jarvis_Rest_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_First))
	{
		return 1;
	};
};

func void DIA_Jarvis_Rest_Info()
{ 
//	AI_Output(other,self,"DIA_Jarvis_Rest_15_00"); //What about the rest of the people?
//	AI_Output(other,self,"DIA_Jarvis_Rest_15_00"); //Was ist mit dem Rest der Leute?
	AI_Output(other,self,"DIA_Jarvis_Rest_15_00"); //A co zbytek lidí?
//	AI_Output(self,other,"DIA_Jarvis_Rest_08_01"); //All crooks. They don't give a damn about the Camp. I'd rather just have the peasants guarding the front gate.
//	AI_Output(self,other,"DIA_Jarvis_Rest_08_01"); //Alles Banditen. Sie kümmern sich keinen Deut um das Lager. Ich würde sie nicht mal das Vortor bewachen lassen, wahrscheinlich wäre es sinnvoller, dort ein paar Bauern hinzustellen.
	AI_Output(self,other,"DIA_Jarvis_Rest_08_01"); //Všechno darebáci. Ti se o ten zpropadenej tábor nestarají. Raději bych měl před branou rolnickou stráž.
};

// ************************************************************
// 						PERM
// ************************************************************

instance DIA_Jarvis_PERM(C_INFO)
{
	npc = Sld_728_Jarvis;
	nr = 10;
	condition = DIA_Jarvis_PERM_Condition;
	information = DIA_Jarvis_PERM_Info;
	permanent = 1;
//	description = "How are things going at the moment?";
//	description = "Wie ist die Lage zur Zeit?";
	description = "Tak jak to jde?";
};                       

func int DIA_Jarvis_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_Magier))
	{
		return 1;
	};
};

func void DIA_Jarvis_PERM_Info()
{ 
//	AI_Output(other,self,"DIA_Jarvis_PERM_15_00"); //How are things going at the moment?
//	AI_Output(other,self,"DIA_Jarvis_PERM_15_00"); //Wie ist die Lage zur Zeit?
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00"); //Tak jak to jde?
//	AI_Output(self,other,"DIA_Jarvis_PERM_08_01"); //The scrapers are still collecting. Once they have enough ore, we'll blow the mound up.
//	AI_Output(self,other,"DIA_Jarvis_PERM_08_01"); //Die Schürfer sammeln noch. Wenn sie genug Erz haben, jagen wir den Haufen in die Luft.
	AI_Output(self,other,"DIA_Jarvis_PERM_08_01"); //Rudaři pořád těží. Až budeme mít dost rudy, tak tu haldu odpálíme.
};

/*------------------------------------------------------------------------
//							SÖLDNERAUFNAHME //
------------------------------------------------------------------------*/
instance Sld_728_Jarvis_AUFNAHMESOLDIER(C_INFO)
{
	npc = Sld_728_Jarvis;
	condition = Sld_728_Jarvis_AUFNAHMESOLDIER_Condition;
	information = Sld_728_Jarvis_AUFNAHMESOLDIER_Info;
	important = 1;
	permanent = 0;
};

func int Sld_728_Jarvis_AUFNAHMESOLDIER_Condition()
{ 
	if (Npc_GetTrueGuild(hero) == GIL_ORG) 
	&& ((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS))
	&& (Npc_GetDistToNpc(hero,self) < 1000)
	{
		return TRUE;
	};
};
func void Sld_728_Jarvis_AUFNAHMESOLDIER_Info()
{
	AI_GotoNpc(hero,self); 
//	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hey, I heard you'd been giving the crawlers in the mine a hard time.
//	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hey, ich habe gehört, du hast die Crawler in der Mine ganz schön aufgemischt.
	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hej, slyšel jsem, že jsi v dolech pořádně zatopil důlním červům.
//	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee should be quite willing to accept you as a mercenary. Just speak to him.
//	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee ist bestimmt bereit, dich als Söldner aufzunehmen. Sprich doch einfach mal mit ihm.
	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee by tě byl docela ochotný přijmout za žoldáka. Promluv s ním.

	self.flags = 0; // Immortal-Flag löschen

	Log_CreateTopic(GE_BecomeMercenary,LOG_NOTE);
//	B_LogEntry(GE_BecomeMercenary,"I should speak to Lee. Maybe he'll let me join the mercenaries.");
//	B_LogEntry(GE_BecomeMercenary,"Ich sollte mal mit Lee reden. Vielleicht nimmt er mich in die Reihen der Söldner auf.");
	B_LogEntry(GE_BecomeMercenary,"Měl bych si promluvit s Leem. Možná mi dovolí přidat se k žoldákům.");
};

