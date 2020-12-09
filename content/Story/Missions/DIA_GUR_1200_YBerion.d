// ************************************************************
// 							EXIT 
// ************************************************************

instance Info_Yberion_EXIT(C_INFO)
{
	npc = GUR_1200_Yberion;
	nr = 999;
	condition = Info_Yberion_EXIT_Condition;
	information = Info_Yberion_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};                       

func int Info_Yberion_EXIT_Condition()
{
	return 1;
};

func void Info_Yberion_EXIT_Info()
{ 
	AI_StopProcessInfos(self);
};

//############################### KAPITEL 1 ###############################

instance DIA_YBerion_Wache(C_INFO)
{
	npc = GUR_1200_Yberion;
	nr = 1;
	condition = DIA_YBerion_Wache_Condition;
	information = DIA_YBerion_Wache_Info;
	permanent = 1;
	important = 1;
};                       

func int DIA_YBerion_Wache_Condition()
{
	if (Kapitel == 1)
	{
		return 1;
	};
};

func void DIA_YBerion_Wache_Info()
{ 
//	AI_Output(self,other,"DIA_YBerion_Wache_12_00"); //What are you doin' here? Who let you in? Guards!
//	AI_Output(self,other,"DIA_YBerion_Wache_12_00"); //Was machst du hier? Wer hat dich hereingelassen? Wache!
	AI_Output(self,other,"DIA_YBerion_Wache_12_00"); //Co tady děláš? Kdo tě sem pustil? Stráže!
	B_IntruderAlert(self,other);
	AI_StopProcessInfos(self);
};

//############################### Kennen? ###############################

instance DIA_YBerion_Kennen(C_INFO)
{
	npc = GUR_1200_Yberion;
	nr = 1;
	condition = DIA_YBerion_Kennen_Condition;
	information = DIA_YBerion_Kennen_Info;
	permanent = 0;
//	description = "Greetings, Master Y'Berion.";
//	description = "Sei gegrüßt, Meister Y'Berion.";
	description = "Buď pozdraven, mistře Y´Berione.";
};                       

func int DIA_YBerion_Kennen_Condition()
{
	if (Kapitel == 2)
	{
		return 1;
	};
};

func void DIA_YBerion_Kennen_Info()
{ 
//	AI_Output(other,self,"DIA_YBerion_Kennen_15_00"); //Greetings, Master Y'Berion.
//	AI_Output(other,self,"DIA_YBerion_Kennen_15_00"); //Sei gegrüßt, Meister Y'Berion.
	AI_Output(other,self,"DIA_YBerion_Kennen_15_00"); //Buď pozdraven, mistře Y´Berione.
//	AI_Output(self,other,"DIA_YBerion_Kennen_12_01"); //Ah! I know your face!
//	AI_Output(self,other,"DIA_YBerion_Kennen_12_01"); //Ah! Du kommst mir bekannt vor!
	AI_Output(self,other,"DIA_YBerion_Kennen_12_01"); //Ach! Tuhle tvář znám!
//	AI_Output(other,self,"DIA_YBerion_Kennen_15_02"); //Impossible. We've never met before.
//	AI_Output(other,self,"DIA_YBerion_Kennen_15_02"); //Unmöglich. Wir haben uns noch nie gesehen.
	AI_Output(other,self,"DIA_YBerion_Kennen_15_02"); //Vyloučeno. Nikdy jsme se neviděli.
//	AI_Output(self,other,"DIA_YBerion_Kennen_12_03"); //But I thought... Well - what do you want?
//	AI_Output(self,other,"DIA_YBerion_Kennen_12_03"); //Und ich dachte ... Nun gut - was willst du?
	AI_Output(self,other,"DIA_YBerion_Kennen_12_03"); //Ale přece... Dobře - co chceš?
};

//############################### KAPITEL 2 ###############################

// ------------------------------ BringFocus ---------------------------
instance Info_YBerion_BringFocus(C_INFO)
{
	npc = GUR_1200_Yberion;
	condition = Info_YBerion_BringFocus_Condition;
	information = Info_YBerion_BringFocus_Info;
	permanent = 1;
//	description = "I heard you were looking for something.";
//	description = "Mir kam zu Ohren, du suchst etwas";
	description = "Slyšel jsem, že něco hledáš.";
};

