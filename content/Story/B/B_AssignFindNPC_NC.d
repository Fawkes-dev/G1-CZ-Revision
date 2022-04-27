// *************************************************************************
// 									FIND NPC
// *************************************************************************

instance Info_FindNPC_NC(C_INFO)
{
	nr = 900;
	condition = Info_FindNPC_NC_Condition;
	information = Info_FindNPC_NC_Info;
	important = 0;
	permanent = 1;
//	description = "Where can I find ...";
//	description = "Wo finde ich...";
	description = "Kde najdu...";
};

func int Info_FindNPC_NC_Condition()
{
	return 1;
};

func void Info_FindNPC_NC_Info()
{
	Info_ClearChoices(Info_FindNPC_NC);
//	Info_AddChoice(Info_FindNPC_NC, DIALOG_BACK, Info_FindNPC_NC_BACK);
	Info_AddChoice(Info_FindNPC_NC,"DIALOG_BACK", Info_FindNPC_NC_BACK);

	VAR C_NPC Cronos; Cronos = Hlp_GetNpc(KdW_604_Cronos);
	if (Cronos.aivar[AIV_FINDABLE] == TRUE)
	{
//		Info_AddChoice(Info_FindNPC_NC,"...one of the magicians?", Info_FindNPC_NC_Mage);
//		Info_AddChoice(Info_FindNPC_NC,"...einen der Magier?", Info_FindNPC_NC_Mage);
		Info_AddChoice(Info_FindNPC_NC,"...některého z mágů?", Info_FindNPC_NC_Mage);
	};

	VAR C_NPC Gorn; Gorn = Hlp_GetNpc(PC_Fighter);
	if (Gorn.aivar[AIV_FINDABLE] == TRUE)
	{
//		Info_AddChoice(Info_FindNPC_NC,"...Gorn?", Info_FindNPC_NC_Gorn);
		Info_AddChoice(Info_FindNPC_NC,"...Gorna?", Info_FindNPC_NC_Gorn);
	};

	VAR C_NPC Lares; Lares = Hlp_GetNpc(Org_801_Lares);
	if (Lares.aivar[AIV_FINDABLE] == TRUE)
	{
//		Info_AddChoice(Info_FindNPC_NC,"...Lares?", Info_FindNPC_NC_Lares);
		Info_AddChoice(Info_FindNPC_NC,"...Larese?", Info_FindNPC_NC_Lares);
	};

	VAR C_NPC Lee; Lee = Hlp_GetNpc(Sld_700_Lee);
	if (Lee.aivar[AIV_FINDABLE] == TRUE)
	{
//		Info_AddChoice(Info_FindNPC_NC,"...Lee?", Info_FindNPC_NC_Lee);
		Info_AddChoice(Info_FindNPC_NC,"...Leeho?", Info_FindNPC_NC_Lee);
	};
};

func void Info_FindNPC_NC_BACK()
{
	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 			Gorn
// **********************

func void Info_FindNPC_NC_Gorn()
{
//	AI_Output(other,self,"Info_FindNPC_NC_Gorn_15_00"); //Where can I find Gorn?
//	AI_Output(other,self,"Info_FindNPC_NC_Gorn_15_00"); //Wo finde ich Gorn?
	AI_Output(other,self,"Info_FindNPC_NC_Gorn_15_00"); //Kde najdu Gorna?

	VAR C_NPC Gorn; Gorn = Hlp_GetNpc(PC_Fighter);

	if (Npc_GetDistToNpc(self,Gorn) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Gorn);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Gorn_06_01"); //When you go in the cave, keep to your right. There are a couple of huts right up front. He lives in one of them.
//				AI_Output(self,other,"Info_FindNPC_NC_Gorn_06_01"); //Wenn du in die Wohnhöhle kommst, halte dich rechts. Direkt vorne sind ein paar Hütten. In einer davon wohnt er.
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_06_01"); //Když vejdeš do jeskyně, drž se vpravo. Přímo před tebou bude pár chatrčí. Žije v jedné z nich.
			}
			else if (self.voice == 7)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Gorn_07_01"); //When you go into the cave, keep to your right. There are a couple of huts right up in the front. He lives in one of them.
//				AI_Output(self,other,"Info_FindNPC_NC_Gorn_07_01"); //Wenn du in die Wohnhöhle kommst, halte dich rechts. Direkt vorne sind ein paar Hütten. In einer davon wohnt er.
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_07_01"); //Když vejdeš do jeskyně, drž se vpravo. Přímo před tebou bude pár chatrčí. Žije v jedné z nich.
			}
			else if (self.voice == 13)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Gorn_13_01"); //When you go in the cave, keep to your right. There are a couple of huts right up front. He lives in one of them.
