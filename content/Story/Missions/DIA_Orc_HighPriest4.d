// *********************** PRIESTER 4 ***********************

instance Info_HighPriest4(C_INFO)
{
	npc = ORC_Priest_4;
	nr = 1;
	condition = Info_HighPriest4_Condition;
	information = Info_HighPriest4_Info;
	important = 1;
	permanent = 0;
};

func int Info_HighPriest4_Condition()
{
	return 1;
};

func void Info_HighPriest4_Info()
{
	B_SelectWeapon(self, other);
	AI_SetWalkMode(self, NPC_WALK);
	AI_GotoNpc(self, other);

//	AI_Output(self,other,"Info_HighPriest4_17_01"); //YOOUUUUR LOOONG TRAAAVEL WILL BE OOVEEEER!!!
//	AI_Output(self,other,"Info_HighPriest4_17_01"); //ZUEEEENDEEEE IST DEEEIN LANGER WEEEG!!!
	AI_Output(self, other, "Info_HighPriest4_17_01"); //TVOOOJE DLOOUHÁÁÁ CEESTAA JEEE UU KOONCEEE!!!
//	AI_Output(self,other,"Info_HighPriest4_17_02"); //YOOOUUR MOOORTAAAL BOOODDY WILL BUURN!!!
//	AI_Output(self,other,"Info_HighPriest4_17_02"); //BREEENNEEEN SOLL DEINEEEE STEEEERBLICHEEEE HÜLLEEEE!!!
	AI_Output(self, other, "Info_HighPriest4_17_02"); //TVÉÉÉ SMRRTEELNÉÉÉ TĚĚLOOO SHOOŘÍÍÍ!!!
//	AI_Output(other,self,"Info_HighPriest4_15_03"); //Now I don't really think that's such a good idea!
//	AI_Output(other,self,"Info_HighPriest4_15_03"); //Das wollen wir doch mal schön bleiben lassen!
	AI_Output(other, self, "Info_HighPriest4_15_03"); //Teď už si přestávám myslet, že to byl dobrý nápad!

//	B_LogEntry(CH4_EnterTemple,"Varrag-Ruuushk, one of the undead shamans of the invocation of the Sleeper, is crossing my way. He won't stop me, I'll see to that!");
//	B_LogEntry(CH4_EnterTemple,"Varrag-Ruuushk, einer der untoten Schamanen der Schläfer-Herbeirufung kreuzt nun meinen Weg. Er wird mich nicht aufhalten, dafür sorge ich!");
	B_LogEntry(CH4_EnterTemple, "Varrag-Ruuushk, jeden z pěti nemrtvých šamanů vzývajících Spáče, mi zkřížil cestu. Nezastaví mě, tím jsme si jist!");
	AI_StopProcessInfos(self);

	Npc_SetAttitude(self, ATT_HOSTILE);
	Npc_SetTempAttitude(self, ATT_HOSTILE);
};
