// ************************ EXIT **************************

instance DIA_SLD_709_Cord_Exit(C_INFO)
{
	npc = SLD_709_Cord;
	nr = 999;
	condition = DIA_SLD_709_Cord_Exit_Condition;
	information = DIA_SLD_709_Cord_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_SLD_709_Cord_Exit_Condition()
{
	return 1;
};

func void DIA_SLD_709_Cord_Exit_Info()
{
	AI_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
TRAIN ANGEBOT
------------------------------------------------------------------------ */

instance SLD_709_Cord_TRAINOFFER(C_INFO)
{
	npc = SLD_709_Cord;
	condition = SLD_709_Cord_TRAINOFFER_Condition;
	information = SLD_709_Cord_TRAINOFFER_Info;
	important = 0;
	permanent = 0;
//	description = "I want to improve my handling of one-handed weapons.";
//	description = "Ich will besser mit Einhandwaffen umgehen können.";
	description = "Chci se zlepšit v ovládání jednoručních zbraní.";
};

func int SLD_709_Cord_TRAINOFFER_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_1H) < 2)
	{
		return 1;
	};

	return 0;
};

func void SLD_709_Cord_TRAINOFFER_Info()
{
//	AI_Output(other,self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //I want to improve my handling of one-handed weapons.
//	AI_Output(other,self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Ich will besser mit Einhandwaffen umgehen können.
	AI_Output(other, self, "SLD_709_Cord_TRAINOFFER_Info_15_01"); //Chci se zlepšit v ovládání jednoručních zbraní.
//	AI_Output(self,other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Of course. It'll cost you, though. I want 30 ore.
//	AI_Output(self,other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Natürlich. Kostet aber 'ne Kleinigkeit. 30 Erz will ich sehen.
	AI_Output(self, other, "SLD_709_Cord_TRAINOFFER_Info_14_02"); //Jistě. Bude tě to ovšem něco stát. Chci 30 nugetů.

	Log_CreateTopic(GE_TeacherNC, LOG_NOTE);
//	B_LogEntry(GE_TeacherNC,"Cord, the mercenary, can teach me to fight with ONE-HANDED WEAPONS. During the daytime, he can be found on the rocky plateau by the lake.");
//	B_LogEntry(GE_TeacherNC,"Cord der Söldner, kann mich im Kampf mit EINHÄNDERN schulen. Er ist tagsüber auf dem Felsplateau am See zu finden.");
	B_LogEntry(GE_TeacherNC, "Žoldák Cord mě může naučit bojovat s JEDNORUČNÍMI ZBRANĚMI. Přes den ho můžu najít na skalnaté plošině u jezera.");
};

/*------------------------------------------------------------------------
EINHANDKAMPF DIE ERSTE LEHRSTUNDE
------------------------------------------------------------------------ */

instance SLD_709_Cord_TRAIN(C_INFO)
{
	npc = SLD_709_Cord;
	condition = SLD_709_Cord_TRAIN_Condition;
	information = SLD_709_Cord_TRAIN_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,30);
//	description = B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,30);
	description = B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1, 30);
};

