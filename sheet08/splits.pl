:- module(splits, [splits/2]).

% True if L is a concatenation of Front and Back.
% Will generate all splits through re-evaluation.
splits(L, (Front, Back)) :- append(Front, Back, L).
