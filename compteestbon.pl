ecrire([]).
ecrire([X|Liste]):-write(X),nl,ecrire(Liste).
epelle():- read(X),atom_chars(X, Liste),ecrire(Liste).




enlever(X,[X|R],R).
enlever(X,[F|R],[F|S]) :- enlever(X,R,S).

sommefaisable(X,[Y|L]) :- Y is X.
sommefaisable(X,L) :- enlever(A,L,R), S is X-A, sommefaisable(S,R).

resoudre(0,L,entier(0)).
resoudre(X,[X|L],entier(X)).    
resoudre(X,L,plus(entier(A),E)) :- enlever(A,L,R), S is X-A, resoudre(S,R,E).
resoudre(X,L,moins(E,entier(A))) :- enlever(A,L,R), S is X+A, resoudre(S,R,E).
resoudre(X,L,mult(entier(A),E)) :- enlever(A,L,R), A\=1, 0 is X mod A, S is X//A, resoudre(S,R,E).
resoudre(X,L,div(E,entier(A))) :- enlever(A,L,R), A\=0, A\=1, S is X*A, resoudre(S,R,E).

affiche_expr(entier(X)) :- write(X).
affiche_expr(plus(X,Y)) :- write('('), affiche_expr(X), write('+'), affiche_expr(Y), write(')').
affiche_expr(moins(X,Y)) :- write('('), affiche_expr(X), write('-'), affiche_expr(Y), write(')').
affiche_expr(mult(X,Y)) :- write('('), affiche_expr(X), write('*'), affiche_expr(Y), write(')').
affiche_expr(div(X,Y)) :- write('('), affiche_expr(X), write('/'), affiche_expr(Y), write(')').
    
prog(X,L) :- resoudre(X,L,E), affiche_expr(E).
