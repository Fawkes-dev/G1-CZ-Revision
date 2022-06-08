//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance Info_Xardas_EXIT(C_INFO)
{
	npc = Kdf_404_Xardas;
	nr = 999;
	condition = Info_Xardas_EXIT_Condition;
	information = Info_Xardas_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Xardas_EXIT_Condition()
{
	return 1;
};

func void Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if (!Npc_HasItems(self, ItArRuneFireball))
	{
		CreateInvItem(self, ItArRuneFireball);
	};

	if (Npc_HasItems(self, ItArScrollSummonDemon) < 1)
	{
		CreateInvItems(self, ItArScrollSummonDemon, 2);
	};
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance Info_Xardas_DISTURB(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_DISTURB_Condition;
	information = Info_Xardas_DISTURB_Info;
	important = 1;
	permanent = 0;
};

func int Info_Xardas_DISTURB_Condition()
{
	if (/*(FindGolemHearts == 4)
	&& */(!UrShak_SpokeOfUluMulu))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_DISTURB_Info()
{
	B_WhirlAround(self, hero);
//	AI_Output(self,hero,"Info_Xardas_DISTURB_14_01"); //WHO DARES TO DISTURB ME IN MY STUDIES?
//	AI_Output(self,hero,"Info_Xardas_DISTURB_14_01"); //WER WAGT ES, MEINE STUDIEN ZU UNTERBRECHEN?
	AI_Output(self, hero, "Info_Xardas_DISTURB_14_01"); //KDO SI DOVOLUJE MĚ RUŠIT PŘI STUDIÍCH?
//	AI_Output(hero,self,"Info_Xardas_DISTURB_15_02"); //My name is...
//	AI_Output(hero,self,"Info_Xardas_DISTURB_15_02"); //Mein Name ist ...
	AI_Output(hero, self, "Info_Xardas_DISTURB_15_02"); //Jmenuju se...
//	AI_Output(self,hero,"Info_Xardas_DISTURB_14_03"); //I don't wish to know your name. It is insignificant.
//	AI_Output(self,hero,"Info_Xardas_DISTURB_14_03"); //Ich will deinen Namen nicht wissen. Er ist unwichtig.
	AI_Output(self, hero, "Info_Xardas_DISTURB_14_03"); //Nechci znát tvé jméno. Není to důležité.
//	AI_Output(self,hero,"Info_Xardas_DISTURB_14_04"); //All that matters is that you are the first person in years to have solved my Golem's riddles.
//	AI_Output(self,hero,"Info_Xardas_DISTURB_14_04"); //Wichtig ist nur, dass du der Erste seit vielen Jahren bist, der meine Golemrätsel gelöst hat.
	AI_Output(self, hero, "Info_Xardas_DISTURB_14_04"); //Důležité je jen to, že jsi za TA léta první člověk, který vyřešil hádanku mých Golemů.
};

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance Info_Xardas_OTHERS(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_OTHERS_Condition;
	information = Info_Xardas_OTHERS_Info;
	important = 0;
	permanent = 0;
//	description = "Have there been any other visitors?";
//	description = "Gab es andere Besucher?";
	description = "Byli tu ještě jiní návštěvníci?";
};

func int Info_Xardas_OTHERS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_DISTURB))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_OTHERS_Info()
{
//	AI_Output(hero,self,"Info_Xardas_OTHERS_15_01"); //Have there been any other visitors?
//	AI_Output(hero,self,"Info_Xardas_OTHERS_15_01"); //Gab es andere Besucher?
	AI_Output(hero, self, "Info_Xardas_OTHERS_15_01"); //Byli tu ještě jiní návštěvníci?
//	AI_Output(self,hero,"Info_Xardas_OTHERS_14_02"); //Not many, and when they began to annoy me I confronted them with one of my supernatural creatures.
//	AI_Output(self,hero,"Info_Xardas_OTHERS_14_02"); //Nicht viele und als sie mir lästig wurden, machten sie Bekanntschaft mit einem meiner höheren Wesen.
	AI_Output(self, hero, "Info_Xardas_OTHERS_14_02"); //Ne mnoho, ale jakmile mě začali obtěžovat, seznámili se s jednou z mých nadpřirozených bytostí.
//	AI_Output(hero,self,"Info_Xardas_OTHERS_15_03"); //You enjoy being on your own, don't you?
//	AI_Output(hero,self,"Info_Xardas_OTHERS_15_03"); //Du bist wohl gerne ungestört, was?
	AI_Output(hero, self, "Info_Xardas_OTHERS_15_03"); //Ty jsi nerad vyrušován, viď?
};

//---------------------------------------------------------------------
//	Info SATURAS
//---------------------------------------------------------------------
instance Info_Xardas_SATURAS(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_SATURAS_Condition;
	information = Info_Xardas_SATURAS_Info;
	important = 0;
	permanent = 0;
//	description = "I was sent by Saturas. We need your help!";
//	description = "Saturas schickt mich. Wir brauchen deine Hilfe!";
	description = "Poslal mě Saturas. Potřebujeme tvoji pomoc!";
};

func int Info_Xardas_SATURAS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_DISTURB))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_SATURAS_Info()
{
//	AI_Output(hero,self,"Info_Xardas_SATURAS_15_01"); //I was sent by Saturas. We need your help!
//	AI_Output(hero,self,"Info_Xardas_SATURAS_15_01"); //Saturas schickt mich. Wir brauchen deine Hilfe!
	AI_Output(hero, self, "Info_Xardas_SATURAS_15_01"); //Poslal mě Saturas. Potřebujeme tvojí pomoc!
//	AI_Output(hero,self,"Info_Xardas_SATURAS_15_02"); //The Magicians of Water plan to use their big ore mound...
//	AI_Output(hero,self,"Info_Xardas_SATURAS_15_02"); //Die Wassermagier wollen ihren großen Erzhaufen ...
	AI_Output(hero, self, "Info_Xardas_SATURAS_15_02"); //Mágové Vody chtějí svou rudnou haldu...
//	AI_Output(self,hero,"Info_Xardas_SATURAS_14_03"); //The ore mound is NOT the solution!
//	AI_Output(self,hero,"Info_Xardas_SATURAS_14_03"); //Der Erzhaufen ist NICHT die Lösung!
	AI_Output(self, hero, "Info_Xardas_SATURAS_14_03"); //Rudná halda NENÍ řešení!
//	AI_Output(hero,self,"Info_Xardas_SATURAS_15_04"); //It isn't?
//	AI_Output(hero,self,"Info_Xardas_SATURAS_15_04"); //Nein?
	AI_Output(hero, self, "Info_Xardas_SATURAS_15_04"); //Ne?
//	AI_Output(self,hero,"Info_Xardas_SATURAS_14_05"); //NO!
//	AI_Output(self,hero,"Info_Xardas_SATURAS_14_05"); //NEIN!
	AI_Output(self, hero, "Info_Xardas_SATURAS_14_05"); //NE!
};

//---------------------------------------------------------------------
//	Info KDW
//---------------------------------------------------------------------
instance Info_Xardas_KDW(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_KDW_Condition;
	information = Info_Xardas_KDW_Info;
	important = 0;
	permanent = 0;
//	description = "All the Magicians of Fire are dead!";
//	description = "Die Feuermagier sind alle tot!";
	description = "Všichni mágové Ohně jsou mrtví!";
};

func int Info_Xardas_KDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_DISTURB))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_KDW_Info()
{
//	AI_Output(hero,self,"Info_Xardas_KDW_15_01"); //All the Magicians of Fire are dead!
//	AI_Output(hero,self,"Info_Xardas_KDW_15_01"); //Die Feuermagier sind alle tot!
	AI_Output(hero, self, "Info_Xardas_KDW_15_01"); //Všichni mágové Ohně jsou mrtví!
//	AI_Output(hero,self,"Info_Xardas_KDW_15_02"); //Gomez had them assassinated.
//	AI_Output(hero,self,"Info_Xardas_KDW_15_02"); //Gomez hat sie ermorden lassen.
	AI_Output(hero, self, "Info_Xardas_KDW_15_02"); //Gomez je nechal povraždit.
//	AI_Output(self,hero,"Info_Xardas_KDW_14_03"); //That does not surprise me. Those foolish barbarian butchers in the castle, especially Gomez, were never to be trusted.
//	AI_Output(self,hero,"Info_Xardas_KDW_14_03"); //Das wundert mich nicht sonderlich. Diesen dummen barbarischen Schlächtern in der Burg, allen voran Gomez, war noch nie zu trauen.
	AI_Output(self, hero, "Info_Xardas_KDW_14_03"); //To mě nepřekvapuje. Těm hloupým barbarům na hradě a hlavně Gomezovi, se nikdy nedalo věřit.
//	AI_Output(self,hero,"Info_Xardas_KDW_14_04"); //Corristo and the other magicians elected their own hangman when they helped Gomez to usurp the power.
//	AI_Output(self,hero,"Info_Xardas_KDW_14_04"); //Corristo und die anderen Magier haben sich ihren Henker selbst gewählt, als sie Gomez damals halfen, die Macht an sich zu reißen.
	AI_Output(self, hero, "Info_Xardas_KDW_14_04"); //Corristo a další mágové si sami zvolili šibenici, když pomáhali Gomezovi získat moc.
};

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance Info_Xardas_SLEEPER(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_SLEEPER_Condition;
	information = Info_Xardas_SLEEPER_Info;
	important = 0;
	permanent = 0;
//	description = "The so-called Sleeper is said to be an evil arch demon.";
//	description = "Der so genannte 'Schläfer' soll ein übler Erzdämon sein.";
	description = "Takzvaný 'Spáč' je zlý arcidémon.";
};

