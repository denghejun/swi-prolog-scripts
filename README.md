## SWI-Prolog samples

##### 1. Install SWI-Prolog (Mac)
Install link is here: https://www.swi-prolog.org/download/stable


And then update $PATH:
```
export PATH="/Applications/SWI-Prolog.app/Contents/MacOS:$PATH"
```


##### 2. How to run (e.g. murder.pl)
```
swipl murder.pl
```
and then
```
location_analysis(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy).
```
or
```
weapon_analysis(PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope).
```

or
```
arrest(X).
```

PS: watch out there is a "." at the end of each command line.