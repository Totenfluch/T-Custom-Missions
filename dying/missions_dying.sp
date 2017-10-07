#pragma semicolon 1

#define PLUGIN_AUTHOR "Totenfluch"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Mission: Dying", 
	author = PLUGIN_AUTHOR, 
	description = "Adds the Dying Missions to Totenfluchs Missions Plugin", 
	version = PLUGIN_VERSION, 
	url = "http://ggc-base.de"
};

char deathkey1[64] = "death_1_150";
char deathkey2[64] = "death_2_300";
char deathkey3[64] = "death_3_1000";


public void OnPluginStart()
{
	Missions_RegisterMission(deathkey1, "Sucidal", "Die 150 Times", 150, 500, "", "Self harm", true);
	Missions_RegisterMission(deathkey2, "Die with me", "Die 500 Times", 500, 750, deathkey1, "Self harm", true);
	Missions_RegisterMission(deathkey3, "Diehard", "Die 1000 Times", 1000, 1250, deathkey2, "Self harm", true);
	
	HookEvent("player_death", onPlayerDeath);
}


public Action onPlayerDeath(Event event, const char[] name, bool dontBroadcast) {
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	
	if (!isValidClient(client))
		return;
	
	Mission_IncrementMissionProgress(client, deathkey1);
	Mission_IncrementMissionProgress(client, deathkey2);
	Mission_IncrementMissionProgress(client, deathkey3);
}

stock bool isValidClient(int client) {
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}

public void OnPluginEnd() {
	Missions_Finalize();
}
