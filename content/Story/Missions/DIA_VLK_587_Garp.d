// ************************ EXIT **************************

instance Vlk_587_Garp_Exit(C_INFO)
{
	npc = Vlk_587_Garp;
	condition = Vlk_587_Garp_Exit_Condition;
	information = Vlk_587_Garp_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Vlk_587_Garp_Exit_Condition()
{
	return 1;
};

func void Vlk_587_Garp_Exit_Info()
{
	AI_StopProcessInfos(self);
};
// ***************************** INFOS ****************************************//

instance Vlk_587_Garp_ORK(C_INFO)
{
	npc = Vlk_587_Garp;
	condition = Vlk_587_Garp_ORK_Condition;
	information = Vlk_587_Garp_ORK_Info;
	important = 0;
	permanent = 0;
//	description = "What's the Orc doing here?";
//	description = "Was macht der Ork hier?";
	description = "Co tady dělá ten skřet?";
};

func int Vlk_587_Garp_ORK_Condition()
{
	return 1;
};

func void Vlk_587_Garp_ORK_Info()
{
//	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_01"); //What's the Orc doing here?
//	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_01"); //Was macht der Ork hier?
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_01"); //Co tady dělá skřet?
//	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_02"); //The guards caught him. Ever since he's been forced to work here.
//	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_02"); //Die Gardisten haben ihn gefangen. Seitdem wird er hier zur Arbeit gezwungen.
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_02"); //Strážci ho chytili. Od té doby tady musí pracovat.
//	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_03"); //He's not even in chains. Why doesn't he just run away?
//	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_03"); //Er ist ja noch nicht mal angekettet. Warum haut er nicht einfach ab?
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_03"); //Není ani připoutaný. Proč jednoduše neuteče?
//	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_04"); //He tried that once. The guards gave it to him in such a way that he couldn't walk for a couple of weeks. Since then, he's never tried it again.
//	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_04"); //Er hat es einmal versucht. Die Gardisten haben ihm so stark zugesetzt, dass er ein paar Wochen nicht laufen konnte. Seitdem hat er nie wieder versucht zu fliehen.
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_04"); //Jednou se o to pokusil. Strážci ho zbili tak tvrdě, že nemohl pár týdnů chodit. Od té doby se už nikdy o útěk nepokusil.
};
