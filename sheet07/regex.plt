:- begin_tests(regex).
:- use_module(regex, [matches/2]).

test(matches1) :- matches(star(dot(a,dot(b,c))),[a,b,c]).
test(matches2) :- matches(star(dot(a,dot(b,c))),[]).
test(matches3) :- not(matches(star(dot(a,dot(b,c))),[a,b,c,d])).
test(matches4) :- matches(star(dot(a,dot(b,c))),[a,b,c,a,b,c]).

:- end_tests(regex).
