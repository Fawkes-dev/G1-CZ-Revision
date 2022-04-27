// ************************************************************
// 								EXIT
// ************************************************************

instance Info_GRD_275_PreExit(C_INFO)
{
	npc = GRD_275_Brueckenwache;
	nr = 999;
	condition = Info_GRD_275_PreExit_Condition;
	information = Info_GRD_275_PreExit_Info;
	important = 0;
	permanent = 0;
	description = DIALOG_ENDE;
};

func int Info_GRD_275_PreExit_Condition()
{
	if (Kapitel <= 1)
	{
		return 1;
	};

	return 0;
};

func void Info_GRD_275_PreExit_Info()
{
//	AI_Output(self,other,"Info_GRD_275_PreExit_06_01"); //Make sure you get to the Old Camp, they're holding a pickaxe for you, hee, hee!
//	AI_Output(self,other,"Info_GRD_275_PreExit_06_01"); //Sieh zu, dass du zum Alten Lager kommst, sie halten schon ne Spitzhacke für dich bereit, hee, hee!
	AI_Output(self,other,"Info_GRD_275_PreExit_06_01"); //Určitě se zastav ve Starém táboře, mají tam pro tebe připravený krumpáč, haha!
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------

instance Info_GRD_275_Exit(C_INFO)
{
	npc = GRD_275_Brueckenwache;
	nr = 999;
	condition = Info_GRD_275_Exit_Condition;
	information = Info_GRD_275_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_GRD_275_Exit_Condition()
{
	if ((Kapitel > 1)
	|| (Npc_KnowsInfo(hero,Info_GRD_275_PreExit)))
	{
		return 1;
	};

	return 0;
};

func void Info_GRD_275_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// *****************************************************************
// 							Was macht ihr hier?
// *****************************************************************

instance Info_GRD_275_WasMachtIhrHier(C_INFO)
{
	npc = GRD_275_Brueckenwache;
	nr = 1;
	condition = Info_GRD_275_WasMachtIhrHier_Condition;
	information = Info_GRD_275_WasMachtIhrHier_Info;
	//#Needs_Attention zbytocny permanent dialog - to by som zrusil
	permanent = 1;
//	description = "What are you doing here?";
//	description = "Was macht ihr hier?";
	description = "Co tady děláte?";
};

func int Info_GRD_275_WasMachtIhrHier_Condition()
{
	return 1;
};

func void Info_GRD_275_WasMachtIhrHier_Info()
{
//	AI_Output(other,self,"Info_GRD_275_WasMachtIhrHier_15_00"); //What are you doing here?
//	AI_Output(other,self,"Info_GRD_275_WasMachtIhrHier_15_00"); //Was macht ihr hier?
	AI_Output(other,self,"Info_GRD_275_WasMachtIhrHier_15_00"); //Co tady děláte?
//	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_01"); //What's it look like? We're guarding the bridge, of course!
//	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_01"); //Wonach sieht's denn aus? Wir bewachen die Brücke!
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_01"); //Co myslíš? Hlídáme tady přece most!
//	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_02"); //We make sure that no beasts cross the bridge.
//	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_02"); //Wir passen auf, dass keine Viecher über die Brücke kommen.
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_02"); //Dáváme pozor, aby se přes něj nedostaly ty bestie.
};

// *****************************************************************
// 								Tips
// *****************************************************************

instance Info_GRD_275_Tips(C_INFO)
{
	npc = GRD_275_Brueckenwache;
	nr = 1;
	condition = Info_GRD_275_Tips_Condition;
	information = Info_GRD_275_Tips_Info;
	//#Needs_Attention zbytocny permanent dialog - to by som zrusil
	important = 0;
	permanent = 1;
//	description = "Have you got any advice for me?";
//	description = "Hast du irgendwelche Tipps für mich?";
	description = "Neměl bys pro mě nějakou radu?";
};

func int Info_GRD_275_Tips_Condition()
{
	return 1;
};

func void Info_GRD_275_Tips_Info()
{
//	AI_Output(other,self,"Info_GRD_275_Tips_15_00"); //Have you got any advice for me?
//	AI_Output(other,self,"Info_GRD_275_Tips_15_00"); //Hast du irgendwelche Tipps für mich?
	AI_Output(other,self,"Info_GRD_275_Tips_15_00"); //Neměl bys pro mě nějakou radu?
//	AI_Output(self,other,"Info_GRD_275_Tips_06_01"); //Yeah. Don't go in the forest in your own.
//	AI_Output(self,other,"Info_GRD_275_Tips_06_01"); //Ja. Geh nich' allein in den Wald.
	AI_Output(self,other,"Info_GRD_275_Tips_06_01"); //Jistě. Nechoď sám do lesa.
//	AI_Output(self,other,"Info_GRD_275_Tips_06_02"); //Unless you're strong enough to fight off all the beasts.
//	AI_Output(self,other,"Info_GRD_275_Tips_06_02"); //Es sei denn, du bist stark genug, gegen die ganzen Viecher anzukommen.
	AI_Output(self,other,"Info_GRD_275_Tips_06_02"); //Dokud nebudeš natolik silný, abys přemohl ty bestie.
};

/*
	AI_Output(other,self,"Info_GRD_275_PreExit_15_02"); //Ich werde bestimmt nicht in den Minen für euch schuften.
	AI_Output(self,other,"Info_GRD_275_PreExit_06_03"); //In dem Fall bist du wohl unser zukünftiger Kollege? Dann sei schön lieb zu uns, wir sind nämlich morgen auch noch da, hehe.
	AI_Output(other,self,"Info_GRD_275_PreExit_15_04"); //Ich habe gehört es gibt auch noch andere Lager...
	AI_Output(self,other,"Info_GRD_275_PreExit_06_05"); //So wie du rumläufst schaffst Du es nicht mal bis dahin zu kommen. Und jetzt weg mit dir.
*/
