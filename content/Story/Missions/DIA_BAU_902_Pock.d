// ************************************************************
// 			  				   EXIT
// ************************************************************
	var int Pock_ForgetAll;
// ************************************************************

instance DIA_Pock_EXIT(C_INFO)
{
	npc = Bau_902_Pock;
	nr = 999;
	condition = DIA_Pock_EXIT_Condition;
	information = DIA_Pock_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Pock_EXIT_Condition()
{
	return 1;
};

func void DIA_Pock_EXIT_Info()
{
	Pock_ForgetAll = TRUE;
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

instance Info_Pock_Wasser(C_INFO) // E1
{
	npc = Bau_902_Pock;
	nr = 800;
	condition = Info_Pock_Wasser_Condition;
	information = Info_Pock_Wasser_Info;
	important = 0;
	permanent = 1;
//	description = "Lefty sent me. I've brought you some water.";
//	description = "Lefty schickt mich. Ich hab' Wasser für dich.";
	description = "Lefty mě poslal. Mám pro tebe trochu vody.";
};

func int Info_Pock_Wasser_Condition()
{
	if (((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01)))
	&& (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};

	return 0;
};

func void Info_Pock_Wasser_Info()
{
//	AI_Output(other,self,"Info_Pock_Wasser_15_00"); //Lefty sent me. I've brought you some water.
//	AI_Output(other,self,"Info_Pock_Wasser_15_00"); //Lefty schickt mich. Ich hab' Wasser für dich.
	AI_Output(other,self,"Info_Pock_Wasser_15_00"); //Lefty mě poslal. Mám pro tebe trochu vody.
	if (Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if (C_BodystateContains(self,BS_SIT))
		{
			AI_StandUp(self);
			AI_TurnToNpc(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
//		AI_Output(self,other,"Info_Pock_Wasser_04_01"); //Thanks, boy! I needed that!
//		AI_Output(self,other,"Info_Pock_Wasser_04_01"); //Danke, Junge! Das hab' ich gebraucht!
		AI_Output(self,other,"Info_Pock_Wasser_04_01"); //Díky, chlapče! To jsem potřeboval!
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
//		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00"); //But you don't have any left. Never mind, boy. I'll ask the others.
//		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00"); //Aber du hast nichts mehr. Ist schon gut, Junge. Ich werd mich an die andern halten.
		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00"); //Ale už žádnou nemáš. Nevadí, hochu - zastavím se u ostatních.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

instance DIA_Pock_Hello(C_INFO)
{
	npc = Bau_902_Pock;
	nr = 1;
	condition = DIA_Pock_Hello_Condition;
	information = DIA_Pock_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "Hi! I'm new here.";
//	description = "Hi! Ich bin neu hier.";
	description = "Zdar! Jsem tady nový.";
};

func int DIA_Pock_Hello_Condition()
{
	if (Pock_ForgetAll == FALSE)
	{
		return 1;
	};

	return 0;
};

func void DIA_Pock_Hello_Info()
{
//	AI_Output(other,self,"DIA_Pock_Hello_15_00"); //Hi! I'm new here.
//	AI_Output(other,self,"DIA_Pock_Hello_15_00"); //Hi! Ich bin neu hier.
	AI_Output(other,self,"DIA_Pock_Hello_15_00"); //Zdar! Jsem tady nový.
//	AI_Output(self,other,"DIA_Pock_Hello_04_01"); //It's good to see a fresh face.
//	AI_Output(self,other,"DIA_Pock_Hello_04_01"); //Schön mal wieder ein neues Gesicht zu sehen.
	AI_Output(self,other,"DIA_Pock_Hello_04_01"); //Je pěkné vidět zase novou tvář.
//	AI_Output(other,self,"DIA_Pock_Hello_15_02"); //You must have been here a long time, huh?
//	AI_Output(other,self,"DIA_Pock_Hello_15_02"); //Du bist schon lange in der Kolonie, hm?
	AI_Output(other,self,"DIA_Pock_Hello_15_02"); //Musíš být v Kolonii už dlouho, že?
//	AI_Output(self,other,"DIA_Pock_Hello_04_03"); //Darned right, boy. I was one of the first.
//	AI_Output(self,other,"DIA_Pock_Hello_04_03"); //Stimmt genau, Junge. Ich war einer der Ersten.
	AI_Output(self,other,"DIA_Pock_Hello_04_03"); //Proklatě dlouho, hochu. Byl jsem jeden z prvních.
};

// ************************************************************
// 						Weißt ne Menge
// ************************************************************

instance DIA_Pock_KnowMuch(C_INFO)
{
	npc = Bau_902_Pock;
	nr = 1;
	condition = DIA_Pock_KnowMuch_Condition;
	information = DIA_Pock_KnowMuch_Info;
	important = 0;
	permanent = 0;
//	description = "In that case you must know a lot about this place?";
//	description = "Dann weißt du bestimmt ne Menge über all das hier?";
	description = "To toho musíš o tomhle místě hodně vědět.";
};

func int DIA_Pock_KnowMuch_Condition()
{
	if ((Pock_ForgetAll == FALSE) && (Npc_KnowsInfo(hero,DIA_Pock_Hello)))
	{
		return 1;
	};

	return 0;
};

func void DIA_Pock_KnowMuch_Info()
{
//	AI_Output(other,self,"DIA_Pock_KnowMuch_15_00"); //In that case you must know a lot about this place?
//	AI_Output(other,self,"DIA_Pock_KnowMuch_15_00"); //Dann weißt du bestimmt ne Menge über all das hier?
	AI_Output(other,self,"DIA_Pock_KnowMuch_15_00"); //To toho musíš o tomhle místě hodně vědět.
//	AI_Output(self,other,"DIA_Pock_KnowMuch_04_01"); //So so. I spend most of my time out here, just picking rice.
//	AI_Output(self,other,"DIA_Pock_KnowMuch_04_01"); //Tja wie man's nimmt, die meiste Zeit verbringe ich hier beim Reispflücken.
	AI_Output(self,other,"DIA_Pock_KnowMuch_04_01"); //Jak se to vezme. Většinu času trávím sklízením rýže.
//	AI_Output(self,other,"DIA_Pock_KnowMuch_04_02"); //That's what let me get so old. We get some rice and the odd schnapps. It's not much, but it's enough.
//	AI_Output(self,other,"DIA_Pock_KnowMuch_04_02"); //Nur dadurch bin ich so alt geworden. Wir bekommen etwas Reis ab und vielleicht mal Schnaps, nicht viel, aber es reicht.
	AI_Output(self,other,"DIA_Pock_KnowMuch_04_02"); //Jenom díky tomu jsem se dožil takového stáří. Dostávám trochu rýže a trošku pálenky. Není to moc, ale stačí to.
};

// ************************************************************
// 							Warum hier?
// ************************************************************

instance DIA_Pock_WhyJail(C_INFO)
{
	npc = Bau_902_Pock;
	nr = 2;
	condition = DIA_Pock_WhyJail_Condition;
	information = DIA_Pock_WhyJail_Info;
	important = 0;
	permanent = 0;
//	description = "Why are you here?";
//	description = "Weshalb bist du hier?";
	description = "Proč jsi tady?";
};

func int DIA_Pock_WhyJail_Condition()
{
	if ((Pock_ForgetAll == FALSE) && (Npc_KnowsInfo(hero,DIA_Pock_Hello)))
	{
		return 1;
	};

	return 0;
};

func void DIA_Pock_WhyJail_Info()
{
//	AI_Output(other,self,"DIA_Pock_WhyJail_15_00"); //Why are you here?
//	AI_Output(other,self,"DIA_Pock_WhyJail_15_00"); //Weshalb bist du hier?
	AI_Output(other,self,"DIA_Pock_WhyJail_15_00"); //Proč jsi tady?
//	AI_Output(self,other,"DIA_Pock_WhyJail_04_01"); //Taxes, boy, taxes. My shed was as empty as my stomach, and I just couldn't pay.
//	AI_Output(self,other,"DIA_Pock_WhyJail_04_01"); //Die Steuern, mein Junge, die Steuern. Meine Scheune war so leer wie mein Bauch, da konnte ich nicht mehr zahlen.
	AI_Output(self,other,"DIA_Pock_WhyJail_04_01"); //Daně, hochu, daně. Moje stodola byla tak prázdná jako můj žaludek, takže jsem nemohl zaplatit.
//	AI_Output(self,other,"DIA_Pock_WhyJail_04_02"); //So one day the soldiers came and brought me here. But it's no worse in here than it is out there. At least I won't starve in here.
//	AI_Output(self,other,"DIA_Pock_WhyJail_04_02"); //Irgendwann kamen die Soldaten und brachten mich her. Aber hier ist es nicht schlechter als draußen. Ich werde wenigstens nicht vor Hunger sterben.
	AI_Output(self,other,"DIA_Pock_WhyJail_04_02"); //Najednou přišli vojáci a odvedli mě sem. Ale není to tu o nic horší než venku. Tady alespoň nezemřu hlady.
//	AI_Output(self,other,"DIA_Pock_WhyJail_04_03"); //I'd always paid my taxes before - all my life. But that wasn't good enough for that son of a bitch with the crown!
//	AI_Output(self,other,"DIA_Pock_WhyJail_04_03"); //Hab immer meine Steuern gezahlt - jahrelang. Aber das hat dem Hurensohn mit der Krone nicht gereicht!
	AI_Output(self,other,"DIA_Pock_WhyJail_04_03"); //Předtím jsem vždycky daně platil - celé roky. Ale pro toho zkurvysyna s korunou na hlavě to nebylo dost!
};

// ************************************************************
// 						PERM (Forget)
// ************************************************************

instance DIA_Pock_ForgotAll(C_INFO)
{
	npc = Bau_902_Pock;
	nr = 1;
	condition = DIA_Pock_ForgotAll_Condition;
	information = DIA_Pock_ForgotAll_Info;
	important = 0;
	permanent = 1;
//	description = "Everything okay with you?";
//	description = "Alles klar bei dir?";
	description = "Jinak jsi v pořádku?";
};

func int DIA_Pock_ForgotAll_Condition()
{
	if (Pock_ForgetAll == TRUE)
	{
		return 1;
	};

	return 0;
};

func void DIA_Pock_ForgotAll_Info()
{
//	AI_Output(other,self,"DIA_Pock_ForgotAll_15_00"); //Everything okay with you?
//	AI_Output(other,self,"DIA_Pock_ForgotAll_15_00"); //Alles klar bei dir?
	AI_Output(other,self,"DIA_Pock_ForgotAll_15_00"); //Jinak jsi v pořádku?
//	AI_Output(self,other,"DIA_Pock_ForgotAll_04_01"); //It's good to see a new face.
//	AI_Output(self,other,"DIA_Pock_ForgotAll_04_01"); //Schön mal wieder ein neues Gesicht zu sehen.
	AI_Output(self,other,"DIA_Pock_ForgotAll_04_01"); //Je pěkné zase vidět novou tvář.
//	AI_Output(other,self,"DIA_Pock_ForgotAll_15_02"); //Hang on! We talked earlier.
//	AI_Output(other,self,"DIA_Pock_ForgotAll_15_02"); //Moment mal! Wir hatten uns schon unterhalten.
	AI_Output(other,self,"DIA_Pock_ForgotAll_15_02"); //Počkej! My už jsme spolu mluvili.
//	AI_Output(self,other,"DIA_Pock_ForgotAll_04_03"); //No! No, we can't have done. I've never seen you before in my life.
//	AI_Output(self,other,"DIA_Pock_ForgotAll_04_03"); //Nein! Nein, das ist ausgeschlossen. Dich hab' ich hier noch nie gesehen.
	AI_Output(self,other,"DIA_Pock_ForgotAll_04_03"); //Ne! Ne, to není možné. Ještě nikdy jsem tě tu neviděl.
//	AI_Output(other,self,"DIA_Pock_ForgotAll_15_04"); //Sure...
//	AI_Output(other,self,"DIA_Pock_ForgotAll_15_04"); //Natürlich ...
	AI_Output(other,self,"DIA_Pock_ForgotAll_15_04"); //Jistě...
};
