// ********************************
// 				EXIT
// ********************************

instance DIA_Jeremiah_EXIT(C_INFO)
{
	npc = Bau_912_Jeremiah;
	nr = 999;
	condition = DIA_Jeremiah_EXIT_Condition;
	information = DIA_Jeremiah_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

func void DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Jeremiah_Hallo(C_INFO)
{
	npc = Bau_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_Hallo_Condition;
	information = DIA_Jeremiah_Hallo_Info;
	important = 0;
	permanent = 0;
//	description = "What are you doing?";
//	description = "Was machst du hier?";
	description = "Co tady děláš?";
};

func int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

func void DIA_Jeremiah_Hallo_Info()
{
//	AI_Output(other,self,"DIA_Jeremiah_Hallo_15_00"); //What are you doing?
//	AI_Output(other,self,"DIA_Jeremiah_Hallo_15_00"); //Was machst du hier?
	AI_Output(other,self,"DIA_Jeremiah_Hallo_15_00"); //Co tady děláš?
//	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01"); //I'm making rice schnapps, boy.
//	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01"); //Ich brenne den Reisschnaps, Junge.
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01"); //Pálím rýžovou pálenku, hochu.
//	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02"); //Here - have a bottle. But don't tell Silas.
//	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02"); //Hier - nimm ne Flasche. Aber sag nichts Silas.
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02"); //Tady - vezmi si láhev. Ale neříkej to Silasovi.

	CreateInvItems(self,ItFoBooze,1);
	B_GiveInvItems(self,other,ItFoBooze,1);
};

// ********************************
// 				PERM
// ********************************
	var int Jeremiah_Bauer; //NUR lokal benutzt - wegen perm-info-condition Umgehung
// ********************************

instance DIA_Jeremiah_PERM(C_INFO)
{
	npc = Bau_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_PERM_Condition;
	information = DIA_Jeremiah_PERM_Info;
	important = 0;
	permanent = 1;
//	description = "How's the distillery going?";
//	description = "Wie läuft das Schnapsbrennergeschäft?";
	description = "Jak to chodí v palírně?";
};

func int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

func void DIA_Jeremiah_PERM_Info()
{
//	AI_Output(other,self,"DIA_Jeremiah_PERM_15_00"); //How's the distillery going?
//	AI_Output(other,self,"DIA_Jeremiah_PERM_15_00"); //Wie läuft das Schnapsbrennergeschäft?
	AI_Output(other,self,"DIA_Jeremiah_PERM_15_00"); //Jak to chodí v palírně?
//	AI_Output(self,other,"DIA_Jeremiah_PERM_04_01"); //I can hardly keep up with these guys. Man, can they drink!
//	AI_Output(self,other,"DIA_Jeremiah_PERM_04_01"); //Ich kann kaum soviel nachlegen, wie die Kerle wegsaufen.
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_01"); //Sotva stačím vypálit dostatek kořalky, ti chlapi ale pijou!
//	AI_Output(self,other,"DIA_Jeremiah_PERM_04_02"); //It's a good thing really. While I'm busy, the Rice Lord's lapdogs leave me alone.
//	AI_Output(self,other,"DIA_Jeremiah_PERM_04_02"); //Ist auch ganz gut so - solange ich hier genug zu tun habe, lassen mich die Jungs vom Reislord in Ruhe.
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_02"); //Je to vážně dobré. Dokud mám co dělat, poskoci Rýžového Lorda mě nechávají na pokoji.

	Jeremiah_Bauer = TRUE;
};

// ********************************
// 				Horatio
// ********************************

instance DIA_Jeremiah_Horatio(C_INFO)
{
	npc = Bau_912_Jeremiah;
	nr = 2;
	condition = DIA_Jeremiah_Horatio_Condition;
	information = DIA_Jeremiah_Horatio_Info;
	important = 0;
	permanent = 0;
//	description = "What can you tell me about the Rice Lord?";
//	description = "Was kannst du mir über den Reislord sagen?";
	description = "Co mi můžeš říci o Rýžovém Lordovi?";
};

func int DIA_Jeremiah_Horatio_Condition()
{
	if (Jeremiah_Bauer == TRUE)
	{
		return 1;
	};

	return 0;
};

func void DIA_Jeremiah_Horatio_Info()
{
//	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00"); //What can you tell me about the Rice Lord?
//	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00"); //Was kannst du mir über den Reislord sagen?
	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00"); //Co mi můžeš říci o Rýžovém Lordovi?
//	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01"); //He's a damn swine! His thugs pick on the weak and force 'em to work in the fields.
//	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01"); //Er ist ein verdammtes Schwein! Seine Schläger suchen sich die Schwachen aus, um sie zur Arbeit auf den Feldern zu zwingen.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01"); //Je to zpropadená svině! Jeho lidi si vybírají slabé, které pak nutí pracovat na polích.
//	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02"); //The only one who could stand up to him is Horatio. But he doesn't do violence.
//	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02"); //Der einzige, der sich wehren könnte ist Horatio. Aber der hat mit Gewalt nichts am Hut.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02"); //Jediný, kdo by se mu mohl postavit, je Horatio. Ten ale násilí odsuzuje.
//	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03"); //I did once hear him say he'd love to smash the Rice Lord's head in, but he'd never really do it.
//	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03"); //Ich hab' mal gehört, wie er gesagt hat, er würde dem Reislord gerne den Schädel einschlagen, aber das würde er nie tun.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03"); //Jednou jsem ho slyšel říkat, že by Rýžového Lorda nejraději praštil po hlavě, ale nikdy by to doopravdy neudělal.
//	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04"); //It'd go against his beliefs.
//	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04"); //Seine Überzeugung hält ihn davon ab.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04"); //Bylo by to proti jeho přesvědčení.
};