func int Info_Xardas_SLEEPER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_DISTURB))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_SLEEPER_Info()
{
//	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_01"); //"The so-called ""Sleeper"" is said to be an evil arch demon."
//	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_01"); //Der so genannte "Schläfer" soll ein übler Erzdämon sein.
	AI_Output(hero, self, "Info_Xardas_SLEEPER_15_01"); //Takzvaný 'Spáč' je zlý arcidémon.
//	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_02"); //That's what the Brotherhood in the swamp found out.
//	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_02"); //Das hat die Bruderschaft im Sumpf herausgefunden.
	AI_Output(hero, self, "Info_Xardas_SLEEPER_15_02"); //Zjistilo to Bratrstvo z bažin.
//	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_03"); //Now the Magicians of Water believe that everybody in the colony is in great danger.
//	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_03"); //Die Wassermagier glauben nun, dass wir alle in der Kolonie in großer Gefahr seien.
	AI_Output(hero, self, "Info_Xardas_SLEEPER_15_03"); //Teď si mágové Vody myslí, že jsme všichni v Kolonii ve velkém nebezpečí.
//	AI_Output(self,hero,"Info_Xardas_SLEEPER_14_04"); //There is a greater danger than anyone within the Barrier could possibly imagine.
//	AI_Output(self,hero,"Info_Xardas_SLEEPER_14_04"); //Die Gefahr ist größer als irgendjemand innerhalb der Barriere erahnen kann.
	AI_Output(self, hero, "Info_Xardas_SLEEPER_14_04"); //To nebezpečí je větší, než si kdokoliv uvnitř Bariéry dokáže představit.
};

//---------------------------------------------------------------------
//	Info DANGER
//---------------------------------------------------------------------
instance Info_Xardas_DANGER(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_DANGER_Condition;
	information = Info_Xardas_DANGER_Info;
	important = 0;
	permanent = 0;
//	description = "If the explosion of the ore mound doesn't avert the great danger...";
//	description = "Wenn die Sprengung des Erzhaufens die große Gefahr nicht beseitigt...";
	description = "Pokud exploze rudné haldy toto velké nebezpečí neodvrátí...";
};

func int Info_Xardas_DANGER_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Xardas_SLEEPER))
	&& (Npc_KnowsInfo(hero, Info_Xardas_SATURAS)))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_DANGER_Info()
{
//	AI_Output(hero,self,"Info_Xardas_DANGER_15_01"); //if the explosion of the ore mound doesn't avert the great danger...
//	AI_Output(hero,self,"Info_Xardas_DANGER_15_01"); //Wenn die Sprengung des Erzhaufens die große Gefahr nicht beseitigt ...
	AI_Output(hero, self, "Info_Xardas_DANGER_15_01"); //Pokud exploze rudné haldy toto velké nebezpečí neodvrátí...
//	AI_Output(self,hero,"Info_Xardas_DANGER_14_02"); //... Forget the ore mound! Its power won't open the Barrier.
//	AI_Output(self,hero,"Info_Xardas_DANGER_14_02"); //... Vergiss den großen Erzhaufen! Seine Energie wird die Barriere nicht sprengen können.
	AI_Output(self, hero, "Info_Xardas_DANGER_14_02"); //...Zapomeň na rudnou haldu! Její energie Bariéru neprolomí.
//	AI_Output(self,hero,"Info_Xardas_DANGER_14_03"); //if Corristo and Saturas hadn't wasted their time fighting over foolish and vain issues throughout the past years, they'd all know what I know now.
//	AI_Output(self,hero,"Info_Xardas_DANGER_14_03"); //Hätten Corristo und Saturas in den letzten Jahren weniger Zeit für ihre törichten und eitlen Streitereien verschwendet, dann wüssten sie jetzt vielleicht auch das, was ich weiß.
	AI_Output(self, hero, "Info_Xardas_DANGER_14_03"); //Kdyby Corristo a Saturas netrávili v minulých letech čas zbytečnými pošetilými hádkami, věděli by to, co teď vím já.
//	AI_Output(hero,self,"Info_Xardas_DANGER_15_04"); //Which is?
//	AI_Output(hero,self,"Info_Xardas_DANGER_15_04"); //Was denn?
	AI_Output(hero, self, "Info_Xardas_DANGER_15_04"); //A co?
//	AI_Output(self,hero,"Info_Xardas_DANGER_14_05"); //None of the twelve magicians ever stopped to wonder why the formation of the Barrier got beyond their control, or why it assumed such gigantic proportions.
//	AI_Output(self,hero,"Info_Xardas_DANGER_14_05"); //Keiner der zwölf Magier von damals scheint sich je gefragt zu haben, warum die Erschaffung der Barriere außer Kontrolle geriet und sie diese riesigen Ausmaße annahm.
	AI_Output(self, hero, "Info_Xardas_DANGER_14_05"); //Žádný z dvanácti mágů se od té doby nepřestal ptát, proč se jim vytvoření Bariéry vymklo z rukou a proč nabyla tak obrovských rozměrů.
};

//---------------------------------------------------------------------
//	Info BARRIER
//---------------------------------------------------------------------
instance Info_Xardas_BARRIER(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_BARRIER_Condition;
	information = Info_Xardas_BARRIER_Info;
	important = 0;
	permanent = 0;
//	description = "Did you find out why that happened? ";
//	description = "Hast du es herausgefunden?";
	description = "Ty jsi to zjistil?";
};

func int Info_Xardas_BARRIER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_DANGER))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_BARRIER_Info()
{
//	AI_Output(hero,self,"Info_Xardas_BARRIER_15_01"); //Did you find out why that happened?
//	AI_Output(hero,self,"Info_Xardas_BARRIER_15_01"); //Hast du es herausgefunden?
	AI_Output(hero, self, "Info_Xardas_BARRIER_15_01"); //Ty jsi to zjistil?
//	AI_Output(self,hero,"Info_Xardas_BARRIER_14_02"); //Well, one thing is certain: The answer lies deep beneath the Orc town.
//	AI_Output(self,hero,"Info_Xardas_BARRIER_14_02"); //Eins ist auf jeden Fall klar! Die Antwort liegt tief unter der Stadt der Orks.
	AI_Output(self, hero, "Info_Xardas_BARRIER_14_02"); //Jedno je každopádně jisté! Odpověď leží hluboko pod městem skřetů.
//	AI_Output(hero,self,"Info_Xardas_BARRIER_15_03"); //The Orc town?
//	AI_Output(hero,self,"Info_Xardas_BARRIER_15_03"); //Die Stadt der Orks?
	AI_Output(hero, self, "Info_Xardas_BARRIER_15_03"); //Město skřetů?
//	AI_Output(self,hero,"Info_Xardas_BARRIER_14_04"); //Orcs are not animals, as many people think. Their culture is as old as the human culture.
//	AI_Output(self,hero,"Info_Xardas_BARRIER_14_04"); //Die Orks sind nicht etwa, wie viele glauben, Tiere. Ihre Kultur reicht fast ebenso weit zurück, wie die der Menschen.
	AI_Output(self, hero, "Info_Xardas_BARRIER_14_04"); //Skřeti nejsou zvířata, jak si mnozí myslí. Jejich kultura sahá do minulosti tak daleko jako lidská.
//	AI_Output(self,hero,"Info_Xardas_BARRIER_14_05"); //A few centuries ago, five Orc shamen invoked a very old arch demon which they hoped would give their clan the power to defeat their enemies.
//	AI_Output(self,hero,"Info_Xardas_BARRIER_14_05"); //Vor vielen hundert Jahren beschwörten fünf Ork-Schamanen einen uralten Erzdämonen, um ihrem Klan die Macht zu verleihen, ihre Feinde zu vernichten.
	AI_Output(self, hero, "Info_Xardas_BARRIER_14_05"); //Před mnoha stoletími vyvolalo pět skřetích šamanů prastarého arcidémona, aby jejich klanu propůjčil sílu, se kterou by porazili své nepřátele.
//	AI_Output(hero,self,"Info_Xardas_BARRIER_15_06"); //This arch demon, was it the Sleeper?
//	AI_Output(hero,self,"Info_Xardas_BARRIER_15_06"); //War dieser Erzdämon der Schläfer?
	AI_Output(hero, self, "Info_Xardas_BARRIER_15_06"); //Ten arcidémon, to byl Spáč?
//	AI_Output(self,hero,"Info_Xardas_BARRIER_14_07"); //The Orcs gave him that name much later. But I won't tell you why they did it, or why they are now terrified by this supernatural creature!
//	AI_Output(self,hero,"Info_Xardas_BARRIER_14_07"); //Diesen Namen gaben ihm die Orks erst viel später. Doch warum sie das taten und warum sie heute vor diesem Überwesen in Furcht erzittern, werde ich dir nicht erzählen!
	AI_Output(self, hero, "Info_Xardas_BARRIER_14_07"); //Skřeti mu tohle jméno dali až mnohem později. Neřeknu ti ale, proč mu ho dali, ani proč se teď té nadpřirozené bytosti děsí!
};

