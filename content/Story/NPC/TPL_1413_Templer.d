instance TPL_1413_Templer (Npc_Default)
{
	//-------- primary data --------
	name = Name_Templer;
	npctype = NPCTYPE_GUARD;
	guild = GIL_TPL;
	level = 12;

	voice = 8;
	id = 1413;

	//-------- abilities --------
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody(self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 61 ,  1, TPL_ARMOR_L);

	B_Scale(self);
	Mdl_SetModelFatness(self,0);

	fight_tactic = FAI_HUMAN_STRONG;

	//-------- Talente --------

	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);

	//-------- inventory --------

	EquipItem(self,ItMw_2H_Sword_Light_01);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1413;
};

func void Rtn_start_1413()
{
	TA_GuardPassage (08,00,21,00,"PSI_TEMPLE_GUARD_01");
	TA_GuardPassage (21,00,08,00,"PSI_TEMPLE_GUARD_01");
};
