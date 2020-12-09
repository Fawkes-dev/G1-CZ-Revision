//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance Info_OrcShaman_EXIT(C_INFO)
{
	npc = ORC_2200_Shaman;
	nr = 999;
	condition = Info_OrcShaman_EXIT_Condition;
	information = Info_OrcShaman_EXIT_Info;
	important = 0; 
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Info_OrcShaman_EXIT_Condition()
{
	return TRUE;
};

func void Info_OrcShaman_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//## KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info THX
//---------------------------------------------------------------------
instance Info_OrcShaman_THX(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_THX_Condition;
	information = Info_OrcShaman_THX_Info;
	important = 1;
	permanent = 0;
};

func int Info_OrcShaman_THX_Condition()
{ 
	if (Kapitel == 4)
	{
		return TRUE;
	};
};
func void Info_OrcShaman_THX_Info()
{
//	AI_Output(self,hero,"Info_OrcShaman_THX_17_01"); //Owe thanks, stranger.
//	AI_Output(self,hero,"Info_OrcShaman_THX_17_01"); //Dank schulden, Fremder.
	AI_Output(self,hero,"Info_OrcShaman_THX_17_01"); //Dlužit díky, cizinče.
//	AI_Output(self,hero,"Info_OrcShaman_THX_17_02"); //Bad Orcs want kill me.
//	AI_Output(self,hero,"Info_OrcShaman_THX_17_02"); //Böse Orks töten wollen mich.
	AI_Output(self,hero,"Info_OrcShaman_THX_17_02"); //Zlí skřeti mě chtějí zabít.
//	AI_Output(self,hero,"Info_OrcShaman_THX_17_03"); //Old brothers today enemies.
//	AI_Output(self,hero,"Info_OrcShaman_THX_17_03"); //Alte Brüder seien heute Feinde.
	AI_Output(self,hero,"Info_OrcShaman_THX_17_03"); //Staří bratři být dneska nepřátelé.
}; 

//---------------------------------------------------------------------
//	Info WHO
//---------------------------------------------------------------------
instance Info_OrcShaman_WHO(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_WHO_Condition;
	information = Info_OrcShaman_WHO_Info;
	important = 0;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};

func int Info_OrcShaman_WHO_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

func void Info_OrcShaman_WHO_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_WHO_15_01"); //Who are you?
//	AI_Output(hero,self,"Info_OrcShaman_WHO_15_01"); //Wer bist du?
	AI_Output(hero,self,"Info_OrcShaman_WHO_15_01"); //Kdo jsi?
//	AI_Output(self,hero,"Info_OrcShaman_WHO_17_02"); //Name Ur-Shak.
//	AI_Output(self,hero,"Info_OrcShaman_WHO_17_02"); //Name Ur-Shak.
	AI_Output(self,hero,"Info_OrcShaman_WHO_17_02"); //Já se jmenovat Ur-Shak.
//	AI_Output(self,hero,"Info_OrcShaman_WHO_17_03"); //Be son of the spirit. People call shaman.
//	AI_Output(self,hero,"Info_OrcShaman_WHO_17_03"); //Seien Sohn von Geist. Menschen nennen Schamane.
	AI_Output(self,hero,"Info_OrcShaman_WHO_17_03"); //Být synem ducha. Lidé tomu říkat šaman.
}; 

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance Info_OrcShaman_TONGUE(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_TONGUE_Condition;
	information = Info_OrcShaman_TONGUE_Info;
	important = 0;
	permanent = 0;
//	description = "How d'you know our language?";
//	description = "Woher kannst du unsere Sprache?";
	description = "Kde ses naučil náš jazyk?";
};

func int Info_OrcShaman_TONGUE_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

func void Info_OrcShaman_TONGUE_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_TONGUE_15_01"); //How do you know our language?
//	AI_Output(hero,self,"Info_OrcShaman_TONGUE_15_01"); //Woher kannst du unsere Sprache?
	AI_Output(hero,self,"Info_OrcShaman_TONGUE_15_01"); //Jak ses naučil náš jazyk?
//	AI_Output(self,hero,"Info_OrcShaman_TONGUE_17_02"); //Ur-Shak be slave of humans in mine.
//	AI_Output(self,hero,"Info_OrcShaman_TONGUE_17_02"); //Ur-Shak gewesen Sklave bei Menschen in Mine.
	AI_Output(self,hero,"Info_OrcShaman_TONGUE_17_02"); //Ur-Shak být otrok lidí v dole.
//	AI_Output(self,hero,"Info_OrcShaman_TONGUE_17_03"); //Run away. Happen many winters ago.
//	AI_Output(self,hero,"Info_OrcShaman_TONGUE_17_03"); //Seien gelaufen weg. Seien viiiele Winter her.
	AI_Output(self,hero,"Info_OrcShaman_TONGUE_17_03"); //Utéct pryč. To být už před mnoha zimami.
}; 

//---------------------------------------------------------------------
//	Info MINE
//---------------------------------------------------------------------
instance Info_OrcShaman_MINE(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_MINE_Condition;
	information = Info_OrcShaman_MINE_Info;
	important = 0;
	permanent = 0;
//	description = "You were a slave in the mine? Which mine?";
//	description = "Du warst Sklave in der Mine? In welcher Mine?";
	description = "Tys byl otrok v dole? Ve kterém dole?";
};

func int Info_OrcShaman_MINE_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_TONGUE))
	{
		return TRUE;
	};

};

func void Info_OrcShaman_MINE_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_MINE_15_01"); //You were a slave in the mine? Which mine?
//	AI_Output(hero,self,"Info_OrcShaman_MINE_15_01"); //Du warst Sklave in der Mine? In welcher Mine?
	AI_Output(hero,self,"Info_OrcShaman_MINE_15_01"); //Tys byl otrok v dole? Ve kterém dole?
//	AI_Output(self,hero,"Info_OrcShaman_MINE_17_02"); //Mine be under village in Hollow.
//	AI_Output(self,hero,"Info_OrcShaman_MINE_17_02"); //Mine gewesen mit Dorf in Kessel darüber.
	AI_Output(self,hero,"Info_OrcShaman_MINE_17_02"); //Důl být pod vesnicí v Kotlině.
}; 

