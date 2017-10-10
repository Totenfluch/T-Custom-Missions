#pragma semicolon 1

#define PLUGIN_AUTHOR "Totenfluch"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>
#include <zombiereloaded>
#include <sdkhooks>
#include <devzones>


int g_iRoundsSurvived[MAXPLAYERS + 1];
bool g_bMapCreditRound[MAXPLAYERS + 1];

public Plugin myinfo = 
{
	name = "Zombie Missions", 
	author = PLUGIN_AUTHOR, 
	description = "Zombie Missions for TCustom Missions", 
	version = PLUGIN_VERSION, 
	url = "https://totenfluch.de"
};


public void OnPluginStart() {
	Missions_RegisterMission("zombie_infect_1_un1", "Zombie Infection 1", "Infect 100 Humans", 100, 250, "", "Zombie", true);
	Missions_RegisterMission("zombie_infect_2_un2", "Zombie Infection 2", "Infect 250 Humans", 250, 500, "zombie_infect_1_un1", "Zombie", true);
	Missions_RegisterMission("zombie_infect_3_un3", "Zombie Infection 3", "Infect 500 Humans", 500, 1000, "zombie_infect_2_un2", "Zombie", true);
	Missions_RegisterMission("zombie_kamikaze_1_un1", "Kamikaze 1", "Knife 20 Zombies", 20, 150, "", "Human", true);
	Missions_RegisterMission("zombie_kamikaze_2_un2", "Kamikaze 2", "Knife 50 Zombies", 50, 300, "zombie_kamikaze_1_un1", "Human", true);
	Missions_RegisterMission("zombie_kamikaze_3_un3", "Kamikaze 3", "Knife 100 Zombies", 100, 500, "zombie_kamikaze_2_un2", "Human", true);
	Missions_RegisterMission("kill_the_boss_1_un1", "Kill the Boss 1", "Kill one Boss", 1, 200, "", "Human", true);
	Missions_RegisterMission("zombie_ignite_1_un1", "Zombie Ignition 1", "Ingite 50 Zombies", 50, 250, "", "Human", true);
	Missions_RegisterMission("zombie_ignite_2_un2", "Zombie Ignition 2", "Ingite 100 Zombies", 100, 250, "zombie_ignite_1_un1", "Human", true);
	Missions_RegisterMission("zombie_ignite_3_un3", "Zombie Ignition 3", "Ingite 150 Zombies", 150, 250, "zombie_ignite_2_un2", "Human", true);
	Missions_RegisterMission("zombie_stay_alive_1_un1", "Stay Alive 1", "Survive a Round", 1, 250, "", "Human", true);
	Missions_RegisterMission("zombie_stay_alive_2_un2", "Stay Alive 2", "Survive three Rounds", 3, 500, "zombie_stay_alive_1_un1", "Human", true);
	Missions_RegisterMission("zombie_stay_alive_3_un3", "Stay Alive 3", "Survive ten Rounds", 10, 750, "zombie_stay_alive_2_un2", "Human", true);
	Missions_RegisterMission("zombie_stay_alive_4_un4", "Stay Alive 4", "Survive fifty Rounds", 50, 1500, "zombie_stay_alive_3_un3", "Human", true);
	Missions_RegisterMission("zombie_stay_alive_5_un5", "Stay Alive 5", "Survive one hundred Rounds", 100, 2500, "zombie_stay_alive_4_un4", "Human", true);
	Missions_RegisterMission("zombie_surive_row_1_un1", "Survival Specialist 1", "Survive three rounds in a row in one session", 1, 500, "", "Human", true);
	Missions_RegisterMission("zombie_surive_row_2_un2", "Survival Specialist 2", "Survive five rounds in a row in one session", 1, 1000, "zombie_surive_row_1_un1", "Human", true);
	
	Missions_RegisterMission("mapmaster_easy_1_un1", "Easy Map Master 1", "Complete an easy Map", 1, 250, "", "Map Completion", true);
	Missions_RegisterMission("mapmaster_easy_2_un2", "Easy Map Master 2", "Complete five easy Maps", 1, 500, "mapmaster_easy_1_un1", "Map Completion", true);
	Missions_RegisterMission("mapmaster_easy_3_un3", "Easy Map Master 3", "Complete 15 easy Maps", 1, 1000, "mapmaster_easy_2_un2", "Map Completion", true);
	
	Missions_RegisterMission("mapmaster_medium_1_un1", "Medium Map Master 1", "Complete a medium Map", 1, 250, "", "Map Completion", true);
	Missions_RegisterMission("mapmaster_medium_2_un2", "Medium Map Master 2", "Complete five medium Maps", 1, 250, "mapmaster_medium_1_un1", "Map Completion", true);
	Missions_RegisterMission("mapmaster_medium_3_un3", "Medium Map Master 3", "Complete 15 medium Maps", 1, 250, "mapmaster_medium_2_un2", "Map Completion", true);
	
	Missions_RegisterMission("mapmaster_hard_1_un1", "Hard Map Master 1", "Complete a hard Map", 1, 250, "", "Map Completion", true);
	Missions_RegisterMission("mapmaster_hard_2_un2", "Hard Map Master 2", "Complete five hard Maps", 1, 250, "mapmaster_hard_1_un1", "Map Completion", true);
	Missions_RegisterMission("mapmaster_hard_3_un3", "Hard Map Master 3", "Complete 15 hard Maps", 1, 250, "mapmaster_hard_2_un2", "Map Completion", true);
	
	
	HookEvent("player_use", PlayerUse);
	HookEvent("round_end", onRoundEnd);
	HookEvent("round_start", onRoundStart);
}

