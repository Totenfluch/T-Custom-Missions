#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "walde"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>
#include <creditzones>


#pragma newdecls required

public Plugin myinfo = 
{
	name = "Mission Map Master", 
	author = PLUGIN_AUTHOR, 
	description = "Complete Maps", 
	version = PLUGIN_VERSION, 
	url = ""
};

char groupKey[64] = "Map Completion";

char genericMapMaster1[64] = "map_master_1_150_3Ztk44FpK";
char genericMapMasterName1[256] = "Map Master 1";
char genericMapMasterDescription1[1024] = "Complete 1 Map (Easy, Medium or Hard)";
char preGenericMapMaster1[64] = "";

char genericMapMaster2[64] = "map_master_5_500_rWUMKAUt";
char genericMapMasterName2[256] = "Map Master 2";
char genericMapMasterDescription2[1024] = "Complete 5 Maps (Easy, Medium or Hard)";
char preGenericMapMaster2[64] = "map_master_1_150_3Ztk44FpK";

char genericMapMaster3[64] = "map_master_10_1000_ZLbPnFFj";
char genericMapMasterName3[256] = "Map Master 3";
char genericMapMasterDescription3[1024] = "Complete 10 Maps (Easy, Medium or Hard)";
char preGenericMapMaster3[64] = "map_master_5_500_rWUMKAUt";

char genericMapMaster4[64] = "map_master_20_5000_rWUMKAUt";
char genericMapMasterName4[256] = "Map Master 4";
char genericMapMasterDescription4[1024] = "Complete 20 Maps (Easy, Medium or Hard)";
char preGenericMapMaster4[64] = "map_master_10_1000_ZLbPnFFj";

char genericMapMaster5[64] = "map_master_50_10000_rWUMASDFHUt";
char genericMapMasterName5[256] = "Map Master 5";
char genericMapMasterDescription5[1024] = "Complete 50 Maps (Easy, Medium or Hard)";
char preGenericMapMaster5[64] = "map_master_20_5000_rWUMKAUt";

char genericMapMaster6[64] = "map_master_150_20000_rWQWERABSDFHUt";
char genericMapMasterName6[256] = "Map Master 6";
char genericMapMasterDescription6[1024] = "Complete 150 Maps (Easy, Medium or Hard)";
char preGenericMapMaster6[64] = "map_master_50_10000_rWUMASDFHUt";

char genericMapMaster7[64] = "map_master_500_35000_rWPASDFHVDFHUt";
char genericMapMasterName7[256] = "Map Master 5";
char genericMapMasterDescription7[1024] = "Complete 500 Maps (Easy, Medium or Hard)";
char preGenericMapMaster7[64] = "map_master_150_20000_rWQWERABSDFHUt";



char easyMapMaster1[64] = "easy_map_master_5_300_23HQmHD9";
char easyMapMasterName1[256] = "Easy Map Master";
char easyMapMasterNameDescription1[1024] = "Complete 5 Easy Maps";
char preEasyMapMaster1[64] = "";

char easyMapMaster2[64] = "easy_map_master_15_1000_23HQmHD9";
char easyMapMasterName2[256] = "Easy Map Master II";
char easyMapMasterNameDescription2[1024] = "Complete 15 Easy Maps";
char preEasyMapMaster2[64] = "easy_map_master_5_300_23HQmHD9";

char easyMapMaster3[64] = "easy_map_master_30_3500_23HQmHD9";
char easyMapMasterName3[256] = "Easy Map Master III";
char easyMapMasterNameDescription3[1024] = "Complete 30 Easy Maps";
char preEasyMapMaster3[64] = "easy_map_master_15_1000_23HQmHD9";



char mediumMapMaster1[64] = "medium_map_master_5_1000_v2VZza9T";
char mediumMapMasterName1[256] = "Medium Map Master";
char mediumMapMasterNameDescription1[1024] = "Complete 5 Medium Maps";
char preMediumMapMaster1[64] = "";

char mediumMapMaster2[64] = "medium_map_master_15_3000_v2VZza9T";
char mediumMapMasterName2[256] = "Medium Map Master II";
char mediumMapMasterNameDescription2[1024] = "Complete 15 Medium Maps";
char preMediumMapMaster2[64] = "medium_map_master_5_1000_v2VZza9T";

char mediumMapMaster3[64] = "medium_map_master_30_7500_v2VZza9T";
char mediumMapMasterName3[256] = "Medium Map Master III";
char mediumMapMasterNameDescription3[1024] = "Complete 30 Medium Maps";
char preMediumMapMaster3[64] = "medium_map_master_15_3000_v2VZza9T";



char hardMapMaster1[64] = "hard_map_master_5_2500_7q8t39DR";
char hardyMapMasterName1[256] = "Hard Map Master";
char gardMapMasterNameDescription1[1024] = "Complete 5 Hard Maps";
char preHardMapMaster1[64] = "";

char hardMapMaster2[64] = "hard_map_master_15_5000_7q8asdfa9DR";
char hardyMapMasterName2[256] = "Hard Map Master II";
char gardMapMasterNameDescription2[1024] = "Complete 15 Hard Maps";
char preHardMapMaster2[64] = "hard_map_master_5_2500_7q8t39DR";

