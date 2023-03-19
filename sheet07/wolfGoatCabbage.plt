:- begin_tests(wolfGoatCabbage).
:- use_module(wolfGoatCabbage, [location/1, allowed/1, ride/3, solution/1]).

% there are exactly two locations
test(location) :- findall(L, location(L), Ls), length(Ls, 2).

% there are exactly 12 allowed situation
test(allowed1) :- not(allowed((left, right, left, right))).
test(allowed2) :- allowed((left, left, right, right)).
test(allowed3) :- not(allowed((what, is, happening, here))).

test(ride) :-
    findall((What, Next), ride((left, left, left, left), What, Next), Nexts),
    Nexts == [
        (empty, (right, left, left, left)),
        (goat, (right, right, left, left)),
        (wolf, (right, left, right, left)),
        (cabbage, (right, left, left, right))
    ].

test(solution) :-
    findall(Rides, solution(Rides), RidesList),
    member([goat, empty, wolf, goat, cabbage, empty, goat], RidesList).

:- end_tests(wolfGoatCabbage).