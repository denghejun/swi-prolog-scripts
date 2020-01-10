%Boddy 先生死于谋杀，现有六个嫌疑犯，每个人在不同的房间，每间房间各有一件可能的凶器，但不知道嫌疑犯、房间、凶器的对应关系。
%请根据下面的条件和线索，找出谁是凶手。
%
%已知条件：六个嫌疑犯是三男（George、John、Robert）三女（Barbara、Christine、Yolanda）。
%六个嫌疑犯分别待在六个房间：
%浴室（Bathroom）、饭厅（Dining Room）、厨房（Kitchen）、起居室（Living Room）、 储藏室（Pantry）、书房（Study）。

%每间房间都有一件可疑的物品，可以当作凶器：
%包（Bag）、火枪（Firearm）、煤气（Gas）、刀（Knife）、毒药（Poison）、绳索（Rope）。
%
%线索一：厨房里面是一个男人，那里的凶器不是绳索、刀子、包和火枪。
%线索二：Barbara 和 Yolanda 在浴室和书房。
%线索三：带包的那个人不是 Barbara 和 George，也不在浴室和饭厅。
%线索四：书房里面是一个带绳子的女人。
%线索五：起居室里面那件凶器，与 John 或 George 在一起。
%线索六：刀子不在饭厅。
%线索七：书房和食品储藏室里面的凶器，没跟 Yolanda 在一起。
%线索八：George 所在的那间屋子有火枪。
%线索九：Boddy 先生死在食品储藏室里，那里的凶器是煤气。


man(george). man(john). man(robert).
woman(barbara). woman(christine). woman(yolanda).
%where(bathroom). where(diningroom). where(kitchen). where(livingroom). where(pantry). where(study).
%weapon(bag). weapon(firearm). weapon(gas). weapon(knife). weapon(poison). weapon(rope).

is_criminal_suspect(Name) :- man(Name); woman(Name).
%crimial_location(Where) :- where(Where).
unique_location_condition(
 PersonInBathroom,
 PersonInDiningRoom,
 PersonInKitchen,
 PersonInLivingRoom,
 PersonInPantry,
 PersonInStudy) :-
is_criminal_suspect(PersonInBathroom),
is_criminal_suspect(PersonInDiningRoom),
is_criminal_suspect(PersonInKitchen),
is_criminal_suspect(PersonInLivingRoom),
is_criminal_suspect(PersonInPantry),
is_criminal_suspect(PersonInStudy),
\+ PersonInBathroom=PersonInDiningRoom,
\+ PersonInBathroom=PersonInKitchen,
\+ PersonInBathroom=PersonInLivingRoom,
\+ PersonInBathroom=PersonInPantry,
\+ PersonInBathroom=PersonInStudy,
\+ PersonInDiningRoom=PersonInKitchen,
\+ PersonInDiningRoom=PersonInLivingRoom,
\+ PersonInDiningRoom=PersonInPantry,
\+ PersonInDiningRoom=PersonInStudy,
\+ PersonInKitchen=PersonInLivingRoom,
\+ PersonInKitchen=PersonInPantry,
\+ PersonInKitchen=PersonInStudy,
\+ PersonInLivingRoom=PersonInPantry,
\+ PersonInLivingRoom=PersonInStudy,
\+ PersonInPantry=PersonInStudy.

unique_weapon_condition(
 PersonWithBag,
 PersonWithFirearm,
 PersonWithGas,
 PersonWithKnife,
 PersonWithPoison,
 PersonWithRope) :-
is_criminal_suspect(PersonWithBag),
is_criminal_suspect(PersonWithFirearm),
is_criminal_suspect(PersonWithGas),
is_criminal_suspect(PersonWithKnife),
is_criminal_suspect(PersonWithPoison),
is_criminal_suspect(PersonWithRope),
\+ PersonWithBag=PersonWithFirearm,
\+ PersonWithBag=PersonWithGas,
\+ PersonWithBag=PersonWithKnife,
\+ PersonWithBag=PersonWithPoison,
\+ PersonWithBag=PersonWithRope,
\+ PersonWithFirearm=PersonWithGas,
\+ PersonWithFirearm=PersonWithKnife,
\+ PersonWithFirearm=PersonWithPoison,
\+ PersonWithFirearm=PersonWithRope,
\+ PersonWithGas=PersonWithKnife,
\+ PersonWithGas=PersonWithPoison,
\+ PersonWithGas=PersonWithRope,
\+ PersonWithKnife=PersonWithPoison,
\+ PersonWithKnife=PersonWithRope,
\+ PersonWithPoison=PersonWithRope.

%线索一：厨房里面是一个男人，那里的凶器不是绳索、刀子、包和火枪。
clue1(PersonInBathroom,
       PersonInDiningRoom,
       PersonInKitchen,
       PersonInLivingRoom,
       PersonInPantry,
       PersonInStudy,
       PersonWithBag,
       PersonWithFirearm,
       PersonWithGas,
       PersonWithKnife,
       PersonWithPoison,
       PersonWithRope) :-
       man(PersonInKitchen),
       \+ PersonInKitchen=PersonWithRope,
       \+ PersonInKitchen=PersonWithKnife,
       \+ PersonInKitchen=PersonWithBag,
       \+ PersonInKitchen=PersonWithFirearm
       .

