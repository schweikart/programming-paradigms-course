:- begin_tests(fourColors).
:- use_module(fourColors, [ color3/1, neighbor3/2, germany3/8,
                            color4/1, neighbor4/2, germany4/8]).

% there must be exactly four colors
test(color4) :- findall(C, color4(C), Cs), length(Cs, 4).

% there must be exactly 3 * 4 = 12 neighbor relationships
test(neighbor4) :- findall((A,B), neighbor4(A, B), Ns), length(Ns, 12).

% no neighbor relationship should contain the same color twice
test(neighbor4) :- findall(A, neighbor4(A, A), Ns), length(Ns, 0).

% TODO: test if all neighbor relationships use color atoms only

% there should be exactly 768 ways to color the german phone prefix map using
% four colors
test(germany4) :-
    findall((R02,R03,R04,R05,R06,R07,R08,R09), germany4(R02,R03,R04,R05,R06,R07,R08,R09), ColorMaps),
    length(ColorMaps, 768).

% there must be exactly three colors
test(color3) :- findall(C, color3(C), Cs), length(Cs, 3).

% there must be exactly 2 * 3 = 6 neighbor relationships
test(neighbor3) :- findall((A,B), neighbor3(A, B), Ns), length(Ns, 6).

% no neighbor relationship should contain the same color twice
test(neighbor3) :- findall(A, neighbor3(A, A), Ns), length(Ns, 0).

% TODO: test if all neighbor relationships use color atoms only

% there should be exactly 6 ways to color the german phone prefix map using
% three colors
test(germany3) :-
    findall((R02,R03,R04,R05,R06,R07,R08,R09), germany3(R02,R03,R04,R05,R06,R07,R08,R09), ColorMaps),
    length(ColorMaps, 6).

:- end_tests(fourColors).