//---------------------------------------------------------------------
//	Info EVENT
//---------------------------------------------------------------------
instance Info_Xardas_EVENT(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_EVENT_Condition;
	information = Info_Xardas_EVENT_Info;
	important = 0;
	permanent = 0;
//	description = "Why not?";
//	description = "Warum nicht?";
	description = "Proč ne?";
};

func int Info_Xardas_EVENT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_BARRIER))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_EVENT_Info()
{
//	AI_Output(hero,self,"Info_Xardas_EVENT_15_01"); //Why not?
//	AI_Output(hero,self,"Info_Xardas_EVENT_15_01"); //Warum nicht?
	AI_Output(hero, self, "Info_Xardas_EVENT_15_01"); //Proč ne?
//	AI_Output(self,hero,"Info_Xardas_EVENT_14_02"); //I believe you could be... NO, to be really sure, you'll have to perform another task!
//	AI_Output(self,hero,"Info_Xardas_EVENT_14_02"); //Ich glaube du könntest der ... NEIN, um mir ganz sicher zu sein, musst du noch eine weitere Aufgabe lösen!
	AI_Output(self, hero, "Info_Xardas_EVENT_14_02"); //Věřím, že ty bys mohl... NE, abych se ujistil, musíš vykonat ještě jeden úkol!
//	AI_Output(hero,self,"Info_Xardas_EVENT_15_03"); //Which task?
//	AI_Output(hero,self,"Info_Xardas_EVENT_15_03"); //Was für eine Aufgabe?
	AI_Output(hero, self, "Info_Xardas_EVENT_15_03"); //Jaký úkol?
//	AI_Output(self,hero,"Info_Xardas_EVENT_14_04"); //Listen carefully: The Orcs have exiled one of their shamen from the town.
//	AI_Output(self,hero,"Info_Xardas_EVENT_14_04"); //Hör gut zu: Die Orks haben einen ihrer Schamanen aus ihrer Stadt verbannt.
	AI_Output(self, hero, "Info_Xardas_EVENT_14_04"); //Pozorně poslouchej. Skřeti vyhostili ze svého města jednoho šamana.
};

//---------------------------------------------------------------------
//	Info EVENTWHY
//---------------------------------------------------------------------
instance Info_Xardas_EVENTWHY(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_EVENTWHY_Condition;
	information = Info_Xardas_EVENTWHY_Info;
	important = 0;
	permanent = 0;
//	description = "Why have they exiled him?";
//	description = "Warum haben sie ihn verbannt?";
	description = "Proč ho vyhostili?";
};

func int Info_Xardas_EVENTWHY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_EVENT))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_EVENTWHY_Info()
{
//	AI_Output(hero,self,"Info_Xardas_EVENTWHY_15_01"); //Why have they exiled him?
//	AI_Output(hero,self,"Info_Xardas_EVENTWHY_15_01"); //Warum haben sie ihn verbannt?
	AI_Output(hero, self, "Info_Xardas_EVENTWHY_15_01"); //Proč ho vyhostili?
//	AI_Output(self,hero,"Info_Xardas_EVENTWHY_14_02"); //The dying Orc warrior was no longer able to answer that question when he was interrogated by one of my demons.
//	AI_Output(self,hero,"Info_Xardas_EVENTWHY_14_02"); //Das konnte der sterbende Ork-Krieger, der von einem meiner Dämonen befragt wurde, nicht mehr von sich geben.
	AI_Output(self, hero, "Info_Xardas_EVENTWHY_14_02"); //Na tuto otázku už nebyl umírající skřetí bojovník schopen odpovědět, když ho vyslýchal jeden z mých démonů.
};

//---------------------------------------------------------------------
//	Info EVENTHOW
//---------------------------------------------------------------------
instance Info_Xardas_EVENTHOW(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_EVENTHOW_Condition;
	information = Info_Xardas_EVENTHOW_Info;
	important = 0;
	permanent = 0;
//	description = "What does this Orc shaman have to do with my task?";
//	description = "Was hat dieser Ork Schamane mit meiner Aufgabe zu tun?";
	description = "Co má ten skřetí šaman společného s mým úkolem?";
};

func int Info_Xardas_EVENTHOW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_EVENT))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_EVENTHOW_Info()
{
//	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_01"); //What does this Orc shaman have to do with my task?
//	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_01"); //Was hat dieser Ork-Schamane mit meiner Aufgabe zu tun?
	AI_Output(hero, self, "Info_Xardas_EVENTHOW_15_01"); //Co má ten skřetí šaman společného s mým úkolem?
//	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_02"); //He'll tell you the rest of the story about the Sleeper.
//	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_02"); //Er wird dir den fehlenden Teil der Geschichte über den Schläfer erzählen.
	AI_Output(self, hero, "Info_Xardas_EVENTHOW_14_02"); //Řekne ti zbytek toho příběhu o Spáčovi.
//	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_03"); //An Orc shaman is hardly likely to be keen on talking to me!
//	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_03"); //Ein Ork-Schamane wird sich wohl kaum mit mir unterhalten!
	AI_Output(hero, self, "Info_Xardas_EVENTHOW_15_03"); //Nějaký skřetí šaman se mnou bude asi sotva mluvit!
//	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_04"); //Do you want me to help you or do you not?
//	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_04"); //Willst du nun meine Hilfe oder willst du sie nicht?
	AI_Output(self, hero, "Info_Xardas_EVENTHOW_14_04"); //Chceš, abych ti pomohl nebo ne?
//	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_05"); //Well, yes, but...
//	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_05"); //Doch schon, aber ...
	AI_Output(hero, self, "Info_Xardas_EVENTHOW_15_05"); //Ano, chci, ale...
//	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_06"); //Then never question my words again!
//	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_06"); //Dann stelle meine Worte nie wieder in Frage!
	AI_Output(self, hero, "Info_Xardas_EVENTHOW_14_06"); //Pak tedy už nikdy nezpochybňuj co ti říkám!
//	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_07"); //Find the shaman. He's not on good terms with his brothers in the Orc town, so he may listen to you before turning you into a living torch!
//	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_07"); //Suche den Schamanen. Er ist nicht gut auf seine Brüder in der Orkstadt zu sprechen, also wird er dir vielleicht zuhören, bevor er dich zu einer lebenden Fackel macht!
	AI_Output(self, hero, "Info_Xardas_EVENTHOW_14_07"); //Najdi toho šamana. Nepohodl se se svými bratry ve skřetím městě, takže tě možná vyslechne... Předtím, než z tebe udělá živou pochodeň!
//	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_08"); //Very comforting!
//	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_08"); //Sehr beruhigend!
	AI_Output(hero, self, "Info_Xardas_EVENTHOW_15_08"); //Pěkná představa!
};

//---------------------------------------------------------------------
//	Info EVENTWHERE
//---------------------------------------------------------------------
instance Info_Xardas_EVENTWHERE(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_EVENTWHERE_Condition;
	information = Info_Xardas_EVENTWHERE_Info;
	important = 0;
	permanent = 0;
//	description = "Where is this exiled shaman?";
//	description = "Wo hält sich dieser Verbannte auf?";
	description = "Kde je ten vyhoštěný šaman?";
};

func int Info_Xardas_EVENTWHERE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_EVENT))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_EVENTWHERE_Info()
{
//	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_01"); //Where is this exiled shaman?
//	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_01"); //Wo hält sich dieser Verbannte auf?
	AI_Output(hero, self, "Info_Xardas_EVENTWHERE_15_01"); //Kde je ten vyhoštěný šaman?
//	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_02"); //Go the old citadel in the east. You can't miss it, it's on top of a high mountain which can be seen from a distance.
//	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_02"); //Gehe zum alten Kastell östlich von hier. Es ist nicht zu übersehen, denn es steht auf dem Gipfel eines hohen Berges, der schon von weitem zu sehen ist.
	AI_Output(self, hero, "Info_Xardas_EVENTWHERE_14_02"); //Běž ke staré citadele. Nemůžeš ji minout, je na vrcholu hory, která je vidět už z dálky.
//	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_03"); //Can you just enter it?
//	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_03"); //Kann man es so einfach betreten?
	AI_Output(hero, self, "Info_Xardas_EVENTWHERE_15_03"); //Mohu do ní prostě vstoupit?
//	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_04"); //They call it the old citadel but there's hardly anything left of it other than the foundation walls. It's been a ruin for many decades.
//	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_04"); //Es wird zwar noch Altes Kastell genannt, aber genau genommen stehen da nur noch die Grundmauern. Es ist schon seit vielen Jahrzehnten eine Ruine.
	AI_Output(self, hero, "Info_Xardas_EVENTWHERE_14_04"); //Říkají jí stará citadela, ale zůstali po ní jen základové zdi. Je to zřícenina už mnoho desetiletí.
};

//---------------------------------------------------------------------
//	Info ACCEPT
//---------------------------------------------------------------------
instance Info_Xardas_ACCEPT(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_ACCEPT_Condition;
	information = Info_Xardas_ACCEPT_Info;
	important = 0;
	permanent = 0;
//	description = "I will get the answers from this shaman!";
//	description = "Ich werde mir die Antworten von diesem Schamanen holen!";
	description = "Dostanu od toho šamana odpovědi!";
};

