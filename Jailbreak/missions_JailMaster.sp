#define PLUGIN_AUTHOR "Plock"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <missions>
#include <hosties>
#include <warden>
#include <lastrequest>
#include <hl_gangs>
#include <hl_gangs_credits>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Mission: Jail Master", 
	author = PLUGIN_AUTHOR, 
	version = PLUGIN_VERSION, 
	url = "kniv.com.br"
};

char groupTag1[64] = "Jailbreak Master";

int g_iCounter[MAXPLAYERS + 1];
int g_iFirstHit[MAXPLAYERS + 1];

char killReberUKey1[64] = "killrebel_master_1";
char killReberUKey2[64] = "killrebel_master_2";
char killReberUKey3[64] = "killrebel_master_3";
char killReberUKey4[64] = "killrebel_master_4";
char killReberUKey5[64] = "killrebel_master_5";
char killReberUKey6[64] = "killrebel_master_6";
char killReberUKey7[64] = "killrebel_master_7";
char killReberUKey8[64] = "killrebel_master_8";
char killReberUKey9[64] = "killrebel_master_9";
char killReberUKey10[64] = "killrebel_master_10";
char killReberUKey11[64] = "killrebel_master_11";
char killReberUKey12[64] = "killrebel_master_12";
char killReberUKey13[64] = "killrebel_master_13";

char killCTsUKey1[64] = "killcts_master_1";
char killCTsUKey2[64] = "killcts_master_2";
char killCTsUKey3[64] = "killcts_master_3";
char killCTsUKey4[64] = "killcts_master_4";
char killCTsUKey5[64] = "killcts_master_5";
char killCTsUKey6[64] = "killcts_master_6";
char killCTsUKey7[64] = "killcts_master_7";
char killCTsUKey8[64] = "killcts_master_8";
char killCTsUKey9[64] = "killcts_master_9";
char killCTsUKey10[64] = "killcts_master_10";
char killCTsUKey11[64] = "killcts_master_11";
char killCTsUKey12[64] = "killcts_master_12";
char killCTsUKey13[64] = "killcts_master_13";

char killXerifeUKey1[64] = "killxerife_master_1";
char killXerifeUKey2[64] = "killxerife_master_2";
char killXerifeUKey3[64] = "killxerife_master_3";
char killXerifeUKey4[64] = "killxerife_master_4";
char killXerifeUKey5[64] = "killxerife_master_5";
char killXerifeUKey6[64] = "killxerife_master_6";
char killXerifeUKey7[64] = "killxerife_master_7";
char killXerifeUKey8[64] = "killxerife_master_8";
char killXerifeUKey9[64] = "killxerife_master_9";
char killXerifeUKey10[64] = "killxerife_master_10";
char killXerifeUKey11[64] = "killxerife_master_11";
char killXerifeUKey12[64] = "killxerife_master_12";
char killXerifeUKey13[64] = "killxerife_master_13";

char winLRUKey1[64] = "winlr_master_1";
char winLRUKey2[64] = "winlr_master_2";
char winLRUKey3[64] = "winlr_master_3";
char winLRUKey4[64] = "winlr_master_4";
char winLRUKey5[64] = "winlr_master_5";
char winLRUKey6[64] = "winlr_master_6";
char winLRUKey7[64] = "winlr_master_7";
char winLRUKey8[64] = "winlr_master_8";
char winLRUKey9[64] = "winlr_master_9";
char winLRUKey10[64] = "winlr_master_10";
char winLRUKey11[64] = "winlr_master_11";
char winLRUKey12[64] = "winlr_master_12";
char winLRUKey13[64] = "winlr_master_13";