%线索二：Barbara 和 Yolanda 在浴室和书房。
clue2(PersonInBathroom,
       PersonInDiningRoom,
       PersonInKitchen,
       PersonInLivingRoom,
       PersonInPantry,
       PersonInStudy,
       PersonWithBag,
       PersonWithFirearm,
       PersonWithGas,
       PersonWithKnife,
       PersonWithPoison,
       PersonWithRope) :-
       woman(PersonInBathroom),
       woman(PersonInStudy),
       (PersonInBathroom=barbara;PersonInBathroom=yolanda),
       (PersonInStudy=barbara;PersonInStudy=yolanda).

%线索三：带包的那个人不是 Barbara 和 George，也不在浴室和饭厅。
clue3(PersonInBathroom,
       PersonInDiningRoom,
       PersonInKitchen,
       PersonInLivingRoom,
       PersonInPantry,
       PersonInStudy,
       PersonWithBag,
       PersonWithFirearm,
       PersonWithGas,
       PersonWithKnife,
       PersonWithPoison,
       PersonWithRope) :-
       \+ PersonWithBag=barbara,
       \+ PersonWithBag=george,
       \+ PersonWithBag=PersonInBathroom,
       \+ PersonWithBag=PersonInDiningRoom.

%线索四：书房里面是一个带绳子的女人。
clue4(PersonInBathroom,
       PersonInDiningRoom,
       PersonInKitchen,
       PersonInLivingRoom,
       PersonInPantry,
       PersonInStudy,
       PersonWithBag,
       PersonWithFirearm,
       PersonWithGas,
       PersonWithKnife,
       PersonWithPoison,
       PersonWithRope) :-
       woman(PersonInStudy),
       PersonInStudy=PersonWithRope.

%线索五：起居室里面那件凶器，与 John 或 George 在一起。
clue5(PersonInBathroom,
       PersonInDiningRoom,
       PersonInKitchen,
       PersonInLivingRoom,
       PersonInPantry,
       PersonInStudy,
       PersonWithBag,
       PersonWithFirearm,
       PersonWithGas,
       PersonWithKnife,
       PersonWithPoison,
       PersonWithRope) :-
       (PersonInLivingRoom=john;PersonInLivingRoom=george).

%线索六：刀子不在饭厅。
clue6(PersonInBathroom,
       PersonInDiningRoom,
       PersonInKitchen,
       PersonInLivingRoom,
       PersonInPantry,
       PersonInStudy,
       PersonWithBag,
       PersonWithFirearm,
       PersonWithGas,
       PersonWithKnife,
       PersonWithPoison,
       PersonWithRope) :-
       \+ PersonInDiningRoom=PersonWithKnife.

%线索七：书房和食品储藏室里面的凶器，没跟 Yolanda 在一起。
clue7(PersonInBathroom,
       PersonInDiningRoom,
       PersonInKitchen,
       PersonInLivingRoom,
       PersonInPantry,
       PersonInStudy,
       PersonWithBag,
       PersonWithFirearm,
       PersonWithGas,
       PersonWithKnife,
       PersonWithPoison,
       PersonWithRope) :-
       \+ PersonInStudy=yolanda,
       \+ PersonInPantry=yolanda.

%线索八：George 所在的那间屋子有火枪。
clue8(PersonInBathroom,
       PersonInDiningRoom,
       PersonInKitchen,
       PersonInLivingRoom,
       PersonInPantry,
       PersonInStudy,
       PersonWithBag,
       PersonWithFirearm,
       PersonWithGas,
       PersonWithKnife,
       PersonWithPoison,
       PersonWithRope) :-
       PersonWithFirearm=george.

%线索九：Boddy 先生死在食品储藏室里，那里的凶器是煤气。
clue9(PersonInBathroom,
       PersonInDiningRoom,
       PersonInKitchen,
       PersonInLivingRoom,
       PersonInPantry,
       PersonInStudy,
       PersonWithBag,
       PersonWithFirearm,
       PersonWithGas,
       PersonWithKnife,
       PersonWithPoison,
       PersonWithRope) :-
       PersonInPantry=PersonWithGas.


location_analysis(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy):-
unique_location_condition(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy),
unique_weapon_condition(PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue1(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue2(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue3(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue4(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue5(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue6(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue7(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue8(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue9(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope).

weapon_analysis(PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope):-
unique_location_condition(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy),
unique_weapon_condition(PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue1(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue2(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue3(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue4(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue5(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue6(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue7(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue8(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue9(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope).


arrest(X) :-
unique_location_condition(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy),
unique_weapon_condition(PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue1(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue2(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue3(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue4(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue5(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue6(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue7(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue8(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
clue9(PersonInBathroom,PersonInDiningRoom,PersonInKitchen,PersonInLivingRoom,PersonInPantry,PersonInStudy,PersonWithBag,PersonWithFirearm,PersonWithGas,PersonWithKnife,PersonWithPoison,PersonWithRope),
X=PersonWithGas, X=PersonInPantry.