func int Info_Xardas_ACCEPT_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Xardas_EVENTWHY))
	&& (Npc_KnowsInfo(hero, Info_Xardas_EVENTHOW))
	&& (Npc_KnowsInfo(hero, Info_Xardas_EVENTWHERE)))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_ACCEPT_Info()
{
//	AI_Output(hero,self,"Info_Xardas_ACCEPT_15_01"); //I will get the answers from this shaman!
//	AI_Output(hero,self,"Info_Xardas_ACCEPT_15_01"); //Ich werde mir die Antworten von diesem Schamanen holen!
	AI_Output(hero, self, "Info_Xardas_ACCEPT_15_01"); //Dostanu od toho šamana odpovědi!
//	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_02"); //My servant has already given you a teleportation rune for the pentagram one floor below.
//	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_02"); //Mein Diener hat dir ja bereits eine Teleportations-Rune für das Pentagramm einen Stock tiefer gegeben.
	AI_Output(self, hero, "Info_Xardas_ACCEPT_14_02"); //Můj služebník ti už předal teleportační runu na pentagram o patro níže.
//	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_03"); //That will make it easier for you to get back here later.
//	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_03"); //Damit sollte es kein Problem für dich sein, wieder hierher zurück zu kehren.
	AI_Output(self, hero, "Info_Xardas_ACCEPT_14_03"); //Takže by ti nemělo dělat problém se sem vrátit.

	B_Story_CordsPost(); // Falls Spieler Gorn am Wassermagier-Pentragramm nicht angesprochen hat!
	B_Story_FindOrcShaman();

	AI_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
SCROLLS UND RUNEN VERKAUFEN
------------------------------------------------------------------------ */

instance Kdf_404_Xardas_SELLMAGICSTUFF(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information = Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important = 0;
	permanent = 1;
	trade = 1;
//	description = "I'm seeking magic knowledge";
//	description = "Ich suche magisches Wissen";
	description = "Hledám magické vědění.";
};

func int Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return 1;
	};

	return 0;
};

func void Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
//	AI_Output(other,self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //I'm seeking magic knowledge
//	AI_Output(other,self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Ich suche magisches Wissen.
	AI_Output(other, self, "Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Hledám magické vědění.
};

//---------------------------------------------------------------------
//	Info RETURN
//---------------------------------------------------------------------
instance Info_Xardas_RETURN(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_RETURN_Condition;
	information = Info_Xardas_RETURN_Info;
	important = 0;
	permanent = 0;
//	description = "I have the answers from the Orc shaman!";
//	description = "Ich habe mir die Antworten vom Ork-Schamanen geholt!";
	description = "Mám odpovědi od skřetího šamana!";
};

func int Info_Xardas_RETURN_Condition()
{
	if ((UrShak_SpokeOfUluMulu)
	&& (!EnteredTemple))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_RETURN_Info()
{
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_01"); //I have the answers from the Orc shaman!
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_01"); //Ich habe mir die Antworten vom Ork-Schamanen geholt!
	AI_Output(hero, self, "Info_Xardas_RETURN_15_01"); //Mám odpovědi od skřetího šamana!
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_02"); //Well, then report!
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_02"); //Gut, dann berichte!
	AI_Output(self, hero, "Info_Xardas_RETURN_14_02"); //Výborně, tak povídej!
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_03"); //The five Orc shamans that invoked the Sleeper built him an underground temple, its entrance is in the Orc town.
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_03"); //Die fünf Ork-Schamanen, die den Schläfer riefen, erbauten ihm einen unterirdischen Tempel, dessen Zugang in der Ork-Stadt liegt.
	AI_Output(hero, self, "Info_Xardas_RETURN_15_03"); //Pět skřetích šamanů, kteří vyvolali Spáče, mu vystavěli podzemní chrám, jehož vstup leží ve skřetím městě.
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_04"); //That's right!
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_04"); //Das ist richtig!
	AI_Output(self, hero, "Info_Xardas_RETURN_14_04"); //To je pravda!
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_05"); //Ungrateful as he was, he tore out their hearts and condemned them and the workers to an eternal existence as undead creatures!
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_05"); //Undankbarerweise entriss er ihnen ihre Herzen und verfluchte sie und die Arbeiter zu ewigem Untoten-Dasein!
	AI_Output(hero, self, "Info_Xardas_RETURN_15_05"); //Protože byl nevděčný, vytrhl jim srdce a odsoudil je i všechny dělníky k věčnému blouznění jako nesmrtelné stvůry!
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_06"); //Very good, very good!
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_06"); //Sehr gut, sehr gut!
	AI_Output(self, hero, "Info_Xardas_RETURN_14_06"); //Velmi dobře, velmi dobře!
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_07"); //The Orcs locked the temple and started making sacrifices to appease the demon!
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_07"); //Die Orks verschlossen den Tempel und bringen ihm seitdem Opfer, um ihn zu besänftigen!
	AI_Output(hero, self, "Info_Xardas_RETURN_15_07"); //Skřeti zavřeli chrám a začali přinášet oběti, aby démona usmířili!
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_08"); //Have you found a way to enter the temple?
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_08"); //Hast du einen Weg gefunden, wie du in den Tempel gelangst?
	AI_Output(self, hero, "Info_Xardas_RETURN_14_08"); //Našel jsi způsob, jak se dostat do chrámu?
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_09"); //Yes, there's an Orc who...
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_09"); //Ja, es gibt da einen Ork, der ...
	AI_Output(hero, self, "Info_Xardas_RETURN_15_09"); //Ano, je jeden skřet, který...
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_10"); //No details! Go to the underground temple! There you'll find the only way to destroy the Barrier!
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_10"); //Keine Einzelheiten! Begib dich zum unterirdischen Tempel! Dort wirst du den einzigen Weg finden, die Barriere zu zerstören!
	AI_Output(self, hero, "Info_Xardas_RETURN_14_10"); //Bez těch podrobností! Jdi do podzemního chrámu! Tam najdeš jediný způsob, jak Bariéru zničit!
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_11"); //I don't understand!
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_11"); //Ich verstehe nicht!
	AI_Output(hero, self, "Info_Xardas_RETURN_15_11"); //Nerozumím!
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_12"); //Didn't you call on me to help with the destruction of the Barrier?
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_12"); //War es nicht die Zerstörung der Barriere, weswegen du mich aufgesucht hast?
	AI_Output(self, hero, "Info_Xardas_RETURN_14_12"); //Nebylo snad zničení Bariéry ten důvod, proč jsi mě vyhledal?
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_13"); //That's right, but...
//	AI_Output(hero,self,"Info_Xardas_RETURN_15_13"); //Richtig, aber ...
	AI_Output(hero, self, "Info_Xardas_RETURN_15_13"); //To je pravda, ale...
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_14"); //THEN GO! A lot of time has already been wasted! Go into the underground temple to find the answer!
//	AI_Output(self,hero,"Info_Xardas_RETURN_14_14"); //DANN GEH! Es ist schon genug Zeit verstrichen! Geh und such die Antwort im unterirdischen Tempel!
	AI_Output(self, hero, "Info_Xardas_RETURN_14_14"); //PAK TEDY BĚŽ. Už se promrhalo spoustu času! Jdi do podzemního chrámu a najdi tam odpověď!

	B_Story_ReturnedFromUrShak();
};

//#####################################################################
//##
//##
//## KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info FOUNDTEMPLE
//---------------------------------------------------------------------
instance Info_Xardas_FOUNDTEMPLE(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_FOUNDTEMPLE_Condition;
	information = Info_Xardas_FOUNDTEMPLE_Info;
	important = 0;
	permanent = 0;
//	description = "I have found a way into the underground temple!";
//	description = "Ich habe einen Weg in den unterirdischen Tempel gefunden!";
	description = "Našel jsem cestu do podzemního chrámu!";
};

func int Info_Xardas_FOUNDTEMPLE_Condition()
{
	if (EnteredTemple)
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_FOUNDTEMPLE_Info()
{
//	AI_Output(other,self,"Info_Xardas_FOUNDTEMPLE_15_01"); //I have found a way into the underground temple!
//	AI_Output(other,self,"Info_Xardas_FOUNDTEMPLE_15_01"); //Ich habe einen Weg in den unterirdischen Tempel gefunden!
	AI_Output(other, self, "Info_Xardas_FOUNDTEMPLE_15_01"); //Našel jsem cestu do podzemního chrámu!
//	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_02"); //YOU HAVE... That's remarkable!
//	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_02"); //DU HAST ... DU ... Bemerkenswert!
	AI_Output(self, other, "Info_Xardas_FOUNDTEMPLE_14_02"); //NAŠEL... To je pozoruhodné!
//	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_03"); //You have become very powerful! Stronger than anybody else inside the Barrier.
//	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_03"); //Du bist sehr stark geworden! Stärker als jeder andere innerhalb der Barriere.
	AI_Output(self, other, "Info_Xardas_FOUNDTEMPLE_14_03"); //Stal ses velmi silným! Silnější než kdokoliv jiný uvnitř Bariéry.
//	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Maybe you really are the man the Orcish prophecies told of!
//	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Vielleicht bist du doch derjenige, von dem die alten orkischen Prophezeiungen sprechen!
	AI_Output(self, other, "Info_Xardas_FOUNDTEMPLE_14_04"); //Možná jsi doopravdy muž ze skřetího proroctví!
};

//---------------------------------------------------------------------
//	Info PROPHECY
//---------------------------------------------------------------------
instance Info_Xardas_PROPHECY(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_PROPHECY_Condition;
	information = Info_Xardas_PROPHECY_Info;
	important = 0;
	permanent = 0;
//	description = "Prophecies? What prophecies?";
//	description = "Prophezeiungen? Welche Prophezeiungen?";
	description = "Proroctví? Jaké proroctví?";
};

func int Info_Xardas_PROPHECY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_FOUNDTEMPLE))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_PROPHECY_Info()
{
//	AI_Output(other,self,"Info_Xardas_PROPHECY_15_01"); //Prophecies? What prophecies?
//	AI_Output(other,self,"Info_Xardas_PROPHECY_15_01"); //Prophezeiungen? Welche Prophezeiungen?
	AI_Output(other, self, "Info_Xardas_PROPHECY_15_01"); //Proroctví? Jaké proroctví?
//	AI_Output(self,other,"Info_Xardas_PROPHECY_14_02"); //Ancient Orcish documents written shortly after the sealing of the underground temple mention a 'Holy Foe'.
//	AI_Output(self,other,"Info_Xardas_PROPHECY_14_02"); //Uralte orkische Schriften aus der Zeit kurz nach der Versiegelung des unterirdischen Tempels sprechen von einem 'Heiligen Feind'.
	AI_Output(self, other, "Info_Xardas_PROPHECY_14_02"); //Prastaré skřetí dokumenty napsané krátce před zapečetěním podzemního chrámu se zmiňovaly o 'Svatém nepříteli'.
//	AI_Output(other,self,"Info_Xardas_PROPHECY_15_03"); //A holy foe?
//	AI_Output(other,self,"Info_Xardas_PROPHECY_15_03"); //Ein Heiliger Feind?
	AI_Output(other, self, "Info_Xardas_PROPHECY_15_03"); //O Svatém nepříteli?
//	AI_Output(self,other,"Info_Xardas_PROPHECY_14_04"); //Someone who shall come to drive the SLEEPER from our world forever!
//	AI_Output(self,other,"Info_Xardas_PROPHECY_14_04"); //Einer, der kommen wird, um den SCHLÄFER für immer aus unserer Welt zu verbannen!
	AI_Output(self, other, "Info_Xardas_PROPHECY_14_04"); //Někdo, kdo provždy vyžene SPÁČE z našeho světa!
//	AI_Output(other,self,"Info_Xardas_PROPHECY_15_05"); //I'm supposed to be the one mentioned in the ancient prophecies??? You must be wrong, surely!
//	AI_Output(other,self,"Info_Xardas_PROPHECY_15_05"); //Ich soll der Gegenstand einer uralten Prophezeiung sein??? Du musst dich irren!
	AI_Output(other, self, "Info_Xardas_PROPHECY_15_05"); //A já mám být tím, kdo byl v tom starém proroctví zmíněn??? Musíš se mýlit, určitě!
//	AI_Output(self,other,"Info_Xardas_PROPHECY_14_06"); //Maybe... Maybe not!
//	AI_Output(self,other,"Info_Xardas_PROPHECY_14_06"); //Vielleicht ... aber vielleicht auch nicht!
	AI_Output(self, other, "Info_Xardas_PROPHECY_14_06"); //Možná... Ale možná také ne!
};

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance Info_Xardas_LOADSWORD(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_LOADSWORD_Condition;
	information = Info_Xardas_LOADSWORD_Info;
	important = 0;
	permanent = 0;
//	description = "I've found this strange sword.";
//	description = "Ich habe dieses seltsame Schwert hier gefunden.";
	description = "Našel jsem zvláštní meč.";
};

