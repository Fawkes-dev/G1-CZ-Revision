// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance DIA_Homer_EXIT(C_INFO)
{
	npc = Bau_935_Homer;
	nr = 999;
	condition = DIA_Homer_EXIT_Condition;
	information = DIA_Homer_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Homer_EXIT_Condition()
{
	return 1;
};

func void DIA_Homer_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

instance DIA_Homer_Hello(C_INFO)
{
	npc = Bau_935_Homer;
	nr = 1;
	condition = DIA_Homer_Hello_Condition;
	information = DIA_Homer_Hello_Info;
	permanent = 0;
//	description = "Are you looking for something?";
//	description = "Hältst du nach irgendwas Ausschau?";
	description = "Hledáš něco?";
};                       

func int DIA_Homer_Hello_Condition()
{
	return 1;
};

func void DIA_Homer_Hello_Info()
{ 
//	AI_Output(other,self,"DIA_Homer_Hello_15_00"); //Are you looking for something?
//	AI_Output(other,self,"DIA_Homer_Hello_15_00"); //Hältst du nach irgendwas Ausschau?
	AI_Output(other,self,"DIA_Homer_Hello_15_00"); //Hledáš něco?
//	AI_Output(self,other,"DIA_Homer_Hello_02_01"); //I'm looking for leaks in the dam. I reckon there's a lurker gnawing at the foundations.
//	AI_Output(self,other,"DIA_Homer_Hello_02_01"); //Ich suche undichte Stellen im Damm. Ich habe den Verdacht, dass ein Lurker am Fundament des Damms nagt.
	AI_Output(self,other,"DIA_Homer_Hello_02_01"); //Hledám trhliny v hrázi. Mám podezření, že se u základů prokousává číhavec.
//	AI_Output(self,other,"DIA_Homer_Hello_02_02"); //The beast grinds its teeth and claws against the stones and wooden beams under water.
//	AI_Output(self,other,"DIA_Homer_Hello_02_02"); //Das Vieh wetzt seine Zähne und Krallen an den Steinen und Holzbalken unter Wasser.
	AI_Output(self,other,"DIA_Homer_Hello_02_02"); //Ta bestie si o kameny a trámy pod vodou brousí své zuby a drápy.
//	AI_Output(self,other,"DIA_Homer_Hello_02_03"); //If it carries on, the whole dam will soon be undermined.
//	AI_Output(self,other,"DIA_Homer_Hello_02_03"); //Auf diese Weise ist bald der gesamte Damm untergraben.
	//#Spacer_OU_special_characters
	AI_Output(self,other,"DIA_Homer_Hello_02_03"); //Jestli to bude pokračovat, bude celá hráz co nevidět podhrabaná.
};

// ************************************************************
// 						Damm gebaut
// ************************************************************

instance DIA_Homer_BuiltDam(C_INFO)
{
	npc = Bau_935_Homer;
	nr = 2;
	condition = DIA_Homer_BuiltDam_Condition;
	information = DIA_Homer_BuiltDam_Info;
	permanent = 0;
//	description = "Did YOU build the dam?";
//	description = "Hast DU den Damm gebaut?";
	description = "TY jsi tu hráz stavěl?";
};                       

func int DIA_Homer_BuiltDam_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Homer_Hello))
	{
		return 1;
	};
};

func void DIA_Homer_BuiltDam_Info()
{ 
//	AI_Output(other,self,"DIA_Homer_BuiltDam_15_00"); //Did YOU build the dam?
//	AI_Output(other,self,"DIA_Homer_BuiltDam_15_00"); //Hast DU den Damm gebaut?
	AI_Output(other,self,"DIA_Homer_BuiltDam_15_00"); //TY jsi tu hráz stavěl?
//	AI_Output(self,other,"DIA_Homer_BuiltDam_02_01"); //Yes. I built the dam back when we founded the New Camp.
//	AI_Output(self,other,"DIA_Homer_BuiltDam_02_01"); //Ja. Als wir damals das neue Lager gegründet haben, habe ich den Damm errichtet.
	AI_Output(self,other,"DIA_Homer_BuiltDam_02_01"); //Ano. Stavěl jsem ji tehdy, když jsme zakládali Nový tábor.
//	AI_Output(self,other,"DIA_Homer_BuiltDam_02_02"); //Of course everyone helped, but I was the master builder.
//	AI_Output(self,other,"DIA_Homer_BuiltDam_02_02"); //Natürlich haben alle mitgeholfen, aber ich war der Baumeister.
	AI_Output(self,other,"DIA_Homer_BuiltDam_02_02"); //Všichni samozřejmě pomáhali, ale já byl stavební mistr.
};

