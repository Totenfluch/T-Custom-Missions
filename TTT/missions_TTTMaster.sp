#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Plock"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>
#include <scp>
#include <ttt>
#include <ttt_shop>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Mission: TTT Master", 
	author = PLUGIN_AUTHOR, 
	version = PLUGIN_VERSION, 
	url = "kniv.com.br"
};

char groupTag1[64] = "TTT Master";

int counter[MAXPLAYERS + 1];

char killTraitorUKey1[64] = "killtraitor_master_1";
char killTraitorUKey2[64] = "killtraitor_master_2";
char killTraitorUKey3[64] = "killtraitor_master_3";
char killTraitorUKey4[64] = "killtraitor_master_4";
char killTraitorUKey5[64] = "killtraitor_master_5";
char killTraitorUKey6[64] = "killtraitor_master_6";
char killTraitorUKey7[64] = "killtraitor_master_7";
char killTraitorUKey8[64] = "killtraitor_master_8";
char killTraitorUKey9[64] = "killtraitor_master_9";
char killTraitorUKey10[64] = "killtraitor_master_10";
char killTraitorUKey11[64] = "killtraitor_master_11";
char killTraitorUKey12[64] = "killtraitor_master_12";
char killTraitorUKey13[64] = "killtraitor_master_13";

char killInnocentUKey1[64] = "killinnocent_master_1";
char killInnocentUKey2[64] = "killinnocent_master_2";
char killInnocentUKey3[64] = "killinnocent_master_3";
char killInnocentUKey4[64] = "killinnocent_master_4";
char killInnocentUKey5[64] = "killinnocent_master_5";
char killInnocentUKey6[64] = "killinnocent_master_6";
char killInnocentUKey7[64] = "killinnocent_master_7";
char killInnocentUKey8[64] = "killinnocent_master_8";
char killInnocentUKey9[64] = "killinnocent_master_9";
char killInnocentUKey10[64] = "killinnocent_master_10";
char killInnocentUKey11[64] = "killinnocent_master_11";
char killInnocentUKey12[64] = "killinnocent_master_12";
char killInnocentUKey13[64] = "killinnocent_master_13";

char killDetectiveUKey1[64] = "killdetective_master_1";
char killDetectiveUKey2[64] = "killdetective_master_2";
char killDetectiveUKey3[64] = "killdetective_master_3";
char killDetectiveUKey4[64] = "killdetective_master_4";
char killDetectiveUKey5[64] = "killdetective_master_5";
char killDetectiveUKey6[64] = "killdetective_master_6";
char killDetectiveUKey7[64] = "killdetective_master_7";
char killDetectiveUKey8[64] = "killdetective_master_8";
char killDetectiveUKey9[64] = "killdetective_master_9";
char killDetectiveUKey10[64] = "killdetective_master_10";
char killDetectiveUKey11[64] = "killdetective_master_11";
char killDetectiveUKey12[64] = "killdetective_master_12";
char killDetectiveUKey13[64] = "killdetective_master_13";

char inspectUKey1[64] = "inspect_master_1";
char inspectUKey2[64] = "inspect_master_2";
char inspectUKey3[64] = "inspect_master_3";
char inspectUKey4[64] = "inspect_master_4";
char inspectUKey5[64] = "inspect_master_5";
char inspectUKey6[64] = "inspect_master_6";
char inspectUKey7[64] = "inspect_master_7";
char inspectUKey8[64] = "inspect_master_8";
char inspectUKey9[64] = "inspect_master_9";
char inspectUKey10[64] = "inspect_master_10";
char inspectUKey11[64] = "inspect_master_11";
char inspectUKey12[64] = "inspect_master_12";
char inspectUKey13[64] = "inspect_master_13";

char testPlayersUKey1[64] = "testplayers_master_1";
char testPlayersUKey2[64] = "testplayers_master_2";
char testPlayersUKey3[64] = "testplayers_master_3";
char testPlayersUKey4[64] = "testplayers_master_4";
char testPlayersUKey5[64] = "testplayers_master_5";
char testPlayersUKey6[64] = "testplayers_master_6";
char testPlayersUKey7[64] = "testplayers_master_7";
char testPlayersUKey8[64] = "testplayers_master_8";
char testPlayersUKey9[64] = "testplayers_master_9";
char testPlayersUKey10[64] = "testplayers_master_10";
char testPlayersUKey11[64] = "testplayers_master_11";
char testPlayersUKey12[64] = "testplayers_master_12";
char testPlayersUKey13[64] = "testplayers_master_13";