func int Info_Xardas_LOADSWORD_Condition()
{
	if (Npc_HasItems(hero, Mythrilklinge))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_LOADSWORD_Info()
{
//	AI_Output(other,self,"Info_Xardas_LOADSWORD_15_01"); //I've found this strange sword.
//	AI_Output(other,self,"Info_Xardas_LOADSWORD_15_01"); //Ich habe dieses seltsame Schwert hier gefunden.
	AI_Output(other, self, "Info_Xardas_LOADSWORD_15_01"); //Našel jsem zvláštní meč.
//	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_02"); //Show it to me.
//	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_02"); //Zeig mal her.
	AI_Output(self, other, "Info_Xardas_LOADSWORD_14_02"); //Ukaž mi ho.

	CreateInvItem(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self, "T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);

//	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_03"); //That's interesting... It has 'URIZIEL' written on it.
//	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_03"); //Interessant ... hier steht 'URIZIEL'.
	AI_Output(self, other, "Info_Xardas_LOADSWORD_14_03"); //To je zajímavé... Je na něm napsáno 'URIZIEL'.
//	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_04"); //I've heard of this sword. It's a weapon from the olden days, when the human race was still young.
//	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_04"); //Ich habe schon von diesem Schwert gehört, es ist eine Waffe aus alten Tagen, als die Menschheit noch jung war.
	AI_Output(self, other, "Info_Xardas_LOADSWORD_14_04"); //Už jsem o tom meči slyšel. Je to zbraň z dávných dob, kdy bylo lidstvo ještě mladé.
//	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_05"); //The weapon was forged from an unknown material. And there's nothing written about who created it!
//	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_05"); //Die Waffe ist aus einem völlig unbekannten Material geschmiedet. Auch über den Erschaffer steht nichts geschrieben!
	AI_Output(self, other, "Info_Xardas_LOADSWORD_14_05"); //TA zbraň byla ukována z neznámého materiálu. Neexistují ani záznamy o tom, kdo ji vykoval!
//	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_06"); //This blade was said to possess unbelievable powers, but I don't notice any magical aura!
//	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_06"); //Angeblich soll diese Klinge unglaubliche Kräfte besessen haben, aber ich kann keinerlei magische Aura feststellen!
	AI_Output(self, other, "Info_Xardas_LOADSWORD_14_06"); //Čepel má být údajně obdařena neuvěřitelnou mocí, ale necítím žádnou magickou auru!

	Npc_RemoveInvItem(hero, Mythrilklinge);
	CreateInvItem(hero, Mythrilklinge01);
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance Info_Xardas_LOADSWORD01(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_LOADSWORD01_Condition;
	information = Info_Xardas_LOADSWORD01_Info;
	important = 0;
	permanent = 0;
//	description = "URIZIEL possessed unbelievable powers?";
//	description = "URIZIEL besaß unglaubliche Kräfte?";
	description = "URIZIEL je obdařen neuvěřitelnou mocí?";
};

func int Info_Xardas_LOADSWORD01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_LOADSWORD))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem(self, Mythrilklinge01);

//	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL possessed unbelievable powers?
//	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL besaß unglaubliche Kräfte?
	AI_Output(other, self, "Info_Xardas_LOADSWORD01_15_01"); //URIZIEL je obdařen neuvěřitelnou mocí?
//	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_02"); //It was written that the owner of the weapon was able to pierce the strongest armor and to overcome even the most powerful of protection spells.
//	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_02"); //Es steht geschrieben, dass der Träger dieser Waffe die stärksten Panzerungen durchbohren und die mächtigsten Schutzzauber überwinden kann.
	AI_Output(self, other, "Info_Xardas_LOADSWORD01_14_02"); //Stojí psáno, že nositel této zbraně dokázal prorazit i to nejsilnější brnění a zdolat i to nejmocnější ochranné kouzlo.
//	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_03"); //How could the Orcs get this powerful weapon into their hands?
//	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_03"); //Wie konnte diese mächtige Waffe in den Besitz der Orks gelangen?
	AI_Output(other, self, "Info_Xardas_LOADSWORD01_15_03"); //Jak se mohla tato mocná zbraň skřetům dostat do rukou?
//	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_04"); //It's claimed that the Orcs took it from a powerful warlord. They didn't know how to use it, but they did hide it!
//	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_04"); //Es heißt, dass die Orks dieses Schwert damals einem mächtigen Feldherren der Menschen geraubt hatten. Sie konnten es zwar nicht benutzen, aber sie konnten es gut verstecken!
	AI_Output(self, other, "Info_Xardas_LOADSWORD01_14_04"); //Říká se, že ji skřeti vzali jednomu mocnému lidskému vojevůdci. Nedokázali ji použít, proto ji ukryli!
//	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_05"); //But they didn't hide it well enough!
//	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_05"); //Nicht gut genug!
	AI_Output(other, self, "Info_Xardas_LOADSWORD01_15_05"); //Neukryli ji ale dostatečně dobře!
};

//---------------------------------------------------------------------
//	Info LOADSWORD02
//---------------------------------------------------------------------
instance Info_Xardas_LOADSWORD02(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_LOADSWORD02_Condition;
	information = Info_Xardas_LOADSWORD02_Info;
	important = 0;
	permanent = 0;
//	description = "Is it possible to restore the former powers of the weapon?";
//	description = "Kann man die damaligen Kräfte der Waffe wiederherstellen?";
	description = "Je možné obnovit bývalou moc této zbraně?";
};