func int Info_YBerion_BringFocus_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_YBerion_Kennen))
	&& (Npc_GetTrueGuild(hero) != GIL_NONE )
	&& (YBerion_BringFocus != LOG_RUNNING )
	&& (YBerion_BringFocus != LOG_SUCCESS )
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Info()
{
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01"); //I heard you were looking for something.
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01"); //Mir kam zu Ohren, du suchst etwas.
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01"); //Slyšel jsem, že něco hledáš.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02"); //That's right. We need a magical focus.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02"); //Das ist richtig. Wir brauchen einen magischen Fokus.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02"); //To je pravda. Potřebujeme kouzelné ohnisko.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03"); //We sent the novice Nyras to collect the focus. But he hasn't come back yet.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03"); //Wir haben den Novizen Nyras losgeschickt, um den Fokus zu holen. Doch er ist bisher nicht zurückgekehrt.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03"); //Poslali jsme novice Nyrase, aby ho přinesl. Ještě se ale nevrátil.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04"); //You could check up for me what has happened!
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04"); //Du könntest für mich nachsehen, was passiert ist!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04"); //Mohl bys pro mě vypátrat, co se stalo.

	Info_ClearChoices(Info_YBerion_BringFocus);
	Info_AddChoice(Info_YBerion_BringFocus,DIALOG_BACK , Info_YBerion_BringFocus_BACK);
//	Info_AddChoice(Info_YBerion_BringFocus,"I'll bring the focus back!", Info_YBerion_BringFocus_OK);
//	Info_AddChoice(Info_YBerion_BringFocus,"Ich werde den Fokus zurückbringen!", Info_YBerion_BringFocus_OK);
	Info_AddChoice(Info_YBerion_BringFocus,"Přinesu to ohnisko zpátky!", Info_YBerion_BringFocus_OK);
//	Info_AddChoice(Info_YBerion_BringFocus,"Where shall I begin to search?", Info_YBerion_BringFocus_WO);
//	Info_AddChoice(Info_YBerion_BringFocus,"Wo soll ich suchen?", Info_YBerion_BringFocus_WO);
	Info_AddChoice(Info_YBerion_BringFocus,"Kde mám začít pátrat?", Info_YBerion_BringFocus_WO);
//	Info_AddChoice(Info_YBerion_BringFocus,"Why is the focus so important?", Info_YBerion_BringFocus_FOKUS);
//	Info_AddChoice(Info_YBerion_BringFocus,"Was hat es mit dem Fokus auf sich?", Info_YBerion_BringFocus_FOKUS);
	Info_AddChoice(Info_YBerion_BringFocus,"Proč je to ohnisko tak důležité?", Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK()
{
	Info_ClearChoices(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK()
{
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01"); //I'll bring the focus back!
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01"); //Ich werde den Fokus zurückbringen!
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01"); //Přinesu to ohnisko zpátky!
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02"); //Take this map. The location of the focus is recorded on it.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02"); //Nimm diese Karte hier, dort ist der Ort des Fokus verzeichnet.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02"); //Vem si tuhle mapu! Je na ní vyznačena poloha ohniska.

	B_Story_BringFirstFocus();

//	B_LogEntry(CH2_Focus,"Y'Berion has sent the novice Nyras out to collect the magic focus, but he hasn't returned yet. The Guru gave me a map with the way to the focus.");
//	B_LogEntry(CH2_Focus,"Y'Berion hat den Novizen Nyras ausgesand, um den magischen Fokus zu holen, doch er kam bisher nicht zurück. Der Guru gab mir eine Karte, auf der der Weg zum Fokus eingezeichnet ist.");
	B_LogEntry(CH2_Focus,"Y´Berion vyslal novice Nyrase, aby přinesl magické ohnisko, ten se však ještě nevrátil. Guru mi dal mapu s vyznačenou cestou k ohnisku.");
};

func void Info_YBerion_BringFocus_WO()
{
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01"); //Where shall I begin to search?
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01"); //Wo soll ich suchen?
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01"); //Kde mám začít pátrat?
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02"); //Leave the Camp, turn right and go up to the tall cliff. Go beyond the forest until you can see the sea. There you'll find the focus.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02"); //Wenn du das Lager verlässt, wende dich nach rechts und steige hinauf zur großen Klippe. Dort, hinter dem Wald, wo du das Meer sehen kannst, wirst du den Fokus finden.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02"); //Vyjdi z tábora, dej se doprava a pak nahoru na vysoký útes. Pak pokračuj lesem, dokud neuvidíš moře. Tam to ohnisko najdeš.
};

func void Info_YBerion_BringFocus_FOKUS()
{
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01"); //Why is the focus so important?
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01"); //Was hat es mit dem Fokus auf sich?
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01"); //Proč je to ohnisko tak důležité?
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02"); //It is a magical object which can concentrate our spiritual powers.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02"); //Es ist ein magischer Gegenstand, der unsere geistigen Kräfte vereinigen wird.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02"); //Je to magický předmět, který soustřeďuje naši duchovní sílu.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03"); //It is one of the five focus stones used by the mages to erect the Barrier.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03"); //Es handelt sich dabei um einen der fünf Fokussteine, den die Magier zum Errichten der Barriere benutzt haben.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03"); //Je to jeden z pěti ohniskových kamenů, které použili mágové ke vztyčení Bariéry.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04"); //In a vision I saw that we need to use the power of the focus.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04"); //In einer Vision sah ich, dass wir uns die Kraft eines Fokus zu Nutze machen müssen.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04"); //V jedné vidině jsem viděl, jak využíváme sílu toho ohniska.
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05"); //Sounds like quite an interesting vision.
//	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05"); //War wohl eine ziemlich spannende Vision.
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05"); //To byla docela zajímavá vidina.
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06"); //My vision was a sign from the Sleeper. We can reach him with the focus!
//	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06"); //Meine Vision war ein Zeichen vom Schläfer. Mit dem Fokus können wir ihn erreichen!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06"); //Moje vidina byla znamením od Spáče. Můžeme k němu dojít pomocí toho ohniska!
};