char testTraitorsUKey1[64] = "testtraitors_master_1";
char testTraitorsUKey2[64] = "testtraitors_master_2";
char testTraitorsUKey3[64] = "testtraitors_master_3";
char testTraitorsUKey4[64] = "testtraitors_master_4";
char testTraitorsUKey5[64] = "testtraitors_master_5";
char testTraitorsUKey6[64] = "testtraitors_master_6";
char testTraitorsUKey7[64] = "testtraitors_master_7";
char testTraitorsUKey8[64] = "testtraitors_master_8";
char testTraitorsUKey9[64] = "testtraitors_master_9";
char testTraitorsUKey10[64] = "testtraitors_master_10";
char testTraitorsUKey11[64] = "testtraitors_master_11";
char testTraitorsUKey12[64] = "testtraitors_master_12";
char testTraitorsUKey13[64] = "testtraitors_master_13";

char surviveUKey1[64] = "survive_master_1";
char surviveUKey2[64] = "survive_master_2";
char surviveUKey3[64] = "survive_master_3";
char surviveUKey4[64] = "survive_master_4";
char surviveUKey5[64] = "survive_master_5";
char surviveUKey6[64] = "survive_master_6";
char surviveUKey7[64] = "survive_master_7";
char surviveUKey8[64] = "survive_master_8";
char surviveUKey9[64] = "survive_master_9";
char surviveUKey10[64] = "survive_master_10";
char surviveUKey11[64] = "survive_master_11";
char surviveUKey12[64] = "survive_master_12";
char surviveUKey13[64] = "survive_master_13";

char airdropUKey1[64] = "airdrop_master_1";
char airdropUKey2[64] = "airdrop_master_2";
char airdropUKey3[64] = "airdrop_master_3";
char airdropUKey4[64] = "airdrop_master_4";
char airdropUKey5[64] = "airdrop_master_5";
char airdropUKey6[64] = "airdrop_master_6";
char airdropUKey7[64] = "airdrop_master_7";
char airdropUKey8[64] = "airdrop_master_8";
char airdropUKey9[64] = "airdrop_master_9";
char airdropUKey10[64] = "airdrop_master_10";
char airdropUKey11[64] = "airdrop_master_11";
char airdropUKey12[64] = "airdrop_master_12";
char airdropUKey13[64] = "airdrop_master_13";

char roundKillUKey1[64] = "roundkill_master_1";
char roundKillUKey2[64] = "roundkill_master_2";
char roundKillUKey3[64] = "roundkill_master_3";