//				AI_Output(self,other,"Info_FindNPC_NC_Gorn_13_01"); //Wenn du in die Wohnhöhle kommst, halte dich rechts. Direkt vorne sind ein paar Hütten. In einer davon wohnt er.
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_13_01"); //Když vejdeš do jeskyně, drž se vpravo. Přímo před tebou bude pár chatrčí. Žije v jedné z nich.
			};
		}
		else if (self.guild == GIL_SLD)
		{
			if (self.voice == 8)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Gorn_08_01"); //When you go in the cave, keep to your right. There are a couple of huts right up front. He lives in one of them.
//				AI_Output(self,other,"Info_FindNPC_NC_Gorn_08_01"); //Wenn du in die Wohnhöhle kommst, halte dich rechts. Direkt vorne sind ein paar Hütten. In einer davon wohnt er.
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_08_01"); //Když vejdeš do jeskyně, drž se vpravo. Přímo před tebou bude pár chatrčí. Žije v jedné z nich.
			}
			else if (self.voice == 11)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Gorn_11_01"); //When you go in the cave, keep to your right. There are a couple of huts right up front. He lives in one of them.
//				AI_Output(self,other,"Info_FindNPC_NC_Gorn_11_01"); //Wenn du in die Wohnhöhle kommst, halte dich rechts. Direkt vorne sind ein paar Hütten. In einer davon wohnt er.
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_11_01"); //Když vejdeš do jeskyně, drž se vpravo. Přímo před tebou bude pár chatrčí. Žije v jedné z nich.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 			Lares
// **********************

func void Info_FindNPC_NC_Lares()
{
//	AI_Output(other,self,"Info_FindNPC_NC_Lares_15_00"); //Where can I find Lares?
//	AI_Output(other,self,"Info_FindNPC_NC_Lares_15_00"); //Wo finde ich Lares?
	AI_Output(other,self,"Info_FindNPC_NC_Lares_15_00"); //Kde najdu Larese?

	VAR C_NPC Lares; Lares = Hlp_GetNpc(Org_801_Lares);

	if (Npc_GetDistToNpc(self,Lares) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Lares);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Lares_06_01"); //Right at the back, on the left-hand side of the big cave. You can't miss it. As soon as his guys stop you, you'll know you've found him.
//				AI_Output(self,other,"Info_FindNPC_NC_Lares_06_01"); //In der Wohnhöhle ganz hinten links. Du kannst es nicht verfehlen, sobald dich seine Jungs aufhalten bist du richtig.
				AI_Output(self,other,"Info_FindNPC_NC_Lares_06_01"); //Hned vzadu, po levé straně jeskyně. Nemůžeš to přehlédnout. Až tě zastaví jeho chlapi, budeš vědět, žes ho našel.
			}
			else if (self.voice == 7)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Lares_07_01"); //Right at the back, on the left-hand side of the big cave. You can't miss it. As soon as his guys stop you, you'll know you've found him.
//				AI_Output(self,other,"Info_FindNPC_NC_Lares_07_01"); //In der Wohnhöhle ganz hinten links. Du kannst es nicht verfehlen, sobald dich seine Jungs aufhalten bist du richtig.
				AI_Output(self,other,"Info_FindNPC_NC_Lares_07_01"); //Hned vzadu, po levé straně jeskyně. Nemůžeš to přehlédnout. Až tě zastaví jeho chlapi, budeš vědět, žes ho našel.
			}
			else if (self.voice == 13)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Lares_13_01"); //Right at the back, on the left-hand side of the big cave. You can't miss it. As soon as his guys stop you, you'll know you've found him.