//---------------------------------------------------------------------
//	Info WHY
//---------------------------------------------------------------------
instance Info_OrcShaman_WHY(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_WHY_Condition;
	information = Info_OrcShaman_WHY_Info;
	important = 0;
	permanent = 0;
//	description = "Why do your brothers fight you?";
//	description = "Warum kämpfen deine Stammesbrüder gegen dich?";
	description = "Proč jsou tvoji bratři proti tobě?";
};

func int Info_OrcShaman_WHY_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

func void Info_OrcShaman_WHY_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_WHY_15_01"); //Why do your brothers fight you?
//	AI_Output(hero,self,"Info_OrcShaman_WHY_15_01"); //Warum kämpfen deine Stammesbrüder gegen dich?
	AI_Output(hero,self,"Info_OrcShaman_WHY_15_01"); //Proč jsou tvoji bratři proti tobě?
//	AI_Output(self,hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak in disfavor.
//	AI_Output(self,hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak gefallen in Ungnade.
	AI_Output(self,hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak být v nepřízni.
//	AI_Output(self,hero,"Info_OrcShaman_WHY_17_03"); //Besmirch creed in KRUSHAK.
//	AI_Output(self,hero,"Info_OrcShaman_WHY_17_03"); //Haben beschmutzt Ehrfurcht vor KRUSHAK.
	AI_Output(self,hero,"Info_OrcShaman_WHY_17_03"); //Ztratit velkou úctu v KRUSHAKA.
//	AI_Output(self,hero,"Info_OrcShaman_WHY_17_04"); //Believe KRUSHAK bad demon.
//	AI_Output(self,hero,"Info_OrcShaman_WHY_17_04"); //Glauben, KRUSHAK seien böser Dämon.
	AI_Output(self,hero,"Info_OrcShaman_WHY_17_04"); //Věřit mi, KRUSHAK být zlý démon..
}; 

//---------------------------------------------------------------------
//	Info KRUSHAK
//---------------------------------------------------------------------
instance Info_OrcShaman_KRUSHAK(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_KRUSHAK_Condition;
	information = Info_OrcShaman_KRUSHAK_Info;
	important = 0;
	permanent = 0;
//	description = "What does KRUSHAK mean?";
//	description = "Was heißt KRUSHAK?";
	description = "Co znamená KRUSHAK?";
};

func int Info_OrcShaman_KRUSHAK_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_WHY))
	{
		return TRUE;
	};

};

func void Info_OrcShaman_KRUSHAK_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_KRUSHAK_15_01"); //What does KRUSHAK mean?
//	AI_Output(hero,self,"Info_OrcShaman_KRUSHAK_15_01"); //Was heißt KRUSHAK?
	AI_Output(hero,self,"Info_OrcShaman_KRUSHAK_15_01"); //Co to znamená KRUSHAK?
//	AI_Output(self,hero,"Info_OrcShaman_KRUSHAK_17_02"); //Humans call SLEEP.
//	AI_Output(self,hero,"Info_OrcShaman_KRUSHAK_17_02"); //Menschen sagen SCHLAFEN.
	AI_Output(self,hero,"Info_OrcShaman_KRUSHAK_17_02"); //Lidé tomu říkat SPÁT.
//	AI_Output(hero,self,"Info_OrcShaman_KRUSHAK_15_03"); //You mean 'Sleeper'?
//	AI_Output(hero,self,"Info_OrcShaman_KRUSHAK_15_03"); //Du meinst "Schläfer"?
	AI_Output(hero,self,"Info_OrcShaman_KRUSHAK_15_03"); //Myslíš 'Spáč'?
//	AI_Output(self,hero,"Info_OrcShaman_KRUSHAK_17_04"); //Yes, humans say SLEEPER!
//	AI_Output(self,hero,"Info_OrcShaman_KRUSHAK_17_04"); //Ja, Menschen sagen SCHLÄFER!
	AI_Output(self,hero,"Info_OrcShaman_KRUSHAK_17_04"); //Ano, lidé tomu říkat SPÁČ!
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance Info_OrcShaman_SLEEPER(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_SLEEPER_Condition;
	information = Info_OrcShaman_SLEEPER_Info;
	important = 0;
	permanent = 0;
//	description = "What do you know about the Sleeper?";
//	description = "Was weißt du über den Schläfer?";
	description = "Co víš o Spáčovi?";
};

func int Info_OrcShaman_SLEEPER_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_KRUSHAK))
	{
		return TRUE;
	};

};

func void Info_OrcShaman_SLEEPER_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_01"); //What do you know about the Sleeper?
//	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_01"); //Was weißt du über den Schläfer?
	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_01"); //Co víš o Spáčovi?
//	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_02"); //Be five brothers. Be many winters ago!
//	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_02"); //Fünf Brüder seien gewesen. Seien viiiiele Winter vorher!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_02"); //Být pět bratří. To být před mnoha zimami!
//	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_03"); //Be sons of spirit, like Ur-Shak!
//	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_03"); //Waren Söhne von Geist wie Ur-Shak!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_03"); //Být synové ducha, tak jako Ur-Shak!
//	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_04"); //You mean five shamen!
//	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_04"); //Fünf Schamanen also!
	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_04"); //Myslíš pět šamanů!
//	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_05"); //Call KRUSHAK!
//	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_05"); //Haben gerufen KRUSHAK!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_05"); //Vyrušovat KRUSHAK!
//	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_06"); //Want defeat clan of enemy!
//	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_06"); //Haben besiegen wollen Klan von Feind!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_06"); //Chtít porazit klan nepřátel!
//	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_07"); //Five brothers then build temple under earth for KRUSHAK!
//	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_07"); //Fünf Brüder von damals haben gebaut Tempel in Erde für KRUSHAK!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_07"); //Pět bratří potom postavit pro KRUSHAKA chrám pod zemí!
//	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_08"); //A subterranean temple for the Sleeper? That's what Xardas must have meant when he spoke about the entrance being 'in the Orc town'!
//	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_08"); //Ein unterirdischer Tempel zu Ehren des Schläfers! Das muss Xardas gemeint haben mit 'unter der Ork-Stadt'!
	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_08"); //Podzemní chrám pro Spáče! Ten, co měl na mysli Xardas, když mluvil o vstupu v 'skřetím městě'!
}; 