// ************************************************************
// 						Kann ich helfen?
// ************************************************************
	var int Homer_DamLurker;
// ************************************************************

instance DIA_Homer_WannaHelp(C_INFO)
{
	npc = Bau_935_Homer;
	nr = 1;
	condition = DIA_Homer_WannaHelp_Condition;
	information = DIA_Homer_WannaHelp_Info;
	permanent = 0;
//	description = "Is there anything I can do to help?";
//	description = "Kann ich dir helfen?";
	description = "Mohu ti s něčím pomoci?";
};                       

func int DIA_Homer_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Homer_Hello))
	{
		return 1;
	};
};

func void DIA_Homer_WannaHelp_Info()
{ 
//	AI_Output(other,self,"DIA_Homer_WannaHelp_15_00"); //Is there anything I can do to help?
//	AI_Output(other,self,"DIA_Homer_WannaHelp_15_00"); //Kann ich dir helfen?
	AI_Output(other,self,"DIA_Homer_WannaHelp_15_00"); //Mohu ti s něčím pomoci?
//	AI_Output(self,other,"DIA_Homer_WannaHelp_02_01"); //Sure, stop that beast from gnawing at my dam.
//	AI_Output(self,other,"DIA_Homer_WannaHelp_02_01"); //Klar, halt das Vieh davon ab, weiter an meinem Damm rumzunagen.
	AI_Output(self,other,"DIA_Homer_WannaHelp_02_01"); //Jistě, zařiď, aby ta bestie přestala podhlodávat moji hráz.

	Homer_DamLurker = LOG_RUNNING;

	Log_CreateTopic(CH1_DamLurker,LOG_MISSION);
	Log_SetTopicStatus(CH1_DamLurker,LOG_RUNNING);
//	B_LogEntry(CH1_DamLurker,"Homer told me that a lurker is gnawing at the dam. If I manage to stop it, I could repair the dam as well.");
//	B_LogEntry(CH1_DamLurker,"Homer erzählte mir, dass ein Lurker am Damm nagt. Wenn ich ihn aufhalten kann, wäre der Damm wieder zu reparieren.");
	B_LogEntry(CH1_DamLurker,"Homer mi řekl, že číhavec rozhlodává hráz. Pokud se mi ho podaří zastavit, budou hráz moci opravit.");

};

// ************************************************************
// 						Running
// ************************************************************

instance DIA_Homer_Running(C_INFO)
{
	npc = Bau_935_Homer;
	nr = 1;
	condition = DIA_Homer_Running_Condition;
	information = DIA_Homer_Running_Info;
	permanent = 0;
//	description = "Where can I find the beast?";
//	description = "Wo finde ich das Biest?";
	description = "Kde tu bestii najdu?";
};                       

