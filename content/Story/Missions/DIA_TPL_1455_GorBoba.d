// infos
instance Info_TPL_1455_GorBoba(C_INFO)
{
	npc = TPL_1455_GorBoba;
	condition = Info_TPL_1455_GorBoba_Condition;
	information = Info_TPL_1455_GorBoba_Info;
	important = 1;
	permanent = 0;
};

func int Info_TPL_1455_GorBoba_Condition()
{
	return 1;
};

func void Info_TPL_1455_GorBoba_Info()
{
//	AI_Output(self,other,"Info_TPL_1455_GorBoba_08_01"); //Get lost, you aren't wanted here.
//	AI_Output(self,other,"Info_TPL_1455_GorBoba_08_01"); //Verschwinde, du bist hier nicht erwünscht.
	AI_Output(self,other,"Info_TPL_1455_GorBoba_08_01"); //Ztrať se, nejsi tu vítán.
};

instance Info_TPL_1455_GorBoba1(C_INFO)
{
	npc = TPL_1455_GorBoba;
	condition = Info_TPL_1455_GorBoba1_Condition;
	information = Info_TPL_1455_GorBoba1_Info;
	important = 0;
	permanent = 0;
//	description = "And YOU are gonna stop me?";
//	description = "Willst DU mich aufhalten?";
	description = "A TY mě chceš zastavit?";
};

func int Info_TPL_1455_GorBoba1_Condition()
{
	if (Npc_KnowsInfo(hero,Info_TPL_1455_GorBoba)) {
		return 1;
	};

	return 0;
};

func void Info_TPL_1455_GorBoba1_Info()
{
//	AI_Output(other,self,"Info_TPL_1455_GorBoba1_15_01"); //And YOU are gonna stop me?
//	AI_Output(other,self,"Info_TPL_1455_GorBoba1_15_01"); //Willst DU mich aufhalten?
	AI_Output(other,self,"Info_TPL_1455_GorBoba1_15_01"); //A TY mě chceš zastavit?
//	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_02"); //YES! I will stop you - you won't prevent Master Kalom from awakening the Sleeper.
//	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_02"); //JA! Ich werde dich aufhalten, damit du Meister Kalom nicht von seinem Vorhaben abhalten kannst, den Schläfer zu erwecken.
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_02"); //ANO! Zastavím tě - nezabráníš mistru Kalomovi v probuzení Spáče.
//	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_03"); //Don't try to attack me, the high priest has transferred part of his powers to Master Kalom and us. Now we are immortal.
//	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_03"); //Versuche nicht, mich anzugreifen, der Hohepriester hat Meister Kalom und uns anderen einen Teil seiner Macht verliehen, wir sind nun unsterblich.
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_03"); //Nepokoušej se mě napadnout, nejvyšší kněz na nás a mistra Kaloma přenesl část své moci. Jsme teď nesmrtelní.
//	AI_Output(other,self,"Info_TPL_1455_GorBoba1_15_04"); //I'll show you how immortal you are!
//	AI_Output(other,self,"Info_TPL_1455_GorBoba1_15_04"); //Ich kann dir zeigen, wie unsterblich du bist!
	AI_Output(other,self,"Info_TPL_1455_GorBoba1_15_04"); //Ukážu Vám, jak moc jste nesmrtelní!
//	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_05"); //Prepare to meet your Creator!
//	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_05"); //Mache dich bereit, deinem Schöpfer gegenüber zu treten.
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_05"); //Připrav se na setkání se stvořitelem!

	AI_StopProcessInfos(self);

//	Log_CreateTopic        ( "Orktempel",LOG_NOTE);
//	B_LogEntry            ( "Orktempel","GorBoba wanted to stop me. He told me that Kalom and his supporters had been given powers by the high priest to make them invincible by human weapons.");

	//#GE_OrkTempel
	Log_CreateTopic(GE_OrkTempel,LOG_NOTE);
	B_LogEntry(GE_OrkTempel,"GorBoba mě chěl zastavit. Řekl mi, že nejvyšší kněz poskytl Kalomovi a jeho přívržencům dar nesmrtelnosti, nemohou být zraněni normálními zbraněmi.");

	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};
