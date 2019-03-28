% People
person(peter).
person(senne).
person(draxis).
person(alice).

% Pairs
knows(peter, draxis).
knows(draxis, peter).
knows(alice, draxis).
knows(draxis, alice).

% canMeet
canMeet(X, Y):- knows(X, Y).

% This will recurse forever if X
% cannot meet Y
canMeet(X, Y):- knows(X, Z), canMeet(Z, Y).