func int SLD_709_Cord_TRAIN_Condition()
{
	if ((Npc_KnowsInfo(hero, SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0))
	{
		return 1;
	};

	return 0;
};

func void SLD_709_Cord_TRAIN_Info()
{
//	AI_Output(other,self,"SLD_709_Cord_TRAIN_Info_15_00"); //I want to improve my handling of one-handed weapons.
//	AI_Output(other,self,"SLD_709_Cord_TRAIN_Info_15_00"); //Ich will besser mit Einhandwaffen umgehen können.
	AI_Output(other, self, "SLD_709_Cord_TRAIN_Info_15_00"); //Chci se zlepšit v ovládání jednoručních zbraní.

	if (Npc_HasItems(hero, ItMiNugget) >= 30)
	{
		if (B_GiveSkill(hero, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_01"); //That's a good decision! Before you can improve your technique, you'll have to learn how to hold the weapon right.
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_01"); //Gute Entscheidung! Um deine Technik zu verbessern, musst du erst einmal lernen, deine Waffe richtig zu halten.
			AI_Output(self, other, "SLD_709_Cord_TRAIN_14_01"); //Dobrá volba! Abys mohl začít zlepšovat techniku, musíš se nejdříve naučit zbraň správně držet.
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_02"); //Beginners often tend to hold one-handed weapons with both hands. Now, you'd better not even start getting into that habit, it'd only get in the way.
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_02"); //Anfänger neigen dazu, Einhandwaffen mit beiden Händen zu halten. Mit so was fängst du am besten gar nicht erst an, das behindert dich nur.
			AI_Output(self, other, "SLD_709_Cord_TRAIN_14_02"); //Začátečníci mají tendenci držet jednoruční zbraň oběma rukama. Tímto způsobem rozhodně nezačínej, bylo by to jen na obtíž.
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_03"); //Hold the weapon with one hand, blade up, and keep swinging it.
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_03"); //Halt die Waffe mit einer Hand, Klinge nach oben, und dann immer schön schwingen lassen.
			AI_Output(self, other, "SLD_709_Cord_TRAIN_14_03"); //Drž zbraň v jedné ruce, čepelí vzhůru a nech ji mírně pohupovat. #NEEDS_ATTENTION
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_04"); //You'll have to learn to harmonize your weapon's swing with your own movements. That'll make you faster in the attack.
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_04"); //Du musst lernen, den Schwung deiner Waffe mit deinen Bewegungen in Einklang zu bringen, dann kannst du schneller zuschlagen.
			AI_Output(self, other, "SLD_709_Cord_TRAIN_14_04"); //Musíš se naučit sladit pohyb zbraně s pohybem svého těla. Pak můžeš rychleji útočit.
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_05"); //if you keep in mind what I've taught you, your fights will be more elegant and a lot faster in future.
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_05"); //Wenn du dich an meine Anweisungen hältst, wirst du in Zukunft eleganter und vor allem schneller kämpfen.
			AI_Output(self, other, "SLD_709_Cord_TRAIN_14_05"); //Pokud se budeš držet mých rad, budeš v budoucnu bojovat elegantněji a rychleji.
			B_PracticeCombat("NC_WATERFALL_TOP01");
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_06"); //Oh yeah, one more thing: Some hits cause more damage than others! As a beginner, you don't stand much of a chance of making critical hits.
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_06"); //Ach, und noch was: Manche Treffer richten mehr Schaden an als andere! Als Anfänger hast du nur eine geringe Chance, solche kritischen Treffer zu landen.
			AI_Output(self, other, "SLD_709_Cord_TRAIN_14_06"); //Ah, ještě jednu věc. Některé údery působí větší škodu než ostatní. Jako začátečníkovi se ti často nepovede takové údery zasadit.
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_07"); //But the further you progress, the better you get.
//			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_07"); //Aber je weiter du fortschreitest, desto besser wird diese Fähigkeit.
			AI_Output(self, other, "SLD_709_Cord_TRAIN_14_07"); //Ale čím více budeš trénovat, tím větší šanci budeš mít.
			B_GiveInvItems(hero, self, ItMiNugget, 30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
//		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //You don't own enough ore.
//		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Du besitzt nicht genügend Erz.
		AI_Output(self, other, "KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nemáš dost rudy.
	};
};

/*------------------------------------------------------------------------
EINHANDKAMPF DIE ZWEITE LEHRSTUNDE
------------------------------------------------------------------------ */

instance SLD_709_Cord_TRAINAGAIN(C_INFO)
{
	npc = SLD_709_Cord;
	condition = SLD_709_Cord_TRAINAGAIN_Condition;
	information = SLD_709_Cord_TRAINAGAIN_Info;
	important = 0;
	permanent = 1;
//	description = B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,50);
//	description = B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,50);
	description = B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2, 50);
};

func int SLD_709_Cord_TRAINAGAIN_Condition()
{
	if ((Npc_KnowsInfo(hero, SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_1H) < 2))
	{
		return 1;
	};

	return 0;
};

func void SLD_709_Cord_TRAINAGAIN_Info()
{
//	AI_Output(other,self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Teach me how to handle one-handed weapons more skillfully.
//	AI_Output(other,self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Zeig mir, wie ich im Umgang mit Waffen noch besser werden kann.
	AI_Output(other, self, "SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Nauč mě ještě lépe ovládat jednoruční zbraně.

	if (Npc_HasItems(hero, ItMiNugget) >= 50)
	{
		if (B_GiveSkill(hero, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
//			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Okay, you know the basics. Holding the weapon lower down will put more force into your first strike.
//			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Na gut, die Grundkenntnisse hast du ja schon. Wenn du die Waffe gesenkt hältst, dann kannst du direkt mehr Wucht in deinen ersten Schlag legen.
			AI_Output(self, other, "SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Dobrá, základy znáš. Když podržíš zbraň níž, budeš moci vložit do svého prvního švihu více síly.
//			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Use the swing, remember? Now you need to use your body more. When you've struck twice, spin around. That'll confuse the opponent and put you in an excellent position.
//			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Nutze den Schwung, weißt du noch? Gut, der nächste Schritt ist, dass du deinen Körper mehr einsetzt. Wenn du zweimal geschlagen hast, drehe dich um die eigene Achse, damit überrascht du den Gegner und bist in einer optimalen Position.
			AI_Output(self, other, "SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Využívej švihu, vzpomínáš? Dobře, dalším krokem je pohyb těla. Po druhém úderu se otoč kolem své vlastní osy, abys zmátl protivníka a získal optimální pozici.
//			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //Then bring your blade across from right to left once more.
//			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //Dann ziehst du deine Klinge noch einmal quer von rechts nach links.
			AI_Output(self, other, "SLD_709_Cord_TRAINAGAIN_Info_14_04"); //Poté veď čepel šikmo zprava doleva.
			B_PracticeCombat("NC_WATERFALL_TOP01");
//			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //And back to the front. Don't forget: practice makes perfect. So, get going and become a real master of the art of one-handed fighting.
//			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //Und wieder von vorne. Vergiss nicht, Übung macht den Meister. Also, geh jetzt und werde ein wahrer Meister des einhändigen Kampfes.
			AI_Output(self, other, "SLD_709_Cord_TRAINAGAIN_Info_14_05"); //A znovu kupředu. Nezapomeň, cvičení dělá mistra. Tak běž a staň se mistrem jednoručních zbraní.
			B_GiveInvItems(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
//		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //You don't own enough ore.
//		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Du besitzt nicht genügend Erz.
		AI_Output(self, other, "KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nemáš dost rudy.
	};
};
