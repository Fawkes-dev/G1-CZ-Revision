// ************************ EXIT **************************

instance VLK_586_Grimes_Exit(C_INFO)
{
	npc = VLK_586_Grimes;
	nr = 999;
	condition = VLK_586_Grimes_Exit_Condition;
	information = VLK_586_Grimes_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

func void VLK_586_Grimes_Exit_Info()
{
//	AI_Output(other,self,"VLK_586_Grimes_Exit_Info_15_01"); //Good luck.
//	AI_Output(other,self,"VLK_586_Grimes_Exit_Info_15_01"); //Viel Glück noch.
	AI_Output(other,self,"VLK_586_Grimes_Exit_Info_15_01"); //Hodně štěstí!
//	AI_Output(self,other,"VLK_586_Grimes_Exit_Info_04_02"); //Same to you, boy, same to you.
//	AI_Output(self,other,"VLK_586_Grimes_Exit_Info_04_02"); //Dir auch, Jungchen, dir auch.
	AI_Output(self,other,"VLK_586_Grimes_Exit_Info_04_02"); //Tobě taky, chlapče, tobě taky.

	AI_StopProcessInfos(self);
};

// ***************** Infos *****************************

instance VLK_586_Grimes_STORY(C_INFO)
{
	npc = VLK_586_Grimes;
	condition = VLK_586_Grimes_STORY_Condition;
	information = VLK_586_Grimes_STORY_Info;
	important = 0;
	permanent = 0;
//	description = "Have you been here long?";
//	description = "Bist du schon lange hier?";
	description = "Jsi tady už dlouho?";
};

func int VLK_586_Grimes_STORY_Condition()
{
	if (Npc_KnowsInfo(hero,VLK_586_Grimes_FIRST))
	{
		return 1;
	};

};

func void VLK_586_Grimes_STORY_Info()
{
//	AI_Output(other,self,"VLK_586_Grimes_STORY_Info_15_01"); //Have you been here long?
//	AI_Output(other,self,"VLK_586_Grimes_STORY_Info_15_01"); //Bist du schon lange hier?
	AI_Output(other,self,"VLK_586_Grimes_STORY_Info_15_01"); //Jsi tady už dlouho?
//	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_02"); //I've already been here 10 years. Believe me, I've learned and experienced quite a lot here.
//	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_02"); //Ich bin schon seit 10 Jahren hier. Du kannst mir glauben, dass ich schon einiges gesehen und erlebt hab'.
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_02"); //Jsem tady už 10 let. Věř mi, že jsem toho hodně viděl a hodně zažil.
//	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_03"); //I've encountered many dangers and managed to stay alive.
//	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_03"); //So manche Gefahr hab' ich schon gemeistert und es immer verstanden, am Leben zu bleiben!
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_03"); //Čelil jsem už mnoha nebezpečím a vždy jsem věděl, jak přežít.
//	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_04"); //In the old times, when we worked in the abandoned mine, the one which is deserted now, and the supporting beams collapsed...
//	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_04"); //Damals, als wir noch in der inzwischen verlassenen Mine gearbeitet haben und die Stützbalken eingekracht sind ...
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_04"); //Když jsme ještě pracovali v opuštěném dole, zlomily se opěrné trámy...
//	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_05"); //But that's old stories...
//	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_05"); //Aber das sind alte Geschichten.
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_05"); //To je ale starý příběh...
};

instance VLK_586_Grimes_KNOW(C_INFO)
{
	npc = VLK_586_Grimes;
	condition = VLK_586_Grimes_KNOW_Condition;
	information = VLK_586_Grimes_KNOW_Info;
	important = 0;
	permanent = 0;
//	description = "You must have heard about many escape plans as well.";
//	description = "Du hast doch bestimmt auch eine Menge Ausbruchspläne mitgekriegt.";
	description = "Určitě jsi také slyšel o spoustě plánů na útěk.";
};

func int VLK_586_Grimes_KNOW_Condition()
{
	if (Npc_KnowsInfo(hero,VLK_586_Grimes_STORY))
	{
		return 1;
	};

};
func void VLK_586_Grimes_KNOW_Info()
{
//	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_01"); //You must have heard about many escape plans as well.
//	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_01"); //Du hast doch bestimmt auch eine Menge Ausbruchspläne mitgekriegt.
	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_01"); //Určitě jsi také slyšel o spoustě plánů na útěk.
//	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_02"); //Listen, boy: I know you want to get out of here - but forget it.
//	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_02"); //Hör zu, mein Junge: Ich weiß genau, du willst hier raus - aber vergiss es.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_02"); //Poslyš, hochu. Vím, že odtud chceš pryč, ale na to zapomeň.
//	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_03"); //You better forget the thought of escape. I saw the faces of those who tried to get out of the Barrier.
//	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_03"); //Gewöhn dich direkt daran und vergiss die Gedanken vom Ausbruch. Ich hab' die Gesichter der Leute gesehen, die versucht haben, aus der Barriere zu fliehen.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_03"); //Lepší bude si zvyknout a na útěk zapomenout. Viděl jsem tváře těch, co se pokoušeli dostat z Bariéry.
//	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_04"); //Don't make the same mistake, the Barrier will stop everybody.
//	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_04"); //Mach nicht denselben Fehler, die Barriere hält jeden auf!
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_04"); //Neudělej tu samou chybu, Bariéra zastaví každého.
//	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_05"); //I don't want to dig in the mine for the next ten years of my life!
//	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_05"); //Ich habe nicht vor, die nächsten 10 Jahre meines Lebens hier zu schürfen!
	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_05"); //Nechci tu dalších deset let života těžit v dole!
//	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_06"); //No, you won't. Perhaps you'll be one of the real big shots, who knows.
//	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_06"); //Nein. Das wirst du nicht. Vielleicht wirst du zu den ganz Grossen gehören, wer weiß.
	//#Needs_Attention prebasnit ? tu mi celkom chyba v kontextu 'velkých šéfů' ... 'velkých' samo o sebe mi pripada neslane nemastne
	//AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_06"); //Ne, nebudeš! Snad budeš jedním z těch velkých šéfů, kdo ví.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_06"); //Ne, nebudeš! Třeba budeš jedním z těch velkých, kdo ví.
//	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_07"); //You'll work your way up, but no matter how far you'll get, the Barrier will finally stop you.
//	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_07"); //Du wirst dich nach oben arbeiten, aber ganz egal, wie weit du auch kommst, die Barriere wird dich aufhalten!
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_07"); //Vypracuješ se dál, ale bez ohledu na to jak vysoko, Bariéra tě vždycky nakonec zastaví.
};

instance VLK_586_Grimes_FIRST(C_INFO)
{
	npc = VLK_586_Grimes;
	condition = VLK_586_Grimes_FIRST_Condition;
	information = VLK_586_Grimes_FIRST_Info;
	important = 1;
	permanent = 0;
};

func int VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void VLK_586_Grimes_FIRST_Info()
{
//	AI_Output(self,other,"VLK_586_Grimes_FIRST_Info_04_02"); //A new face. Have you ever dug ore, boy?
//	AI_Output(self,other,"VLK_586_Grimes_FIRST_Info_04_02"); //Ein neues Gesicht. Na, schon mal Erz geschürft, Jungchen?
	AI_Output(self,other,"VLK_586_Grimes_FIRST_Info_04_02"); //Nová tvář. Už si někdy kopal rudu, hochu?
};
