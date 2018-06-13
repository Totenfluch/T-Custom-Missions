#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Plock"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>

#pragma newdecls required

bool g_bFinishFirst;
bool g_bRoundStarted;
bool g_baDead[MAXPLAYERS + 1];
int g_iRespawnCount[MAXPLAYERS + 1];
int g_iBaseCount[MAXPLAYERS + 1];

public Plugin myinfo = 
{
	name = "Mission: Deathrun Master", 
	author = PLUGIN_AUTHOR, 
	version = PLUGIN_VERSION, 
	url = "kniv.com.br"
};

char groupTag1[64] = "Deathrun Master";

char finishMapUKey1[64] = "finish_master_1";
char finishMapUKey2[64] = "finish_master_2";
char finishMapUKey3[64] = "finish_master_3";
char finishMapUKey4[64] = "finish_master_4";
char finishMapUKey5[64] = "finish_master_5";
char finishMapUKey6[64] = "finish_master_6";
char finishMapUKey7[64] = "finish_master_7";
char finishMapUKey8[64] = "finish_master_8";
char finishMapUKey9[64] = "finish_master_9";
char finishMapUKey10[64] = "finish_master_10";
char finishMapUKey11[64] = "finish_master_11";
char finishMapUKey12[64] = "finish_master_12";
char finishMapUKey13[64] = "finish_master_13";

char finishFirstUKey1[64] = "finishfirst_master_1";
char finishFirstUKey2[64] = "finishfirst_master_2";
char finishFirstUKey3[64] = "finishfirst_master_3";
char finishFirstUKey4[64] = "finishfirst_master_4";
char finishFirstUKey5[64] = "finishfirst_master_5";
char finishFirstUKey6[64] = "finishfirst_master_6";
char finishFirstUKey7[64] = "finishfirst_master_7";
char finishFirstUKey8[64] = "finishfirst_master_8";
char finishFirstUKey9[64] = "finishfirst_master_9";
char finishFirstUKey10[64] = "finishfirst_master_10";
char finishFirstUKey11[64] = "finishfirst_master_11";
char finishFirstUKey12[64] = "finishfirst_master_12";
char finishFirstUKey13[64] = "finishfirst_master_13";

char respawnFinishUKey1[64] = "respawnfinish_master_1";
char respawnFinishUKey2[64] = "respawnfinish_master_2";
char respawnFinishUKey3[64] = "respawnfinish_master_3";
char respawnFinishUKey4[64] = "respawnfinish_master_4";
char respawnFinishUKey5[64] = "respawnfinish_master_5";
char respawnFinishUKey6[64] = "respawnfinish_master_6";
char respawnFinishUKey7[64] = "respawnfinish_master_7";
char respawnFinishUKey8[64] = "respawnfinish_master_8";
char respawnFinishUKey9[64] = "respawnfinish_master_9";
char respawnFinishUKey10[64] = "respawnfinish_master_10";
char respawnFinishUKey11[64] = "respawnfinish_master_11";
char respawnFinishUKey12[64] = "respawnfinish_master_12";
char respawnFinishUKey13[64] = "respawnfinish_master_13";

char baseFinishUKey1[64] = "base_master_1";
char baseFinishUKey2[64] = "base_master_2";
char baseFinishUKey3[64] = "base_master_3";
char baseFinishUKey4[64] = "base_master_4";
char baseFinishUKey5[64] = "base_master_5";
char baseFinishUKey6[64] = "base_master_6";
char baseFinishUKey7[64] = "base_master_7";
char baseFinishUKey8[64] = "base_master_8";
char baseFinishUKey9[64] = "base_master_9";
char baseFinishUKey10[64] = "base_master_10";
char baseFinishUKey11[64] = "base_master_11";
char baseFinishUKey12[64] = "base_master_12";
char baseFinishUKey13[64] = "base_master_13";

