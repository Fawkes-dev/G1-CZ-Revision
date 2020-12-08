// **************************************************
//  EXIT 
// **************************************************

instance DIA_Herek_Exit(C_INFO)
{
	npc = Vlk_511_Herek;
	nr = 999;
	condition = DIA_Herek_Exit_Condition;
	information = DIA_Herek_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Herek_Exit_Condition()
{
	return 1;
};

func void DIA_Herek_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// **************************************************
// Schutzgeld-Bully
// **************************************************

instance DIA_Herek_Bully(C_INFO)
{
	npc = Vlk_511_Herek;
	nr = 2;
	condition = DIA_Herek_Bully_Condition;
	information = DIA_Herek_Bully_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Herek_Bully_Condition()
{ 
	if ((Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) && (Herek_ProtectionBully==TRUE))
	{
		return 1;
	};
};

func void DIA_Herek_Bully_Info()
{
//	AI_Output(self,other,"DIA_Herek_Bully_01_00"); //Hang on! I hear you've spoken to Bloodwyn?
//	AI_Output(self,other,"DIA_Herek_Bully_01_00"); //Warte doch mal! Ich hab' gehört, du hast dich mit Bloodwyn unterhalten?
	AI_Output(self,other,"DIA_Herek_Bully_01_00"); //Zadrž! Slyšel jsem, že jsi mluvil s Bloodwynem?
//	AI_Output(other,self,"DIA_Herek_Bully_15_01"); //Why? What do you want?
//	AI_Output(other,self,"DIA_Herek_Bully_15_01"); //Warum? Was willst du?
	AI_Output(other,self,"DIA_Herek_Bully_15_01"); //Proč? Co chceš?
//	AI_Output(self,other,"DIA_Herek_Bully_01_02"); //It was real cool of ya to refuse to pay him protection money!
//	AI_Output(self,other,"DIA_Herek_Bully_01_02"); //Fand ich echt gut von dir, dass du dich geweigert hast, ihm Schutzgeld zu zahlen!
	AI_Output(self,other,"DIA_Herek_Bully_01_02"); //To bylo vážně moudré, odmítnout mu zaplatit peníze za ochranu!
//	AI_Output(self,other,"DIA_Herek_Bully_01_03"); //It means we're all gonna have to pay your share as well!
//	AI_Output(self,other,"DIA_Herek_Bully_01_03"); //Das heißt, wir anderen müssen deinen Teil mitbezahlen!
	AI_Output(self,other,"DIA_Herek_Bully_01_03"); //To znamená, že my ostatní musíme platit tvůj podíl!
//	AI_Output(self,other,"DIA_Herek_Bully_01_04"); //I'll make sure you remember next time he asks you.
//	AI_Output(self,other,"DIA_Herek_Bully_01_04"); //Ich werde dafür sorgen, dass du dich daran erinnerst, wenn er dich das nächste Mal fragt ...
	AI_Output(self,other,"DIA_Herek_Bully_01_04"); //Postarám se, aby sis na to příště vzpomněl, až s ním budeš zase mluvit...

	Npc_SetPermAttitude(self,ATT_ANGRY);

	AI_StopProcessInfos(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

// **************************************************
// Motz
// **************************************************

instance DIA_Herek_Motz(C_INFO)
{
	npc = Vlk_511_Herek;
	nr = 2;
	condition = DIA_Herek_Motz_Condition;
	information = DIA_Herek_Motz_Info;
	permanent = 0;
//	description = "And, how's things?";
//	description = "Na, wie sieht's aus?";
	description = "A jak to jde?";
};

func int DIA_Herek_Motz_Condition()
{ 
	if (Herek_ProtectionBully==FALSE)
	{
		return 1;
	};
};

func void DIA_Herek_Motz_Info()
{
//	AI_Output(other,self,"DIA_Herek_Motz_15_00"); //And, how's things?
//	AI_Output(other,self,"DIA_Herek_Motz_15_00"); //Na, wie sieht's aus?
	AI_Output(other,self,"DIA_Herek_Motz_15_00"); //A jak to jde?
//	AI_Output(self,other,"DIA_Herek_Motz_01_01"); //There ain't enough room in this camp for the two of us!
//	AI_Output(self,other,"DIA_Herek_Motz_01_01"); //In diesem Lager ist nicht genug Platz für uns beide!
	AI_Output(self,other,"DIA_Herek_Motz_01_01"); //V tomhle táboře není pro nás dva dost místa!
//	AI_Output(other,self,"DIA_Herek_Motz_15_02"); //Pardon me?
//	AI_Output(other,self,"DIA_Herek_Motz_15_02"); //Bitte was?
	AI_Output(other,self,"DIA_Herek_Motz_15_02"); //Prosím?
//	AI_Output(self,other,"DIA_Herek_Motz_01_03"); //If it was up to me, you wouldn't last out here for long!
//	AI_Output(self,other,"DIA_Herek_Motz_01_03"); //Wenn es nach mir ginge, würdest du hier nicht alt!
	AI_Output(self,other,"DIA_Herek_Motz_01_03"); //Kdyby bylo po mém, už bys tu pěkně dlouho nebyl!
//	AI_Output(self,other,"DIA_Herek_Motz_01_04"); //D'you know why I'm here? I killed a dozen people in one night, just like that... He he he!
//	AI_Output(self,other,"DIA_Herek_Motz_01_04"); //Weißt du, warum ich hier bin? In einer Nacht habe ich ein Dutzend Leute umgebracht. Einfach nur so ... hä hä hä!
	AI_Output(self,other,"DIA_Herek_Motz_01_04"); //Víš, proč tady jsem? Během jedné noci, jako je tahle, jsem zabil tucet lidí... hehehe!

	Npc_SetPermAttitude(self,ATT_ANGRY);

	AI_StopProcessInfos(self);
};

// **************************************************
// Anlegen!
// **************************************************

instance DIA_Herek_Anlegen(C_INFO)
{
	npc = Vlk_511_Herek;
	nr = 2;
	condition = DIA_Herek_Anlegen_Condition;
	information = DIA_Herek_Anlegen_Info;
	permanent = 1;
//	description = "So you think you're one of the wild boys, do you? Try it with me...";
//	description = "Du denkst, du bist einer von den Harten? Versuch's doch nochmal bei mir.";
	description = "Takže si myslíš, že jsi jeden z těch divokejch chlapíků, ne? Proč to teda nezkusíš se mnou...";
};

func int DIA_Herek_Anlegen_Condition()
{ 
	if ((Npc_KnowsInfo(hero,DIA_Herek_Motz)) || (Npc_KnowsInfo(hero,DIA_Herek_Bully)))
	{
		return 1;
	};
};

func void DIA_Herek_Anlegen_Info()
{
//	AI_Output(other,self,"DIA_Herek_Anlegen_15_00"); //So you think you're one of the wild boys, do you? Why don't you try it with me ...
//	AI_Output(other,self,"DIA_Herek_Anlegen_15_00"); //So, du denkst also, du bist einer von den Harten? Versuch's doch mal bei mir ...
	AI_Output(other,self,"DIA_Herek_Anlegen_15_00"); //Takže si myslíš, že jsi jeden z těch divokejch chlapíků, ne? Proč to teda nezkusíš na mně...
//	AI_Output(self,other,"DIA_Herek_Anlegen_01_01"); //You wanna get whacked? Alright, if that's what you want!!
//	AI_Output(self,other,"DIA_Herek_Anlegen_01_01"); //Du willst'n paar aufs Maul?! Kannst du haben!!
	AI_Output(self,other,"DIA_Herek_Anlegen_01_01"); //Chceš dostat nakládačku? Dobře, jestli to opravdu chceš!

	AI_StopProcessInfos(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