// ------------------------------ RUNNING ----------------------------------
instance Info_YBerion_BringFocus_RUNNING(C_INFO)
{
	npc = GUR_1200_Yberion;
	nr = 1;
	condition = Info_YBerion_BringFocus_RUNNING_Condition;
	information = Info_YBerion_BringFocus_RUNNING_Info;
	permanent = 0;
//	description = "I still haven't found the focus.";
//	description = "Ich habe den Fokus immer noch nicht gefunden.";
	description = "Pořád to ohnisko nemůžu najít.";
};                       

func int Info_YBerion_BringFocus_RUNNING_Condition()
{
	if ( YBerion_BringFocus == LOG_RUNNING ) && ( !Npc_HasItems(hero,Focus_1 ))
	{
		return TRUE;
	};
};

func void Info_YBerion_BringFocus_RUNNING_Info()
{ 
//	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01"); //I still haven't found the focus.
//	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01"); //Ich habe den Fokus immer noch nicht gefunden.
	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01"); //Pořád to ohnisko nemůžu najít.
//	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02"); //Then search on. The Sleeper will guide the way.
//	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02"); //Dann suche weiter. Der Schläfer wird dir den Weg weisen.
	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02"); //Tak hledej. Spáč tě povede.
};

// ------------------------------ SUCCESS ----------------------------------
instance Info_YBerion_BringFocus_Success(C_INFO)
{
	npc = GUR_1200_Yberion;
	nr = 1;
	condition = Info_YBerion_BringFocus_Success_Condition;
	information = Info_YBerion_BringFocus_Success_Info;
	permanent = 0;
//	description = "I've found the focus.";
//	description = "Ich habe den Fokus gefunden";
	description = "Našel jsem to ohnisko.";
};                       

