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
	name = "Speed Maniac", 
	author = PLUGIN_AUTHOR, 
	description = "Keep 1000 Speed for 5 seconds", 
	version = PLUGIN_VERSION, 
	url = ""
};

char groupKey[64] = "Movement";

char uKey[64] = "speed_maniac_1_150_LxidfLvd";
char missionName[256] = "Speed Maniac 1";
char missionDescription[1024] = "Keep 1000 Speed for 5 seconds";
char preKey[64] = "";
bool broadcast = true;

char uKey2[64] = "speed_maniac_2_300_nDBS6WD5";
char missionName2[256] = "Speed Maniac 2";
char missionDescription2[1024] = "Keep 1500 Speed for 5 seconds";
char preKey2[64] = "speed_maniac_1_150_LxidfLvd";


char uKey3[64] = "speed_maniac_3_1000_wRT4dmD7";
char missionName3[256] = "Speed Maniac 3";
char missionDescription3[1024] = "Keep 2500 Speed for 5 seconds";
char preKey3[64] = "speed_maniac_2_300_nDBS6WD5";


int g_iTimeElapsed[MAXPLAYERS + 1];
int g_iTimeElapsed2[MAXPLAYERS + 1];
int g_iTimeElapsed3[MAXPLAYERS + 1];


public void OnPluginStart()
{
	Missions_RegisterMission(uKey, missionName, missionDescription, 1, 150, preKey, groupKey, broadcast);
	Missions_RegisterMission(uKey2, missionName2, missionDescription2, 1, 300, preKey2, groupKey, broadcast);
	Missions_RegisterMission(uKey3, missionName3, missionDescription3, 1, 1000, preKey3, groupKey, broadcast);
}

stock bool isValidClient(int client) {
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}

public void OnMapStart() {
	CreateTimer(1.0, RefreshTimer, _, TIMER_FLAG_NO_MAPCHANGE | TIMER_REPEAT);
}

public Action RefreshTimer(Handle timer) {
	for (int i = 1; i < MAXPLAYERS + 1; i++) {
		if (!isValidClient(i))
			continue;
		
		if (Missions_IsActiveMissionKey(i, uKey))
			checkProgress1(i);
		
		if (Missions_IsActiveMissionKey(i, uKey2))
			checkProgress2(i);
		
		if (Missions_IsActiveMissionKey(i, uKey3))
			checkProgress3(i);
	}
}

public void checkProgress1(int i) {
	g_iTimeElapsed[i]++;
	if (GetClientSpeed(i) < 1000.0) {
		g_iTimeElapsed[i] = 0;
		return;
	}
	
	if (g_iTimeElapsed[i] == 2)
		CPrintToChat(i, "{darkblue}[{lime}GGC{darkblue}]{darkred}3{lightblue} more seconds!");
	
	if (g_iTimeElapsed[i] == 4)
		CPrintToChat(i, "{darkblue}[{lime}GGC{darkblue}]{darkred}1{lightblue} more second!");
	
	if (g_iTimeElapsed[i] == 5)
		Mission_IncrementMissionProgress(i, uKey);
	
}

public void checkProgress2(int i) {
	g_iTimeElapsed2[i]++;
	if (GetClientSpeed(i) < 1500.0) {
		g_iTimeElapsed2[i] = 0;
		return;
	}
	if (g_iTimeElapsed2[i] == 2)
		CPrintToChat(i, "{darkblue}[{lime}GGC{darkblue}]{darkred}3{lightblue} more seconds!");
	
	if (g_iTimeElapsed2[i] == 4)
		CPrintToChat(i, "{darkblue}[{lime}GGC{darkblue}]{darkred}1{lightblue} more second!");
	
	if (g_iTimeElapsed2[i] == 5)
		Mission_IncrementMissionProgress(i, uKey2);
	
}


public void checkProgress3(int i) {
	g_iTimeElapsed3[i]++;
	if (GetClientSpeed(i) < 2500.0) {
		g_iTimeElapsed3[i] = 0;
		return;
	}
	if (g_iTimeElapsed3[i] == 2)
		CPrintToChat(i, "{darkblue}[{lime}GGC{darkblue}]{darkred}3{lightblue} more seconds!");
	
	if (g_iTimeElapsed3[i] == 4)
		CPrintToChat(i, "{darkblue}[{lime}GGC{darkblue}]{darkred}1{lightblue} more second!");
	
	if (g_iTimeElapsed3[i] == 5)
		Mission_IncrementMissionProgress(i, uKey3);
	
}

stock float GetClientSpeed(int client) {
	float fVelocity[3];
	GetEntPropVector(client, Prop_Data, "m_vecVelocity", fVelocity);
	return SquareRoot(Pow(fVelocity[0], 2.0) + Pow(fVelocity[1], 2.0));
}

public void OnPluginEnd() {
	Missions_Finalize();
} 