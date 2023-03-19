:- module(fourColors, [color/1, neighbor/2, germany/8]).

% define exactly four colors
color(blue).
color(green).
color(yellow).
color(red).

% define which colors are different to each other
neighbor(blue, green).
neighbor(blue, yellow).
neighbor(blue, red).

neighbor(green, blue).
neighbor(green, yellow).
neighbor(green, red).

neighbor(yellow, blue).
neighbor(yellow, green).
neighbor(yellow, red).

neighbor(red, blue).
neighbor(red, green).
neighbor(red, yellow).

% define the topology of the german map, according to phone prefixes
germany(R02, R03, R04, R05, R06, R07, R08, R09) :-
    neighbor(R02, R05),
    neighbor(R02, R06),
    
    neighbor(R03, R04),
    neighbor(R03, R05),
    neighbor(R03, R06),
    neighbor(R03, R09),

    neighbor(R04, R03),
    neighbor(R04, R05),

    neighbor(R05, R02),
    neighbor(R05, R03),
    neighbor(R05, R04),
    neighbor(R05, R06),

    neighbor(R06, R02),
    neighbor(R06, R03),
    neighbor(R06, R05),
    neighbor(R06, R07),
    neighbor(R06, R09),

    neighbor(R07, R06),
    neighbor(R07, R08),
    neighbor(R07, R09),

    neighbor(R08, R07),
    neighbor(R08, R09),
    
    neighbor(R09, R03),
    neighbor(R09, R06),
    neighbor(R09, R07),
    neighbor(R09, R08).
