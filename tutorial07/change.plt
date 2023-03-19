:- begin_tests(change).
:- use_module(change, [remove/3, put/3]).

% test remove
test(remove) :-
    findall((C,R), remove([(50,2), (20,2), (10,1), (5,3)], C, R), CRs),
    CRs == [
        (50, [(50,1), (20,2), (10,1), (5,3)]),
        (20, [(50,2), (20,1), (10,1), (5,3)]),
        (10, [(50,2), (20,2), (10,0), (5,3)]),
        (5, [(50,2), (20,2), (10,1), (5,2)])
    ].

% test put
test(put) :-
    findall(N, put([(50,2), (20,2), (10,1), (5,3)], 50, N), Ns),
    Ns == [
        [(50,3), (20,2), (10,1), (5,3)]
    ].

test(put) :-
    findall(N, put([(50,2), (20,2), (10,1), (5,3)], 20, N), Ns),
    Ns == [
        [(50,2), (20,3), (10,1), (5,3)]
    ].

test(put) :-
    findall(N, put([(50,2), (20,2), (10,1), (5,3)], 10, N), Ns),
    Ns == [
        [(50,2), (20,2), (10,2), (5,3)]
    ].

test(put) :-
    findall(N, put([(50,2), (20,2), (10,1), (5,3)], 5, N), Ns),
    Ns == [
        [(50,2), (20,2), (10,1), (5,4)]
    ].

test(put) :-
    findall(N, put([(50,2), (20,2), (10,1), (5,3)], 2, N), Ns),
    Ns == [
        [(50,2), (20,2), (10,1), (5,3), (2,1)]
    ].

% change 
test(change) :-
    findall(Change, change(100, [(50,2), (20,2), (10,1), (5,3)], Change), ChangeSets),
    member([(50,2)], ChangeSets),
    member([(50,1),(20,2),(10,1)], ChangeSets),
    member([(50,1),(20,2),(5,2)], ChangeSets).

:- end_tests(change).
