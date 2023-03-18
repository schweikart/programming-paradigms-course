:- module(change, [remove/3]).

% In the following, "Coins" shall be a list of tuples (CoinValue, CoinAmount)

% signature: remove(Coins, C, R) where C shall be the value of the coin to
% remove and R shall be the coin list after the removal.
remove([(C, CoinAmount)|OtherCoins], C, [(C, DecreasedCoinAmount)|OtherCoins]) :-
    CoinAmount > 0, DecreasedCoinAmount is CoinAmount - 1.
remove([(NotC, CoinAmount)|OtherCoins], C, [(NotC, CoinAmount)|RemovedOtherCoins]) :-
    remove(OtherCoins, C, RemovedOtherCoins).
