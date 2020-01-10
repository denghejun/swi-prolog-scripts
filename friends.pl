% facts
friend(john, julia).
friend(john, jack).
friend(julia, sam).
friend(julia, molly).

% rules
friends(X, Y) :- friend(X, Y); friend(Y,X).


% query
%friends(julia,john).
%friends(julia,john1).