public int ZR_OnClientInfected(client, attacker, bool:motherInfect, bool:respawnOverride, bool:respawn) {
	if (isValidClient(client) && isValidClient(attacker)) {
		Mission_IncrementMissionProgress(attacker, "zombie_infect_1_un1");
		Mission_IncrementMissionProgress(attacker, "zombie_infect_2_un2");
		Mission_IncrementMissionProgress(attacker, "zombie_infect_3_un3");
	}
}

stock bool isValidClient(int client) {
	return (1 <= client <= MaxClients && IsClientInGame(client));
}

public void OnClientPutInServer(int client) {
	if (isValidClient(client))
		SDKHook(client, SDKHook_OnTakeDamage, OnTakeDamage);
}

public void OnClientDisconnect(int client) {
	if (isValidClient(client))
		SDKUnhook(client, SDKHook_OnTakeDamage, OnTakeDamage);
}

public Action OnTakeDamage(int victim, int &attacker, int &inflictor, float &damage, int &damagetype, int &bweapon, float damageForce[3], const float damagePosition[3]) {
	if (!isValidClient(victim))
		return Plugin_Continue;
	
	if (!isValidClient(attacker))
		return Plugin_Continue;
	
	if (!IsPlayerAlive(attacker))
		return Plugin_Continue;
	
	char weaponName[64];
	GetClientWeapon(attacker, weaponName, sizeof(weaponName));
	
	if (StrContains(weaponName, "knife") != -1) {
		if (ZR_IsClientZombie(victim) && ZR_IsClientHuman(attacker)) {
			Mission_IncrementMissionProgress(attacker, "zombie_kamikaze_1_un1");
			Mission_IncrementMissionProgress(attacker, "zombie_kamikaze_2_un2");
			Mission_IncrementMissionProgress(attacker, "zombie_kamikaze_3_un3");
		}
	}
	
	char sWeapon[32];
	GetEdictClassname(inflictor, sWeapon, sizeof(sWeapon));
	
	if ((ZR_IsClientZombie(victim) && ZR_IsClientHuman(attacker)) && StrContains("hegrenade_projectile", sWeapon, false) != -1 && damage >= 2.0) {
		Mission_IncrementMissionProgress(attacker, "zombie_ignite_1_un1");
		Mission_IncrementMissionProgress(attacker, "zombie_ignite_2_un2");
		Mission_IncrementMissionProgress(attacker, "zombie_ignite_3_un3");
	}
	
	return Plugin_Continue;
}