public void OnPluginStart()
{
	Missions_RegisterMission(killTraitorUKey1, "I hate traitors Tier I", "Kill 5 traitors",5,200,"",groupTag1,true);
	Missions_RegisterMission(killTraitorUKey2, "I hate traitors Tier II", "Kill 10 traitors",10,400,killTraitorUKey1,groupTag1,true);
	Missions_RegisterMission(killTraitorUKey3, "I hate traitors Tier III", "Kill 25 traitors",25,1000,killTraitorUKey2,groupTag1,true);
	Missions_RegisterMission(killTraitorUKey4, "I hate traitors Tier IV", "Kill 50 traitors",50,2000,killTraitorUKey3,groupTag1,true);
	Missions_RegisterMission(killTraitorUKey5, "I hate traitors Tier V", "Kill 100 traitors",100,4000,killTraitorUKey4,groupTag1,true);
	Missions_RegisterMission(killTraitorUKey6, "I hate traitors Tier VI", "Kill 150 traitors",150,6000,killTraitorUKey5,groupTag1,true);
	Missions_RegisterMission(killTraitorUKey7, "I hate traitors Tier VII", "Kill 250 traitors",250,10000,killTraitorUKey6,groupTag1,true);
	Missions_RegisterMission(killTraitorUKey8, "I hate traitors Tier VIII", "Kill 500 traitors",500,20000,killTraitorUKey7,groupTag1,true);
	Missions_RegisterMission(killTraitorUKey9, "I hate traitors Tier IX", "Kill 750 traitors",750,30000,killTraitorUKey8,groupTag1,true);
	Missions_RegisterMission(killTraitorUKey10, "I hate traitors Tier X", "Kill 1000 traitors",1000,40000,killTraitorUKey9,groupTag1,true);
	Missions_RegisterMission(killTraitorUKey11, "I hate traitors Tier XI", "Kill 2500 traitors",2500,100000,killTraitorUKey10,groupTag1,true);
	Missions_RegisterMission(killTraitorUKey12, "I hate traitors Tier XII", "Kill 5000 traitors",5000,200000,killTraitorUKey11,groupTag1,true);
	Missions_RegisterMission(killTraitorUKey13, "I hate traitors Tier XIII", "Kill 10000 traitors",10000,400000,killTraitorUKey12,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey1, "I hate innocents Tier I", "Kill 5 innocents as a traitor",5,200,"",groupTag1,true);
	Missions_RegisterMission(killInnocentUKey2, "I hate innocents Tier II", "Kill 10 innocents as a traitor",10,400,killInnocentUKey1,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey3, "I hate innocents Tier III", "Kill 25 innocents as a traitor",25,1000,killInnocentUKey2,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey4, "I hate innocents Tier IV", "Kill 50 innocents as a traitor",50,2000,killInnocentUKey3,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey5, "I hate innocents Tier V", "Kill 100 innocents as a traitor",100,4000,killInnocentUKey4,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey6, "I hate innocents Tier VI", "Kill 150 innocents as a traitor",150,6000,killInnocentUKey5,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey7, "I hate innocents Tier VII", "Kill 250 innocents as a traitor",250,10000,killInnocentUKey6,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey8, "I hate innocents Tier VIII", "Kill 500 innocents as a traitor",500,20000,killInnocentUKey7,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey9, "I hate innocents Tier IX", "Kill 750 innocents as a traitor",750,30000,killInnocentUKey8,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey10, "I hate innocents Tier X", "Kill 1000 innocents as a traitor",1000,40000,killInnocentUKey9,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey11, "I hate innocents Tier XI", "Kill 2500 innocents as a traitor",2500,100000,killInnocentUKey10,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey12, "I hate innocents Tier XII", "Kill 5000 innocents as a traitor",5000,200000,killInnocentUKey11,groupTag1,true);
	Missions_RegisterMission(killInnocentUKey13, "I hate innocents Tier XIII", "Kill 10000 innocents as a traitor",10000,400000,killInnocentUKey12,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey1, "I hate detectives Tier I", "Kill 5 detectives as a traitor",5,200,"",groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey2, "I hate detectives Tier II", "Kill 10 detectives as a traitor",10,400,killDetectiveUKey1,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey3, "I hate detectives Tier III", "Kill 25 detectives as a traitor",25,1000,killDetectiveUKey2,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey4, "I hate detectives Tier IV", "Kill 50 detectives as a traitor",50,2000,killDetectiveUKey3,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey5, "I hate detectives Tier V", "Kill 100 detectives as a traitor",100,4000,killDetectiveUKey4,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey6, "I hate detectives Tier VI", "Kill 150 detectives as a traitor",150,6000,killDetectiveUKey5,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey7, "I hate detectives Tier VII", "Kill 250 detectives as a traitor",250,10000,killDetectiveUKey6,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey8, "I hate detectives Tier VIII", "Kill 500 detectives as a traitor",500,20000,killDetectiveUKey7,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey9, "I hate detectives Tier IX", "Kill 750 detectives as a traitor",750,30000,killDetectiveUKey8,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey10, "I hate detectives Tier X", "Kill 1000 detectives as a traitor",1000,40000,killDetectiveUKey9,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey11, "I hate detectives Tier XI", "Kill 2500 detectives as a traitor",2500,100000,killDetectiveUKey1,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey12, "I hate detectives Tier XII", "Kill 5000 detectives as a traitor",5000,200000,killDetectiveUKey1,groupTag1,true);
	Missions_RegisterMission(killDetectiveUKey13, "I hate detectives Tier XIII", "Kill 10000 detectives as a traitor",10000,400000,killDetectiveUKey1,groupTag1,true);
	Missions_RegisterMission(inspectUKey1, "Inspection time Tier I", "Inspect 5 bodies",5,200,"",groupTag1,true);
	Missions_RegisterMission(inspectUKey2, "Inspection time Tier II", "Inspect 10 bodies",10,400,inspectUKey1,groupTag1,true);
	Missions_RegisterMission(inspectUKey3, "Inspection time Tier III", "Inspect 25 bodies",25,1000,inspectUKey2,groupTag1,true);
	Missions_RegisterMission(inspectUKey4, "Inspection time Tier IV", "Inspect 50 bodies",50,2000,inspectUKey3,groupTag1,true);
	Missions_RegisterMission(inspectUKey5, "Inspection time Tier V", "Inspect 100 bodies",100,4000,inspectUKey4,groupTag1,true);
	Missions_RegisterMission(inspectUKey6, "Inspection time Tier VI", "Inspect 150 bodies",150,6000,inspectUKey5,groupTag1,true);
	Missions_RegisterMission(inspectUKey7, "Inspection time Tier VII", "Inspect 250 bodies",250,10000,inspectUKey6,groupTag1,true);
	Missions_RegisterMission(inspectUKey8, "Inspection time Tier VIII", "Inspect 500 bodies",500,20000,inspectUKey7,groupTag1,true);
	Missions_RegisterMission(inspectUKey9, "Inspection time Tier IX", "Inspect 750 bodies",750,30000,inspectUKey8,groupTag1,true);
	Missions_RegisterMission(inspectUKey10, "Inspection time Tier X", "Inspect 1000 bodies",1000,40000,inspectUKey9,groupTag1,true);
	Missions_RegisterMission(inspectUKey11, "Inspection time Tier XI", "Inspect 2500 bodies",2500,100000,inspectUKey10,groupTag1,true);
	Missions_RegisterMission(inspectUKey12, "Inspection time Tier XII", "Inspect 5000 bodies",5000,200000,inspectUKey11,groupTag1,true);
	Missions_RegisterMission(inspectUKey13, "Inspection time Tier XIII", "Inspect 10000 bodies",10000,400000,inspectUKey12,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey1, "Patience test Tier I", "Test (taser) 5 players",5,200,"",groupTag1,true);
	Missions_RegisterMission(testPlayersUKey2, "Patience test Tier II", "Test (taser) 10 players",10,400,testPlayersUKey1,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey3, "Patience test Tier III", "Test (taser) 25 players",25,1000,testPlayersUKey2,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey4, "Patience test Tier IV", "Test (taser) 50 players",50,2000,testPlayersUKey3,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey5, "Patience test Tier V", "Test (taser) 100 players",100,4000,testPlayersUKey4,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey6, "Patience test Tier VI", "Test (taser) 150 players",150,6000,testPlayersUKey5,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey7, "Patience test Tier VII", "Test (taser) 250 players",250,10000,testPlayersUKey6,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey8, "Patience test Tier VIII", "Test (taser) 500 players",500,20000,testPlayersUKey7,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey9, "Patience test Tier IX", "Test (taser) 750 players",750,30000,testPlayersUKey8,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey10, "Patience test Tier X", "Test (taser) 1000 players",1000,40000,testPlayersUKey9,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey11, "Patience test Tier XI", "Test (taser) 2500 players",2500,100000,testPlayersUKey10,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey12, "Patience test Tier XII", "Test (taser) 5000 players",5000,200000,testPlayersUKey11,groupTag1,true);
	Missions_RegisterMission(testPlayersUKey13, "Patience test Tier XIII", "Test (taser) 10000 players",10000,400000,testPlayersUKey12,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey1, "Traitor test Tier I", "Test (taser) 5 traitors",5,200,"",groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey2, "Traitor test Tier II", "Test (taser) 10 traitors",10,400,testTraitorsUKey1,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey3, "Traitor test Tier III", "Test (taser) 25 traitors",25,1000,testTraitorsUKey2,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey4, "Traitor test Tier IV", "Test (taser) 50 traitors",50,2000,testTraitorsUKey3,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey5, "Traitor test Tier V", "Test (taser) 100 traitors",100,4000,testTraitorsUKey4,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey6, "Traitor test Tier VI", "Test (taser) 150 traitors",150,6000,testTraitorsUKey5,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey7, "Traitor test Tier VII", "Test (taser) 250 traitors",250,10000,testTraitorsUKey6,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey8, "Traitor test Tier VIII", "Test (taser) 500 traitors",500,20000,testTraitorsUKey7,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey9, "Traitor test Tier IX", "Test (taser) 750 traitors",750,30000,testTraitorsUKey8,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey10, "Traitor test Tier X", "Test (taser) 1000 traitors",1000,40000,testTraitorsUKey9,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey11, "Traitor test Tier XI", "Test (taser) 2500 traitors",2500,100000,testTraitorsUKey10,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey12, "Traitor test Tier XII", "Test (taser) 5000 traitors",5000,200000,testTraitorsUKey11,groupTag1,true);
	Missions_RegisterMission(testTraitorsUKey13, "Traitor test Tier XIII", "Test (taser) 10000 traitors",10000,400000,testTraitorsUKey12,groupTag1,true);
	Missions_RegisterMission(surviveUKey1, "Survival Tier I", "Survive 5 rounds as innocent",5,200,"",groupTag1,true);
	Missions_RegisterMission(surviveUKey2, "Survival Tier II", "Survive 10 rounds as innocent",10,400,surviveUKey1,groupTag1,true);
	Missions_RegisterMission(surviveUKey3, "Survival Tier III", "Survive 25 rounds as innocent",25,1000,surviveUKey2,groupTag1,true);
	Missions_RegisterMission(surviveUKey4, "Survival Tier IV", "Survive 50 rounds as innocent",50,2000,surviveUKey3,groupTag1,true);
	Missions_RegisterMission(surviveUKey5, "Survival Tier V", "Survive 100 rounds as innocent",100,4000,surviveUKey4,groupTag1,true);
	Missions_RegisterMission(surviveUKey6, "Survival Tier VI", "Survive 150 rounds as innocent",150,6000,surviveUKey5,groupTag1,true);
	Missions_RegisterMission(surviveUKey7, "Survival Tier VII", "Survive 250 rounds as innocent",250,10000,surviveUKey6,groupTag1,true);
	Missions_RegisterMission(surviveUKey8, "Survival Tier VIII", "Survive 500 rounds as innocent",500,20000,surviveUKey7,groupTag1,true);
	Missions_RegisterMission(surviveUKey9, "Survival Tier IX", "Survive 750 rounds as innocent",750,30000,surviveUKey8,groupTag1,true);
	Missions_RegisterMission(surviveUKey10, "Survival Tier X", "Survive 1000 rounds as innocent",1000,40000,surviveUKey9,groupTag1,true);
	Missions_RegisterMission(surviveUKey11, "Survival Tier XI", "Survive 2500 rounds as innocent",2500,100000,surviveUKey10,groupTag1,true);
	Missions_RegisterMission(surviveUKey12, "Survival Tier XII", "Survive 5000 rounds as innocent",5000,200000,surviveUKey11,groupTag1,true);
	Missions_RegisterMission(surviveUKey13, "Survival Tier XIII", "Survive 10000 rounds as innocent",10000,400000,surviveUKey12,groupTag1,true);
	Missions_RegisterMission(airdropUKey1, "Airdrop pickup Tier I", "Pickup 5 Airdrops",5,200,"",groupTag1,true);
	Missions_RegisterMission(airdropUKey2, "Airdrop pickup Tier II", "Pickup 10 Airdrops",10,400,airdropUKey1,groupTag1,true);
	Missions_RegisterMission(airdropUKey3, "Airdrop pickup Tier III", "Pickup 25 Airdrops",25,1000,airdropUKey2,groupTag1,true);
	Missions_RegisterMission(airdropUKey4, "Airdrop pickup Tier IV", "Pickup 50 Airdrops",50,2000,airdropUKey3,groupTag1,true);
	Missions_RegisterMission(airdropUKey5, "Airdrop pickup Tier V", "Pickup 100 Airdrops",100,4000,airdropUKey4,groupTag1,true);
	Missions_RegisterMission(airdropUKey6, "Airdrop pickup Tier VI", "Pickup 150 Airdrops",150,6000,airdropUKey5,groupTag1,true);
	Missions_RegisterMission(airdropUKey7, "Airdrop pickup Tier VII", "Pickup 250 Airdrops",250,10000,airdropUKey6,groupTag1,true);
	Missions_RegisterMission(airdropUKey8, "Airdrop pickup Tier VIII", "Pickup 500 Airdrops",500,20000,airdropUKey7,groupTag1,true);
	Missions_RegisterMission(airdropUKey9, "Airdrop pickup Tier IX", "Pickup 750 Airdrops",750,30000,airdropUKey8,groupTag1,true);
	Missions_RegisterMission(airdropUKey10, "Airdrop pickup Tier X", "Pickup 1000 Airdrops",1000,40000,airdropUKey9,groupTag1,true);
	Missions_RegisterMission(airdropUKey11, "Airdrop pickup Tier XI", "Pickup 2500 Airdrops",2500,100000,airdropUKey10,groupTag1,true);
	Missions_RegisterMission(airdropUKey12, "Airdrop pickup Tier XII", "Pickup 5000 Airdrops",5000,200000,airdropUKey11,groupTag1,true);
	Missions_RegisterMission(airdropUKey13, "Airdrop pickup Tier XIII", "Pickup 10000 Airdrops",10000,400000,airdropUKey12,groupTag1,true);
	Missions_RegisterMission(roundKillUKey1, "Death to the traitors Tier I", "Kill 2 traitors in one round",2,1000,"",groupTag1,true);
	Missions_RegisterMission(roundKillUKey2, "Death to the traitors Tier II", "Kill 4 traitors in one round",4,2000,roundKillUKey1,groupTag1,true);
	Missions_RegisterMission(roundKillUKey3, "Death to the traitors Tier III", "Kill 6 traitors in one round",5,4000,roundKillUKey2,groupTag1,true);

	HookEvent("player_death", onPlayerDeath);
}