//---------------------------------------------------------------------
//	Info CURSE
//---------------------------------------------------------------------
instance Info_OrcShaman_CURSE(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_CURSE_Condition;
	information = Info_OrcShaman_CURSE_Info;
	important = 0;
	permanent = 0;
//	description = "What happened in the underground temple?";
//	description = "Was passierte dann im Tempel unter der Erde?";
	description = "Co se stalo v tom podzemním chrámu?";
};

func int Info_OrcShaman_CURSE_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_SLEEPER))
	{
		return TRUE;
	};

};

func void Info_OrcShaman_CURSE_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_CURSE_15_01"); //What happened in the underground temple?
//	AI_Output(hero,self,"Info_OrcShaman_CURSE_15_01"); //Was passierte dann im Tempel unter der Erde?
	AI_Output(hero,self,"Info_OrcShaman_CURSE_15_01"); //Co se stalo v tom podzemním chrámu?
//	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_02"); //Brothers then give heart to KRUSHAK.
//	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_02"); //Brüder von damals haben gegeben Herz für KRUSHAK.
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_02"); //Bratři potom dát srdce KRUSHAKOVI.
//	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_03"); //But KRUSHAK be bad. KRUSHAK curse all who build temple.
//	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_03"); //Aber KRUSHAK gewesen böse. KRUSHAK verfluchen alle, die bauen Tempel.
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_03"); //Ale KRUSHAK být zlý. KRUSHAK proklít všechny, co postavit chrám.
//	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_04"); //Brothers have no heart, be dead and live. Be both.
//	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_04"); //Brüder ohne Herz nun seien tot und lebendig. Seien beides.
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_04"); //Bratři nemít srdce, ale být mrtví a žít. Být obojí.
//	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK now have heart of brothers. Heart now be power for KRUSHAK.
//	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK haben Herz von Brüder. Herz seien Kraft für KRUSHAK.
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK mít teď srdce bratří. Srdce teď být KRUSHAKOVA síla.
//	AI_Output(hero,self,"Info_OrcShaman_CURSE_15_06"); //What happened to the workers who built the temple?
//	AI_Output(hero,self,"Info_OrcShaman_CURSE_15_06"); //Was passierte mit den Arbeitern, die den Tempel erbauten?
	AI_Output(hero,self,"Info_OrcShaman_CURSE_15_06"); //Co se stalo s dělníky, kteří vystavěli ten chrám?
//	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_07"); //KRUSHAK curse all. Workers too. Be all dead and live, both at same time.
//	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_07"); //KRUSHAK verfluchen alle. Auch die gewesen Arbeiter. Seien allen tot und lebendig.
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_07"); //KRUSHAK proklít všechny. I dělníky. Být všichni mrtví i žít. Obojí najednou.
}; 

//---------------------------------------------------------------------
//	Info OUTSIDE
//---------------------------------------------------------------------
instance Info_OrcShaman_OUTSIDE(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_OUTSIDE_Condition;
	information = Info_OrcShaman_OUTSIDE_Info;
	important = 0;
	permanent = 0;
//	description = "Didn't the Orcs at the surface do anything about it?";
//	description = "Haben die Orks an der Oberfläche nichts unternommen?";
	description = "A skřeti na povrchu s tím nic neudělali?";
};

func int Info_OrcShaman_OUTSIDE_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_CURSE))
	{
		return TRUE;
	};
};

func void Info_OrcShaman_OUTSIDE_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_OUTSIDE_15_01"); //Didn't the Orcs at the surface do anything about it?
//	AI_Output(hero,self,"Info_OrcShaman_OUTSIDE_15_01"); //Haben die Orks an der Oberfläche nichts unternommen?
	AI_Output(hero,self,"Info_OrcShaman_OUTSIDE_15_01"); //A skřeti na povrchu s tím nic neudělali?
//	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_02"); //They seal temple. Brothers today worship KRUSHAK.
//	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_02"); //Haben verschlossen Tempel. Brüder von heute anbeten KRUSHAK.
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_02"); //Uzavřít chrám. Bratři dnes uctívat KRUSHAK.
//	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK get sacrifice, so no become bad.
//	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK bekommen Opfer, damit nicht werden böse.
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK být vysvěcený, ne se stát zlý.
//	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak think sacrifice bad thing. Have said KRUSHAK bad.
//	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak Opfer finden falsch. Haben gesagt KRUSHAK böse.
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak si myslet, že vysvěcení být špatná věc. Muset říct, že KRUSHAK být zlý.
//	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_05"); //Brothers no want to hear. Brothers say Ur-Shak go. Brothers hit Ur-Shak.
//	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_05"); //Brüder wollen nicht hören. Brüder sagen Ur-Shak gehen. Brüder schlagen Ur-Shak.
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_05"); //Bratři o tom nechtít slyšet. Bratři říkat Ur-Shak odejít. Bratři vyhnat Ur-Shaka.
}; 

//---------------------------------------------------------------------
//	Info INTEMPLE
//---------------------------------------------------------------------
instance Info_OrcShaman_INTEMPLE(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_INTEMPLE_Condition;
	information = Info_OrcShaman_INTEMPLE_Info;
	important = 0;
	permanent = 0;
//	description = "I need to enter the underground temple! Can you take me there?";
//	description = "Ich muss in den unterirdischen Tempel!";
	description = "Potřebuju se dostat do toho podzemního chrámu. Můžeš mě tam dovést?";
};

func int Info_OrcShaman_INTEMPLE_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_OUTSIDE))
	{
		return TRUE;
	};
};