char getRebelUKey1[64] = "getrebel_master_1";
char getRebelUKey2[64] = "getrebel_master_2";
char getRebelUKey3[64] = "getrebel_master_3";
char getRebelUKey4[64] = "getrebel_master_4";
char getRebelUKey5[64] = "getrebel_master_5";
char getRebelUKey6[64] = "getrebel_master_6";
char getRebelUKey7[64] = "getrebel_master_7";
char getRebelUKey8[64] = "getrebel_master_8";
char getRebelUKey9[64] = "getrebel_master_9";
char getRebelUKey10[64] = "getrebel_master_10";
char getRebelUKey11[64] = "getrebel_master_11";
char getRebelUKey12[64] = "getrebel_master_12";
char getRebelUKey13[64] = "getrebel_master_13";

char gangsUKey1[64] = "gangs_master_1";
char gangsUKey2[64] = "gangs_master_2";
char gangsUKey3[64] = "gangs_master_3";
char gangsUKey4[64] = "gangs_master_4";
char gangsUKey5[64] = "gangs_master_5";
char gangsUKey6[64] = "gangs_master_6";
char gangsUKey7[64] = "gangs_master_7";
char gangsUKey8[64] = "gangs_master_8";
char gangsUKey9[64] = "gangs_master_9";
char gangsUKey10[64] = "gangs_master_10";
char gangsUKey11[64] = "gangs_master_11";
char gangsUKey12[64] = "gangs_master_12";
char gangsUKey13[64] = "gangs_master_13";

char roundLRUKey1[64] = "roundlr_master_1";
char roundLRUKey2[64] = "roundlr_master_2";
char roundLRUKey3[64] = "roundlr_master_3";

int CTinLR = 0;
int TRinLR = 0;

