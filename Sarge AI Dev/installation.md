### Step 1
Make your changes in the SAR_config.sqf file at the root of the sarge folder.

### Step 2
Repackage the sarge folder into a PBO fomat. This requires a PBO manager.
Place sarge PBO alongside the exile PBOs in the @ExileServer\addons folder.

### Step 3
Copy the scripts folder to the root of the mission PBO. This also requires a PBO manager.

### Step 2
In the init.sqf file in the root of the mission PBO this code to the very top line:
```html
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";
```

### Step 2 InfiniStar (Optional)
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
### Step 4
Repackage your PBOs and enjoy!
