#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "walde"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>
#include <ttt>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Traitor Buster Mission", 
	author = PLUGIN_AUTHOR, 
	description = "Kill 6 traitors in a single round", 
	version = PLUGIN_VERSION, 
	url = ""
};

char groupTag[64] = "";

char uKey[64] = "traitor_buster_1_2500_aA2qB938";
char missionName[256] = "Traitor Buster";
char missionDescription[1024] = "Kill 6 traitors in a single round";
char preKey[64] = "";

bool broadcast = true;

int counter[MAXPLAYERS + 1];


public void OnPluginStart()
{
	Missions_RegisterMission(uKey, missionName, missionDescription, 1, 2500, preKey, groupTag, broadcast);
	HookEvent("player_death", onPlayerDeath);
}


public Action onPlayerDeath(Event event, const char[] name, bool dontBroadcast) {
	int attacker = GetClientOfUserId(event.GetInt("attacker"));
	int victim = GetClientOfUserId(event.GetInt("victim"));
	if (!isValidClient(attacker) || !isValidClient(victim))
		return;
	if (!(TTT_GetClientRole(victim) == TTT_TEAM_TRAITOR))
		return;
	if (++counter[attacker] == 6)
		Mission_IncrementMissionProgress(attacker, uKey);
}

public void TTT_OnRoundStart(int innocents, int traitors, int detective) {
	for (int i = 0; i < MAXPLAYERS + 1; i++) {
		counter[i] = 0;
	}
}

stock bool isValidClient(int client) {
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}

public void OnPluginEnd() {
	Missions_Finalize();
}

