#pragma semicolon 1

#define PLUGIN_AUTHOR "Totenfluch"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>
#include <multicolors>

#pragma newdecls required

g_iHeadshots[MAXPLAYERS + 1];
g_iCounter[MAXPLAYERS + 1];

g_iKills[MAXPLAYERS + 1];


char headhunter1_key[64] = "headhunter_1_300";
char headhunter2_key[64] = "headhunter_2_500";
char headhunter3_key[64] = "headhunter_3_800";

char SerialKiller1_key[64] = "serialkiller_1_500";
char SerialKiller2_key[64] = "serialkiller_2_750";

public Plugin myinfo = 
{
	name = "Mission: Timed", 
	author = PLUGIN_AUTHOR, 
	description = "add timed missions to Totenfluchs Missions", 
	version = PLUGIN_VERSION, 
	url = "http://ggc-base.de"
};

public void OnPluginStart() {
	Missions_RegisterMission(headhunter1_key, "Headhunter I", "Kill 2 Players with a headshot within 2 seconds from each other", 1, 300, "", "Timed", true);
	Missions_RegisterMission(headhunter2_key, "Headhunter II", "Kill 3 Players with a headshot within 3 seconds from each other", 1, 500, headhunter1_key, "Timed", true);
	Missions_RegisterMission(headhunter3_key, "Headhunter III", "Kill 4 Players with a headshot within 5 seconds from each other", 1, 800, headhunter2_key, "Timed", true);
	
	Missions_RegisterMission(SerialKiller1_key, "Serialkiller", "Kill 8 Players within 10 seconds", 1, 500, "", "Timed", true);
	Missions_RegisterMission(SerialKiller2_key, "Insane Serialkiller", "Kill 12 Players within 10 seconds", 1, 750, SerialKiller1_key, "Timed", true);
	
	
	HookEvent("player_death", onPlayerDeath);
	
	for (int i = 1; i < MAXPLAYERS; i++)
	g_iCounter[i] = -1;
}

public void OnPluginEnd() {
	Missions_Finalize();
}

public void OnMapStart() {
	CreateTimer(0.5, RefreshTimer, _, TIMER_FLAG_NO_MAPCHANGE | TIMER_REPEAT);
}

public void OnClientDisconnect(int client) {
	g_iHeadshots[client] = 0;
	g_iCounter[client] = -1;
}

public void OnClientPostAdminCheck(int client) {
	g_iHeadshots[client] = 0;
	g_iCounter[client] = -1;
}

public Action RefreshTimer(Handle Timer) {
	for (int i = 1; i < MAXPLAYERS; i++) {
		if (!isValidClient(i))
			continue;
		if (!IsPlayerAlive(i))
			continue;
		
		if (g_iCounter[i] > 0) {
			g_iCounter[i]--;
			float timer = 0.5 * g_iCounter[i] + 0.5;
			if (timer > 0.0)
				CPrintToChat(i, "{darkblue}[{lime}GGC{darkblue}] {darkred}%.2f{lightblue}s left!", timer);
		} else if (g_iCounter[i] == 0) {
			g_iCounter[i]--;
			g_iHeadshots[i] = 0;
			g_iKills[i] = 0;
			CPrintToChat(i, "{darkblue}[{lime}GGC{darkblue}] {darkred}Time is up");
		}
		
	}
}

public Action onPlayerDeath(Event event, const char[] name, bool dontBroadcast) {
	bool headshot = GetEventBool(event, "headshot");
	int attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	
	if (client == attacker)
		return;
	
	g_iCounter[client] = -1;
	g_iHeadshots[client] = 0;
	g_iKills[client] = 0;
	
	if (!isValidClient(attacker))
		return;
	
	if (Missions_IsActiveMissionKey(attacker, SerialKiller1_key))
		checkSerialKiller(attacker);
	
	if (Missions_IsActiveMissionKey(attacker, SerialKiller2_key))
		checkInsaneSerialKiller(attacker);
	
	if (!headshot)
		return;
	
	if (Missions_IsActiveMissionKey(attacker, headhunter1_key))
		checkHeadHunter1(attacker);
	if (Missions_IsActiveMissionKey(attacker, headhunter2_key))
		checkHeadHunter2(attacker);
	if (Missions_IsActiveMissionKey(attacker, headhunter3_key))
		checkHeadHunter3(attacker);
}

stock bool isValidClient(int client) {
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}

public void checkHeadHunter1(int client) {
	if (g_iHeadshots[client] == 0)
		g_iCounter[client] = 4;
	g_iHeadshots[client]++;
	CPrintToChat(client, "{darkblue}[{lime}GGC{darkblue}] {darkred}Headshot: {darkblue}%i", g_iHeadshots[client]);
	if (g_iHeadshots[client] == 2)
		Mission_IncrementMissionProgress(client, headhunter1_key);
}

public void checkHeadHunter2(int client) {
	if (g_iHeadshots[client] == 0)
		g_iCounter[client] = 6;
	g_iHeadshots[client]++;
	CPrintToChat(client, "{darkblue}[{lime}GGC{darkblue}] {darkred}Headshots in Time: {darkblue}%i", g_iHeadshots[client]);
	if (g_iHeadshots[client] == 3)
		Mission_IncrementMissionProgress(client, headhunter2_key);
}

public void checkHeadHunter3(int client) {
	if (g_iHeadshots[client] == 0)
		g_iCounter[client] = 10;
	g_iHeadshots[client]++;
	CPrintToChat(client, "{darkblue}[{lime}GGC{darkblue}] {darkred}Headshots in Time: {darkblue}%i", g_iHeadshots[client]);
	if (g_iHeadshots[client] == 4)
		Mission_IncrementMissionProgress(client, headhunter3_key);
}

public void checkSerialKiller(int client) {
	if (g_iKills[client] == 0)
		g_iCounter[client] = 20;
	g_iKills[client]++;
	CPrintToChat(client, "{darkblue}[{lime}GGC{darkblue}] {darkred}Kills in Time: {darkblue}%i", g_iKills[client]);
	if (g_iKills[client] == 8)
		Mission_IncrementMissionProgress(client, SerialKiller1_key);
}

public void checkInsaneSerialKiller(int client) {
	if (g_iKills[client] == 0)
		g_iCounter[client] = 20;
	g_iKills[client]++;
	CPrintToChat(client, "{darkblue}[{lime}GGC{darkblue}] {darkred}Kills in Time: {darkblue}%i", g_iKills[client]);
	if (g_iKills[client] == 12)
		Mission_IncrementMissionProgress(client, SerialKiller2_key);
}