public void TTT_OnRoundStart(int innocents, int traitors, int detective) {
	for (int i = 0; i < MAXPLAYERS + 1; i++) {
		counter[i] = 0;
	}
}

public Action onPlayerDeath(Event event, const char[] name, bool dontBroadcast) {
	int attacker = GetClientOfUserId(event.GetInt("attacker"));
	int victim = GetClientOfUserId(GetEventInt(event, "userid"));
	if (!isValidClient(attacker) || !isValidClient(victim))
		return;
	char weaponName[64];
	GetClientWeapon(attacker, weaponName, sizeof(weaponName));
	if (attacker != victim && TTT_GetClientRole(victim) == TTT_TEAM_TRAITOR) {
		Mission_IncrementMissionProgress(attacker, killTraitorUKey1);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey2);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey3);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey4);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey5);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey6);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey7);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey8);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey9);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey10);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey11);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey12);
		Mission_IncrementMissionProgress(attacker, killTraitorUKey13);
	} else if (attacker != victim && TTT_GetClientRole(attacker) == TTT_TEAM_TRAITOR && TTT_GetClientRole(victim) == TTT_TEAM_INNOCENT) {
		Mission_IncrementMissionProgress(attacker, killInnocentUKey1);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey2);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey3);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey4);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey5);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey6);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey7);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey8);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey9);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey10);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey11);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey12);
		Mission_IncrementMissionProgress(attacker, killInnocentUKey13);
	} else if (attacker != victim && TTT_GetClientRole(attacker) == TTT_TEAM_TRAITOR && TTT_GetClientRole(victim) == TTT_TEAM_DETECTIVE) {
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey1);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey2);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey3);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey4);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey5);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey6);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey7);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey8);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey9);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey10);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey11);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey12);
		Mission_IncrementMissionProgress(attacker, killDetectiveUKey13);
	}
	
	if (attacker != victim && TTT_GetClientRole(victim) == TTT_TEAM_TRAITOR) {
		++counter[attacker];
		if (counter[attacker]== 2)
			Mission_IncrementMissionProgress(attacker, roundKillUKey1);
		if (counter[attacker]== 4)
			Mission_IncrementMissionProgress(attacker, roundKillUKey2);
		if (counter[attacker]== 6)
			Mission_IncrementMissionProgress(attacker, roundKillUKey3);
	}
}

