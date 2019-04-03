% prvek -- member
prvek(X, [X|_]).
prvek(X, [_|T]):- prvek(X,T).

% Pocet prvku -- length
pocet([], 0).
pocet([H|T], N):- pocet(T,N1), N is N1 + 1.

% sudost
sude([], []).
sude([H|L1], [H|L2]):- 0 is H mod 2, sude(L1,L2).
sude([H|L1], L2):- 1 is H mod 2, sude(L1,L2).

% odd pos
liche_p([], []).
liche_p([X], [X]).
liche_p([H1,H2|L1], [H1|L2]):- liche_p(L1,L2).

% diff
diff([], _, []).
diff([H|L1], L2, L3):- member(H,L2), diff(L1,L2,L3).
diff([H|L1], L2, [H|L3]):- not(member(H,L2)), diff(L1,L2,L3).

% graph
h(a, b, 1).
h(b, c, 2).
h(c, d, 3).
h(a, e, 3).
h(e, d, 4).

path(X, Y, C, []):- h(X, Y, C).
path(X, Y, C, [Z|P]):- h(X, Z, C1), path(Z, Y, C2, P), C is C1 + C2.

% tetris
% 3x3
%
% x   xxx   x   xx   x   xx
% x         xx   x  xx   x
% x
%
% index bottom left from [1,1]
%

p([1,1]).
p([2,1]).
p([3,1]).
p([1,2]).
p([2,2]).
p([3,2]).
p([1,3]).
p([2,3]).
p([3,3]).

o(1, [X, Y], [X, Y1], [X, Y2]):-
    Y1 is Y+1,
    Y2 is Y+2.

o(2, [X, Y], [X1, Y], [X2, Y]):-
    X1 is X+1,
    X2 is X+2.

o(3, [X, Y], [X, Y1], [X1, Y]):-
    X1 is X+1,
    Y1 is Y+1.

o(4, [X, Y], [X1, Y], [X1, Y0]):-
    X1 is X+1,
    Y0 is Y-1.

o(5, [X, Y], [X1, Y], [X1, Y1]):-
    X1 is X+1,
    Y1 is Y+1.

o(6, [X, Y], [X, Y1], [X1, Y1]):-
    X1 is X+1,
    Y1 is Y+1.

arrange(V):- 
    findall(X, p(X), S), 
    fill(S, V),
    vypis(V).

fill([], []).
fill(S, [[Jm, S1, S2, S3] | V]):- 
    member(S1, S), 
    o(Jm, S1, S2, S3), 
    member(S2, S), 
    member(S3, S),
    diff(S, [S1, S2, S3], SN),
    fill(SN, V).

vypis([]).

vypis([H|T]):- nl, write(H), vypis(T).
