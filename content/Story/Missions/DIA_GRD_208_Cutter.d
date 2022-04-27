//******************************************
//					EXIT
//******************************************

instance DIA_Cutter_Exit(C_INFO)
{
	npc = GRD_208_Cutter;
	nr = 999;
	condition = DIA_Cutter_Exit_Condition;
	information = DIA_Cutter_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Cutter_Exit_Condition()
{
	return 1;
};

func void DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//******************************************
//					Hallo
//******************************************

instance DIA_Cutter_Hello(C_INFO)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Hello_Condition;
	information = DIA_Cutter_Hello_Info;
	important = 0;
	permanent = 0;
//	description = "This castle's pretty roomy.";
//	description = "Ihr habt ganz schön viel Platz hier in der Burg.";
	description = "Máte tady na hradě dost místa.";
};

func int DIA_Cutter_Hello_Condition()
{
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};

	return 0;
};

func void DIA_Cutter_Hello_Info()
{
//	AI_Output(other,self,"DIA_Cutter_Hello_15_00"); //This castle's pretty roomy.
//	AI_Output(other,self,"DIA_Cutter_Hello_15_00"); //Ihr habt ganz schön viel Platz hier in der Burg.
	AI_Output(other,self,"DIA_Cutter_Hello_15_00"); //Máte tady na hradě dost místa.
//	AI_Output(self,other,"DIA_Cutter_Hello_08_01"); //I don't think I've seen you here before. Who are you?
//	AI_Output(self,other,"DIA_Cutter_Hello_08_01"); //Ich habe dich hier noch nie gesehen. Wer bist du?
	AI_Output(self,other,"DIA_Cutter_Hello_08_01"); //Nemyslím, že bych tě už někdy viděl. Kdo jsi?
//	AI_Output(other,self,"DIA_Cutter_Hello_15_02"); //I'm a newcomer. Just thought I'd take a look around.
//	AI_Output(other,self,"DIA_Cutter_Hello_15_02"); //Ich bin neu hier. Wollte mich mal ein bisschen umsehen.
	AI_Output(other,self,"DIA_Cutter_Hello_15_02"); //Jsem tady nový. Akorát se tu trochu porozhlížím.
};

//******************************************
//					Burg
//******************************************

instance DIA_Cutter_Burg(C_INFO)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Burg_Condition;
	information = DIA_Cutter_Burg_Info;
	important = 0;
	permanent = 10;
//	description = "What can you tell me about the castle?";
//	description = "Was kannst du mir über die Burg sagen?";
	description = "Co mi můžeš říci o hradu?";
};

func int DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};

	return 0;
};

func void DIA_Cutter_Burg_Info()
{
//	AI_Output(other,self,"DIA_Cutter_Burg_15_00"); //What can you tell me about the castle?
//	AI_Output(other,self,"DIA_Cutter_Burg_15_00"); //Was kannst du mir über die Burg sagen?
	AI_Output(other,self,"DIA_Cutter_Burg_15_00"); //Co mi můžeš říci o hradu?
//	AI_Output(self,other,"DIA_Cutter_Burg_08_01"); //Gomez and his gang took it over after the big uprising.
//	AI_Output(self,other,"DIA_Cutter_Burg_08_01"); //Nach dem großen Aufstand haben sich Gomez und seine Jungs die Burg unter den Nagel gerissen.
	AI_Output(self,other,"DIA_Cutter_Burg_08_01"); //Gomez a jeho banda ho zabrali po velkém povstání.
//	AI_Output(self,other,"DIA_Cutter_Burg_08_02"); //I knew right away it was better to join up with him.
//	AI_Output(self,other,"DIA_Cutter_Burg_08_02"); //Ich hab' damals schnell gemerkt, dass es besser ist, sich ihm anzuschließen.
	AI_Output(self,other,"DIA_Cutter_Burg_08_02"); //Hned jsem věděl, že bude lepší dát se k němu.
//	AI_Output(self,other,"DIA_Cutter_Burg_08_03"); //Even when we were still cooped up in the dungeons, and had to slave away in the mines, the rest of us prisoners always did what he said.
//	AI_Output(self,other,"DIA_Cutter_Burg_08_03"); //Schon als wir damals noch alle im Kerker eingepfercht waren, und in den Minen schuften mussten hatte er unter den Gefangenen am meisten zu sagen.
	AI_Output(self,other,"DIA_Cutter_Burg_08_03"); //Už když jsme se mačkali ve vězení a museli otročit v dolech, vždycky jsme dělali, co on řekl.
//	AI_Output(other,self,"DIA_Cutter_Burg_15_04"); //Are there dungeons under the castle then?
//	AI_Output(other,self,"DIA_Cutter_Burg_15_04"); //Es gibt Kerker unter der Burg?
	AI_Output(other,self,"DIA_Cutter_Burg_15_04"); //Pod hradem je vězení?
//	AI_Output(self,other,"DIA_Cutter_Burg_08_05"); //Yeah, but there ain't nothing in them now. Nobody ever went down there after the big uprising.
//	AI_Output(self,other,"DIA_Cutter_Burg_08_05"); //Ja, aber sie sind heute leer. Seit dem großen Aufstand will da niemand mehr rein.
	AI_Output(self,other,"DIA_Cutter_Burg_08_05"); //Ano, ale je prázdné. Po velkém povstání už tam nikdo nebyl uvězněný.
};

//******************************************
//					PERM
//******************************************

instance DIA_Cutter_PERM(C_INFO)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_PERM_Condition;
	information = DIA_Cutter_PERM_Info;
	important = 0;
	permanent = 1;
//	description = "What's life like as a guard?";
//	description = "Wie ist das Leben als Gardist?";
	description = "Jaké to je být strážcem?";
};

func int DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};

	return 0;
};

func void DIA_Cutter_PERM_Info()
{
//	AI_Output(other,self,"DIA_Cutter_PERM_15_00"); //What's life like as a guard?
//	AI_Output(other,self,"DIA_Cutter_PERM_15_00"); //Wie ist das Leben als Gardist?
	AI_Output(other,self,"DIA_Cutter_PERM_15_00"); //Jaký je to život být strážcem?
//	AI_Output(self,other,"DIA_Cutter_PERM_08_01"); //Quiet. We're the biggest, strongest camp in the whole of the colony. Nobody messes with us.
//	AI_Output(self,other,"DIA_Cutter_PERM_08_01"); //Ruhig. Wir sind das größte und stärkste Lager in der Kolonie - mit uns legt sich keiner an.
	AI_Output(self,other,"DIA_Cutter_PERM_08_01"); //Klidný. Jsme největší a nejsilnější tábor v kolonii. Nikdo se na nás nedovoluje.
//	AI_Output(other,self,"DIA_Cutter_PERM_15_02"); //I see.
//	AI_Output(other,self,"DIA_Cutter_PERM_15_02"); //Verstehe.
	AI_Output(other,self,"DIA_Cutter_PERM_15_02"); //Aha.
	AI_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN //
------------------------------------------------------------------------*/
instance GRD_208_Cutter_WELCOME(C_INFO)
{
	npc = GRD_208_Cutter;
	condition = GRD_208_Cutter_WELCOME_Condition;
	information = GRD_208_Cutter_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int GRD_208_Cutter_WELCOME_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return 1;
	};

	return 0;
};

func void GRD_208_Cutter_WELCOME_Info()
{
//	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01"); //You've made the right choice. You'll enjoy being a guard!
//	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Du hast die richtige Entscheidung getroffen. Das Leben als Gardist wird dir gefallen!
	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Zvolil sis dobře. Život strážce se ti bude líbit!
	AI_StopProcessInfos(self);
};
