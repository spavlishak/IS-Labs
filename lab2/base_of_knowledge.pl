woman(yulia_arno).
woman(kate_arno).
woman(olga_arno).
woman(lilia_arno).
woman(maria_dikht).
woman(slava_morzh).
woman(matilda_cisek).
woman(sara_morzh).

man(oleksandr_arno).
man(oleg_arno).
man(stepan_arno).
man(arnold_dikht).
man(viktor_arno).
man(oleg_morzh).
man(valerii_morzh).
man(vasul_cisek).
man(kyrylo_morzh).

mother(kate_arno, yulia_arno).
mother(kate_arno, oleksandr_arno).
mother(olga_arno, oleg_arno).
mother(olga_arno, stepan_arno).
mother(olga_arno, lilia_arno).
mother(maria_dikht, kate_arno).
mother(slava_morzh, oleg_morzh).
mother(matilda_cisek, slava_morzh).
mother(sara_morzh, valerii_morzh).

father(oleg_arno, yulia_arno).
father(oleg_arno, oleksandr_arno).
father(viktor_arno, oleg_arno).
father(viktor_arno, stepan_arno).
father(viktor_arno, lilia_arno).
father(arnold_dikht, kate_arno).
father(valerii_morzh, oleg_morzh).
father(vasul_cisek, slava_morzh).
father(kyrylo_morzh, valerii_morzh).

is_grandfather(X, Y):-father(X,Z), mother(Z,Y).
is_grandfather(X, Y):-father(X,Z), father(Z,Y).

is_grandmother(X, Y):-mother(X,Z), father(Z,Y).
is_grandmother(X, Y):-mother(X,Z), mother(Z,Y).

child_of_parents(X, Y, Z):-mother(X, Z), father(Y, Z).
child_of_parents(X, Y, Z):-mother(Y, Z), father(X, Z).

who_grandfather(X, Y):-father(Z, X), father(Y, Z).
who_grandfather(X, Y):-mother(Z, X), father(Y, Z).

who_grandmother(X, Y):- father(Z, X), mother(Y, Z).
who_grandmother(X, Y):- mother(Z, X), mother(Y, Z).

brother(X, Y):-father(Z, X), father(Z, Y), mother(M, X), mother(M, Y), man(Y), not(X = Y).
sister(X, Y):-father(Z, X), father(Z, Y), mother(M, X), mother(M, Y), woman(Y), not(X = Y).

bro_or_sis(X, Y):-brother(X,Y); sister(X,Y).