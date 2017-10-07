#if defined _missions_included_
  #endinput
#endif
#define _missions_included_

/*
    Registers a new Mission
		
    @Param1 -> char UniqueKey[64]
    @Param2- > char MissionName[256]
	@Param3- > char MissionDescription[1024]
	@Param4 -> int Max Requirement
	@param5 -> int reward Amount
    @Param6 -> char preMissionKey[64] (Mission that has to be completed to accept this)
    @Param7 -> char category[64] to group | "" for none (not recommended)
    @Param8 -> bool broadcast | if false don't broadcast any message regarding mission
		
	@return -
*/
native void Missions_RegisterMission(char uniqueKey[64], char MissionName[256], char MissionDescription[1024], int maxRequirement, int rewardAmount, char preMissionKey[64], char category[64], bool broadcast);
	
/*
		Store the UniqueKey of the Active mission from a client
		@Param1 -> client index
		@Param2 -> buffer for the key[64]

		@return -
*/
native void Missions_GetActiveUniqueKey(int client, char keyBuffer[64]);
	
/*
	Return if the Client has an Active Mission
		
	@Param1 -> client index
		
	@return -> true or false
*/
native bool Missions_HasActiveMission(int client);
	
/*
	Return the Active Mission name
		
	@Param1 -> client index
	@Param2 -> buffer for the Name[64]
		
	@return -
*/
native void Missions_GetActiveMissionName(int client, char nameBuffer[64]);
	
/*
	Returns the current Progress on the Active client Mission
		
	@Param1 -> client index
		
	@return -> int progress
*/
native int Missions_GetMissionProgress(int client);
	
/*
	Return the Maximum Requirement for the Currently Active Mission
		
	@Param1 -> client index
		
	@return -> int maxRequirement
*/
native int Missions_GetMissionsMaxRequirement(int client);
	
/*
	Return if the Active mission is completed
		
	@Param1 -> client index
		
	@return -> true or false
	
*/
native bool Missions_IsMissionCompleted(int client);
	
/*
	Return if the Active mission is awarded
		
	@Param1 -> client index
		
	@return -> true or false
*/
native bool Missions_IsMissionAwarded(int client);
	
/*
	Return store is active
		
	@return -> true or false
*/
native bool Missions_CanUseStore();


/*
	Increments a Mission's progress
		
	@Param1 -> int client index
	@Param2 -> char key[64]
	
	@return -
*/
native void Mission_IncrementMissionProgress(int client, char key[64]);
	
/*
	Increments a Mission's progress
		
	@Param1 -> int client index
	@Param2 -> char key[64]
	@Param3 -> int amount
		
	@return -
*/
native void Mission_AddToMissionProgress(int client, char key[64], int amount);
	
/*
	Sets a Mission's progress
		
	@Param1 -> int client index
	@Param2 -> char key[64]
	@Param3 -> int value to set
		
	@return -
*/
native bool Mission_SetMissionProgress(int client, char key[64], int value);

/*
	Checks if a Client has completed a certain Mission
		
	@Param1 -> client index
	@Param2 -> char uniqueKey[64]
	
*/
native bool Mission_HasClientCompletedMission(int client, char key[64]);
  
  
/*
	Returns if the given key[64] is the Key of the currently active mission
		
	@Param1 -> client index
	@Param2 -> char key[64]
		
	@return true or false
*/
native bool Missions_IsActiveMissionKey(int client, char key[64]);

/*
	Unloads a Mission from the Core
		
	@no Params
		
	@return -

	ALWAYS IMPLEMENT IN OnPluginEnd !
*/
native void Missions_Finalize();
    
    
/*
	Forward when a Mission is started
		
	@Param1 -> int client
	@Param2 -> char uniqueKey[64]
*/
forward void OnMissionAccept(int client, char uniqueKey[64]);
	
/*
	Forward when a Mission is aborted
		
	@Param1 -> int client
	@Param2 -> char uniqueKey[64]
*/
forward void OnMissionAbort(int client, char uniqueKey[64]);

/*
	Forward when a Mission is completed
	
	@Param1 -> int client
	@Param2 -> char uniqueKey[64]
*/
forward void OnMissionCompleted(int client, char uniqueKey[64]);
	
/*
	Foward when a Mission reward is given out
		
	@Param1 -> int client
	@Param2 -> char uniqueKey[64]
	@Param3 -> int rewardAmount
*/
forward void OnMissionAwarded(int client, char uniqueKey[64], int rewardAmount);
   
/*
	Forward when a client joins the Server and continues his mission or accepts a new one
		
	@Param 1 -> int client
	@Param 2 -> char key[64]
*/
forward void OnMissionAssigned(int client, char key[64]);

/*
	Forward when a client joins the Server and continues his mission or accepts a new one
		
	@Param 1 -> int client
	@Param 2 -> char key[64]
*/
forward void OnMissionSuspended(int client, char key[64]);