func void Info_OrcShaman_INTEMPLE_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_INTEMPLE_15_01"); //I need to enter the underground temple! Can you take me there?
//	AI_Output(hero,self,"Info_OrcShaman_INTEMPLE_15_01"); //Ich muss in den unterirdischen Tempel! Kannst du mich dorthin bringen?
	AI_Output(hero,self,"Info_OrcShaman_INTEMPLE_15_01"); //Potřebuju se dostat do toho podzemního chrámu. Můžeš mě tam dovést?
//	AI_Output(self,hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak say thanks to stranger. Stranger save Ur-Shak.
//	AI_Output(self,hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak sagen Dank zu Fremder. Fremder retten Ur-Shak.
	AI_Output(self,hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak říct cizinci díky. Cizinec zachránit Ur-Shaka.
//	AI_Output(self,hero,"Info_OrcShaman_INTEMPLE_17_03"); //But entry of temple be home. Ur-Shak home no can go.
//	AI_Output(self,hero,"Info_OrcShaman_INTEMPLE_17_03"); //Aber Eingang von Tempel in Heimat. Ur-Shak nicht können gehen Heimat.
	AI_Output(self,hero,"Info_OrcShaman_INTEMPLE_17_03"); //Ale vstup do chrámu být doma. Ur-Shak nesmět jít domů.
//	AI_Output(hero,self,"Info_OrcShaman_INTEMPLE_15_04"); //I see, you mean they won't let you go back into the Orc town?
//	AI_Output(hero,self,"Info_OrcShaman_INTEMPLE_15_04"); //Ur-Shak glauben
	AI_Output(hero,self,"Info_OrcShaman_INTEMPLE_15_04"); //Vím, myslíš tím, že by tě nepustili zpátky do skřetího města.
};

//---------------------------------------------------------------------
//	Info MAP
//---------------------------------------------------------------------
instance Info_OrcShaman_MAP(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_MAP_Condition;
	information = Info_OrcShaman_MAP_Info;
	important = 0;
	permanent = 0;
//	description = "Can you show me where the Orc town is on my map?";
//	description = "Kannst du mir sagen, wo auf meiner Karte hier die Orkstadt ist?";
	description = "Můžeš mi ukázat na mapě, kde to skřetí město leží?";
};

func int Info_OrcShaman_MAP_Condition()
{ 
	if Npc_KnowsInfo(hero,Info_OrcShaman_INTEMPLE)
	&& Npc_HasItems(hero,ItWrWorldmap)
	{
		return TRUE;
	};

};

func void Info_OrcShaman_MAP_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_MAP_15_01"); //Can you show me where the Orc town is on my map?
//	AI_Output(hero,self,"Info_OrcShaman_MAP_15_01"); //Kannst du mir sagen, wo auf meiner Karte hier die Orkstadt ist?
	AI_Output(hero,self,"Info_OrcShaman_MAP_15_01"); //Můžeš mi ukázat na mapě, kde to skřetí město leží?
//	AI_Output(self,hero,"Info_OrcShaman_MAP_17_02"); //Home of Ur-Shak be where map empty.
//	AI_Output(self,hero,"Info_OrcShaman_MAP_17_02"); //Heimat von Ur-Shak seien, wo Karte nicht bemalt.
	AI_Output(self,hero,"Info_OrcShaman_MAP_17_02"); //Domov Ur-Shaka být tam, kde mapa prázdná.
//	AI_Output(self,hero,"Info_OrcShaman_MAP_17_03"); //Stranger give map, then Ur-Shak finish map!
//	AI_Output(self,hero,"Info_OrcShaman_MAP_17_03"); //Fremder geben Karte, dann Ur-Shak machen Karte fertig!
	AI_Output(self,hero,"Info_OrcShaman_MAP_17_03"); //Cizinec dát mapu, Ur-Shak ji dokončit!
//	AI_Output(self,hero,"Info_OrcShaman_MAP_17_04"); //(scribbles map)
	AI_Output(self,hero,"Info_OrcShaman_MAP_17_04"); //(škrábe do mapy)
//	AI_Output(hero,self,"Info_OrcShaman_MAP_15_05"); //That's amazing, you're a good cartographer. Thanks!
//	AI_Output(hero,self,"Info_OrcShaman_MAP_15_05"); //Erstaunlich, du bist ein guter Kartenzeichner. Danke!
	AI_Output(hero,self,"Info_OrcShaman_MAP_15_05"); //Úžasné, jsi dobrý kartograf. Díky!

	B_GiveInvItems(hero,self,ItWrWorldmap,1);
	Npc_RemoveInvItem(self,ItWrWorldmap);
	CreateInvItem(self,ItWrWorldmap_Orc);
	B_GiveInvItems(self,hero,ItWrWorldmap_Orc,1);
}; 

//---------------------------------------------------------------------
//	Info FIGHT
//---------------------------------------------------------------------
instance Info_OrcShaman_FIGHT(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_FIGHT_Condition;
	information = Info_OrcShaman_FIGHT_Info;
	important = 0;
	permanent = 0;
//	description = "Well, looks like I'll have to fight my way through!";
//	description = "Nun, dann muss ich mir den Weg wohl freikämpfen!";
	description = "Dobrá, budu muset bojovat podle svého.";
};

func int Info_OrcShaman_FIGHT_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_INTEMPLE))
	{
		return TRUE;
	};
};

func void Info_OrcShaman_FIGHT_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_FIGHT_15_01"); //Well, looks like I'll have to fight my way through!
//	AI_Output(hero,self,"Info_OrcShaman_FIGHT_15_01"); //Nun, dann muss ich mir den Weg wohl freikämpfen!
	AI_Output(hero,self,"Info_OrcShaman_FIGHT_15_01"); //Dobrá, budu muset bojovat podle svého.
//	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_02"); //Brothers home very strong! Brothers be veeery many!
//	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_02"); //Brüder in Heimat seien sehr stark! Brüder seien seeeehr viele!
	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_02"); //Bratři doma být velmi silní! Bratrů být hóóódně moc!
