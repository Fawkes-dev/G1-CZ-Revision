// *********************** HOHER PRIESTER ***********************
instance Info_HighPriest5(C_INFO)
{
	npc = ORC_Priest_5;
	nr = 1;
	condition = Info_HighPriest5_Condition;
	information = Info_HighPriest5_Info;
	important = 1;
};

func int Info_HighPriest5_Condition()
{
	return TRUE;
};

func void Info_HighPriest5_Info()
{
	//B_SelectWeapon (self,other);
	AI_SetWalkmode(self,NPC_WALK);
	AI_GotoNpc(self,other);

	if (Npc_HasItems(hero,Mythrilklinge02 )) || (Npc_HasItems(hero,UrizielRune ))
	{
//		AI_Output(self,other,"Info_HighPriest5_17_04"); //YOUUU have A POWERFUL WEEAAPON!!!
//		AI_Output(self,other,"Info_HighPriest5_17_04"); //DU HASSST EINE MÄCHTIGEEE WAFFFEE!!!
		AI_Output(self,other,"Info_HighPriest5_17_04"); //TYYY máš MOOCNOOUU ZBRAAAŇ!!!
//		AI_Output(self,other,"Info_HighPriest5_17_05"); //I WIIIIL STOOOP YOOUUU!!!
//		AI_Output(self,other,"Info_HighPriest5_17_05"); //ICCH WERDDDEEEE DIIICH AUFFHALTEEEEEN!!!
		AI_Output(self,other,"Info_HighPriest5_17_05"); //JÁÁÁ TĚĚ ZAASTAAVÍÍÍM!!!

		AI_StopProcessInfos(self);
		self.npctype = NpcType_Main;

		Npc_SetAttitude(self,ATT_HOSTILE);
		Npc_SetTempAttitude(self,ATT_HOSTILE);
	}
	else
	{
//		AI_Output(self,other,"Info_HighPriest5_17_01"); //YOOUUU MUST TUUURN BAAACK HEEEERE!!!
//		AI_Output(self,other,"Info_HighPriest5_17_01"); //UMKEEEHREN MUSST DU HIEEER!!!
		AI_Output(self,other,"Info_HighPriest5_17_01"); //MUUSÍÍÍŠŠ SEE VRÁÁÁTIIT ZPÁÁÁTKYY!!!
//		AI_Output(self,other,"Info_HighPriest5_17_02"); //NOOOBOODY MAY DISTUUURB THE SLEEEEP OF MY MAAASTER!!!
//		AI_Output(self,other,"Info_HighPriest5_17_02"); //NIEEEMAND DARF DIE RUHEEE MEINEEES MEEEISTERS STÖÖÖÖREN!!!
		AI_Output(self,other,"Info_HighPriest5_17_02"); //NIIIKDOOO NEESMÍÍÍ VYYRUUŠOOVAAT PÁÁÁNAAA VEE SPÁÁÁNKUUU!!!
//		AI_Output(other,self,"Info_HighPriest5_15_03"); //Wrong, your SLEEPER will be wide awake soon!
//		AI_Output(other,self,"Info_HighPriest5_15_03"); //Irrtum, dein SCHLÄFER wird schon bald hellwach sein!
		AI_Output(other,self,"Info_HighPriest5_15_03"); //Chyba, tvůj SPÁČ bude brzy probuzen.

		AI_StopProcessInfos(self);

		B_Story_EncounteredHighPriest();
	};
};

// *********************** HOHER PRIESTER ***********************
instance Info_HighPriest5FAILED(C_INFO)
{
	npc = ORC_Priest_5;
	nr = 2;
	condition = Info_HighPriest5FAILED_Condition;
	information = Info_HighPriest5FAILED_Info;
	important = 1;
};

func int Info_HighPriest5FAILED_Condition()
{
	if Npc_KnowsInfo(hero,Info_HighPriest5)
	&& (self.aivar[AIV_MISSION1] >= HighPriest_MaxHit)
	&& !Npc_HasItems(hero,Mythrilklinge02)
	&& !Npc_HasItems(hero,UrizielRune)
	{
		return TRUE;
	};
};

func void Info_HighPriest5FAILED_Info()
{
//	AI_Output(other,self,"Info_HighPriest5FAILED_15_01"); //Damn! I'm not causing the slightest damage! I need another...
//	AI_Output(other,self,"Info_HighPriest5FAILED_15_01"); //Verdammt! Ich bewirke nicht den geringsten Schaden! Ich brauche eine andere ...
	AI_Output(other,self,"Info_HighPriest5FAILED_15_01"); //Sakra! Nechci způsobit sebemenší škodu! Potřebuju něco jiného...
//	AI_Output(self,other,"Info_HighPriest5FAILED_17_02"); //NOOOWW YOOOUUU WIIIILL DIIEEE!!!!!
//	AI_Output(self,other,"Info_HighPriest5FAILED_17_02"); //NUUUUN WIIIIRST DUUUU STEEEERBEEEEEN!!!!!
	AI_Output(self,other,"Info_HighPriest5FAILED_17_02"); //NYYNÍÍI ZEEMŘEEŠ!!!
//	AI_Output(other,self,"Info_HighPriest5FAILED_15_03"); //I'd better get out of here fast!
//	AI_Output(other,self,"Info_HighPriest5FAILED_15_03"); //Nichts wie weg hier!
	AI_Output(other,self,"Info_HighPriest5FAILED_15_03"); //Raději odtud co nejrychleji vypadnu!
	AI_RemoveWeapon (other);
	AI_TurnAway(other,self);

	self.npctype = NpcType_Main;
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);

//	B_LogEntry(CH4_EnterTemple,"Grash-Varrag-Arushat apparently doesn't belong to the undead Orc shamans. He is more powerful by far and my weapons don't harm him at all. I need a more powerful weapon!");
//	B_LogEntry(CH4_EnterTemple,"Grash-Varrag-Arushat schient kein untoter Orkschamane wie die anderen zu sein. Es ist weitaus mächtiger und meine Waffen richteten nicht den geringsten Schaden an. Ich brauche eine Waffe, die mächtiger als alles andere ist!");
	B_LogEntry(CH4_EnterTemple,"Grash-Varrat-Arushat zřejmě nepatří k nemrtvým skřetím šamanům. Je daleko silnější a mé zbraně mu nedokážou ublížit. Potřebuji daleko silnější zbraň!");
	B_GiveXP(XP_RetreatFromLastPriest);

	AI_StopProcessInfos(self);
};