public int Zone_OnClientEntry(int client, char[] zone) {
	if (!isValidClient(client))
		return;
	if (!IsPlayerAlive(client))
		return;
	if (ZR_IsClientHuman(client)) {
		if (StrContains(zone, "bossdone", false) != -1) {
			Mission_IncrementMissionProgress(client, "kill_the_boss_1_un1");
		} else if (StrContains(zone, "endZone_easy", false) != -1 && !g_bMapCreditRound[client]) {
			Mission_IncrementMissionProgress(client, "mapmaster_easy_1_un1");
			Mission_IncrementMissionProgress(client, "mapmaster_easy_2_un2");
			Mission_IncrementMissionProgress(client, "mapmaster_easy_3_un3");
			g_bMapCreditRound[client] = true;
		} else if (StrContains(zone, "endZone_medium", false) != -1 && !g_bMapCreditRound[client]) {
			Mission_IncrementMissionProgress(client, "mapmaster_medium_1_un1");
			Mission_IncrementMissionProgress(client, "mapmaster_medium_2_un2");
			Mission_IncrementMissionProgress(client, "mapmaster_medium_3_un3");
			g_bMapCreditRound[client] = true;
		} else if (StrContains(zone, "endZone_hard", false) != -1 && !g_bMapCreditRound[client]) {
			Mission_IncrementMissionProgress(client, "mapmaster_hard_1_un1");
			Mission_IncrementMissionProgress(client, "mapmaster_hard_2_un2");
			Mission_IncrementMissionProgress(client, "mapmaster_hard_3_un3");
			g_bMapCreditRound[client] = true;
		}
	}
}

public Action PlayerUse(Handle event, const char[] name, bool dontBroadcast) {
	int entity = GetEventInt(event, "entity");
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	char mapName[64];
	GetCurrentMap(mapName, sizeof(mapName));
	if (IsValidEntity(entity)) {
		if (!isValidClient(entity)) {
			int hammerId = GetEntProp(entity, Prop_Data, "m_iHammerID");
			/*
			if(StrEqual(mapName, "myMap")){
				if(hammerId == 12345678)
					Mission_IncrementMissionProgress(client, "missionsfor12345678");
				}else if(hammerId == 45674567){
					...
				}
			}else if(StrEqual(mapName, "otherMap")) {
				...
			}
			*/
		}
	}
}

public Action onRoundStart(Handle event, const char[] name, bool dontBroadcast) {
	for (int i = 1; i < MAXPLAYERS + 1; i++) {
		g_bMapCreditRound[i] = false;
	}
}

public Action onRoundEnd(Handle event, const char[] name, bool dontBroadcast) {
	for (int i = 1; i < MAXPLAYERS + 1; i++) {
		if (!isValidClient(i))
			continue;
		if (!IsPlayerAlive(i))
			continue;
		if (ZR_IsClientHuman(i)) {
			Mission_IncrementMissionProgress(i, "zombie_stay_alive_1_un1");
			Mission_IncrementMissionProgress(i, "zombie_stay_alive_2_un2");
			Mission_IncrementMissionProgress(i, "zombie_stay_alive_3_un3");
			Mission_IncrementMissionProgress(i, "zombie_stay_alive_4_un4");
			Mission_IncrementMissionProgress(i, "zombie_stay_alive_5_un5");
			g_iRoundsSurvived[i]++;
			if (g_iRoundsSurvived[i] == 3) {
				Mission_IncrementMissionProgress(i, "zombie_surive_row_1_un1");
			} else if (g_iRoundsSurvived[i] == 5) {
				Mission_IncrementMissionProgress(i, "zombie_surive_row_2_un2");
			}
		}
	}
}

public void OnPluginEnd() {
	Missions_Finalize();
} 