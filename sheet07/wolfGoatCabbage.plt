:- begin_tests(wolfGoatCabbage).
:- use_module(wolfGoatCabbage, [location/1, allowed/1]).

% there are exactly two locations
test(location) :- findall(L, location(L), Ls), length(Ls, 2).

% there are exactly 12 allowed situation
test(allowed1) :- not(allowed((left, right, left, right))).
test(allowed2) :- allowed((left, left, right, right)).
test(allowed3) :- not(allowed((what, is, happening, here))).

:- end_tests(wolfGoatCabbage).