public void OnPluginStart()
{
	Missions_RegisterMission(finishMapUKey1, "Treasure Map Tier I", "Finish 5 maps",5,200,"",groupTag1,true);
	Missions_RegisterMission(finishMapUKey2, "Treasure Map Tier II", "Finish 10 maps",10,400,finishMapUKey1,groupTag1,true);
	Missions_RegisterMission(finishMapUKey3, "Treasure Map Tier III", "Finish 25 maps",25,1000,finishMapUKey2,groupTag1,true);
	Missions_RegisterMission(finishMapUKey4, "Treasure Map Tier IV", "Finish 50 maps",50,2000,finishMapUKey3,groupTag1,true);
	Missions_RegisterMission(finishMapUKey5, "Treasure Map Tier V", "Finish 100 maps",100,4000,finishMapUKey4,groupTag1,true);
	Missions_RegisterMission(finishMapUKey6, "Treasure Map Tier VI", "Finish 150 maps",150,6000,finishMapUKey5,groupTag1,true);
	Missions_RegisterMission(finishMapUKey7, "Treasure Map Tier VII", "Finish 250 maps",250,10000,finishMapUKey6,groupTag1,true);
	Missions_RegisterMission(finishMapUKey8, "Treasure Map Tier VIII", "Finish 500 maps",500,20000,finishMapUKey7,groupTag1,true);
	Missions_RegisterMission(finishMapUKey9, "Treasure Map Tier IX", "Finish 750 maps",750,30000,finishMapUKey8,groupTag1,true);
	Missions_RegisterMission(finishMapUKey10, "Treasure Map Tier X", "Finish 1000 maps",1000,40000,finishMapUKey9,groupTag1,true);
	Missions_RegisterMission(finishMapUKey11, "Treasure Map Tier XI", "Finish 2500 maps",2500,100000,finishMapUKey10,groupTag1,true);
	Missions_RegisterMission(finishMapUKey12, "Treasure Map Tier XII", "Finish 5000 maps",5000,200000,finishMapUKey11,groupTag1,true);
	Missions_RegisterMission(finishMapUKey13, "Treasure Map Tier XIII", "Finish 10000 maps",10000,400000,finishMapUKey12,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey1, "First to become rish Tier I", "Finish 5 maps in first place",5,200,"",groupTag1,true);
	Missions_RegisterMission(finishFirstUKey2, "First to become rish Tier II", "Finish 10 maps in first place",10,400,finishFirstUKey1,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey3, "First to become rish Tier III", "Finish 25 maps in first place",25,1000,finishFirstUKey2,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey4, "First to become rish Tier IV", "Finish 50 maps in first place",50,2000,finishFirstUKey3,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey5, "First to become rish Tier V", "Finish 100 maps in first place",100,4000,finishFirstUKey4,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey6, "First to become rish Tier VI", "Finish 150 maps in first place",150,6000,finishFirstUKey5,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey7, "First to become rish Tier VII", "Finish 250 maps in first place",250,10000,finishFirstUKey6,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey8, "First to become rish Tier VIII", "Finish 500 maps in first place",500,20000,finishFirstUKey7,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey9, "First to become rish Tier IX", "Finish 750 maps in first place",750,30000,finishFirstUKey8,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey10, "First to become rish Tier X", "Finish 1000 maps in first place",1000,40000,finishFirstUKey9,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey11, "First to become rish Tier XI", "Finish 2500 maps in first place",2500,100000,finishFirstUKey10,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey12, "First to become rish Tier XII", "Finish 5000 maps in first place",5000,200000,finishFirstUKey11,groupTag1,true);
	Missions_RegisterMission(finishFirstUKey13, "First to become rish Tier XIII", "Finish 10000 maps in first place",10000,400000,finishFirstUKey12,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey1, "Second Life Tier I", "Finish 5 maps after respawning",5,200,"",groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey2, "Second Life Tier II", "Finish 10 maps after respawning",10,400,respawnFinishUKey1,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey3, "Second Life Tier III", "Finish 25 maps after respawning",25,1000,respawnFinishUKey2,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey4, "Second Life Tier IV", "Finish 50 maps after respawning",50,2000,respawnFinishUKey3,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey5, "Second Life Tier V", "Finish 100 maps after respawning",100,4000,respawnFinishUKey4,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey6, "Second Life Tier VI", "Finish 150 maps after respawning",150,6000,respawnFinishUKey5,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey7, "Second Life Tier VII", "Finish 250 maps after respawning",250,10000,respawnFinishUKey6,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey8, "Second Life Tier VIII", "Finish 500 maps after respawning",500,20000,respawnFinishUKey7,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey9, "Second Life Tier IX", "Finish 750 maps after respawning",750,30000,respawnFinishUKey8,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey10, "Second Life Tier X", "Finish 1000 maps after respawning",1000,40000,respawnFinishUKey9,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey11, "Second Life Tier XI", "Finish 2500 maps after respawning",2500,100000,respawnFinishUKey10,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey12, "Second Life Tier XII", "Finish 5000 maps after respawning",5000,200000,respawnFinishUKey11,groupTag1,true);
	Missions_RegisterMission(respawnFinishUKey13, "Second Life Tier XIII", "Finish 10000 maps after respawning",10000,400000,respawnFinishUKey12,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey1, "I know how to bhop Tier I", "Finish 5 maps without going back to start zone",5,200,"",groupTag1,true);
	Missions_RegisterMission(baseFinishUKey2, "I know how to bhop Tier II", "Finish 10 maps without going back to start zone",10,400,baseFinishUKey1,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey3, "I know how to bhop Tier III", "Finish 25 maps without going back to start zone",25,1000,baseFinishUKey2,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey4, "I know how to bhop Tier IV", "Finish 50 maps without going back to start zone",50,2000,baseFinishUKey3,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey5, "I know how to bhop Tier V", "Finish 100 maps without going back to start zone",100,4000,baseFinishUKey4,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey6, "I know how to bhop Tier VI", "Finish 150 maps without going back to start zone",150,6000,baseFinishUKey5,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey7, "I know how to bhop Tier VII", "Finish 250 maps without going back to start zone",250,10000,baseFinishUKey6,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey8, "I know how to bhop Tier VIII", "Finish 500 maps without going back to start zone",500,20000,baseFinishUKey7,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey9, "I know how to bhop Tier IX", "Finish 750 maps without going back to start zone",750,30000,baseFinishUKey8,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey10, "I know how to bhop Tier X", "Finish 1000 maps without going back to start zone",1000,40000,baseFinishUKey9,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey11, "I know how to bhop Tier XI", "Finish 2500 maps without going back to start zone",2500,100000,baseFinishUKey10,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey12, "I know how to bhop Tier XII", "Finish 5000 maps without going back to start zone",5000,200000,baseFinishUKey11,groupTag1,true);
	Missions_RegisterMission(baseFinishUKey13, "I know how to bhop Tier XIII", "Finish 10000 maps without going back to start zone",10000,400000,baseFinishUKey12,groupTag1,true);

	HookEvent("player_death", onPlayerDeath);
	HookEvent("round_start", onRoundStart);
	HookEvent("player_spawn", onPlayerSpawn);
	HookEvent("round_end", onRoundEnd);
}