func int Info_Xardas_LOADSWORD02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_LOADSWORD01))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_LOADSWORD02_Info()
{
//	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_01"); //Is it possible to restore the former powers of the weapon?
//	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_01"); //Kann man die damaligen Kräfte der Waffe wiederherstellen?
	AI_Output(other, self, "Info_Xardas_LOADSWORD02_15_01"); //Je možné obnovit bývalou moc této zbraně?
//	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_02"); //You'd need a very strong magical source of power for that purpose.
//	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_02"); //Dafür würdest du eine sehr starke magische Energiequelle benötigen.
	AI_Output(self, other, "Info_Xardas_LOADSWORD02_14_02"); //K tomu bys potřeboval velmi silný zdroj magické síly.
//	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_03"); //You mean strong enough to detonate the Magic Barrier with?
//	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_03"); //In etwa SO stark, dass man die magische Barriere damit sprengen könnte?
	AI_Output(other, self, "Info_Xardas_LOADSWORD02_15_03"); //Myslíš TAK silný, aby prorazil magickou Bariéru?
//	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_04"); //About that strong...
//	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_04"); //In etwa ...
	AI_Output(self, other, "Info_Xardas_LOADSWORD02_14_04"); //Asi tak silný...
//	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_05"); //Besides, you'll need a very special magic formula in order to transfer the power.
//	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_05"); //Außerdem wirst du eine sehr spezielle Zauberformel benötigen, die den Energietransfer vollbringen kann.
	AI_Output(self, other, "Info_Xardas_LOADSWORD02_14_05"); //Mimo to bys potřeboval zvláštní magickou formuli, která by uskutečnila přenos síly.
//	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_06"); //Give me some time and I'll create the magic formula.
//	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_06"); //Gib mir ein wenig Zeit und ich kann dir die magische Formel herstellen.
	AI_Output(self, other, "Info_Xardas_LOADSWORD02_14_06"); //Dej mi trochu času a já tu magickou formuli připravím.

	B_Story_ShowedUrizielToXardas();
};

//---------------------------------------------------------------------
//	Info BETTERARMOR
//---------------------------------------------------------------------
instance Info_Xardas_BETTERARMOR(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_BETTERARMOR_Condition;
	information = Info_Xardas_BETTERARMOR_Info;
	important = 0;
	permanent = 0;
//	description = "Meanwhile, I'll be hunting around for a better armor!";
//	description = "Ich werde mich in der Zwischenzeit nach einer besseren Rüstung umsehen!";
	description = "Já se zatím podívám po nějaké lepší zbroji!";
};

func int Info_Xardas_BETTERARMOR_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_LOADSWORD02))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_BETTERARMOR_Info()
{
//	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_01"); //Meanwhile, I'll be hunting around for better armor!
//	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_01"); //Ich werde mich in der Zwischenzeit nach einer besseren Rüstung umsehen!
	AI_Output(other, self, "Info_Xardas_BETTERARMOR_15_01"); //Já se zatím podívám po nějaké lepší zbroji!

	var C_ITEM armor; armor = Npc_GetEquippedArmor(hero);
	var int armorInstance; armorinstance = Hlp_GetInstanceID(armor);
	if (armorinstance == CRW_ARMOR_H)
	{
//		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_02"); //These patchwork minecrawler plates have been pierced too often in the underground temple!
//		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_02"); //Die paar zusammengeflickten Minecrawler-Platten haben im unterirdischen Tempel einfach zu viel Hiebe durchgelassen!
		AI_Output(other, self, "Info_Xardas_BETTERARMOR_15_02"); //Těchhle pár sešitých plátů důlních červů bylo v podzemním chrámu mnohokrát proraženo!
	}
	else if ((armorinstance == KDW_ARMOR_H) || (armorinstance == KDW_ARMOR_L))
	{
//		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_03"); //These blue rags didn't protect me well enough in the underground temple!
//		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_03"); //Die paar blauen Stofflaken hier haben mich im unterirdischen Tempel nicht ausreichend geschützt!
		AI_Output(other, self, "Info_Xardas_BETTERARMOR_15_03"); //Tento pár modrých prostěradel mě v podzemním chrámu dostatečně neochránilo! #NEEDS_ATTENTION (v němčině tam jsou něco jako prostěradla, možná to zní víc "sassy" než jen hadry)
	}
	else
	{
//		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_04"); //The undead have made massive dents in my armor!
//		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_04"); //Die Untoten im Tempel haben gewaltige Beulen in meinen Panzer gehauen!
		AI_Output(other, self, "Info_Xardas_BETTERARMOR_15_04"); //Nemrtví v chrámu zanechali v mé zbroji pořádné díry!
	};

//	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_05"); //You should go to my old tower.
//	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_05"); //Du solltest meinen alten Turm aufsuchen.
	AI_Output(self, other, "Info_Xardas_BETTERARMOR_14_05"); //Měl bys jít do mé staré věže.
//	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_06"); //Your old tower?
//	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_06"); //Deinen alten Turm?
	AI_Output(other, self, "Info_Xardas_BETTERARMOR_15_06"); //Tvé staré věže?
//	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_07"); //It sank below one of the eastern lakes during one of the earthquakes. The spires are still visible above the surface.
//	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_07"); //Er versank bei einem dieser Beben in einem See im Osten. Die Turmspitzen ragen noch immer aus dem Wasser heraus.
	AI_Output(self, other, "Info_Xardas_BETTERARMOR_14_07"); //Potopila se ve východním jezeru při jednom zemětřesení. Vrcholy jsou nad povrchem stále viditelné.
//	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_08"); //There are still some artefacts inside it. I never made any effort to salvage them.
//	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_08"); //Dort lagern noch einige Artefakte. Ich hatte mir nie die Mühe gemacht, sie zu bergen.
	AI_Output(self, other, "Info_Xardas_BETTERARMOR_14_08"); //Jsou tam stále uloženy nějaké artefakty. Nikdy jsem se je nesnažil dostat zpátky.
//	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_09"); //How do I get there?
//	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_09"); //Wie gelange ich hinein?
	AI_Output(other, self, "Info_Xardas_BETTERARMOR_15_09"); //Jak se tam dostanu?
//	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_10"); //I haven't been there since the earthquake, which means you'll have to find a way to enter it yourself.
//	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_10"); //Ich war nach dem Beben nicht mehr dort, du musst also selbst einen Weg hinein finden.
	AI_Output(self, other, "Info_Xardas_BETTERARMOR_14_10"); //Od toho zemětřesení jsem tam nebyl, takže si dovnitř budeš muset najít cestu sám.
//	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_11"); //But take this key. It opens a chest in which I used to store some particularly rare artefacts.
//	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_11"); //Aber nimm diesen Schlüssel. Er öffnet eine Truhe, in der ich besonders seltene Artefakte aufbewahrte.
	AI_Output(self, other, "Info_Xardas_BETTERARMOR_14_11"); //Ale vezmi si tento klíč. Odemyká truhlu, ve které jsem uchovával obzvláště vzácné artefakty.

	B_Story_ExploreSunkenTower();
};

//---------------------------------------------------------------------
//	Info OREARMOR
//---------------------------------------------------------------------
instance Info_Xardas_OREARMOR(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_OREARMOR_Condition;
	information = Info_Xardas_OREARMOR_Info;
	important = 1;
	permanent = 0;
};