public void OnPluginStart()
{
	Missions_RegisterMission(killReberUKey1, "I hate rebels Tier I", "Kill 5 rebels",5,200,"",groupTag1,true);
	Missions_RegisterMission(killReberUKey2, "I hate rebels Tier II", "Kill 10 rebels",10,400,killReberUKey1,groupTag1,true);
	Missions_RegisterMission(killReberUKey3, "I hate rebels Tier III", "Kill 25 rebels",25,1000,killReberUKey2,groupTag1,true);
	Missions_RegisterMission(killReberUKey4, "I hate rebels Tier IV", "Kill 50 rebels",50,2000,killReberUKey3,groupTag1,true);
	Missions_RegisterMission(killReberUKey5, "I hate rebels Tier V", "Kill 100 rebels",100,4000,killReberUKey4,groupTag1,true);
	Missions_RegisterMission(killReberUKey6, "I hate rebels Tier VI", "Kill 150 rebels",150,6000,killReberUKey5,groupTag1,true);
	Missions_RegisterMission(killReberUKey7, "I hate rebels Tier VII", "Kill 250 rebels",250,10000,killReberUKey6,groupTag1,true);
	Missions_RegisterMission(killReberUKey8, "I hate rebels Tier VIII", "Kill 500 rebels",500,20000,killReberUKey7,groupTag1,true);
	Missions_RegisterMission(killReberUKey9, "I hate rebels Tier IX", "Kill 750 rebels",750,30000,killReberUKey8,groupTag1,true);
	Missions_RegisterMission(killReberUKey10, "I hate rebels Tier X", "Kill 1000 rebels",1000,40000,killReberUKey9,groupTag1,true);
	Missions_RegisterMission(killReberUKey11, "I hate rebels Tier XI", "Kill 2500 rebels",2500,100000,killReberUKey10,groupTag1,true);
	Missions_RegisterMission(killReberUKey12, "I hate rebels Tier XII", "Kill 5000 rebels",5000,200000,killReberUKey11,groupTag1,true);
	Missions_RegisterMission(killReberUKey13, "I hate rebels Tier XIII", "Kill 10000 rebels",10000,400000,killReberUKey12,groupTag1,true);
	Missions_RegisterMission(killCTsUKey1, "I hate cops Tier I", "Kill 5 guards",5,200,"",groupTag1,true);
	Missions_RegisterMission(killCTsUKey2, "I hate cops Tier II", "Kill 10 guards",10,400,killCTsUKey1,groupTag1,true);
	Missions_RegisterMission(killCTsUKey3, "I hate cops Tier III", "Kill 25 guards",25,1000,killCTsUKey2,groupTag1,true);
	Missions_RegisterMission(killCTsUKey4, "I hate cops Tier IV", "Kill 50 guards",50,2000,killCTsUKey3,groupTag1,true);
	Missions_RegisterMission(killCTsUKey5, "I hate cops Tier V", "Kill 100 guards",100,4000,killCTsUKey4,groupTag1,true);
	Missions_RegisterMission(killCTsUKey6, "I hate cops Tier VI", "Kill 150 guards",150,6000,killCTsUKey5,groupTag1,true);
	Missions_RegisterMission(killCTsUKey7, "I hate cops Tier VII", "Kill 250 guards",250,10000,killCTsUKey6,groupTag1,true);
	Missions_RegisterMission(killCTsUKey8, "I hate cops Tier VIII", "Kill 500 guards",500,20000,killCTsUKey7,groupTag1,true);
	Missions_RegisterMission(killCTsUKey9, "I hate cops Tier IX", "Kill 750 guards",750,30000,killCTsUKey8,groupTag1,true);
	Missions_RegisterMission(killCTsUKey10, "I hate cops Tier X", "Kill 1000 guards",1000,40000,killCTsUKey9,groupTag1,true);
	Missions_RegisterMission(killCTsUKey11, "I hate cops Tier XI", "Kill 2500 guards",2500,100000,killCTsUKey10,groupTag1,true);
	Missions_RegisterMission(killCTsUKey12, "I hate cops Tier XII", "Kill 5000 guards",5000,200000,killCTsUKey11,groupTag1,true);
	Missions_RegisterMission(killCTsUKey13, "I hate cops Tier XIII", "Kill 10000 guards",10000,400000,killCTsUKey12,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey1, "I hate xeriffs Tier I", "Kill 5 xeriffs",5,200,"",groupTag1,true);
	Missions_RegisterMission(killXerifeUKey2, "I hate xeriffs Tier II", "Kill 10 xeriffs",10,400,killXerifeUKey1,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey3, "I hate xeriffs Tier III", "Kill 25 xeriffs",25,1000,killXerifeUKey2,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey4, "I hate xeriffs Tier IV", "Kill 50 xeriffs",50,2000,killXerifeUKey3,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey5, "I hate xeriffs Tier V", "Kill 100 xeriffs",100,4000,killXerifeUKey4,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey6, "I hate xeriffs Tier VI", "Kill 150 xeriffs",150,6000,killXerifeUKey5,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey7, "I hate xeriffs Tier VII", "Kill 250 xeriffs",250,10000,killXerifeUKey6,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey8, "I hate xeriffs Tier VIII", "Kill 500 xeriffs",500,20000,killXerifeUKey7,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey9, "I hate xeriffs Tier IX", "Kill 750 xeriffs",750,30000,killXerifeUKey8,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey10, "I hate xeriffs Tier X", "Kill 1000 xeriffs",1000,40000,killXerifeUKey9,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey11, "I hate xeriffs Tier XI", "Kill 2500 xeriffs",2500,100000,killXerifeUKey1,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey12, "I hate xeriffs Tier XII", "Kill 5000 xeriffs",5000,200000,killXerifeUKey1,groupTag1,true);
	Missions_RegisterMission(killXerifeUKey13, "I hate xeriffs Tier XIII", "Kill 10000 xeriffs",10000,400000,killXerifeUKey1,groupTag1,true);
	Missions_RegisterMission(winLRUKey1, "King of Resquests Tier I", "Win 5 LRs",5,200,"",groupTag1,true);
	Missions_RegisterMission(winLRUKey2, "King of Resquests Tier II", "Win 10 LRs",10,400,winLRUKey1,groupTag1,true);
	Missions_RegisterMission(winLRUKey3, "King of Resquests Tier III", "Win 25 LRs",25,1000,winLRUKey2,groupTag1,true);
	Missions_RegisterMission(winLRUKey4, "King of Resquests Tier IV", "Win 50 LRs",50,2000,winLRUKey3,groupTag1,true);
	Missions_RegisterMission(winLRUKey5, "King of Resquests Tier V", "Win 100 LRs",100,4000,winLRUKey4,groupTag1,true);
	Missions_RegisterMission(winLRUKey6, "King of Resquests Tier VI", "Win 150 LRs",150,6000,winLRUKey5,groupTag1,true);
	Missions_RegisterMission(winLRUKey7, "King of Resquests Tier VII", "Win 250 LRs",250,10000,winLRUKey6,groupTag1,true);
	Missions_RegisterMission(winLRUKey8, "King of Resquests Tier VIII", "Win 500 LRs",500,20000,winLRUKey7,groupTag1,true);
	Missions_RegisterMission(winLRUKey9, "King of Resquests Tier IX", "Win 750 LRs",750,30000,winLRUKey8,groupTag1,true);
	Missions_RegisterMission(winLRUKey10, "King of Resquests Tier X", "Win 1000 LRs",1000,40000,winLRUKey9,groupTag1,true);
	Missions_RegisterMission(winLRUKey11, "King of Resquests Tier XI", "Win 2500 LRs",2500,100000,winLRUKey10,groupTag1,true);
	Missions_RegisterMission(winLRUKey12, "King of Resquests Tier XII", "Win 5000 LRs",5000,200000,winLRUKey11,groupTag1,true);
	Missions_RegisterMission(winLRUKey13, "King of Resquests Tier XIII", "Win 10000 LRs",10000,400000,winLRUKey12,groupTag1,true);
	Missions_RegisterMission(getRebelUKey1, "Los Rebels Tier I", "Rebel 5 times",5,200,"",groupTag1,true);
	Missions_RegisterMission(getRebelUKey2, "Los Rebels Tier II", "Rebel 10 times",10,400,getRebelUKey1,groupTag1,true);
	Missions_RegisterMission(getRebelUKey3, "Los Rebels Tier III", "Rebel 25 times",25,1000,getRebelUKey2,groupTag1,true);
	Missions_RegisterMission(getRebelUKey4, "Los Rebels Tier IV", "Rebel 50 times",50,2000,getRebelUKey3,groupTag1,true);
	Missions_RegisterMission(getRebelUKey5, "Los Rebels Tier V", "Rebel 100 times",100,4000,getRebelUKey4,groupTag1,true);
	Missions_RegisterMission(getRebelUKey6, "Los Rebels Tier VI", "Rebel 150 times",150,6000,getRebelUKey5,groupTag1,true);
	Missions_RegisterMission(getRebelUKey7, "Los Rebels Tier VII", "Rebel 250 times",250,10000,getRebelUKey6,groupTag1,true);
	Missions_RegisterMission(getRebelUKey8, "Los Rebels Tier VIII", "Rebel 500 times",500,20000,getRebelUKey7,groupTag1,true);
	Missions_RegisterMission(getRebelUKey9, "Los Rebels Tier IX", "Rebel 750 times",750,30000,getRebelUKey8,groupTag1,true);
	Missions_RegisterMission(getRebelUKey10, "Los Rebels Tier X", "Rebel 1000 times",1000,40000,getRebelUKey9,groupTag1,true);
	Missions_RegisterMission(getRebelUKey11, "Los Rebels Tier XI", "Rebel 2500 times",2500,100000,getRebelUKey10,groupTag1,true);
	Missions_RegisterMission(getRebelUKey12, "Los Rebels Tier XII", "Rebel 5000 times",5000,200000,getRebelUKey11,groupTag1,true);
	Missions_RegisterMission(getRebelUKey13, "Los Rebels Tier XIII", "Rebel 10000 times",10000,400000,getRebelUKey12,groupTag1,true);
	Missions_RegisterMission(gangsUKey1, "Street Fight Tier I", "Kill 5 members of other gangs",5,200,"",groupTag1,true);
	Missions_RegisterMission(gangsUKey2, "Street Fight Tier II", "Kill 10 members of other gangs",10,400,gangsUKey1,groupTag1,true);
	Missions_RegisterMission(gangsUKey3, "Street Fight Tier III", "Kill 25 members of other gangs",25,1000,gangsUKey2,groupTag1,true);
	Missions_RegisterMission(gangsUKey4, "Street Fight Tier IV", "Kill 50 members of other gangs",50,2000,gangsUKey3,groupTag1,true);
	Missions_RegisterMission(gangsUKey5, "Street Fight Tier V", "Kill 100 members of other gangs",100,4000,gangsUKey4,groupTag1,true);
	Missions_RegisterMission(gangsUKey6, "Street Fight Tier VI", "Kill 150 members of other gangs",150,6000,gangsUKey5,groupTag1,true);
	Missions_RegisterMission(gangsUKey7, "Street Fight Tier VII", "Kill 250 members of other gangs",250,10000,gangsUKey6,groupTag1,true);
	Missions_RegisterMission(gangsUKey8, "Street Fight Tier VIII", "Kill 500 members of other gangs",500,20000,gangsUKey7,groupTag1,true);
	Missions_RegisterMission(gangsUKey9, "Street Fight Tier IX", "Kill 750 members of other gangs",750,30000,gangsUKey8,groupTag1,true);
	Missions_RegisterMission(gangsUKey10, "Street Fight Tier X", "Kill 1000 members of other gangs",1000,40000,gangsUKey9,groupTag1,true);
	Missions_RegisterMission(gangsUKey11, "Street Fight Tier XI", "Kill 2500 members of other gangs",2500,100000,gangsUKey10,groupTag1,true);
	Missions_RegisterMission(gangsUKey12, "Street Fight Tier XII", "Kill 5000 members of other gangs",5000,200000,gangsUKey11,groupTag1,true);
	Missions_RegisterMission(gangsUKey13, "Street Fight Tier XIII", "Kill 10000 members of other gangs",10000,400000,gangsUKey12,groupTag1,true);
	Missions_RegisterMission(roundLRUKey1, "I dont want only 1 request Tier I", "Win 2 LRs in a row on the same round",2,1000,"",groupTag1,true);
	Missions_RegisterMission(roundLRUKey2, "I dont want only 1 request Tier II", "Win 4 LRs in a row on the same round",4,2000,roundLRUKey1,groupTag1,true);
	Missions_RegisterMission(roundLRUKey3, "I dont want only 1 request Tier III", "Win 6 LRs in a row on the same round",5,4000,roundLRUKey2,groupTag1,true);
	
	HookEvent("player_death", onPlayerDeath);
	HookEvent("round_start", onRoundStart);
	HookEvent("player_hurt", OnPlayerHurt);
}

