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
	name = "Deagle Master Mission", 
	author = PLUGIN_AUTHOR, 
	description = "Kill 10 enemies with a deagle (Headshot only)", 
	version = PLUGIN_VERSION, 
	url = ""
};

char groupTag[64] = "";

char uKey[64] = "deagle_master_10_1000_wau9RJRK";
char missionName[256] = "Deagle Master";
char missionDescription[1024] = "Kill 10 enemies with a deagle (Headshot only)";
char preKey[64] = "";

bool broadcast = true;

char uKey2[64] = "deagle_master_20_2000_wau9RJRK";
char missionName2[256] = "Deagle Master [2]";
char missionDescription2[1024] = "Kill 20 enemies with a deagle (Headshot only) [2]";
char preKey2[64] = "deagle_master_10_1000_wau9RJRK";

public void OnPluginStart()
{
	Missions_RegisterMission(uKey, missionName, missionDescription, 10, 1000, preKey, groupTag, broadcast);
	Missions_RegisterMission(uKey2, missionName2, missionDescription2, 20, 5000, preKey2, groupTag, broadcast);
	HookEvent("player_death", onPlayerDeath);
}

public Action onPlayerDeath(Event event, const char[] name, bool dontBroadcast) {
	bool headshot = event.GetBool("headshot");
	bool didDeagleHeadshot;
	int attacker = GetClientOfUserId(event.GetInt("attacker"));
	char weaponName[64];
	if (!isValidClient(attacker)) {
		
	}
	GetClientWeapon(attacker, weaponName, sizeof(weaponName));
	if (StrEqual(weaponName, "weapon_deagle", false)) {
		if (headshot) {
			didDeagleHeadshot = true;
		}
	}
	if (didDeagleHeadshot) {
		Mission_IncrementMissionProgress(attacker, uKey);
		Mission_IncrementMissionProgress(attacker, uKey2);
	}
}

stock bool isValidClient(int client) {
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}


public void OnMissionCompleted(int client, char uniqueKey[64]) {
	
}

public void OnPluginEnd() {
	Missions_Finalize();
}
