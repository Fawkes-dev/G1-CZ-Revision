// **************************************************
//						EXIT
// **************************************************

instance DIA_BaalTyon_Exit(C_INFO)
{
	npc = Gur_1210_BaalTyon;
	nr = 999;
	condition = DIA_BaalTyon_Exit_Condition;
	information = DIA_BaalTyon_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_BaalTyon_Exit_Condition()
{
	return 1;
};

func void DIA_BaalTyon_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 					NICHT ansprechbar (Ungläubiger)
// ************************************************************
	var int BaalTyon_Ansprechbar;
	var int BaalTyon_Sakrileg;
// ************************************************************

instance DIA_BaalTyon_NoTalk(C_INFO)
{
	npc = GUR_1210_BaalTyon;
	nr = 1;
	condition = DIA_BaalTyon_NoTalk_Condition;
	information = DIA_BaalTyon_NoTalk_Info;
	permanent = 1;
	important = 1;
};

func int DIA_BaalTyon_NoTalk_Condition()
{
	if (Npc_IsInState(self,ZS_TALK) && (BaalTyon_Ansprechbar==FALSE) && (Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalTyon_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalTyon_NoTalk);
	Info_Addchoice (DIA_BaalTyon_NoTalk,DIALOG_ENDE ,DIA_BaalTyon_NoTalk_ENDE);
	if (Npc_HasItems(other,SpecialJoint)>=1)
	{
//		info_AddChoice (DIA_BaalTyon_NoTalk,"(offer prepared dreamcall)",DIA_BaalTyon_SpecialJoint);
//		info_AddChoice (DIA_BaalTyon_NoTalk,"(präparierten Traumruf anbieten)",DIA_BaalTyon_SpecialJoint);
		info_AddChoice (DIA_BaalTyon_NoTalk,"(nabídni upravený přivolávač snů)",DIA_BaalTyon_SpecialJoint);
	};
//	Info_Addchoice (DIA_BaalTyon_NoTalk,"Everything alright, pal?",DIA_BaalTyon_NoTalk_Imp);
//	Info_Addchoice (DIA_BaalTyon_NoTalk,"Alles, klar, Alter?",DIA_BaalTyon_NoTalk_Imp);
	Info_Addchoice (DIA_BaalTyon_NoTalk,"Je všechno v pořádku, příteli?",DIA_BaalTyon_NoTalk_Imp);
//	Info_Addchoice (DIA_BaalTyon_NoTalk,"The Sleeper be with you!",DIA_BaalTyon_NoTalk_Sleeper);
//	Info_Addchoice (DIA_BaalTyon_NoTalk,"Der Schläfer sei mit dir!",DIA_BaalTyon_NoTalk_Sleeper);
	Info_Addchoice (DIA_BaalTyon_NoTalk,"Spáč buď s tebou!",DIA_BaalTyon_NoTalk_Sleeper);
//	Info_Addchoice (DIA_BaalTyon_NoTalk,"Hi! I'm new here!",DIA_BaalTyon_NoTalk_Hi);
//	Info_Addchoice (DIA_BaalTyon_NoTalk,"Hi! Ich bin neu hier!",DIA_BaalTyon_NoTalk_Hi);
	Info_Addchoice (DIA_BaalTyon_NoTalk,"Zdar! Jsem tu nový!",DIA_BaalTyon_NoTalk_Hi);
};

func void DIA_BaalTyon_NoTalk_Hi()
{
//	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Hi_15_00"); //Hi! I'm new here!
//	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Hi_15_00"); //Hi! Ich bin neu hier!
	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Hi_15_00"); //Zdar! Jsem tu nový!
//	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Hi_11_01"); //(sigh)
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Hi_11_01"); //(vzdech)
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_Sleeper()
{
//	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Sleeper_15_00"); //The Sleeper be with you!
//	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Sleeper_15_00"); //Der Schläfer sei mit dir!
	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Sleeper_15_00"); //Spáč buď s tebou!
//	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Sleeper_11_01"); //(sigh)
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Sleeper_11_01"); //(vzdech)
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_Imp()
{
//	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Imp_15_00"); //Everything alright, pal?
//	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Imp_15_00"); //Alles klar, Alter?
	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Imp_15_00"); //Je všechno v pořádku, příteli?
//	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Imp_11_01"); //(sigh)
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Imp_11_01"); //(vzdech)
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};

func void DIA_BaalTyon_SpecialJoint()
{
//	AI_Output(other,self,"DIA_BaalTyon_SpecialJoint_15_00"); //Here, Master! A modest present from your student...
//	AI_Output(other,self,"DIA_BaalTyon_SpecialJoint_15_00"); //Hier, Meister! Ein bescheidenes Geschenk von deinem Schüler ...
	AI_Output(other,self,"DIA_BaalTyon_SpecialJoint_15_00"); //Tady, mistře! Skromný dar od tvého žáka...
	AI_StopProcessInfos(self);

	B_GiveInvItems(hero,self,SpecialJoint,1);
	if (C_BodystateContains(self,BS_SIT))
	{
		AI_StandUp(self);
		AI_TurnToNpc(self,hero);
	};
	AI_UseItem(self,SpecialJoint);

//	AI_Output(self,other,"DIA_BaalTyon_SpecialJoint_11_01"); //Mmmmmmm...
//	AI_Output(self,other,"DIA_BaalTyon_SpecialJoint_11_01"); //Mmmmmmm ...
	AI_Output(self,other,"DIA_BaalTyon_SpecialJoint_11_01"); //Mmmmmmm...

	BaalTyon_Ansprechbar = TRUE;
	Npc_SetRefuseTalk (self,5);
	hero.aivar[AIV_INVINCIBLE] = FALSE; //SN: Workaround, da in diese Situation das INVINCIBLE-Flag nicht automatisch gelöscht wird!
};

// **************************************************
//					Hatte Vision
// **************************************************

instance DIA_BaalTyon_Vision(C_INFO)
{
	npc = Gur_1210_BaalTyon;
	nr = 1;
	condition = DIA_BaalTyon_Vision_Condition;
	information = DIA_BaalTyon_Vision_Info;
	permanent = 0;
	important = 1;
};

func int DIA_BaalTyon_Vision_Condition()
{
	if ((BaalTyon_Ansprechbar==TRUE) && (Npc_RefuseTalk(self)==FALSE))
	{
		return 1;
	};
};

func void DIA_BaalTyon_Vision_Info()
{
//	AI_Output(self,other,"DIA_BaalTyon_Vision_11_00"); //In the name of the Sleeper! I 've had a vision!
//	AI_Output(self,other,"DIA_BaalTyon_Vision_11_00"); //Beim Schläfer! Ich hatte eine Vision!
	AI_Output(self,other,"DIA_BaalTyon_Vision_11_00"); //Ve jménu Spáče! Měl jsem vidinu!
//	AI_Output(self,other,"DIA_BaalTyon_Vision_11_01"); //It was incredible. I saw that we would win a new brother,one who is not like those who came before him.
//	AI_Output(self,other,"DIA_BaalTyon_Vision_11_01"); //Es war unglaublich. Ich habe gesehen, dass wir einen neuen Bruder bekommen, der nicht ist wie die, die vor ihm kamen.
	AI_Output(self,other,"DIA_BaalTyon_Vision_11_01"); //Bylo to neuvěřitelné! Viděl jsem, jak jsme získali nového bratra, ne však takového, jací přicházeli před ním.
//	AI_Output(self,other,"DIA_BaalTyon_Vision_11_02"); //He was doing something to us... There was a sword in his hand and he was descending a wide flight of stairs. Then the vision ended.
//	AI_Output(self,other,"DIA_BaalTyon_Vision_11_02"); //Er macht irgendwas mit uns ... Er hat ein Schwert in der Hand und steigt eine breite Treppe herunter. Dann hört die Vision auf.
	AI_Output(self,other,"DIA_BaalTyon_Vision_11_02"); //Něco pro nás vykonal... V ruce třímal meč a sestupoval po širokém se schodišti. Pak vize skončila.
//	AI_Output(self,other,"DIA_BaalTyon_Vision_11_03"); //He looked very much like YOU. Who are you? What do you want?
//	AI_Output(self,other,"DIA_BaalTyon_Vision_11_03"); //Und er sah DIR verdammt ähnlich.  Wer bist du? Was willst du hier?
	AI_Output(self,other,"DIA_BaalTyon_Vision_11_03"); //Vypadal podobně jako TY. Kdo jsi? Co tady chceš?
//	AI_Output(other,self,"DIA_BaalTyon_Vision_15_04"); //I'm just a modest servant of the Sleeper...
//	AI_Output(other,self,"DIA_BaalTyon_Vision_15_04"); //Ich bin nur ein bescheidener Diener des Schläfers ...
	AI_Output(other,self,"DIA_BaalTyon_Vision_15_04"); //Jsem jen skromným služebníkem Spáče.
//	AI_Output(self,other,"DIA_BaalTyon_Vision_11_05"); //Go to Cor Kalom. He'll take care of you.
//	AI_Output(self,other,"DIA_BaalTyon_Vision_11_05"); //Geh zu Cor Kalom. Er soll sich weiter mit dir befassen.
	AI_Output(self,other,"DIA_BaalTyon_Vision_11_05"); //Jdi za Cor Kalomem. Postará se o tebe.

	self.npctype = NpcType_Main;
	self.flags = 0;

	BaalTyon_Ansprechbar = FALSE;
//	B_LogEntry(CH1_JoinPsi,"Thanks to my special gift, Baal Tyon had a vision! He wants Cor Kalom to deal with me now!");
//	B_LogEntry(CH1_JoinPsi,"Baal Tyon hatte dank meines speziellen Geschenkes eine Vision! Er möchte, dass sich nun Cor Kalom mit mir befasst!");
	//#Needs_Attention 'abych teď vyjednával s Cor Kalomem' toto asi skusit prebasnit
	B_LogEntry(CH1_JoinPsi,"Díky mému zvláštnímu daru měl Baal Tyon vizi! Chce, abych teď vyjednával s Cor Kalomem.");
	B_GiveXP(XP_ImpressedBaalTyon);

	AI_StopProcessInfos(self);
};

