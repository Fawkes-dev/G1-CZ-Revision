// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance Info_ORG_829_EXIT(C_INFO)
{
	npc = ORG_829_Organisator;
	nr = 999;
	condition = Info_ORG_829_EXIT_Condition;
	information = Info_ORG_829_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Info_ORG_829_EXIT_Condition()
{
	return 1;
};

func void Info_ORG_829_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

instance Info_ORG_829_Hello(C_INFO)
{
	npc = ORG_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_Hello_Condition;
	information = Info_ORG_829_Hello_Info;
	permanent = 0;
//	description = "How are things?";
//	description = "Wie sieht's aus?";
	description = "Jak to jde?";
};                       

func int Info_ORG_829_Hello_Condition()
{
	return 1;
};

func void Info_ORG_829_Hello_Info()
{ 
//	AI_Output(other,self,"Info_ORG_829_Hello_15_00"); //How are things?
//	AI_Output(other,self,"Info_ORG_829_Hello_15_00"); //Wie sieht's aus?
	AI_Output(other,self,"Info_ORG_829_Hello_15_00"); //Jak to jde?
//	AI_Output(self,other,"Info_ORG_829_Hello_06_01"); //Not too bad, but I don't have anything to smoke.
//	AI_Output(self,other,"Info_ORG_829_Hello_06_01"); //Geht. Hab' nichts mehr zu rauchen.
	AI_Output(self,other,"Info_ORG_829_Hello_06_01"); //Docela to ujde, ale nemám co kouřit.
};

// ************************************************************
// 						Offer Joint
// ************************************************************
	var int Org_829_GotJoint;
// ************************************************************

instance Info_ORG_829_OfferJoint(C_INFO)
{
	npc = ORG_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_OfferJoint_Condition;
	information = Info_ORG_829_OfferJoint_Info;
	permanent = 0;
//	description = "I have swampweed - d'you want some?";
//	description = "Ich hab' Sumpfkraut dabei - willst du was?";
	description = "Mám drogu z bažin - chceš trochu?";
};                       

func int Info_ORG_829_OfferJoint_Condition()
{
	if (Npc_KnowsInfo(hero,Info_ORG_829_Hello))
	{
		return 1;
	};
};

func void Info_ORG_829_OfferJoint_Info()
{ 
//	AI_Output(other,self,"Info_ORG_829_OfferJoint_15_00"); //I have swampweed - d'you want some?
//	AI_Output(other,self,"Info_ORG_829_OfferJoint_15_00"); //Ich hab' Sumpfkraut dabei - willst du was?
	AI_Output(other,self,"Info_ORG_829_OfferJoint_15_00"); //Mám drogu z bažin - chceš trochu?

	if ((Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0))
	{
		if (Npc_HasItems(other,ItMiJoint_1))
		{ B_GiveInvItems(other,self,ItMiJoint_1,1);  }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{ B_GiveInvItems(other,self,ItMiJoint_2,1);  }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{ B_GiveInvItems(other,self,ItMiJoint_3,1);  };

//		AI_Output(self,other,"Info_ORG_829_OfferJoint_06_01"); //Sure! Are you one of the dealers from the Sect Camp or what?
//		AI_Output(self,other,"Info_ORG_829_OfferJoint_06_01"); //Na klar, her damit! Bist du einer von den Dealern aus dem Sektenlager oder was?
		AI_Output(self,other,"Info_ORG_829_OfferJoint_06_01"); //Jistě! Jsi jeden z překupníků ze Sektovního tábora, nebo co?

		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
//		AI_Output(self,other,"Info_ORG_829_OfferJoint_No_Joint_06_00"); //Hey, man! Don't take the piss, okay? I don't like it!
//		AI_Output(self,other,"Info_ORG_829_OfferJoint_No_Joint_06_00"); //Hey, Mann! Verarsch mich nicht, ja? Mit so was komm ich nicht klar!
		AI_Output(self,other,"Info_ORG_829_OfferJoint_No_Joint_06_00"); //Hej, člověče! Přestaň takhle žvanit, jasný? Nemám to rád.
	};
};

// ************************************************************
// 							Special Info
// ************************************************************

instance Info_ORG_829_SpecialInfo(C_INFO)
{
	npc = ORG_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_SpecialInfo_Condition;
	information = Info_ORG_829_SpecialInfo_Info;
	permanent = 0;
//	description = "I've just arrived - can you give me some advice?";
//	description = "Ich bin neu hier - hast du irgendwelche Tipps für mich?";
	description = "Právě jsem přišel - můžeš mi dát nějakou radu?";
};                       

func int Info_ORG_829_SpecialInfo_Condition()
{
	if (Org_829_GotJoint == TRUE)
	{
		return 1;
	};
};

func void Info_ORG_829_SpecialInfo_Info()
{ 
//	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_00"); //I've just arrived - can you give me some advice?
//	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_00"); //Ich bin neu hier - hast du irgendwelche Tipps für mich?
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_00"); //Právě jsem přišel - můžeš mi dát nějakou radu?
//	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_01"); //Sure! When you reach the Camp, go to Gorn. He's one of the mages' mercenaries, but he's okay. He used to be one of us.
//	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_01"); //Klar! Wenn du ins Lager kommst, geh zu Gorn. Er ist zwar einer der Söldner der Magier, aber er ist in Ordnung. War mal einer von uns.
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_01"); //Jistě! Když přijdeš do tábora, jdi za Gornem. Patří ke kouzelnickým žoldákům, ale je dobrý. Býval jedním z nás.
//	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_02"); //Who do you mean by 'us'?
//	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_02"); //Von 'uns'?
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_02"); //Co myslíš tím 'z nás'?
//	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_03"); //"Well, an outlaw, of course. One of the ""kick-the-Ore Barons-in-the-butt"" rogues!"
//	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_03"); //Na, ein Bandit eben. Ein Wir-treten-den-Erzbaronen-in-den-Arsch-Bandit!
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_03"); //Psanec, samozřejmě. Jeden z 'nakopávačů Rudobaronskejch zadků'!
};

// ************************************************************
// 							PERM
// ************************************************************

instance Info_ORG_829_PERM(C_INFO)
{
	npc = ORG_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_PERM_Condition;
	information = Info_ORG_829_PERM_Info;
	permanent = 1;
//	description = "Do you know what I should expect in the Camp?";
//	description = "Kannst du mir sagen, was mich da drin erwartet?";
	description = "Můžeš mi říct, co mě v táboře čeká?";
};                       

func int Info_ORG_829_PERM_Condition()
{
	if (Org_829_GotJoint == TRUE)
	{
		return 1;
	};
};

func void Info_ORG_829_PERM_Info()
{ 
//	AI_Output(other,self,"Info_ORG_829_PERM_15_00"); //Do you know what I should expect in the Camp?
//	AI_Output(other,self,"Info_ORG_829_PERM_15_00"); //Kannst du mir sagen, was mich da drin erwartet?
	AI_Output(other,self,"Info_ORG_829_PERM_15_00"); //Můžeš mi říct, co mě v táboře čeká?
//	AI_Output(self,other,"Info_ORG_829_PERM_06_01"); //Just go in and find out.
//	AI_Output(self,other,"Info_ORG_829_PERM_06_01"); //Geh rein und find's raus.
	AI_Output(self,other,"Info_ORG_829_PERM_06_01"); //Tak běž a zjisti to.
};