func int DIA_Homer_Running_Condition()
{
	if (Homer_DamLurker == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Homer_Running_Info()
{ 
//	AI_Output(other,self,"DIA_Homer_Running_15_00"); //Where can I find the beast?
//	AI_Output(other,self,"DIA_Homer_Running_15_00"); //Wo finde ich das Biest?
	AI_Output(other,self,"DIA_Homer_Running_15_00"); //Kde tu bestii najdu?
//	AI_Output(self,other,"DIA_Homer_Running_02_01"); //I'd hunt round on the other side of the lake. Nobody ever goes there. That's probably where its den is.
//	AI_Output(self,other,"DIA_Homer_Running_02_01"); //Ich würde auf der anderen Seite des Sees suchen. Keiner von den Leuten hier geht da hin. Wahrscheinlich hat es da seine Höhle.
	AI_Output(self,other,"DIA_Homer_Running_02_01"); //Já bych jí hledal na druhé straně jezera. Tam nikdo nechodí. Nejspíš tam bude mít doupě.

	Homer_DamLurker = LOG_RUNNING;
//	B_LogEntry(CH1_DamLurker,"The lurker must have its nesting place somewhere at the secluded side of the reservoir.");
//	B_LogEntry(CH1_DamLurker,"Der Lurker muss seinen Ruheplatz irgendwo auf der abgelegenen Seite des Stausees haben.");
	B_LogEntry(CH1_DamLurker,"Ten číhavec musí mít své doupě někde na druhé straně hráze.");

};

// ************************************************************
// 						Success
// ************************************************************

instance DIA_Homer_Success(C_INFO)
{
	npc = Bau_935_Homer;
	nr = 2;
	condition = DIA_Homer_Success_Condition;
	information = DIA_Homer_Success_Info;
	permanent = 0;
//	description = "I've killed the beast!";
//	description = "Ich hab' das Biest erledigt!";
	description = "Postaral jsem se o tu bestii!";
};                       

func int DIA_Homer_Success_Condition()
{
	var C_NPC lurker; lurker = Hlp_GetNpc(DamLurker);
	PrintDebugString(PD_MISSION, "name: ", lurker.name);
	PrintDebugInt (PD_MISSION, "hp: ", lurker.attribute[ATR_HITPOINTS]);
	if (Homer_DamLurker==LOG_RUNNING)
	//&& (Npc_IsDead(lurker)) //SN: auskommentiert, da Hlp_GetNpc() die C_NPC lurker nicht initialisieren kann!
	&& (Npc_HasItems(hero,ItAt_DamLurker_01)) //SN: Workaround!
	{
		return 1;
	};
};

func void DIA_Homer_Success_Info()
{ 
//	AI_Output(other,self,"DIA_Homer_Success_15_00"); //I've killed the beast!
//	AI_Output(other,self,"DIA_Homer_Success_15_00"); //Ich hab' das Biest erledigt!
	AI_Output(other,self,"DIA_Homer_Success_15_00"); //Postaral jsem se o tu bestii!
//	AI_Output(self,other,"DIA_Homer_Success_02_01"); //Great! I got some of the Rice Lord's men to help me fix some of the damage it's caused.
//	AI_Output(self,other,"DIA_Homer_Success_02_01"); //Gut! Ich habe schon zusammen mit einigen von Reislords Leuten die Schäden behoben, die es bisher angerichtet hat.
	AI_Output(self,other,"DIA_Homer_Success_02_01"); //Dobře! Už jsem společně s lidmi Rýžového lorda odstranil škody, které ta bestie způsobila.
//	AI_Output(self,other,"DIA_Homer_Success_02_02"); //Now I can finally get some sleep.
//	AI_Output(self,other,"DIA_Homer_Success_02_02"); //Jetzt kann ich mich endlich mal wieder in Ruhe schlafen legen.
	AI_Output(self,other,"DIA_Homer_Success_02_02"); //Teď se konečně mohu jít zase v klidu vyspat.

	Homer_DamLurker = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_DamLurker,LOG_SUCCESS);
//	B_LogEntry(CH1_DamLurker,"The lurker is done with, Homer can sleep quietly again.");
//	B_LogEntry(CH1_DamLurker,"Der Lurker ist erlegt, Homer kann wieder ruhig schlafen.");
	B_LogEntry(CH1_DamLurker,"Číhavec je pryč a Homer může zase klidně spát.");
	B_GiveXP(XP_ReportDeadDamLurker);

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

// ************************************************************
// 						PERM
// ************************************************************

instance DIA_Homer_PERM(C_INFO)
{
	npc = Bau_935_Homer;
	nr = 2;
	condition = DIA_Homer_PERM_Condition;
	information = DIA_Homer_PERM_Info;
	permanent = 1;
//	description = "Everything okay with the dam?";
//	description = "Alles klar beim Damm?";
	description = "Je s hrází všechno v pořádku?";
};                       

func int DIA_Homer_PERM_Condition()
{
	if (Homer_DamLurker ==LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Homer_PERM_Info()
{ 
//	AI_Output(other,self,"DIA_Homer_PERM_15_00"); //Everything okay with the dam?
//	AI_Output(other,self,"DIA_Homer_PERM_15_00"); //Alles klar beim Damm?
	AI_Output(other,self,"DIA_Homer_PERM_15_00"); //Je s hrází všechno v pořádku?
//	AI_Output(self,other,"DIA_Homer_PERM_02_01"); //It's strong as a fortress, nothing can knock it down.
//	AI_Output(self,other,"DIA_Homer_PERM_02_01"); //Steht wie 'ne Festung, den kriegt so schnell nichts klein.
	AI_Output(self,other,"DIA_Homer_PERM_02_01"); //Stojí jako pevnost, jen tak rychle ji nic nerozboří.
};

