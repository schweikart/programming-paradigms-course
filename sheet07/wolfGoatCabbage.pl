:- module(wolfGoatCabbage, [location/1, allowed/1]).

% define allowed locations
location(left).
location(right).

% signature: allowed((Man, Goat, Wolf, Cabbage))
allowed((Man, Goat, Wolf, Cabbage)) :-
    location(Man),
    location(Goat),
    location(Wolf),
    location(Cabbage),
    ((Wolf \= Goat, !) ; (Man = Wolf, !)),
    ((Goat \= Cabbage, !) ; (Man = Goat, !)).
