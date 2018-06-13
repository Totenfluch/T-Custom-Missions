#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Plock"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Mission: No Scope Master", 
	author = PLUGIN_AUTHOR, 
	version = PLUGIN_VERSION, 
	url = "kniv.com.br"
};

char groupTag9[64] = "No Scope Master";

char noscopeUKey1[64] = "noscope_master_1";
char noscopeUKey2[64] = "noscope_master_2";
char noscopeUKey3[64] = "noscope_master_3";
char noscopeUKey4[64] = "noscope_master_4";
char noscopeUKey5[64] = "noscope_master_5";
char noscopeUKey6[64] = "noscope_master_6";
char noscopeUKey7[64] = "noscope_master_7";
char noscopeUKey8[64] = "noscope_master_8";
char noscopeUKey9[64] = "noscope_master_9";
char noscopeUKey10[64] = "noscope_master_10";
char noscopeUKey11[64] = "noscope_master_11";
char noscopeUKey12[64] = "noscope_master_12";
char noscopeUKey13[64] = "noscope_master_13";

public void OnPluginStart()
{
	Missions_RegisterMission(noscopeUKey1, "Scope are for the weaks Tier I ", "Kill 5 enemies without aiming",5, 200,"", groupTag9, true);
	Missions_RegisterMission(noscopeUKey2, "Scope are for the weaks Tier II ", "Kill 10 enemies without aiming",10, 400,noscopeUKey1, groupTag9, true);
	Missions_RegisterMission(noscopeUKey3, "Scope are for the weaks Tier III ", "Kill 25 enemies without aiming",25, 1000,noscopeUKey2, groupTag9, true);
	Missions_RegisterMission(noscopeUKey4, "Scope are for the weaks Tier IV ", "Kill 50 enemies without aiming",50, 2000,noscopeUKey3, groupTag9, true);
	Missions_RegisterMission(noscopeUKey5, "Scope are for the weaks Tier V ", "Kill 100 enemies without aiming",100, 4000,noscopeUKey4, groupTag9, true);
	Missions_RegisterMission(noscopeUKey6, "Scope are for the weaks Tier VI ", "Kill 150 enemies without aiming",150, 6000,noscopeUKey5, groupTag9, true);
	Missions_RegisterMission(noscopeUKey7, "Scope are for the weaks Tier VII ", "Kill 250 enemies without aiming",250, 10000,noscopeUKey6, groupTag9, true);
	Missions_RegisterMission(noscopeUKey8, "Scope are for the weaks Tier VIII ", "Kill 500 enemies without aiming",500, 20000,noscopeUKey7, groupTag9, true);
	Missions_RegisterMission(noscopeUKey9, "Scope are for the weaks Tier IX ", "Kill 750 enemies without aiming",750, 30000,noscopeUKey8, groupTag9, true);
	Missions_RegisterMission(noscopeUKey10, "Scope are for the weaks Tier X ", "Kill 1000 enemies without aiming",1000, 40000,noscopeUKey9, groupTag9, true);
	Missions_RegisterMission(noscopeUKey11, "Scope are for the weaks Tier XI ", "Kill 2500 enemies without aiming",2500, 100000,noscopeUKey10, groupTag9, true);
	Missions_RegisterMission(noscopeUKey12, "Scope are for the weaks Tier XII ", "Kill 5000 enemies without aiming",5000, 200000,noscopeUKey11, groupTag9, true);
	Missions_RegisterMission(noscopeUKey13, "Scope are for the weaks Tier XIII ", "Kill 10000 enemies without aiming",10000, 400000,noscopeUKey12, groupTag9, true);
	
	HookEvent("player_death", onPlayerDeath);
}

public Action onPlayerDeath(Event event, const char[] name, bool dontBroadcast) {
	int attacker = GetClientOfUserId(event.GetInt("attacker"));
	int victim = GetClientOfUserId(GetEventInt(event, "userid"));
	if (!isValidClient(attacker) || !isValidClient(victim))
		return;
	char weapon[16];
	event.GetString("weapon", weapon, sizeof(weapon));
	if(weapon[0] && (StrContains(weapon, "awp") != -1 || StrContains(weapon, "scout") != -1 || StrContains(weapon, "ssg08") != -1 || StrContains(weapon, "g3sg1") != -1 || StrContains(weapon, "sg550") != -1 || StrContains(weapon, "scar20") != -1)
	&& (GetEntProp(attacker, Prop_Data, "m_iFOV") <= 0 || GetEntProp(attacker, Prop_Data, "m_iFOV") == GetEntProp(attacker, Prop_Data, "m_iDefaultFOV")))
	{
		Mission_IncrementMissionProgress(attacker, noscopeUKey1);
		Mission_IncrementMissionProgress(attacker, noscopeUKey2);
		Mission_IncrementMissionProgress(attacker, noscopeUKey3);
		Mission_IncrementMissionProgress(attacker, noscopeUKey4);
		Mission_IncrementMissionProgress(attacker, noscopeUKey5);
		Mission_IncrementMissionProgress(attacker, noscopeUKey6);
		Mission_IncrementMissionProgress(attacker, noscopeUKey7);
		Mission_IncrementMissionProgress(attacker, noscopeUKey8);
		Mission_IncrementMissionProgress(attacker, noscopeUKey9);
		Mission_IncrementMissionProgress(attacker, noscopeUKey10);
		Mission_IncrementMissionProgress(attacker, noscopeUKey11);
		Mission_IncrementMissionProgress(attacker, noscopeUKey12);
		Mission_IncrementMissionProgress(attacker, noscopeUKey13);
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