//	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_03"); //Stranger no go. Many warriors! Stranger die!
//	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_03"); //Fremder nicht gehen. Viele Krieger! Fremder sterben!
	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_03"); //Cizinec tam nechodit. Mnoho bojovníků! Cizinec zemřít!
//	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_04"); //Other sons of spirit home. Stranger make fire, then stranger die!
//	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_04"); //Andere Söhne von Geist in Heimat. Machen Fremder Feuer, dann Fremder sterben!
	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_04"); //Další synové ducha být doma. Když cizinec udělat oheň, potom cizinec zemřít!
}; 

//---------------------------------------------------------------------
//	Info OTHERWAY
//---------------------------------------------------------------------
instance Info_OrcShaman_OTHERWAY(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_OTHERWAY_Condition;
	information = Info_OrcShaman_OTHERWAY_Info;
	important = 0;
	permanent = 0;
//	description = "Okay, okay, but I have to find a way into the temple!";
//	description = "Okay, okay, aber ich muss einen Weg in den Tempel finden!";
	description = "Dobře, dobře, budu ale muset nějak najít cestu do chrámu!";
};

func int Info_OrcShaman_OTHERWAY_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_FIGHT))
	{
		return TRUE;
	};
};

func void Info_OrcShaman_OTHERWAY_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_OTHERWAY_15_01"); //Okay, okay, but I have to find a way into the temple!
//	AI_Output(hero,self,"Info_OrcShaman_OTHERWAY_15_01"); //Okay, okay, aber ich muss einen Weg in den Tempel finden!
	AI_Output(hero,self,"Info_OrcShaman_OTHERWAY_15_01"); //Dobře, dobře, budu ale muset nějak najít cestu do chrámu!
//	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak know way! Stranger wear ULU-MULU!
//	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak kennen Weg! Fremder tragen ULU-MULU!
	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak znát cestu! Cizinec mít ULU-MULU!
//	AI_Output(hero,self,"Info_OrcShaman_OTHERWAY_15_03"); //ULU-MULU??? What's an Ulu-Mulu?
//	AI_Output(hero,self,"Info_OrcShaman_OTHERWAY_15_03"); //ULU-MULU??? Was ist ein Ulu-Mulu?
	AI_Output(hero,self,"Info_OrcShaman_OTHERWAY_15_03"); //ULU-MULU??? Co je to Ulu-Mulu?
//	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_04"); //Be sign of friendship! Brothers respect ULU-MULU!
//	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_04"); //Seien Standarte der Freundschaft! Brüder respektieren ULU-MULU!
	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_04"); //To být znamení přátelství! Bratři si vážit ULU-MULU!
//	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_05"); //Stranger wear ULU-MULU, then stranger no die!
//	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_05"); //Fremder tragen ULU-MULU, dann Fremder nicht sterben!
	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_05"); //Když cizinec mít ULU-MULU, pak cizinec nezemřít!
};

//---------------------------------------------------------------------
//	Info ULUMULU
//---------------------------------------------------------------------
instance Info_OrcShaman_ULUMULU(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_ULUMULU_Condition;
	information = Info_OrcShaman_ULUMULU_Info;
	important = 0;
	permanent = 0;
//	description = "Where can I get this Ulu-Mulu?";
//	description = "Wo bekomme ich ein solches Ulu-Mulu her?";
	description = "Kde dostanu to Ulu-Mulu?";
};

func int Info_OrcShaman_ULUMULU_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_OTHERWAY))
	{
		return TRUE;
	};
};

func void Info_OrcShaman_ULUMULU_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_01"); //Where can I get this Ulu-Mulu?
//	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_01"); //Wo bekomme ich ein solches Ulu-Mulu her?
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_01"); //Kde dostanu to Ulu-Mulu?
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_02"); //Stranger go see friend of Ur-Shak!
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_02"); //Fremder gehen zu Freund von Ur-Shak!
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_02"); //Cizinec jít k příteli Ur-Shaka!
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_03"); //Friend of Ur-Shak give ULU-MULU! Stranger wear ULU-MULU, then stranger no die!
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_03"); //Freund von Ur-Shak geben ULU-MULU! Fremder tragen ULU-MULU, dann Fremder nicht sterben!
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_03"); //Přítel Ur-Shaka dá ULU-MULU! Cizinec nosit ULU-MULU a pak nezemřít!
//	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_04"); //Yeah, yeah, I have the 'no die' bit alright, but where can I find your friend?
//	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_04"); //Ja, ja, das mit dem 'nicht sterben' habe ich verstanden, aber wo finde ich deinen Freund?
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_04"); //Dobře, dobře, tomu 'nezemřít' rozumím, ale kde najdu tvého přítele?
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_05"); //Friend of Ur-Shak in mine of humans. Friend no run away with Ur-Shak. Friend be ill then.
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_05"); //Freund von Ur-Shak seien in Mine von Menschen. Freund damals nicht laufen weg mit Ur-Shak. Freund damals gewesen krank.
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_05"); //Přítel Ur-Shaka být v dole lidí. Přítel neutéct s Ur-Shakem. Přítel pak být nemocný.

	B_Story_FoundUrShak();

	Info_ClearChoices(Info_OrcShaman_ULUMULU);
