:- module(fourColors, [ color3/1, neighbor3/2, germany3/8,
                        color4/1, neighbor4/2, germany4/8]).

% define exactly four colors
color4(blue).
color4(green).
color4(yellow).
color4(red).

% define which colors are different to each other
neighbor4(blue, green).
neighbor4(blue, yellow).
neighbor4(blue, red).

neighbor4(green, blue).
neighbor4(green, yellow).
neighbor4(green, red).

neighbor4(yellow, blue).
neighbor4(yellow, green).
neighbor4(yellow, red).

neighbor4(red, blue).
neighbor4(red, green).
neighbor4(red, yellow).

% define the topology of the german map, according to phone prefixes
germany4(R02, R03, R04, R05, R06, R07, R08, R09) :-
    neighbor4(R02, R05),
    neighbor4(R02, R06),
    
    neighbor4(R03, R04),
    neighbor4(R03, R05),
    neighbor4(R03, R06),
    neighbor4(R03, R09),

    neighbor4(R04, R03),
    neighbor4(R04, R05),

    neighbor4(R05, R02),
    neighbor4(R05, R03),
    neighbor4(R05, R04),
    neighbor4(R05, R06),

    neighbor4(R06, R02),
    neighbor4(R06, R03),
    neighbor4(R06, R05),
    neighbor4(R06, R07),
    neighbor4(R06, R09),

    neighbor4(R07, R06),
    neighbor4(R07, R08),
    neighbor4(R07, R09),

    neighbor4(R08, R07),
    neighbor4(R08, R09),
    
    neighbor4(R09, R03),
    neighbor4(R09, R06),
    neighbor4(R09, R07),
    neighbor4(R09, R08).

% define exactly three colors
color3(blue).
color3(green).
color3(yellow).

% define which colors are different to each other
neighbor3(blue, green).
neighbor3(blue, yellow).

neighbor3(green, blue).
neighbor3(green, yellow).

neighbor3(yellow, blue).
neighbor3(yellow, green).

% define the topology of the german map, according to phone prefixes
germany3(R02, R03, R04, R05, R06, R07, R08, R09) :-
    neighbor3(R02, R05),
    neighbor3(R02, R06),
    
    neighbor3(R03, R04),
    neighbor3(R03, R05),
    neighbor3(R03, R06),
    neighbor3(R03, R09),

    neighbor3(R04, R03),
    neighbor3(R04, R05),

    neighbor3(R05, R02),
    neighbor3(R05, R03),
    neighbor3(R05, R04),
    neighbor3(R05, R06),

    neighbor3(R06, R02),
    neighbor3(R06, R03),
    neighbor3(R06, R05),
    neighbor3(R06, R07),
    neighbor3(R06, R09),

    neighbor3(R07, R06),
    neighbor3(R07, R08),
    neighbor3(R07, R09),

    neighbor3(R08, R07),
    neighbor3(R08, R09),
    
    neighbor3(R09, R03),
    neighbor3(R09, R06),
    neighbor3(R09, R07),
    neighbor3(R09, R08).
