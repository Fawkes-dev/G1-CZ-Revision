// **************************************************
// 						 EXIT
// **************************************************

instance DIA_Melvin_Exit(C_INFO)
{
	npc = Vlk_582_Melvin;
	nr = 999;
	condition = DIA_Melvin_Exit_Condition;
	information = DIA_Melvin_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Melvin_Exit_Condition()
{
	return 1;
};

func void DIA_Melvin_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// 				Was machst du?
// **************************************************

instance DIA_Melvin_Hello(C_INFO)
{
	npc = Vlk_582_Melvin;
	nr = 1;
	condition = DIA_Melvin_Hello_Condition;
	information = DIA_Melvin_Hello_Info;
	permanent = 0;
//	description = "Hi! You aren't from this camp, are you?";
//	description = "Hi! Du bist nicht aus diesem Lager, oder?";
	description = "Zdar! Ty nejsi z tohoto tábora, že ne?";
};

func int DIA_Melvin_Hello_Condition()
{
	return 1;
};

func void DIA_Melvin_Hello_Info()
{
//	AI_Output(other,self,"DIA_Melvin_Hello_15_00"); //Hi! You aren't from this camp, are you?
//	AI_Output(other,self,"DIA_Melvin_Hello_15_00"); //Hi! Du bist nicht aus diesem Lager, oder?
	AI_Output(other,self,"DIA_Melvin_Hello_15_00"); //Zdar! Ty nejsi z tohoto tábora, že ne?
//	AI_Output(self,other,"DIA_Melvin_Hello_03_01"); //Well, now I am! I left the Old Camp a week ago. Told my pal Dusty to come along but he wanted to wait.
//	AI_Output(self,other,"DIA_Melvin_Hello_03_01"); //Jetzt schon! Ich bin vor 'ner Woche aus dem Alten Lager abgehauen. Hab' meinem Kumpel Dusty gesagt, er soll mitkommen, aber er wollte lieber noch warten.
	AI_Output(self,other,"DIA_Melvin_Hello_03_01"); //Ano, jsem! Před týdnem jsem opustil Starý tábor. Řekl jsem svému kamarádovi Dustymu, aby šel se mnou, ale chtěl raději počkat.

	Log_CreateTopic(CH1_RecruitDusty,LOG_MISSION);
	Log_SetTopicStatus(CH1_RecruitDusty,LOG_RUNNING);
//	B_LogEntry(CH1_RecruitDusty,"The digger Melvin has joined the Brotherhood. His pal Dusty is still in the Old Camp, but he's also thinking of leaving.");
//	B_LogEntry(CH1_RecruitDusty,"Der Buddler Melvin hat sich der Bruderschaft angeschlossen. Sein Kumpel Dusty ist immer noch im Alten Lager, spielt aber ebenfalls mit dem Gedanken dort abzuhauen.");
	B_LogEntry(CH1_RecruitDusty,"Kopáč Melvin se přidal k Bratrstvu. Jeho kamarád Dusty stále zůstává ve Starém táboře, ale také pomýšlí na odchod.");
};

// **************************************************
// 				Dusty getroffen
// **************************************************

instance DIA_Melvin_MetDusty(C_INFO)
{
	npc = Vlk_582_Melvin;
	nr = 1;
	condition = DIA_Melvin_MetDusty_Condition;
	information = DIA_Melvin_MetDusty_Info;
	permanent = 0;
//	description = "I know Dusty - I talked to him for a short time.";
//	description = "Ich kenne Dusty - hab' mich kurz mit ihm unterhalten.";
	description = "Znám Dustyho - před nedávnem jsem s ním mluvil.";
};

func int DIA_Melvin_MetDusty_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Melvin_Hello)) && (Npc_KnowsInfo(hero,DIA_Dusty_Hello)))
	{
		return 1;
	};
};

func void DIA_Melvin_MetDusty_Info()
{
//	AI_Output(other,self,"DIA_Melvin_MetDusty_15_00"); //I know Dusty - I talked to him for a short time.
//	AI_Output(other,self,"DIA_Melvin_MetDusty_15_00"); //Ich kenne Dusty - hab' mich kurz mit ihm unterhalten.
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_00"); //Znám Dustyho - před nedávnem jsem s ním mluvil.
//	AI_Output(self,other,"DIA_Melvin_MetDusty_03_01"); //If you meet him again, tell him that he was dumb to stay there. It's ten times better than getting harassed by the guards in the Old Camp.
//	AI_Output(self,other,"DIA_Melvin_MetDusty_03_01"); //Wenn du ihn noch mal triffst, sag ihm, er ist schön blöd, dass er dageblieben ist. Wenn das hier nicht zehnmal besser ist, als sich im Alten Lager von den Gardisten schikanieren zu lassen, dann weiß ich's auch nicht mehr.
	AI_Output(self,other,"DIA_Melvin_MetDusty_03_01"); //Kdybys ho zase potkal, řekni mu, že byl hloupý, když tam zůstal. Je to tu desetkrát lepší, než se nechat šikanovat od stráží ve Starém táboře.
//	AI_Output(other,self,"DIA_Melvin_MetDusty_15_02"); //I'll tell him if I see him again.
//	AI_Output(other,self,"DIA_Melvin_MetDusty_15_02"); //Werd's ihm ausrichten, wenn ich ihn noch mal sehe.
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_02"); //Vyřídím mu to, až ho zase uvidím.
};