func int Info_Xardas_OREARMOR_Condition()
{
	if ((Npc_HasItems(hero, ORE_ARMOR_M))
	|| (Npc_HasItems(hero, ORE_ARMOR_H)))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_OREARMOR_Info()
{
	var C_ITEM armor; armor = Npc_GetEquippedArmor(hero);
	var int armorInstance; armorinstance = Hlp_GetInstanceID(armor);
	if ((armorinstance == ORE_ARMOR_M)
	|| (armorinstance == ORE_ARMOR_H))
	{
//		AI_Output(self,other,"Info_Xardas_OREARMOR_14_01"); //I see! You're wearing the ore armor.
//		AI_Output(self,other,"Info_Xardas_OREARMOR_14_01"); //Ahh, wie ich sehe trägst du die Erzrüstung.
		AI_Output(self, other, "Info_Xardas_OREARMOR_14_01"); //Áh, jak vidím, nosíš rudnou zbroj.
	}
	else
	{
//		AI_Output(self,other,"Info_Xardas_OREARMOR_14_02"); //As I can see, you've found the ore armor.
//		AI_Output(self,other,"Info_Xardas_OREARMOR_14_02"); //Ahh, wie ich sehe, hast du die Erzrüstung gefunden.
		AI_Output(self, other, "Info_Xardas_OREARMOR_14_02"); //Áh, jak vidím, našel jsi rudnou zbroj.
	};

//	AI_Output(other,self,"Info_Xardas_OREARMOR_15_03"); //I found it in one of those old chests in the sunken tower.
//	AI_Output(other,self,"Info_Xardas_OREARMOR_15_03"); //Ich habe sie in einer der Kisten im versunkenen Turm gefunden.
	AI_Output(other, self, "Info_Xardas_OREARMOR_15_03"); //Našel jsem ji v jedné z těch truhel v potopené věži.
//	AI_Output(self,other,"Info_Xardas_OREARMOR_14_04"); //It belonged to the general who wielded URIZIEL in the battle against the Orcs.
//	AI_Output(self,other,"Info_Xardas_OREARMOR_14_04"); //Sie gehörte dem Feldherren der einst URIZIEL in die Schlacht gegen die Orks führte.
	AI_Output(self, other, "Info_Xardas_OREARMOR_14_04"); //Patřila vojevůdci, který v bitvě proti skřetům používal URIZIEL.
//	AI_Output(other,self,"Info_Xardas_OREARMOR_15_05"); //I hope it'll bring me more luck than it did him!
//	AI_Output(other,self,"Info_Xardas_OREARMOR_15_05"); //Ich hoffe, sie bringt mir mehr Glück als ihm!
	AI_Output(other, self, "Info_Xardas_OREARMOR_15_05"); //Doufám, že mi přinese víc štěstí než jemu!
};

//---------------------------------------------------------------------
//	Info FORMULA
//---------------------------------------------------------------------
instance Info_Xardas_FORMULA(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_FORMULA_Condition;
	information = Info_Xardas_FORMULA_Info;
	important = 0;
	permanent = 0;
//	description = "Have you completed the magic formula to reactivate URIZIEL?";
//	description = "Hast du die magische Formel für das Aufladen von URIZIEL fertiggestellt?";
	description = "Máš hotovou tu formuli na nabití URIZIELU?";
};

func int Info_Xardas_FORMULA_Condition()
{
	if ((Npc_HasItems(hero, ORE_ARMOR_M))
	|| (Npc_HasItems(hero, ORE_ARMOR_H))
	|| (Npc_HasItems(hero, ItArRuneTeleport1)))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_FORMULA_Info()
{
//	AI_Output(other,self,"Info_Xardas_FORMULA_15_01"); //Have you completed the magic formula to reactivate URIZIEL?
//	AI_Output(other,self,"Info_Xardas_FORMULA_15_01"); //Hast du die magische Formel für das Aufladen von URIZIEL fertig gestellt?
	AI_Output(other, self, "Info_Xardas_FORMULA_15_01"); //Máš hotovou tu formuli na nabití URIZIELU?
//	AI_Output(self,other,"Info_Xardas_FORMULA_14_02"); //It's done. But you won't be able to use it by yourself.
//	AI_Output(self,other,"Info_Xardas_FORMULA_14_02"); //Sie ist vollendet. Aber du wirst sie nicht alleine benutzen können.
	AI_Output(self, other, "Info_Xardas_FORMULA_14_02"); //Je hotová. Ale nebudeš ji moci použít sám.
//	AI_Output(other,self,"Info_Xardas_FORMULA_15_03"); //Why not?
//	AI_Output(other,self,"Info_Xardas_FORMULA_15_03"); //Warum nicht?
	AI_Output(other, self, "Info_Xardas_FORMULA_15_03"); //Proč ne?
//	AI_Output(self,other,"Info_Xardas_FORMULA_14_04"); //It has to be spoken by a magician while you touch the power source with the sword.
//	AI_Output(self,other,"Info_Xardas_FORMULA_14_04"); //Sie muss von einem Magier gesprochen werden, während du das Schwert mit der Kraftquelle in Berührung bringst.
	AI_Output(self, other, "Info_Xardas_FORMULA_14_04"); //Musí být vyslovena nějakým mágem, zatímco ty se budeš dotýkat mečem zdroje síly.
//	AI_Output(other,self,"Info_Xardas_FORMULA_15_05"); //Then I'll have to look around for some support!
//	AI_Output(other,self,"Info_Xardas_FORMULA_15_05"); //Dann werde ich mich nach Unterstützung umschauen müssen!
	AI_Output(other, self, "Info_Xardas_FORMULA_15_05"); //Pak se budu muset porozhlédnout po nějaké pomoci!
//	AI_Output(self,other,"Info_Xardas_FORMULA_14_06"); //Take the formula and restore the sword's former power. You'll need it!
//	AI_Output(self,other,"Info_Xardas_FORMULA_14_06"); //Nimm die Formel an dich und gib der Waffe ihre alte Macht zurück. Du wirst sie brauchen!
	AI_Output(self, other, "Info_Xardas_FORMULA_14_06"); //Vezmi si tu formuli a obnov dřívější sílu meče. Budeš ji potřebovat!

	B_Story_LoadSword();
};

//---------------------------------------------------------------------
//	Info ALTRUNE
//---------------------------------------------------------------------
instance Info_Xardas_ALTRUNE(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_ALTRUNE_Condition;
	information = Info_Xardas_ALTRUNE_Info;
	important = 0;
	permanent = 0;
//	description = "Since I'm a magician, it'll be hard for me to wield URIZIEL!";
//	description = "Als Magier werde ich mich schwertun, URIZIEL wirksam zu führen!";
	description = "Protože jsem mág, bude pro mě těžké používat URIZIEL!";
};

func int Info_Xardas_ALTRUNE_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Xardas_FORMULA))
	&& ((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB)))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_ALTRUNE_Info()
{
//	AI_Output(other,self,"Info_Xardas_ALTRUNE_15_01"); //Since I'm a magician, it'll be hard for me to wield URIZIEL!
//	AI_Output(other,self,"Info_Xardas_ALTRUNE_15_01"); //Als Magier werde ich mich schwer tun, URIZIEL wirksam zu führen!
	AI_Output(other, self, "Info_Xardas_ALTRUNE_15_01"); //Protože jsem mág, bude pro mě těžké používat URIZIEL!
//	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_02"); //There is a solution...
//	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_02"); //Es gibt da einen Weg ...
	AI_Output(self, other, "Info_Xardas_ALTRUNE_14_02"); //Je tu jedno řešení...
//	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_03"); //But first you have to restore the blade's former powers! Then come back!
//	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_03"); //Aber zuerst musst du der Klinge ihre alten Kräfte wiedergeben! Kehre dann zurück!
	AI_Output(self, other, "Info_Xardas_ALTRUNE_14_03"); //Nejdřív ale musíš obnovit dřívější sílu ostří! Pak se vrať!
};

//---------------------------------------------------------------------
//	Info SWORDLOADED
//---------------------------------------------------------------------
instance Info_Xardas_SWORDLOADED(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_SWORDLOADED_Condition;
	information = Info_Xardas_SWORDLOADED_Info;
	important = 0;
	permanent = 0;
//	description = "I've reactivated URIZIEL!";
//	description = "Ich habe URIZIEL aufgeladen!";
	description = "Obnovil jsem sílu URIZIELU!";
};

func int Info_Xardas_SWORDLOADED_Condition()
{
	if (Npc_HasItems(hero, Mythrilklinge02))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_SWORDLOADED_Info()
{
//	AI_Output(other,self,"Info_Xardas_SWORDLOADED_15_01"); //I've reactivated URIZIEL!
//	AI_Output(other,self,"Info_Xardas_SWORDLOADED_15_01"); //Ich habe URIZIEL aufgeladen!
	AI_Output(other, self, "Info_Xardas_SWORDLOADED_15_01"); //Obnovil jsem sílu URIZIELU!
//	AI_Output(self,other,"Info_Xardas_SWORDLOADED_14_02"); //It's incredible, the sword has regained its former powers. Now you have a really powerful weapon!
//	AI_Output(self,other,"Info_Xardas_SWORDLOADED_14_02"); //Unglaublich, das Schwert hat seine alten Kräfte wiedergewonnen. Nun führst du eine wahrhaft mächtige Waffe!
	AI_Output(self, other, "Info_Xardas_SWORDLOADED_14_02"); //Neuvěřitelné, meč znovu získal svou původní sílu. Teď máš opravdu mocnou zbraň!

	Wld_InsertItem(ItArScrollTeleport4, "OW_ORC_SHAMAN_ROOM2"); //Unblutige Lösung für´s Ich-brauch-Orc-Statue-Massaker ***Björn***
};

//---------------------------------------------------------------------
//	Info MAKERUNE
//---------------------------------------------------------------------
instance Info_Xardas_MAKERUNE(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_MAKERUNE_Condition;
	information = Info_Xardas_MAKERUNE_Info;
	important = 0;
	permanent = 0;
//	description = "You said there might be a way to wield URIZIEL though I'm a magician!";
//	description = "Du erwähntest einen Weg, wie ich URIZIEL auch als Magier führen könnte!";
	description = "Zmínil jsi, že existuje způsob, jak URIZIEL ovládat, i když jsem mág?";
};

func int Info_Xardas_MAKERUNE_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Xardas_ALTRUNE))
	&& (Npc_KnowsInfo(hero, Info_Xardas_SWORDLOADED)))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_MAKERUNE_Info()
{
//	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_01"); //You said there might be a way for me to wield URIZIEL though I'm a magician?
//	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_01"); //Du erwähntest einen Weg, wie ich URIZIEL auch als Magier wirksam führen könnte!
	AI_Output(other, self, "Info_Xardas_MAKERUNE_15_01"); //Říkal jsi, že existuje nějaký způsob, jak URIZIEL ovládat, i když jsem mág?
//	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_02"); //Look closely at URIZIEL. You'll notice the big blue jewel in the blade.
//	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_02"); //Wenn du URIZIEL genau betrachtest, wird dir der große, blau schimmernde Edelstein in der Klinge sofort auffallen.
	AI_Output(self, other, "Info_Xardas_MAKERUNE_14_02"); //Pokud se na URIZIEL pořádně podíváš, všimneš si třpytivě modrého drahokamu zasazeného v čepeli.
//	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_03"); //It contains the magical powers of the blade.
//	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_03"); //Er ist das Gefäß für die magischen Kräfte der Klinge.
	AI_Output(self, other, "Info_Xardas_MAKERUNE_14_03"); //To v něm je uložena magická síla ostří.
//	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_04"); //if I remove the jewel, I'll be able to create a magic rune which contains the attributes of URIZIEL itself.
//	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_04"); //Wenn ich den Stein entferne, kann ich daraus eine Zauberrune herstellen, welche die Eigenschaften von URIZIEL selbst in sich trägt.
	AI_Output(self, other, "Info_Xardas_MAKERUNE_14_04"); //Když ten drahokam odstraním, budu z něj moci vytvořit kouzelnou runu, která ponese vlastnosti samotného URIZIELU.
//	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_05"); //A magic rune made from URIZIEL?
//	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_05"); //Eine Zauberrune aus URIZIEL?
	AI_Output(other, self, "Info_Xardas_MAKERUNE_15_05"); //Magická runa vytvořená z URIZIELU?
//	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_06"); //In battle, the rune will be as powerful as the sword!
//	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_06"); //Mit der Kraft der Rune wirst du deine Feinde ebenso besiegen wie mit der Kraft des Schwertes!
	AI_Output(self, other, "Info_Xardas_MAKERUNE_14_06"); //Se sílou této runy budeš moci porazit nepřátele stejně tak, jako kdybys používal celý meč!
//	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_07"); //But don't forget that only a Magician of the Sixth Circle will be able to control such a powerful magic rune!
//	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_07"); //Aber sei gewahr, dass nur ein Meister des sechsten Kreises der Magie eine solche machtvolle Zauberrune beherrschen kann!
	AI_Output(self, other, "Info_Xardas_MAKERUNE_14_07"); //Nezapomeň ale, že jedině mistr Šestého kruhu magie je schopen ovládat tak mocnou runu!
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance Info_Xardas_MAKERUNEDOIT(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_MAKERUNEDOIT_Condition;
	information = Info_Xardas_MAKERUNEDOIT_Info;
	important = 0;
	permanent = 1;
//	description = "Remove the jewel from URIZIEL!";
//	description = "Entferne den Stein aus URIZIEL!";
	description = "Odstraň z URIZIELU ten drahokam!";
};

func int Info_Xardas_MAKERUNEDOIT_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE))
	&& (Npc_HasItems(hero, Mythrilklinge02)))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_MAKERUNEDOIT_Info()
{
//	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Remove the jewel from URIZIEL!
//	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Entferne den Stein aus URIZIEL!
	AI_Output(other, self, "Info_Xardas_MAKERUNEDOIT_15_01"); //Odstraň z URIZIELU ten drahokam!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
//		AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_02"); //But you have not yet mastered the Sixth Circle of Magic!
//		AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Du beherrscht noch nicht den sechsten Kreis der Magie!
		AI_Output(self, other, "Info_Xardas_MAKERUNEDOIT_14_02"); //Ještě nevládneš Šestým magickým kruhem!
	};

