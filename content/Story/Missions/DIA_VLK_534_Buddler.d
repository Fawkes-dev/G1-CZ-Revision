// **************************************************
//  EXIT 
// **************************************************

instance DIA_Vlk_534_Exit(C_INFO)
{
	npc = Vlk_534_Buddler;
	nr = 999;
	condition = DIA_Vlk_534_Exit_Condition;
	information = DIA_Vlk_534_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

func void DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// Lass mich in Ruhe!
// **************************************************

instance DIA_Vlk_534_LeaveMe(C_INFO)
{
	npc = Vlk_534_Buddler;
	nr = 1;
	condition = DIA_Vlk_534_LeaveMe_Condition;
	information = DIA_Vlk_534_LeaveMe_Info;
	permanent = 1;
//	description = "Why are you here and not in the Camp?";
//	description = "Warum bist du hier und nicht im Lager?";
	description = "Proč jsi tady a ne v táboře?";
};

func int DIA_Vlk_534_LeaveMe_Condition()
{ 
	return 1;
};

func void DIA_Vlk_534_LeaveMe_Info()
{
//	AI_Output(other,self,"DIA_Vlk_534_LeaveMe_15_00"); //Why are you here and not in the Camp?
//	AI_Output(other,self,"DIA_Vlk_534_LeaveMe_15_00"); //Warum bist du hier und nicht im Lager?
	AI_Output(other,self,"DIA_Vlk_534_LeaveMe_15_00"); //Proč jsi tady a ne v táboře?
//	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_01"); //I'm waiting for a friend to return from the mine. He owes me some ore.
//	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_01"); //Ich warte darauf, dass ein Kumpel von mir aus der Mine kommt. Er schuldet mit noch Erz.
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_01"); //Čekám na přítele, až se vrátí z dolu. Dluží mi nějakou rudu.
//	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_02"); //I can't turn up in the Camp without the ore - I couldn't pay the protection money for the guards and then things will get real heavy for me.
//	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_02"); //Ohne das Erz kann ich mich nicht im Lager sehen lassen - sonst kann ich den Gardisten kein Schutzgeld zahlen und dann kann die Sache für einen ziemlich unangenehm werden.
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_02"); //Nemůžu přijít do tábora bez rudy - nemohl bych strážím zaplatit peníze za ochranu a to by mi dost věcí zkomplikovalo.

	AI_StopProcessInfos(self);
};