//	Info_AddChoice(Info_OrcShaman_ULUMULU,"Were you held in the Free Mine?", Info_OrcShaman_ULUMULU_FM);
//	Info_AddChoice(Info_OrcShaman_ULUMULU,"Warst du in der Freien Mine gefangen?", Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice(Info_OrcShaman_ULUMULU,"Byl jsi zavřený ve Svobodném dole?", Info_OrcShaman_ULUMULU_FM);
//	Info_AddChoice(Info_OrcShaman_ULUMULU,"Were you a prisoner in the abandoned mine?", Info_OrcShaman_ULUMULU_VM);
//	Info_AddChoice(Info_OrcShaman_ULUMULU,"Warst du in der Verlassenen Mine gefangen?", Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice(Info_OrcShaman_ULUMULU,"Byls vězněm v tom opuštěném dole?", Info_OrcShaman_ULUMULU_VM);
//	Info_AddChoice(Info_OrcShaman_ULUMULU,"Were you held captive in the Old Mine?", Info_OrcShaman_ULUMULU_AM);
//	Info_AddChoice(Info_OrcShaman_ULUMULU,"Warst du in der Alten Mine gefangen?", Info_OrcShaman_ULUMULU_AM);
	Info_AddChoice(Info_OrcShaman_ULUMULU,"Drželi tě zavřeného v Starém dole?", Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM()
{
//	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_08"); //Were you a prisoner in the abandoned mine?
//	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_08"); //Warst du in der verlassenen Mine gefangen?
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_08"); //Byls vězněm v tom opuštěném dole?
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak no know word.
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak nicht kennen Wort.
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak neznat to slovo.
};

func void Info_OrcShaman_ULUMULU_AM()
{
//	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_10"); //Were you held captive in the Old Mine?
//	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_10"); //Warst du in der Alten Mine gefangen?
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_10"); //Drželi tě zavřeného v Starém dole?
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak no understand!
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak nicht verstehen!
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak nerozumět!
};

func void Info_OrcShaman_ULUMULU_FM()
{
//	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_12"); //Were you held in the Free Mine?
//	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_12"); //Warst du in der Freien Mine gefangen?
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_12"); //Byl jsi zavřený ve Svobodném dole?
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak prisoner in mine under village in Hollow.
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak gefangen in Mine unter Dorf in Kessel.
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak být vězeň v dole pod vesnicí v Kotlině.
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak think people call so!
//	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak glauben, Menschen nennen so!
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak myslet, že tomu lidi tak říkat!

	Info_ClearChoices(Info_OrcShaman_ULUMULU);
};

//---------------------------------------------------------------------
//	Info BYEBYE
//---------------------------------------------------------------------
instance Info_OrcShaman_BYEBYE(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_BYEBYE_Condition;
	information = Info_OrcShaman_BYEBYE_Info;
	important = 0;
	permanent = 0;
//	description = "Thanks for your help!";
//	description = "Danke für deine Hilfe!";
	description = "Díky za tvou pomoc!";
};

func int Info_OrcShaman_BYEBYE_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_OrcShaman_ULUMULU))
	{
		return TRUE;
	};
};

func void Info_OrcShaman_BYEBYE_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_BYEBYE_15_01"); //Thanks for your help!
//	AI_Output(hero,self,"Info_OrcShaman_BYEBYE_15_01"); //Danke für deine Hilfe!
	AI_Output(hero,self,"Info_OrcShaman_BYEBYE_15_01"); //Děkuju ti za pomoc!
//	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak say thanks to stranger. Stranger save Ur-Shak. Stranger now friend of Ur-Shak!
//	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak danken Fremder. Fremder retten Ur-Shak. Fremder nun Freund von Ur-Shak!
	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak říkat děkuju cizinci. Cizinec zachránit Ur-Shaka. Cizinec teď být přítel Ur-Shaka!
//	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_03"); //Friend take present. Take Ur-Shak talisman! Talisman protect from breath of fire lizard!
//	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_03"); //Freund nehmen Geschenk. Nehmen Talismann von Ur-Shak! Talisman schützen vor Atem von Feuerwaran!
	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_03"); //Dát příteli dar. Ur-Shak dát talisman! Talisman ochránit před dechem ohnivé ještěrky!
//	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak can no go home. Ur-Shak now live here! Friend come when need help!
//	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak nicht können gehen Heimat. Ur-Shak nun hier wohnen! Freund kommen, wenn brauchen Hilfe!
	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak nesmět jít domu. Ur-Shak teď žít tady! Přítel přijít, když potřebovat pomoc!
//	AI_Output(hero,self,"Info_OrcShaman_BYEBYE_15_05"); //I may take you up on your offer!
//	AI_Output(hero,self,"Info_OrcShaman_BYEBYE_15_05"); //Vielleicht werde ich auf dein Angebot zurückkommen!
	AI_Output(hero,self,"Info_OrcShaman_BYEBYE_15_05"); //Snad tvojí nabídku budu moci využít!

	B_Story_FriendOfUrShak();

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info FRIENDLYHELLO
//---------------------------------------------------------------------
instance Info_OrcShaman_FRIENDLYHELLO(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_FRIENDLYHELLO_Condition;
	information = Info_OrcShaman_FRIENDLYHELLO_Info;
	important = 0;
	permanent = 0;
//	description = "How're you doing, my friend?";
//	description = "Wie geht es dir, mein Freund?";
	description = "Jak se máš, můj příteli?";
};

func int Info_OrcShaman_FRIENDLYHELLO_Condition()
{ 
	if Npc_KnowsInfo(hero,Info_OrcShaman_BYEBYE)
	&& FriendOfUrShak
	{
		return TRUE;
	};
};

