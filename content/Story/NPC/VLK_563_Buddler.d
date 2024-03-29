instance VLK_563_Buddler (Npc_Default)
{
	//-------- primary data --------

	name = Name_Buddler;
	npctype = npctype_mine_ambient;
	guild = GIL_VLK;
	level = 4;

	voice = 3;
	id = 563;

	//-------- abilities --------

	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	//				body mesh, head mesh, hairmesh, face-tex, hair-tex, skin
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Fighter", 73,  1, VLK_ARMOR_L);

	B_Scale(self);
	Mdl_SetModelFatness(self,0);

	fight_tactic = FAI_HUMAN_COWARD;

	//-------- Talents  --------

	//-------- inventory --------

	EquipItem(self,ItMw_1h_Nailmace_01);
	CreateInvItem(self,ItMwPickaxe);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItFoBeer);
	CreateInvItem(self,ItLsTorch);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_563;
};

func void Rtn_start_563()
{
	TA_PickOre  (21,00,04,00,"OM_PICKORE_11B");
	TA_PickOre (04,00,21,00,"OM_PICKORE_11B");
};

