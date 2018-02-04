#pragma semicolon 1

#define PLUGIN_AUTHOR "Totenfluch"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <missions>

#pragma newdecls required


char takeGrenadeDamage[64] = "pyromancer_1_600";
char takeGrenadeDamage2[64] = "pyromancer_2_900";

char takeFallDamage[64] = "freefall_1_200";

public Plugin myinfo = 
{
	name = "Missions: inflict damage", 
	author = PLUGIN_AUTHOR, 
	description = "Adds inflict damage missions to Totenfluchs Mission Plugin", 
	version = PLUGIN_VERSION, 
	url = "http://ggc-base.de"
};

public void OnPluginStart() {
	Missions_RegisterMission(takeGrenadeDamage, "Pyromancer", "Take 1000 damage from grenades", 1000, 600, "", "Self harm", true);
	Missions_RegisterMission(takeGrenadeDamage2, "Crazy Pyromancer", "Take 2500 damage from grenades", 2500, 900, takeGrenadeDamage, "Self harm", true);

	Missions_RegisterMission(takeFallDamage, "Freefall", "Take 1000 falldamage", 1000, 200, "", "Self harm", true);

}

public void OnPluginEnd() {
	Missions_Finalize();
}

public void OnClientPostAdminCheck(int client) {
	SDKHook(client, SDKHook_OnTakeDamage, OnTakeDamage);
}

public void OnClientDisconnect(int client) {
	SDKUnhook(client, SDKHook_OnTakeDamage, OnTakeDamage);
}

public Action OnTakeDamage(int victim, int &attacker, int &inflictor, float &damage, int &damagetype, int &bweapon, float damageForce[3], const float damagePosition[3]) {
	int preHp = GetClientHealth(victim);
	int rDamage = RoundToNearest(damage);
	int addvalue = rDamage;
	if (rDamage > preHp)
		addvalue = preHp;
	
	if (damagetype & DMG_BLAST) {
		if (rDamage > preHp)
			addvalue = preHp;
		Mission_AddToMissionProgress(victim, takeGrenadeDamage, addvalue);
		Mission_AddToMissionProgress(victim, takeGrenadeDamage2, addvalue);
	}
	
	if (damagetype & DMG_FALL) {
		if (rDamage > preHp)
			addvalue = preHp;
		Mission_AddToMissionProgress(victim, takeFallDamage, addvalue);
	}
}


stock bool IsWorldDamage(int iAttacker, int damagetype)
{
	if (damagetype == DMG_FALL
		 || damagetype == DMG_GENERIC
		 || damagetype == DMG_CRUSH
		 || damagetype == DMG_SLASH
		 || damagetype == DMG_BURN
		 || damagetype == DMG_VEHICLE
		 || damagetype == DMG_FALL
		 || damagetype == DMG_BLAST
		 || damagetype == DMG_SHOCK
		 || damagetype == DMG_SONIC
		 || damagetype == DMG_ENERGYBEAM
		 || damagetype == DMG_DROWN
		 || damagetype == DMG_PARALYZE
		 || damagetype == DMG_NERVEGAS
		 || damagetype == DMG_POISON
		 || damagetype == DMG_ACID
		 || damagetype == DMG_AIRBOAT
		 || damagetype == DMG_PLASMA
		 || damagetype == DMG_RADIATION
		 || damagetype == DMG_SLOWBURN
		 || iAttacker == 0
		)
	return true;
	return false;
}
