:- dynamic habite/3.


ville(paris,'Ile de France').
ville(orleans,'Centre- Val de Loire').
ville(strasbourg,'Grand Est').
ville(mulhouse, 'Grand Est').
ville(colmar,'Grand Est').
ville(nancy, 'Grand Est').
ville(toulouse,'Auvergne Rhône Alpes').
ville(grenoble,'Provence-Alpes-Côte d’Azur').

region('Ile de France').
region('Grand Est').
region('Auvergne Rhône Alpes').
region('Provence-Alpes-Côte d’Azur').
region('Centre- Val de Loire').


est_dans('rue des ecureuils', 'quartier de la gare').
est_dans('quartier de la gare', onzieme).
est_dans(onzieme, paris).
est_dans('lieu dit de l\'impasse', orleans).
est_dans('rue du renard prechant', krutenau).
est_dans(krutenau, strasbourg). 
est_dans('quartier des pecheur', 'zone du Rhin').
est_dans('zone du Rhin', strasbourg).
est_dans('rue Oberweg', 'banlieue ouest strasbourgeoise').
est_dans( 'banlieue ouest strasbourgeoise', strasbourg).
est_dans('rue Oberweg - Nancy', 'quartier de l hopital').
est_dans('quartier de l hopital', nancy).
est_dans('rue des bourgeois', 'quartier des bourgeois').
est_dans('quartier des bourgeois', colmar).
est_dans('rue des maçons', mulhouse).
est_dans(premier, paris).
est_dans('Ile de la Cité', premier).
est_dans('rue des Pyrénées', toulouse).

est_dans_ville(X,Y):-
    (habite(X,_,Y);(habite(X,_,A),est_dans(A,Y))),ville(Y,_).

etu_Grand_Est(X):-est_dans_ville(X,Y),ville(Y,'Grand Est').

meme_ville(X,Y):-est_dans_ville(X,Z),est_dans_ville(Y,Z).

meme_region(X,Y):- est_dans_ville(X,Z),est_dans_ville(Y,P),ville(P,S),ville(Z,S).


longeur([], 0).
longeur([_|T], N) :- longeur(T, N1), N is N1+1.

elem([H|T],E):-longeur([H|T],N),N>0,(H is E;elem(T,E)).

trouv(_,[],_) :-fail,!.

trouv(X,[X|_],1).
trouv(X,[_|T],P):-trouv(X,T,P1),P is P1+1.

con([],L1,L1).
con([H|T],L2,[H|T2]):-con(T,L2,T2).


plat([],[]).
plat(X,[X]) :- \+ is_list(X).
plat([X|Y],Z) :- plat(X,X2), plat(Y,Y2), con(X2,Y2,Z).