//	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_03"); //This decision is final. Do you really want me to remove the jewel?
//	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Dieser Schritt ist endgültig. Soll ich den Stein wirklich aus der Klinge entfernen?
	AI_Output(self, other, "Info_Xardas_MAKERUNEDOIT_14_03"); //Tohle rozhodnutí je konečné. Mám ten drahokam opravdu z meče odstranit?

	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
//	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"YES, do it!", Info_Xardas_MAKERUNE_YES);
//	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"JA, tu es!", Info_Xardas_MAKERUNE_YES);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT, "ANO, udělej to!", Info_Xardas_MAKERUNE_YES);
//	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"NO, don't do it!", Info_Xardas_MAKERUNE_NO);
//	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"NEIN, lieber doch nicht!", Info_Xardas_MAKERUNE_NO);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT, "NE, nedělej to!", Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
//	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_04"); //YES, do it!
//	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_04"); //JA, tu es!
	AI_Output(other, self, "Info_Xardas_MAKERUNEDOIT_15_04"); //ANO, udělej to!
//	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Since it's what you want... Here, take the empty sword and the rune!
//	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Du hast es so gewollt. Hier, nimm das leere Schwert und die Rune!
	AI_Output(self, other, "Info_Xardas_MAKERUNEDOIT_14_05"); //Jak si přeješ. Tady, vezmi si prázdný meč a runu!

	Npc_RemoveInvItem(hero, Mythrilklinge02);
	CreateInvItems(self, UrizielRune, 2);
	B_GiveInvItems(self, hero, UrizielRune, 2); // Wegen Ausgabe "2 Items übergeben", wird direkt angeglichen
	Npc_RemoveInvItem(hero, UrizielRune);
	CreateInvItem(hero, Mythrilklinge03);
//	B_LogEntry(CH5_Uriziel,"Xardas removed the magic gem from the sword URIZIEL. The power of this blade now rests in a magic rune of incomparable powers.");
//	B_LogEntry(CH5_Uriziel,"Xardas entfernte den magischen Edelstein aus dem Schwert URIZIEL. Die Macht dieser Klinge schlummert nun in einer Zauberrune von unvergleichlicher Kraft.");
	B_LogEntry(CH5_Uriziel, "Xardas odstranil z URIZIELU kouzelný drahokam. Síla této čepele spočívá v kouzelné runě nesrovnatelné moci.");
	Log_SetTopicStatus(CH5_Uriziel, LOG_SUCCESS);
};

func void Info_Xardas_MAKERUNE_NO()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
//	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_06"); //NO, don't do it!
//	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_06"); //NEIN, lieber doch nicht!
	AI_Output(other, self, "Info_Xardas_MAKERUNEDOIT_15_06"); //NE, nedělej to!
//	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_07"); //As you wish. The blade shall keep its magic powers!
//	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_07"); //So sei es. Die Klinge behält ihre magischen Kräfte!
	AI_Output(self, other, "Info_Xardas_MAKERUNEDOIT_14_07"); //Budiž. Ostří si zachová magickou moc!
};

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance Info_Xardas_LOADSWORD09(C_INFO)
{
	npc = Kdf_404_Xardas;
	condition = Info_Xardas_LOADSWORD09_Condition;
	information = Info_Xardas_LOADSWORD09_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0);
//	description = B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0);
	description = B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6, 0);
};

func int Info_Xardas_LOADSWORD09_Condition()
{
	if ((EnteredTemple)
	&& (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return 1;
	};

	return 0;
};

func void Info_Xardas_LOADSWORD09_Info()
{
//	AI_Output(other,self,"Info_Xardas_LOADSWORD09_15_01"); //Can you teach me?
//	AI_Output(other,self,"Info_Xardas_LOADSWORD09_15_01"); //Kannst du mich unterrichten?
	AI_Output(other, self, "Info_Xardas_LOADSWORD09_15_01"); //Můžeš mě učit?

	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 5)
	{
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
//			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_02"); //I shall raise you into the Sixth Circle of Magic.
//			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_02"); //Ich werde dich in den sechsten der magischen Kreise aufnehmen.
			AI_Output(self, other, "Info_Xardas_LOADSWORD09_14_02"); //Zasvětím tě do Šestého kruhu magie.
//			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_03"); //Notice that only the most powerful magicians may join the Sixth Circle. It's reserved to those whose life is a sign.
//			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_03"); //Denn wisse, nur die mächtigsten Magier werden in den sechsten Kreis aufgenommen. Er ist denen vorbehalten, deren Leben ein Zeichen ist.
			AI_Output(self, other, "Info_Xardas_LOADSWORD09_14_03"); //Uvědom si, že jen ti nejmocnější mágové ovládají kouzla z Šestého kruhu. Je vyhrazen pro ty, jejichž životy jsou znameními.
//			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_04"); //Your sign is the unification of the elements.
//			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_04"); //Dein Zeichen ist die Verbindung der Elemente.
			AI_Output(self, other, "Info_Xardas_LOADSWORD09_14_04"); //Tvé znamení je sjednocení živlů.
//			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_05"); //The Sixth Circle enables you to use the magic of any rune.
//			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_05"); //Mit dem sechsten Kreis bist du in der Lage, die Magie sämtlicher Runen anzuwenden.
			AI_Output(self, other, "Info_Xardas_LOADSWORD09_14_05"); //Šestý kruh ti umožní používat všechny runy.
//			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_06"); //And don't forget: Do not claim the power, but serve it.
//			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_06"); //Und vergiss nie: Fordere nicht die Macht, sondern diene ihr.
			AI_Output(self, other, "Info_Xardas_LOADSWORD09_14_06"); //A nezapomeň: Nevyužívej svou moc, ale služ jí.

			CreateInvItem(hero, DMB_ARMOR_M); // SN: kann nicht mit B_GiveInvItem() übergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor(hero);

			//Fakeitem für Bildschirmausgabe
			CreateInvItem(self, ItAmArrow);
			B_GiveInvItems(self, hero, ItAmArrow, 1);
			Npc_RemoveInvItem(hero, ItAmArrow);

			hero.guild = GIL_DMB;
			Npc_SetTrueGuild(hero, GIL_DMB);
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
//		AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_07"); //Not yet. You have the skill, but you're not experienced enough. Let Saturas train you first, I shall instruct you afterwards.
//		AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_07"); //Noch nicht, du hast das Talent, aber es fehlt dir an Erfahrung. Lerne erst bei Saturas, dann werde ich dich unterweisen.
		AI_Output(self, other, "Info_Xardas_LOADSWORD09_14_07"); //Ještě ne, máš talent, ale nemáš ještě dost zkušeností. Nejdřív se uč u Saturase, potom tě budu vyučovat já.

		AI_StopProcessInfos(self);
	};
};
