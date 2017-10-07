#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "walde"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>
#include <multicolors>
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

char uKey[64] = "map_master_1_150_3Ztk44FpK";
char missionName[256] = "Map Master 1";
char missionDescription[1024] = "Complete 1 Map (Easy, Medium or Hard)";
char preKey[64] = "";
bool broadcast = true;

char uKey2[64] = "map_master_5_500_rWUMKAUt";
char missionName2[256] = "Map Master 2";
char missionDescription2[1024] = "Complete 5 Maps (Easy, Medium or Hard)";
char preKey2[64] = "map_master_1_150_3Ztk44FpK";
bool broadcast2 = true;

char uKey3[64] = "map_master_10_1000_ZLbPnFFj";
char missionName3[256] = "Map Master 3";
char missionDescription3[1024] = "Complete 10 Maps (Easy, Medium or Hard)";
char preKey3[64] = "map_master_5_500_rWUMKAUt";
bool broadcast3 = true;

char uKey4[64] = "map_master_20_5000_rWUMKAUt";
char missionName4[256] = "Map Master 4";
char missionDescription4[1024] = "Complete 20 Maps (Easy, Medium or Hard)";
char preKey4[64] = "map_master_10_1000_ZLbPnFFj";
bool broadcast4 = true;

char uKey5[64] = "easy_map_master_5_300_23HQmHD9";
char missionName5[256] = "Easy Map Master";
char missionDescription5[1024] = "Complete 5 Easy Maps";
char preKey5[64] = "";
bool broadcast5 = true;

char uKey6[64] = "medium_map_master_5_1000_v2VZza9T";
char missionName6[256] = "Medium Map Master";
char missionDescription6[1024] = "Complete 5 Medium Maps";
char preKey6[64] = "";
bool broadcast6 = true;

char uKey7[64] = "hard_map_master_5_2500_7q8t39DR";
char missionName7[256] = "Hard Map Master";
char missionDescription7[1024] = "Complete 5 Hard Maps";
char preKey7[64] = "";
bool broadcast7 = true;

public void OnPluginStart()
{
	Missions_RegisterMission(uKey, missionName, missionDescription, 1, 150, preKey, groupKey, broadcast);
	Missions_RegisterMission(uKey2, missionName2, missionDescription2, 5, 500, preKey2, groupKey, broadcast2);
	Missions_RegisterMission(uKey3, missionName3, missionDescription3, 10, 1000, preKey3, groupKey, broadcast3);
	Missions_RegisterMission(uKey4, missionName4, missionDescription4, 20, 5000, preKey4, groupKey, broadcast4);
	Missions_RegisterMission(uKey5, missionName5, missionDescription5, 5, 300, preKey5, groupKey, broadcast5);
	Missions_RegisterMission(uKey6, missionName6, missionDescription6, 5, 1000, preKey6, groupKey, broadcast6);
	Missions_RegisterMission(uKey7, missionName7, missionDescription7, 5, 2500, preKey7, groupKey, broadcast7);
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
	Mission_IncrementMissionProgress(client, uKey);
	Mission_IncrementMissionProgress(client, uKey2);
	Mission_IncrementMissionProgress(client, uKey3);
	Mission_IncrementMissionProgress(client, uKey4);
}

public void onEasyCompleted(int client, char mapName[64]) {
	if (!isValidClient(client)) {
		return;
	}
	Mission_IncrementMissionProgress(client, uKey5);
}

public void onMediumCompleted(int client, char mapName[64]) {
	if (!isValidClient(client)) {
		return;
	}
	Mission_IncrementMissionProgress(client, uKey6);
}

public void onHardCompleted(int client, char mapName[64]) {
	if (!isValidClient(client)) {
		return;
	}
	Mission_IncrementMissionProgress(client, uKey7);
}

public void OnPluginEnd() {
	Missions_Finalize();
}