//				AI_Output(self,other,"Info_FindNPC_NC_Lares_13_01"); //In der Wohnhöhle ganz hinten links. Du kannst es nicht verfehlen, sobald dich seine Jungs aufhalten bist du richtig.
				AI_Output(self,other,"Info_FindNPC_NC_Lares_13_01"); //Hned vzadu, po levé straně jeskyně. Nemůžeš to přehlédnout. Až tě zastaví jeho chlapi, budeš vědět, žes ho našel.
			};
		}
		else if (self.guild == GIL_SLD)
		{
			if (self.voice == 8)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Lares_08_01"); //Right at the back, on the left-hand side of the big cave. You can't miss it. As soon as his guys stop you, you'll know you've found him.
//				AI_Output(self,other,"Info_FindNPC_NC_Lares_08_01"); //In der Wohnhöhle ganz hinten links. Du kannst es nicht verfehlen, sobald dich seine Jungs aufhalten bist du richtig.
				AI_Output(self,other,"Info_FindNPC_NC_Lares_08_01"); //Hned vzadu, po levé straně jeskyně. Nemůžeš to přehlédnout. Až tě zastaví jeho chlapi, budeš vědět, žes ho našel.
			}
			else if (self.voice == 11)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Lares_11_01"); //Right at the back, on the left-hand side of the big cave. You can't miss it. As soon as his guys stop you, you'll know you've found him.
//				AI_Output(self,other,"Info_FindNPC_NC_Lares_11_01"); //In der Wohnhöhle ganz hinten links. Du kannst es nicht verfehlen, sobald dich seine Jungs aufhalten bist du richtig.
				AI_Output(self,other,"Info_FindNPC_NC_Lares_11_01"); //Hned vzadu, po levé straně jeskyně. Nemůžeš to přehlédnout. Až tě zastaví jeho chlapi, budeš vědět, žes ho našel.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 		Lee
// **********************

func void Info_FindNPC_NC_Lee()
{
//	AI_Output(other,self,"Info_FindNPC_NC_Lee_15_00"); //Where can I find Lee?
//	AI_Output(other,self,"Info_FindNPC_NC_Lee_15_00"); //Wo finde ich Lee?
	AI_Output(other,self,"Info_FindNPC_NC_Lee_15_00"); //Kde najdu Leeho?

	VAR C_NPC Lee; Lee = Hlp_GetNpc(Sld_700_Lee);

	if (Npc_GetDistToNpc(self,Lee) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Lee);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Lee_06_01"); //Go into the big cave, keep to your right and go right up to the top.
//				AI_Output(self,other,"Info_FindNPC_NC_Lee_06_01"); //Wenn du die große Wohnhöhle betrittst, halte dich rechts und geh ganz nach oben.
				AI_Output(self,other,"Info_FindNPC_NC_Lee_06_01"); //Jdi do velké jeskyně, pak zahni doprava a pak přímo nahoru.
			}
			else if (self.voice == 7)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Lee_07_01"); //Go into the big cave, keep to your right and go right up to the top.
//				AI_Output(self,other,"Info_FindNPC_NC_Lee_07_01"); //Wenn du die große Wohnhöhle betrittst, halte dich rechts und geh ganz nach oben.
				AI_Output(self,other,"Info_FindNPC_NC_Lee_07_01"); //Jdi do velké jeskyně, pak zahni doprava a pak přímo nahoru.
			}
			else if (self.voice == 13)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Lee_13_01"); //Go into the big cave, keep to your right and go right up to the top.
//				AI_Output(self,other,"Info_FindNPC_NC_Lee_13_01"); //Wenn du die große Wohnhöhle betrittst, halte dich rechts und geh ganz nach oben.
				AI_Output(self,other,"Info_FindNPC_NC_Lee_13_01"); //Jdi do velké jeskyně, pak zahni doprava a pak přímo nahoru.
			};
		}
		else if (self.guild == GIL_SLD)
		{
			if (self.voice == 8)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Lee_08_01"); //Go into the big cave, keep to your right and go right up to the top.
//				AI_Output(self,other,"Info_FindNPC_NC_Lee_08_01"); //Wenn du die große Wohnhöhle betrittst, halte dich rechts und geh ganz nach oben.
				AI_Output(self,other,"Info_FindNPC_NC_Lee_08_01"); //Jdi do velké jeskyně, pak zahni doprava a pak přímo nahoru.
			}
			else if (self.voice == 11)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Lee_11_01"); //Go into the big cave, keep to your right and go right up to the top.
