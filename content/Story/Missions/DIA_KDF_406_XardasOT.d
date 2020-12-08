//#####################################################################
//##
//##
//## KAPITEL 6
//##
//##
//#####################################################################
instance Info_Xardas_OT(C_INFO)
{
	npc = Kdf_406_OTXardas;
	condition = Info_Xardas_OT_Condition;
	information = Info_Xardas_OT_Info;
	important = 1;
	permanent = 0; 
};

func int Info_Xardas_OT_Condition()
{ 
	if (Npc_GetDistToWP(self,"TPL_331") < 1000)
	{ 
		return TRUE;
	}; 
};

func void Info_Xardas_OT_Info()
{
//	AI_Output(self,other,"Info_Xardas_OT_14_01"); //We don't have much time, so listen carefully!
//	AI_Output(self,other,"Info_Xardas_OT_14_01"); //Wir haben nicht viel Zeit, also höre mir genau zu!
	AI_Output(self,other,"Info_Xardas_OT_14_01"); //Nemáme moc času, tak poslouchej bedlivě!
//	AI_Output(other,self,"Info_Xardas_OT_15_02"); //How did you....
//	AI_Output(other,self,"Info_Xardas_OT_15_02"); //Wie kommst du ....
	AI_Output(other,self,"Info_Xardas_OT_15_02"); //Jak jsi...
//	AI_Output(self,other,"Info_Xardas_OT_14_03"); //The Sleeper is not far. I had to use all my powers to get here.
//	AI_Output(self,other,"Info_Xardas_OT_14_03"); //Der Schläfer ist nicht mehr weit. Ich musste all meine Kraft aufbringen, um zu dir zu gelangen.
	AI_Output(self,other,"Info_Xardas_OT_14_03"); //Spáč není daleko. Musel jsem použít všechny své síly, abych se sem dostal.
//	AI_Output(self,other,"Info_Xardas_OT_14_04"); //I have translated the Orcish prophecies and discovered what the five hearts are about.
//	AI_Output(self,other,"Info_Xardas_OT_14_04"); //Ich habe die orkischen Prophezeiungen übersetzt und herausgefunden, was es mit den fünf Herzen auf sich hat.
	AI_Output(self,other,"Info_Xardas_OT_14_04"); //Přeložil jsem Skřetí proroctví a objevil tajemství pěti srdcí.
//	AI_Output(self,other,"Info_Xardas_OT_14_05"); //The five hearts of the priests you defeated were placed in five shrines.
//	AI_Output(self,other,"Info_Xardas_OT_14_05"); //Die fünf Herzen der Priester, die du besiegt hast, wurden in fünf Schreine gelegt.
	AI_Output(self,other,"Info_Xardas_OT_14_05"); //Pět srdcí kněží, které jsi porazil, je uloženo v pěti relikviářích.
//	AI_Output(self,other,"Info_Xardas_OT_14_06"); //These shrines may be opened, but only the ancient blades carried by the priests can harm the hearts.
//	AI_Output(self,other,"Info_Xardas_OT_14_06"); //Diese Schreine können geöffnet werden, aber nur die alten Klingen, welche die Priester bei sich trugen, können die Herzen verletzen.
	AI_Output(self,other,"Info_Xardas_OT_14_06"); //Tyto relikviáře se dají otevřít, ale jen starobylá ostří, která kněží nosili u sebe, mohou poškodit srdce.
//	AI_Output(self,other,"Info_Xardas_OT_14_07"); //Now you must pierce the hearts with the five blades. Only thus will you be able to drive the Sleeper from this world.
//	AI_Output(self,other,"Info_Xardas_OT_14_07"); //Du musst die Herzen mit den fünf Klingen durchstoßen, nur so wirst du den Schläfer von dieser Welt verbannen können.
	AI_Output(self,other,"Info_Xardas_OT_14_07"); //Ty musíš ta srdce probodnout pěti ostřími. Jedině tak budeš moci odstranit Spáče z tohoto světa.
//	AI_Output(other,self,"Info_Xardas_OT_15_08"); //I understand!
//	AI_Output(other,self,"Info_Xardas_OT_15_08"); //Ich verstehe!
	AI_Output(other,self,"Info_Xardas_OT_15_08"); //Rozumím!
//	AI_Output(self,other,"Info_Xardas_OT_14_09"); //Hurry, for the awakening of the arch demon is nigh, the crazed Cor Kalom and his misled disciples are here.
//	AI_Output(self,other,"Info_Xardas_OT_14_09"); //Beeile dich, denn das Erwachen des Erzdämons ist nahe, der verrückte Cor Kalom und seine verblendeten Anhänger sind hier.
	AI_Output(self,other,"Info_Xardas_OT_14_09"); //Pospěš, procitnutí arcidémona se blíží, pomatený Cor Kalom se svými zbloudilými žáky je tu.
//	AI_Output(self,other,"Info_Xardas_OT_14_10"); //They have gathered in the hall of the Sleeper.
//	AI_Output(self,other,"Info_Xardas_OT_14_10"); //Sie haben sich in der Halle des Schläfers versammelt.
	AI_Output(self,other,"Info_Xardas_OT_14_10"); //Shromáždili se ve Spáčově sále.
//	AI_Output(other,self,"Info_Xardas_OT_15_11"); //I've bled enough! Nobody can stop me now!
//	AI_Output(other,self,"Info_Xardas_OT_15_11"); //Ich habe schon genug geblutet! Jetzt wird mich niemand mehr aufhalten!
	AI_Output(other,self,"Info_Xardas_OT_15_11"); //Už jsem krvácel dost! Teď mě nikdo nezastaví!
//	AI_Output(self,other,"Info_Xardas_OT_14_12"); //The might of the Sleeper is growing stronger and stronger, I cannot...
//	AI_Output(self,other,"Info_Xardas_OT_14_12"); //Die Macht des Schläfers wird immer stärker, ich kann nicht ...
	AI_Output(self,other,"Info_Xardas_OT_14_12"); //Spáčova moc sílí a sílí, nedokážu...
//	AI_Output(other,self,"Info_Xardas_OT_15_13"); //What's wrong with you?
//	AI_Output(other,self,"Info_Xardas_OT_15_13"); //Was ist los mit dir?
	AI_Output(other,self,"Info_Xardas_OT_15_13"); //Co se ti stalo?
//	AI_Output(self,other,"Info_Xardas_OT_14_14"); //I... must...
//	AI_Output(self,other,"Info_Xardas_OT_14_14"); //Ich ... muss ...
	AI_Output(self,other,"Info_Xardas_OT_14_14"); //Já... musím...

	Npc_ExchangeRoutine(self,"DRAINED"); 

	Log_CreateTopic(CH6_Sleeper,LOG_MISSION);
	Log_SetTopicStatus(CH6_Sleeper,LOG_RUNNING);
//	B_LogEntry(CH6_Sleeper,"The time has come. I must be just a short distance away from the Sleeper's resting place. Xardas suddenly appeared and gave me instructions for the fight. The five hearts of the undead Orc shamans are in shrines, I need to pierce them with the five blades I've got on me. This is the only way to defeat the Sleeper. Sounds quite simple ...");
//	B_LogEntry(CH6_Sleeper,"Es ist soweit. Ich muss mich kurz vor der Ruhestätte des Schläfers befinden. Xardas tauchte plötzlich auf und gab mir die letzten Instruktionen für den bevorstehenden Kampf. Die fünf Herzen der untoten Ork-Schamanen befinden sich in Schreinen und müssen von den fünf Klingen, die ich bei mir trage, durchstoßen werden. Nur so kann der Schläfer besiegt werden. Hört sich eigentlich ganz einfach an...");
	B_LogEntry(CH6_Sleeper,"Nadešel čas. Musím být v těsné blízkosti místa Spáčova odpočinku. Znenadání se objevil Xardas a dal mi pokyny k boji. V relikviáři je pět srdcí nemrtvých skřetích šamanů, která musím proklát pěti čepelemi, které mám při sobě. To je jediný způsob, jak porazit Spáče. Vypadá to prostě...");

	AI_StopProcessInfos(self);
}; 
