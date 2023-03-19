:- module(regex, [matches/2]).

% empty term
matches(eps, []) :- !. % cut as epsilon is an atom but not a symbol!

% single characters
matches(X, [X]) :- atom(X), X \= eps, !.

% union of two regular expressions
matches(cup(X,_), Word) :- matches(X, Word).
matches(cup(_,Y), Word) :- matches(Y, Word).

% concatenation of two regular expressions
matches(dot(X,Y), Word) :-
    append(WordX, WordY, Word),
    matches(X, WordX),
    matches(Y, WordY),
    !.

% closure of a regular expression
matches(star(_), []) :- matches(eps, []), !.
matches(star(X), Word) :-
    Word \= [],
    matches(dot(X, star(X)), Word).
