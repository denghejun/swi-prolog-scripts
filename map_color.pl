color(red).
color(green).
color(blue).

is_color(Color) :- color(Color).

paint(A,B,C,D,E) :- is_color(A),is_color(B),is_color(C),is_color(D),is_color(E),
                    \+ A=B, \+ A=C, \+ A=D, \+ A=E,
                    \+ B=A, \+ B=C,
                    \+ C=A, \+ C=B, \+ C=D,
                    \+ D=A, \+ D=C, \+ D=E,
                    \+ E=A, \+ E=D.
