Tips:
- To configure Sarge AI use the fn_preInit.sqf file inside the init folder of the sarge PBO.
- You can make groups size, type and percentage adjustments by using the *_grps_mapName.sqf file inside the code\map_config folder.

### Step 1
Place the sarge PBO inside the @ExileServer\addons folder.

### Step 2
Place the ExileClient_system_rating_balance.sqf and Exileclient_system_lootmanager_thread_spawn.sqf files with your other override files or inside the mission root then open the config.cpp file in the mission root and search for the word CfgExileCustomCode and add this line:
```html
class CfgExileCustomCode 
{
	/*
		You can overwrite every single file of our code without touching it.
		To do that, add the function name you want to overwrite plus the 
		path to your custom file here. If you wonder how this works, have a
		look at our bootstrap/fn_preInit.sqf function.

		Simply add the following scheme here:

		<Function Name of Exile> = "<New File Name>";

		Example:

		ExileClient_util_fusRoDah = "myaddon\myfunction.sqf";
	*/
	ExileClient_system_rating_balance = "ExileClient_system_rating_balance.sqf";
	Exileclient_system_lootmanager_thread_spawn = "Exileclient_system_lootmanager_thread_spawn.sqf";
};
```

### Step3
In the exile server config.cpp add the following inside the Buildings class
```html
	class Land_UWreck_Heli_Attack_02_F
	{
		table = "Military";
		positions[] = {{-1.17383, 8.0918, -2.79785}, {2.92285, -9.17188, -2.77692}, {3.7041, 0.40918, -2.84418}, {-0.260742, -9.69434, -2.67627}, {2.69434, 7.49609, -2.72632}, {1.69922, 10.1006, -2.71313}, {6.04102, 1.19434, -2.90607}, {4.15332, -3.63574, -2.86328}, {0.224609, 4.14941, -2.80768}, {-1.55957, 1.5957, -2.79156}, {-3.49121, 5.05664, -2.82739}, {2.37891, -5.42676, -2.78564}, {-4.07129, -2.78711, -2.71198}, {-1.16895, -6.24023, -2.71613}, {6.19141, -1.70313, -2.93707}, {2.27148, 3.82129, -2.76392}, {-0.84082, -0.824219, -2.7915}, {-4.71973, 1.80469, -2.78058}, {2.14648, -1.65723, -2.79163}};
	};
```
### Step 3 InfiniStar (Optional)
In the EXILE_AH.sqf file do a search for rating. This should be line 793 and should look like the below. Remove this line:
```html
if(rating player < 999999)then{player addRating 9999999;};
```
Then look for this about line 3955:
```html
if(_rating < 500000)then
```
Now change it to this:
```html
if(0==1)then
```
