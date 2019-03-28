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
canMeet(X, Y):- knows(X, Z), canMeet(Z, Y).

