:- module(wolfGoatCabbage, [location/1, allowed/1, ride/3]).

% define allowed locations
location(left).
location(right).

other(left, right).
other(right, left).

check(SameLoc, SameLoc, SameLoc).
check(_, Danger1, Danger2) :- other(Danger1, Danger2).

% signature: allowed((Man, Goat, Wolf, Cabbage))
allowed((Man, Goat, Wolf, Cabbage)) :-
    location(Man),
    location(Goat),
    location(Wolf),
    location(Cabbage),
    check(Man, Goat, Wolf),
    check(Man, Goat, Cabbage).

% signature: ride(S1, F, S2) :- 
ride((M, G, W, C), empty, (NewM, G, W, C)) :-
    other(M, NewM).
ride((MG, MG, W, C), goat, (NewMG, NewMG, W, C)) :-
    other(MG, NewMG).
ride((MW, G, MW, C), wolf, (NewMW, G, NewMW, C)) :-
    other(MW, NewMW).
ride((MC, G, W, MC), cabbage, (NewMC, G, W, NewMC)) :-
    other(MC, NewMC).
