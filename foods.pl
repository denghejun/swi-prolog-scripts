%fact
chinese_food(noodle).
chinese_food(bun).
chinese_food(hamburger).
indian_food(hakuna).
american_food(hamburger).


%rule
love(john, Food) :- chinese_food(Food).
love(tom, Food) :- indian_food(Food).
love(molly, Food) :- chinese_food(Food), american_food(Food).