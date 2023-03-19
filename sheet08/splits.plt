:- begin_tests(splits).
:- use_module(splits, [splits/2]).

test(splits) :-
    findall(Split, splits([1,2,3], Split), Splits),
    Splits == [([], [1,2,3]), ([1], [2,3]), ([1,2], [3]), ([1,2,3], [])].

:- end_tests(splits).