func int Info_YBerion_BringFocus_Success_Condition()
{
	if ( YBerion_BringFocus == LOG_RUNNING ) && (Npc_HasItems(hero,Focus_1 ))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Success_Info()
{ 
//	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01"); //I've found the focus.
//	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01"); //Ich habe den Fokus gefunden.
	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01"); //Našel jsem to ohnisko.
//	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02"); //Excellent. You have done us a great favor.
//	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02"); //Hervorragend. Du hast uns einen großen Dienst erwiesen.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02"); //Výborně. Nesmírně jsi nám pomohl.
//	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03"); //Now take the focus back to Cor Kalom. He'll know what needs to be done.
//	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03"); //Bring nun den Fokus zu Cor Kalom. Er wird wissen, was zu tun ist.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03"); //Teď dej to ohnisko zpátky Corovi Kalomovi. Ten ví, co je třeba udělat.
	if (Kalom_TalkedTo == FALSE)
	{
//		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04"); //Where can I find this Cor Kalom?
//		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04"); //Wo kann ich diesen Cor Kalom finden?
		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04"); //Kde najdu toho Cora Kaloma?
//		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05"); //He spends most of his time in the alchemy lab in the upper section of the catwalks.
//		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05"); //Er hält sich die meiste Zeit im Alchemielabor auf der oberen Stegebene auf.
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05"); //Většinu času tráví ve své alchymistické dílně v horní sekci můstků.
//		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06"); //Talk to Lester at the entrance to the Camp... he often guides newcomers around the Camp.
//		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06"); //Frag Lester am Eingang des Lagers ... Er führt öfter Neulinge herum.
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06"); //Zeptej se u vchodu do tábora Lestera... ten často provádí nováčky po táboru.
//		B_LogEntry(CH2_Focus,"Y'Berion told me to take the focus to another guru called Cor Kalom. This Cor Kalom spends the whole day in the alchemy lab."); 
//		B_LogEntry(CH2_Focus,"Y'Berion hat mich beauftragt, den Fokus zu einem anderen Guru namens 'Cor Kalom' zu bringen. Dieser Cor Kalom soll sich den ganzen Tag im Alchemielabor aufhalten."); 
		B_LogEntry(CH2_Focus,"Y´Berion mi řekl, abych to ohnisko předal dalšímu guru jménem Cor Kalom. Cor Kalom tráví celé dny ve své alchymistické dílně."); 
	}
	else
	{
//		B_LogEntry(CH2_Focus,"Y'Berion told me to take the focus to Cor Kalom. What a pleasure to meet this very charming person again.");
//		B_LogEntry(CH2_Focus,"Y'Berion hat mich beauftragt, den Fokus zu Cor Kalom zu bringen. Welch eine 'Freude' diesen überaus liebenswürdigen Menschen wieder zu treffen.");
		B_LogEntry(CH2_Focus,"Y´Berion mi řekl, abych to ohnisko předal  Cor Kalomovi. Jaké potěšení, shledat se zase s tím příjemným chlapíkem.");
	};

	Tpl_1406_Templer.aivar[AIV_PASSGATE] = TRUE; //Türwache vor dem Labor

	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP(XP_BringFocusToYBerion);
};

// ------------------------------ NYRAS ----------------------------------
instance Info_YBerion_NYRAS(C_INFO)
{
	npc = GUR_1200_Yberion;
	nr = 1;
	condition = Info_YBerion_NYRAS_Condition;
	information = Info_YBerion_NYRAS_Info;
	permanent = 0;
//	description = "The novice Nyras has gone mad!";
//	description = "Der Novize Nyras hat den Verstand verloren!";
	description = "Novic Nyras zešílel!";
};                       

func int Info_YBerion_NYRAS_Condition()
{
	if (Npc_HasItems(hero,Focus_1 ))
	{
		return 1;
	};
};

func void Info_YBerion_NYRAS_Info()
{ 
//	AI_Output(other,self,"Info_YBerion_NYRAS_15_01"); //The novice Nyras has gone mad!
//	AI_Output(other,self,"Info_YBerion_NYRAS_15_01"); //Der Novize Nyras hat den Verstand verloren!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_01"); //Novic Nyras zešílel!
//	AI_Output(other,self,"Info_YBerion_NYRAS_15_02"); //He said that the Sleeper had talked to him and chosen him as his only servant!
//	AI_Output(other,self,"Info_YBerion_NYRAS_15_02"); //Er faselte davon, dass der Schläfer zu ihm gesprochen habe und ihn als einzigen Diener auserwählte!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_02"); //Říkal, že mluvil se Spáčem, který si ho zvolil za svého pomocníka!
//	AI_Output(other,self,"Info_YBerion_NYRAS_15_03"); //Then he attacked and tried to kill me!
//	AI_Output(other,self,"Info_YBerion_NYRAS_15_03"); //Dann griff er mich sogar an und wollte mich töten!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_03"); //Pak mě napadl a pokusil se mě zabít!
//	AI_Output(self,other,"Info_YBerion_NYRAS_12_04"); //The might of the Sleeper is so vast that unprepared souls despair over it.
//	AI_Output(self,other,"Info_YBerion_NYRAS_12_04"); //Die Macht des Schläfers ist so gewaltig, dass sie unvorbereitete Seelen in Verwirrung stürzen kann.
	AI_Output(self,other,"Info_YBerion_NYRAS_12_04"); //Spáčova moc je tak nesmírná, že nepřipravené duše přivede k zoufalství!
//	AI_Output(self,other,"Info_YBerion_NYRAS_12_05"); //Only we Gurus, in our years of meditation, have achieved the spiritual strength to bear the voice of the almighty Sleeper!
//	AI_Output(self,other,"Info_YBerion_NYRAS_12_05"); //Nur wir Gurus haben durch jahrelanges Meditieren die seelische Stärke gewonnen, die Stimme des allmächtigen Schläfers zu ertragen!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_05"); //Jenom my, Guru, jsme léty strávenými v meditacích dosáhli takové duchovní síly, která dokáže unést sílu hlasu všemohoucího Spáče!
};

// ------------------------------ BELOHNUNG ----------------------------------
instance GUR_1200_Yberion_EARN(C_INFO)
{
	npc = GUR_1200_Yberion;
	condition = GUR_1200_Yberion_EARN_Condition;
	information = GUR_1200_Yberion_EARN_Info;
	important = 0;
	permanent = 0;
//	description = "What about some kind of reward?"; 
//	description = "Wie siehts mit einer Belohnung aus?"; 
	description = "A co takhle nějaká odměna?"; 
};

func int GUR_1200_Yberion_EARN_Condition()
{ 
	if ( YBerion_BringFocus == LOG_SUCCESS) && (Npc_GetTrueGuild(hero)!= GIL_NOV ) && ( C_IsChapter(2))
	{
		return 1;
	};

};
func void GUR_1200_Yberion_EARN_Info()
{
//	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01"); //What about some kind of reward?
//	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01"); //Wie sieht's mit einer Belohnung aus?
	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01"); //A co takhle nějakou odměnu?
//	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02"); //Since you're not a member of our Brotherhood, I will reward you.
//	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02"); //Da du kein Bruder unserer Gemeinschaft bist, werde ich dich entlohnen.
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02"); //Protože nejsi členem našeho Bratrstva, odměním tě.
//	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03"); //Take this amulet as a sign of my gratitude.
//	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03"); //Nimm dieses Amulett als Zeichen meiner Dankbarkeit.
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03"); //Vezmi si tento amulet na znamení mé vděčnosti.
	CreateInvItem(self,Schutzamulett_Feuer);
	B_GiveInvItems(self,hero,Schutzamulett_Feuer,1);
};  

//############################### KAPITEL 3 ###############################
//SPIELER HAT DIE HEILKRÄUTER ZU COR ANGAR GEBRACHT
//YBERION WACHT AUF UND STIRBT
/*
instance GUR_1200_Yberion_LASTWORDS(C_INFO)
{
	npc = GUR_1200_Yberion;
	condition = GUR_1200_Yberion_LASTWORDS_Condition;
	information = GUR_1200_Yberion_LASTWORDS_Info;
	important = 1;
	permanent = 0;

};

func int GUR_1200_Yberion_LASTWORDS_Condition()
{ 
	if (Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success))
	{
		return 1;
	};

};
func void GUR_1200_Yberion_LASTWORDS_Info()
{
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_01"); //Das Ende...der Schläfer...ich sah...IHN!
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_02"); //Wer...?...du bist es, gut. Hör mir zu....
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_03"); //Du darfst den Schläfer nicht wecken,... die Wassermagier, ...
	AI_Output(other,self,"GUR_1200_Yberion_LASTWORDS_Info_15_04"); //Was ist mit den Wassermagiern?
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_05"); //Du musst zu den Wassermagiern gehen. Sie werden es schaffen, hier rauszukommen.
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_06"); //Der Schläfer...Ich sah ihn. Er ist ein ...ein ....Dämon!
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_07"); //Wenn du die Barriere noch immer vernichten willst,... geh zum Neuen Lager. Berichte ihnen vom Fokus. Sag ihnen...
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_08"); //...sag ihnen das wir herausgefunden haben, wie sich die Foki aufladen lassen, sie sollen...sollen die Barriere vernichten......ihr müsst ....
//	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_09"); //...das Böse....darf nicht erwachen ....
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_09"); //...das Böse....darf nicht erwachen .... 

};  
// ------------------------------  ----------------------------------
*/