func void Info_OrcShaman_FRIENDLYHELLO_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //How're you doing, my friend?
//	AI_Output(hero,self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Wie geht es dir, mein Freund?
	AI_Output(hero,self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Jak se máš, můj příteli?
//	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak be healthy!
//	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak seien gesund!
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak být zdravý!
//	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak now looking find own ULU-MULU!
//	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak suchen eigenes ULU-MULU!
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak teď hledat svoje vlastní ULU-MULU!
//	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Maybe Ur-Shak go home with own ULU-MULU!
//	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Vielleicht Ur-Shak gehen Heimat mit eigenes ULU-MULU!
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Možná Ur-Shak přijít domu s vlastním ULU-MULU!
//	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Friend come when need help!
//	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Freund kommen, wenn brauchen Hilfe!
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Přítel přijít, když potřebovat pomoc!
//	AI_Output(hero,self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Take care!
//	AI_Output(hero,self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Pass auf dich auf!
	AI_Output(hero,self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Být opatrný!
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//## KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info ORCCITY
//---------------------------------------------------------------------
instance Info_OrcShaman_ORCCITY(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_ORCCITY_Condition;
	information = Info_OrcShaman_ORCCITY_Info;
	important = 1;
	permanent = 0;
};

func int Info_OrcShaman_ORCCITY_Condition()
{ 
	if (Npc_GetDistToWP(hero,"SPAWN_OW_WARAN_ORC_01")<1000)
	{
		return TRUE;
	};

};
func void Info_OrcShaman_ORCCITY_Info()
{
	B_FullStop(hero);
	AI_GotoNpc(hero,self);

//	AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_01"); //Ur-Shak greet friend!
//	AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_01"); //Ur-Shak grüßen Freund!
	AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_01"); //Ur-Shak zdravit přítele!

	if (Npc_HasItems(hero,UluMulu))
	{
//		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_02"); //Friend have ULU-MULU! Be good!
//		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_02"); //Freund haben ULU-MULU! Seien gut!
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_02"); //Přítel mít ULU-MULU! To být dobře!
//		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_03"); //Friend no forget carry ULU-MULU in hand when go over bridge!
//		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_03"); //Freund nicht vergessen tragen ULU-MULU in Hand, wenn gehen über Brücke!
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_03"); //Přítel nezapomenout držet ULU-MULU v ruce, až přecházet most!
	}
	else
	{ 
//		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_04"); //Friend have no ULU-MULU! No good!
//		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_04"); //Freund haben kein ULU-MULU! Nicht gut!
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_04"); //Přítel nemít ULU-MULU! To nebýt dobře!
//		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_05"); //Friend no go over bridge, else die!
//		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_05"); //Freund nicht gehen über Brücke, sonst sterben!
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_05"); //Přítel nepřecházet most, jinak zemřít!
	};
}; 

//---------------------------------------------------------------------
//	Info YOUHERE
//---------------------------------------------------------------------
instance Info_OrcShaman_YOUHERE(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_YOUHERE_Condition;
	information = Info_OrcShaman_YOUHERE_Info;
	important = 0;
	permanent = 0;
//	description = "What are you doing so close to the town?";
//	description = "Was machst du hier so nah am Dorf?";
	description = "Co děláš tak blízko města?";
};

func int Info_OrcShaman_YOUHERE_Condition()
{ 
	if Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
func void Info_OrcShaman_YOUHERE_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_01"); //What are you doing so close to the town?
//	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_01"); //Was machst du hier so nah am Dorf?
	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_01"); //Co děláš tak blízko města?
//	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_02"); //Ur-Shak watch brothers in home!
//	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_02"); //Ur-Shak beobachten Brüder in Heimat!
	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_02"); //Ur-Shak pozorovat bratry doma!
//	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak believe KRUSHAK awake soon!
//	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak glauben, KRUSHAK bald aufwachen!
	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak věřit, že KRUSHAK brzy procitnout!
//	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak wait here, fight KRUSHAK when wake up!
//	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak hier warten und kämpfen gegen KRUSHAK, wenn erwacht!
	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak počkat tady a bojovat s KRUSHAKEM, až se probudit.
//	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_05"); //The Sleeper will wake up soon??? I hope you're wrong!
//	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_05"); //Der Schläfer wird bald erwachen??? Ich hoffe, du liegst falsch!
	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_05"); //Spáč se už brzy probudí??? Doufám, že se mýlíš!
//	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_06"); //Considering all I've heard of the arch demon so far, I'd prefer him to be asleep!
//	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_06"); //Bei allem, was ich bisher über diesen Erzdämon gehört habe, ist er mir schlafend bedeutend lieber!
	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_06"); //Vzhledem k tomu, co jsem o tom arcidémonovi slyšel, raději bych, aby spal!
}; 

//---------------------------------------------------------------------
//	Info SEAL
//---------------------------------------------------------------------
instance Info_OrcShaman_SEAL(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_SEAL_Condition;
	information = Info_OrcShaman_SEAL_Info;
	important = 0;
	permanent = 0;
//	description = "You told me that your brothers had sealed the temple!";
//	description = "Du erzähltest mir, dass deine Brüder den Tempel verschlossen haben!";
	description = "Říkal jsi mi, že tvoji bratři uzavřeli chrám!";
};

func int Info_OrcShaman_SEAL_Condition()
{ 
	if Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
func void Info_OrcShaman_SEAL_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_SEAL_15_01"); //At our last meeting you told me that your brothers had sealed the temple!
//	AI_Output(hero,self,"Info_OrcShaman_SEAL_15_01"); //Bei unserem letzten Treffen erzähltest du, dass deine Brüder den Tempel verschlossen haben!
	AI_Output(hero,self,"Info_OrcShaman_SEAL_15_01"); //Při naší poslední schůzce jsi mi říkal, že tvoji bratři uzavřeli chrám!
//	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_02"); //Ur-Shak brothers seal temple in earth very good!
//	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_02"); //Brüder von Ur-Shak haben verschlossen Tempel in Erde sehr gut!
	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_02"); //Ur-Shakovi bratři uzavřít chrám pod zemí velmi pečlivě!
//	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_03"); //Friend no can go in!
//	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_03"); //Freund nicht können gehen hinein!
	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_03"); //Přítel nechodit dovnitř!
//	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_04"); //Friend use magic from brothers who be sons of spirit like Ur-Shak!
//	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_04"); //Freund müssen benutzen Zauber von Brüder, die seien Söhne von Geist wie Ur-Shak!
	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_04"); //Přítel použít kouzla od bratří, kteří být synové ducha, tak jako Ur-Shak!
}; 

//---------------------------------------------------------------------
//	Info SCROLL
//---------------------------------------------------------------------
instance Info_OrcShaman_SCROLL(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_SCROLL_Condition;
	information = Info_OrcShaman_SCROLL_Info;
	important = 0;
	permanent = 0;
//	description = "Where can I find this magic?";
//	description = "Wo finde ich diesen Zauber?";
	description = "Kde najdu to kouzlo?";
};

func int Info_OrcShaman_SCROLL_Condition()
{ 
	if Npc_KnowsInfo(hero,Info_OrcShaman_SEAL)
	{
		return TRUE;
	};

};
func void Info_OrcShaman_SCROLL_Info()
{
//	AI_Output(hero,self,"Info_OrcShaman_SCROLL_15_01"); //Where can I find this magic?
//	AI_Output(hero,self,"Info_OrcShaman_SCROLL_15_01"); //Wo finde ich diesen Zauber?
	AI_Output(hero,self,"Info_OrcShaman_SCROLL_15_01"); //Kde najdu to kouzlo?
//	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_02"); //Must go in cave of brothers who be sons of spirit like Ur-Shak!
//	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_02"); //Müssen gehen in Höhle von Brüder, die seien Söhne von Geist wie Ur-Shak!
	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_02"); //Muset jít do jeskyně bratří, kde být synové ducha, tak jako Ur-Shak!
//	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_03"); //But friend must watch out when use magic!
//	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_03"); //Aber Freund müssen aufpassen, wenn benutzen Zauber!
	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_03"); //Přítel ale muset dávat pozor, když používat kouzlo!
//	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_04"); //Brothers of Ur-Shak no like! ULU-MULU no help when friend use magic!
//	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_04"); //Brüder von Ur-Shak nicht mögen! ULU-MULU nicht helfen, wenn Freund benutzen Zauber!
	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_04"); //Bratři Ur-Shaka to nemít rádi! ULU-MULU nepomáhat, když přítel používat kouzlo!

//	B_LogEntry(CH4_EnterTemple,"I met the shaman Ur-Shak in front of the Orc town again. He told me that I could only get into the vestibule of the underground temple with an Orc spell. The other Orc shamans keep spells like that in their caves.");
//	B_LogEntry(CH4_EnterTemple,"Ich habe den Schamanen Ur-Shak vor der Orkstadt wiedergetroffen. Er verriet mir, dass ich nur mithilfe eines orkischen Zauberspruches in die Vorhalle des unterirdischen Tempels gelangen kann. Die anderen Ork-Schamanen bewahren solche Zauber in ihrer Höhle auf.");
	B_LogEntry(CH4_EnterTemple,"Před skřetím městem jsem se znovu setkal se šamanem Ur-Shakem. Řekl mi, že pouze skřetím kouzlem se mohu dostat do předsálí podzemního chrámu. Ostatní skřetí šamani mají ve svých jeskyních právě taková kouzla.");
}; 

//---------------------------------------------------------------------
//	Info IDOL
//---------------------------------------------------------------------
instance Info_OrcShaman_IDOL(C_INFO)
{
	npc = ORC_2200_Shaman;
	condition = Info_OrcShaman_IDOL_Condition;
	information = Info_OrcShaman_IDOL_Info;
	important = 0;
	permanent = 0;
//	description = "Is there any other path into the temple?";
//	description = "Gibt es noch einen anderen Weg in den Tempel?";
	description = "Vede do chrámu ještě nějaká jiná cesta?";
};

func int Info_OrcShaman_IDOL_Condition()
{ 
	if Npc_KnowsInfo(hero,Info_OrcShaman_SCROLL)
	&& !OrcCity_Sanctum_OuterGateOpen
	{
		return TRUE;
	};

};
func void Info_OrcShaman_IDOL_Info()
{
	//SN: fliegt raus, da der Hinweis jetzt sofort nach dem Hinweis mit der Scroll gegeben wird.
	//AI_Output(hero,self,"Info_OrcShaman_IDOL_15_01"); //Ich habe den Teleportzauber verbraucht und das Gitter zur Tempelvorhalle lässt sich nicht öffnen!
	//AI_Output(hero,self,"Info_OrcShaman_IDOL_15_02"); //Wie komme ich jetzt wieder in den Tempel?

	if Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01) 
	{
//		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_03"); //Friend have found figure on column!
//		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_03"); //Freund haben gefunden Figur auf Säule!
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_03"); //Přítel najít na sloupu figurku!
//		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_04"); //Friend now can open gate to temple hall!
//		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_04"); //Freund nun können öffnen Tor zu Tempelhalle!
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_04"); //Přítel teď moci otevřít bránu do chrámového sálu!

//		B_LogEntry(CH4_EnterTemple,"Another way leads into the temple as well. I have to use the figurine of the Sleeper from the sacred column of the Orc shamans. It opens the door to the temple.");
//		B_LogEntry(CH4_EnterTemple,"Es gibt noch einen weiteren Weg in den Tempel. Ich muss die Schläferfigur von der heiligen Säule der Orkschamanen benutzen. Sie öffnet das Tor zum Tempel.");
		B_LogEntry(CH4_EnterTemple,"Do chrámu však vede i jiná cesta. Budu k tomu muset použít figurku Spáče z posvátného sloupu skřetích šamanů. Ta otevře vrata chrámu.");
	}
	else
	{
//		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_05"); //Friend now must take figure from column!
//		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_05"); //Freund müssen nehmen Figur von große Säule!
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_05"); //Přítel teď muset vzít ze sloupu figurku!
//		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_06"); //Figure now open door to temple hall!
//		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_06"); //Figur öffnen Tor zu Tempelhalle!
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_06"); //Figurka teď otevřít vrata chrámového sálu!

//		B_LogEntry(CH4_EnterTemple,"There is another way to the temple. There is a figure of the Sleeper on the sacred column of the Orc shamans which opens the door to the temple. Ur-Shak's brothers won't be delighted when they discover that I'm using their holy icon.");
//		B_LogEntry(CH4_EnterTemple,"Es gibt noch einen weiteren Weg in den Tempel zu gelangen. Auf der heiligen Säule der Orkschamanen steht eine Schläferfigur, die das Tor zum Tempel öffnet. Allerdings werden Ur-Shak's Brüder wenig begeistert sein, wenn sie bemerken, dass ich mich ihrer heiligen Ikone bediene.");
		B_LogEntry(CH4_EnterTemple,"Do chrámu vede další cesta. V posvátném sloupu skřetích šamanů je figurka Spáče, která otevře vrata chrámu. Ur-Shakovi bratři se nepotěší, až uvidí, že používám jejich svatou ikonu.");
	};
}; 