public void onRoundStart(Handle hEvent, const char[] sName, bool bDontBroadcast) {
	g_bFinishFirst = false;
	for (int i = 0; i < MAXPLAYERS + 1; i++) {
		g_baDead[i] = false;
		g_iRespawnCount[i] = 0;
	}
	CreateTimer(3.0, RoundStart, 0);
}

public Action RoundStart(Handle timer, int client) {
	g_bRoundStarted = true;
}

public void onRoundEnd(Handle hEvent, const char[] sName, bool bDontBroadcast) {
	g_bRoundStarted = false;
}
public void onPlayerSpawn(Handle event, const char[]name, bool dontBroadcast) {
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	if (isValidClient(client) && g_bRoundStarted && g_baDead[client]) {
		g_baDead[client] = false;
		g_iRespawnCount[client]++;
		g_iBaseCount[client] = 0;
	}
}

public void ckSurf_OnMapFinished(int client, float fRunTime, char RunTime[54], int rank, int total, bool improved) {
	if (isValidClient(client)) {
		if (!g_bFinishFirst) {
			g_bFinishFirst = true;
			Mission_IncrementMissionProgress(client, finishFirstUKey1);
			Mission_IncrementMissionProgress(client, finishFirstUKey2);
			Mission_IncrementMissionProgress(client, finishFirstUKey3);
			Mission_IncrementMissionProgress(client, finishFirstUKey4);
			Mission_IncrementMissionProgress(client, finishFirstUKey5);
			Mission_IncrementMissionProgress(client, finishFirstUKey6);
			Mission_IncrementMissionProgress(client, finishFirstUKey7);
			Mission_IncrementMissionProgress(client, finishFirstUKey8);
			Mission_IncrementMissionProgress(client, finishFirstUKey9);
			Mission_IncrementMissionProgress(client, finishFirstUKey10);
			Mission_IncrementMissionProgress(client, finishFirstUKey11);
			Mission_IncrementMissionProgress(client, finishFirstUKey12);
			Mission_IncrementMissionProgress(client, finishFirstUKey13);
		}
		if (g_iRespawnCount[client] > 0) {
			Mission_IncrementMissionProgress(client, respawnFinishUKey1);
			Mission_IncrementMissionProgress(client, respawnFinishUKey2);
			Mission_IncrementMissionProgress(client, respawnFinishUKey3);
			Mission_IncrementMissionProgress(client, respawnFinishUKey4);
			Mission_IncrementMissionProgress(client, respawnFinishUKey5);
			Mission_IncrementMissionProgress(client, respawnFinishUKey6);
			Mission_IncrementMissionProgress(client, respawnFinishUKey7);
			Mission_IncrementMissionProgress(client, respawnFinishUKey8);
			Mission_IncrementMissionProgress(client, respawnFinishUKey9);
			Mission_IncrementMissionProgress(client, respawnFinishUKey10);
			Mission_IncrementMissionProgress(client, respawnFinishUKey11);
			Mission_IncrementMissionProgress(client, respawnFinishUKey12);
			Mission_IncrementMissionProgress(client, respawnFinishUKey13);
		}
		if (g_iBaseCount[client] == 1) {
			Mission_IncrementMissionProgress(client, baseFinishUKey1);
			Mission_IncrementMissionProgress(client, baseFinishUKey2);
			Mission_IncrementMissionProgress(client, baseFinishUKey3);
			Mission_IncrementMissionProgress(client, baseFinishUKey4);
			Mission_IncrementMissionProgress(client, baseFinishUKey5);
			Mission_IncrementMissionProgress(client, baseFinishUKey6);
			Mission_IncrementMissionProgress(client, baseFinishUKey7);
			Mission_IncrementMissionProgress(client, baseFinishUKey8);
			Mission_IncrementMissionProgress(client, baseFinishUKey9);
			Mission_IncrementMissionProgress(client, baseFinishUKey10);
			Mission_IncrementMissionProgress(client, baseFinishUKey11);
			Mission_IncrementMissionProgress(client, baseFinishUKey12);
			Mission_IncrementMissionProgress(client, baseFinishUKey13);
		}
		Mission_IncrementMissionProgress(client, finishMapUKey1);
		Mission_IncrementMissionProgress(client, finishMapUKey2);
		Mission_IncrementMissionProgress(client, finishMapUKey3);
		Mission_IncrementMissionProgress(client, finishMapUKey4);
		Mission_IncrementMissionProgress(client, finishMapUKey5);
		Mission_IncrementMissionProgress(client, finishMapUKey6);
		Mission_IncrementMissionProgress(client, finishMapUKey7);
		Mission_IncrementMissionProgress(client, finishMapUKey8);
		Mission_IncrementMissionProgress(client, finishMapUKey9);
		Mission_IncrementMissionProgress(client, finishMapUKey10);
		Mission_IncrementMissionProgress(client, finishMapUKey11);
		Mission_IncrementMissionProgress(client, finishMapUKey12);
		Mission_IncrementMissionProgress(client, finishMapUKey13);
	}
}

public void Ong_iBaseCountLeft(int client) {
	if(isValidClient) {
		g_iBaseCount[client]++;
	}
}

public Action onPlayerDeath(Event event, const char[] name, bool dontBroadcast) {
	int attacker = GetClientOfUserId(event.GetInt("attacker"));
	int victim = GetClientOfUserId(GetEventInt(event, "userid"));
	if (!isValidClient(attacker) && !isValidClient(victim))
		return;

	g_baDead[victim] = true;
}

stock bool isValidClient(int client) {
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}

public void OnPluginEnd() {
	Missions_Finalize();
}
