:- begin_tests(fourColors).
:- use_module(fourColors, [color/1, neighbor/2, germany/8]).

% there must be exactly four colors
test(color) :- findall(C, color(C), Cs), length(Cs, 4).

% there must be exactly 3 * 4 = 12 neighbor relationships
test(neighbor) :- findall((A,B), neighbor(A, B), Ns), length(Ns, 12).

% no neighbor relationship should contain the same color twice
test(neighbor) :- findall(A, neighbor(A, A), Ns), length(Ns, 0).

% TODO: test if all neighbor relationships use color atoms only

% there should be exactly 768 ways to color the german phone prefix map using
% four colors
test(germany) :-
    findall((R02,R03,R04,R05,R06,R07,R08,R09), germany(R02,R03,R04,R05,R06,R07,R08,R09), ColorMaps),
    length(ColorMaps, 768).

:- end_tests(fourColors).
