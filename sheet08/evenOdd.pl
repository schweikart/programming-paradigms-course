:- module(evenOdd, [evenT/1, oddT/1, evenG/1, oddG/1]).

% tester for even natural numbers
evenT(0).
evenT(X) :- X > 0, X1 is X - 1, oddT(X1).

% tester for odd natural numbers
oddT(1).
oddT(X) :- X > 1, X1 is X - 1, evenT(X1).

% generator for even natural numbers
evenG(0).
evenG(X) :- oddG(X1), X is X1 + 1.

% generator for odd natural numbers
oddG(1).
oddG(X) :- evenG(X1), X is X1 + 1, X > 1.