public void onRoundStart(Handle hEvent, const char[] sName, bool bDontBroadcast) {
	for (int i = 0; i < MAXPLAYERS + 1; i++) {
		g_iCounter[i] = 0;
		g_iFirstHit[i] = false;
	}
	CTinLR = 0;
	TRinLR = 0;
}

public Action OnPlayerHurt(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	if (!IsValidClient(client) || GetClientTeam(client) != 3)
	{
		return;
	}
	
	int iAttacker = GetClientOfUserId(event.GetInt("attacker"));
	if (!IsValidClient(iAttacker) || iAttacker == client || GetClientTeam(iAttacker) != 2)
	{
		return;
	}
	
	if (IsClientInLastRequest(iAttacker)) {
		return;
	}
	
	if (IsClientRebel(iAttacker) && g_iFirstHit[iAttacker]) {
		return;
	}
	g_iFirstHit[iAttacker] = false;
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey1);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey2);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey3);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey4);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey5);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey6);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey7);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey8);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey9);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey10);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey11);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey12);
	Mission_IncrementMissionProgress(iAttacker, getRebelUKey13);
}

public Action onPlayerDeath(Event event, const char[] name, bool dontBroadcast) {
	int attacker = GetClientOfUserId(event.GetInt("attacker"));
	int victim = GetClientOfUserId(GetEventInt(event, "userid"));
	if (!IsValidClient(attacker) || !IsValidClient(victim))
		return;
	char weaponName[64];
	GetClientWeapon(attacker, weaponName, sizeof(weaponName));
	if (attacker != victim && GetClientTeam(attacker) == 3 && IsClientRebel(victim)) {
		Mission_IncrementMissionProgress(attacker, killReberUKey1);
		Mission_IncrementMissionProgress(attacker, killReberUKey2);
		Mission_IncrementMissionProgress(attacker, killReberUKey3);
		Mission_IncrementMissionProgress(attacker, killReberUKey4);
		Mission_IncrementMissionProgress(attacker, killReberUKey5);
		Mission_IncrementMissionProgress(attacker, killReberUKey6);
		Mission_IncrementMissionProgress(attacker, killReberUKey7);
		Mission_IncrementMissionProgress(attacker, killReberUKey8);
		Mission_IncrementMissionProgress(attacker, killReberUKey9);
		Mission_IncrementMissionProgress(attacker, killReberUKey10);
		Mission_IncrementMissionProgress(attacker, killReberUKey11);
		Mission_IncrementMissionProgress(attacker, killReberUKey12);
		Mission_IncrementMissionProgress(attacker, killReberUKey13);
	} else if (attacker != victim && GetClientTeam(attacker) == 2 && GetClientTeam(victim) == 3) {
		Mission_IncrementMissionProgress(attacker, killCTsUKey1);
		Mission_IncrementMissionProgress(attacker, killCTsUKey2);
		Mission_IncrementMissionProgress(attacker, killCTsUKey3);
		Mission_IncrementMissionProgress(attacker, killCTsUKey4);
		Mission_IncrementMissionProgress(attacker, killCTsUKey5);
		Mission_IncrementMissionProgress(attacker, killCTsUKey6);
		Mission_IncrementMissionProgress(attacker, killCTsUKey7);
		Mission_IncrementMissionProgress(attacker, killCTsUKey8);
		Mission_IncrementMissionProgress(attacker, killCTsUKey9);
		Mission_IncrementMissionProgress(attacker, killCTsUKey10);
		Mission_IncrementMissionProgress(attacker, killCTsUKey11);
		Mission_IncrementMissionProgress(attacker, killCTsUKey12);
		Mission_IncrementMissionProgress(attacker, killCTsUKey13);
	} else if (attacker != victim && GetClientTeam(attacker) == 2 && GetClientTeam(victim) == 3 && warden_iswarden(victim)) {
		Mission_IncrementMissionProgress(attacker, killXerifeUKey1);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey2);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey3);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey4);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey5);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey6);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey7);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey8);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey9);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey10);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey11);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey12);
		Mission_IncrementMissionProgress(attacker, killXerifeUKey13);
	}
	
	if (attacker != victim && Gangs_HasGang(attacker) && Gangs_HasGang(victim)) {
		char gang1[50], gang2[50];
		Gangs_GetGangName(attacker, gang1, sizeof(gang1));
		Gangs_GetGangName(victim, gang2, sizeof(gang2));
		if (!StrEqual(gang1,gang2,true)) {
			Mission_IncrementMissionProgress(attacker, gangsUKey1);
			Mission_IncrementMissionProgress(attacker, gangsUKey2);
			Mission_IncrementMissionProgress(attacker, gangsUKey3);
			Mission_IncrementMissionProgress(attacker, gangsUKey4);
			Mission_IncrementMissionProgress(attacker, gangsUKey5);
			Mission_IncrementMissionProgress(attacker, gangsUKey6);
			Mission_IncrementMissionProgress(attacker, gangsUKey7);
			Mission_IncrementMissionProgress(attacker, gangsUKey8);
			Mission_IncrementMissionProgress(attacker, gangsUKey9);
			Mission_IncrementMissionProgress(attacker, gangsUKey10);
			Mission_IncrementMissionProgress(attacker, gangsUKey11);
			Mission_IncrementMissionProgress(attacker, gangsUKey12);
			Mission_IncrementMissionProgress(attacker, gangsUKey13);
		}
	}
	
	if(CTinLR > 0 && TRinLR > 0 && GetClientTeam(victim) == 3 && GetClientTeam(attacker) == 2 && attacker != victim)
	{
		CTinLR = 0;
		TRinLR = 0;
		Mission_IncrementMissionProgress(attacker, winLRUKey1);
		Mission_IncrementMissionProgress(attacker, winLRUKey2);
		Mission_IncrementMissionProgress(attacker, winLRUKey3);
		Mission_IncrementMissionProgress(attacker, winLRUKey4);
		Mission_IncrementMissionProgress(attacker, winLRUKey5);
		Mission_IncrementMissionProgress(attacker, winLRUKey6);
		Mission_IncrementMissionProgress(attacker, winLRUKey7);
		Mission_IncrementMissionProgress(attacker, winLRUKey8);
		Mission_IncrementMissionProgress(attacker, winLRUKey9);
		Mission_IncrementMissionProgress(attacker, winLRUKey10);
		Mission_IncrementMissionProgress(attacker, winLRUKey11);
		Mission_IncrementMissionProgress(attacker, winLRUKey12);
		Mission_IncrementMissionProgress(attacker, winLRUKey13);
		
		++g_iCounter[attacker];
		if (g_iCounter[attacker]== 2)
			Mission_IncrementMissionProgress(attacker, roundLRUKey1);
		if (g_iCounter[attacker]== 4)
			Mission_IncrementMissionProgress(attacker, roundLRUKey2);
		if (g_iCounter[attacker]== 6)
			Mission_IncrementMissionProgress(attacker, roundLRUKey3);
		
		return;
	}
	if(CTinLR > 0 && TRinLR > 0 && GetClientTeam(victim) == 3 && GetClientTeam(attacker) == 3 && attacker == victim)
	{
		CTinLR = 0;
		TRinLR = 0;
		Mission_IncrementMissionProgress(attacker, winLRUKey1);
		Mission_IncrementMissionProgress(attacker, winLRUKey2);
		Mission_IncrementMissionProgress(attacker, winLRUKey3);
		Mission_IncrementMissionProgress(attacker, winLRUKey4);
		Mission_IncrementMissionProgress(attacker, winLRUKey5);
		Mission_IncrementMissionProgress(attacker, winLRUKey6);
		Mission_IncrementMissionProgress(attacker, winLRUKey7);
		Mission_IncrementMissionProgress(attacker, winLRUKey8);
		Mission_IncrementMissionProgress(attacker, winLRUKey9);
		Mission_IncrementMissionProgress(attacker, winLRUKey10);
		Mission_IncrementMissionProgress(attacker, winLRUKey11);
		Mission_IncrementMissionProgress(attacker, winLRUKey12);
		Mission_IncrementMissionProgress(attacker, winLRUKey13);
		
		++g_iCounter[attacker];
		if (g_iCounter[attacker]== 2)
			Mission_IncrementMissionProgress(attacker, roundLRUKey1);
		if (g_iCounter[attacker]== 4)
			Mission_IncrementMissionProgress(attacker, roundLRUKey2);
		if (g_iCounter[attacker]== 6)
			Mission_IncrementMissionProgress(attacker, roundLRUKey3);
		return;
	}
}

public void OnMissionAwarded(int client, char uniqueKey[64], int rewardAmount) {
	if (StrContains(uniqueKey,"gangs_master",false) != -1)
		Gangs_SetCredits(client, Gangs_GetCredits(client) + RoundToNearest(rewardAmount * 0.1));
}

public int OnStartLR(int PrisonerIndex, int GuardIndex, int LRType)
{
	CTinLR = GuardIndex;
	TRinLR = PrisonerIndex;
}

stock bool IsValidClient(int client) {
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}

public void OnPluginEnd() {
	Missions_Finalize();
}
