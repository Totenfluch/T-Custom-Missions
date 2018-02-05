#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "walde"
#define PLUGIN_VERSION "0.00"

#include <sourcemod>
#include <sdktools>
#include <missions>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Surfing Shark Mission", 
	author = PLUGIN_AUTHOR, 
	description = "", 
	version = PLUGIN_VERSION, 
	url = ""
};

char groupTag[64] = "";

char uKey[64] = "surfing_shark_25_5000_oDXdc2rx";
char missionName[256] = "Surfing Shark";
char missionDescription[1024] = "Kill 25 enemies while surfing with a shotgun!";
char preKey[64] = "";

int minSpeed = 300;

bool broadcast = true;

public void OnPluginStart()
{
	Missions_RegisterMission(uKey, missionName, missionDescription, 10, 1000, preKey, groupTag, broadcast);
	HookEvent("player_death", onPlayerDeath);
}

public Action onPlayerDeath(Event event, const char[] name, bool dontBroadcast) {
	int attacker = GetClientOfUserId(event.GetInt("attacker"));
	bool killedWithShotgun;
	if (!isValidClient(attacker)) {
		return;
	}
	char weaponName[64];
	GetClientWeapon(attacker, weaponName, sizeof(weaponName));
	if (StrContains(weaponName, "xm1014", false) != -1 || StrContains(weaponName, "mag7", false) != -1 || StrContains(weaponName, "nova", false) != -1 || StrContains(weaponName, "sawedoff", false) != -1) {
		killedWithShotgun = true;
	}
	if (!killedWithShotgun) {
		return;
	}
	if (GetClientSpeed(attacker) < minSpeed) {
		return;
	}
	if (GetEntityFlags(attacker) & FL_ONGROUND) {
		return;
	}
	Mission_IncrementMissionProgress(attacker, uKey);
	
	
}


stock bool isValidClient(int client) {
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}


public void OnMissionCompleted(int client, char uniqueKey[64]) {
	
}


stock float GetClientSpeed(int client) {
	float fVelocity[3];
	GetEntPropVector(client, Prop_Data, "m_vecVelocity", fVelocity);
	return SquareRoot(Pow(fVelocity[0], 2.0) + Pow(fVelocity[1], 2.0));
}

public void OnPluginEnd() {
	Missions_Finalize();
}