char hardMapMaster3[64] = "hard_map_master_30_12500_7q8tasdfas";
char hardyMapMasterName3[256] = "Hard Map Master III";
char gardMapMasterNameDescription3[1024] = "Complete 30 Hard Maps";
char preHardMapMaster3[64] = "hard_map_master_15_5000_7q8asdfa9DR";

public void OnPluginStart()
{
	Missions_RegisterMission(genericMapMaster1, genericMapMasterName1, genericMapMasterDescription1, 1, 150, preGenericMapMaster1, groupKey, true);
	Missions_RegisterMission(genericMapMaster2, genericMapMasterName2, genericMapMasterDescription2, 5, 500, preGenericMapMaster2, groupKey, true);
	Missions_RegisterMission(genericMapMaster3, genericMapMasterName3, genericMapMasterDescription3, 10, 1000, preGenericMapMaster3, groupKey, true);
	Missions_RegisterMission(genericMapMaster4, genericMapMasterName4, genericMapMasterDescription4, 20, 5000, preGenericMapMaster4, groupKey, true);
	Missions_RegisterMission(genericMapMaster5, genericMapMasterName5, genericMapMasterDescription5, 50, 10000, preGenericMapMaster5, groupKey, true);
	Missions_RegisterMission(genericMapMaster6, genericMapMasterName6, genericMapMasterDescription6, 150, 20000, preGenericMapMaster6, groupKey, true);
	Missions_RegisterMission(genericMapMaster7, genericMapMasterName7, genericMapMasterDescription7, 500, 35000, preGenericMapMaster7, groupKey, true);
	Missions_RegisterMission(easyMapMaster1, easyMapMasterName1, easyMapMasterNameDescription1, 5, 300, preEasyMapMaster1, groupKey, true);
	Missions_RegisterMission(easyMapMaster2, easyMapMasterName2, easyMapMasterNameDescription2, 15, 1000, preEasyMapMaster2, groupKey, true);
	Missions_RegisterMission(easyMapMaster3, easyMapMasterName3, easyMapMasterNameDescription3, 30, 3500, preEasyMapMaster3, groupKey, true);
	Missions_RegisterMission(mediumMapMaster1, mediumMapMasterName1, mediumMapMasterNameDescription1, 5, 1000, preMediumMapMaster1, groupKey, true);
	Missions_RegisterMission(mediumMapMaster2, mediumMapMasterName2, mediumMapMasterNameDescription2, 15, 3000, preMediumMapMaster2, groupKey, true);
	Missions_RegisterMission(mediumMapMaster3, mediumMapMasterName3, mediumMapMasterNameDescription3, 30, 7500, preMediumMapMaster3, groupKey, true);
	Missions_RegisterMission(hardMapMaster1, hardyMapMasterName1, gardMapMasterNameDescription1, 5, 2500, preHardMapMaster1, groupKey, true);
	Missions_RegisterMission(hardMapMaster2, hardyMapMasterName2, gardMapMasterNameDescription2, 15, 5000, preHardMapMaster2, groupKey, true);
	Missions_RegisterMission(hardMapMaster3, hardyMapMasterName3, gardMapMasterNameDescription3, 30, 12500, preHardMapMaster3, groupKey, true);
}

stock bool isValidClient(int client) {
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}

public void onAnyCompleted(int client, char mapName[64]) {
	if (!isValidClient(client)) {
		return;
	}
	Mission_IncrementMissionProgress(client, genericMapMaster1);
	Mission_IncrementMissionProgress(client, genericMapMaster2);
	Mission_IncrementMissionProgress(client, genericMapMaster3);
	Mission_IncrementMissionProgress(client, genericMapMaster4);
	Mission_IncrementMissionProgress(client, genericMapMaster5);
	Mission_IncrementMissionProgress(client, genericMapMaster6);
	Mission_IncrementMissionProgress(client, genericMapMaster7);
}

public void onEasyCompleted(int client, char mapName[64]) {
	if (!isValidClient(client)) {
		return;
	}
	Mission_IncrementMissionProgress(client, easyMapMaster1);
	Mission_IncrementMissionProgress(client, easyMapMaster2);
	Mission_IncrementMissionProgress(client, easyMapMaster3);
}

public void onMediumCompleted(int client, char mapName[64]) {
	if (!isValidClient(client)) {
		return;
	}
	Mission_IncrementMissionProgress(client, mediumMapMaster1);
	Mission_IncrementMissionProgress(client, mediumMapMaster2);
	Mission_IncrementMissionProgress(client, mediumMapMaster3);
}

public void onHardCompleted(int client, char mapName[64]) {
	if (!isValidClient(client)) {
		return;
	}
	Mission_IncrementMissionProgress(client, hardMapMaster1);
	Mission_IncrementMissionProgress(client, hardMapMaster2);
	Mission_IncrementMissionProgress(client, hardMapMaster3);
}

public void OnPluginEnd() {
	Missions_Finalize();
}


