#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "walde"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>
#include <multicolors>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Knife Maniac Mission", 
	author = PLUGIN_AUTHOR, 
	description = "Hit an enemy 30 times with a knife", 
	version = PLUGIN_VERSION, 
	url = ""
};



char uKey[64] = "knife_maniac_30_5000_f5YKqoeM";
char missionName[256] = "Knife Maniac";
char preKey[64] = "";
bool broadcast = true;

public void OnPluginStart()
{
	Missions_RegisterMission(uKey, missionName, "Hit an enemy 30 times with a knife", 30, 5000, preKey, "Weapon Master", broadcast);
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