public void TTT_OnTased(int attacker, int victim) {
	Mission_IncrementMissionProgress(attacker, testPlayersUKey1);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey2);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey3);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey4);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey5);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey6);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey7);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey8);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey9);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey10);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey11);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey12);
	Mission_IncrementMissionProgress(attacker, testPlayersUKey13);
	
	if (TTT_GetClientRole(victim) == TTT_TEAM_TRAITOR) {
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey1);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey2);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey3);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey4);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey5);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey6);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey7);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey8);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey9);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey10);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey11);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey12);
		Mission_IncrementMissionProgress(attacker, testTraitorsUKey13);
	}
}

/*TTT_OnCreditsChanged_Pre(int client, int oldcredits, int &newcredits) {
	if (isValidClient(client)) {
		if (newcredits > oldcredits) {
			int amount = newcredits - oldcredits;
			
		}
	}
}*/

public void TTT_OnBodyFound(int attacker, int victim, const char[] deadPlayer) {
	Mission_IncrementMissionProgress(attacker, inspectUKey1);
	Mission_IncrementMissionProgress(attacker, inspectUKey2);
	Mission_IncrementMissionProgress(attacker, inspectUKey3);
	Mission_IncrementMissionProgress(attacker, inspectUKey4);
	Mission_IncrementMissionProgress(attacker, inspectUKey5);
	Mission_IncrementMissionProgress(attacker, inspectUKey6);
	Mission_IncrementMissionProgress(attacker, inspectUKey7);
	Mission_IncrementMissionProgress(attacker, inspectUKey8);
	Mission_IncrementMissionProgress(attacker, inspectUKey9);
	Mission_IncrementMissionProgress(attacker, inspectUKey10);
	Mission_IncrementMissionProgress(attacker, inspectUKey11);
	Mission_IncrementMissionProgress(attacker, inspectUKey12);
	Mission_IncrementMissionProgress(attacker, inspectUKey13);
}

