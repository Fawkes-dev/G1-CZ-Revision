// ********************************
// 				EXIT
// ********************************

instance DIA_Torlof_EXIT(C_INFO)
{
	npc = Sld_737_Torlof;
	nr = 999;
	condition = DIA_Torlof_EXIT_Condition;
	information = DIA_Torlof_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int DIA_Torlof_EXIT_Condition()
{
	return 1;
};

func void DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Torlof_Hallo(C_INFO)
{
	npc = Sld_737_Torlof;
	nr = 1;
	condition = DIA_Torlof_Hallo_Condition;
	information = DIA_Torlof_Hallo_Info;
	permanent = 0;
//	description = "Who are you?";
//	description = "Wer bist du?";
	description = "Kdo jsi?";
};                       

func int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

func void DIA_Torlof_Hallo_Info()
{
//	AI_Output(other,self,"DIA_Torlof_Hallo_15_00"); //Who are you?
//	AI_Output(other,self,"DIA_Torlof_Hallo_15_00"); //Wer bist du?
	AI_Output(other,self,"DIA_Torlof_Hallo_15_00"); //Kdo jsi?
//	AI_Output(self,other,"DIA_Torlof_Hallo_04_01"); //I'm Torlof.
//	AI_Output(self,other,"DIA_Torlof_Hallo_04_01"); //Ich bin Torlof.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_01"); //Jsem Torlof.
//	AI_Output(self,other,"DIA_Torlof_Hallo_04_02"); //I was involved in a mutiny as mate of a royal warship.
//	AI_Output(self,other,"DIA_Torlof_Hallo_04_02"); //Hab als Maat auf einem der königlichen Kriegsschiffe bei ner Meuterei mitgemacht.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_02"); //Jako námořník jsem se zúčastnil vzpoury na královské válečné lodi.
//	AI_Output(self,other,"DIA_Torlof_Hallo_04_03"); //It wasn't such a good idea. The greater part of the crew was on the captain's side.
//	AI_Output(self,other,"DIA_Torlof_Hallo_04_03"); //Kam nicht so gut an. Der größte Teil der Mannschaft war auf der Seite des Käptn's.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_03"); //Moc se to nepovedlo. Velká část posádky stála na straně kapitána.
//	AI_Output(self,other,"DIA_Torlof_Hallo_04_04"); //That's how I came to be here.
//	AI_Output(self,other,"DIA_Torlof_Hallo_04_04"); //Seitdem bin ich hier.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_04"); //Proto jsem tady.
};

// ********************************
// 				Mitmachen
// ********************************

instance DIA_Torlof_Mitmachen(C_INFO)
{
	npc = Sld_737_Torlof;
	nr = 2;
	condition = DIA_Torlof_Mitmachen_Condition;
	information = DIA_Torlof_Mitmachen_Info;
	permanent = 1;
//	description = "I'd like to join you.";
//	description = "Ich will bei euch mitmachen.";
	description = "Rád bych se k vám přidal.";
};                       

func int DIA_Torlof_Mitmachen_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	|| (Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return 1;
	};
};

func void DIA_Torlof_Mitmachen_Info()
{
//	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_00"); //I'd like to join you.
//	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_00"); //Ich will bei euch mitmachen.
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_00"); //Rád bych se k vám přidal.
//	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_01"); //Lee won't take you on until you get real good, I'm telling you now.
//	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_01"); //Bevor du nicht einiges auf'm Kasten hast, wird Lee dich nicht nehmen, das sag ich dir gleich.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_01"); //Pokud nebudeš mít nějaké eso v rukávu, Lee tě nepřijme, to ti říkám rovnou.
//	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_02"); //And until then you'd better stay on good terms with Lares and his crowd.
//	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_02"); //Und bis du besser bist, solltest du dich mit Lares und seinen Jungs gut stellen.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_02"); //A než se zlepšíš, měl bys být za dobře s Laresem a jeho lidmi.
//	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_03"); //You want some advice, boy: Steal something important from the Old Camp or the Old Mine.
//	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_03"); //Wenn du nen Tipp willst, Junge: Klau was wichtiges aus dem Alten Lager oder der Alten Mine.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_03"); //Chlapče, jestli chceš dobrou radu: Ukradni něco cenného ze Starého tábora nebo ze Starého dolu.
//	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_04"); //As soon as the boys notice that you're against Gomez, you won't have any more trouble here.
//	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_04"); //Wenn die Jungs hier merken, dass du gegen Gomez bist, hast du hier keine Probleme mehr.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_04"); //Jakmile chlapi zjistí, že jsi proti Gomezovi, nebudeš tu už mít žádné problémy.
//	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_05"); //And how do I do that?
//	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_05"); //Und wie stelle ich das an?
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_05"); //A jak to mám udělat?
//	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_06"); //You need to win their TRUST - and then you can rip 'em off!
//	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_06"); //Du mußt ihr VERTRAUEN gewinnen - und dann haust du sie über's Ohr!
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_06"); //Potřebuješ si získat jejich DŮVĚRU - a pak se je obereš!
};

/*

// ********************************
// 				PERM
// ********************************

instance DIA_Torlof_PERM(C_INFO)
{
	npc = Sld_737_Torlof;
	nr = 3;
	condition = DIA_Torlof_PERM_Condition;
	information = DIA_Torlof_PERM_Info;
	permanent = 1;
	description = "Was kannst du mir über dieses Lager sagen?";
};                       

func int DIA_Torlof_PERM_Condition()
{
	return 1;
};

func void DIA_Torlof_PERM_Info()
{
	AI_Output(other,self,"DIA_Torlof_PERM_15_00"); //Was kannst du mir über dieses Lager sagen?
	AI_Output(self,other,"DIA_Torlof_PERM_04_01"); //Ist wie auf'm Piratenschiff, Junge. Solange ab und zu ein fetter Fischzug gegen Gomez drin ist, sind die Banditen zufrieden.
	AI_Output(self,other,"DIA_Torlof_PERM_04_02"); //Wenn sie kein Erz mehr haben, um sich in der Kneipe vollaufen zu lassen, gibt's ne Menge Schlägereien.
};

*/

