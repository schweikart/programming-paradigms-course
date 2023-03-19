:- module(change, [remove/3, put/3]).

% In the following, "Coins" shall be a list of tuples (CoinValue, CoinAmount)

% signature: remove(Coins, C, R) where C shall be the value of the coin to
% remove and R shall be the coin list after the removal.
remove([(C, CoinAmount)|OtherCoins], C, [(C, DecreasedCoinAmount)|OtherCoins]) :-
    CoinAmount > 0, DecreasedCoinAmount is CoinAmount - 1.
remove([(NotC, CoinAmount)|OtherCoins], C, [(NotC, CoinAmount)|RemovedOtherCoins]) :-
    remove(OtherCoins, C, RemovedOtherCoins).

% signature: put(Coins, C, Cnew) where C shall be the value of the coin to
% insert into Coins, creating Cnew.
put([(C, CoinAmount)|OtherCoins], C, [(C, IncreasedCoinAmount)|OtherCoins]) :-
    IncreasedCoinAmount is CoinAmount + 1, !.
% without this cut, this would yield a choice point that allows inserting at the end too!
put([(NotC, CoinAmount)|OtherCoins], C, [(NotC, CoinAmount)|NewOtherCoins]) :-
    put(OtherCoins, C, NewOtherCoins).
put([], C, [(C, 1)]).

% signature: change(X, Av, Change) finds a coin combinations (Change) from
% the available coins (Av) that sum up to X.
change(0, _, []).
change(X, Av, Change) :-
    remove(Av, C, NewAv),
    X >= C,
    NewX is X - C,
    change(NewX, NewAv, NewChange),
    put(NewChange, C, Change).
