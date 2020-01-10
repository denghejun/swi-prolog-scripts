%facts
human(tom).
animal(cat).
can_thinking_entity(X) :- human(X); animal(X).

%rule
exists(X) :- can_thinking_entity(X).
