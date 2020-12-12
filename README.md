# G1-CZ-revision status: WIP
Gothic 1 CZ revision

Idea here is to revisist Czech translation of Gothic 1.

In order to figure out where there are issues with Czech translation I took English version of scripts published by NicoDE from WoG.de on 16.02.2017:
gothic1_scripts-1.08j_enu-rev2.zip
https://forum.worldofplayers.de/forum/threads/1488168-Gothic-1-08j-English-Scripts-%28review%29

German texts were taken directly from gothic_mod_developmentkit.zip.

Czech translation is mapped next to original German & English text, which are both commented out. This way we can quickly check what original text looked like: 

```c
instance DIA_Ricelord_Arbeit(C_INFO)
{
    npc = Bau_900_Ricelord;
    nr = 1;
    condition = DIA_Ricelord_Arbeit_Condition;
    information = DIA_Ricelord_Arbeit_Info;
    permanent = 0;
//  description = "Have you got work for me?";
//  description = "Hast du Arbeit für mich?";
    description = "Máš pro mě nějakou práci?";
};                       

func int DIA_Ricelord_Arbeit_Condition()
{
    if Npc_KnowsInfo(hero,DIA_Ricelord_Hello)
    && !Npc_KnowsInfo(hero,DIA_Lefty_First)
    && (LeftyDead == False)
    {
        return 1;
    };
};

func void DIA_Ricelord_Arbeit_Info()
{ 
//  AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00"); //Have you got work for me?
//  AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00"); //Hast du Arbeit für mich?
    AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00"); //Máš pro mě nějakou práci?
//  AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01"); //Go and see Lefty. He's usually to the right of the shed.
//  AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01"); //Geh zu Lefty. Er ist meistens hier vorne rechts neben der Scheune.
    AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01"); //Běž za Leem. Obvykle bývá napravo od haly.
};
```

### Plan ([X] - done, [ ] - WIP)
1. [ ] First step - review all C_INFO.description texts, AI_Output dialogs, B_LogEntry & PrintScreen entries
2. [ ] Then review all other czech texts (C_ITEM, SVM, etc.)
3. [ ] Fix all bugs (not only dialog related, e.g. ZS_Sleep routine, where NPC actually don't use beds and don't sleep)
