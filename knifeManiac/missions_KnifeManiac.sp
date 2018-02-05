#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "walde"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Knife Maniac Mission", 
	author = PLUGIN_AUTHOR, 
	description = "Hit an enemy 30 times with a knife", 
	version = PLUGIN_VERSION, 
	url = "https://ggc-base.de"
};



char uKey[64] = "knife_maniac_30_300_f5YKqoeM";
char missionName[256] = "Knife Maniac";
char preKey[64] = "";

char uKey2[64] = "knife_maniac_150_5000_f5AFADoeM";
char missionName2[256] = "Knife Maniac II";
char preKey2[64] = "knife_maniac_30_300_f5YKqoeM";

char uKey3[64] = "knife_maniac_500_5000_f5YASDFAeM";
char missionName3[256] = "Knife Maniac III";
char preKey3[64] = "knife_maniac_150_5000_f5AFADoeM";

public void OnPluginStart()
{
	Missions_RegisterMission(uKey, missionName, "Hit an enemy 30 times with a knife", 30, 300, preKey, "Weapon Master", true);
	Missions_RegisterMission(uKey2, missionName2, "Hit an enemy 150 times with a knife", 150, 1000, preKey2, "Weapon Master", true);
	Missions_RegisterMission(uKey3, missionName3, "Hit an enemy 500 times with a knife", 500, 1500, preKey3, "Weapon Master", true);
	HookEvent("player_hurt", onPlayerHurt);
}

public Action onPlayerHurt(Handle event, const char[] name, bool dontBroadcast) {
	int attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
	if (!isValidClient(attacker))
		return;
	char weaponName[32];
	GetClientWeapon(attacker, weaponName, sizeof(weaponName));
	if (StrContains(weaponName, "knife", false) != -1 || StrContains(weaponName, "bayonet", false) != -1) {
		Mission_IncrementMissionProgress(attacker, uKey);
		Mission_IncrementMissionProgress(attacker, uKey2);
		Mission_IncrementMissionProgress(attacker, uKey3);
	}
}

public void OnMissionCompleted(int client, char uniqueKey[64]) {
	
}

stock bool isValidClient(int client) {
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}

public void OnPluginEnd() {
	Missions_Finalize();
}