//				AI_Output(self,other,"Info_FindNPC_NC_Lee_11_01"); //Wenn du die große Wohnhöhle betrittst, halte dich rechts und geh ganz nach oben.
				AI_Output(self,other,"Info_FindNPC_NC_Lee_11_01"); //Jdi do velké jeskyně, pak zahni doprava a pak přímo nahoru.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 		Magier (Cronos)
// **********************

func void Info_FindNPC_NC_Mage()
{
//	AI_Output(other,self,"Info_FindNPC_NC_Cronos_15_00"); //Where can I find a mage?
//	AI_Output(other,self,"Info_FindNPC_NC_Cronos_15_00"); //Wo finde ich einen der Magier?
	AI_Output(other,self,"Info_FindNPC_NC_Cronos_15_00"); //Kde najdu nějakého mága?

	VAR C_NPC Cronos; Cronos = Hlp_GetNpc(KdW_604_Cronos);

	if (Npc_GetDistToNpc(self,Cronos) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Cronos);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Cronos_06_01"); //They usually live in the secluded upper section of the cave. But sometimes you see them down at the ore mound in the middle of the cave.
//				AI_Output(self,other,"Info_FindNPC_NC_Cronos_06_01"); //Normalerweise leben sie zurückgezogen im oberen Teil der Höhle. Aber am Erzhaufen, in der Mitte der Höhle, kannst du manchmal einen von ihnen treffen.
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_06_01"); //Obvykle žijí odděleně v horní části jeskyně. Někdy je ale uvidíš dole nad rudnou haldou uprostřed jeskyně.
			}
			else if (self.voice == 7)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Cronos_07_01"); //They usually live in the secluded upper section of the cave. But sometimes you see them down at the ore mound in the middle of the cave.
//				AI_Output(self,other,"Info_FindNPC_NC_Cronos_07_01"); //Normalerweise leben sie zurückgezogen im oberen Teil der Höhle. Aber am Erzhaufen, in der Mitte der Höhle, kannst du manchmal einen von ihnen treffen.
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_07_01"); //Obvykle žijí odděleně v horní části jeskyně. Někdy je ale uvidíš dole nad rudnou haldou uprostřed jeskyně.
			}
			else if (self.voice == 13)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Cronos_13_01"); //They usually live in the secluded upper section of the cave. But sometimes you see them down at the ore mound in the middle of the cave.
//				AI_Output(self,other,"Info_FindNPC_NC_Cronos_13_01"); //Normalerweise leben sie zurückgezogen im oberen Teil der Höhle. Aber am Erzhaufen, in der Mitte der Höhle, kannst du manchmal einen von ihnen treffen.
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_13_01"); //Obvykle žijí odděleně v horní části jeskyně. Někdy je ale uvidíš dole nad rudnou haldou uprostřed jeskyně.
			};
		}
		else if (self.guild == GIL_SLD)
		{
			if (self.voice == 8)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Cronos_08_01"); //They usually live in the secluded upper section of the cave. But sometimes you see them down at the ore mound in the middle of the cave.
//				AI_Output(self,other,"Info_FindNPC_NC_Cronos_08_01"); //Normalerweise leben sie zurückgezogen im oberen Teil der Höhle. Aber am Erzhaufen, in der Mitte der Höhle, kannst du manchmal einen von ihnen treffen.
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_08_01"); //Obvykle žijí odděleně v horní části jeskyně. Někdy je ale uvidíš dole nad rudnou haldou uprostřed jeskyně.
			}
			else if (self.voice == 11)
			{
//				AI_Output(self,other,"Info_FindNPC_NC_Cronos_11_01"); //They usually live in the secluded upper section of the cave. But sometimes you see them down at the ore mound in the middle of the cave.
//				AI_Output(self,other,"Info_FindNPC_NC_Cronos_11_01"); //Normalerweise leben sie zurückgezogen im oberen Teil der Höhle. Aber am Erzhaufen, in der Mitte der Höhle, kannst du manchmal einen von ihnen treffen.
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_11_01"); //Obvykle žijí odděleně v horní části jeskyně. Někdy je ale uvidíš dole nad rudnou haldou uprostřed jeskyně.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};

// *************************************************************************
// 									ZUWEISUNG
// *************************************************************************

func void B_AssignFindNpc_NC (VAR C_NPC slf)
{
	Info_FindNPC_NC.npc = Hlp_GetInstanceID(slf);
};