public void OnAirdropPickup(int attacker) {
	Mission_IncrementMissionProgress(attacker, airdropUKey1);
	Mission_IncrementMissionProgress(attacker, airdropUKey2);
	Mission_IncrementMissionProgress(attacker, airdropUKey3);
	Mission_IncrementMissionProgress(attacker, airdropUKey4);
	Mission_IncrementMissionProgress(attacker, airdropUKey5);
	Mission_IncrementMissionProgress(attacker, airdropUKey6);
	Mission_IncrementMissionProgress(attacker, airdropUKey7);
	Mission_IncrementMissionProgress(attacker, airdropUKey8);
	Mission_IncrementMissionProgress(attacker, airdropUKey9);
	Mission_IncrementMissionProgress(attacker, airdropUKey10);
	Mission_IncrementMissionProgress(attacker, airdropUKey11);
	Mission_IncrementMissionProgress(attacker, airdropUKey12);
	Mission_IncrementMissionProgress(attacker, airdropUKey13);
}

public void TTT_OnRoundEnd(int winner) {
	for (int i = 0; i < MAXPLAYERS + 1; i++) {
		if (isValidClient(i) && IsPlayerAlive(i) && TTT_GetClientRole(i) == TTT_TEAM_INNOCENT) {
			Mission_IncrementMissionProgress(i, surviveUKey1);
			Mission_IncrementMissionProgress(i, surviveUKey2);
			Mission_IncrementMissionProgress(i, surviveUKey3);
			Mission_IncrementMissionProgress(i, surviveUKey4);
			Mission_IncrementMissionProgress(i, surviveUKey5);
			Mission_IncrementMissionProgress(i, surviveUKey6);
			Mission_IncrementMissionProgress(i, surviveUKey7);
			Mission_IncrementMissionProgress(i, surviveUKey8);
			Mission_IncrementMissionProgress(i, surviveUKey9);
			Mission_IncrementMissionProgress(i, surviveUKey10);
			Mission_IncrementMissionProgress(i, surviveUKey11);
			Mission_IncrementMissionProgress(i, surviveUKey12);
			Mission_IncrementMissionProgress(i, surviveUKey13);
		}
	}
}

stock bool isValidClient(int client) {
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}

stock bool isUserInAir(int client)
{
	if (!(GetEntityFlags(client) & FL_ONGROUND))
		return true;
	else
		return false;
}

public void OnPluginEnd() {
	Missions_Finalize();
}

